package com.sibertech.degr.DTO;

import lombok.Data;

@Data
public class Client {
    
    protected Integer client_id;
    protected Integer region_id;    
    
    protected String name;
    protected String surname;
    protected String secondName;
    protected Integer countOfBonuses;
    protected String birthdate;

    public Client(Integer client_id, Integer region_id)
    {
        this.client_id = client_id;
        this.region_id = region_id;
        
        this.name = "name_" + client_id;
        this. surname = "surname_" + client_id;
        this.secondName = "secondName_" + client_id;
        this.countOfBonuses = 0;
        
        if(client_id % 31 == 0) {
            this.birthdate = "15.10.2000";
        } else if (client_id % 17 == 0) {
            this.birthdate = "15.06.1986";
        } else if (client_id % 13 == 0) {
            this.birthdate = "13.12.1998";
        } else if (client_id % 7 == 0) {
            this.birthdate = "30.11.1987";
        } else if (client_id % 3 == 0) {
            this.birthdate = "02.01.2002";
        } else if (client_id % 2 == 0) {
            this.birthdate = "01.03.2005";
        } else{
            this.birthdate = "08.05.1977";
        }
    }
}
