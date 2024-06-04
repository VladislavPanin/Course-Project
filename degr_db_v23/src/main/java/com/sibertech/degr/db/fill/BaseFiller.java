package com.sibertech.degr.db.fill;

import com.sibertech.degr.db.ConfJDBC;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class BaseFiller {
    
    // устанавливается в контроллере ProcController::init_aData()
    protected static int BREAK_AFTER_COUNT = -1; // остановится после количества вставок=BREAK_AFTER_COUNT, если раньше не исчерпается наюор корзин для региона (AllData::regionsMapMap)
    protected static int INSERT_STEP_COUNTER =-1; //Количество шагов цикла, после которого будем выводить в лог таймаут каунтер (количество потери соеденения с базой) (количество отвалов по таймаутлоку)

    public static int  getBREAK_AFTER_COUNT   ()                        {return BREAK_AFTER_COUNT;}
    public static void setBREAK_AFTER_COUNT   (int break_after_count)   {BaseFiller.BREAK_AFTER_COUNT = break_after_count;}
    public static int  getINSERT_STEP_COUNTER ()                        {return INSERT_STEP_COUNTER;}
    public static void setINSERT_STEP_COUNTER (int insert_step_counter) {BaseFiller.INSERT_STEP_COUNTER = insert_step_counter;}
        
    protected long startTimeForAllRecords = 0L; 
    protected long endTimeForAllRecords = 0L;     
    protected long startTimeInterval_forInsert = 0L; //System.currentTimeMillis();
    protected long endTimeInterval_forInsert = 0L; //System.currentTimeMillis(); 
    
    protected int countOfInsertedLinesIntoSales = 0; 
    
    protected Logger logback = LoggerFactory.getLogger(BaseFiller.class);
    
    protected long startTime = 0L; //System.currentTimeMillis();
    protected long endTime = 0L; //System.currentTimeMillis();
    
    public void printStart (String table, String db)
    {
        startTime = System.currentTimeMillis();
        logback.warn(ConfJDBC.LOG_PEFIX);
        logback.warn(String.format("%s :::::::::: Начата    вставка в таблицу -- %30s :: %-10s --", ConfJDBC.LOG_PEFIX, db, table));
    }
    
    public void printEnd (String table, String db, int lineCount)
    {
        endTime = System.currentTimeMillis();
        logback.warn(String.format("%s :::::::::: Закончена вставка в таблицу -- %30s :: %-10s --. Количество вставленных строк %s. Время вставки %d миллисекунд", ConfJDBC.LOG_PEFIX, db, table, lineCount, endTime - startTime));
    }    
}
