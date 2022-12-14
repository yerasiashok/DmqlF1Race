PGDMP                     
    z            f1_race    10.23    10.23 5    2           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            3           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            4           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            5           1262    16396    f1_race    DATABASE     ?   CREATE DATABASE f1_race WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE f1_race;
             postgres    false                        2615    16397    f1_race    SCHEMA        CREATE SCHEMA f1_race;
    DROP SCHEMA f1_race;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            6           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    6                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            7           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            ?            1259    16432    circuits    TABLE     &  CREATE TABLE public.circuits (
    circuit_id integer NOT NULL,
    name character varying(255) NOT NULL,
    location character varying(255) NOT NULL,
    country character varying(255) NOT NULL,
    latitude double precision,
    longitude double precision,
    url character varying(255)
);
    DROP TABLE public.circuits;
       public         postgres    false    6            ?            1259    16430    circuits_circuit_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.circuits_circuit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.circuits_circuit_id_seq;
       public       postgres    false    198    6            8           0    0    circuits_circuit_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.circuits_circuit_id_seq OWNED BY public.circuits.circuit_id;
            public       postgres    false    197            ?            1259    16469    drivers    TABLE     !  CREATE TABLE public.drivers (
    driver_id integer NOT NULL,
    code character varying(255),
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    dob date NOT NULL,
    nationality character varying(255),
    image character varying(255)
);
    DROP TABLE public.drivers;
       public         postgres    false    6            ?            1259    16467    drivers_driver_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.drivers_driver_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.drivers_driver_id_seq;
       public       postgres    false    202    6            9           0    0    drivers_driver_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.drivers_driver_id_seq OWNED BY public.drivers.driver_id;
            public       postgres    false    201            ?            1259    16533    laptimes    TABLE     ?   CREATE TABLE public.laptimes (
    id integer NOT NULL,
    race_id integer,
    driver_id integer,
    lap integer,
    "position" integer,
    time_ms integer
);
    DROP TABLE public.laptimes;
       public         postgres    false    6            ?            1259    16531    laptimes_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.laptimes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.laptimes_id_seq;
       public       postgres    false    210    6            :           0    0    laptimes_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.laptimes_id_seq OWNED BY public.laptimes.id;
            public       postgres    false    209            ?            1259    16482    owners    TABLE     ?   CREATE TABLE public.owners (
    owner_id integer NOT NULL,
    name character varying(255) NOT NULL,
    nick_name character varying(255),
    nationality character varying(255),
    url character varying(255)
);
    DROP TABLE public.owners;
       public         postgres    false    6            ?            1259    16480    owners_owner_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.owners_owner_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.owners_owner_id_seq;
       public       postgres    false    6    204            ;           0    0    owners_owner_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.owners_owner_id_seq OWNED BY public.owners.owner_id;
            public       postgres    false    203            ?            1259    16447    races    TABLE     ?   CREATE TABLE public.races (
    race_id integer NOT NULL,
    name character varying(255) NOT NULL,
    year integer,
    circuit_id integer,
    date date,
    "time" time without time zone,
    url character varying(255)
);
    DROP TABLE public.races;
       public         postgres    false    6            ?            1259    16445    races_race_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.races_race_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.races_race_id_seq;
       public       postgres    false    6    200            <           0    0    races_race_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.races_race_id_seq OWNED BY public.races.race_id;
            public       postgres    false    199            ?            1259    16505    results    TABLE     ?   CREATE TABLE public.results (
    result_id integer NOT NULL,
    race_id integer,
    driver_id integer,
    owner_id integer,
    "position" integer,
    points double precision,
    status_id integer
);
    DROP TABLE public.results;
       public         postgres    false    6            ?            1259    16503    results_result_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.results_result_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.results_result_id_seq;
       public       postgres    false    6    208            =           0    0    results_result_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.results_result_id_seq OWNED BY public.results.result_id;
            public       postgres    false    207            ?            1259    16495    status    TABLE     i   CREATE TABLE public.status (
    status_id integer NOT NULL,
    name character varying(255) NOT NULL
);
    DROP TABLE public.status;
       public         postgres    false    6            ?            1259    16493    status_status_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.status_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.status_status_id_seq;
       public       postgres    false    6    206            >           0    0    status_status_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.status_status_id_seq OWNED BY public.status.status_id;
            public       postgres    false    205            ?
           2604    16435    circuits circuit_id    DEFAULT     z   ALTER TABLE ONLY public.circuits ALTER COLUMN circuit_id SET DEFAULT nextval('public.circuits_circuit_id_seq'::regclass);
 B   ALTER TABLE public.circuits ALTER COLUMN circuit_id DROP DEFAULT;
       public       postgres    false    198    197    198            ?
           2604    16472    drivers driver_id    DEFAULT     v   ALTER TABLE ONLY public.drivers ALTER COLUMN driver_id SET DEFAULT nextval('public.drivers_driver_id_seq'::regclass);
 @   ALTER TABLE public.drivers ALTER COLUMN driver_id DROP DEFAULT;
       public       postgres    false    201    202    202            ?
           2604    16536    laptimes id    DEFAULT     j   ALTER TABLE ONLY public.laptimes ALTER COLUMN id SET DEFAULT nextval('public.laptimes_id_seq'::regclass);
 :   ALTER TABLE public.laptimes ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    210    209    210            ?
           2604    16485    owners owner_id    DEFAULT     r   ALTER TABLE ONLY public.owners ALTER COLUMN owner_id SET DEFAULT nextval('public.owners_owner_id_seq'::regclass);
 >   ALTER TABLE public.owners ALTER COLUMN owner_id DROP DEFAULT;
       public       postgres    false    203    204    204            ?
           2604    16450    races race_id    DEFAULT     n   ALTER TABLE ONLY public.races ALTER COLUMN race_id SET DEFAULT nextval('public.races_race_id_seq'::regclass);
 <   ALTER TABLE public.races ALTER COLUMN race_id DROP DEFAULT;
       public       postgres    false    199    200    200            ?
           2604    16508    results result_id    DEFAULT     v   ALTER TABLE ONLY public.results ALTER COLUMN result_id SET DEFAULT nextval('public.results_result_id_seq'::regclass);
 @   ALTER TABLE public.results ALTER COLUMN result_id DROP DEFAULT;
       public       postgres    false    208    207    208            ?
           2604    16498    status status_id    DEFAULT     t   ALTER TABLE ONLY public.status ALTER COLUMN status_id SET DEFAULT nextval('public.status_status_id_seq'::regclass);
 ?   ALTER TABLE public.status ALTER COLUMN status_id DROP DEFAULT;
       public       postgres    false    205    206    206            ?
           2606    16440    circuits circuits_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.circuits
    ADD CONSTRAINT circuits_pkey PRIMARY KEY (circuit_id);
 @   ALTER TABLE ONLY public.circuits DROP CONSTRAINT circuits_pkey;
       public         postgres    false    198            ?
           2606    16477    drivers drivers_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.drivers
    ADD CONSTRAINT drivers_pkey PRIMARY KEY (driver_id);
 >   ALTER TABLE ONLY public.drivers DROP CONSTRAINT drivers_pkey;
       public         postgres    false    202            ?
           2606    16538    laptimes laptimes_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.laptimes
    ADD CONSTRAINT laptimes_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.laptimes DROP CONSTRAINT laptimes_pkey;
       public         postgres    false    210            ?
           2606    16492    owners owners_name_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.owners
    ADD CONSTRAINT owners_name_key UNIQUE (name);
 @   ALTER TABLE ONLY public.owners DROP CONSTRAINT owners_name_key;
       public         postgres    false    204            ?
           2606    16490    owners owners_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.owners
    ADD CONSTRAINT owners_pkey PRIMARY KEY (owner_id);
 <   ALTER TABLE ONLY public.owners DROP CONSTRAINT owners_pkey;
       public         postgres    false    204            ?
           2606    16455    races races_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.races
    ADD CONSTRAINT races_pkey PRIMARY KEY (race_id);
 :   ALTER TABLE ONLY public.races DROP CONSTRAINT races_pkey;
       public         postgres    false    200            ?
           2606    16510    results results_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.results
    ADD CONSTRAINT results_pkey PRIMARY KEY (result_id);
 >   ALTER TABLE ONLY public.results DROP CONSTRAINT results_pkey;
       public         postgres    false    208            ?
           2606    16502    status status_name_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_name_key UNIQUE (name);
 @   ALTER TABLE ONLY public.status DROP CONSTRAINT status_name_key;
       public         postgres    false    206            ?
           2606    16500    status status_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (status_id);
 <   ALTER TABLE ONLY public.status DROP CONSTRAINT status_pkey;
       public         postgres    false    206            ?
           2606    16544     laptimes laptimes_driver_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.laptimes
    ADD CONSTRAINT laptimes_driver_id_fkey FOREIGN KEY (driver_id) REFERENCES public.drivers(driver_id) ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.laptimes DROP CONSTRAINT laptimes_driver_id_fkey;
       public       postgres    false    2723    210    202            ?
           2606    16539    laptimes laptimes_race_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.laptimes
    ADD CONSTRAINT laptimes_race_id_fkey FOREIGN KEY (race_id) REFERENCES public.races(race_id) ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.laptimes DROP CONSTRAINT laptimes_race_id_fkey;
       public       postgres    false    210    200    2721            ?
           2606    16456    races races_circuit_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.races
    ADD CONSTRAINT races_circuit_id_fkey FOREIGN KEY (circuit_id) REFERENCES public.circuits(circuit_id) ON DELETE SET NULL;
 E   ALTER TABLE ONLY public.races DROP CONSTRAINT races_circuit_id_fkey;
       public       postgres    false    198    2719    200            ?
           2606    16516    results results_driver_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.results
    ADD CONSTRAINT results_driver_id_fkey FOREIGN KEY (driver_id) REFERENCES public.drivers(driver_id) ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.results DROP CONSTRAINT results_driver_id_fkey;
       public       postgres    false    2723    208    202            ?
           2606    16521    results results_owner_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.results
    ADD CONSTRAINT results_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public.owners(owner_id) ON DELETE SET NULL;
 G   ALTER TABLE ONLY public.results DROP CONSTRAINT results_owner_id_fkey;
       public       postgres    false    2727    208    204            ?
           2606    16511    results results_race_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.results
    ADD CONSTRAINT results_race_id_fkey FOREIGN KEY (race_id) REFERENCES public.races(race_id) ON DELETE CASCADE;
 F   ALTER TABLE ONLY public.results DROP CONSTRAINT results_race_id_fkey;
       public       postgres    false    208    200    2721            ?
           2606    16526    results results_status_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.results
    ADD CONSTRAINT results_status_id_fkey FOREIGN KEY (status_id) REFERENCES public.status(status_id) ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.results DROP CONSTRAINT results_status_id_fkey;
       public       postgres    false    208    206    2731           