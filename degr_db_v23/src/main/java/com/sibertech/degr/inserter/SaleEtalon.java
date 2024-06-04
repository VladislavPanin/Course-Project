package com.sibertech.degr.inserter;

import com.sibertech.degr.DTO.AllData;
import com.sibertech.degr.utils.LOG;
import java.io.IOException;

public class SaleEtalon {
    
    public void start (AllData aData, String sLogDir, String dbName, String tableName) throws IOException, Exception {
        
        dbName = dbName.toLowerCase();
        tableName = tableName.toLowerCase();
        
        if (!tableName.startsWith("sales_"))
            throw new Exception ("Вставка должна проводиться в таблицы sales_*! А запрошена таблица " + tableName);
        if (tableName.startsWith("sales_parted_"))
            throw new Exception ("Вставка должна проводиться в таблицы sales_*! А запрошена партицированная таблица " + tableName);
        
        String saleTableName = tableName;
        String dictionaryTableName = tableName.replace("sales_", "order_numbers_dictionary_");
        
        //InsertEtalon_DB db = new InsertEtalon_DB();
        LOG log = new LOG(sLogDir, dbName, tableName); 
        //db.doInsert(aData, dbName, saleTableName, dictionaryTableName, log);        
    }
}
