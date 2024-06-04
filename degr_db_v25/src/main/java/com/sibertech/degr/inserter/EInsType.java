package com.sibertech.degr.inserter;

public enum EInsType {
    
    DELETE_ALL_DATA ("delete_all_data"),
    STUFF_INSERT ("stuff"),
    EASY_INSERT ("easy"),
    HARD_INSERT ("hard");
    
    String typeOfInsert;
            
    EInsType (String typeOfInsert)    
    {
        this.typeOfInsert = typeOfInsert;
    }
    
    public String to_s() {
        return typeOfInsert;
    }
}
