package com.sibertech.degr.DTO;

import lombok.Data;

import java.util.HashMap;
import java.util.Map;

@Data
public class Region {
    public Integer id;
    public Map<Integer, Market> markets_in_region = new HashMap<>();
    public String regionName;

    public void addMarket(Market market){
        int market_id = markets_in_region.size()+1;
        this.markets_in_region.put(market_id, market);
    }
    public Region(Integer id, String name){
        this.id = id;
        this.regionName = name;
    }
}
