package com.sibertech.degr.DTO;

import lombok.Data;

import java.util.HashMap;
import java.util.Map;
@Data
public class Market{
    
    protected Integer region_id;
    protected String market_name;
    protected Integer market_id_on_region;
    
    protected Map<Integer,Terminal> terminals_in_market = new HashMap();
    
    public void addTerminal(Terminal terminal){
        Integer id = terminals_in_market.size()+1;
        this.terminals_in_market.put(id, terminal);
    }
    
    public Market(Integer market_id_on_region, Integer region, String name){
        this.market_id_on_region = market_id_on_region;
        this.region_id = region;
        this.market_name = name;
    }
}
