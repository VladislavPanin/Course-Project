package com.sibertech.degr.DTO;

import com.sibertech.degr.db.RDMS.RDMS;
import java.util.Map;
import com.sibertech.degr.DTO.gen.GenClients;
import com.sibertech.degr.DTO.gen.GenProducts;
import com.sibertech.degr.DTO.gen.GenRegions;
import com.sibertech.degr.db.Conf;
import com.sibertech.degr.db.ConfJDBC;
import java.util.HashMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class AllData {
    
    Logger logback = LoggerFactory.getLogger(AllData.class);
    
    private Map<String,  Map<Integer, Region>>  regionsMapMap = new HashMap<>(); // набор регионов для каждого узла RDMS
    //Map<Integer, Region>  regionsMap = new HashMap<>();
    
    private Map<Integer, Client>   clients = null;
    private Map<Integer, Product>  products = null;
    
    private final GenRegions  genRegions  = new GenRegions();
    private final GenClients  genClients  = new GenClients();
    private final GenProducts genProducts = new GenProducts();
    
    long startGeneration = System.currentTimeMillis();
    
    public void generate () throws Exception {
       
        printStartGen ();     
                clients  = genClients.create();       
                products = genProducts.create();          
            
                // набор всех регионов для узла RDMS.Node_DB__FULL
                Map<Integer, Region>  regionsMap = new HashMap<>();
                for (RDMS node: RDMS.getShards()) {                    
                        // генерируем набор всех регионов для полной базы данных (эталон и parted)
                        int idx = node.getIdx();            
                        Region regn = genRegions.createRegion (node, getClients(), getProducts());   
                        
                        regionsMap.put(idx, regn);
                }                
                regionsMapMap.put(RDMS.Node_DB__FULL.getNodeName(), regionsMap);                
                
                // а теперь - для каждой шарды делаем свой регион
                for (RDMS node: RDMS.getShards()) {  
                    
                        regionsMap = new HashMap<>();                    
                        int idx = node.getIdx();            
                        Region regn = genRegions.createRegion (node, getClients(), getProducts());   
                        regionsMap.put(idx, regn);                
                        
                        regionsMapMap.put(node.getNodeName(), regionsMap);
                }                        
                
        printEnd (System.currentTimeMillis() - startGeneration);
    }    
    
    public Map<Integer, Region>  getRegionsByNodeName (String rdmsNodeName)
    {
        Map<Integer, Region>  regionsMap = regionsMapMap.get(rdmsNodeName);
        return regionsMap;
    }
    
    protected void printEnd (long deltaTime) {
        logback.warn(String.format("%s", ConfJDBC.LOG_SPLIT));
        logback.warn(String.format("%s Генерация корзин (чеков) завершена. Время генерации корзин равно %d миллисекунд", ConfJDBC.LOG_PEFIX, deltaTime));        
        logback.warn(String.format("%s ############################################################################################################################################ ", ConfJDBC.LOG_PEFIX));        
    }
     
    protected void printStartGen () {
        
        logback.warn(String.format("%s", ConfJDBC.LOG_SPLIT));
        logback.warn(String.format("%s Начата генерация корзин продуктов для генератора вставки", ConfJDBC.LOG_PEFIX));        
        logback.warn(String.format("%s Будет сгенерирована корзина для каждого региона (бд шард), и суммарный набор корзин регионов для полной базы данных ", ConfJDBC.LOG_PEFIX));
        logback.warn(String.format("%s     магазинов в каждом  регионе:        %7d ", ConfJDBC.LOG_PEFIX, Conf.MARKET_COUNT_IN_REGION));
        logback.warn(String.format("%s     терминалов в каждом магазинов:      %7d ", ConfJDBC.LOG_PEFIX, Conf.TERMINAL_COUNT_IN_MARKET));
        logback.warn(String.format("%s     чеков (корзин) на каждом терминале: %7d ", ConfJDBC.LOG_PEFIX, Conf.COUNT_OF_BASKET_ON_TERMINAL_FOR_GENERATOR));
        logback.warn(String.format("%s     продуктов в каждом чеке (корзине):  %7d ", ConfJDBC.LOG_PEFIX, Conf.COUNT_PRODUCTS_ON_BASKET));                
    }
    
    public Map<Integer, Client> getClients() {
        return clients;
    }

    public Map<Integer, Product> getProducts() {
        return products;
    }
}
