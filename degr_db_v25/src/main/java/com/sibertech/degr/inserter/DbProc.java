package com.sibertech.degr.inserter;

import com.sibertech.degr.DTO.AllData;
import com.sibertech.degr.db.fill.BaseFiller;
import java.util.concurrent.Callable;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class DbProc  implements Callable {
    
    protected Logger logback = LoggerFactory.getLogger(DbProc.class);
   
   protected ProcDataPack pack = null;
   protected SqlDbOper  oper = null;
   // ===============================================================================================
    
    public void init (AllData aData, ProcDataPack pack) throws ClassNotFoundException, Exception {

        this.pack = pack;        
        this.oper = new SqlDbOper();
        this.oper.init(aData, pack);        
    }  

    @Override
    public Object call() throws Exception {
        
        String  res = "не запущен, не отработал";        
        String sInsType = this.pack.insType.to_s();
        
        switch (sInsType) {            
            case "stuff":
                res = this.oper.doPrepareTableStuff();        
                break;
            case "easy":
                res = this.oper.doEasySales();                        
                break;
            case "hard":
                res = this.oper.doHardSales();                  
                break;
            case "delete_all_data":
                res = this.oper.doDeleteAllData();        
                break;
        }
        
        return res;
    }
}
