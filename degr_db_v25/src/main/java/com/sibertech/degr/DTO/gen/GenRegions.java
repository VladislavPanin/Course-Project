package com.sibertech.degr.DTO.gen;

import com.sibertech.degr.DTO.*;
import com.sibertech.degr.db.ConfJDBC;
import java.util.Map;
import java.util.Random;
import com.sibertech.degr.db.Conf;
import com.sibertech.degr.db.RDMS.RDMS;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class GenRegions {
    
    protected AllData dSet = null;
    Logger logGen = LoggerFactory.getLogger(GenRegions.class);
    
    int clientCount = -1;
    int clientCountOnRegion = -1; 
    
    public Region createRegion (RDMS node, Map<Integer, Client>  clients, Map<Integer, Product> products) {
        
        clientCount = clients.size();
        clientCountOnRegion = clientCount / RDMS.getShardCount(); 
                    
        int iTerminal = -1;
        int iMarket = -1;
        int iBasket = -1;                       
        
        int iRegion = node.getIdx(); 
        String sRegion = node.getNodeName();                         
        Region createdRegion = new Region(iRegion, sRegion);// Здесь id региона связывается с конкретнм RDMS, id региона равен RDMS.idx, нумерация регионов с 1.         

        try {
            printStartRegion (sRegion);
                for (iMarket = 1; iMarket <= Conf.MARKET_COUNT_IN_REGION; iMarket++) {
                    Market mark = new Market(iMarket, iRegion, "магазин номер " + iMarket);
                    for (iTerminal = 1; iTerminal <= Conf.TERMINAL_COUNT_IN_MARKET; iTerminal++) {
                        Terminal term = new Terminal(iTerminal, iRegion, iMarket);
                        for (iBasket = 1; iBasket < Conf.COUNT_OF_BASKET_ON_TERMINAL_FOR_GENERATOR+1; iBasket++) {
                            ProductBasket basket = new ProductBasket();
                            fillBasket(products, clients, basket, term, iTerminal, iMarket, iRegion, iBasket);
                            term.addProductBasket(basket);
                        }
                        mark.addTerminal(term);
                    }
                    createdRegion.addMarket(mark);
                }            
        }
        catch (Exception exc) {
            logGen.warn(String.format("%s iRegion= %d  iMarket= %d  iTerminal= %d iBasket= %d", ConfJDBC.LOG_PEFIX_EXCEPT, iRegion, iMarket, iTerminal, iBasket));                    
            logGen.warn(String.format("%s %s() -> %s", ConfJDBC.LOG_PEFIX_EXCEPT, "create", exc.getMessage()));                    
        }
        
        return createdRegion;
    }

    public void fillBasket (Map<Integer, Product>  products, 
                            Map<Integer, Client>   clients,                             
                            ProductBasket          basket, 
                            Terminal               terminal,                            
                            int iTerminal, 
                            int iMarket, 
                            int iRegion, 
                            int iBasket) {
        
        int basket_price = 0;
        try {
            int terminal_basket_number = terminal.getTerminalBasketNumber();        
            Client client = this.getClientFromRegion(iRegion, clients);        

            basket.setClient_id(client.getClient_id());
            basket.setTerminal_id(iTerminal);
            basket.setTerminal_basket_number(terminal_basket_number);
            basket.setRegion_id(iRegion);
            basket.setMarket_id(iMarket);

            fillBasketWithProduct(basket, products);

            basket_price = 0;
            int basketSize = basket.getBasket().size();
            Map<Integer, Product> mapProduct = basket.getBasket();
            Product prod;
            
            for(int i = 1; i <= basketSize; i++) {
                try {
                    prod = mapProduct.get(i);
                    basket_price =+ prod.getCost();
                }
                catch (Exception exc){
                    logGen.warn(String.format("%s iRegion= %d  iMarket= %d  iTerminal= %d iBasket= %d", ConfJDBC.LOG_PEFIX_EXCEPT, iRegion, iMarket, iTerminal, iBasket));
                    logGen.warn(String.format("%s %s() -> %s", ConfJDBC.LOG_PEFIX_EXCEPT, "fillBasket(1)", exc.getMessage()));                    
                }
            }
        }   
        catch (Exception exc) {
            logGen.warn(String.format("%s iRegion= %d  iMarket= %d  iTerminal= %d iBasket= %d", ConfJDBC.LOG_PEFIX_EXCEPT, iRegion, iMarket, iTerminal, iBasket));
            logGen.warn(String.format("%s %s() -> %s", ConfJDBC.LOG_PEFIX_EXCEPT, "fillBasket(2)", exc.getMessage()));                    
        }
        basket.setBasket_price(basket_price);
        //java.sql.Timestamp saleTimestamp = null;//Это поле будет использоваться при инсерте в таблицу. При начальной инициализации/генерации это поле не используется
        //java.sql.Date saleDate = null; //Это поле будет использоваться при инсерте в таблицу. При начальной инициализации/генерации это поле не используется
    }

    public void fillBasketWithProduct(ProductBasket basket, Map<Integer, Product> mapProducts){

        Random random = new Random();        
        Product product;

        for (int iProduct = 1; iProduct <= Conf.COUNT_PRODUCTS_ON_BASKET; iProduct++){
            
            int randomProductId = random.nextInt(Conf.PRODUCT_COUNT_ON_STORE);
            randomProductId = randomProductId == 0 ? 1 : randomProductId;
            product = mapProducts.get(randomProductId);
            int randomQuantityOfProduct = random.nextInt(Conf.COUNT_PRODUCT_PIECES_ON_BASKET) + 1;
            
            product.setCountOfProduct(randomQuantityOfProduct);
            basket.addProduct(product);
        }
    }
    
    public Client getClientFromRegion (int iRegion, Map<Integer, Client>  clients) throws Exception {
        
        double rand = Math.random();
        int iClient = (iRegion - 1)*clientCountOnRegion + (int) (rand * clientCountOnRegion);
        
        if (iClient > clientCount)
            iClient = clientCount;
        else if (iClient < 1)
            iClient = 1;
        
        Client client = clients.get(iClient); 
        if (client == null) {
            throw new Exception ("getClientFromRegion (int iRegion) вернул null!!");
        }
        return client;
    } 
    
    protected void printStartRegion (String sRegion) {        
        logGen.warn(String.format("%s Генерация корзин продуктов (чеков) для региона %s начата", ConfJDBC.LOG_PEFIX, sRegion));
        
    }
}
