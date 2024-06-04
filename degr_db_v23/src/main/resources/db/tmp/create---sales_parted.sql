
-- Table: public.sales

-- DROP TABLE IF EXISTS public.sales;

CREATE TABLE sales_parted_01_mln
(
    id BIGSERIAL, order_number bigint NOT NULL,line_number_in_order integer,region_id integer,market_id integer,terminal_id integer,product_id integer,count_of_product integer,price_of_one_piece integer,order_date date NOT NULL,client_id integer,comment character varying(1024) COLLATE pg_catalog."default",
    CONSTRAINT sales_parted_01_mln_pkey PRIMARY KEY (id, order_date),CONSTRAINT sales_parted_01_mln_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.clients (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,CONSTRAINT sales_parted_01_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,CONSTRAINT sales_parted_01_mln_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,CONSTRAINT sales_parted_01_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,CONSTRAINT sales_parted_01_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION) PARTITION BY RANGE (order_date);

CREATE TABLE sales_parted_01_mln_2023_01_01 PARTITION OF public.sales_parted_01_mln FOR VALUES FROM ('2023-01-01') TO ('2023-01-02');
CREATE TABLE sales_parted_01_mln_2023_01_02 PARTITION OF public.sales_parted_01_mln FOR VALUES FROM ('2023-01-02') TO ('2023-01-03');
CREATE TABLE sales_parted_01_mln_2023_01_03 PARTITION OF public.sales_parted_01_mln FOR VALUES FROM ('2023-01-03') TO ('2023-01-04');
CREATE TABLE sales_parted_01_mln_2023_01_04 PARTITION OF public.sales_parted_01_mln FOR VALUES FROM ('2023-01-04') TO ('2023-01-05');
CREATE TABLE sales_parted_01_mln_2023_01_05 PARTITION OF public.sales_parted_01_mln FOR VALUES FROM ('2023-01-05') TO ('2023-01-06');
CREATE TABLE sales_parted_01_mln_2023_01_06 PARTITION OF public.sales_parted_01_mln FOR VALUES FROM ('2023-01-06') TO ('2023-01-07');
CREATE TABLE sales_parted_01_mln_2023_01_07 PARTITION OF public.sales_parted_01_mln FOR VALUES FROM ('2023-01-07') TO ('2023-01-08');
CREATE TABLE sales_parted_01_mln_2023_01_08 PARTITION OF public.sales_parted_01_mln FOR VALUES FROM ('2023-01-08') TO ('2023-01-09');
CREATE TABLE sales_parted_01_mln_2023_01_09 PARTITION OF public.sales_parted_01_mln FOR VALUES FROM ('2023-01-09') TO ('2023-01-10');
CREATE TABLE sales_parted_01_mln_2023_01_10 PARTITION OF public.sales_parted_01_mln FOR VALUES FROM ('2023-01-10') TO ('2023-01-11');
CREATE TABLE sales_parted_01_mln_2023_01_11 PARTITION OF public.sales_parted_01_mln FOR VALUES FROM ('2023-01-11') TO ('2023-01-12');


CREATE TABLE IF NOT EXISTS sales_parted_02_mln
(
    id BIGSERIAL, order_number bigint NOT NULL,line_number_in_order integer,region_id integer,market_id integer,terminal_id integer,product_id integer,count_of_product integer,price_of_one_piece integer,order_date date NOT NULL,client_id integer,comment character varying(1024) COLLATE pg_catalog."default",
    CONSTRAINT sales_parted_02_mln_pkey PRIMARY KEY (id, order_date),CONSTRAINT sales_parted_02_mln_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.clients (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,CONSTRAINT sales_parted_02_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,CONSTRAINT sales_parted_02_mln_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,CONSTRAINT sales_parted_02_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,CONSTRAINT sales_parted_02_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION) PARTITION BY RANGE (order_date);
	
CREATE TABLE sales_parted_02_mln_2023_01_01 PARTITION OF public.sales_parted_02_mln FOR VALUES FROM ('2023-01-01') TO ('2023-01-02');
CREATE TABLE sales_parted_02_mln_2023_01_02 PARTITION OF public.sales_parted_02_mln FOR VALUES FROM ('2023-01-02') TO ('2023-01-03');
CREATE TABLE sales_parted_02_mln_2023_01_03 PARTITION OF public.sales_parted_02_mln FOR VALUES FROM ('2023-01-03') TO ('2023-01-04');
CREATE TABLE sales_parted_02_mln_2023_01_04 PARTITION OF public.sales_parted_02_mln FOR VALUES FROM ('2023-01-04') TO ('2023-01-05');
CREATE TABLE sales_parted_02_mln_2023_01_05 PARTITION OF public.sales_parted_02_mln FOR VALUES FROM ('2023-01-05') TO ('2023-01-06');
CREATE TABLE sales_parted_02_mln_2023_01_06 PARTITION OF public.sales_parted_02_mln FOR VALUES FROM ('2023-01-06') TO ('2023-01-07');
CREATE TABLE sales_parted_02_mln_2023_01_07 PARTITION OF public.sales_parted_02_mln FOR VALUES FROM ('2023-01-07') TO ('2023-01-08');
CREATE TABLE sales_parted_02_mln_2023_01_08 PARTITION OF public.sales_parted_02_mln FOR VALUES FROM ('2023-01-08') TO ('2023-01-09');
CREATE TABLE sales_parted_02_mln_2023_01_09 PARTITION OF public.sales_parted_02_mln FOR VALUES FROM ('2023-01-09') TO ('2023-01-10');
CREATE TABLE sales_parted_02_mln_2023_01_10 PARTITION OF public.sales_parted_02_mln FOR VALUES FROM ('2023-01-10') TO ('2023-01-11');
CREATE TABLE sales_parted_02_mln_2023_01_11 PARTITION OF public.sales_parted_02_mln FOR VALUES FROM ('2023-01-11') TO ('2023-01-12');

CREATE TABLE IF NOT EXISTS sales_parted_03_mln
(
    id BIGSERIAL, order_number bigint NOT NULL,line_number_in_order integer,region_id integer,market_id integer,terminal_id integer,product_id integer,count_of_product integer,price_of_one_piece integer,order_date date NOT NULL,client_id integer,comment character varying(1024) COLLATE pg_catalog."default",
    CONSTRAINT sales_parted_03_mln_pkey PRIMARY KEY (id, order_date),CONSTRAINT sales_parted_03_mln_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.clients (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,CONSTRAINT sales_parted_03_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,CONSTRAINT sales_parted_03_mln_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,CONSTRAINT sales_parted_03_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,CONSTRAINT sales_parted_03_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION) PARTITION BY RANGE (order_date);

CREATE TABLE sales_parted_03_mln_2023_01_01 PARTITION OF public.sales_parted_03_mln FOR VALUES FROM ('2023-01-01') TO ('2023-01-02');
CREATE TABLE sales_parted_03_mln_2023_01_02 PARTITION OF public.sales_parted_03_mln FOR VALUES FROM ('2023-01-02') TO ('2023-01-03');
CREATE TABLE sales_parted_03_mln_2023_01_03 PARTITION OF public.sales_parted_03_mln FOR VALUES FROM ('2023-01-03') TO ('2023-01-04');
CREATE TABLE sales_parted_03_mln_2023_01_04 PARTITION OF public.sales_parted_03_mln FOR VALUES FROM ('2023-01-04') TO ('2023-01-05');
CREATE TABLE sales_parted_03_mln_2023_01_05 PARTITION OF public.sales_parted_03_mln FOR VALUES FROM ('2023-01-05') TO ('2023-01-06');
CREATE TABLE sales_parted_03_mln_2023_01_06 PARTITION OF public.sales_parted_03_mln FOR VALUES FROM ('2023-01-06') TO ('2023-01-07');
CREATE TABLE sales_parted_03_mln_2023_01_07 PARTITION OF public.sales_parted_03_mln FOR VALUES FROM ('2023-01-07') TO ('2023-01-08');
CREATE TABLE sales_parted_03_mln_2023_01_08 PARTITION OF public.sales_parted_03_mln FOR VALUES FROM ('2023-01-08') TO ('2023-01-09');
CREATE TABLE sales_parted_03_mln_2023_01_09 PARTITION OF public.sales_parted_03_mln FOR VALUES FROM ('2023-01-09') TO ('2023-01-10');
CREATE TABLE sales_parted_03_mln_2023_01_10 PARTITION OF public.sales_parted_03_mln FOR VALUES FROM ('2023-01-10') TO ('2023-01-11');
CREATE TABLE sales_parted_03_mln_2023_01_11 PARTITION OF public.sales_parted_03_mln FOR VALUES FROM ('2023-01-11') TO ('2023-01-12');


CREATE TABLE sales_parted_04_mln
(
    id BIGSERIAL, order_number bigint NOT NULL,line_number_in_order integer,region_id integer,market_id integer,terminal_id integer,product_id integer,count_of_product integer,price_of_one_piece integer,order_date date NOT NULL,client_id integer,comment character varying(1024) COLLATE pg_catalog."default",
    CONSTRAINT sales_parted_04_mln_pkey PRIMARY KEY (id, order_date),CONSTRAINT sales_parted_04_mln_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.clients (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,CONSTRAINT sales_parted_04_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,CONSTRAINT sales_parted_04_mln_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,CONSTRAINT sales_parted_04_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,CONSTRAINT sales_parted_04_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION) PARTITION BY RANGE (order_date);

CREATE TABLE sales_parted_04_mln_2023_01_01 PARTITION OF public.sales_parted_04_mln FOR VALUES FROM ('2023-01-01') TO ('2023-01-02');
CREATE TABLE sales_parted_04_mln_2023_01_02 PARTITION OF public.sales_parted_04_mln FOR VALUES FROM ('2023-01-02') TO ('2023-01-03');
CREATE TABLE sales_parted_04_mln_2023_01_03 PARTITION OF public.sales_parted_04_mln FOR VALUES FROM ('2023-01-03') TO ('2023-01-04');
CREATE TABLE sales_parted_04_mln_2023_01_04 PARTITION OF public.sales_parted_04_mln FOR VALUES FROM ('2023-01-04') TO ('2023-01-05');
CREATE TABLE sales_parted_04_mln_2023_01_05 PARTITION OF public.sales_parted_04_mln FOR VALUES FROM ('2023-01-05') TO ('2023-01-06');
CREATE TABLE sales_parted_04_mln_2023_01_06 PARTITION OF public.sales_parted_04_mln FOR VALUES FROM ('2023-01-06') TO ('2023-01-07');
CREATE TABLE sales_parted_04_mln_2023_01_07 PARTITION OF public.sales_parted_04_mln FOR VALUES FROM ('2023-01-07') TO ('2023-01-08');
CREATE TABLE sales_parted_04_mln_2023_01_08 PARTITION OF public.sales_parted_04_mln FOR VALUES FROM ('2023-01-08') TO ('2023-01-09');
CREATE TABLE sales_parted_04_mln_2023_01_09 PARTITION OF public.sales_parted_04_mln FOR VALUES FROM ('2023-01-09') TO ('2023-01-10');
CREATE TABLE sales_parted_04_mln_2023_01_10 PARTITION OF public.sales_parted_04_mln FOR VALUES FROM ('2023-01-10') TO ('2023-01-11');
CREATE TABLE sales_parted_04_mln_2023_01_11 PARTITION OF public.sales_parted_04_mln FOR VALUES FROM ('2023-01-11') TO ('2023-01-12');

CREATE TABLE sales_parted_05_mln
(
    id BIGSERIAL, order_number bigint NOT NULL,line_number_in_order integer,region_id integer,market_id integer,terminal_id integer,product_id integer,count_of_product integer,price_of_one_piece integer,order_date date NOT NULL,client_id integer,comment character varying(1024) COLLATE pg_catalog."default",
    CONSTRAINT sales_parted_05_mln_pkey PRIMARY KEY (id, order_date),CONSTRAINT sales_parted_05_mln_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.clients (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,CONSTRAINT sales_parted_05_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,CONSTRAINT sales_parted_05_mln_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,CONSTRAINT sales_parted_05_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,CONSTRAINT sales_parted_05_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION) PARTITION BY RANGE (order_date);

CREATE TABLE sales_parted_05_mln_2023_01_01 PARTITION OF public.sales_parted_05_mln FOR VALUES FROM ('2023-01-01') TO ('2023-01-02');
CREATE TABLE sales_parted_05_mln_2023_01_02 PARTITION OF public.sales_parted_05_mln FOR VALUES FROM ('2023-01-02') TO ('2023-01-03');
CREATE TABLE sales_parted_05_mln_2023_01_03 PARTITION OF public.sales_parted_05_mln FOR VALUES FROM ('2023-01-03') TO ('2023-01-04');
CREATE TABLE sales_parted_05_mln_2023_01_04 PARTITION OF public.sales_parted_05_mln FOR VALUES FROM ('2023-01-04') TO ('2023-01-05');
CREATE TABLE sales_parted_05_mln_2023_01_05 PARTITION OF public.sales_parted_05_mln FOR VALUES FROM ('2023-01-05') TO ('2023-01-06');
CREATE TABLE sales_parted_05_mln_2023_01_06 PARTITION OF public.sales_parted_05_mln FOR VALUES FROM ('2023-01-06') TO ('2023-01-07');
CREATE TABLE sales_parted_05_mln_2023_01_07 PARTITION OF public.sales_parted_05_mln FOR VALUES FROM ('2023-01-07') TO ('2023-01-08');
CREATE TABLE sales_parted_05_mln_2023_01_08 PARTITION OF public.sales_parted_05_mln FOR VALUES FROM ('2023-01-08') TO ('2023-01-09');
CREATE TABLE sales_parted_05_mln_2023_01_09 PARTITION OF public.sales_parted_05_mln FOR VALUES FROM ('2023-01-09') TO ('2023-01-10');
CREATE TABLE sales_parted_05_mln_2023_01_10 PARTITION OF public.sales_parted_05_mln FOR VALUES FROM ('2023-01-10') TO ('2023-01-11');
CREATE TABLE sales_parted_05_mln_2023_01_11 PARTITION OF public.sales_parted_05_mln FOR VALUES FROM ('2023-01-11') TO ('2023-01-12');

CREATE TABLE sales_parted_06_mln
(
    id BIGSERIAL, order_number bigint NOT NULL,line_number_in_order integer,region_id integer,market_id integer,terminal_id integer,product_id integer,count_of_product integer,price_of_one_piece integer,order_date date NOT NULL,client_id integer,comment character varying(1024) COLLATE pg_catalog."default",
    CONSTRAINT sales_parted_06_mln_pkey PRIMARY KEY (id, order_date),CONSTRAINT sales_parted_06_mln_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.clients (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,CONSTRAINT sales_parted_06_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,CONSTRAINT sales_parted_06_mln_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,CONSTRAINT sales_parted_06_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,CONSTRAINT sales_parted_06_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION) PARTITION BY RANGE (order_date);

CREATE TABLE sales_parted_06_mln_2023_01_01 PARTITION OF public.sales_parted_06_mln FOR VALUES FROM ('2023-01-01') TO ('2023-01-02');
CREATE TABLE sales_parted_06_mln_2023_01_02 PARTITION OF public.sales_parted_06_mln FOR VALUES FROM ('2023-01-02') TO ('2023-01-03');
CREATE TABLE sales_parted_06_mln_2023_01_03 PARTITION OF public.sales_parted_06_mln FOR VALUES FROM ('2023-01-03') TO ('2023-01-04');
CREATE TABLE sales_parted_06_mln_2023_01_04 PARTITION OF public.sales_parted_06_mln FOR VALUES FROM ('2023-01-04') TO ('2023-01-05');
CREATE TABLE sales_parted_06_mln_2023_01_05 PARTITION OF public.sales_parted_06_mln FOR VALUES FROM ('2023-01-05') TO ('2023-01-06');
CREATE TABLE sales_parted_06_mln_2023_01_06 PARTITION OF public.sales_parted_06_mln FOR VALUES FROM ('2023-01-06') TO ('2023-01-07');
CREATE TABLE sales_parted_06_mln_2023_01_07 PARTITION OF public.sales_parted_06_mln FOR VALUES FROM ('2023-01-07') TO ('2023-01-08');
CREATE TABLE sales_parted_06_mln_2023_01_08 PARTITION OF public.sales_parted_06_mln FOR VALUES FROM ('2023-01-08') TO ('2023-01-09');
CREATE TABLE sales_parted_06_mln_2023_01_09 PARTITION OF public.sales_parted_06_mln FOR VALUES FROM ('2023-01-09') TO ('2023-01-10');
CREATE TABLE sales_parted_06_mln_2023_01_10 PARTITION OF public.sales_parted_06_mln FOR VALUES FROM ('2023-01-10') TO ('2023-01-11');
CREATE TABLE sales_parted_06_mln_2023_01_11 PARTITION OF public.sales_parted_06_mln FOR VALUES FROM ('2023-01-11') TO ('2023-01-12');

CREATE TABLE sales_parted_07_mln
(
    id BIGSERIAL, order_number bigint NOT NULL,line_number_in_order integer,region_id integer,market_id integer,terminal_id integer,product_id integer,count_of_product integer,price_of_one_piece integer,order_date date NOT NULL,client_id integer,comment character varying(1024) COLLATE pg_catalog."default",
    CONSTRAINT sales_parted_07_mln_pkey PRIMARY KEY (id, order_date),CONSTRAINT sales_parted_07_mln_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.clients (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,CONSTRAINT sales_parted_07_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,CONSTRAINT sales_parted_07_mln_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,CONSTRAINT sales_parted_07_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,CONSTRAINT sales_parted_07_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION) PARTITION BY RANGE (order_date);

CREATE TABLE sales_parted_07_mln_2023_01_01 PARTITION OF public.sales_parted_07_mln FOR VALUES FROM ('2023-01-01') TO ('2023-01-02');
CREATE TABLE sales_parted_07_mln_2023_01_02 PARTITION OF public.sales_parted_07_mln FOR VALUES FROM ('2023-01-02') TO ('2023-01-03');
CREATE TABLE sales_parted_07_mln_2023_01_03 PARTITION OF public.sales_parted_07_mln FOR VALUES FROM ('2023-01-03') TO ('2023-01-04');
CREATE TABLE sales_parted_07_mln_2023_01_04 PARTITION OF public.sales_parted_07_mln FOR VALUES FROM ('2023-01-04') TO ('2023-01-05');
CREATE TABLE sales_parted_07_mln_2023_01_05 PARTITION OF public.sales_parted_07_mln FOR VALUES FROM ('2023-01-05') TO ('2023-01-06');
CREATE TABLE sales_parted_07_mln_2023_01_06 PARTITION OF public.sales_parted_07_mln FOR VALUES FROM ('2023-01-06') TO ('2023-01-07');
CREATE TABLE sales_parted_07_mln_2023_01_07 PARTITION OF public.sales_parted_07_mln FOR VALUES FROM ('2023-01-07') TO ('2023-01-08');
CREATE TABLE sales_parted_07_mln_2023_01_08 PARTITION OF public.sales_parted_07_mln FOR VALUES FROM ('2023-01-08') TO ('2023-01-09');
CREATE TABLE sales_parted_07_mln_2023_01_09 PARTITION OF public.sales_parted_07_mln FOR VALUES FROM ('2023-01-09') TO ('2023-01-10');
CREATE TABLE sales_parted_07_mln_2023_01_10 PARTITION OF public.sales_parted_07_mln FOR VALUES FROM ('2023-01-10') TO ('2023-01-11');
CREATE TABLE sales_parted_07_mln_2023_01_11 PARTITION OF public.sales_parted_07_mln FOR VALUES FROM ('2023-01-11') TO ('2023-01-12');

CREATE TABLE sales_parted_08_mln
(
    id BIGSERIAL, order_number bigint NOT NULL,line_number_in_order integer,region_id integer,market_id integer,terminal_id integer,product_id integer,count_of_product integer,price_of_one_piece integer,order_date date NOT NULL,client_id integer,comment character varying(1024) COLLATE pg_catalog."default",
    CONSTRAINT sales_parted_08_mln_pkey PRIMARY KEY (id, order_date),CONSTRAINT sales_parted_08_mln_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.clients (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,CONSTRAINT sales_parted_08_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,CONSTRAINT sales_parted_08_mln_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,CONSTRAINT sales_parted_08_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,CONSTRAINT sales_parted_08_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION) PARTITION BY RANGE (order_date);
	
CREATE TABLE sales_parted_08_mln_2023_01_01 PARTITION OF public.sales_parted_08_mln FOR VALUES FROM ('2023-01-01') TO ('2023-01-02');
CREATE TABLE sales_parted_08_mln_2023_01_02 PARTITION OF public.sales_parted_08_mln FOR VALUES FROM ('2023-01-02') TO ('2023-01-03');
CREATE TABLE sales_parted_08_mln_2023_01_03 PARTITION OF public.sales_parted_08_mln FOR VALUES FROM ('2023-01-03') TO ('2023-01-04');
CREATE TABLE sales_parted_08_mln_2023_01_04 PARTITION OF public.sales_parted_08_mln FOR VALUES FROM ('2023-01-04') TO ('2023-01-05');
CREATE TABLE sales_parted_08_mln_2023_01_05 PARTITION OF public.sales_parted_08_mln FOR VALUES FROM ('2023-01-05') TO ('2023-01-06');
CREATE TABLE sales_parted_08_mln_2023_01_06 PARTITION OF public.sales_parted_08_mln FOR VALUES FROM ('2023-01-06') TO ('2023-01-07');
CREATE TABLE sales_parted_08_mln_2023_01_07 PARTITION OF public.sales_parted_08_mln FOR VALUES FROM ('2023-01-07') TO ('2023-01-08');
CREATE TABLE sales_parted_08_mln_2023_01_08 PARTITION OF public.sales_parted_08_mln FOR VALUES FROM ('2023-01-08') TO ('2023-01-09');
CREATE TABLE sales_parted_08_mln_2023_01_09 PARTITION OF public.sales_parted_08_mln FOR VALUES FROM ('2023-01-09') TO ('2023-01-10');
CREATE TABLE sales_parted_08_mln_2023_01_10 PARTITION OF public.sales_parted_08_mln FOR VALUES FROM ('2023-01-10') TO ('2023-01-11');
CREATE TABLE sales_parted_08_mln_2023_01_11 PARTITION OF public.sales_parted_08_mln FOR VALUES FROM ('2023-01-11') TO ('2023-01-12');	

CREATE TABLE sales_parted_09_mln
(
    id BIGSERIAL, order_number bigint NOT NULL,line_number_in_order integer,region_id integer,market_id integer,terminal_id integer,product_id integer,count_of_product integer,price_of_one_piece integer,order_date date NOT NULL,client_id integer,comment character varying(1024) COLLATE pg_catalog."default",
    CONSTRAINT sales_parted_09_mln_pkey PRIMARY KEY (id, order_date),CONSTRAINT sales_parted_09_mln_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.clients (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,CONSTRAINT sales_parted_09_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,CONSTRAINT sales_parted_09_mln_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,CONSTRAINT sales_parted_09_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,CONSTRAINT sales_parted_09_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION) PARTITION BY RANGE (order_date);
		
CREATE TABLE sales_parted_09_mln_2023_01_01 PARTITION OF public.sales_parted_09_mln FOR VALUES FROM ('2023-01-01') TO ('2023-01-02');
CREATE TABLE sales_parted_09_mln_2023_01_02 PARTITION OF public.sales_parted_09_mln FOR VALUES FROM ('2023-01-02') TO ('2023-01-03');
CREATE TABLE sales_parted_09_mln_2023_01_03 PARTITION OF public.sales_parted_09_mln FOR VALUES FROM ('2023-01-03') TO ('2023-01-04');
CREATE TABLE sales_parted_09_mln_2023_01_04 PARTITION OF public.sales_parted_09_mln FOR VALUES FROM ('2023-01-04') TO ('2023-01-05');
CREATE TABLE sales_parted_09_mln_2023_01_05 PARTITION OF public.sales_parted_09_mln FOR VALUES FROM ('2023-01-05') TO ('2023-01-06');
CREATE TABLE sales_parted_09_mln_2023_01_06 PARTITION OF public.sales_parted_09_mln FOR VALUES FROM ('2023-01-06') TO ('2023-01-07');
CREATE TABLE sales_parted_09_mln_2023_01_07 PARTITION OF public.sales_parted_09_mln FOR VALUES FROM ('2023-01-07') TO ('2023-01-08');
CREATE TABLE sales_parted_09_mln_2023_01_08 PARTITION OF public.sales_parted_09_mln FOR VALUES FROM ('2023-01-08') TO ('2023-01-09');
CREATE TABLE sales_parted_09_mln_2023_01_09 PARTITION OF public.sales_parted_09_mln FOR VALUES FROM ('2023-01-09') TO ('2023-01-10');
CREATE TABLE sales_parted_09_mln_2023_01_10 PARTITION OF public.sales_parted_09_mln FOR VALUES FROM ('2023-01-10') TO ('2023-01-11');
CREATE TABLE sales_parted_09_mln_2023_01_11 PARTITION OF public.sales_parted_09_mln FOR VALUES FROM ('2023-01-11') TO ('2023-01-12');	

CREATE TABLE sales_parted_10_mln
(
    id BIGSERIAL, order_number bigint NOT NULL,line_number_in_order integer,region_id integer,market_id integer,terminal_id integer,product_id integer,count_of_product integer,price_of_one_piece integer,order_date date NOT NULL,client_id integer,comment character varying(1024) COLLATE pg_catalog."default",
    CONSTRAINT sales_parted_10_mln_pkey PRIMARY KEY (id, order_date),CONSTRAINT sales_parted_10_mln_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.clients (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,CONSTRAINT sales_parted_10_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,CONSTRAINT sales_parted_10_mln_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,CONSTRAINT sales_parted_10_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,CONSTRAINT sales_parted_10_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION) PARTITION BY RANGE (order_date);

CREATE TABLE sales_parted_10_mln_2023_01_01 PARTITION OF public.sales_parted_10_mln FOR VALUES FROM ('2023-01-01') TO ('2023-01-02');
CREATE TABLE sales_parted_10_mln_2023_01_02 PARTITION OF public.sales_parted_10_mln FOR VALUES FROM ('2023-01-02') TO ('2023-01-03');
CREATE TABLE sales_parted_10_mln_2023_01_03 PARTITION OF public.sales_parted_10_mln FOR VALUES FROM ('2023-01-03') TO ('2023-01-04');
CREATE TABLE sales_parted_10_mln_2023_01_04 PARTITION OF public.sales_parted_10_mln FOR VALUES FROM ('2023-01-04') TO ('2023-01-05');
CREATE TABLE sales_parted_10_mln_2023_01_05 PARTITION OF public.sales_parted_10_mln FOR VALUES FROM ('2023-01-05') TO ('2023-01-06');
CREATE TABLE sales_parted_10_mln_2023_01_06 PARTITION OF public.sales_parted_10_mln FOR VALUES FROM ('2023-01-06') TO ('2023-01-07');
CREATE TABLE sales_parted_10_mln_2023_01_07 PARTITION OF public.sales_parted_10_mln FOR VALUES FROM ('2023-01-07') TO ('2023-01-08');
CREATE TABLE sales_parted_10_mln_2023_01_08 PARTITION OF public.sales_parted_10_mln FOR VALUES FROM ('2023-01-08') TO ('2023-01-09');
CREATE TABLE sales_parted_10_mln_2023_01_09 PARTITION OF public.sales_parted_10_mln FOR VALUES FROM ('2023-01-09') TO ('2023-01-10');
CREATE TABLE sales_parted_10_mln_2023_01_10 PARTITION OF public.sales_parted_10_mln FOR VALUES FROM ('2023-01-10') TO ('2023-01-11');
CREATE TABLE sales_parted_10_mln_2023_01_11 PARTITION OF public.sales_parted_10_mln FOR VALUES FROM ('2023-01-11') TO ('2023-01-12');

CREATE TABLE sales_parted_20_mln
(
    id BIGSERIAL, order_number bigint NOT NULL,line_number_in_order integer,region_id integer,market_id integer,terminal_id integer,product_id integer,count_of_product integer,price_of_one_piece integer,order_date date NOT NULL,client_id integer,comment character varying(1024) COLLATE pg_catalog."default",
    CONSTRAINT sales_parted_20_mln_pkey PRIMARY KEY (id, order_date),CONSTRAINT sales_parted_20_mln_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.clients (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,CONSTRAINT sales_parted_20_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,CONSTRAINT sales_parted_20_mln_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,CONSTRAINT sales_parted_20_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,CONSTRAINT sales_parted_20_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION) PARTITION BY RANGE (order_date);

CREATE TABLE sales_parted_20_mln_2023_01_01 PARTITION OF public.sales_parted_20_mln FOR VALUES FROM ('2023-01-01') TO ('2023-01-02');
CREATE TABLE sales_parted_20_mln_2023_01_02 PARTITION OF public.sales_parted_20_mln FOR VALUES FROM ('2023-01-02') TO ('2023-01-03');
CREATE TABLE sales_parted_20_mln_2023_01_03 PARTITION OF public.sales_parted_20_mln FOR VALUES FROM ('2023-01-03') TO ('2023-01-04');
CREATE TABLE sales_parted_20_mln_2023_01_04 PARTITION OF public.sales_parted_20_mln FOR VALUES FROM ('2023-01-04') TO ('2023-01-05');
CREATE TABLE sales_parted_20_mln_2023_01_05 PARTITION OF public.sales_parted_20_mln FOR VALUES FROM ('2023-01-05') TO ('2023-01-06');
CREATE TABLE sales_parted_20_mln_2023_01_06 PARTITION OF public.sales_parted_20_mln FOR VALUES FROM ('2023-01-06') TO ('2023-01-07');
CREATE TABLE sales_parted_20_mln_2023_01_07 PARTITION OF public.sales_parted_20_mln FOR VALUES FROM ('2023-01-07') TO ('2023-01-08');
CREATE TABLE sales_parted_20_mln_2023_01_08 PARTITION OF public.sales_parted_20_mln FOR VALUES FROM ('2023-01-08') TO ('2023-01-09');
CREATE TABLE sales_parted_20_mln_2023_01_09 PARTITION OF public.sales_parted_20_mln FOR VALUES FROM ('2023-01-09') TO ('2023-01-10');
CREATE TABLE sales_parted_20_mln_2023_01_10 PARTITION OF public.sales_parted_20_mln FOR VALUES FROM ('2023-01-10') TO ('2023-01-11');
CREATE TABLE sales_parted_20_mln_2023_01_11 PARTITION OF public.sales_parted_20_mln FOR VALUES FROM ('2023-01-11') TO ('2023-01-12');

CREATE TABLE sales_parted_30_mln
(
    id BIGSERIAL, order_number bigint NOT NULL,line_number_in_order integer,region_id integer,market_id integer,terminal_id integer,product_id integer,count_of_product integer,price_of_one_piece integer,order_date date NOT NULL,client_id integer,comment character varying(1024) COLLATE pg_catalog."default",
    CONSTRAINT sales_parted_30_mln_pkey PRIMARY KEY (id, order_date),CONSTRAINT sales_parted_30_mln_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.clients (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,CONSTRAINT sales_parted_30_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,CONSTRAINT sales_parted_30_mln_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,CONSTRAINT sales_parted_30_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,CONSTRAINT sales_parted_30_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION) PARTITION BY RANGE (order_date);

CREATE TABLE sales_parted_30_mln_2023_01_01 PARTITION OF public.sales_parted_30_mln FOR VALUES FROM ('2023-01-01') TO ('2023-01-02');
CREATE TABLE sales_parted_30_mln_2023_01_02 PARTITION OF public.sales_parted_30_mln FOR VALUES FROM ('2023-01-02') TO ('2023-01-03');
CREATE TABLE sales_parted_30_mln_2023_01_03 PARTITION OF public.sales_parted_30_mln FOR VALUES FROM ('2023-01-03') TO ('2023-01-04');
CREATE TABLE sales_parted_30_mln_2023_01_04 PARTITION OF public.sales_parted_30_mln FOR VALUES FROM ('2023-01-04') TO ('2023-01-05');
CREATE TABLE sales_parted_30_mln_2023_01_05 PARTITION OF public.sales_parted_30_mln FOR VALUES FROM ('2023-01-05') TO ('2023-01-06');
CREATE TABLE sales_parted_30_mln_2023_01_06 PARTITION OF public.sales_parted_30_mln FOR VALUES FROM ('2023-01-06') TO ('2023-01-07');
CREATE TABLE sales_parted_30_mln_2023_01_07 PARTITION OF public.sales_parted_30_mln FOR VALUES FROM ('2023-01-07') TO ('2023-01-08');
CREATE TABLE sales_parted_30_mln_2023_01_08 PARTITION OF public.sales_parted_30_mln FOR VALUES FROM ('2023-01-08') TO ('2023-01-09');
CREATE TABLE sales_parted_30_mln_2023_01_09 PARTITION OF public.sales_parted_30_mln FOR VALUES FROM ('2023-01-09') TO ('2023-01-10');
CREATE TABLE sales_parted_30_mln_2023_01_10 PARTITION OF public.sales_parted_30_mln FOR VALUES FROM ('2023-01-10') TO ('2023-01-11');
CREATE TABLE sales_parted_30_mln_2023_01_11 PARTITION OF public.sales_parted_30_mln FOR VALUES FROM ('2023-01-11') TO ('2023-01-12');

CREATE TABLE sales_parted_40_mln
(
    id BIGSERIAL, order_number bigint NOT NULL,line_number_in_order integer,region_id integer,market_id integer,terminal_id integer,product_id integer,count_of_product integer,price_of_one_piece integer,order_date date NOT NULL,client_id integer,comment character varying(1024) COLLATE pg_catalog."default",
    CONSTRAINT sales_parted_40_mln_pkey PRIMARY KEY (id, order_date),CONSTRAINT sales_parted_40_mln_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.clients (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,CONSTRAINT sales_parted_40_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,CONSTRAINT sales_parted_40_mln_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,CONSTRAINT sales_parted_40_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,CONSTRAINT sales_parted_40_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION) PARTITION BY RANGE (order_date);

CREATE TABLE sales_parted_40_mln_2023_01_01 PARTITION OF public.sales_parted_40_mln FOR VALUES FROM ('2023-01-01') TO ('2023-01-02');
CREATE TABLE sales_parted_40_mln_2023_01_02 PARTITION OF public.sales_parted_40_mln FOR VALUES FROM ('2023-01-02') TO ('2023-01-03');
CREATE TABLE sales_parted_40_mln_2023_01_03 PARTITION OF public.sales_parted_40_mln FOR VALUES FROM ('2023-01-03') TO ('2023-01-04');
CREATE TABLE sales_parted_40_mln_2023_01_04 PARTITION OF public.sales_parted_40_mln FOR VALUES FROM ('2023-01-04') TO ('2023-01-05');
CREATE TABLE sales_parted_40_mln_2023_01_05 PARTITION OF public.sales_parted_40_mln FOR VALUES FROM ('2023-01-05') TO ('2023-01-06');
CREATE TABLE sales_parted_40_mln_2023_01_06 PARTITION OF public.sales_parted_40_mln FOR VALUES FROM ('2023-01-06') TO ('2023-01-07');
CREATE TABLE sales_parted_40_mln_2023_01_07 PARTITION OF public.sales_parted_40_mln FOR VALUES FROM ('2023-01-07') TO ('2023-01-08');
CREATE TABLE sales_parted_40_mln_2023_01_08 PARTITION OF public.sales_parted_40_mln FOR VALUES FROM ('2023-01-08') TO ('2023-01-09');
CREATE TABLE sales_parted_40_mln_2023_01_09 PARTITION OF public.sales_parted_40_mln FOR VALUES FROM ('2023-01-09') TO ('2023-01-10');
CREATE TABLE sales_parted_40_mln_2023_01_10 PARTITION OF public.sales_parted_40_mln FOR VALUES FROM ('2023-01-10') TO ('2023-01-11');
CREATE TABLE sales_parted_40_mln_2023_01_11 PARTITION OF public.sales_parted_40_mln FOR VALUES FROM ('2023-01-11') TO ('2023-01-12');



CREATE INDEX index_order_date_sales_parted_01_mln ON public.sales_parted_01_mln USING btree(order_date ASC NULLS LAST);
CREATE INDEX index_order_date_sales_parted_02_mln ON public.sales_parted_02_mln USING btree(order_date ASC NULLS LAST);
CREATE INDEX index_order_date_sales_parted_03_mln ON public.sales_parted_03_mln USING btree(order_date ASC NULLS LAST);
CREATE INDEX index_order_date_sales_parted_04_mln ON public.sales_parted_04_mln USING btree(order_date ASC NULLS LAST);
CREATE INDEX index_order_date_sales_parted_05_mln ON public.sales_parted_05_mln USING btree(order_date ASC NULLS LAST);
CREATE INDEX index_order_date_sales_parted_06_mln ON public.sales_parted_06_mln USING btree(order_date ASC NULLS LAST);
CREATE INDEX index_order_date_sales_parted_07_mln ON public.sales_parted_07_mln USING btree(order_date ASC NULLS LAST);
CREATE INDEX index_order_date_sales_parted_08_mln ON public.sales_parted_08_mln USING btree(order_date ASC NULLS LAST);
CREATE INDEX index_order_date_sales_parted_09_mln ON public.sales_parted_09_mln USING btree(order_date ASC NULLS LAST);
CREATE INDEX index_order_date_sales_parted_10_mln ON public.sales_parted_10_mln USING btree(order_date ASC NULLS LAST);
CREATE INDEX index_order_date_sales_parted_20_mln ON public.sales_parted_20_mln USING btree(order_date ASC NULLS LAST);
CREATE INDEX index_order_date_sales_parted_30_mln ON public.sales_parted_30_mln USING btree(order_date ASC NULLS LAST);
CREATE INDEX index_order_date_sales_parted_40_mln ON public.sales_parted_40_mln USING btree(order_date ASC NULLS LAST);
