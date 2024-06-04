package com.sibertech.degr.DTO.gen;

import com.sibertech.degr.DTO.Client;
import com.sibertech.degr.db.Conf;
import com.sibertech.degr.db.ConfJDBC;

import java.util.HashMap;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class GenClients {
    
    Logger logGen = LoggerFactory.getLogger(GenProducts.class);    
    long deltaTime, runnerTime, startTime;        
    
    public Map<Integer, Client> create(){
        
        startTime = System.currentTimeMillis();
        int iClient = 1;
        Map<Integer, Client> clients = new HashMap<>();
        
        printStart ();
        for (int iRegion = 1; iRegion <= Conf.REGIONS_COUNT; iRegion++) {            
            for (int iMarket = 1; iMarket <= Conf.MARKET_COUNT_IN_REGION; iMarket++) {
                for (int iTerminal = 1; iTerminal <= Conf.TERMINAL_COUNT_IN_MARKET; iTerminal++) {
                    for (int iBasket = 1; iBasket <= Conf.COUNT_OF_BASKET_ON_TERMINAL_FOR_GENERATOR; iBasket++) {
                        Client client = new  Client(iClient, iRegion);
                        clients.put(iClient, client);
                        iClient++;
                    }
                }
            }
        }
        printEnd (clients.size());
        return clients;
    }    
    
    protected void printStart () {
        logGen.warn(String.format("%s ############################################################################################################################################ ", ConfJDBC.LOG_PEFIX));
        logGen.warn(String.format("%s Начинается генерация клиентов", ConfJDBC.LOG_PEFIX));        
    }
    
    protected void printEnd (int client_count) {
        runnerTime = System.currentTimeMillis();
        deltaTime = runnerTime - startTime;  
        logGen.warn(String.format("%s :::::::: Генерация клиентов завершена, количество сгенерированных %s. Время генерации %d миллисекунд", ConfJDBC.LOG_PEFIX, client_count, deltaTime));            
    }
}
