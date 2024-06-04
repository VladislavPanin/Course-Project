

CREATE TABLE IF NOT EXISTS order_numbers_dictionary_parted_01_mln
(
    order_number BIGSERIAL,region_id integer,market_id integer,terminal_id integer,terminal_basket_number bigint,basket_price integer,order_time time without time zone,order_date date NOT NULL,comment character varying(1024) COLLATE pg_catalog."default",
    CONSTRAINT order_numbers_dictionary_parted_01_mln_pkey PRIMARY KEY (order_number, order_date),CONSTRAINT order_numbers_dictionary_parted_01_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT order_numbers_dictionary_parted_01_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT order_numbers_dictionary_parted_01_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION)  PARTITION BY RANGE (order_date);

CREATE TABLE order_numbers_dictionary_parted_01_mln_2023_01_01 PARTITION OF public.order_numbers_dictionary_parted_01_mln FOR VALUES FROM ('2023-01-01') TO ('2023-01-02');
CREATE TABLE order_numbers_dictionary_parted_01_mln_2023_01_02 PARTITION OF public.order_numbers_dictionary_parted_01_mln FOR VALUES FROM ('2023-01-02') TO ('2023-01-03');
CREATE TABLE order_numbers_dictionary_parted_01_mln_2023_01_03 PARTITION OF public.order_numbers_dictionary_parted_01_mln FOR VALUES FROM ('2023-01-03') TO ('2023-01-04');
CREATE TABLE order_numbers_dictionary_parted_01_mln_2023_01_04 PARTITION OF public.order_numbers_dictionary_parted_01_mln FOR VALUES FROM ('2023-01-04') TO ('2023-01-05');
CREATE TABLE order_numbers_dictionary_parted_01_mln_2023_01_05 PARTITION OF public.order_numbers_dictionary_parted_01_mln FOR VALUES FROM ('2023-01-05') TO ('2023-01-06');
CREATE TABLE order_numbers_dictionary_parted_01_mln_2023_01_06 PARTITION OF public.order_numbers_dictionary_parted_01_mln FOR VALUES FROM ('2023-01-06') TO ('2023-01-07');
CREATE TABLE order_numbers_dictionary_parted_01_mln_2023_01_07 PARTITION OF public.order_numbers_dictionary_parted_01_mln FOR VALUES FROM ('2023-01-07') TO ('2023-01-08');
CREATE TABLE order_numbers_dictionary_parted_01_mln_2023_01_08 PARTITION OF public.order_numbers_dictionary_parted_01_mln FOR VALUES FROM ('2023-01-08') TO ('2023-01-09');
CREATE TABLE order_numbers_dictionary_parted_01_mln_2023_01_09 PARTITION OF public.order_numbers_dictionary_parted_01_mln FOR VALUES FROM ('2023-01-09') TO ('2023-01-10');
CREATE TABLE order_numbers_dictionary_parted_01_mln_2023_01_10 PARTITION OF public.order_numbers_dictionary_parted_01_mln FOR VALUES FROM ('2023-01-10') TO ('2023-01-11');
CREATE TABLE order_numbers_dictionary_parted_01_mln_2023_01_11 PARTITION OF public.order_numbers_dictionary_parted_01_mln FOR VALUES FROM ('2023-01-11') TO ('2023-01-12');


CREATE TABLE IF NOT EXISTS order_numbers_dictionary_parted_02_mln
(
    order_number BIGSERIAL,region_id integer,market_id integer,terminal_id integer,terminal_basket_number bigint,basket_price integer,order_time time without time zone,order_date date NOT NULL,comment character varying(1024) COLLATE pg_catalog."default",
    CONSTRAINT order_numbers_dictionary_parted_02_mln_pkey PRIMARY KEY (order_number, order_date),CONSTRAINT order_numbers_dictionary_parted_02_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT order_numbers_dictionary_parted_02_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT order_numbers_dictionary_parted_02_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION)  PARTITION BY RANGE (order_date);
	
CREATE TABLE order_numbers_dictionary_parted_02_mln_2023_01_01 PARTITION OF public.order_numbers_dictionary_parted_02_mln FOR VALUES FROM ('2023-01-01') TO ('2023-01-02');
CREATE TABLE order_numbers_dictionary_parted_02_mln_2023_01_02 PARTITION OF public.order_numbers_dictionary_parted_02_mln FOR VALUES FROM ('2023-01-02') TO ('2023-01-03');
CREATE TABLE order_numbers_dictionary_parted_02_mln_2023_01_03 PARTITION OF public.order_numbers_dictionary_parted_02_mln FOR VALUES FROM ('2023-01-03') TO ('2023-01-04');
CREATE TABLE order_numbers_dictionary_parted_02_mln_2023_01_04 PARTITION OF public.order_numbers_dictionary_parted_02_mln FOR VALUES FROM ('2023-01-04') TO ('2023-01-05');
CREATE TABLE order_numbers_dictionary_parted_02_mln_2023_01_05 PARTITION OF public.order_numbers_dictionary_parted_02_mln FOR VALUES FROM ('2023-01-05') TO ('2023-01-06');
CREATE TABLE order_numbers_dictionary_parted_02_mln_2023_01_06 PARTITION OF public.order_numbers_dictionary_parted_02_mln FOR VALUES FROM ('2023-01-06') TO ('2023-01-07');
CREATE TABLE order_numbers_dictionary_parted_02_mln_2023_01_07 PARTITION OF public.order_numbers_dictionary_parted_02_mln FOR VALUES FROM ('2023-01-07') TO ('2023-01-08');
CREATE TABLE order_numbers_dictionary_parted_02_mln_2023_01_08 PARTITION OF public.order_numbers_dictionary_parted_02_mln FOR VALUES FROM ('2023-01-08') TO ('2023-01-09');
CREATE TABLE order_numbers_dictionary_parted_02_mln_2023_01_09 PARTITION OF public.order_numbers_dictionary_parted_02_mln FOR VALUES FROM ('2023-01-09') TO ('2023-01-10');
CREATE TABLE order_numbers_dictionary_parted_02_mln_2023_01_10 PARTITION OF public.order_numbers_dictionary_parted_02_mln FOR VALUES FROM ('2023-01-10') TO ('2023-01-11');
CREATE TABLE order_numbers_dictionary_parted_02_mln_2023_01_11 PARTITION OF public.order_numbers_dictionary_parted_02_mln FOR VALUES FROM ('2023-01-11') TO ('2023-01-12');

CREATE TABLE IF NOT EXISTS order_numbers_dictionary_parted_03_mln
(
    order_number BIGSERIAL,region_id integer,market_id integer,terminal_id integer,terminal_basket_number bigint,basket_price integer,order_time time without time zone,order_date date NOT NULL,comment character varying(1024) COLLATE pg_catalog."default",
    CONSTRAINT order_numbers_dictionary_parted_03_mln_pkey PRIMARY KEY (order_number, order_date),CONSTRAINT order_numbers_dictionary_parted_03_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT order_numbers_dictionary_parted_03_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT order_numbers_dictionary_parted_03_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION)  PARTITION BY RANGE (order_date);

CREATE TABLE order_numbers_dictionary_parted_03_mln_2023_01_01 PARTITION OF public.order_numbers_dictionary_parted_03_mln FOR VALUES FROM ('2023-01-01') TO ('2023-01-02');
CREATE TABLE order_numbers_dictionary_parted_03_mln_2023_01_02 PARTITION OF public.order_numbers_dictionary_parted_03_mln FOR VALUES FROM ('2023-01-02') TO ('2023-01-03');
CREATE TABLE order_numbers_dictionary_parted_03_mln_2023_01_03 PARTITION OF public.order_numbers_dictionary_parted_03_mln FOR VALUES FROM ('2023-01-03') TO ('2023-01-04');
CREATE TABLE order_numbers_dictionary_parted_03_mln_2023_01_04 PARTITION OF public.order_numbers_dictionary_parted_03_mln FOR VALUES FROM ('2023-01-04') TO ('2023-01-05');
CREATE TABLE order_numbers_dictionary_parted_03_mln_2023_01_05 PARTITION OF public.order_numbers_dictionary_parted_03_mln FOR VALUES FROM ('2023-01-05') TO ('2023-01-06');
CREATE TABLE order_numbers_dictionary_parted_03_mln_2023_01_06 PARTITION OF public.order_numbers_dictionary_parted_03_mln FOR VALUES FROM ('2023-01-06') TO ('2023-01-07');
CREATE TABLE order_numbers_dictionary_parted_03_mln_2023_01_07 PARTITION OF public.order_numbers_dictionary_parted_03_mln FOR VALUES FROM ('2023-01-07') TO ('2023-01-08');
CREATE TABLE order_numbers_dictionary_parted_03_mln_2023_01_08 PARTITION OF public.order_numbers_dictionary_parted_03_mln FOR VALUES FROM ('2023-01-08') TO ('2023-01-09');
CREATE TABLE order_numbers_dictionary_parted_03_mln_2023_01_09 PARTITION OF public.order_numbers_dictionary_parted_03_mln FOR VALUES FROM ('2023-01-09') TO ('2023-01-10');
CREATE TABLE order_numbers_dictionary_parted_03_mln_2023_01_10 PARTITION OF public.order_numbers_dictionary_parted_03_mln FOR VALUES FROM ('2023-01-10') TO ('2023-01-11');
CREATE TABLE order_numbers_dictionary_parted_03_mln_2023_01_11 PARTITION OF public.order_numbers_dictionary_parted_03_mln FOR VALUES FROM ('2023-01-11') TO ('2023-01-12');


CREATE TABLE IF NOT EXISTS order_numbers_dictionary_parted_04_mln
(
    order_number BIGSERIAL,region_id integer,market_id integer,terminal_id integer,terminal_basket_number bigint,basket_price integer,order_time time without time zone,order_date date NOT NULL,comment character varying(1024) COLLATE pg_catalog."default",
    CONSTRAINT order_numbers_dictionary_parted_04_mln_pkey PRIMARY KEY (order_number, order_date),CONSTRAINT order_numbers_dictionary_parted_04_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT order_numbers_dictionary_parted_04_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT order_numbers_dictionary_parted_04_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION)  PARTITION BY RANGE (order_date);

CREATE TABLE order_numbers_dictionary_parted_04_mln_2023_01_01 PARTITION OF public.order_numbers_dictionary_parted_04_mln FOR VALUES FROM ('2023-01-01') TO ('2023-01-02');
CREATE TABLE order_numbers_dictionary_parted_04_mln_2023_01_02 PARTITION OF public.order_numbers_dictionary_parted_04_mln FOR VALUES FROM ('2023-01-02') TO ('2023-01-03');
CREATE TABLE order_numbers_dictionary_parted_04_mln_2023_01_03 PARTITION OF public.order_numbers_dictionary_parted_04_mln FOR VALUES FROM ('2023-01-03') TO ('2023-01-04');
CREATE TABLE order_numbers_dictionary_parted_04_mln_2023_01_04 PARTITION OF public.order_numbers_dictionary_parted_04_mln FOR VALUES FROM ('2023-01-04') TO ('2023-01-05');
CREATE TABLE order_numbers_dictionary_parted_04_mln_2023_01_05 PARTITION OF public.order_numbers_dictionary_parted_04_mln FOR VALUES FROM ('2023-01-05') TO ('2023-01-06');
CREATE TABLE order_numbers_dictionary_parted_04_mln_2023_01_06 PARTITION OF public.order_numbers_dictionary_parted_04_mln FOR VALUES FROM ('2023-01-06') TO ('2023-01-07');
CREATE TABLE order_numbers_dictionary_parted_04_mln_2023_01_07 PARTITION OF public.order_numbers_dictionary_parted_04_mln FOR VALUES FROM ('2023-01-07') TO ('2023-01-08');
CREATE TABLE order_numbers_dictionary_parted_04_mln_2023_01_08 PARTITION OF public.order_numbers_dictionary_parted_04_mln FOR VALUES FROM ('2023-01-08') TO ('2023-01-09');
CREATE TABLE order_numbers_dictionary_parted_04_mln_2023_01_09 PARTITION OF public.order_numbers_dictionary_parted_04_mln FOR VALUES FROM ('2023-01-09') TO ('2023-01-10');
CREATE TABLE order_numbers_dictionary_parted_04_mln_2023_01_10 PARTITION OF public.order_numbers_dictionary_parted_04_mln FOR VALUES FROM ('2023-01-10') TO ('2023-01-11');
CREATE TABLE order_numbers_dictionary_parted_04_mln_2023_01_11 PARTITION OF public.order_numbers_dictionary_parted_04_mln FOR VALUES FROM ('2023-01-11') TO ('2023-01-12');

CREATE TABLE IF NOT EXISTS order_numbers_dictionary_parted_05_mln
(
    order_number BIGSERIAL,region_id integer,market_id integer,terminal_id integer,terminal_basket_number bigint,basket_price integer,order_time time without time zone,order_date date NOT NULL,comment character varying(1024) COLLATE pg_catalog."default",
    CONSTRAINT order_numbers_dictionary_parted_05_mln_pkey PRIMARY KEY (order_number, order_date),CONSTRAINT order_numbers_dictionary_parted_05_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT order_numbers_dictionary_parted_05_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT order_numbers_dictionary_parted_05_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION)  PARTITION BY RANGE (order_date);

CREATE TABLE order_numbers_dictionary_parted_05_mln_2023_01_01 PARTITION OF public.order_numbers_dictionary_parted_05_mln FOR VALUES FROM ('2023-01-01') TO ('2023-01-02');
CREATE TABLE order_numbers_dictionary_parted_05_mln_2023_01_02 PARTITION OF public.order_numbers_dictionary_parted_05_mln FOR VALUES FROM ('2023-01-02') TO ('2023-01-03');
CREATE TABLE order_numbers_dictionary_parted_05_mln_2023_01_03 PARTITION OF public.order_numbers_dictionary_parted_05_mln FOR VALUES FROM ('2023-01-03') TO ('2023-01-04');
CREATE TABLE order_numbers_dictionary_parted_05_mln_2023_01_04 PARTITION OF public.order_numbers_dictionary_parted_05_mln FOR VALUES FROM ('2023-01-04') TO ('2023-01-05');
CREATE TABLE order_numbers_dictionary_parted_05_mln_2023_01_05 PARTITION OF public.order_numbers_dictionary_parted_05_mln FOR VALUES FROM ('2023-01-05') TO ('2023-01-06');
CREATE TABLE order_numbers_dictionary_parted_05_mln_2023_01_06 PARTITION OF public.order_numbers_dictionary_parted_05_mln FOR VALUES FROM ('2023-01-06') TO ('2023-01-07');
CREATE TABLE order_numbers_dictionary_parted_05_mln_2023_01_07 PARTITION OF public.order_numbers_dictionary_parted_05_mln FOR VALUES FROM ('2023-01-07') TO ('2023-01-08');
CREATE TABLE order_numbers_dictionary_parted_05_mln_2023_01_08 PARTITION OF public.order_numbers_dictionary_parted_05_mln FOR VALUES FROM ('2023-01-08') TO ('2023-01-09');
CREATE TABLE order_numbers_dictionary_parted_05_mln_2023_01_09 PARTITION OF public.order_numbers_dictionary_parted_05_mln FOR VALUES FROM ('2023-01-09') TO ('2023-01-10');
CREATE TABLE order_numbers_dictionary_parted_05_mln_2023_01_10 PARTITION OF public.order_numbers_dictionary_parted_05_mln FOR VALUES FROM ('2023-01-10') TO ('2023-01-11');
CREATE TABLE order_numbers_dictionary_parted_05_mln_2023_01_11 PARTITION OF public.order_numbers_dictionary_parted_05_mln FOR VALUES FROM ('2023-01-11') TO ('2023-01-12');

CREATE TABLE IF NOT EXISTS order_numbers_dictionary_parted_06_mln
(
    order_number BIGSERIAL,region_id integer,market_id integer,terminal_id integer,terminal_basket_number bigint,basket_price integer,order_time time without time zone,order_date date NOT NULL,comment character varying(1024) COLLATE pg_catalog."default",
    CONSTRAINT order_numbers_dictionary_parted_06_mln_pkey PRIMARY KEY (order_number, order_date),CONSTRAINT order_numbers_dictionary_parted_06_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT order_numbers_dictionary_parted_06_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT order_numbers_dictionary_parted_06_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION)  PARTITION BY RANGE (order_date);

CREATE TABLE order_numbers_dictionary_parted_06_mln_2023_01_01 PARTITION OF public.order_numbers_dictionary_parted_06_mln FOR VALUES FROM ('2023-01-01') TO ('2023-01-02');
CREATE TABLE order_numbers_dictionary_parted_06_mln_2023_01_02 PARTITION OF public.order_numbers_dictionary_parted_06_mln FOR VALUES FROM ('2023-01-02') TO ('2023-01-03');
CREATE TABLE order_numbers_dictionary_parted_06_mln_2023_01_03 PARTITION OF public.order_numbers_dictionary_parted_06_mln FOR VALUES FROM ('2023-01-03') TO ('2023-01-04');
CREATE TABLE order_numbers_dictionary_parted_06_mln_2023_01_04 PARTITION OF public.order_numbers_dictionary_parted_06_mln FOR VALUES FROM ('2023-01-04') TO ('2023-01-05');
CREATE TABLE order_numbers_dictionary_parted_06_mln_2023_01_05 PARTITION OF public.order_numbers_dictionary_parted_06_mln FOR VALUES FROM ('2023-01-05') TO ('2023-01-06');
CREATE TABLE order_numbers_dictionary_parted_06_mln_2023_01_06 PARTITION OF public.order_numbers_dictionary_parted_06_mln FOR VALUES FROM ('2023-01-06') TO ('2023-01-07');
CREATE TABLE order_numbers_dictionary_parted_06_mln_2023_01_07 PARTITION OF public.order_numbers_dictionary_parted_06_mln FOR VALUES FROM ('2023-01-07') TO ('2023-01-08');
CREATE TABLE order_numbers_dictionary_parted_06_mln_2023_01_08 PARTITION OF public.order_numbers_dictionary_parted_06_mln FOR VALUES FROM ('2023-01-08') TO ('2023-01-09');
CREATE TABLE order_numbers_dictionary_parted_06_mln_2023_01_09 PARTITION OF public.order_numbers_dictionary_parted_06_mln FOR VALUES FROM ('2023-01-09') TO ('2023-01-10');
CREATE TABLE order_numbers_dictionary_parted_06_mln_2023_01_10 PARTITION OF public.order_numbers_dictionary_parted_06_mln FOR VALUES FROM ('2023-01-10') TO ('2023-01-11');
CREATE TABLE order_numbers_dictionary_parted_06_mln_2023_01_11 PARTITION OF public.order_numbers_dictionary_parted_06_mln FOR VALUES FROM ('2023-01-11') TO ('2023-01-12');

CREATE TABLE IF NOT EXISTS order_numbers_dictionary_parted_07_mln
(
    order_number BIGSERIAL,region_id integer,market_id integer,terminal_id integer,terminal_basket_number bigint,basket_price integer,order_time time without time zone,order_date date NOT NULL,comment character varying(1024) COLLATE pg_catalog."default",
    CONSTRAINT order_numbers_dictionary_parted_07_mln_pkey PRIMARY KEY (order_number, order_date),CONSTRAINT order_numbers_dictionary_parted_07_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT order_numbers_dictionary_parted_07_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT order_numbers_dictionary_parted_07_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION)  PARTITION BY RANGE (order_date);

CREATE TABLE order_numbers_dictionary_parted_07_mln_2023_01_01 PARTITION OF public.order_numbers_dictionary_parted_07_mln FOR VALUES FROM ('2023-01-01') TO ('2023-01-02');
CREATE TABLE order_numbers_dictionary_parted_07_mln_2023_01_02 PARTITION OF public.order_numbers_dictionary_parted_07_mln FOR VALUES FROM ('2023-01-02') TO ('2023-01-03');
CREATE TABLE order_numbers_dictionary_parted_07_mln_2023_01_03 PARTITION OF public.order_numbers_dictionary_parted_07_mln FOR VALUES FROM ('2023-01-03') TO ('2023-01-04');
CREATE TABLE order_numbers_dictionary_parted_07_mln_2023_01_04 PARTITION OF public.order_numbers_dictionary_parted_07_mln FOR VALUES FROM ('2023-01-04') TO ('2023-01-05');
CREATE TABLE order_numbers_dictionary_parted_07_mln_2023_01_05 PARTITION OF public.order_numbers_dictionary_parted_07_mln FOR VALUES FROM ('2023-01-05') TO ('2023-01-06');
CREATE TABLE order_numbers_dictionary_parted_07_mln_2023_01_06 PARTITION OF public.order_numbers_dictionary_parted_07_mln FOR VALUES FROM ('2023-01-06') TO ('2023-01-07');
CREATE TABLE order_numbers_dictionary_parted_07_mln_2023_01_07 PARTITION OF public.order_numbers_dictionary_parted_07_mln FOR VALUES FROM ('2023-01-07') TO ('2023-01-08');
CREATE TABLE order_numbers_dictionary_parted_07_mln_2023_01_08 PARTITION OF public.order_numbers_dictionary_parted_07_mln FOR VALUES FROM ('2023-01-08') TO ('2023-01-09');
CREATE TABLE order_numbers_dictionary_parted_07_mln_2023_01_09 PARTITION OF public.order_numbers_dictionary_parted_07_mln FOR VALUES FROM ('2023-01-09') TO ('2023-01-10');
CREATE TABLE order_numbers_dictionary_parted_07_mln_2023_01_10 PARTITION OF public.order_numbers_dictionary_parted_07_mln FOR VALUES FROM ('2023-01-10') TO ('2023-01-11');
CREATE TABLE order_numbers_dictionary_parted_07_mln_2023_01_11 PARTITION OF public.order_numbers_dictionary_parted_07_mln FOR VALUES FROM ('2023-01-11') TO ('2023-01-12');

CREATE TABLE IF NOT EXISTS order_numbers_dictionary_parted_08_mln
(
    order_number BIGSERIAL,region_id integer,market_id integer,terminal_id integer,terminal_basket_number bigint,basket_price integer,order_time time without time zone,order_date date NOT NULL,comment character varying(1024) COLLATE pg_catalog."default",
    CONSTRAINT order_numbers_dictionary_parted_08_mln_pkey PRIMARY KEY (order_number, order_date),CONSTRAINT order_numbers_dictionary_parted_08_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT order_numbers_dictionary_parted_08_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT order_numbers_dictionary_parted_08_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION)  PARTITION BY RANGE (order_date);
	
CREATE TABLE order_numbers_dictionary_parted_08_mln_2023_01_01 PARTITION OF public.order_numbers_dictionary_parted_08_mln FOR VALUES FROM ('2023-01-01') TO ('2023-01-02');
CREATE TABLE order_numbers_dictionary_parted_08_mln_2023_01_02 PARTITION OF public.order_numbers_dictionary_parted_08_mln FOR VALUES FROM ('2023-01-02') TO ('2023-01-03');
CREATE TABLE order_numbers_dictionary_parted_08_mln_2023_01_03 PARTITION OF public.order_numbers_dictionary_parted_08_mln FOR VALUES FROM ('2023-01-03') TO ('2023-01-04');
CREATE TABLE order_numbers_dictionary_parted_08_mln_2023_01_04 PARTITION OF public.order_numbers_dictionary_parted_08_mln FOR VALUES FROM ('2023-01-04') TO ('2023-01-05');
CREATE TABLE order_numbers_dictionary_parted_08_mln_2023_01_05 PARTITION OF public.order_numbers_dictionary_parted_08_mln FOR VALUES FROM ('2023-01-05') TO ('2023-01-06');
CREATE TABLE order_numbers_dictionary_parted_08_mln_2023_01_06 PARTITION OF public.order_numbers_dictionary_parted_08_mln FOR VALUES FROM ('2023-01-06') TO ('2023-01-07');
CREATE TABLE order_numbers_dictionary_parted_08_mln_2023_01_07 PARTITION OF public.order_numbers_dictionary_parted_08_mln FOR VALUES FROM ('2023-01-07') TO ('2023-01-08');
CREATE TABLE order_numbers_dictionary_parted_08_mln_2023_01_08 PARTITION OF public.order_numbers_dictionary_parted_08_mln FOR VALUES FROM ('2023-01-08') TO ('2023-01-09');
CREATE TABLE order_numbers_dictionary_parted_08_mln_2023_01_09 PARTITION OF public.order_numbers_dictionary_parted_08_mln FOR VALUES FROM ('2023-01-09') TO ('2023-01-10');
CREATE TABLE order_numbers_dictionary_parted_08_mln_2023_01_10 PARTITION OF public.order_numbers_dictionary_parted_08_mln FOR VALUES FROM ('2023-01-10') TO ('2023-01-11');
CREATE TABLE order_numbers_dictionary_parted_08_mln_2023_01_11 PARTITION OF public.order_numbers_dictionary_parted_08_mln FOR VALUES FROM ('2023-01-11') TO ('2023-01-12');	

CREATE TABLE IF NOT EXISTS order_numbers_dictionary_parted_09_mln
(
    order_number BIGSERIAL,region_id integer,market_id integer,terminal_id integer,terminal_basket_number bigint,basket_price integer,order_time time without time zone,order_date date NOT NULL,comment character varying(1024) COLLATE pg_catalog."default",
    CONSTRAINT order_numbers_dictionary_parted_09_mln_pkey PRIMARY KEY (order_number, order_date),CONSTRAINT order_numbers_dictionary_parted_09_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT order_numbers_dictionary_parted_09_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT order_numbers_dictionary_parted_09_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION)  PARTITION BY RANGE (order_date);

	
CREATE TABLE order_numbers_dictionary_parted_09_mln_2023_01_01 PARTITION OF public.order_numbers_dictionary_parted_09_mln FOR VALUES FROM ('2023-01-01') TO ('2023-01-02');
CREATE TABLE order_numbers_dictionary_parted_09_mln_2023_01_02 PARTITION OF public.order_numbers_dictionary_parted_09_mln FOR VALUES FROM ('2023-01-02') TO ('2023-01-03');
CREATE TABLE order_numbers_dictionary_parted_09_mln_2023_01_03 PARTITION OF public.order_numbers_dictionary_parted_09_mln FOR VALUES FROM ('2023-01-03') TO ('2023-01-04');
CREATE TABLE order_numbers_dictionary_parted_09_mln_2023_01_04 PARTITION OF public.order_numbers_dictionary_parted_09_mln FOR VALUES FROM ('2023-01-04') TO ('2023-01-05');
CREATE TABLE order_numbers_dictionary_parted_09_mln_2023_01_05 PARTITION OF public.order_numbers_dictionary_parted_09_mln FOR VALUES FROM ('2023-01-05') TO ('2023-01-06');
CREATE TABLE order_numbers_dictionary_parted_09_mln_2023_01_06 PARTITION OF public.order_numbers_dictionary_parted_09_mln FOR VALUES FROM ('2023-01-06') TO ('2023-01-07');
CREATE TABLE order_numbers_dictionary_parted_09_mln_2023_01_07 PARTITION OF public.order_numbers_dictionary_parted_09_mln FOR VALUES FROM ('2023-01-07') TO ('2023-01-08');
CREATE TABLE order_numbers_dictionary_parted_09_mln_2023_01_08 PARTITION OF public.order_numbers_dictionary_parted_09_mln FOR VALUES FROM ('2023-01-08') TO ('2023-01-09');
CREATE TABLE order_numbers_dictionary_parted_09_mln_2023_01_09 PARTITION OF public.order_numbers_dictionary_parted_09_mln FOR VALUES FROM ('2023-01-09') TO ('2023-01-10');
CREATE TABLE order_numbers_dictionary_parted_09_mln_2023_01_10 PARTITION OF public.order_numbers_dictionary_parted_09_mln FOR VALUES FROM ('2023-01-10') TO ('2023-01-11');
CREATE TABLE order_numbers_dictionary_parted_09_mln_2023_01_11 PARTITION OF public.order_numbers_dictionary_parted_09_mln FOR VALUES FROM ('2023-01-11') TO ('2023-01-12');	

CREATE TABLE IF NOT EXISTS order_numbers_dictionary_parted_10_mln
(
    order_number BIGSERIAL,region_id integer,market_id integer,terminal_id integer,terminal_basket_number bigint,basket_price integer,order_time time without time zone,order_date date NOT NULL,comment character varying(1024) COLLATE pg_catalog."default",
    CONSTRAINT order_numbers_dictionary_parted_10_mln_pkey PRIMARY KEY (order_number, order_date),CONSTRAINT order_numbers_dictionary_parted_10_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT order_numbers_dictionary_parted_10_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT order_numbers_dictionary_parted_10_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION)  PARTITION BY RANGE (order_date);

CREATE TABLE order_numbers_dictionary_parted_10_mln_2023_01_01 PARTITION OF public.order_numbers_dictionary_parted_10_mln FOR VALUES FROM ('2023-01-01') TO ('2023-01-02');
CREATE TABLE order_numbers_dictionary_parted_10_mln_2023_01_02 PARTITION OF public.order_numbers_dictionary_parted_10_mln FOR VALUES FROM ('2023-01-02') TO ('2023-01-03');
CREATE TABLE order_numbers_dictionary_parted_10_mln_2023_01_03 PARTITION OF public.order_numbers_dictionary_parted_10_mln FOR VALUES FROM ('2023-01-03') TO ('2023-01-04');
CREATE TABLE order_numbers_dictionary_parted_10_mln_2023_01_04 PARTITION OF public.order_numbers_dictionary_parted_10_mln FOR VALUES FROM ('2023-01-04') TO ('2023-01-05');
CREATE TABLE order_numbers_dictionary_parted_10_mln_2023_01_05 PARTITION OF public.order_numbers_dictionary_parted_10_mln FOR VALUES FROM ('2023-01-05') TO ('2023-01-06');
CREATE TABLE order_numbers_dictionary_parted_10_mln_2023_01_06 PARTITION OF public.order_numbers_dictionary_parted_10_mln FOR VALUES FROM ('2023-01-06') TO ('2023-01-07');
CREATE TABLE order_numbers_dictionary_parted_10_mln_2023_01_07 PARTITION OF public.order_numbers_dictionary_parted_10_mln FOR VALUES FROM ('2023-01-07') TO ('2023-01-08');
CREATE TABLE order_numbers_dictionary_parted_10_mln_2023_01_08 PARTITION OF public.order_numbers_dictionary_parted_10_mln FOR VALUES FROM ('2023-01-08') TO ('2023-01-09');
CREATE TABLE order_numbers_dictionary_parted_10_mln_2023_01_09 PARTITION OF public.order_numbers_dictionary_parted_10_mln FOR VALUES FROM ('2023-01-09') TO ('2023-01-10');
CREATE TABLE order_numbers_dictionary_parted_10_mln_2023_01_10 PARTITION OF public.order_numbers_dictionary_parted_10_mln FOR VALUES FROM ('2023-01-10') TO ('2023-01-11');
CREATE TABLE order_numbers_dictionary_parted_10_mln_2023_01_11 PARTITION OF public.order_numbers_dictionary_parted_10_mln FOR VALUES FROM ('2023-01-11') TO ('2023-01-12');

CREATE TABLE IF NOT EXISTS order_numbers_dictionary_parted_20_mln
(
    order_number BIGSERIAL,region_id integer,market_id integer,terminal_id integer,terminal_basket_number bigint,basket_price integer,order_time time without time zone,order_date date NOT NULL,comment character varying(1024) COLLATE pg_catalog."default",
    CONSTRAINT order_numbers_dictionary_parted_20_mln_pkey PRIMARY KEY (order_number, order_date),CONSTRAINT order_numbers_dictionary_parted_20_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT order_numbers_dictionary_parted_20_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT order_numbers_dictionary_parted_20_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION)  PARTITION BY RANGE (order_date);

CREATE TABLE order_numbers_dictionary_parted_20_mln_2023_01_01 PARTITION OF public.order_numbers_dictionary_parted_20_mln FOR VALUES FROM ('2023-01-01') TO ('2023-01-02');
CREATE TABLE order_numbers_dictionary_parted_20_mln_2023_01_02 PARTITION OF public.order_numbers_dictionary_parted_20_mln FOR VALUES FROM ('2023-01-02') TO ('2023-01-03');
CREATE TABLE order_numbers_dictionary_parted_20_mln_2023_01_03 PARTITION OF public.order_numbers_dictionary_parted_20_mln FOR VALUES FROM ('2023-01-03') TO ('2023-01-04');
CREATE TABLE order_numbers_dictionary_parted_20_mln_2023_01_04 PARTITION OF public.order_numbers_dictionary_parted_20_mln FOR VALUES FROM ('2023-01-04') TO ('2023-01-05');
CREATE TABLE order_numbers_dictionary_parted_20_mln_2023_01_05 PARTITION OF public.order_numbers_dictionary_parted_20_mln FOR VALUES FROM ('2023-01-05') TO ('2023-01-06');
CREATE TABLE order_numbers_dictionary_parted_20_mln_2023_01_06 PARTITION OF public.order_numbers_dictionary_parted_20_mln FOR VALUES FROM ('2023-01-06') TO ('2023-01-07');
CREATE TABLE order_numbers_dictionary_parted_20_mln_2023_01_07 PARTITION OF public.order_numbers_dictionary_parted_20_mln FOR VALUES FROM ('2023-01-07') TO ('2023-01-08');
CREATE TABLE order_numbers_dictionary_parted_20_mln_2023_01_08 PARTITION OF public.order_numbers_dictionary_parted_20_mln FOR VALUES FROM ('2023-01-08') TO ('2023-01-09');
CREATE TABLE order_numbers_dictionary_parted_20_mln_2023_01_09 PARTITION OF public.order_numbers_dictionary_parted_20_mln FOR VALUES FROM ('2023-01-09') TO ('2023-01-10');
CREATE TABLE order_numbers_dictionary_parted_20_mln_2023_01_10 PARTITION OF public.order_numbers_dictionary_parted_20_mln FOR VALUES FROM ('2023-01-10') TO ('2023-01-11');
CREATE TABLE order_numbers_dictionary_parted_20_mln_2023_01_11 PARTITION OF public.order_numbers_dictionary_parted_20_mln FOR VALUES FROM ('2023-01-11') TO ('2023-01-12');

CREATE TABLE IF NOT EXISTS order_numbers_dictionary_parted_30_mln
(
    order_number BIGSERIAL,region_id integer,market_id integer,terminal_id integer,terminal_basket_number bigint,basket_price integer,order_time time without time zone,order_date date NOT NULL,comment character varying(1024) COLLATE pg_catalog."default",
    CONSTRAINT order_numbers_dictionary_parted_30_mln_pkey PRIMARY KEY (order_number, order_date),CONSTRAINT order_numbers_dictionary_parted_30_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT order_numbers_dictionary_parted_30_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT order_numbers_dictionary_parted_30_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION)  PARTITION BY RANGE (order_date);

CREATE TABLE order_numbers_dictionary_parted_30_mln_2023_01_01 PARTITION OF public.order_numbers_dictionary_parted_30_mln FOR VALUES FROM ('2023-01-01') TO ('2023-01-02');
CREATE TABLE order_numbers_dictionary_parted_30_mln_2023_01_02 PARTITION OF public.order_numbers_dictionary_parted_30_mln FOR VALUES FROM ('2023-01-02') TO ('2023-01-03');
CREATE TABLE order_numbers_dictionary_parted_30_mln_2023_01_03 PARTITION OF public.order_numbers_dictionary_parted_30_mln FOR VALUES FROM ('2023-01-03') TO ('2023-01-04');
CREATE TABLE order_numbers_dictionary_parted_30_mln_2023_01_04 PARTITION OF public.order_numbers_dictionary_parted_30_mln FOR VALUES FROM ('2023-01-04') TO ('2023-01-05');
CREATE TABLE order_numbers_dictionary_parted_30_mln_2023_01_05 PARTITION OF public.order_numbers_dictionary_parted_30_mln FOR VALUES FROM ('2023-01-05') TO ('2023-01-06');
CREATE TABLE order_numbers_dictionary_parted_30_mln_2023_01_06 PARTITION OF public.order_numbers_dictionary_parted_30_mln FOR VALUES FROM ('2023-01-06') TO ('2023-01-07');
CREATE TABLE order_numbers_dictionary_parted_30_mln_2023_01_07 PARTITION OF public.order_numbers_dictionary_parted_30_mln FOR VALUES FROM ('2023-01-07') TO ('2023-01-08');
CREATE TABLE order_numbers_dictionary_parted_30_mln_2023_01_08 PARTITION OF public.order_numbers_dictionary_parted_30_mln FOR VALUES FROM ('2023-01-08') TO ('2023-01-09');
CREATE TABLE order_numbers_dictionary_parted_30_mln_2023_01_09 PARTITION OF public.order_numbers_dictionary_parted_30_mln FOR VALUES FROM ('2023-01-09') TO ('2023-01-10');
CREATE TABLE order_numbers_dictionary_parted_30_mln_2023_01_10 PARTITION OF public.order_numbers_dictionary_parted_30_mln FOR VALUES FROM ('2023-01-10') TO ('2023-01-11');
CREATE TABLE order_numbers_dictionary_parted_30_mln_2023_01_11 PARTITION OF public.order_numbers_dictionary_parted_30_mln FOR VALUES FROM ('2023-01-11') TO ('2023-01-12');

CREATE TABLE IF NOT EXISTS order_numbers_dictionary_parted_40_mln
(
    order_number BIGSERIAL,region_id integer,market_id integer,terminal_id integer,terminal_basket_number bigint,basket_price integer,order_time time without time zone,order_date date NOT NULL,comment character varying(1024) COLLATE pg_catalog."default",
    CONSTRAINT order_numbers_dictionary_parted_40_mln_pkey PRIMARY KEY (order_number, order_date),CONSTRAINT order_numbers_dictionary_parted_40_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT order_numbers_dictionary_parted_40_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT order_numbers_dictionary_parted_40_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION)  PARTITION BY RANGE (order_date);


CREATE TABLE order_numbers_dictionary_parted_40_mln_2023_01_01 PARTITION OF public.order_numbers_dictionary_parted_40_mln FOR VALUES FROM ('2023-01-01') TO ('2023-01-02');
CREATE TABLE order_numbers_dictionary_parted_40_mln_2023_01_02 PARTITION OF public.order_numbers_dictionary_parted_40_mln FOR VALUES FROM ('2023-01-02') TO ('2023-01-03');
CREATE TABLE order_numbers_dictionary_parted_40_mln_2023_01_03 PARTITION OF public.order_numbers_dictionary_parted_40_mln FOR VALUES FROM ('2023-01-03') TO ('2023-01-04');
CREATE TABLE order_numbers_dictionary_parted_40_mln_2023_01_04 PARTITION OF public.order_numbers_dictionary_parted_40_mln FOR VALUES FROM ('2023-01-04') TO ('2023-01-05');
CREATE TABLE order_numbers_dictionary_parted_40_mln_2023_01_05 PARTITION OF public.order_numbers_dictionary_parted_40_mln FOR VALUES FROM ('2023-01-05') TO ('2023-01-06');
CREATE TABLE order_numbers_dictionary_parted_40_mln_2023_01_06 PARTITION OF public.order_numbers_dictionary_parted_40_mln FOR VALUES FROM ('2023-01-06') TO ('2023-01-07');
CREATE TABLE order_numbers_dictionary_parted_40_mln_2023_01_07 PARTITION OF public.order_numbers_dictionary_parted_40_mln FOR VALUES FROM ('2023-01-07') TO ('2023-01-08');
CREATE TABLE order_numbers_dictionary_parted_40_mln_2023_01_08 PARTITION OF public.order_numbers_dictionary_parted_40_mln FOR VALUES FROM ('2023-01-08') TO ('2023-01-09');
CREATE TABLE order_numbers_dictionary_parted_40_mln_2023_01_09 PARTITION OF public.order_numbers_dictionary_parted_40_mln FOR VALUES FROM ('2023-01-09') TO ('2023-01-10');
CREATE TABLE order_numbers_dictionary_parted_40_mln_2023_01_10 PARTITION OF public.order_numbers_dictionary_parted_40_mln FOR VALUES FROM ('2023-01-10') TO ('2023-01-11');
CREATE TABLE order_numbers_dictionary_parted_40_mln_2023_01_11 PARTITION OF public.order_numbers_dictionary_parted_40_mln FOR VALUES FROM ('2023-01-11') TO ('2023-01-12');



CREATE INDEX IF NOT EXISTS index_order_date_order_numbers_dictionary_parted_01_mln ON public.order_numbers_dictionary_parted_01_mln USING btree(order_date ASC NULLS LAST);
CREATE INDEX IF NOT EXISTS index_order_date_order_numbers_dictionary_parted_02_mln ON public.order_numbers_dictionary_parted_02_mln USING btree(order_date ASC NULLS LAST);
CREATE INDEX IF NOT EXISTS index_order_date_order_numbers_dictionary_parted_03_mln ON public.order_numbers_dictionary_parted_03_mln USING btree(order_date ASC NULLS LAST);
CREATE INDEX IF NOT EXISTS index_order_date_order_numbers_dictionary_parted_04_mln ON public.order_numbers_dictionary_parted_04_mln USING btree(order_date ASC NULLS LAST);
CREATE INDEX IF NOT EXISTS index_order_date_order_numbers_dictionary_parted_05_mln ON public.order_numbers_dictionary_parted_05_mln USING btree(order_date ASC NULLS LAST);
CREATE INDEX IF NOT EXISTS index_order_date_order_numbers_dictionary_parted_06_mln ON public.order_numbers_dictionary_parted_06_mln USING btree(order_date ASC NULLS LAST);
CREATE INDEX IF NOT EXISTS index_order_date_order_numbers_dictionary_parted_07_mln ON public.order_numbers_dictionary_parted_07_mln USING btree(order_date ASC NULLS LAST);
CREATE INDEX IF NOT EXISTS index_order_date_order_numbers_dictionary_parted_08_mln ON public.order_numbers_dictionary_parted_08_mln USING btree(order_date ASC NULLS LAST);
CREATE INDEX IF NOT EXISTS index_order_date_order_numbers_dictionary_parted_09_mln ON public.order_numbers_dictionary_parted_09_mln USING btree(order_date ASC NULLS LAST);
CREATE INDEX IF NOT EXISTS index_order_date_order_numbers_dictionary_parted_10_mln ON public.order_numbers_dictionary_parted_10_mln USING btree(order_date ASC NULLS LAST);
CREATE INDEX IF NOT EXISTS index_order_date_order_numbers_dictionary_parted_20_mln ON public.order_numbers_dictionary_parted_20_mln USING btree(order_date ASC NULLS LAST);
CREATE INDEX IF NOT EXISTS index_order_date_order_numbers_dictionary_parted_30_mln ON public.order_numbers_dictionary_parted_30_mln USING btree(order_date ASC NULLS LAST);
CREATE INDEX IF NOT EXISTS index_order_date_order_numbers_dictionary_parted_40_mln ON public.order_numbers_dictionary_parted_40_mln USING btree(order_date ASC NULLS LAST);
