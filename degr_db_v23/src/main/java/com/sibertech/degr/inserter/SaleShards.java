package com.sibertech.degr.inserter;

import com.sibertech.degr.DTO.AllData;
import com.sibertech.degr.db.ConfJDBC;
import com.sibertech.degr.db.RDMS.RDMS;
import com.sibertech.degr.utils.LOG;
import java.io.IOException;
import java.util.ArrayList;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class SaleShards {
    
    Logger logback = LoggerFactory.getLogger(SaleShards.class);
    
     public void start (AllData aData, String dbName, String sLogDir, String tableName) throws IOException, Exception {
        
        tableName = tableName.toLowerCase();
        
        if (!tableName.startsWith("sales_"))
            throw new Exception ("Вставка должна проводиться в таблицы sales_*! А запрошена таблица " + tableName);
        if (tableName.startsWith("sales_parted_"))
            throw new Exception ("Вставка должна проводиться в таблицы sales_*! А запрошена партицированная таблица " + tableName);
        
        String saleTableName = tableName;
        String dictionaryTableName = tableName.replace("sales_", "order_numbers_dictionary_");
        
        ExecutorService threadPool = Executors.newFixedThreadPool(10);
        ArrayList<Future<String>> arrFutures = new ArrayList<>();
        /*
        for(RDMS shardNode: RDMS.getShards())
        {
            LOG logGraph = new LOG(sLogDir, shardNode.getNodeName(), tableName);             
            //InsertShardsCallable insertingThread = new InsertShardsCallable();
            
            //insertingThread.init (aData, shardNode, dbName, saleTableName, dictionaryTableName, logGraph);            
            
            Future future = threadPool.submit(insertingThread);
            arrFutures.add(future);            
            logback.info(String.format("%s Запущен поток вставки шарда %s", ConfJDBC.LOG_PEFIX, shardNode.getNodeName()));
        }
        
        for (Future<String> future : arrFutures) {
            
            // здесь текущий поток будет висеть, пока не получит результаты работы потоков (то есть пока потоки не завершатся)
            String msg = future.get(); // ждем, пока запрущенны потоки (их заказано 10) не завершаться
            
            logback.info(String.format("%s Завершен поток вставки, получено сообщение: %s", ConfJDBC.LOG_PEFIX, msg));
        }   */     
    }  
}
