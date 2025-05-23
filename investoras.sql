PGDMP  6    9                }         
   investoras    17.4    17.4 %    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    24695 
   investoras    DATABASE     �   CREATE DATABASE investoras WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'ru-RU' TABLESPACE = investoras;
    DROP DATABASE investoras;
                  
   investuser    false            �            1259    24709    account    TABLE        CREATE TABLE public.account (
    account_id integer NOT NULL,
    name character varying(255) NOT NULL,
    balance numeric(10,2) DEFAULT 0.00 NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    user_id integer NOT NULL
);
    DROP TABLE public.account;
       public         heap r    
   investuser    false            �            1259    24708    account_account_id_seq    SEQUENCE     �   CREATE SEQUENCE public.account_account_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.account_account_id_seq;
       public            
   investuser    false    220            �           0    0    account_account_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.account_account_id_seq OWNED BY public.account.account_id;
          public            
   investuser    false    219            �            1259    24697    appuser    TABLE       CREATE TABLE public.appuser (
    user_id integer NOT NULL,
    username character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    password_hash character(60) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.appuser;
       public         heap r    
   investuser    false            �            1259    24696    appuser_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.appuser_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.appuser_user_id_seq;
       public            
   investuser    false    218            �           0    0    appuser_user_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.appuser_user_id_seq OWNED BY public.appuser.user_id;
          public            
   investuser    false    217            �            1259    24723    category    TABLE     �   CREATE TABLE public.category (
    category_id integer NOT NULL,
    name character varying(255) NOT NULL,
    is_income boolean DEFAULT false NOT NULL,
    description text
);
    DROP TABLE public.category;
       public         heap r    
   investuser    false            �            1259    24722    category_category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.category_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.category_category_id_seq;
       public            
   investuser    false    222            �           0    0    category_category_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.category_category_id_seq OWNED BY public.category.category_id;
          public            
   investuser    false    221            �            1259    24733    transaction    TABLE     �   CREATE TABLE public.transaction (
    transaction_id integer NOT NULL,
    amount numeric(10,2) NOT NULL,
    description text,
    date date DEFAULT CURRENT_DATE NOT NULL,
    account_id integer NOT NULL,
    category_id integer NOT NULL
);
    DROP TABLE public.transaction;
       public         heap r    
   investuser    false            �            1259    24732    transaction_transaction_id_seq    SEQUENCE     �   CREATE SEQUENCE public.transaction_transaction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.transaction_transaction_id_seq;
       public            
   investuser    false    224            �           0    0    transaction_transaction_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.transaction_transaction_id_seq OWNED BY public.transaction.transaction_id;
          public            
   investuser    false    223            2           2604    24712    account account_id    DEFAULT     x   ALTER TABLE ONLY public.account ALTER COLUMN account_id SET DEFAULT nextval('public.account_account_id_seq'::regclass);
 A   ALTER TABLE public.account ALTER COLUMN account_id DROP DEFAULT;
       public            
   investuser    false    220    219    220            0           2604    24700    appuser user_id    DEFAULT     r   ALTER TABLE ONLY public.appuser ALTER COLUMN user_id SET DEFAULT nextval('public.appuser_user_id_seq'::regclass);
 >   ALTER TABLE public.appuser ALTER COLUMN user_id DROP DEFAULT;
       public            
   investuser    false    217    218    218            5           2604    24726    category category_id    DEFAULT     |   ALTER TABLE ONLY public.category ALTER COLUMN category_id SET DEFAULT nextval('public.category_category_id_seq'::regclass);
 C   ALTER TABLE public.category ALTER COLUMN category_id DROP DEFAULT;
       public            
   investuser    false    222    221    222            7           2604    24736    transaction transaction_id    DEFAULT     �   ALTER TABLE ONLY public.transaction ALTER COLUMN transaction_id SET DEFAULT nextval('public.transaction_transaction_id_seq'::regclass);
 I   ALTER TABLE public.transaction ALTER COLUMN transaction_id DROP DEFAULT;
       public            
   investuser    false    223    224    224            �          0    24709    account 
   TABLE DATA           Q   COPY public.account (account_id, name, balance, created_at, user_id) FROM stdin;
    public            
   investuser    false    220   �,       �          0    24697    appuser 
   TABLE DATA           V   COPY public.appuser (user_id, username, email, password_hash, created_at) FROM stdin;
    public            
   investuser    false    218   �,       �          0    24723    category 
   TABLE DATA           M   COPY public.category (category_id, name, is_income, description) FROM stdin;
    public            
   investuser    false    222   �,       �          0    24733    transaction 
   TABLE DATA           i   COPY public.transaction (transaction_id, amount, description, date, account_id, category_id) FROM stdin;
    public            
   investuser    false    224   �,       �           0    0    account_account_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.account_account_id_seq', 1, false);
          public            
   investuser    false    219            �           0    0    appuser_user_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.appuser_user_id_seq', 1, false);
          public            
   investuser    false    217            �           0    0    category_category_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.category_category_id_seq', 1, false);
          public            
   investuser    false    221            �           0    0    transaction_transaction_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.transaction_transaction_id_seq', 1, false);
          public            
   investuser    false    223            @           2606    24716    account account_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_pkey PRIMARY KEY (account_id);
 >   ALTER TABLE ONLY public.account DROP CONSTRAINT account_pkey;
       public              
   investuser    false    220            :           2606    24707    appuser appuser_email_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.appuser
    ADD CONSTRAINT appuser_email_key UNIQUE (email);
 C   ALTER TABLE ONLY public.appuser DROP CONSTRAINT appuser_email_key;
       public              
   investuser    false    218            <           2606    24703    appuser appuser_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.appuser
    ADD CONSTRAINT appuser_pkey PRIMARY KEY (user_id);
 >   ALTER TABLE ONLY public.appuser DROP CONSTRAINT appuser_pkey;
       public              
   investuser    false    218            >           2606    24705    appuser appuser_username_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.appuser
    ADD CONSTRAINT appuser_username_key UNIQUE (username);
 F   ALTER TABLE ONLY public.appuser DROP CONSTRAINT appuser_username_key;
       public              
   investuser    false    218            B           2606    24731    category category_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (category_id);
 @   ALTER TABLE ONLY public.category DROP CONSTRAINT category_pkey;
       public              
   investuser    false    222            D           2606    24741    transaction transaction_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_pkey PRIMARY KEY (transaction_id);
 F   ALTER TABLE ONLY public.transaction DROP CONSTRAINT transaction_pkey;
       public              
   investuser    false    224            E           2606    24717    account account_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.appuser(user_id);
 F   ALTER TABLE ONLY public.account DROP CONSTRAINT account_user_id_fkey;
       public            
   investuser    false    218    4668    220            F           2606    24742 '   transaction transaction_account_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.account(account_id);
 Q   ALTER TABLE ONLY public.transaction DROP CONSTRAINT transaction_account_id_fkey;
       public            
   investuser    false    220    4672    224            G           2606    24747 (   transaction transaction_category_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.category(category_id);
 R   ALTER TABLE ONLY public.transaction DROP CONSTRAINT transaction_category_id_fkey;
       public            
   investuser    false    222    4674    224            �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �     