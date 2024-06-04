package com.sibertech.degr.db;

public class Conf {
   // public static final int CLIENT_COUNT = 100001;
    private static int CLIENT_COUNT = 100000; //Не инициализированно. Значение будет установленно ProductBasketGenerator.create()
    public static int get_CLIENT_COUNT(){
        return CLIENT_COUNT;
    }
 public static void set_CLIENT_COUNT(int client_count){ //сначала используем CLIENT_COUNT для создания клиентов, а потом переназначаем его и используем для ProductBasketGenerator
   CLIENT_COUNT = client_count;
 }
    public static int client_count_inc(){
        CLIENT_COUNT++;
        return CLIENT_COUNT;
    }
    
    // для shard нужно столько же прогонов, сколько и для etalon-а. В shard-е будет меньше данных, потому что вставляются корзины только одного региона
    // в сгенерированном списке корзин 1 миллион записей в таблицу sales_fix
    // параметр COUNT_OF_REPETITIONS_INSERT_OF_LIST_PREPARED_BACKET_ON_GEN_FILL_STEP сейчас определяет, слько миллионов будет вставлено
    
    public static final int MAX_COST_OF_PRODUCT = 9000;
    public static final int MARKET_COUNT_IN_REGION = 10;
    public static final int REGIONS_COUNT = 10;
    public static final int MAX_EACH_PRODUCT_QUANTITY_ON_STORE = 100000; // максимальное количество штук одного товара
    public static final int PRODUCT_COUNT_ON_STORE = 10000; // количество различных товаров на складе
    public static final int TERMINAL_COUNT_IN_MARKET = 10;
    public static final int COUNT_OF_BASKET_ON_TERMINAL_FOR_GENERATOR = 10; // если 10 корзин на терминал, то всего корзин 100.000
    public static final int COUNT_PRODUCTS_ON_BASKET = 10;
    public static final int COUNT_PRODUCT_PIECES_ON_BASKET = 10;

}
