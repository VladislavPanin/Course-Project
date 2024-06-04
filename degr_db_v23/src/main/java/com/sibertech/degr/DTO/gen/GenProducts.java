package com.sibertech.degr.DTO.gen;

import com.sibertech.degr.DTO.Product;
import com.sibertech.degr.db.ConfJDBC;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import com.sibertech.degr.db.Conf;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class GenProducts {

    Logger logGen = LoggerFactory.getLogger(GenProducts.class);    
    long deltaTime, runnerTime, startTime;
    
    public Map<Integer, Product> create(){
        
        Random random = new Random();
        Map<Integer, Product> map = new HashMap<>();
        Timestamp timestamp_now = new Timestamp(System.currentTimeMillis());
        startTime = System.currentTimeMillis();        
        
        printStart ();
        for (int i = 1; i <= Conf.PRODUCT_COUNT_ON_STORE; i++){
            
            int randomCost = random.nextInt(Conf.MAX_COST_OF_PRODUCT) + 100;
            Product product = new Product(i, "product_" + i, Conf.MAX_EACH_PRODUCT_QUANTITY_ON_STORE, timestamp_now, randomCost);
            map.put(i, product);
        }        
        printEnd();        
        return map;
    }
    
    protected void printStart () {        
        logGen.warn(String.format("%s Начинается генерация продуктов (на склад)", ConfJDBC.LOG_PEFIX));                
        
    }
    
    protected void printEnd () {
        runnerTime = System.currentTimeMillis();
        deltaTime = runnerTime - startTime;  
        logGen.warn(String.format("%s :::::::: Генерация продуктов завершена, количество сгенерированных %s. Время генерации %d миллисекунд", ConfJDBC.LOG_PEFIX, Conf.PRODUCT_COUNT_ON_STORE, deltaTime));        
    }
}
