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

public class DbMngr {
    
    Logger logback = LoggerFactory.getLogger(DbMngr.class);
    
    public void prepare_stuff_indexed (AllData aData, String sLogDir) throws IOException, Exception {
        
        LOG logGraph;
        String dbName;
        DbMngrCallable_PrepareTableStuff insertingThread;        
        Future future;            
        String saleTableName = "sales";
        String dictionaryTableName = "order_numbers_dictionary";        
        ExecutorService threadPool = Executors.newFixedThreadPool(10);
        ArrayList<Future<String>> arrFutures = new ArrayList<>();
        
        // индексированные БД
        for(RDMS shardNode: RDMS.getShards())
        {
            dbName = "shard_indexed__" + shardNode.getNodeName();                    
            logGraph = new LOG(sLogDir, dbName, saleTableName);
            insertingThread = new DbMngrCallable_PrepareTableStuff();            
            insertingThread.init (aData, shardNode, dbName, saleTableName, dictionaryTableName, logGraph);                        
            future = threadPool.submit(insertingThread);
            arrFutures.add(future);            
            logback.info(String.format("%s Запущен поток инициализации шарда %s", ConfJDBC.LOG_PEFIX, dbName));
        }
        
        dbName = "db__full_indexed";                    
        logGraph = new LOG(sLogDir, dbName, saleTableName);             
        
        insertingThread = new DbMngrCallable_PrepareTableStuff();
        
        insertingThread.init (aData, RDMS.Node_DB__FULL, dbName, saleTableName, dictionaryTableName, logGraph);            
        future = threadPool.submit(insertingThread);
        arrFutures.add(future);            
        logback.info(String.format("%s Запущен поток инициализации БД %s", ConfJDBC.LOG_PEFIX, dbName));
        
        ArrayList<String> arrMsg = new ArrayList<>();
        for (Future<String> fut : arrFutures) {            
            // здесь текущий поток будет висеть, пока не получит результаты работы потоков (то есть пока потоки не завершатся)
            String msg = fut.get(); // ждем, пока запрущенны потоки (их заказано 10) не завершаться                        
            arrMsg.add(msg);                    
        }   
        logback.info(String.format("%s", ConfJDBC.LOG_SPLIT));
        logback.info(String.format("%s Завершены все потоки вставки prepare_stuff_indexed(), получены сообщения:", ConfJDBC.LOG_PEFIX));
        for (String msg: arrMsg){
            logback.info(String.format("%s %s", ConfJDBC.LOG_PEFIX, msg));
        }
        logback.info(String.format("%s", ConfJDBC.LOG_SPLIT));        
    }  
    
    public void prepare_stuff_not_indexed (AllData aData, String sLogDir) throws IOException, Exception {
        
        LOG logGraph;
        String dbName;
        DbMngrCallable_PrepareTableStuff insertingThread;        
        Future future;            
        String saleTableName = "sales";
        String dictionaryTableName = "order_numbers_dictionary";        
        ExecutorService threadPool = Executors.newFixedThreadPool(10);
        ArrayList<Future<String>> arrFutures = new ArrayList<>();
        
        // не  индексированные БД
        for(RDMS shardNode: RDMS.getShards())
        {            
            dbName = "shard_not_indexed__" + shardNode.getNodeName();
            logGraph = new LOG(sLogDir, dbName, saleTableName);
            insertingThread = new DbMngrCallable_PrepareTableStuff();            
            insertingThread.init (aData, shardNode, dbName, saleTableName, dictionaryTableName, logGraph);                        
            future = threadPool.submit(insertingThread);
            arrFutures.add(future);            
            logback.info(String.format("%s Запущен поток инициализации шарда %s", ConfJDBC.LOG_PEFIX, dbName));
        }
        
        dbName = "db__full_not_indexed";                   
        logGraph = new LOG(sLogDir, dbName, saleTableName);             
        
        insertingThread = new DbMngrCallable_PrepareTableStuff();
        
        insertingThread.init (aData, RDMS.Node_DB__FULL, dbName, saleTableName, dictionaryTableName, logGraph);            
        future = threadPool.submit(insertingThread);
        arrFutures.add(future);            
        logback.info(String.format("%s Запущен поток инициализации БД %s", ConfJDBC.LOG_PEFIX, dbName));
                
        ArrayList<String> arrMsg = new ArrayList<>();
        for (Future<String> fut : arrFutures) {            
            // здесь текущий поток будет висеть, пока не получит результаты работы потоков (то есть пока потоки не завершатся)
            String msg = fut.get(); // ждем, пока запрущенны потоки (их заказано 10) не завершаться                        
            arrMsg.add(msg);                    
        }   
        logback.info(String.format("%s", ConfJDBC.LOG_SPLIT));
        logback.info(String.format("%s Завершены все потоки вставки prepare_stuff_not_indexed(), получены сообщения:", ConfJDBC.LOG_PEFIX));
        for (String msg: arrMsg){
            logback.info(String.format("%s %s", ConfJDBC.LOG_PEFIX, msg));
        }
        logback.info(String.format("%s", ConfJDBC.LOG_SPLIT)); 
    }  
    // ===========================================
    
    public void easy_sale_indexed (AllData aData, String sLogDir) throws IOException, Exception {
        
        LOG logGraph;
        String dbName;
        DbMngrCallable_doEasySales insertingThread;        
        Future future;            
        String saleTableName = "sales";
        String dictionaryTableName = "order_numbers_dictionary";        
        ExecutorService threadPool = Executors.newFixedThreadPool(10);
        ArrayList<Future<String>> arrFutures = new ArrayList<>();
        
        // индексированные БД
        for(RDMS shardNode: RDMS.getShards())
        {
            dbName = "shard_indexed__" + shardNode.getNodeName();                    
            logGraph = new LOG(sLogDir, dbName, saleTableName);
            insertingThread = new DbMngrCallable_doEasySales();            
            insertingThread.init (aData, shardNode, dbName, saleTableName, dictionaryTableName, logGraph);                        
            future = threadPool.submit(insertingThread);
            arrFutures.add(future);            
            logback.info(String.format("%s Запущен поток инициализации шарда %s", ConfJDBC.LOG_PEFIX, dbName));
        }
        
        dbName = "db__full_indexed";                    
        logGraph = new LOG(sLogDir, dbName, saleTableName);             
        
        insertingThread = new DbMngrCallable_doEasySales();
        
        insertingThread.init (aData, RDMS.Node_DB__FULL, dbName, saleTableName, dictionaryTableName, logGraph);            
        future = threadPool.submit(insertingThread);
        arrFutures.add(future);            
        logback.info(String.format("%s Запущен поток инициализации БД %s", ConfJDBC.LOG_PEFIX, dbName));
                
        ArrayList<String> arrMsg = new ArrayList<>();
        for (Future<String> fut : arrFutures) {            
            // здесь текущий поток будет висеть, пока не получит результаты работы потоков (то есть пока потоки не завершатся)
            String msg = fut.get(); // ждем, пока запрущенны потоки (их заказано 10) не завершаться                        
            arrMsg.add(msg);                    
        }   
        logback.info(String.format("%s", ConfJDBC.LOG_SPLIT));
        logback.info(String.format("%s Завершены все потоки вставки easy_sale_indexed(), получены сообщения:", ConfJDBC.LOG_PEFIX));
        for (String msg: arrMsg){
            logback.info(String.format("%s %s", ConfJDBC.LOG_PEFIX, msg));
        }
        logback.info(String.format("%s", ConfJDBC.LOG_SPLIT)); 
    }  
    
    public void easy_sale_not_indexed (AllData aData, String sLogDir) throws IOException, Exception {
        
        LOG logGraph;
        String dbName;
        DbMngrCallable_doEasySales insertingThread;        
        Future future;            
        String saleTableName = "sales";
        String dictionaryTableName = "order_numbers_dictionary";        
        ExecutorService threadPool = Executors.newFixedThreadPool(10);
        ArrayList<Future<String>> arrFutures = new ArrayList<>();
        
        // не  индексированные БД
        for(RDMS shardNode: RDMS.getShards())
        {            
            dbName = "shard_not_indexed__" + shardNode.getNodeName();
            logGraph = new LOG(sLogDir, dbName, saleTableName);
            insertingThread = new DbMngrCallable_doEasySales();            
            insertingThread.init (aData, shardNode, dbName, saleTableName, dictionaryTableName, logGraph);                        
            future = threadPool.submit(insertingThread);
            arrFutures.add(future);            
            logback.info(String.format("%s Запущен поток инициализации шарда %s", ConfJDBC.LOG_PEFIX, dbName));
        }
        
        dbName = "db__full_not_indexed";                   
        logGraph = new LOG(sLogDir, dbName, saleTableName);             
        
        insertingThread = new DbMngrCallable_doEasySales();
        
        insertingThread.init (aData, RDMS.Node_DB__FULL, dbName, saleTableName, dictionaryTableName, logGraph);            
        future = threadPool.submit(insertingThread);
        arrFutures.add(future);            
        logback.info(String.format("%s Запущен поток инициализации БД %s", ConfJDBC.LOG_PEFIX, dbName));
                
        ArrayList<String> arrMsg = new ArrayList<>();
        for (Future<String> fut : arrFutures) {            
            // здесь текущий поток будет висеть, пока не получит результаты работы потоков (то есть пока потоки не завершатся)
            String msg = fut.get(); // ждем, пока запрущенны потоки (их заказано 10) не завершаться                        
            arrMsg.add(msg);                    
        }   
        logback.info(String.format("%s", ConfJDBC.LOG_SPLIT));
        logback.info(String.format("%s Завершены все потоки вставки easy_sale_not_indexed(), получены сообщения:", ConfJDBC.LOG_PEFIX));
        for (String msg: arrMsg){
            logback.info(String.format("%s %s", ConfJDBC.LOG_PEFIX, msg));
        }
        logback.info(String.format("%s", ConfJDBC.LOG_SPLIT));   
    }  
}
