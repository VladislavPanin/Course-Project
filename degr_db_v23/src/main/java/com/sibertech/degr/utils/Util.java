package com.sibertech.degr.utils;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;

public class Util {

    public static LocalDateTime _now_date() {        
        LocalDateTime ldt = LocalDateTime.now();
        return ldt;
    }
    
    public static LocalDateTime _now_date_without_mls() {  
        
        LocalDateTime 
        ldt = Util._now_date();
        ldt = ldt.truncatedTo(ChronoUnit.SECONDS);
        
        return ldt;
    }

    public static java.sql.Date _now_dateSQL() {        
        LocalDateTime ldt = _now_date();
        java.sql.Date sqlDate = java.sql.Date.valueOf(ldt.toLocalDate());        
        return sqlDate;
    }
    //----------------------------------------------------------
    public static String _nowStr_dateTime() {        
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        String str = _nowStr (formatter);
        return str;
    }
    public static String _nowStr_dateTime_forDirPath() {        
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd_HH-mm");
        String str = _nowStr (formatter);
        return str;
    }
    public static String _nowStr_dateOnly() {        
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String str = _nowStr (formatter);
        return str;
    }
    
    public static String _nowStr (DateTimeFormatter formatter) {        
        LocalDateTime dateTime = _now_date();
        String str = dateTime.format(formatter);         
        return str;
    }
    //----------------------------------------------------------
    
    public String _dateSQL_toStrDate(java.sql.Date sqlDate) {
        SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy");        
        String str = sdf.format(sqlDate);         
        return str;
    }
    
    public String _dateSQL_toStrDateTime(java.sql.Date sqlDate) {
        SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy HH:mm");
        String str = sdf.format(sqlDate);         
        return str;
    }
    
    public String _date_toStrDate(LocalDateTime ldt) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String str = ldt.format(formatter);  
        return str;
    }
    
    public String _date_toStrDateTime(LocalDateTime ldt) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        String str = ldt.format(formatter);  
        return str;
    }
    //----------------------------------------------------------        
}
