package com.sibertech.degr.inserter;

import com.sibertech.degr.DTO.AllData;
import com.sibertech.degr.db.RDMS.RDMS;
import com.sibertech.degr.utils.LOG;
import java.util.concurrent.Callable;

public class DbMngrCallable_PrepareTableStuff implements Callable {
   
   protected SqlDbOper inserter = null;
    
    public void init (AllData aData, RDMS shardNode, String dbName, String saleTableName, String dictionaryTableName, LOG log) throws ClassNotFoundException, Exception {

        this.inserter = new SqlDbOper();
        this.inserter.init(aData, shardNode, dbName, saleTableName, dictionaryTableName, log);
    }  

   @Override
    public String call() throws Exception {        
        // этот метод будет вызван ExecutorService-ом        
        
        String 
        res = "не запущен, не отработал";        
        res = this.inserter.doPrepareTableStuff();        
        return res;
    }
}
