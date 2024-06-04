package com.sibertech.degr.DTO;

import lombok.Data;
import java.sql.Timestamp;

@Data
public class Product {
    int id;
    String productName;
    int countOfProduct;
    Timestamp datetime;
    int cost;
    public Product(int id, String name, int count, Timestamp datetime, int cost){
        this.id = id;
        this.productName = name;
        this.countOfProduct = count;
        this.datetime = datetime;
        this.cost = cost;
    }
}
