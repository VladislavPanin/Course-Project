package com.sibertech.degr.db;

import java.util.ArrayList;

public class ConfSQLSchema { 
    
    public static final ArrayList<String> TABLE_NAMES = 
            new ArrayList<>() {{
                add ("clients");
                add ("products");
                add ("regions");
                add ("markets");
                add ("product_return");                
                add ("terminals");
                add ("sales_fix");	
                add ("order_numbers_dictionary_fix"); }};
                                           
   public static final String CREATE_CLIENTS = """
    CREATE TABLE clients (
        id               SERIAL NOT NULL,
        region_id        integer,
        name             character varying(128),
        surname          character varying(128),
        second_name      character varying(128),
        birthdate        character varying(1024),
        count_of_bonuses bigint,	
        comment          character varying(1024)    
    );""";

    public static final String CREATE_PRODUCTS = """
    CREATE TABLE products (
        id                SERIAL NOT NULL,
        product_name      character varying(128),
        cost              integer,
        count_of_product  integer,
        delivery_datetime time without time zone,
        comment           character varying(1024)    
    );""";

    public static final String CREATE_REGIONS = """
    CREATE TABLE regions (
        id 			SERIAL NOT NULL,
        region_name character varying(128),
        comment     character varying(1024)
    );""";
    
    public static final String CREATE_MARKETS = """
    CREATE TABLE markets (
        id                  SERIAL NOT NULL,
        region_id           integer,
        market_id_on_region integer NOT NULL,	
        market_name         character varying(128),    
        comment             character varying(1024)
    );""";

    public static final String CREATE_TERMINALS = """
    CREATE TABLE terminals (
        id                    SERIAL NOT NULL,
        terminal_id_on_market integer,
        market_id             integer,
        region_id             integer,
        comment               character varying(1024)    
    );""";

    public static final String CREATE_ORDER_NUMBERS_DICTIONARY = """
    CREATE TABLE order_numbers_dictionary_fix (
        order_number           BIGSERIAL NOT NULL,
        region_id              integer,
        market_id              integer,
        terminal_id            integer,
        terminal_basket_number bigint,
        basket_price           integer,
        order_time             time without time zone,
        order_date             date,
        comment                character varying(1024)
    );""";

    public static final String CREATE_SALES = """
    CREATE TABLE sales_fix (
        id                   BIGSERIAL NOT NULL,
        order_number         bigint NOT NULL,
        line_number_in_order integer,
        region_id            integer,
        market_id            integer,
        terminal_id          integer,
        product_id           integer,
        count_of_product     integer,
        price_of_one_piece   integer,
        order_time           time with time zone,
        order_date           date,
        client_id            integer,	
        comment              character varying(1024)    
    );""";

    public static final String CREATE_PRODUCT_RETURN = """
    CREATE TABLE product_return (
        id                     BIGSERIAL NOT NULL,
        product_id             integer,
        cost                   integer,
        date                   date,
        order_time             timestamp without time zone,
        return_time            timestamp without time zone,
        region_id              integer,
        market_id              integer,
        terminal_id            integer,
        order_number           bigint,
        terminal_basket_number integer,
        comment                character varying(1024)
    );""";

    public static final String ALTER_CLIENTS        = "ALTER TABLE clients        OWNER TO postgres;";
    public static final String ALTER_MARKETS        = "ALTER TABLE markets        OWNER TO postgres;";
    public static final String ALTER_DICTIONARY     = "ALTER TABLE order_numbers_dictionary_fix OWNER TO postgres;";
    public static final String ALTER_PRODUCT_RETURN = "ALTER TABLE product_return OWNER TO postgres;";
    public static final String ALTER_PRODUCTS       = "ALTER TABLE products       OWNER TO postgres;";
    public static final String ALTER_REGIONS        = "ALTER TABLE regions        OWNER TO postgres;";
    public static final String ALTER_SALES          = "ALTER TABLE sales_fix      OWNER TO postgres;";
    public static final String ALTER_TERMINALS      = "ALTER TABLE terminals      OWNER TO postgres;";    
}
