package com.sibertech.degr.db.fill;

import com.sibertech.degr.DTO.Client;
import com.sibertech.degr.db.ConfSQL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Map;

public class ClientsFiller extends BaseFiller{
    
    int lineCount = 0;
    Connection conn = null; 
    
    public ClientsFiller (Connection conn) {
        this. conn = conn;
    }
    
     //Должны быть вставленны за регионами
    public void insert (Map<Integer, Client> clientMap, String dbName) throws SQLException {         
    
        this.printStart ("clients", dbName);
        
        Client client;        
        try (PreparedStatement preparedStatement = conn.prepareStatement(ConfSQL.INSERT_CLIENTS)) {

            for(Map.Entry<Integer,Client> entry : clientMap.entrySet()) {
                client = entry.getValue();

                preparedStatement.setInt   (1, client.getClient_id());
                preparedStatement.setInt   (2, client.getRegion_id());
                preparedStatement.setString(3, client.getName());
                preparedStatement.setString(4, client.getSurname());
                preparedStatement.setString(5, client.getSecondName());
                preparedStatement.setString(6, client.getBirthdate());
                preparedStatement.setInt   (7, client.getCountOfBonuses());
                preparedStatement.setString(8, "some comment for Client #" + entry.getKey());

                preparedStatement.execute();
                lineCount++;
            }
        }
        
        this.printEnd ("clients", dbName, lineCount);        
    }    
}
