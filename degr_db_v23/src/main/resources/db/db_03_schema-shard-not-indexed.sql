--
-- PostgreSQL database dump
--

-- Dumped from database version 15.6
-- Dumped by pg_dump version 15.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: p_create_loyality(); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.p_create_loyality()
    LANGUAGE plpgsql
    AS $$
  DECLARE      
    category_id   integer;  
    max_category_id  integer;  
	
  BEGIN      
    category_id := 1; 
	max_category_id := 26; 

	WHILE category_id <  max_category_id LOOP

			CALL p_create_loyality_internal(category_id);
			category_id := category_id + 1;
			
	END LOOP;    
END;
$$;


ALTER PROCEDURE public.p_create_loyality() OWNER TO postgres;

--
-- Name: p_create_loyality_internal(integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.p_create_loyality_internal(IN category_id integer)
    LANGUAGE plpgsql
    AS $$
  DECLARE  
    sql_oper    text;
    table_name  VARCHAR;
    i_loop      integer;
    
	region_id      integer;        
	max_region_id  integer;    
    
    loyality_name     VARCHAR;	
  BEGIN      
    table_name := 'loyality';		
    region_id  := 1; 
	
	max_region_id   := 11; 	

	WHILE region_id < max_region_id LOOP			
		
			loyality_name = format('loyality programm for Region #%s and Category #%s',region_id, category_id);
			sql_oper := format('INSERT INTO %s(loyality_programm_name, region_id, product_category, coefficient) VALUES (%L, %s, %s, %s)', table_name, loyality_name, region_id, category_id, 0.003*region_id*category_id);
			
			EXECUTE sql_oper;			
			region_id := region_id + 1;        
		
	END LOOP;        
END;
$$;


ALTER PROCEDURE public.p_create_loyality_internal(IN category_id integer) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clients (
    id integer NOT NULL,
    region_id integer,
    name character varying(128),
    surname character varying(128),
    second_name character varying(128),
    birthdate character varying(1024),
    count_of_bonuses bigint,
    comment character varying(1024)
);


ALTER TABLE public.clients OWNER TO postgres;

--
-- Name: clients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clients_id_seq OWNER TO postgres;

--
-- Name: clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clients_id_seq OWNED BY public.clients.id;


--
-- Name: loyality; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.loyality (
    id bigint NOT NULL,
    loyality_programm_name character varying NOT NULL,
    region_id integer NOT NULL,
    product_category integer NOT NULL,
    coefficient double precision NOT NULL
);


ALTER TABLE public.loyality OWNER TO postgres;

--
-- Name: loyality_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.loyality_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.loyality_id_seq OWNER TO postgres;

--
-- Name: loyality_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.loyality_id_seq OWNED BY public.loyality.id;


--
-- Name: markets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.markets (
    id integer NOT NULL,
    region_id integer,
    market_id_on_region integer NOT NULL,
    market_name character varying(128),
    comment character varying(1024)
);


ALTER TABLE public.markets OWNER TO postgres;

--
-- Name: markets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.markets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.markets_id_seq OWNER TO postgres;

--
-- Name: markets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.markets_id_seq OWNED BY public.markets.id;


--
-- Name: order_numbers_dictionary; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_numbers_dictionary (
    order_number bigint NOT NULL,
    region_id integer,
    market_id integer,
    terminal_id integer,
    terminal_basket_number bigint,
    basket_price integer,
    order_time time without time zone,
    order_date date NOT NULL,
    comment character varying(1024)
);


ALTER TABLE public.order_numbers_dictionary OWNER TO postgres;

--
-- Name: order_numbers_dictionary_01_mln; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_numbers_dictionary_01_mln (
    order_number bigint NOT NULL,
    region_id integer,
    market_id integer,
    terminal_id integer,
    terminal_basket_number bigint,
    basket_price integer,
    order_time time without time zone,
    order_date date NOT NULL,
    comment character varying(1024)
);


ALTER TABLE public.order_numbers_dictionary_01_mln OWNER TO postgres;

--
-- Name: order_numbers_dictionary_01_mln_order_number_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_numbers_dictionary_01_mln_order_number_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_numbers_dictionary_01_mln_order_number_seq OWNER TO postgres;

--
-- Name: order_numbers_dictionary_01_mln_order_number_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_numbers_dictionary_01_mln_order_number_seq OWNED BY public.order_numbers_dictionary_01_mln.order_number;


--
-- Name: order_numbers_dictionary_02_mln; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_numbers_dictionary_02_mln (
    order_number bigint NOT NULL,
    region_id integer,
    market_id integer,
    terminal_id integer,
    terminal_basket_number bigint,
    basket_price integer,
    order_time time without time zone,
    order_date date NOT NULL,
    comment character varying(1024)
);


ALTER TABLE public.order_numbers_dictionary_02_mln OWNER TO postgres;

--
-- Name: order_numbers_dictionary_02_mln_order_number_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_numbers_dictionary_02_mln_order_number_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_numbers_dictionary_02_mln_order_number_seq OWNER TO postgres;

--
-- Name: order_numbers_dictionary_02_mln_order_number_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_numbers_dictionary_02_mln_order_number_seq OWNED BY public.order_numbers_dictionary_02_mln.order_number;


--
-- Name: order_numbers_dictionary_03_mln; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_numbers_dictionary_03_mln (
    order_number bigint NOT NULL,
    region_id integer,
    market_id integer,
    terminal_id integer,
    terminal_basket_number bigint,
    basket_price integer,
    order_time time without time zone,
    order_date date NOT NULL,
    comment character varying(1024)
);


ALTER TABLE public.order_numbers_dictionary_03_mln OWNER TO postgres;

--
-- Name: order_numbers_dictionary_03_mln_order_number_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_numbers_dictionary_03_mln_order_number_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_numbers_dictionary_03_mln_order_number_seq OWNER TO postgres;

--
-- Name: order_numbers_dictionary_03_mln_order_number_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_numbers_dictionary_03_mln_order_number_seq OWNED BY public.order_numbers_dictionary_03_mln.order_number;


--
-- Name: order_numbers_dictionary_04_mln; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_numbers_dictionary_04_mln (
    order_number bigint NOT NULL,
    region_id integer,
    market_id integer,
    terminal_id integer,
    terminal_basket_number bigint,
    basket_price integer,
    order_time time without time zone,
    order_date date NOT NULL,
    comment character varying(1024)
);


ALTER TABLE public.order_numbers_dictionary_04_mln OWNER TO postgres;

--
-- Name: order_numbers_dictionary_04_mln_order_number_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_numbers_dictionary_04_mln_order_number_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_numbers_dictionary_04_mln_order_number_seq OWNER TO postgres;

--
-- Name: order_numbers_dictionary_04_mln_order_number_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_numbers_dictionary_04_mln_order_number_seq OWNED BY public.order_numbers_dictionary_04_mln.order_number;


--
-- Name: order_numbers_dictionary_05_mln; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_numbers_dictionary_05_mln (
    order_number bigint NOT NULL,
    region_id integer,
    market_id integer,
    terminal_id integer,
    terminal_basket_number bigint,
    basket_price integer,
    order_time time without time zone,
    order_date date NOT NULL,
    comment character varying(1024)
);


ALTER TABLE public.order_numbers_dictionary_05_mln OWNER TO postgres;

--
-- Name: order_numbers_dictionary_05_mln_order_number_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_numbers_dictionary_05_mln_order_number_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_numbers_dictionary_05_mln_order_number_seq OWNER TO postgres;

--
-- Name: order_numbers_dictionary_05_mln_order_number_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_numbers_dictionary_05_mln_order_number_seq OWNED BY public.order_numbers_dictionary_05_mln.order_number;


--
-- Name: order_numbers_dictionary_06_mln; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_numbers_dictionary_06_mln (
    order_number bigint NOT NULL,
    region_id integer,
    market_id integer,
    terminal_id integer,
    terminal_basket_number bigint,
    basket_price integer,
    order_time time without time zone,
    order_date date NOT NULL,
    comment character varying(1024)
);


ALTER TABLE public.order_numbers_dictionary_06_mln OWNER TO postgres;

--
-- Name: order_numbers_dictionary_06_mln_order_number_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_numbers_dictionary_06_mln_order_number_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_numbers_dictionary_06_mln_order_number_seq OWNER TO postgres;

--
-- Name: order_numbers_dictionary_06_mln_order_number_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_numbers_dictionary_06_mln_order_number_seq OWNED BY public.order_numbers_dictionary_06_mln.order_number;


--
-- Name: order_numbers_dictionary_07_mln; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_numbers_dictionary_07_mln (
    order_number bigint NOT NULL,
    region_id integer,
    market_id integer,
    terminal_id integer,
    terminal_basket_number bigint,
    basket_price integer,
    order_time time without time zone,
    order_date date NOT NULL,
    comment character varying(1024)
);


ALTER TABLE public.order_numbers_dictionary_07_mln OWNER TO postgres;

--
-- Name: order_numbers_dictionary_07_mln_order_number_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_numbers_dictionary_07_mln_order_number_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_numbers_dictionary_07_mln_order_number_seq OWNER TO postgres;

--
-- Name: order_numbers_dictionary_07_mln_order_number_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_numbers_dictionary_07_mln_order_number_seq OWNED BY public.order_numbers_dictionary_07_mln.order_number;


--
-- Name: order_numbers_dictionary_08_mln; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_numbers_dictionary_08_mln (
    order_number bigint NOT NULL,
    region_id integer,
    market_id integer,
    terminal_id integer,
    terminal_basket_number bigint,
    basket_price integer,
    order_time time without time zone,
    order_date date NOT NULL,
    comment character varying(1024)
);


ALTER TABLE public.order_numbers_dictionary_08_mln OWNER TO postgres;

--
-- Name: order_numbers_dictionary_08_mln_order_number_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_numbers_dictionary_08_mln_order_number_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_numbers_dictionary_08_mln_order_number_seq OWNER TO postgres;

--
-- Name: order_numbers_dictionary_08_mln_order_number_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_numbers_dictionary_08_mln_order_number_seq OWNED BY public.order_numbers_dictionary_08_mln.order_number;


--
-- Name: order_numbers_dictionary_09_mln; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_numbers_dictionary_09_mln (
    order_number bigint NOT NULL,
    region_id integer,
    market_id integer,
    terminal_id integer,
    terminal_basket_number bigint,
    basket_price integer,
    order_time time without time zone,
    order_date date NOT NULL,
    comment character varying(1024)
);


ALTER TABLE public.order_numbers_dictionary_09_mln OWNER TO postgres;

--
-- Name: order_numbers_dictionary_09_mln_order_number_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_numbers_dictionary_09_mln_order_number_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_numbers_dictionary_09_mln_order_number_seq OWNER TO postgres;

--
-- Name: order_numbers_dictionary_09_mln_order_number_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_numbers_dictionary_09_mln_order_number_seq OWNED BY public.order_numbers_dictionary_09_mln.order_number;


--
-- Name: order_numbers_dictionary_10_mln; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_numbers_dictionary_10_mln (
    order_number bigint NOT NULL,
    region_id integer,
    market_id integer,
    terminal_id integer,
    terminal_basket_number bigint,
    basket_price integer,
    order_time time without time zone,
    order_date date NOT NULL,
    comment character varying(1024)
);


ALTER TABLE public.order_numbers_dictionary_10_mln OWNER TO postgres;

--
-- Name: order_numbers_dictionary_10_mln_order_number_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_numbers_dictionary_10_mln_order_number_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_numbers_dictionary_10_mln_order_number_seq OWNER TO postgres;

--
-- Name: order_numbers_dictionary_10_mln_order_number_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_numbers_dictionary_10_mln_order_number_seq OWNED BY public.order_numbers_dictionary_10_mln.order_number;


--
-- Name: order_numbers_dictionary_20_mln; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_numbers_dictionary_20_mln (
    order_number bigint NOT NULL,
    region_id integer,
    market_id integer,
    terminal_id integer,
    terminal_basket_number bigint,
    basket_price integer,
    order_time time without time zone,
    order_date date NOT NULL,
    comment character varying(1024)
);


ALTER TABLE public.order_numbers_dictionary_20_mln OWNER TO postgres;

--
-- Name: order_numbers_dictionary_20_mln_order_number_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_numbers_dictionary_20_mln_order_number_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_numbers_dictionary_20_mln_order_number_seq OWNER TO postgres;

--
-- Name: order_numbers_dictionary_20_mln_order_number_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_numbers_dictionary_20_mln_order_number_seq OWNED BY public.order_numbers_dictionary_20_mln.order_number;


--
-- Name: order_numbers_dictionary_30_mln; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_numbers_dictionary_30_mln (
    order_number bigint NOT NULL,
    region_id integer,
    market_id integer,
    terminal_id integer,
    terminal_basket_number bigint,
    basket_price integer,
    order_time time without time zone,
    order_date date NOT NULL,
    comment character varying(1024)
);


ALTER TABLE public.order_numbers_dictionary_30_mln OWNER TO postgres;

--
-- Name: order_numbers_dictionary_30_mln_order_number_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_numbers_dictionary_30_mln_order_number_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_numbers_dictionary_30_mln_order_number_seq OWNER TO postgres;

--
-- Name: order_numbers_dictionary_30_mln_order_number_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_numbers_dictionary_30_mln_order_number_seq OWNED BY public.order_numbers_dictionary_30_mln.order_number;


--
-- Name: order_numbers_dictionary_40_mln; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_numbers_dictionary_40_mln (
    order_number bigint NOT NULL,
    region_id integer,
    market_id integer,
    terminal_id integer,
    terminal_basket_number bigint,
    basket_price integer,
    order_time time without time zone,
    order_date date NOT NULL,
    comment character varying(1024)
);


ALTER TABLE public.order_numbers_dictionary_40_mln OWNER TO postgres;

--
-- Name: order_numbers_dictionary_40_mln_order_number_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_numbers_dictionary_40_mln_order_number_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_numbers_dictionary_40_mln_order_number_seq OWNER TO postgres;

--
-- Name: order_numbers_dictionary_40_mln_order_number_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_numbers_dictionary_40_mln_order_number_seq OWNED BY public.order_numbers_dictionary_40_mln.order_number;


--
-- Name: order_numbers_dictionary_order_number_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_numbers_dictionary_order_number_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_numbers_dictionary_order_number_seq OWNER TO postgres;

--
-- Name: order_numbers_dictionary_order_number_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_numbers_dictionary_order_number_seq OWNED BY public.order_numbers_dictionary.order_number;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    product_name character varying(128),
    cost integer,
    count_of_product integer,
    delivery_datetime time without time zone,
    comment character varying(1024),
    loyality_id integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: regions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.regions (
    id integer NOT NULL,
    region_name character varying(128),
    comment character varying(1024)
);


ALTER TABLE public.regions OWNER TO postgres;

--
-- Name: regions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.regions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.regions_id_seq OWNER TO postgres;

--
-- Name: regions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.regions_id_seq OWNED BY public.regions.id;


--
-- Name: sales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales (
    id bigint NOT NULL,
    order_number bigint NOT NULL,
    line_number_in_order integer,
    region_id integer,
    market_id integer,
    terminal_id integer,
    product_id integer,
    count_of_product integer,
    price_of_one_piece integer,
    order_date date NOT NULL,
    client_id integer,
    comment character varying(1024)
);


ALTER TABLE public.sales OWNER TO postgres;

--
-- Name: sales_01_mln; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales_01_mln (
    id bigint NOT NULL,
    order_number bigint NOT NULL,
    line_number_in_order integer,
    region_id integer,
    market_id integer,
    terminal_id integer,
    product_id integer,
    count_of_product integer,
    price_of_one_piece integer,
    order_date date NOT NULL,
    client_id integer,
    comment character varying(1024)
);


ALTER TABLE public.sales_01_mln OWNER TO postgres;

--
-- Name: sales_01_mln_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sales_01_mln_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sales_01_mln_id_seq OWNER TO postgres;

--
-- Name: sales_01_mln_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sales_01_mln_id_seq OWNED BY public.sales_01_mln.id;


--
-- Name: sales_02_mln; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales_02_mln (
    id bigint NOT NULL,
    order_number bigint NOT NULL,
    line_number_in_order integer,
    region_id integer,
    market_id integer,
    terminal_id integer,
    product_id integer,
    count_of_product integer,
    price_of_one_piece integer,
    order_date date NOT NULL,
    client_id integer,
    comment character varying(1024)
);


ALTER TABLE public.sales_02_mln OWNER TO postgres;

--
-- Name: sales_02_mln_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sales_02_mln_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sales_02_mln_id_seq OWNER TO postgres;

--
-- Name: sales_02_mln_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sales_02_mln_id_seq OWNED BY public.sales_02_mln.id;


--
-- Name: sales_03_mln; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales_03_mln (
    id bigint NOT NULL,
    order_number bigint NOT NULL,
    line_number_in_order integer,
    region_id integer,
    market_id integer,
    terminal_id integer,
    product_id integer,
    count_of_product integer,
    price_of_one_piece integer,
    order_date date NOT NULL,
    client_id integer,
    comment character varying(1024)
);


ALTER TABLE public.sales_03_mln OWNER TO postgres;

--
-- Name: sales_03_mln_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sales_03_mln_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sales_03_mln_id_seq OWNER TO postgres;

--
-- Name: sales_03_mln_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sales_03_mln_id_seq OWNED BY public.sales_03_mln.id;


--
-- Name: sales_04_mln; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales_04_mln (
    id bigint NOT NULL,
    order_number bigint NOT NULL,
    line_number_in_order integer,
    region_id integer,
    market_id integer,
    terminal_id integer,
    product_id integer,
    count_of_product integer,
    price_of_one_piece integer,
    order_date date NOT NULL,
    client_id integer,
    comment character varying(1024)
);


ALTER TABLE public.sales_04_mln OWNER TO postgres;

--
-- Name: sales_04_mln_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sales_04_mln_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sales_04_mln_id_seq OWNER TO postgres;

--
-- Name: sales_04_mln_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sales_04_mln_id_seq OWNED BY public.sales_04_mln.id;


--
-- Name: sales_05_mln; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales_05_mln (
    id bigint NOT NULL,
    order_number bigint NOT NULL,
    line_number_in_order integer,
    region_id integer,
    market_id integer,
    terminal_id integer,
    product_id integer,
    count_of_product integer,
    price_of_one_piece integer,
    order_date date NOT NULL,
    client_id integer,
    comment character varying(1024)
);


ALTER TABLE public.sales_05_mln OWNER TO postgres;

--
-- Name: sales_05_mln_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sales_05_mln_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sales_05_mln_id_seq OWNER TO postgres;

--
-- Name: sales_05_mln_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sales_05_mln_id_seq OWNED BY public.sales_05_mln.id;


--
-- Name: sales_06_mln; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales_06_mln (
    id bigint NOT NULL,
    order_number bigint NOT NULL,
    line_number_in_order integer,
    region_id integer,
    market_id integer,
    terminal_id integer,
    product_id integer,
    count_of_product integer,
    price_of_one_piece integer,
    order_date date NOT NULL,
    client_id integer,
    comment character varying(1024)
);


ALTER TABLE public.sales_06_mln OWNER TO postgres;

--
-- Name: sales_06_mln_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sales_06_mln_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sales_06_mln_id_seq OWNER TO postgres;

--
-- Name: sales_06_mln_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sales_06_mln_id_seq OWNED BY public.sales_06_mln.id;


--
-- Name: sales_07_mln; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales_07_mln (
    id bigint NOT NULL,
    order_number bigint NOT NULL,
    line_number_in_order integer,
    region_id integer,
    market_id integer,
    terminal_id integer,
    product_id integer,
    count_of_product integer,
    price_of_one_piece integer,
    order_date date NOT NULL,
    client_id integer,
    comment character varying(1024)
);


ALTER TABLE public.sales_07_mln OWNER TO postgres;

--
-- Name: sales_07_mln_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sales_07_mln_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sales_07_mln_id_seq OWNER TO postgres;

--
-- Name: sales_07_mln_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sales_07_mln_id_seq OWNED BY public.sales_07_mln.id;


--
-- Name: sales_08_mln; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales_08_mln (
    id bigint NOT NULL,
    order_number bigint NOT NULL,
    line_number_in_order integer,
    region_id integer,
    market_id integer,
    terminal_id integer,
    product_id integer,
    count_of_product integer,
    price_of_one_piece integer,
    order_date date NOT NULL,
    client_id integer,
    comment character varying(1024)
);


ALTER TABLE public.sales_08_mln OWNER TO postgres;

--
-- Name: sales_08_mln_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sales_08_mln_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sales_08_mln_id_seq OWNER TO postgres;

--
-- Name: sales_08_mln_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sales_08_mln_id_seq OWNED BY public.sales_08_mln.id;


--
-- Name: sales_09_mln; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales_09_mln (
    id bigint NOT NULL,
    order_number bigint NOT NULL,
    line_number_in_order integer,
    region_id integer,
    market_id integer,
    terminal_id integer,
    product_id integer,
    count_of_product integer,
    price_of_one_piece integer,
    order_date date NOT NULL,
    client_id integer,
    comment character varying(1024)
);


ALTER TABLE public.sales_09_mln OWNER TO postgres;

--
-- Name: sales_09_mln_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sales_09_mln_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sales_09_mln_id_seq OWNER TO postgres;

--
-- Name: sales_09_mln_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sales_09_mln_id_seq OWNED BY public.sales_09_mln.id;


--
-- Name: sales_10_mln; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales_10_mln (
    id bigint NOT NULL,
    order_number bigint NOT NULL,
    line_number_in_order integer,
    region_id integer,
    market_id integer,
    terminal_id integer,
    product_id integer,
    count_of_product integer,
    price_of_one_piece integer,
    order_date date NOT NULL,
    client_id integer,
    comment character varying(1024)
);


ALTER TABLE public.sales_10_mln OWNER TO postgres;

--
-- Name: sales_10_mln_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sales_10_mln_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sales_10_mln_id_seq OWNER TO postgres;

--
-- Name: sales_10_mln_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sales_10_mln_id_seq OWNED BY public.sales_10_mln.id;


--
-- Name: sales_20_mln; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales_20_mln (
    id bigint NOT NULL,
    order_number bigint NOT NULL,
    line_number_in_order integer,
    region_id integer,
    market_id integer,
    terminal_id integer,
    product_id integer,
    count_of_product integer,
    price_of_one_piece integer,
    order_date date NOT NULL,
    client_id integer,
    comment character varying(1024)
);


ALTER TABLE public.sales_20_mln OWNER TO postgres;

--
-- Name: sales_20_mln_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sales_20_mln_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sales_20_mln_id_seq OWNER TO postgres;

--
-- Name: sales_20_mln_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sales_20_mln_id_seq OWNED BY public.sales_20_mln.id;


--
-- Name: sales_30_mln; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales_30_mln (
    id bigint NOT NULL,
    order_number bigint NOT NULL,
    line_number_in_order integer,
    region_id integer,
    market_id integer,
    terminal_id integer,
    product_id integer,
    count_of_product integer,
    price_of_one_piece integer,
    order_date date NOT NULL,
    client_id integer,
    comment character varying(1024)
);


ALTER TABLE public.sales_30_mln OWNER TO postgres;

--
-- Name: sales_30_mln_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sales_30_mln_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sales_30_mln_id_seq OWNER TO postgres;

--
-- Name: sales_30_mln_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sales_30_mln_id_seq OWNED BY public.sales_30_mln.id;


--
-- Name: sales_40_mln; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales_40_mln (
    id bigint NOT NULL,
    order_number bigint NOT NULL,
    line_number_in_order integer,
    region_id integer,
    market_id integer,
    terminal_id integer,
    product_id integer,
    count_of_product integer,
    price_of_one_piece integer,
    order_date date NOT NULL,
    client_id integer,
    comment character varying(1024)
);


ALTER TABLE public.sales_40_mln OWNER TO postgres;

--
-- Name: sales_40_mln_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sales_40_mln_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sales_40_mln_id_seq OWNER TO postgres;

--
-- Name: sales_40_mln_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sales_40_mln_id_seq OWNED BY public.sales_40_mln.id;


--
-- Name: sales_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sales_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sales_id_seq OWNER TO postgres;

--
-- Name: sales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sales_id_seq OWNED BY public.sales.id;


--
-- Name: terminals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.terminals (
    id integer NOT NULL,
    terminal_id_on_market integer,
    market_id integer,
    region_id integer,
    comment character varying(1024)
);


ALTER TABLE public.terminals OWNER TO postgres;

--
-- Name: terminals_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.terminals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.terminals_id_seq OWNER TO postgres;

--
-- Name: terminals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.terminals_id_seq OWNED BY public.terminals.id;


--
-- Name: clients id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients ALTER COLUMN id SET DEFAULT nextval('public.clients_id_seq'::regclass);


--
-- Name: loyality id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loyality ALTER COLUMN id SET DEFAULT nextval('public.loyality_id_seq'::regclass);


--
-- Name: markets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.markets ALTER COLUMN id SET DEFAULT nextval('public.markets_id_seq'::regclass);


--
-- Name: order_numbers_dictionary order_number; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary ALTER COLUMN order_number SET DEFAULT nextval('public.order_numbers_dictionary_order_number_seq'::regclass);


--
-- Name: order_numbers_dictionary_01_mln order_number; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_01_mln ALTER COLUMN order_number SET DEFAULT nextval('public.order_numbers_dictionary_01_mln_order_number_seq'::regclass);


--
-- Name: order_numbers_dictionary_02_mln order_number; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_02_mln ALTER COLUMN order_number SET DEFAULT nextval('public.order_numbers_dictionary_02_mln_order_number_seq'::regclass);


--
-- Name: order_numbers_dictionary_03_mln order_number; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_03_mln ALTER COLUMN order_number SET DEFAULT nextval('public.order_numbers_dictionary_03_mln_order_number_seq'::regclass);


--
-- Name: order_numbers_dictionary_04_mln order_number; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_04_mln ALTER COLUMN order_number SET DEFAULT nextval('public.order_numbers_dictionary_04_mln_order_number_seq'::regclass);


--
-- Name: order_numbers_dictionary_05_mln order_number; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_05_mln ALTER COLUMN order_number SET DEFAULT nextval('public.order_numbers_dictionary_05_mln_order_number_seq'::regclass);


--
-- Name: order_numbers_dictionary_06_mln order_number; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_06_mln ALTER COLUMN order_number SET DEFAULT nextval('public.order_numbers_dictionary_06_mln_order_number_seq'::regclass);


--
-- Name: order_numbers_dictionary_07_mln order_number; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_07_mln ALTER COLUMN order_number SET DEFAULT nextval('public.order_numbers_dictionary_07_mln_order_number_seq'::regclass);


--
-- Name: order_numbers_dictionary_08_mln order_number; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_08_mln ALTER COLUMN order_number SET DEFAULT nextval('public.order_numbers_dictionary_08_mln_order_number_seq'::regclass);


--
-- Name: order_numbers_dictionary_09_mln order_number; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_09_mln ALTER COLUMN order_number SET DEFAULT nextval('public.order_numbers_dictionary_09_mln_order_number_seq'::regclass);


--
-- Name: order_numbers_dictionary_10_mln order_number; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_10_mln ALTER COLUMN order_number SET DEFAULT nextval('public.order_numbers_dictionary_10_mln_order_number_seq'::regclass);


--
-- Name: order_numbers_dictionary_20_mln order_number; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_20_mln ALTER COLUMN order_number SET DEFAULT nextval('public.order_numbers_dictionary_20_mln_order_number_seq'::regclass);


--
-- Name: order_numbers_dictionary_30_mln order_number; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_30_mln ALTER COLUMN order_number SET DEFAULT nextval('public.order_numbers_dictionary_30_mln_order_number_seq'::regclass);


--
-- Name: order_numbers_dictionary_40_mln order_number; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_40_mln ALTER COLUMN order_number SET DEFAULT nextval('public.order_numbers_dictionary_40_mln_order_number_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: regions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regions ALTER COLUMN id SET DEFAULT nextval('public.regions_id_seq'::regclass);


--
-- Name: sales id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales ALTER COLUMN id SET DEFAULT nextval('public.sales_id_seq'::regclass);


--
-- Name: sales_01_mln id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_01_mln ALTER COLUMN id SET DEFAULT nextval('public.sales_01_mln_id_seq'::regclass);


--
-- Name: sales_02_mln id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_02_mln ALTER COLUMN id SET DEFAULT nextval('public.sales_02_mln_id_seq'::regclass);


--
-- Name: sales_03_mln id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_03_mln ALTER COLUMN id SET DEFAULT nextval('public.sales_03_mln_id_seq'::regclass);


--
-- Name: sales_04_mln id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_04_mln ALTER COLUMN id SET DEFAULT nextval('public.sales_04_mln_id_seq'::regclass);


--
-- Name: sales_05_mln id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_05_mln ALTER COLUMN id SET DEFAULT nextval('public.sales_05_mln_id_seq'::regclass);


--
-- Name: sales_06_mln id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_06_mln ALTER COLUMN id SET DEFAULT nextval('public.sales_06_mln_id_seq'::regclass);


--
-- Name: sales_07_mln id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_07_mln ALTER COLUMN id SET DEFAULT nextval('public.sales_07_mln_id_seq'::regclass);


--
-- Name: sales_08_mln id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_08_mln ALTER COLUMN id SET DEFAULT nextval('public.sales_08_mln_id_seq'::regclass);


--
-- Name: sales_09_mln id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_09_mln ALTER COLUMN id SET DEFAULT nextval('public.sales_09_mln_id_seq'::regclass);


--
-- Name: sales_10_mln id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_10_mln ALTER COLUMN id SET DEFAULT nextval('public.sales_10_mln_id_seq'::regclass);


--
-- Name: sales_20_mln id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_20_mln ALTER COLUMN id SET DEFAULT nextval('public.sales_20_mln_id_seq'::regclass);


--
-- Name: sales_30_mln id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_30_mln ALTER COLUMN id SET DEFAULT nextval('public.sales_30_mln_id_seq'::regclass);


--
-- Name: sales_40_mln id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_40_mln ALTER COLUMN id SET DEFAULT nextval('public.sales_40_mln_id_seq'::regclass);


--
-- Name: terminals id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.terminals ALTER COLUMN id SET DEFAULT nextval('public.terminals_id_seq'::regclass);


--
-- Name: clients clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);


--
-- Name: loyality loyality_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loyality
    ADD CONSTRAINT loyality_pkey PRIMARY KEY (id);


--
-- Name: markets markets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.markets
    ADD CONSTRAINT markets_pkey PRIMARY KEY (id);


--
-- Name: order_numbers_dictionary_01_mln order_numbers_dictionary_01_mln_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_01_mln
    ADD CONSTRAINT order_numbers_dictionary_01_mln_pkey PRIMARY KEY (order_number, order_date);


--
-- Name: order_numbers_dictionary_02_mln order_numbers_dictionary_02_mln_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_02_mln
    ADD CONSTRAINT order_numbers_dictionary_02_mln_pkey PRIMARY KEY (order_number, order_date);


--
-- Name: order_numbers_dictionary_03_mln order_numbers_dictionary_03_mln_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_03_mln
    ADD CONSTRAINT order_numbers_dictionary_03_mln_pkey PRIMARY KEY (order_number, order_date);


--
-- Name: order_numbers_dictionary_04_mln order_numbers_dictionary_04_mln_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_04_mln
    ADD CONSTRAINT order_numbers_dictionary_04_mln_pkey PRIMARY KEY (order_number, order_date);


--
-- Name: order_numbers_dictionary_05_mln order_numbers_dictionary_05_mln_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_05_mln
    ADD CONSTRAINT order_numbers_dictionary_05_mln_pkey PRIMARY KEY (order_number, order_date);


--
-- Name: order_numbers_dictionary_06_mln order_numbers_dictionary_06_mln_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_06_mln
    ADD CONSTRAINT order_numbers_dictionary_06_mln_pkey PRIMARY KEY (order_number, order_date);


--
-- Name: order_numbers_dictionary_07_mln order_numbers_dictionary_07_mln_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_07_mln
    ADD CONSTRAINT order_numbers_dictionary_07_mln_pkey PRIMARY KEY (order_number, order_date);


--
-- Name: order_numbers_dictionary_08_mln order_numbers_dictionary_08_mln_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_08_mln
    ADD CONSTRAINT order_numbers_dictionary_08_mln_pkey PRIMARY KEY (order_number, order_date);


--
-- Name: order_numbers_dictionary_09_mln order_numbers_dictionary_09_mln_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_09_mln
    ADD CONSTRAINT order_numbers_dictionary_09_mln_pkey PRIMARY KEY (order_number, order_date);


--
-- Name: order_numbers_dictionary_10_mln order_numbers_dictionary_10_mln_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_10_mln
    ADD CONSTRAINT order_numbers_dictionary_10_mln_pkey PRIMARY KEY (order_number, order_date);


--
-- Name: order_numbers_dictionary_20_mln order_numbers_dictionary_20_mln_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_20_mln
    ADD CONSTRAINT order_numbers_dictionary_20_mln_pkey PRIMARY KEY (order_number, order_date);


--
-- Name: order_numbers_dictionary_30_mln order_numbers_dictionary_30_mln_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_30_mln
    ADD CONSTRAINT order_numbers_dictionary_30_mln_pkey PRIMARY KEY (order_number, order_date);


--
-- Name: order_numbers_dictionary_40_mln order_numbers_dictionary_40_mln_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_40_mln
    ADD CONSTRAINT order_numbers_dictionary_40_mln_pkey PRIMARY KEY (order_number, order_date);


--
-- Name: order_numbers_dictionary order_numbers_dictionary_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary
    ADD CONSTRAINT order_numbers_dictionary_pkey PRIMARY KEY (order_number, order_date);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: regions regions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (id);


--
-- Name: sales_01_mln sales_01_mln_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_01_mln
    ADD CONSTRAINT sales_01_mln_pkey PRIMARY KEY (id, order_date);


--
-- Name: sales_02_mln sales_02_mln_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_02_mln
    ADD CONSTRAINT sales_02_mln_pkey PRIMARY KEY (id, order_date);


--
-- Name: sales_03_mln sales_03_mln_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_03_mln
    ADD CONSTRAINT sales_03_mln_pkey PRIMARY KEY (id, order_date);


--
-- Name: sales_04_mln sales_04_mln_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_04_mln
    ADD CONSTRAINT sales_04_mln_pkey PRIMARY KEY (id, order_date);


--
-- Name: sales_05_mln sales_05_mln_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_05_mln
    ADD CONSTRAINT sales_05_mln_pkey PRIMARY KEY (id, order_date);


--
-- Name: sales_06_mln sales_06_mln_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_06_mln
    ADD CONSTRAINT sales_06_mln_pkey PRIMARY KEY (id, order_date);


--
-- Name: sales_07_mln sales_07_mln_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_07_mln
    ADD CONSTRAINT sales_07_mln_pkey PRIMARY KEY (id, order_date);


--
-- Name: sales_08_mln sales_08_mln_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_08_mln
    ADD CONSTRAINT sales_08_mln_pkey PRIMARY KEY (id, order_date);


--
-- Name: sales_09_mln sales_09_mln_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_09_mln
    ADD CONSTRAINT sales_09_mln_pkey PRIMARY KEY (id, order_date);


--
-- Name: sales_10_mln sales_10_mln_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_10_mln
    ADD CONSTRAINT sales_10_mln_pkey PRIMARY KEY (id, order_date);


--
-- Name: sales_20_mln sales_20_mln_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_20_mln
    ADD CONSTRAINT sales_20_mln_pkey PRIMARY KEY (id, order_date);


--
-- Name: sales_30_mln sales_30_mln_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_30_mln
    ADD CONSTRAINT sales_30_mln_pkey PRIMARY KEY (id, order_date);


--
-- Name: sales_40_mln sales_40_mln_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_40_mln
    ADD CONSTRAINT sales_40_mln_pkey PRIMARY KEY (id, order_date);


--
-- Name: sales sales_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_pkey PRIMARY KEY (id, order_date);


--
-- Name: terminals terminals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.terminals
    ADD CONSTRAINT terminals_pkey PRIMARY KEY (id);


--
-- Name: order_numbers_dictionary_01_mln order_numbers_dictionary_01_mln_market_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_01_mln
    ADD CONSTRAINT order_numbers_dictionary_01_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets(id);


--
-- Name: order_numbers_dictionary_01_mln order_numbers_dictionary_01_mln_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_01_mln
    ADD CONSTRAINT order_numbers_dictionary_01_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions(id);


--
-- Name: order_numbers_dictionary_01_mln order_numbers_dictionary_01_mln_terminal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_01_mln
    ADD CONSTRAINT order_numbers_dictionary_01_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals(id);


--
-- Name: order_numbers_dictionary_02_mln order_numbers_dictionary_02_mln_market_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_02_mln
    ADD CONSTRAINT order_numbers_dictionary_02_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets(id);


--
-- Name: order_numbers_dictionary_02_mln order_numbers_dictionary_02_mln_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_02_mln
    ADD CONSTRAINT order_numbers_dictionary_02_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions(id);


--
-- Name: order_numbers_dictionary_02_mln order_numbers_dictionary_02_mln_terminal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_02_mln
    ADD CONSTRAINT order_numbers_dictionary_02_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals(id);


--
-- Name: order_numbers_dictionary_03_mln order_numbers_dictionary_03_mln_market_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_03_mln
    ADD CONSTRAINT order_numbers_dictionary_03_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets(id);


--
-- Name: order_numbers_dictionary_03_mln order_numbers_dictionary_03_mln_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_03_mln
    ADD CONSTRAINT order_numbers_dictionary_03_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions(id);


--
-- Name: order_numbers_dictionary_03_mln order_numbers_dictionary_03_mln_terminal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_03_mln
    ADD CONSTRAINT order_numbers_dictionary_03_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals(id);


--
-- Name: order_numbers_dictionary_04_mln order_numbers_dictionary_04_mln_market_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_04_mln
    ADD CONSTRAINT order_numbers_dictionary_04_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets(id);


--
-- Name: order_numbers_dictionary_04_mln order_numbers_dictionary_04_mln_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_04_mln
    ADD CONSTRAINT order_numbers_dictionary_04_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions(id);


--
-- Name: order_numbers_dictionary_04_mln order_numbers_dictionary_04_mln_terminal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_04_mln
    ADD CONSTRAINT order_numbers_dictionary_04_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals(id);


--
-- Name: order_numbers_dictionary_05_mln order_numbers_dictionary_05_mln_market_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_05_mln
    ADD CONSTRAINT order_numbers_dictionary_05_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets(id);


--
-- Name: order_numbers_dictionary_05_mln order_numbers_dictionary_05_mln_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_05_mln
    ADD CONSTRAINT order_numbers_dictionary_05_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions(id);


--
-- Name: order_numbers_dictionary_05_mln order_numbers_dictionary_05_mln_terminal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_05_mln
    ADD CONSTRAINT order_numbers_dictionary_05_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals(id);


--
-- Name: order_numbers_dictionary_06_mln order_numbers_dictionary_06_mln_market_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_06_mln
    ADD CONSTRAINT order_numbers_dictionary_06_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets(id);


--
-- Name: order_numbers_dictionary_06_mln order_numbers_dictionary_06_mln_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_06_mln
    ADD CONSTRAINT order_numbers_dictionary_06_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions(id);


--
-- Name: order_numbers_dictionary_06_mln order_numbers_dictionary_06_mln_terminal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_06_mln
    ADD CONSTRAINT order_numbers_dictionary_06_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals(id);


--
-- Name: order_numbers_dictionary_07_mln order_numbers_dictionary_07_mln_market_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_07_mln
    ADD CONSTRAINT order_numbers_dictionary_07_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets(id);


--
-- Name: order_numbers_dictionary_07_mln order_numbers_dictionary_07_mln_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_07_mln
    ADD CONSTRAINT order_numbers_dictionary_07_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions(id);


--
-- Name: order_numbers_dictionary_07_mln order_numbers_dictionary_07_mln_terminal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_07_mln
    ADD CONSTRAINT order_numbers_dictionary_07_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals(id);


--
-- Name: order_numbers_dictionary_08_mln order_numbers_dictionary_08_mln_market_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_08_mln
    ADD CONSTRAINT order_numbers_dictionary_08_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets(id);


--
-- Name: order_numbers_dictionary_08_mln order_numbers_dictionary_08_mln_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_08_mln
    ADD CONSTRAINT order_numbers_dictionary_08_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions(id);


--
-- Name: order_numbers_dictionary_08_mln order_numbers_dictionary_08_mln_terminal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_08_mln
    ADD CONSTRAINT order_numbers_dictionary_08_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals(id);


--
-- Name: order_numbers_dictionary_09_mln order_numbers_dictionary_09_mln_market_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_09_mln
    ADD CONSTRAINT order_numbers_dictionary_09_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets(id);


--
-- Name: order_numbers_dictionary_09_mln order_numbers_dictionary_09_mln_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_09_mln
    ADD CONSTRAINT order_numbers_dictionary_09_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions(id);


--
-- Name: order_numbers_dictionary_09_mln order_numbers_dictionary_09_mln_terminal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_09_mln
    ADD CONSTRAINT order_numbers_dictionary_09_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals(id);


--
-- Name: order_numbers_dictionary_10_mln order_numbers_dictionary_10_mln_market_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_10_mln
    ADD CONSTRAINT order_numbers_dictionary_10_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets(id);


--
-- Name: order_numbers_dictionary_10_mln order_numbers_dictionary_10_mln_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_10_mln
    ADD CONSTRAINT order_numbers_dictionary_10_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions(id);


--
-- Name: order_numbers_dictionary_10_mln order_numbers_dictionary_10_mln_terminal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_10_mln
    ADD CONSTRAINT order_numbers_dictionary_10_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals(id);


--
-- Name: order_numbers_dictionary_20_mln order_numbers_dictionary_20_mln_market_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_20_mln
    ADD CONSTRAINT order_numbers_dictionary_20_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets(id);


--
-- Name: order_numbers_dictionary_20_mln order_numbers_dictionary_20_mln_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_20_mln
    ADD CONSTRAINT order_numbers_dictionary_20_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions(id);


--
-- Name: order_numbers_dictionary_20_mln order_numbers_dictionary_20_mln_terminal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_20_mln
    ADD CONSTRAINT order_numbers_dictionary_20_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals(id);


--
-- Name: order_numbers_dictionary_30_mln order_numbers_dictionary_30_mln_market_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_30_mln
    ADD CONSTRAINT order_numbers_dictionary_30_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets(id);


--
-- Name: order_numbers_dictionary_30_mln order_numbers_dictionary_30_mln_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_30_mln
    ADD CONSTRAINT order_numbers_dictionary_30_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions(id);


--
-- Name: order_numbers_dictionary_30_mln order_numbers_dictionary_30_mln_terminal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_30_mln
    ADD CONSTRAINT order_numbers_dictionary_30_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals(id);


--
-- Name: order_numbers_dictionary_40_mln order_numbers_dictionary_40_mln_market_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_40_mln
    ADD CONSTRAINT order_numbers_dictionary_40_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets(id);


--
-- Name: order_numbers_dictionary_40_mln order_numbers_dictionary_40_mln_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_40_mln
    ADD CONSTRAINT order_numbers_dictionary_40_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions(id);


--
-- Name: order_numbers_dictionary_40_mln order_numbers_dictionary_40_mln_terminal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary_40_mln
    ADD CONSTRAINT order_numbers_dictionary_40_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals(id);


--
-- Name: order_numbers_dictionary order_numbers_dictionary_market_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary
    ADD CONSTRAINT order_numbers_dictionary_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets(id);


--
-- Name: order_numbers_dictionary order_numbers_dictionary_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary
    ADD CONSTRAINT order_numbers_dictionary_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions(id);


--
-- Name: order_numbers_dictionary order_numbers_dictionary_terminal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_numbers_dictionary
    ADD CONSTRAINT order_numbers_dictionary_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals(id);


--
-- Name: products products_category_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_category_fkey FOREIGN KEY (loyality_id) REFERENCES public.loyality(id);


--
-- Name: sales_01_mln sales_01_mln_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_01_mln
    ADD CONSTRAINT sales_01_mln_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.clients(id);


--
-- Name: sales_01_mln sales_01_mln_market_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_01_mln
    ADD CONSTRAINT sales_01_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets(id);


--
-- Name: sales_01_mln sales_01_mln_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_01_mln
    ADD CONSTRAINT sales_01_mln_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: sales_01_mln sales_01_mln_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_01_mln
    ADD CONSTRAINT sales_01_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions(id);


--
-- Name: sales_01_mln sales_01_mln_terminal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_01_mln
    ADD CONSTRAINT sales_01_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals(id);


--
-- Name: sales_02_mln sales_02_mln_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_02_mln
    ADD CONSTRAINT sales_02_mln_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.clients(id);


--
-- Name: sales_02_mln sales_02_mln_market_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_02_mln
    ADD CONSTRAINT sales_02_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets(id);


--
-- Name: sales_02_mln sales_02_mln_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_02_mln
    ADD CONSTRAINT sales_02_mln_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: sales_02_mln sales_02_mln_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_02_mln
    ADD CONSTRAINT sales_02_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions(id);


--
-- Name: sales_02_mln sales_02_mln_terminal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_02_mln
    ADD CONSTRAINT sales_02_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals(id);


--
-- Name: sales_03_mln sales_03_mln_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_03_mln
    ADD CONSTRAINT sales_03_mln_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.clients(id);


--
-- Name: sales_03_mln sales_03_mln_market_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_03_mln
    ADD CONSTRAINT sales_03_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets(id);


--
-- Name: sales_03_mln sales_03_mln_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_03_mln
    ADD CONSTRAINT sales_03_mln_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: sales_03_mln sales_03_mln_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_03_mln
    ADD CONSTRAINT sales_03_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions(id);


--
-- Name: sales_03_mln sales_03_mln_terminal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_03_mln
    ADD CONSTRAINT sales_03_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals(id);


--
-- Name: sales_04_mln sales_04_mln_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_04_mln
    ADD CONSTRAINT sales_04_mln_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.clients(id);


--
-- Name: sales_04_mln sales_04_mln_market_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_04_mln
    ADD CONSTRAINT sales_04_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets(id);


--
-- Name: sales_04_mln sales_04_mln_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_04_mln
    ADD CONSTRAINT sales_04_mln_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: sales_04_mln sales_04_mln_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_04_mln
    ADD CONSTRAINT sales_04_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions(id);


--
-- Name: sales_04_mln sales_04_mln_terminal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_04_mln
    ADD CONSTRAINT sales_04_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals(id);


--
-- Name: sales_05_mln sales_05_mln_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_05_mln
    ADD CONSTRAINT sales_05_mln_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.clients(id);


--
-- Name: sales_05_mln sales_05_mln_market_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_05_mln
    ADD CONSTRAINT sales_05_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets(id);


--
-- Name: sales_05_mln sales_05_mln_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_05_mln
    ADD CONSTRAINT sales_05_mln_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: sales_05_mln sales_05_mln_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_05_mln
    ADD CONSTRAINT sales_05_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions(id);


--
-- Name: sales_05_mln sales_05_mln_terminal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_05_mln
    ADD CONSTRAINT sales_05_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals(id);


--
-- Name: sales_06_mln sales_06_mln_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_06_mln
    ADD CONSTRAINT sales_06_mln_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.clients(id);


--
-- Name: sales_06_mln sales_06_mln_market_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_06_mln
    ADD CONSTRAINT sales_06_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets(id);


--
-- Name: sales_06_mln sales_06_mln_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_06_mln
    ADD CONSTRAINT sales_06_mln_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: sales_06_mln sales_06_mln_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_06_mln
    ADD CONSTRAINT sales_06_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions(id);


--
-- Name: sales_06_mln sales_06_mln_terminal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_06_mln
    ADD CONSTRAINT sales_06_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals(id);


--
-- Name: sales_07_mln sales_07_mln_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_07_mln
    ADD CONSTRAINT sales_07_mln_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.clients(id);


--
-- Name: sales_07_mln sales_07_mln_market_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_07_mln
    ADD CONSTRAINT sales_07_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets(id);


--
-- Name: sales_07_mln sales_07_mln_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_07_mln
    ADD CONSTRAINT sales_07_mln_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: sales_07_mln sales_07_mln_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_07_mln
    ADD CONSTRAINT sales_07_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions(id);


--
-- Name: sales_07_mln sales_07_mln_terminal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_07_mln
    ADD CONSTRAINT sales_07_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals(id);


--
-- Name: sales_08_mln sales_08_mln_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_08_mln
    ADD CONSTRAINT sales_08_mln_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.clients(id);


--
-- Name: sales_08_mln sales_08_mln_market_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_08_mln
    ADD CONSTRAINT sales_08_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets(id);


--
-- Name: sales_08_mln sales_08_mln_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_08_mln
    ADD CONSTRAINT sales_08_mln_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: sales_08_mln sales_08_mln_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_08_mln
    ADD CONSTRAINT sales_08_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions(id);


--
-- Name: sales_08_mln sales_08_mln_terminal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_08_mln
    ADD CONSTRAINT sales_08_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals(id);


--
-- Name: sales_09_mln sales_09_mln_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_09_mln
    ADD CONSTRAINT sales_09_mln_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.clients(id);


--
-- Name: sales_09_mln sales_09_mln_market_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_09_mln
    ADD CONSTRAINT sales_09_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets(id);


--
-- Name: sales_09_mln sales_09_mln_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_09_mln
    ADD CONSTRAINT sales_09_mln_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: sales_09_mln sales_09_mln_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_09_mln
    ADD CONSTRAINT sales_09_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions(id);


--
-- Name: sales_09_mln sales_09_mln_terminal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_09_mln
    ADD CONSTRAINT sales_09_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals(id);


--
-- Name: sales_10_mln sales_10_mln_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_10_mln
    ADD CONSTRAINT sales_10_mln_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.clients(id);


--
-- Name: sales_10_mln sales_10_mln_market_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_10_mln
    ADD CONSTRAINT sales_10_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets(id);


--
-- Name: sales_10_mln sales_10_mln_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_10_mln
    ADD CONSTRAINT sales_10_mln_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: sales_10_mln sales_10_mln_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_10_mln
    ADD CONSTRAINT sales_10_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions(id);


--
-- Name: sales_10_mln sales_10_mln_terminal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_10_mln
    ADD CONSTRAINT sales_10_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals(id);


--
-- Name: sales_20_mln sales_20_mln_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_20_mln
    ADD CONSTRAINT sales_20_mln_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.clients(id);


--
-- Name: sales_20_mln sales_20_mln_market_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_20_mln
    ADD CONSTRAINT sales_20_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets(id);


--
-- Name: sales_20_mln sales_20_mln_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_20_mln
    ADD CONSTRAINT sales_20_mln_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: sales_20_mln sales_20_mln_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_20_mln
    ADD CONSTRAINT sales_20_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions(id);


--
-- Name: sales_20_mln sales_20_mln_terminal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_20_mln
    ADD CONSTRAINT sales_20_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals(id);


--
-- Name: sales_30_mln sales_30_mln_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_30_mln
    ADD CONSTRAINT sales_30_mln_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.clients(id);


--
-- Name: sales_30_mln sales_30_mln_market_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_30_mln
    ADD CONSTRAINT sales_30_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets(id);


--
-- Name: sales_30_mln sales_30_mln_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_30_mln
    ADD CONSTRAINT sales_30_mln_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: sales_30_mln sales_30_mln_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_30_mln
    ADD CONSTRAINT sales_30_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions(id);


--
-- Name: sales_30_mln sales_30_mln_terminal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_30_mln
    ADD CONSTRAINT sales_30_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals(id);


--
-- Name: sales_40_mln sales_40_mln_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_40_mln
    ADD CONSTRAINT sales_40_mln_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.clients(id);


--
-- Name: sales_40_mln sales_40_mln_market_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_40_mln
    ADD CONSTRAINT sales_40_mln_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets(id);


--
-- Name: sales_40_mln sales_40_mln_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_40_mln
    ADD CONSTRAINT sales_40_mln_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: sales_40_mln sales_40_mln_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_40_mln
    ADD CONSTRAINT sales_40_mln_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions(id);


--
-- Name: sales_40_mln sales_40_mln_terminal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_40_mln
    ADD CONSTRAINT sales_40_mln_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals(id);


--
-- Name: sales sales_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.clients(id);


--
-- Name: sales sales_market_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.markets(id);


--
-- Name: sales sales_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: sales sales_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions(id);


--
-- Name: sales sales_terminal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.terminals(id);


--
-- PostgreSQL database dump complete
--

