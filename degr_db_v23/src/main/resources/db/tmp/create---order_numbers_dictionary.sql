
CREATE TABLE IF NOT EXISTS order_numbers_dictionary_01_mln
(
    order_number BIGSERIAL,region_id integer,market_id integer,terminal_id integer,terminal_basket_number bigint,basket_price integer,order_time time without time zone,order_date date NOT NULL,comment character varying(1024) COLLATE pg_catalog."default",
    CONSTRAINT order_numbers_dictionary_01_mln_pkey PRIMARY KEY (order_number, order_date),CONSTRAINT order_numbers_dictionary_01_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT order_numbers_dictionary_01_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT order_numbers_dictionary_01_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION) TABLESPACE pg_default;

CREATE TABLE IF NOT EXISTS order_numbers_dictionary_02_mln
(
    order_number BIGSERIAL,region_id integer,market_id integer,terminal_id integer,terminal_basket_number bigint,basket_price integer,order_time time without time zone,order_date date NOT NULL,comment character varying(1024) COLLATE pg_catalog."default",
    CONSTRAINT order_numbers_dictionary_02_mln_pkey PRIMARY KEY (order_number, order_date),CONSTRAINT order_numbers_dictionary_02_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT order_numbers_dictionary_02_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT order_numbers_dictionary_02_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION) TABLESPACE pg_default;

CREATE TABLE IF NOT EXISTS order_numbers_dictionary_03_mln
(
    order_number BIGSERIAL,region_id integer,market_id integer,terminal_id integer,terminal_basket_number bigint,basket_price integer,order_time time without time zone,order_date date NOT NULL,comment character varying(1024) COLLATE pg_catalog."default",
    CONSTRAINT order_numbers_dictionary_03_mln_pkey PRIMARY KEY (order_number, order_date),CONSTRAINT order_numbers_dictionary_03_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT order_numbers_dictionary_03_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT order_numbers_dictionary_03_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION) TABLESPACE pg_default;

CREATE TABLE IF NOT EXISTS order_numbers_dictionary_04_mln
(
    order_number BIGSERIAL,region_id integer,market_id integer,terminal_id integer,terminal_basket_number bigint,basket_price integer,order_time time without time zone,order_date date NOT NULL,comment character varying(1024) COLLATE pg_catalog."default",
    CONSTRAINT order_numbers_dictionary_04_mln_pkey PRIMARY KEY (order_number, order_date),CONSTRAINT order_numbers_dictionary_04_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT order_numbers_dictionary_04_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT order_numbers_dictionary_04_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION) TABLESPACE pg_default;

CREATE TABLE IF NOT EXISTS order_numbers_dictionary_05_mln
(
    order_number BIGSERIAL,region_id integer,market_id integer,terminal_id integer,terminal_basket_number bigint,basket_price integer,order_time time without time zone,order_date date NOT NULL,comment character varying(1024) COLLATE pg_catalog."default",
    CONSTRAINT order_numbers_dictionary_05_mln_pkey PRIMARY KEY (order_number, order_date),CONSTRAINT order_numbers_dictionary_05_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT order_numbers_dictionary_05_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT order_numbers_dictionary_05_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION) TABLESPACE pg_default;

CREATE TABLE IF NOT EXISTS order_numbers_dictionary_06_mln
(
    order_number BIGSERIAL,region_id integer,market_id integer,terminal_id integer,terminal_basket_number bigint,basket_price integer,order_time time without time zone,order_date date NOT NULL,comment character varying(1024) COLLATE pg_catalog."default",
    CONSTRAINT order_numbers_dictionary_06_mln_pkey PRIMARY KEY (order_number, order_date),CONSTRAINT order_numbers_dictionary_06_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT order_numbers_dictionary_06_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT order_numbers_dictionary_06_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION) TABLESPACE pg_default;

CREATE TABLE IF NOT EXISTS order_numbers_dictionary_07_mln
(
    order_number BIGSERIAL,region_id integer,market_id integer,terminal_id integer,terminal_basket_number bigint,basket_price integer,order_time time without time zone,order_date date NOT NULL,comment character varying(1024) COLLATE pg_catalog."default",
    CONSTRAINT order_numbers_dictionary_07_mln_pkey PRIMARY KEY (order_number, order_date),CONSTRAINT order_numbers_dictionary_07_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT order_numbers_dictionary_07_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT order_numbers_dictionary_07_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION) TABLESPACE pg_default;

CREATE TABLE IF NOT EXISTS order_numbers_dictionary_08_mln
(
    order_number BIGSERIAL,region_id integer,market_id integer,terminal_id integer,terminal_basket_number bigint,basket_price integer,order_time time without time zone,order_date date NOT NULL,comment character varying(1024) COLLATE pg_catalog."default",
    CONSTRAINT order_numbers_dictionary_08_mln_pkey PRIMARY KEY (order_number, order_date),CONSTRAINT order_numbers_dictionary_08_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT order_numbers_dictionary_08_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT order_numbers_dictionary_08_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION) TABLESPACE pg_default;

CREATE TABLE IF NOT EXISTS order_numbers_dictionary_09_mln
(
    order_number BIGSERIAL,region_id integer,market_id integer,terminal_id integer,terminal_basket_number bigint,basket_price integer,order_time time without time zone,order_date date NOT NULL,comment character varying(1024) COLLATE pg_catalog."default",
    CONSTRAINT order_numbers_dictionary_09_mln_pkey PRIMARY KEY (order_number, order_date),CONSTRAINT order_numbers_dictionary_09_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT order_numbers_dictionary_09_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT order_numbers_dictionary_09_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION) TABLESPACE pg_default;

CREATE TABLE IF NOT EXISTS order_numbers_dictionary_10_mln
(
    order_number BIGSERIAL,region_id integer,market_id integer,terminal_id integer,terminal_basket_number bigint,basket_price integer,order_time time without time zone,order_date date NOT NULL,comment character varying(1024) COLLATE pg_catalog."default",
    CONSTRAINT order_numbers_dictionary_10_mln_pkey PRIMARY KEY (order_number, order_date),CONSTRAINT order_numbers_dictionary_10_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT order_numbers_dictionary_10_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT order_numbers_dictionary_10_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION) TABLESPACE pg_default;

CREATE TABLE IF NOT EXISTS order_numbers_dictionary_20_mln
(
    order_number BIGSERIAL,region_id integer,market_id integer,terminal_id integer,terminal_basket_number bigint,basket_price integer,order_time time without time zone,order_date date NOT NULL,comment character varying(1024) COLLATE pg_catalog."default",
    CONSTRAINT order_numbers_dictionary_20_mln_pkey PRIMARY KEY (order_number, order_date),CONSTRAINT order_numbers_dictionary_20_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT order_numbers_dictionary_20_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT order_numbers_dictionary_20_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION) TABLESPACE pg_default;

CREATE TABLE IF NOT EXISTS order_numbers_dictionary_30_mln
(
    order_number BIGSERIAL,region_id integer,market_id integer,terminal_id integer,terminal_basket_number bigint,basket_price integer,order_time time without time zone,order_date date NOT NULL,comment character varying(1024) COLLATE pg_catalog."default",
    CONSTRAINT order_numbers_dictionary_30_mln_pkey PRIMARY KEY (order_number, order_date),CONSTRAINT order_numbers_dictionary_30_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT order_numbers_dictionary_30_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT order_numbers_dictionary_30_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION) TABLESPACE pg_default;

CREATE TABLE IF NOT EXISTS order_numbers_dictionary_40_mln
(
    order_number BIGSERIAL,region_id integer,market_id integer,terminal_id integer,terminal_basket_number bigint,basket_price integer,order_time time without time zone,order_date date NOT NULL,comment character varying(1024) COLLATE pg_catalog."default",
    CONSTRAINT order_numbers_dictionary_40_mln_pkey PRIMARY KEY (order_number, order_date),CONSTRAINT order_numbers_dictionary_40_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT order_numbers_dictionary_40_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT order_numbers_dictionary_40_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION) TABLESPACE pg_default;





CREATE INDEX IF NOT EXISTS index_order_date_order_numbers_dictionary_01_mln ON public.order_numbers_dictionary_01_mln USING btree(order_date ASC NULLS LAST) TABLESPACE pg_default;
CREATE INDEX IF NOT EXISTS index_order_date_order_numbers_dictionary_02_mln ON public.order_numbers_dictionary_02_mln USING btree(order_date ASC NULLS LAST) TABLESPACE pg_default;
CREATE INDEX IF NOT EXISTS index_order_date_order_numbers_dictionary_03_mln ON public.order_numbers_dictionary_03_mln USING btree(order_date ASC NULLS LAST) TABLESPACE pg_default;
CREATE INDEX IF NOT EXISTS index_order_date_order_numbers_dictionary_04_mln ON public.order_numbers_dictionary_04_mln USING btree(order_date ASC NULLS LAST) TABLESPACE pg_default;
CREATE INDEX IF NOT EXISTS index_order_date_order_numbers_dictionary_05_mln ON public.order_numbers_dictionary_05_mln USING btree(order_date ASC NULLS LAST) TABLESPACE pg_default;
CREATE INDEX IF NOT EXISTS index_order_date_order_numbers_dictionary_06_mln ON public.order_numbers_dictionary_06_mln USING btree(order_date ASC NULLS LAST) TABLESPACE pg_default;
CREATE INDEX IF NOT EXISTS index_order_date_order_numbers_dictionary_07_mln ON public.order_numbers_dictionary_07_mln USING btree(order_date ASC NULLS LAST) TABLESPACE pg_default;
CREATE INDEX IF NOT EXISTS index_order_date_order_numbers_dictionary_08_mln ON public.order_numbers_dictionary_08_mln USING btree(order_date ASC NULLS LAST) TABLESPACE pg_default;
CREATE INDEX IF NOT EXISTS index_order_date_order_numbers_dictionary_09_mln ON public.order_numbers_dictionary_09_mln USING btree(order_date ASC NULLS LAST) TABLESPACE pg_default;
CREATE INDEX IF NOT EXISTS index_order_date_order_numbers_dictionary_10_mln ON public.order_numbers_dictionary_10_mln USING btree(order_date ASC NULLS LAST) TABLESPACE pg_default;
CREATE INDEX IF NOT EXISTS index_order_date_order_numbers_dictionary_20_mln ON public.order_numbers_dictionary_20_mln USING btree(order_date ASC NULLS LAST) TABLESPACE pg_default;
CREATE INDEX IF NOT EXISTS index_order_date_order_numbers_dictionary_30_mln ON public.order_numbers_dictionary_30_mln USING btree(order_date ASC NULLS LAST) TABLESPACE pg_default;
CREATE INDEX IF NOT EXISTS index_order_date_order_numbers_dictionary_40_mln ON public.order_numbers_dictionary_40_mln USING btree(order_date ASC NULLS LAST) TABLESPACE pg_default;
