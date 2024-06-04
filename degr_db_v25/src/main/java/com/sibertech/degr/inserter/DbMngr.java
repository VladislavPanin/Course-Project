package com.sibertech.degr.inserter;

import com.sibertech.degr.DTO.AllData;
import com.sibertech.degr.db.ConfJDBC;
import com.sibertech.degr.db.RDMS.RDMS;
import java.io.IOException;
import java.util.ArrayList;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class DbMngr {
    
    protected static ExecutorService threadPool = Executors.newFixedThreadPool(30);
    protected Logger logback = LoggerFactory.getLogger(DbMngr.class);    
    
    // =================================================================================================================================
    public void prepare_stuff_single (AllData aData, String sLogDir, String fullDbName) throws IOException, Exception {    

        RDMS node = getRdmsByFullDbName (fullDbName);
        
        ProcDataPack pack;        
        ArrayList<ProcDataPack> arrPack = new ArrayList<>();  
        pack = new ProcDataPack(EInsType.STUFF_INSERT, node, "sales", "order_numbers_dictionary", fullDbName);

        pack.createLog(sLogDir);
        arrPack.add(pack); // добавляем в контейнер                    
        this.run_threads(aData, arrPack); //  отправляем контейнер на выполнение 
    }
    // =================================================================================================================================
    public void prepare_stuff_all (AllData aData, String sLogDir) throws IOException, Exception {
        
        ProcDataPack pack;
        
        ArrayList<ProcDataPack> arrPack = new ArrayList<>();        
        for(RDMS shardNode: RDMS.getShards()) { // только для шард, готовим перечень всех узлов
            // не индексированная шарда
            pack = new ProcDataPack(EInsType.STUFF_INSERT, shardNode, "sales", "order_numbers_dictionary", "shard_not_indexed__" + shardNode.getNodeName());                                
            pack.createLog(sLogDir);
            arrPack.add(pack); // добавляем не индексированную шарду в контейнер
            // индексированная шарда
            pack = new ProcDataPack(EInsType.STUFF_INSERT, shardNode, "sales", "order_numbers_dictionary", "shard_indexed__" + shardNode.getNodeName());                                
            pack.createLog(sLogDir);
            arrPack.add(pack); // добавляем индексированную шарду в контейнер
        }        
        
        // индексированная БД
        pack = new ProcDataPack(EInsType.STUFF_INSERT, RDMS.Node_DB__FULL, "sales", "order_numbers_dictionary", "db__full_not_indexed");
        pack.createLog(sLogDir);
        arrPack.add(pack); // добавляем не индексированную БД в контейнер 
        
        // индексированная БД
        pack = new ProcDataPack(EInsType.STUFF_INSERT, RDMS.Node_DB__FULL, "sales", "order_numbers_dictionary", "db__full_indexed");
        pack.createLog(sLogDir);
        arrPack.add(pack); // добавляем индексированную БД в контейнер
                    
        this.run_threads(aData, arrPack); // запускаем подготовленные узлы на выполнения в отделных новых потоках
    } 
    // =================================================================================================================================
    public void delete_all_data_from_tables (String sLogDir) throws IOException, Exception {
        
        ProcDataPack pack;
        
        ArrayList<ProcDataPack> arrPack = new ArrayList<>();        
        for(RDMS shardNode: RDMS.getShards()) { // только для шард, готовим перечень всех узлов
            // не индексированная шарда
            pack = new ProcDataPack(EInsType.DELETE_ALL_DATA, shardNode, "sales", "order_numbers_dictionary", "shard_not_indexed__" + shardNode.getNodeName());                                
            pack.createLog(sLogDir);
            arrPack.add(pack); // добавляем не индексированную шарду в контейнер
            // индексированная шарда
            pack = new ProcDataPack(EInsType.DELETE_ALL_DATA, shardNode, "sales", "order_numbers_dictionary", "shard_indexed__" + shardNode.getNodeName());                                
            pack.createLog(sLogDir);
            arrPack.add(pack); // добавляем индексированную шарду в контейнер
        }        
        
        // индексированная БД
        pack = new ProcDataPack(EInsType.DELETE_ALL_DATA, RDMS.Node_DB__FULL, "sales", "order_numbers_dictionary", "db__full_not_indexed");
        pack.createLog(sLogDir);
        arrPack.add(pack); // добавляем не индексированную БД в контейнер 
        
        // индексированная БД
        pack = new ProcDataPack(EInsType.DELETE_ALL_DATA, RDMS.Node_DB__FULL, "sales", "order_numbers_dictionary", "db__full_indexed");
        pack.createLog(sLogDir);
        arrPack.add(pack); // добавляем индексированную БД в контейнер
                    
        this.run_threads(null, arrPack); // запускаем подготовленные узлы на выполнения в отделных новых потоках
    } 
    
    // =================================================================================================================================
    public void easy_fill_shards_indexed (AllData aData, String sLogDir) throws IOException, Exception {        
        easy_fill_shards_internal (aData, sLogDir, "shard_indexed__");
    }
    public void easy_fill_shards_not_indexed (AllData aData, String sLogDir) throws IOException, Exception {        
        easy_fill_shards_internal (aData, sLogDir, "shard_not_indexed__");
    }    
    protected void easy_fill_shards_internal (AllData aData, String sLogDir, String shard_prefix) throws IOException, Exception {
        
        ProcDataPack pack;
        
        ArrayList<ProcDataPack> arrPack = new ArrayList<>();        
        for(RDMS shardNode: RDMS.getShards()) {
            pack = new ProcDataPack(EInsType.EASY_INSERT, shardNode, "sales", "order_numbers_dictionary", shard_prefix + shardNode.getNodeName());                                
            pack.createLog(sLogDir);
            arrPack.add(pack);             
        }           
        this.run_threads(aData, arrPack); // запускаем подготовленные узлы на выполнения в отделных новых потоках
    }  
    // =================================================================================================================================
    public void easy_fill_db_indexed (AllData aData, String sLogDir) throws IOException, Exception {        
        easy_fill_db_internal (aData, sLogDir, "db__full_indexed");
    }
    public void easy_fill_db_not_indexed (AllData aData, String sLogDir) throws IOException, Exception {        
        easy_fill_db_internal (aData, sLogDir, "db__full_not_indexed");
    }    
    protected void easy_fill_db_internal (AllData aData, String sLogDir, String fullDbName) throws IOException, Exception {
        
        ArrayList<ProcDataPack> arrPack = new ArrayList<>();        
        
        ProcDataPack pack = new ProcDataPack(EInsType.EASY_INSERT, RDMS.Node_DB__FULL, "sales", "order_numbers_dictionary", fullDbName);                                
        pack.createLog(sLogDir);
        arrPack.add(pack);             
        
        this.run_threads(aData, arrPack); 
    }  
    // =================================================================================================================================
    public void hard_fill_shards_indexed (AllData aData, String sLogDir, int mlns) throws IOException, Exception {        
        
        String tableSuffix = String.format("_%02d_mln", mlns);
        hard_fill_shards_internal (aData, sLogDir, "shard_indexed__", tableSuffix);
    }
    public void hard_fill_shards_not_indexed (AllData aData, String sLogDir, int mlns) throws IOException, Exception {        
        
        String tableSuffix = String.format("_%02d_mln", mlns);
        hard_fill_shards_internal (aData, sLogDir, "shard_not_indexed__", tableSuffix);
    }    
    protected void hard_fill_shards_internal (AllData aData, String sLogDir, String shard_predix, String tableSuffix) throws IOException, Exception {
        
        ProcDataPack pack;
        
        ArrayList<ProcDataPack> arrPack = new ArrayList<>();        
        for(RDMS shardNode: RDMS.getShards()) {
            pack = new ProcDataPack(EInsType.HARD_INSERT, shardNode, "sales" + tableSuffix, "order_numbers_dictionary" + tableSuffix, shard_predix + shardNode.getNodeName());                                
            pack.createLog(sLogDir);
            arrPack.add(pack);             
        }           
        this.run_threads(aData, arrPack); // запускаем подготовленные узлы на выполнения в отделных новых потоках
    }  
    // =================================================================================================================================
    public void hard_fill_db_indexed (AllData aData, String sLogDir, int mlns) throws IOException, Exception {        
        
        String tableSuffix = String.format("_%02d_mln", mlns);
        hard_fill_db_internal (aData, sLogDir, "db__full_indexed", tableSuffix);
    }
    public void hard_fill_db_not_indexed (AllData aData, String sLogDir, int mlns) throws IOException, Exception {        
        
        String tableSuffix = String.format("_%02d_mln", mlns);
        hard_fill_db_internal (aData, sLogDir, "db__full_not_indexed", tableSuffix);
    }   
    protected void hard_fill_db_internal (AllData aData, String sLogDir, String fullDbName, String tableSuffix) throws IOException, Exception {
        
        ArrayList<ProcDataPack> arrPack = new ArrayList<>();        
        
        ProcDataPack pack = new ProcDataPack(EInsType.HARD_INSERT, RDMS.Node_DB__FULL, "sales" + tableSuffix, "order_numbers_dictionary" + tableSuffix, fullDbName);                                
        pack.createLog(sLogDir);
        arrPack.add(pack);             
        
        this.run_threads(aData, arrPack); 
    } 
    // =================================================================================================================================
    public void hard_fill_parted_db_indexed (AllData aData, String sLogDir, int mlns) throws IOException, Exception {        
        
        String tableSuffix = String.format("_parted_%02d_mln", mlns);
        hard_fill_parted_db_internal (aData, sLogDir, "db__full_indexed", tableSuffix);
    }
    public void hard_fill_parted_db_not_indexed (AllData aData, String sLogDir, int mlns) throws IOException, Exception {        
        
        String tableSuffix = String.format("_parted_%02d_mln", mlns);
        hard_fill_parted_db_internal (aData, sLogDir, "db__full_not_indexed", tableSuffix);
    }   
    protected void hard_fill_parted_db_internal (AllData aData, String sLogDir, String fullDbName, String tableSuffix) throws IOException, Exception {
        
        ArrayList<ProcDataPack> arrPack = new ArrayList<>();        
        
        ProcDataPack pack = new ProcDataPack(EInsType.HARD_INSERT, RDMS.Node_DB__FULL, "sales" + tableSuffix, "order_numbers_dictionary" + tableSuffix, fullDbName);                                
        pack.createLog(sLogDir);
        arrPack.add(pack);             
        
        this.run_threads(aData, arrPack); 
    } 
    // =================================================================================================================================    
    public void run_threads (AllData aData, ArrayList<ProcDataPack> arrPackToRun) throws IOException, Exception {
        
        ArrayList<Future<String>> arrFutures = new ArrayList<>();        
        for (ProcDataPack pack: arrPackToRun) 
        {   // по переченю узлов, для каждого, запускаем поток выполнения ставки                        
            
            DbProc proc = new DbProc ();                            // создаем экземпляр специализированного класса-обработчика, который будет запущен в новом потоке                        
            proc.init (aData, pack);                                // инициализируем этот экземпляр
            Future future = threadPool.submit(proc);                // получаем объект future, который будет узнает, когда закончится поток, от которого его получили
            arrFutures.add(future);                                 // складываем в один контейнер все такие объекты future - удобно
            
            logback.info(String.format("%s Запущен поток инициализации шарда %s", ConfJDBC.LOG_PEFIX, pack.dbName));
        }        
        
        ArrayList<String> arrMsg = new ArrayList<>();        
        for (Future<String> fut : arrFutures) {            
            String msg = fut.get(); // здесь текущий поток будет висеть, пока не получит результаты работы запущеннывх потоков (то есть пока потоки не завершатся)
            arrMsg.add(msg);        // собираем все отчеты выполнения в один контейнер - выведем все сразу, после того, как все потоки (которых ожидаем на предыдущей строке) выполнятся            
        }           
        
        logback.info(String.format("%s", ConfJDBC.LOG_SPLIT));
        logback.info(String.format("%s Завершены все потоки вставки prepare_stuff_indexed(), получены сообщения:", ConfJDBC.LOG_PEFIX));        
        for (String msg: arrMsg){
            logback.info(String.format("%s %s", ConfJDBC.LOG_PEFIX, msg));
        }
        logback.info(String.format("%s", ConfJDBC.LOG_SPLIT));        
    }  
    
    // =================================================================================================================================    
    // костыль
    protected RDMS getRdmsByFullDbName (String fullDbName)
    {
        switch (fullDbName)
        {
            case "db__full_not_indexed"          :  return RDMS.Node_DB__FULL;
            case "db__full_indexed"              :  return RDMS.Node_DB__FULL;				
            case "shard_indexed__tomsk"          :  return RDMS.Node_SHARD_TOMSK;
            case "shard_indexed__moscow"         :  return RDMS.Node_SHARD_MOSCOW;
            case "shard_indexed__samara"         :  return RDMS.Node_SHARD_SAMARA;
            case "shard_indexed__novosibirsk"    :  return RDMS.Node_SHARD_NOVOSIBIRSK;
            case "shard_indexed__orel"           :  return RDMS.Node_SHARD_OREL;
            case "shard_indexed__kemerovo"       :  return RDMS.Node_SHARD_KEMEROVO;
            case "shard_indexed__barnaul"        :  return RDMS.Node_SHARD_BARNAUL;
            case "shard_indexed__smolensk"       :  return RDMS.Node_SHARD_SMOLENSK;
            case "shard_indexed__belgorod"       :  return RDMS.Node_SHARD_BELGOROD;
            case "shard_indexed__tula"           :  return RDMS.Node_SHARD_TULA;
            case "shard_not_indexed__tomsk"      :  return RDMS.Node_SHARD_TOMSK;
            case "shard_not_indexed__moscow"     :  return RDMS.Node_SHARD_MOSCOW;
            case "shard_not_indexed__samara"     :  return RDMS.Node_SHARD_SAMARA;
            case "shard_not_indexed__novosibirsk":  return RDMS.Node_SHARD_NOVOSIBIRSK;
            case "shard_not_indexed__orel"       :  return RDMS.Node_SHARD_OREL;
            case "shard_not_indexed__kemerovo"   :  return RDMS.Node_SHARD_KEMEROVO;
            case "shard_not_indexed__barnaul"    :  return RDMS.Node_SHARD_BARNAUL;
            case "shard_not_indexed__smolensk"   :  return RDMS.Node_SHARD_SMOLENSK;
            case "shard_not_indexed__belgorod"   :  return RDMS.Node_SHARD_BELGOROD;
            case "shard_not_indexed__tula"       :  return RDMS.Node_SHARD_TULA;
        }                                        
        return null;
    }
}