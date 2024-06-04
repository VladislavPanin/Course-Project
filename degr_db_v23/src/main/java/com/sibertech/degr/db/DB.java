package com.sibertech.degr.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DB {
    
    protected Connection conn = null;    

    protected void init (String db_url, String db_user, String db_passw) throws SQLException, ClassNotFoundException {
         if (conn != null)
             conn.close();
         
        Class.forName(ConfJDBC.DB_JDBC_DRIVER);
        conn = DriverManager.getConnection(db_url, db_user, db_passw);
    }
    
    protected void close() throws SQLException {
         if (conn != null)
             conn.close();
         conn = null;
    }
}