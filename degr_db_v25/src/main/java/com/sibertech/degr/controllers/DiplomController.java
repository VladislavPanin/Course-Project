package com.sibertech.degr.controllers;

import com.sibertech.degr.controllers.support.ConfigRequester;
import com.sibertech.degr.DTO.AllData;
import com.sibertech.degr.controllers.support.ConfDiplom;
import com.sibertech.degr.db.fill.BaseFiller;
import com.sibertech.degr.inserter.DbMngr;
import com.sibertech.degr.utils.Util;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
/*
INSERT INTO 
  order_numbers_dictionary_parted_01_mln(
  order_number, region_id, market_id, terminal_id, terminal_basket_number, basket_price, order_time, order_date, comment) 
(SELECT 
  order_number+100000, region_id, market_id, terminal_id, terminal_basket_number, basket_price, order_time, order_date, comment FROM order_numbers_dictionary)
  
  
INSERT INTO 
  sales_parted_01_mln(  
  order_number, line_number_in_order, region_id, market_id, terminal_id, product_id, count_of_product, price_of_one_piece, order_date, client_id, comment)
(SELECT   
  order_number+1000000, line_number_in_order, region_id, market_id, terminal_id, product_id, count_of_product, price_of_one_piece, order_date, client_id, comment FROM sales)
*/


@RestController
@RequestMapping("/insert")
public class DiplomController {

    protected AllData aData = null;
    protected String  sLogRootDir = "../__LOG-diplom-experiment/";
    protected String  sLogDir = null;
    
    public static ConfDiplom confDiplom = null;

    
    
    public String init_aData () throws Exception {   
        
                                           /*******************************************************************************************************************************************************************************/
        BaseFiller.setBREAK_AFTER_COUNT   (1000000); // остановится после количества вставок=BREAK_AFTER_COUNT, если раньше не исчерпается наюор корзин для региона (AllData::regionsMapMap)
        BaseFiller.setINSERT_STEP_COUNTER (  100); //Количество шагов цикла, после которого будем выводить в лог таймаут каунтер (количество потери соеденения с базой) (количество отвалов по таймаутлоку)
        BaseFiller.setMEASURE_INSERT_LIMIT( 100000); // количество вставок для замера на точку графика. INSERT_STEP_COUNTER должен быть меньше MEASURE_INSERT_LIMIT
                                           /*******************************************************************************************************************************************************************************/
                
                    String ret = "";
                    if (aData != null) 
                        return  "===== Набор корзин уже сгенерирован\n";
                        
                    String start = Util._nowStr_dateTime_forDirPath();
                    sLogDir = sLogRootDir + start + "/";
                   
                    aData = new AllData();
                    aData.generate (); 
                    
                    confDiplom = new ConfDiplom();
                    ConfDiplom.THREAD_COUNT_ON_STATION = 4;
                    ConfDiplom.THREAD_COUNT_ON_LAPTOP = 2;
                    ConfDiplom.TABLE_NAME = "sales_01_mln";
                    ConfDiplom.DB_NAME = "1_diplom_test_1_indexed";
                    
                    confDiplom.init();
                    
                    return  "===== Набор корзин сгенерирован. Параметры проведения дипломной работы инициализированны\n";

                    
                   
    }    
    
// ===================================================================================================================================================================
// первичное заполнение базовых таблиц
// заполняются все таблицы, кроме продаж (кроме sales и кроме dictionary)
    
 
    // эта команда запросить на станции (с ноутбука) конфиг диплом
    //То есть будет сделан программный вызов URL: http://192.168.0.13:8080/get-conf
    @GetMapping("/go-for-config")
    public void goForConfig (@RequestParam(name = "fullDbName") String fullDbName) throws Exception { 
        
        
        String sInit = init_aData ();        
        ConfigRequester configRequester = new ConfigRequester();
        confDiplom = configRequester.askConfig(); 
    }
    
  //http://192.168.0.13:8080/get-config
    @GetMapping("/get-config")
    public ConfDiplom getConfig (@RequestParam(name = "fullDbName") String fullDbName) throws Exception { 
        
        
        String sInit = init_aData ();        
        //Здесь мы должны вернуть объект confDiplom
        // В этом методе контроллера мы отправляем конфигурацию по запросу экземпляра этой же программы на другом компьютере. Вызвать этот метод будем программно
        return confDiplom;  
    }
    
 // http://localhost:8080/insert/fill-stuff-all
    @GetMapping("/fill-stuff-all")
    public String fill_stuff_all () throws Exception {   
        
        String sInit = init_aData ();        
        DbMngr mngr = new DbMngr();
        mngr.prepare_stuff_all(aData, sLogDir);
        return "200 OK. " + sInit + "===== Проведена инициализация базовых таблиц ВСЕХ БД "; 
    }
    
// http://localhost:8080/insert/delete-all-data-from-tables
    @GetMapping("/delete-all-data-from-tables")
    public String delete_all_data_from_tables () throws Exception {   
        
        String sInit = init_aData ();        
        DbMngr mngr = new DbMngr();
        mngr.delete_all_data_from_tables(sLogDir);
        return "200 OK. " + sInit + "===== проведено УДАЛЕНИЕ данных ВСЕХ таблиц ВСЕХ БД "; 
    }
// ===================================================================================================================================================================    
    

 // =================================================================================================================================================================== 
}