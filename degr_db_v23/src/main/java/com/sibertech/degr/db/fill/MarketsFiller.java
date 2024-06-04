package com.sibertech.degr.db.fill;

import com.sibertech.degr.DTO.Market;
import com.sibertech.degr.DTO.Region;
import com.sibertech.degr.db.ConfSQL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Map;

public class MarketsFiller  extends BaseFiller{
    
    int lineCount = 0;
    Connection conn = null;                
    
    public MarketsFiller (Connection conn) {
        this. conn = conn;
    }
    
    //Должны быть вставленны за регионами
    public void insert (Map<Integer, Region> regionMap, String dbName) throws SQLException {
         
        this.printStart ("markets", dbName);
        
        Market market;
        try (PreparedStatement preparedStatement = conn.prepareStatement(ConfSQL.INSERT_MARKETS);) {        

            for(Map.Entry<Integer, Region> entryRegion : regionMap.entrySet()) {
                Region region = entryRegion.getValue();  
                Map<Integer, Market> marketMap = region.getMarkets_in_region();

                for(Map.Entry<Integer, Market> entryMarket : marketMap.entrySet()) {
                    market = entryMarket.getValue(); 

                    preparedStatement.setInt    (1, market.getRegion_id());
                    preparedStatement.setInt    (2, market.getMarket_id_on_region());
                    preparedStatement.setString (3, market.getMarket_name());
                    preparedStatement.setString (4, "some comment for market #" + market.getMarket_id_on_region() + " in region #" + region.getId());

                    preparedStatement.execute();
                    lineCount++;
                }
            }
        }
        this.printEnd ("markets", dbName, lineCount);
    }    
}
