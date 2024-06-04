package com.sibertech.degr.inserter;

import com.sibertech.degr.DTO.AllData;
import com.sibertech.degr.DTO.Client;
import com.sibertech.degr.DTO.Product;
import com.sibertech.degr.DTO.Region;
import com.sibertech.degr.DTO.actuator.DtoActuator;
import com.sibertech.degr.db.ConfJDBC;
import com.sibertech.degr.db.DB;
import com.sibertech.degr.db.RDMS.RDMS;
import com.sibertech.degr.db.fill.BasketsFiller;
import com.sibertech.degr.db.fill.ClientsFiller;
import com.sibertech.degr.db.fill.LoyalityFiller;
import com.sibertech.degr.db.fill.MarketsFiller;
import com.sibertech.degr.db.fill.ProductsFiller;
import com.sibertech.degr.db.fill.RegionsFiller;
import com.sibertech.degr.db.fill.TerminalsFiller;
import com.sibertech.degr.utils.LOG;
import java.sql.SQLException;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class SqlDbOper   extends DB{
    
    protected LOG timeLogger = null;
    protected AllData aData = null;
    protected String saleTableName = null;
    protected String dictionaryTableName = null;    
    
    protected Logger logback = LoggerFactory.getLogger(SqlDbOper.class);    
    protected DtoActuator actuator = new DtoActuator();    
    
    protected long startTimeForAllRecords = 0L; 
    protected long endTimeForAllRecords = 0L;     
    protected long startTimeInterval_forInsert = 0L; //System.currentTimeMillis();
    protected long endTimeInterval_forInsert = 0L; //System.currentTimeMillis();   
    protected int countOfInsertedLinesIntoSales = 0;
    // ==========================================================================
    
    
    protected String dbName = null;
    protected RDMS   rdmsNode = null;    
    
    public void init(AllData aData, RDMS rdmsNode, String dbName, String saleTableName, String dictionaryTableName, LOG log) {
        
        this.timeLogger = log;
        
        this.aData = aData;
        this.dbName = dbName;
        this.rdmsNode = rdmsNode;
        this.saleTableName = saleTableName;
        this.dictionaryTableName = dictionaryTableName; 
        
        logback.info(String.format("%s Инициирован экземпляр класса SqlDbOper для вставки в БД %s", ConfJDBC.LOG_PEFIX, this.dbName));
    }    
    
    public String doPrepareTableStuff () throws SQLException, ClassNotFoundException, Exception {
        
        String connURL = ConfJDBC.BASE_DATABASE_URL + dbName;        
        this.init(connURL, ConfJDBC.POSTGRES_DB_USER, ConfJDBC.POSTGRES_DB_PASSWORD); 
                 
            String ret = makePrepareTableStuff ();
            
        this.close();                  
        return ret;
    }
    
    public String doEasySales () throws SQLException, ClassNotFoundException, Exception {
        
        String connURL = ConfJDBC.BASE_DATABASE_URL + dbName;        
        this.init(connURL, ConfJDBC.POSTGRES_DB_USER, ConfJDBC.POSTGRES_DB_PASSWORD); 
                 
            boolean forSale = false; // false - тут только быстрая вставка, без отягощающих селектов
            String ret = makeInsert (forSale);
            
        this.close();                  
        return ret;
    }
    
     public String doHardSales () throws SQLException, ClassNotFoundException, Exception {
        
        String connURL = ConfJDBC.BASE_DATABASE_URL + dbName;        
        this.init(connURL, ConfJDBC.POSTGRES_DB_USER, ConfJDBC.POSTGRES_DB_PASSWORD); 
                 
            boolean forSale = true; // true - тут иммитируем продажу с "тяжелыми запросами"
            String ret = makeInsert (forSale);
            
        this.close();                  
        return ret;
    }
    
    protected String makeInsert (boolean forSale) throws SQLException, ClassNotFoundException {
        
        String ret = "SqlDbOper::makeInsert () :: не инициировано";                
        Map<Integer, Region>  regionsMap = aData.getRegionsByNodeName (this.rdmsNode.getNodeName());
               
        try {            
                BasketsFiller   baskFill = new BasketsFiller  (this.conn);  

                baskFill.init(aData, rdmsNode, dbName, saleTableName, dictionaryTableName, timeLogger);
                baskFill.insert (regionsMap, forSale);
                ret = String.format("Вставка в БД %s таблицы sales и dictionary завершена", this.dbName);
        }
        catch (Exception exc) {
            ret = String.format("Вставка в БД %s таблицы sales и dictionary c ИСКЛЮЧЕНИЕМ: %s", this.dbName, exc.getMessage());
        }
            
        return ret;
    }
     
    protected String makePrepareTableStuff () throws SQLException, ClassNotFoundException {
        
        String ret = "SqlDbOper::makePrepareTableStuff () :: не инициировано";
                
        Map<Integer, Client>  clientMap = aData.getClients();
        Map<Integer, Product> productMap = aData.getProducts(); 
        
        Map<Integer, Region>  regionsMap = aData.getRegionsByNodeName (this.rdmsNode.getNodeName());
               
        try {
            LoyalityFiller  loyaFill = new LoyalityFiller (this.conn);
            RegionsFiller   regiFill = new RegionsFiller  (this.conn);
            ProductsFiller  prodFill = new ProductsFiller (this.conn);
            ClientsFiller   clieFill = new ClientsFiller  (this.conn);
            MarketsFiller   markFill = new MarketsFiller  (this.conn);
            TerminalsFiller termFill = new TerminalsFiller(this.conn);

                loyaFill.insert (regionsMap,  this.dbName);
                regiFill.insert (regionsMap,  this.dbName);
                prodFill.insert (productMap,  this.dbName);
                clieFill.insert (clientMap,   this.dbName);
                markFill.insert (regionsMap,  this.dbName);
                termFill.insert (regionsMap,  this.dbName);
                
                ret = String.format("Инициализация БД %s завершена (ВСЕ ТАБЛИЦЫ КРОМЕ sales и dictionary)", this.dbName);
        }
        catch (Exception exc) {
            ret = String.format("Инициализация БД %s завершена c ИСКЛЮЧЕНИЕМ: %s", this.dbName, exc.getMessage());
        }            
        return ret;
    }
}
