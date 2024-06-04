package com.sibertech.degr.db.fill;

import com.sibertech.degr.inserter.ProcDataPack;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

public class AllDataRemover  extends BaseFiller{
    
    public static String DELETE_FROM_TABLE = "DELETE FROM %s";
    
    int lineCount = 0;
    Connection conn = null;                
    
    public AllDataRemover (Connection conn) {
        this. conn = conn;
    }
    
    public void removeAllData (String dbName, ProcDataPack pack) throws SQLException {
         
        this.printStart_del(dbName);
        
        ArrayList<String> aOpers = new ArrayList<>();
        
            aOpers.add (String.format(DELETE_FROM_TABLE, "sales"));
            aOpers.add (String.format(DELETE_FROM_TABLE, "sales_01_mln"));
            aOpers.add (String.format(DELETE_FROM_TABLE, "sales_02_mln"));
            aOpers.add (String.format(DELETE_FROM_TABLE, "sales_03_mln"));
            aOpers.add (String.format(DELETE_FROM_TABLE, "sales_04_mln"));
            aOpers.add (String.format(DELETE_FROM_TABLE, "sales_05_mln"));
            aOpers.add (String.format(DELETE_FROM_TABLE, "sales_06_mln"));
            aOpers.add (String.format(DELETE_FROM_TABLE, "sales_07_mln"));
            aOpers.add (String.format(DELETE_FROM_TABLE, "sales_08_mln"));
            aOpers.add (String.format(DELETE_FROM_TABLE, "sales_09_mln"));
            aOpers.add (String.format(DELETE_FROM_TABLE, "sales_10_mln"));
            aOpers.add (String.format(DELETE_FROM_TABLE, "sales_20_mln"));
            aOpers.add (String.format(DELETE_FROM_TABLE, "sales_30_mln"));
            aOpers.add (String.format(DELETE_FROM_TABLE, "sales_40_mln"));
            aOpers.add (String.format(DELETE_FROM_TABLE, "order_numbers_dictionary"));
            aOpers.add (String.format(DELETE_FROM_TABLE, "order_numbers_dictionary_01_mln"));
            aOpers.add (String.format(DELETE_FROM_TABLE, "order_numbers_dictionary_02_mln"));
            aOpers.add (String.format(DELETE_FROM_TABLE, "order_numbers_dictionary_03_mln"));
            aOpers.add (String.format(DELETE_FROM_TABLE, "order_numbers_dictionary_04_mln"));
            aOpers.add (String.format(DELETE_FROM_TABLE, "order_numbers_dictionary_05_mln"));
            aOpers.add (String.format(DELETE_FROM_TABLE, "order_numbers_dictionary_06_mln"));
            aOpers.add (String.format(DELETE_FROM_TABLE, "order_numbers_dictionary_07_mln"));
            aOpers.add (String.format(DELETE_FROM_TABLE, "order_numbers_dictionary_08_mln"));
            aOpers.add (String.format(DELETE_FROM_TABLE, "order_numbers_dictionary_09_mln"));
            aOpers.add (String.format(DELETE_FROM_TABLE, "order_numbers_dictionary_10_mln"));
            aOpers.add (String.format(DELETE_FROM_TABLE, "order_numbers_dictionary_20_mln"));
            aOpers.add (String.format(DELETE_FROM_TABLE, "order_numbers_dictionary_30_mln"));
            aOpers.add (String.format(DELETE_FROM_TABLE, "order_numbers_dictionary_40_mln"));
            
        if(!pack.node.isNodeShard())
        {
                aOpers.add (String.format(DELETE_FROM_TABLE, "sales_parted"));
                aOpers.add (String.format(DELETE_FROM_TABLE, "sales_parted_01_mln"));
                aOpers.add (String.format(DELETE_FROM_TABLE, "sales_parted_02_mln"));
                aOpers.add (String.format(DELETE_FROM_TABLE, "sales_parted_03_mln"));
                aOpers.add (String.format(DELETE_FROM_TABLE, "sales_parted_04_mln"));
                aOpers.add (String.format(DELETE_FROM_TABLE, "sales_parted_05_mln"));
                aOpers.add (String.format(DELETE_FROM_TABLE, "sales_parted_06_mln"));
                aOpers.add (String.format(DELETE_FROM_TABLE, "sales_parted_07_mln"));
                aOpers.add (String.format(DELETE_FROM_TABLE, "sales_parted_08_mln"));
                aOpers.add (String.format(DELETE_FROM_TABLE, "sales_parted_09_mln"));
                aOpers.add (String.format(DELETE_FROM_TABLE, "sales_parted_10_mln"));
                aOpers.add (String.format(DELETE_FROM_TABLE, "sales_parted_20_mln"));
                aOpers.add (String.format(DELETE_FROM_TABLE, "sales_parted_30_mln"));
                aOpers.add (String.format(DELETE_FROM_TABLE, "sales_parted_40_mln"));
                aOpers.add (String.format(DELETE_FROM_TABLE, "order_numbers_dictionary_parted"));
                aOpers.add (String.format(DELETE_FROM_TABLE, "order_numbers_dictionary_parted_01_mln"));
                aOpers.add (String.format(DELETE_FROM_TABLE, "order_numbers_dictionary_parted_02_mln"));
                aOpers.add (String.format(DELETE_FROM_TABLE, "order_numbers_dictionary_parted_03_mln"));
                aOpers.add (String.format(DELETE_FROM_TABLE, "order_numbers_dictionary_parted_04_mln"));
                aOpers.add (String.format(DELETE_FROM_TABLE, "order_numbers_dictionary_parted_05_mln"));
                aOpers.add (String.format(DELETE_FROM_TABLE, "order_numbers_dictionary_parted_06_mln"));
                aOpers.add (String.format(DELETE_FROM_TABLE, "order_numbers_dictionary_parted_07_mln"));
                aOpers.add (String.format(DELETE_FROM_TABLE, "order_numbers_dictionary_parted_08_mln"));
                aOpers.add (String.format(DELETE_FROM_TABLE, "order_numbers_dictionary_parted_09_mln"));
                aOpers.add (String.format(DELETE_FROM_TABLE, "order_numbers_dictionary_parted_10_mln"));
                aOpers.add (String.format(DELETE_FROM_TABLE, "order_numbers_dictionary_parted_20_mln"));
                aOpers.add (String.format(DELETE_FROM_TABLE, "order_numbers_dictionary_parted_30_mln"));
                aOpers.add (String.format(DELETE_FROM_TABLE, "order_numbers_dictionary_parted_40_mln"));
        }
            aOpers.add (String.format(DELETE_FROM_TABLE, "clients"));
            aOpers.add (String.format(DELETE_FROM_TABLE, "terminals"));
            aOpers.add (String.format(DELETE_FROM_TABLE, "markets"));
            aOpers.add (String.format(DELETE_FROM_TABLE, "products"));
            aOpers.add (String.format(DELETE_FROM_TABLE, "loyality"));
            aOpers.add (String.format(DELETE_FROM_TABLE, "regions"));
        
            for(String oper: aOpers)
            {            
                try (PreparedStatement preparedStatement = conn.prepareStatement(oper);) {      
                            preparedStatement.execute();
                            lineCount++;            
                }
            }
        
        this.printEnd_del(dbName, lineCount);
    }   
}
