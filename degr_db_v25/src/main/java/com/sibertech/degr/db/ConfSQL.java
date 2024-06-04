package com.sibertech.degr.db;

public class ConfSQL {    
                            
    public static final String DROP_DB = "DROP DATABASE %s;";   
    public static final String DELETE_FROM_TABLE = "DELETE FROM %s;";
    public static final String START_TRANSACTION = "BEGIN";
    public static final String COMMIT_TRANSACTION = "COMMIT";
    public static final String ROLLBACK_TRANSACTION = "ROLLBACK";
    public static final String LOCK_TABLES_FOR_INSERT = "LOCK TABLE clients, order_numbers_dictionary_fix, product_return, sales_fix";

    public static final String INSERT_REGIONS   = "INSERT INTO regions(id, region_name, comment) VALUES (?, ?, ?);";    
    public static final String INSERT_PRODUCTS  = "INSERT INTO products(id, product_name, cost, count_of_product, delivery_datetime, comment, loyality_id) VALUES (?, ?, ?, ?, ?, ?, ?);";    
    public static final String INSERT_CLIENTS   = "INSERT INTO clients(id, region_id, name, surname, second_name, birthdate, count_of_bonuses, comment)VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
    public static final String INSERT_MARKETS   = "INSERT INTO markets(id, region_id, market_id_on_region, market_name, comment) VALUES (?, ?, ?, ?, ?);";    
    public static final String INSERT_TERMINALS = "INSERT INTO terminals(id, terminal_id_on_market, market_id, region_id, comment) VALUES (?, ?, ?, ?, ?);";
    
    public static final String INSERT_LOYALITY = "INSERT INTO loyality(id, loyality_programm_name, region_id, product_category, coefficient) VALUES (?, ?, ?, ?, ?)";
    
    public static final String INSERT_SALE           = "INSERT INTO sales_fix (order_number, line_number_in_order, region_id, market_id, terminal_id, product_id, count_of_product, price_of_one_piece, order_date, client_id, comment) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) RETURNING id;";
    public static final String INSERT_PRODUCT_RETURN = "INSERT INTO product_return (product_id, cost, date, time, region_id, market_id, terminal_id, order_number, terminal_basket_number) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";
    public static final String INSERT_BASKET_KEY     = "INSERT INTO order_numbers_dictionary_fix (terminal_basket_number, region_id, market_id, terminal_id, basket_price, order_time, order_date, comment) VALUES (?, ?, ?, ?, ?, ?, ?, ?) RETURNING order_number;";
    public static final String INSERT_BASKET_RETURN  = "INSERT INTO order_numbers_dictionary_fix (terminal_basket_number, region_id, market_id, terminal_id, basket_price, order_time, order_date, comment) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    
    public static final String UPDATE_PRODUCT_COUNT  = "UPDATE sales_fix   SET count_of_product = ?  WHERE order_number = ? AND product_id = ?;";
    public static final String UPDATE_BONUSES        = "UPDATE clients SET count_of_bonuses = (SELECT SUM(price_of_one_piece*count_of_product/2000) AS bonus FROM sales_fix WHERE client_id = ?) WHERE id = ?;";
    
    public static final String SELECT_ORDER_NUMBER   = "SELECT order_number FROM order_numbers_dictionary_fix WHERE region_id = ? AND market_id = ? AND terminal_id = ? AND terminal_basket_number= ? AND order_time = ? AND order_date= ?;";    
    public static final String SELECT_SALE_INFO      = "SELECT count_of_product, price_of_one_piece FROM sales_fix WHERE order_number = ? AND product_id = ?;";
    
    public static final String DELETE_PRODUCT_FROM_SALES = "DELETE FROM sales_fix WHERE order_number=? AND product_id=?;";
    
}