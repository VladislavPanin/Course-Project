package com.sibertech.degr.controllers;

import com.sibertech.degr.DTO.AllData;
import com.sibertech.degr.db.fill.BaseFiller;
import com.sibertech.degr.inserter.DbMngr;
import com.sibertech.degr.inserter.SaleEtalon;
import com.sibertech.degr.inserter.SaleParted;
import com.sibertech.degr.inserter.SaleShards;
import com.sibertech.degr.utils.Util;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/insert")
public class ProcController {

    protected AllData aData = null;
    protected String  sLogRootDir = "../__LOG/";
    protected String  sLogDir = null;
    
    public String init_aData () throws Exception {   
        
        /*******************************************************************************************************************************************************************************/
        BaseFiller.setBREAK_AFTER_COUNT(10000000); // остановится после количества вставок=BREAK_AFTER_COUNT, если раньше не исчерпается наюор корзин для региона (AllData::regionsMapMap)
        BaseFiller.setINSERT_STEP_COUNTER(10000); //Количество шагов цикла, после которого будем выводить в лог таймаут каунтер (количество потери соеденения с базой) (количество отвалов по таймаутлоку)
        /*******************************************************************************************************************************************************************************/
                
                    String ret = "";
                    if (aData == null) {
                        String start = Util._nowStr_dateTime_forDirPath();
                        sLogDir = sLogRootDir + start + "/";

                        aData = new AllData();
                        aData.generate ();      
                        ret = "===== Набор корзин для вставки сгенерирован\n";
                    }
                    return ret;
    }    
    
// ===================================================================================================================================================================
// первичное заполнение базовых таблиц, режим многопоточный
// заполняются все таблицы, кроме продаж (кроме sales и кроме dictionary)
    
    // http://localhost:8080/insert/fill-indexed
    @GetMapping("/fill-indexed")
    public String fill_db_indexed () throws Exception {   
        
        String sInit = init_aData ();        
        DbMngr inserter = new DbMngr();
        inserter.prepare_stuff_indexed(aData, sLogDir);
        return "200 OK. " + sInit + "===== Проведена инициализация базовых таблиц индексированных баз данных "; 
    }
    
    // http://localhost:8080/insert/fill-not-indexed
    @GetMapping("/fill-not-indexed")
    public String fill_db_not_indexed () throws Exception {   
        
        String sInit = init_aData ();        
        DbMngr inserter = new DbMngr();
        inserter.prepare_stuff_not_indexed (aData, sLogDir);
        return "200 OK. " + sInit + "===== Проведена инициализация базовых таблиц НЕ индексированных баз данных "; 
    }    
    
// ===================================================================================================================================================================    
// первичное заполнение таблиц продаж (sales и dictionary), режим многопоточный
// Заполняются таблицы без суффиксов - в ранжированные суффиксами таблицы кладем руками:
//      INSERT INTO sales_01_mln                    (SELECT * FROM sales);
//      INSERT INTO order_numbers_dictionary_01_mln (SELECT * FROM order_numbers_dictionary);
// Разбил на две части для индексированных таблиц и не индексированных.
// Причина - если делать все вместе, то будет слишком много потоков, больше 20.
// При этом сам простгрес будет жрать потоки, минимум по одному потоку на соединение
// То есть, в самом удачном случае нужно будет ядер 40 на процессоре, что бы не терять на переключение контекта на потоках.
        
// ! В шарду данных вставляется меньше, чем в полноценную БД - 
// !     обратно пропорционально количеству шард. Если шард 10 - то в шарде будет в 10 раз меньше строк продаж
    
    // http://localhost:8080/insert/easy-sale-indexed
    @GetMapping("/easy-sale-indexed")
    public String easy_sale_db_indexed () throws Exception {   
        
        String sInit = init_aData ();        
        DbMngr inserter = new DbMngr();
        inserter.easy_sale_indexed(aData, sLogDir);
        return "200 OK. " + sInit + "===== Проведена первоначальная вставка в таблицу sales индексированных баз данных "; 
    }
    
    // http://localhost:8080/insert/easy-sale-not-indexed
    @GetMapping("/easy-sale-not-indexed")
    public String easy_sale_db_not_indexed () throws Exception {   
        
        String sInit = init_aData ();        
        DbMngr inserter = new DbMngr();
        inserter.easy_sale_not_indexed(aData, sLogDir);
        return "200 OK. " + sInit + "===== Проведена первоначальная вставка в таблицу sales НЕ индексированных баз данных "; 
    }
    
// ===================================================================================================================================================================    
// Все, что ниже - иммитация торговли, вставка будет отяжелена запросом. 
// Режим однопоточный    
// Перед запуском (для чистоты эксперимента) - пеерезапустить постгрес.
    
    //http://localhost:8080/insert/etalon?dbName=db__full_indexed&tableName=sales_01_mln
    //http://localhost:8080/insert/etalon?dbName=db__full_indexed&tableName=sales_02_mln
    //http://localhost:8080/insert/etalon?dbName=db__full_indexed&tableName=sales_03_mln
    //http://localhost:8080/insert/etalon?dbName=db__full_indexed&tableName=sales_04_mln
    //http://localhost:8080/insert/etalon?dbName=db__full_indexed&tableName=sales_05_mln
    //http://localhost:8080/insert/etalon?dbName=db__full_indexed&tableName=sales_06_mln
    //http://localhost:8080/insert/etalon?dbName=db__full_indexed&tableName=sales_07_mln
    //http://localhost:8080/insert/etalon?dbName=db__full_indexed&tableName=sales_08_mln
    //http://localhost:8080/insert/etalon?dbName=db__full_indexed&tableName=sales_09_mln
    //http://localhost:8080/insert/etalon?dbName=db__full_indexed&tableName=sales_10_mln	
    // не индексированные эталонные таблицы
    //http://localhost:8080/insert/etalon?dbName=db__full_not_indexed&tableName=sales_01_mln
    //http://localhost:8080/insert/etalon?dbName=db__full_not_indexed&tableName=sales_02_mln
    //http://localhost:8080/insert/etalon?dbName=db__full_not_indexed&tableName=sales_03_mln
    //http://localhost:8080/insert/etalon?dbName=db__full_not_indexed&tableName=sales_04_mln
    //http://localhost:8080/insert/etalon?dbName=db__full_not_indexed&tableName=sales_05_mln
    //http://localhost:8080/insert/etalon?dbName=db__full_not_indexed&tableName=sales_06_mln
    //http://localhost:8080/insert/etalon?dbName=db__full_not_indexed&tableName=sales_07_mln
    //http://localhost:8080/insert/etalon?dbName=db__full_not_indexed&tableName=sales_08_mln
    //http://localhost:8080/insert/etalon?dbName=db__full_not_indexed&tableName=sales_09_mln
    //http://localhost:8080/insert/etalon?dbName=db__full_not_indexed&tableName=sales_10_mln
    @GetMapping("/etalon")
    public String insert_etalon (
            @RequestParam(name = "dbName") String dbName,
            @RequestParam(name = "tableName") String tableName) throws Exception {   
        
        String sInit = init_aData ();        
        SaleEtalon inserter = new SaleEtalon();
        inserter.start(aData, sLogDir, dbName, tableName);
        return "200 OK. " + sInit + "===== Проведена вставка в базу данных " + dbName + ", таблицу " + tableName;       
    }
    
    // индексированные партицированные таблицы
    //http://localhost:8080/insert/parted?dbName=db__full_indexed&tableName=sales_01_mln
    //http://localhost:8080/insert/parted?dbName=db__full_indexed&tableName=sales_02_mln
    //http://localhost:8080/insert/parted?dbName=db__full_indexed&tableName=sales_03_mln
    //http://localhost:8080/insert/parted?dbName=db__full_indexed&tableName=sales_04_mln
    //http://localhost:8080/insert/parted?dbName=db__full_indexed&tableName=sales_05_mln
    //http://localhost:8080/insert/parted?dbName=db__full_indexed&tableName=sales_06_mln
    //http://localhost:8080/insert/parted?dbName=db__full_indexed&tableName=sales_07_mln
    //http://localhost:8080/insert/parted?dbName=db__full_indexed&tableName=sales_08_mln
    //http://localhost:8080/insert/parted?dbName=db__full_indexed&tableName=sales_09_mln
    //http://localhost:8080/insert/parted?dbName=db__full_indexed&tableName=sales_10_mln	
    // не индексированные партицированные таблицы
    //http://localhost:8080/insert/parted?dbName=db__full_not_indexed&tableName=sales_01_mln
    //http://localhost:8080/insert/parted?dbName=db__full_not_indexed&tableName=sales_02_mln
    //http://localhost:8080/insert/parted?dbName=db__full_not_indexed&tableName=sales_03_mln
    //http://localhost:8080/insert/parted?dbName=db__full_not_indexed&tableName=sales_04_mln
    //http://localhost:8080/insert/parted?dbName=db__full_not_indexed&tableName=sales_05_mln
    //http://localhost:8080/insert/parted?dbName=db__full_not_indexed&tableName=sales_06_mln
    //http://localhost:8080/insert/parted?dbName=db__full_not_indexed&tableName=sales_07_mln
    //http://localhost:8080/insert/parted?dbName=db__full_not_indexed&tableName=sales_08_mln
    //http://localhost:8080/insert/parted?dbName=db__full_not_indexed&tableName=sales_09_mln
    //http://localhost:8080/insert/parted?dbName=db__full_not_indexed&tableName=sales_10_mln
    @GetMapping("/parted")
    public String insert_parted (
            @RequestParam(name = "dbName") String dbName,
            @RequestParam(name = "tableName") String tableName) throws Exception {   
            
        String sInit = init_aData ();
        SaleParted inserter = new SaleParted();
        inserter.start(aData, sLogDir, dbName, tableName);
        return "200 OK. " + sInit + "===== Проведена вставка в базу данных " + dbName + ", секионированную таблицу " + tableName;               
    }
    
    
    // индексированные шарды   
    //http://localhost:8080/insert/shards?dbName=shard_indexed&tableName=sales_01_mln
    //http://localhost:8080/insert/shards?dbName=shard_indexed&tableName=sales_02_mln
    //http://localhost:8080/insert/shards?dbName=shard_indexed&tableName=sales_03_mln
    //http://localhost:8080/insert/shards?dbName=shard_indexed&tableName=sales_04_mln
    //http://localhost:8080/insert/shards?dbName=shard_indexed&tableName=sales_05_mln
    //http://localhost:8080/insert/shards?dbName=shard_indexed&tableName=sales_06_mln
    //http://localhost:8080/insert/shards?dbName=shard_indexed&tableName=sales_07_mln
    //http://localhost:8080/insert/shards?dbName=shard_indexed&tableName=sales_08_mln
    //http://localhost:8080/insert/shards?dbName=shard_indexed&tableName=sales_09_mln
    //http://localhost:8080/insert/shards?dbName=shard_indexed&tableName=sales_10_mln	
    // не индексированные шарды
    //http://localhost:8080/insert/shards?dbName=shard_not_indexed&tableName=sales_01_mln
    //http://localhost:8080/insert/shards?dbName=shard_not_indexed&tableName=sales_02_mln
    //http://localhost:8080/insert/shards?dbName=shard_not_indexed&tableName=sales_03_mln
    //http://localhost:8080/insert/shards?dbName=shard_not_indexed&tableName=sales_04_mln
    //http://localhost:8080/insert/shards?dbName=shard_not_indexed&tableName=sales_05_mln
    //http://localhost:8080/insert/shards?dbName=shard_not_indexed&tableName=sales_06_mln
    //http://localhost:8080/insert/shards?dbName=shard_not_indexed&tableName=sales_07_mln
    //http://localhost:8080/insert/shards?dbName=shard_not_indexed&tableName=sales_08_mln
    //http://localhost:8080/insert/shards?dbName=shard_not_indexed&tableName=sales_09_mln
    //http://localhost:8080/insert/shards?dbName=shard_not_indexed&tableName=sales_10_mln
    
    @GetMapping("/shards")
    public String insert_shards (
            @RequestParam(name = "dbName") String dbName, 
            @RequestParam(name = "tableName") String tableName) throws Exception {   
        
        String sInit = init_aData ();
        SaleShards inserter = new SaleShards();
        inserter.start(aData, sLogDir, dbName + "__", tableName);
        return "200 OK. " + sInit + "===== Проведена вставка в шарды, таблицу " + tableName;       
    }    
}