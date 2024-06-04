package com.sibertech.degr.inserter;

import com.sibertech.degr.DTO.AllData;
import com.sibertech.degr.utils.LOG;
import java.io.IOException;

public class SaleParted {
    
    public void start (AllData aData, String sLogDir, String dbName, String tableName) throws IOException, Exception {
        
        dbName = dbName.toLowerCase();
        tableName = tableName.toLowerCase();
        
        if (!tableName.startsWith("sales_parted_"))
            throw new Exception ("Вставка должна проводиться в таблицы sales_parted_*! А запрошена таблица " + tableName);        
        
        String saleTableName = tableName;
        String dictionaryTableName = tableName.replace("sales_parted_", "order_numbers_dictionary_parted_");
        
        //InsertParted_DB db = new InsertParted_DB();
        LOG log = new LOG(sLogDir, dbName, tableName); 
        //db.doInsert(aData, dbName, saleTableName, dictionaryTableName, log);        
    }  
}
