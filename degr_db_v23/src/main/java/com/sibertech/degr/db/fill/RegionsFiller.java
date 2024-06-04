package com.sibertech.degr.db.fill;

import com.sibertech.degr.DTO.Region;
import com.sibertech.degr.db.ConfSQL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Map;

public class RegionsFiller extends BaseFiller{
    
    int lineCount = 0;        
    Connection conn = null;            
        
    public RegionsFiller (Connection conn) {
        this. conn = conn;
    }
        
    //Должны быть вставленны самыми первыми. Зависимости от других таблиц нет    
    public void insert (Map<Integer, Region> regionMap, String dbName) throws SQLException {
     
        this.printStart ("regions", dbName);
        
        Region region;        
        try (PreparedStatement preparedStatement = conn.prepareStatement(ConfSQL.INSERT_REGIONS);) {

            for(Map.Entry<Integer, Region> entry : regionMap.entrySet()) {
                region = entry.getValue();            

                preparedStatement.setInt      (1, region.getId());
                preparedStatement.setString   (2, region.getRegionName());
                preparedStatement.setString   (3, "some comment for Region #" + region.getId());

                preparedStatement.execute();
                lineCount++;
            }
        }
        this.printEnd ("regions", dbName, lineCount);
    }    
}
