package com.sibertech.degr.db.fill;

import com.sibertech.degr.DTO.Region;
import com.sibertech.degr.db.ConfSQL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Map;

public class LoyalityFiller extends BaseFiller{
    
    public static int LOYALITY_PROGRAMM_COUNT = -1;
    int PRODUCT_CATEGORY_COUNT = 25;
    
    int lineCount = 0; 
    Connection conn = null;            
    
    public LoyalityFiller (Connection conn) {
        this. conn = conn;
    }
    
     //Должны быть вставленны за магазинами    
    public void insert (Map<Integer, Region> regionMap, String dbName) throws SQLException {     
        
        int region_count = regionMap.size() + 1;
        int product_category_count = PRODUCT_CATEGORY_COUNT + 1;        
        
        this.printStart ("loyality", dbName);
        
        int runner = 1; 
        
        try (PreparedStatement preparedStatement = conn.prepareStatement(ConfSQL.INSERT_LOYALITY);) {        
            
            for (int product_category_i=1; product_category_i < product_category_count; product_category_i++)
            {
                for (int region_i=1; region_i < region_count; region_i++)
                {
                    String loyality_programm_name = String.format("loyality programm for region #%d and product category #%d", region_i, product_category_i);
                    double koef = ((double)Math.round ((0.003*region_i*product_category_i) * ((double)100000)))/((double)100000);
                    
                    preparedStatement.setInt    (1, runner++);
                    preparedStatement.setString (2, loyality_programm_name);
                    preparedStatement.setInt    (3, region_i);
                    preparedStatement.setInt    (4, product_category_i);
                    preparedStatement.setDouble (5, koef);

                    preparedStatement.execute();
                    lineCount++;
                }
            }            
        }
        this.printEnd ("loyality", dbName, lineCount);
        
        LOYALITY_PROGRAMM_COUNT = lineCount;
    }

    public static int getLOYALITY_PROGRAMM_COUNT() {
        return LOYALITY_PROGRAMM_COUNT;
    }
}


