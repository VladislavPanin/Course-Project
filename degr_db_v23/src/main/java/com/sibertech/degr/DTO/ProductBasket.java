package com.sibertech.degr.DTO;

import java.sql.Date;
import java.sql.Timestamp;
import lombok.Data;

import java.util.HashMap;
import java.util.Map;

public class ProductBasket {
    Map<Integer, Product> basket = new HashMap<>();
    Integer client_id; // идентефикатор пользователя в программе лояльности.
    Integer terminal_id;
    Integer terminal_basket_number; //Порядковый номер чека, на конкретном терминале
    Integer region_id;
    Integer market_id;
    java.sql.Timestamp saleTimestamp = null; //Это поле будет использоваться при инсерте в таблицу. При начальной инициализации/генерации это поле не используется
    java.sql.Date saleDate = null; //Это поле будет использоваться при инсерте в таблицу. При начальной инициализации/генерации это поле не используется
    Integer basket_price = null; //Это поле будет использоваться при инсерте в таблицу. При начальной инициализации/генерации это поле не используется
    public ProductBasket(){

    }
    public void addProduct(Product product){
        Integer id = basket.size()+1;
        basket.put(id,product);
    }

    public Map<Integer, Product> getBasket() {
        return basket;
    }

    public Integer getClient_id() {
        return client_id;
    }

    public Integer getTerminal_id() {
        return terminal_id;
    }

    public Integer getTerminal_basket_number() {
        return terminal_basket_number;
    }

    public Integer getRegion_id() {
        return region_id;
    }

    public Integer getMarket_id() {
        return market_id;
    }

    public Timestamp getSaleTimestamp() {
        return saleTimestamp;
    }

    public Date getSaleDate() {
        return saleDate;
    }

    public Integer getBasket_price() {
        return basket_price;
    }

    public void setBasket(Map<Integer, Product> basket) {
        this.basket = basket;
    }

    public void setClient_id(Integer client_id) {
        this.client_id = client_id;
    }

    public void setTerminal_id(Integer terminal_id) {
        this.terminal_id = terminal_id;
    }

    public void setTerminal_basket_number(Integer terminal_basket_number) {
        this.terminal_basket_number = terminal_basket_number;
    }

    public void setRegion_id(Integer region_id) {
        this.region_id = region_id;
    }

    public void setMarket_id(Integer market_id) {
        this.market_id = market_id;
    }

    public void setSaleTimestamp(Timestamp saleTimestamp) {
        this.saleTimestamp = saleTimestamp;
    }

    public void setSaleDate(Date saleDate) {
        this.saleDate = saleDate;
    }

    public void setBasket_price(Integer basket_price) {
        this.basket_price = basket_price;
    }
    
    
}
