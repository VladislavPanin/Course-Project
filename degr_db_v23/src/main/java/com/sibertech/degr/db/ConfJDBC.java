package com.sibertech.degr.db;

public class ConfJDBC {   
    public static final String DB_JDBC_DRIVER = "org.postgresql.Driver";
    
    // база данных для подключения как пользователь postgres, что бы 1) точно подключится 2) иметь права на создание баз данных
    public static final String POSTGRES_DB_URL = "jdbc:postgresql://localhost:5432/postgres";        
    public static final String POSTGRES_DB_USER = "postgres";
    public static final String POSTGRES_DB_PASSWORD = "postgres";
    
    // а этот урл - для подключения к другим БД. Их имена добавляем в конец
    public static final String BASE_DATABASE_URL = "jdbc:postgresql://localhost:5432/"; 
    
    public static final String LOG_PEFIX        = " ============";
    public static final String LOG_SPLIT        = LOG_PEFIX + " ------------------------------------------------------------------------------------------------------------------------------------------------------------";
    public static final String LOG_PEFIX_ERR    = " ============ --- !!    <ERROR>:      ";
    public static final String LOG_PEFIX_EXCEPT = " ============ --- !!    <EXCEPTION>:  ";
}
