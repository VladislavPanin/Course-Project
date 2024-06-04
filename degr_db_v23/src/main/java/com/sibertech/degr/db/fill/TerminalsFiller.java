package com.sibertech.degr.db.fill;

import com.sibertech.degr.DTO.Market;
import com.sibertech.degr.DTO.Region;
import com.sibertech.degr.DTO.Terminal;
import com.sibertech.degr.db.ConfSQL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Map;

public class TerminalsFiller extends BaseFiller{
    
    int lineCount = 0; 
    Connection conn = null;            
    
    public TerminalsFiller (Connection conn) {
        this. conn = conn;
    }
    
     //Должны быть вставленны за магазинами    
    public void insert (Map<Integer, Region> regionMap, String dbName) throws SQLException {     
        Region region;        
        Terminal terminal;
        Market market;
        
        this.printStart ("terminals", dbName);
        
        try (PreparedStatement preparedStatement = conn.prepareStatement(ConfSQL.INSERT_TERMINALS);) {        
            
            for(Map.Entry<Integer, Region> entryRegion : regionMap.entrySet()) {
                region = entryRegion.getValue();  
                Map<Integer, Market> marketMap = region.getMarkets_in_region();

                for(Map.Entry<Integer, Market> entryMarket : marketMap.entrySet()) {
                    market = entryMarket.getValue();
                    Map<Integer, Terminal> terminalMap = market.getTerminals_in_market();

                    for(Map.Entry<Integer, Terminal> entryTerminal : terminalMap.entrySet()) {
                        terminal = entryTerminal.getValue();

                        preparedStatement.setInt      (1, terminal.getTerminal_id_on_market());
                        preparedStatement.setInt      (2, terminal.getMarket_id());
                        preparedStatement.setInt      (3, terminal.getRegion_id());
                        preparedStatement.setString   (4, "some comment for market #" + market.getMarket_id_on_region() + " in region #" + region.getId());

                        preparedStatement.execute();
                        lineCount++;
                    }
                }
            }
        }
        this.printEnd ("terminals", dbName, lineCount);
    }
}
