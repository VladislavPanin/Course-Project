package com.sibertech.degr.DTO.actuator;

import com.sibertech.degr.DTO.Product;
import com.sibertech.degr.DTO.ProductBasket;
import com.sibertech.degr.db.ConfJDBC;
import com.sibertech.degr.utils.Util;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Map;

public class DtoActuator {
    
    LocalDateTime ldt_for_time = null;
    int date_counter = 0;
            
    public DtoActuator () {
        ldt_for_time = Util._now_date_without_mls();
    }

    Logger log = LoggerFactory.getLogger(DtoActuator.class);
    
    public void updateBasket (ProductBasket productBasket){        
        Map<Integer, Product> basket = productBasket.getBasket();
        int basket_price = 0;
        
        for(int i=1; i <= basket.size();i++)//10 продуктов в корзине всегда
        {
            Product product = basket.get(i);            
            if(product == null){
                log.warn(String.format("%s --------------- ---------------      ! Ошибка  !    ------ DtoActuator::updateBasket(), Product is null ", ConfJDBC.LOG_PEFIX));                
            }
            
            int cost = product.getCost();            
            if (cost < 1000)      cost =+ 500;
            else if (cost < 9000) cost =- 500;
            
            if (cost < 4000)      cost =+ 1000;
            else if (cost > 6000) cost =- 100;            
            
            product.setCost(cost);
            basket_price = basket_price + cost; //(если кост без учета кол-ва, то можно умножить на кол-во)
        }
        productBasket.setBasket_price(basket_price);

        // productBasket.getTerminal_id();
        
        productBasket.setSaleTimestamp(getCurr_time());
        java.sql.Date currDate = getCurr_date();
        productBasket.setSaleDate(currDate);
    }

    public Timestamp getCurr_time() {
        ldt_for_time = ldt_for_time.plusSeconds(1);
        Timestamp ts = Timestamp.valueOf(ldt_for_time);
        return ts;
    }

    public java.sql.Date getCurr_date() {
        
        java.sql.Date date = null;
        String sDate = null;
        int rem = 0;
        try{
            rem = date_counter++ % 10;
            if (rem == 0)
                rem = 10;

             sDate = String.format("2023-01-%02d", rem);        
             date = java.sql.Date.valueOf(sDate);    
        }catch(Exception exc){
            int i = 1;
        }
        return date;
    }
}
