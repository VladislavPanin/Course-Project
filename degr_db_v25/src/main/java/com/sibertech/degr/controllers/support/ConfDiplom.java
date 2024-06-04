/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.sibertech.degr.controllers.support;

/**
 *
 * @author vladi
 */
public class ConfDiplom {
    public static int    THREAD_COUNT_ON_STATION = -1;
    public static int    THREAD_COUNT_ON_LAPTOP = -1;
    public static int    LOCK_TIMEOUT_MLNS = -1; //лог таймаут постгресса в милисекундах
    public static String TABLE_NAME = "";
    public static String DB_NAME = "";

    void init() {
        //первое что нам нужно сделать это запустить консольную команду psql и взять лог таймаут параметром.
        
    }
    
}
