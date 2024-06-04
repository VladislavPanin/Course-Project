
package com.sibertech.degr.inserter;

import com.sibertech.degr.db.RDMS.RDMS;
import com.sibertech.degr.utils.LOG;
import java.io.IOException;

public class ProcDataPack {
    
    public final RDMS     node;     // узел, который описывает базу данных    
    public final String   tSales;   // имя таблицы типа sales* (sales, sales_01_mln, sales_02_mln ...)
    public final String   tDict;    // имя таблицы типа order_numbers_dictionary* (order_numbers_dictionary, order_numbers_dictionary_01_mln, order_numbers_dictionary_02_mln ...)
    public final String   dbName;   // имя базы данных
    public final EInsType insType; // тип вставки - наполнение базовых таблиц, быстрое заполнение таблиц sales, или иммиация продаж - hard
    
    protected LOG fileLogger = null;
    
    public ProcDataPack (EInsType insType, RDMS node, String tSales, String tDict, String dbName) {
        this.insType = insType;
        
        this.node = node;
        this.tSales = tSales;
        this.tDict = tDict;        
        this.dbName = dbName;
    }
    
    public LOG getLog() {
        return fileLogger;
    }
    public void setLog (LOG fileLogger) {
        this.fileLogger = fileLogger;
    }
    
    public void createLog (String sLogDir) throws IOException {
        this.fileLogger = new LOG (sLogDir, this);
    }
}
