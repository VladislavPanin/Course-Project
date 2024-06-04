package com.sibertech.degr.db.fill;

import com.sibertech.degr.DTO.actuator.DtoActuator;
import com.sibertech.degr.DTO.*;
import com.sibertech.degr.db.ConfJDBC;
import com.sibertech.degr.db.Conf;
import com.sibertech.degr.db.RDMS.RDMS;
import com.sibertech.degr.utils.LOG;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;


public class BasketsFiller  extends BaseFiller {
    
    protected LOG timeLogger = null;
    protected AllData aData = null;
    protected String saleTableName = null;
    protected String dictionaryTableName = null;    
    
    int insertStepCounter = -1; // устанавливается в методе insert()
    
    protected DtoActuator actuator = null;        
    protected Connection conn = null;     
    
    protected String dbName = null;
    protected RDMS   shardNode = null;   
    // ------------------------------------------
    
    public BasketsFiller (Connection conn) {
        super();
        this. conn = conn;
    }
    
    public void init(AllData aData, RDMS shardNode, String dbName, String saleTableName, String dictionaryTableName, LOG log) {
        
        this.timeLogger = log;
        
        this.aData = aData;
        this.dbName = dbName;
        this.shardNode = shardNode;
        this.saleTableName = saleTableName;
        this.dictionaryTableName = dictionaryTableName; 
        
        logback.info(String.format("%s Инициирован экземпляр класса BasketsFiller_Easy для вставки в БД %s", ConfJDBC.LOG_PEFIX, this.dbName));
    }
    
     public void insert (Map<Integer, Region>  regionsMap, boolean forSale) throws SQLException {         
    
        this.insertStepCounter = BaseFiller.getINSERT_STEP_COUNTER();
        
        this.printStart (this.saleTableName, dbName);        
        this.insert_sales (regionsMap, forSale);        
        this.printEnd (this.saleTableName, dbName, countOfInsertedLinesIntoSales);        
    }  
     //---------------------------------------------
    
    
    protected String insert_sales (Map<Integer, Region>  regionsMap, boolean forSales) {        
        
        countOfInsertedLinesIntoSales = 0;
        int countLimiter = BaseFiller.getBREAK_AFTER_COUNT();
        if (shardNode.isNodeShard())
            countLimiter = countLimiter / RDMS.getShardCount();
            
        
        Terminal terminal;
        ProductBasket basket;
        int iBasket = -1;
        int iTerminal = -1;
        int iMarket = -1;
        int iRegion = -1;
        int dateFlag = 1;
        
        try {        
            startTimeForAllRecords = System.currentTimeMillis();
            startTimeInterval_forInsert = System.currentTimeMillis();
            
            do{
                actuator = new DtoActuator();
                        
                for (iMarket = 1; iMarket <= Conf.MARKET_COUNT_IN_REGION; iMarket++) {
                    for (iTerminal = 1; iTerminal <= Conf.TERMINAL_COUNT_IN_MARKET; iTerminal++) {
                        for (Map.Entry<Integer, Region> entry : regionsMap.entrySet()) {

                                Region region = entry.getValue();
                                iRegion = region.getId();
                                        
                                terminal = getTerminal(regionsMap, iRegion, iMarket, iTerminal);
                                Map<Integer,ProductBasket> productBasketMap = terminal.getProductBasketMap();

                                int basketSize = productBasketMap.size();
                                for (iBasket = 1; iBasket <= basketSize; iBasket++) {
                                    if(dateFlag==100){
                                        dateFlag=1;
                                    }

                                    basket = productBasketMap.get(iBasket);
                                    if(!insertBasket_onLogger (basket, dateFlag++, countLimiter, forSales))
                                    {
                                        //return String.format("%s Инициализация БД %s закончена", ConfJDBC.LOG_PEFIX, dbName);                                        
                                        return String.format("Инициализация БД %s закончена успешно", dbName);
                                    }
                                }
                        }
                    }
                }
            }
            while(true);
        }
        catch(Exception exc){
            logback.warn(String.format("%s iRegion= %d  iMarket= %d  iTerminal= %d iBasket= %d", ConfJDBC.LOG_PEFIX_EXCEPT, iRegion, iMarket, iTerminal, iBasket));
            logback.warn(String.format("%s %s -> %s", ConfJDBC.LOG_PEFIX_EXCEPT, "BasketsFiller_Easy::insert()", exc.getMessage()));                    
        }            
        return String.format("Инициализация БД %s закончена с ошибками", dbName);
    }
    
    protected void doHard (ProductBasket basket)
    {
    }
    
    protected boolean insertBasket_onLogger (   ProductBasket basket, 
                                                int dateFlag, 
                                                int countLimiter, 
                                                boolean forSales) throws ClassNotFoundException, SQLException, IOException
    {
        boolean ret = true;
        long delta;
        try
        {
            actuator.updateBasket(basket);
            insertBasket_internal(basket);
            
            if(forSales) {
                doHard (basket);
            }
        } 
        catch (Exception exc) {
            logback.warn(String.format("%s %s -> %s", ConfJDBC.LOG_PEFIX_EXCEPT, "BasketsFiller_Easy::insertBasket_onLogger()", exc.getMessage()));                    
        } 
        finally
        {
            if (countOfInsertedLinesIntoSales % insertStepCounter == 0) {
                // количество продуктов в корзине должно быть кратно 10 - иначе сюда никогда не попадем

                // В UseDbStartSalesProvider мы прокручиваем весь сгенерированный список корзин для всех терминалов всех магазинов всех регионов.
                // Как только мы его прокрутили, например 1 миллион раз, UseDbStopSales сможет проверить флаг остановки (раньше не сможет)
                // Если мы хотим чтобы у нас поток вставки был прерван как можно быстрее, то вызывать метод stopSales надо вызывать здесь.
                endTimeInterval_forInsert = System.currentTimeMillis();
                delta = (endTimeInterval_forInsert - startTimeInterval_forInsert);
                startTimeInterval_forInsert = endTimeInterval_forInsert;
                
                timeLogger._log (countOfInsertedLinesIntoSales, delta); // вывод графика зависимости времени вставки строки от количества строк в таблице
            }
            
            if(countOfInsertedLinesIntoSales >= countLimiter) {
                ret = false;
            }
        }
        return ret;
    }
    
    public static final String INSERT_SALE = "INSERT INTO %s (order_number, line_number_in_order, region_id, market_id, terminal_id, product_id, count_of_product, price_of_one_piece, order_date, client_id, comment) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) RETURNING id;";
    protected void insertBasket_internal (ProductBasket prodBask) throws Exception {
        
        String sqlOper = String.format(INSERT_SALE, saleTableName);
        
        boolean isCatchHappened;
        int flag = 0;
        
        do { // цикл повторной вставки, если с первого раза вставить не удалось. Если удалось - будет return из цикла for 
            
            flag = flag++;
            //saleDb_HardSQL.insertBasket_before(conn, prodBask); //проверки до вставки в диктионари
            Integer order_number = getReturningOrder_number(prodBask); // INSERT_BASKET_KEY
            //saleDb_HardSQL.insertBasket_after(conn, prodBask);//проверки после вставки в диктионари

            if (order_number == -1) {
                throw new Exception("вставка в таблицу dictionary не была произведена");
            }

            Map<Integer, Product> mapBasket = prodBask.getBasket();
            String comment = "Стандартный комментарий для sale";
            int size = mapBasket.size();
            
            isCatchHappened = false; // если было исключение - сбрасываем значением значение isCatchHappened, и начинаем вставку в новом шаге цикла do {} while();
            
            for (int i = 1; i <= size; i++) {
                this.countOfInsertedLinesIntoSales++;

                Product product = mapBasket.get(i);

                try (PreparedStatement preparedStatement = conn.prepareStatement(sqlOper);) {
                    preparedStatement.setInt(1, order_number);
                    preparedStatement.setInt(2, i);
                    preparedStatement.setInt(3, prodBask.getRegion_id());
                    preparedStatement.setInt(4, prodBask.getMarket_id());
                    preparedStatement.setInt(5, prodBask.getTerminal_id());
                    preparedStatement.setInt(6, product.getId());
                    preparedStatement.setInt(7, product.getCountOfProduct());
                    preparedStatement.setInt(8, product.getCost());
                    preparedStatement.setDate(9, prodBask.getSaleDate());
                    preparedStatement.setInt(10, prodBask.getClient_id());
                    preparedStatement.setString(11, comment);

                    preparedStatement.execute();
                } 
                catch (SQLException exc) {
                    isCatchHappened = true;
                    logback.warn(String.format("%s *******   ошибка вставки(SQLException) в таблицу %s - будет повторная попытка вставки", ConfJDBC.LOG_PEFIX_ERR, saleTableName));
                    break;
                }                
            } //  цикл закончился
            
            if (!isCatchHappened)
                return; // исключения не было, прошел полный цикл вставки - можно завершить вставку и выйти из метода            
            
            // в противном случае продолжаем вставку бакета заново в цикле do {} while();
            if (flag >= 500000 || flag <= -1) 
                throw new Exception("Выход за дозволенные границы параметра flag = " + flag);
        }
        while(isCatchHappened);
    }

    public static final String INSERT_BASKET_KEY = "INSERT INTO %s (region_id, market_id, terminal_id, terminal_basket_number, basket_price, order_time, order_date, comment) VALUES (?, ?, ?, ?, ?, ?, ?, ?) RETURNING order_number;";
    protected Integer getReturningOrder_number(ProductBasket productBasket) throws Exception {
        
        String sqlOper = String.format(INSERT_BASKET_KEY, dictionaryTableName);
        int order_number = -1;
        try(PreparedStatement preparedStatement = conn.prepareStatement(sqlOper);) {

            preparedStatement.setInt      (1, productBasket.getRegion_id());
            preparedStatement.setInt      (2, productBasket.getMarket_id());
            preparedStatement.setInt      (3, productBasket.getTerminal_id());
            preparedStatement.setInt      (4, productBasket.getTerminal_basket_number());
            preparedStatement.setInt      (5, productBasket.getBasket_price());
            preparedStatement.setTimestamp(6, productBasket.getSaleTimestamp());
            preparedStatement.setDate     (7, productBasket.getSaleDate());
            preparedStatement.setString   (8, "запись о покупке");
            //ВСТАВКА НЕ БУДЕТ ВОСПРОИЗВЕДЕНА, ЕСЛИ УЖЕ ЕСТЬ ТАКАЯ ЖЕ ЗАПИСЬ
                try(ResultSet resultSet = preparedStatement.executeQuery();) {
                    if (resultSet.next()) {
                        order_number = resultSet.getInt(1);
                    }
                }
        }
        catch (Exception exc) {
            String msg = String.format("%s ошибка вставки в таблицу %30s :: %-20s. Запись не была вставлена. Исключение: %s", ConfJDBC.LOG_PEFIX_ERR, dbName, dictionaryTableName, exc.getMessage());
            logback.warn(msg);
            throw new Exception (msg);
        }
        return order_number;
    }
    
     protected Terminal getTerminal(Map<Integer, Region> regionsMap, int iRegion, int iMarket, int iTerminal){
        
        Terminal term = null;
        Market   mark;
        Region region;
        
        try {
            region = regionsMap.get(iRegion);
            Map<Integer, Market> markets = region.getMarkets_in_region();
            
            mark = markets.get(iMarket);
            Map<Integer,Terminal> terminals = mark.getTerminals_in_market();
            
            term = terminals.get(iTerminal);            
        }
        catch (Exception exc) {            
                logback.warn(String.format("%s iRegion= %d  iMarket= %d  iTerminal= %d", ConfJDBC.LOG_PEFIX_EXCEPT, iRegion, iMarket, iTerminal));
                logback.warn(String.format("%s %s -> %s", ConfJDBC.LOG_PEFIX_EXCEPT, "BasketsFiller_Easy::getTerminal()", exc.getMessage()));                    
        }
        return term;
    }
}
