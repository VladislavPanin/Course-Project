package com.sibertech.degr.db.fill;

import com.sibertech.degr.DTO.Product;
import com.sibertech.degr.db.ConfJDBC;
import com.sibertech.degr.db.ConfSQL;
import com.sibertech.degr.inserter.SqlDbOper;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ProductsFiller extends BaseFiller{
    
    public static final int PRODUCT_CATEGORY_COUNT = 25;
    
    protected Logger logback = LoggerFactory.getLogger(SqlDbOper.class);
            
    int lineCount = 0;    
    Connection conn = null;                
    
    public ProductsFiller (Connection conn) {        
        this. conn = conn;
    }
    
    //Должны быть вставленны самыми первыми. Зависимости от других таблиц нет    
    public void insert (Map<Integer, Product> productMap, String dbName) throws SQLException {
         
        this.printStart ("products", dbName);        
        int id_category = LoyalityFiller.getLOYALITY_PROGRAMM_COUNT();
        Product product;  
        String sql = "";
        
        int id;
        String name;
        int count;
        int cost;        
        
        try {
            try (PreparedStatement preparedStatement = conn.prepareStatement(ConfSQL.INSERT_PRODUCTS);) {
                
                for(Map.Entry<Integer, Product> entry : productMap.entrySet()) {
                    product = entry.getValue();            

                    id = product.getId();
                    name = product.getProductName();
                    count = product.getCountOfProduct();
                    cost = product.getCost();
                    
                    preparedStatement.setInt      (1, id);
                    preparedStatement.setString   (2, name);
                    preparedStatement.setInt      (3, cost);
                    preparedStatement.setInt      (4, count);
                    preparedStatement.setTimestamp(5, product.getDatetime());            
                    preparedStatement.setString   (6, "some comment for product #" + product.getId());
                    preparedStatement.setInt      (7, id_category--);

                    if (id_category == 0)
                        id_category = LoyalityFiller.getLOYALITY_PROGRAMM_COUNT();                    

                    preparedStatement.execute();
                    lineCount++;
                }
            }
        }
        catch (Exception exc)
        {
            logback.warn(String.format("%s On exception:  Product category= %d  ", ConfJDBC.LOG_PEFIX_EXCEPT, id_category));
            logback.warn(String.format("%s %s -> %s", ConfJDBC.LOG_PEFIX_EXCEPT, "ProductsFiller::insert()", exc.getMessage()));                    
        }
        this.printEnd ("products", dbName, lineCount);
    }    
}
