package com.sibertech.degr.DTO;

import lombok.Data;

import java.util.HashMap;
import java.util.Map;
@Data
public class Terminal {
    
    protected Integer region_id;
    protected Integer market_id;
    protected Integer terminal_id_on_market;
    protected Integer terminal_basket_number = 0;
    
    protected Map<Integer,ProductBasket> productBasketMap = new HashMap<>();
    
    public Terminal(Integer terminal_id_on_market, Integer region, Integer market){
        this.terminal_id_on_market = terminal_id_on_market;
        this.region_id = region;
        this.market_id = market;
    }
    
    public void addProductBasket(ProductBasket basket){
        Integer id = productBasketMap.size()+1;
        this.productBasketMap.put(id, basket);
    }
    
    public Integer getTerminalBasketNumber(){
        return ++terminal_basket_number;
    }
}
