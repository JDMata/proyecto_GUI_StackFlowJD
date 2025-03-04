PGDMP  "    +                }            studentoverflow    16.3    16.3 .    =           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            >           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            @           1262    16408    studentoverflow    DATABASE     q   CREATE DATABASE studentoverflow WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
    DROP DATABASE studentoverflow;
                postgres    false            �            1259    16503    answers    TABLE     �   CREATE TABLE public.answers (
    id integer NOT NULL,
    question_id integer NOT NULL,
    user_id integer NOT NULL,
    content text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.answers;
       public         heap    postgres    false            �            1259    16502    answers_id_seq    SEQUENCE     �   CREATE SEQUENCE public.answers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.answers_id_seq;
       public          postgres    false    224            A           0    0    answers_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.answers_id_seq OWNED BY public.answers.id;
          public          postgres    false    223            �            1259    16421    question    TABLE     �   CREATE TABLE public.question (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    content text NOT NULL,
    user_id integer NOT NULL
);
    DROP TABLE public.question;
       public         heap    postgres    false            �            1259    16420    question_id_seq    SEQUENCE     �   CREATE SEQUENCE public.question_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.question_id_seq;
       public          postgres    false    218            B           0    0    question_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.question_id_seq OWNED BY public.question.id;
          public          postgres    false    217            �            1259    16488 	   questions    TABLE     �   CREATE TABLE public.questions (
    id integer NOT NULL,
    user_id integer,
    title character varying(255) NOT NULL,
    content text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.questions;
       public         heap    postgres    false            �            1259    16487    questions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.questions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.questions_id_seq;
       public          postgres    false    222            C           0    0    questions_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.questions_id_seq OWNED BY public.questions.id;
          public          postgres    false    221            �            1259    16410    user    TABLE     �   CREATE TABLE public."user" (
    id integer NOT NULL,
    username character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(255) NOT NULL
);
    DROP TABLE public."user";
       public         heap    postgres    false            �            1259    16409    user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public          postgres    false    216            D           0    0    user_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;
          public          postgres    false    215            �            1259    16479    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(255) NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    16478    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    220            E           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    219            �           2604    16506 
   answers id    DEFAULT     h   ALTER TABLE ONLY public.answers ALTER COLUMN id SET DEFAULT nextval('public.answers_id_seq'::regclass);
 9   ALTER TABLE public.answers ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    224    224            �           2604    16424    question id    DEFAULT     j   ALTER TABLE ONLY public.question ALTER COLUMN id SET DEFAULT nextval('public.question_id_seq'::regclass);
 :   ALTER TABLE public.question ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217    218            �           2604    16491    questions id    DEFAULT     l   ALTER TABLE ONLY public.questions ALTER COLUMN id SET DEFAULT nextval('public.questions_id_seq'::regclass);
 ;   ALTER TABLE public.questions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    222    222            �           2604    16413    user id    DEFAULT     d   ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);
 8   ALTER TABLE public."user" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            �           2604    16482    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    220    220            :          0    16503    answers 
   TABLE DATA           P   COPY public.answers (id, question_id, user_id, content, created_at) FROM stdin;
    public          postgres    false    224   a2       4          0    16421    question 
   TABLE DATA           ?   COPY public.question (id, title, content, user_id) FROM stdin;
    public          postgres    false    218   �2       8          0    16488 	   questions 
   TABLE DATA           L   COPY public.questions (id, user_id, title, content, created_at) FROM stdin;
    public          postgres    false    222   &3       2          0    16410    user 
   TABLE DATA           ?   COPY public."user" (id, username, email, password) FROM stdin;
    public          postgres    false    216   94       6          0    16479    users 
   TABLE DATA           >   COPY public.users (id, username, email, password) FROM stdin;
    public          postgres    false    220   �4       F           0    0    answers_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.answers_id_seq', 1, true);
          public          postgres    false    223            G           0    0    question_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.question_id_seq', 1, true);
          public          postgres    false    217            H           0    0    questions_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.questions_id_seq', 9, true);
          public          postgres    false    221            I           0    0    user_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.user_id_seq', 2, true);
          public          postgres    false    215            J           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 3, true);
          public          postgres    false    219            �           2606    16511    answers answers_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.answers
    ADD CONSTRAINT answers_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.answers DROP CONSTRAINT answers_pkey;
       public            postgres    false    224            �           2606    16428    question question_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.question
    ADD CONSTRAINT question_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.question DROP CONSTRAINT question_pkey;
       public            postgres    false    218            �           2606    16496    questions questions_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.questions DROP CONSTRAINT questions_pkey;
       public            postgres    false    222            �           2606    16419    user user_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_email_key;
       public            postgres    false    216            �           2606    16415    user user_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public            postgres    false    216            �           2606    16417    user user_username_key 
   CONSTRAINT     W   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key UNIQUE (username);
 B   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_username_key;
       public            postgres    false    216            �           2606    16486    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    220            �           2606    16484    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    220            �           2606    16512     answers answers_question_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.answers
    ADD CONSTRAINT answers_question_id_fkey FOREIGN KEY (question_id) REFERENCES public.questions(id) ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.answers DROP CONSTRAINT answers_question_id_fkey;
       public          postgres    false    3483    224    222            �           2606    16517    answers answers_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.answers
    ADD CONSTRAINT answers_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;
 F   ALTER TABLE ONLY public.answers DROP CONSTRAINT answers_user_id_fkey;
       public          postgres    false    3481    220    224            �           2606    16429    question question_user_id_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.question
    ADD CONSTRAINT question_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);
 H   ALTER TABLE ONLY public.question DROP CONSTRAINT question_user_id_fkey;
       public          postgres    false    218    3473    216            �           2606    16497     questions questions_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.questions DROP CONSTRAINT questions_user_id_fkey;
       public          postgres    false    222    3481    220            :   7   x�3��4�47QH<�1������T��H��X��������P�����Ą+F��� ��	�      4   n   x�3�<�߹41�$_!����b��Լ���k��2�2�\2�sR2RR2�+�9K3S����R�����I0@G!�X� �(Q�4/Q�$�(5�Ӑ+F��� �54�      8     x�e�KN�0@��)f�(ηΆ�[��HHl&���8v��B �^��J7�{��L�������5Y�EÕ5���6{�J:�i�t�#�t<X��6�ʪ]�ժ�����.����&묚WG4��iTR��:t��E:4� �O:�cr����W��?���8jL�50)\�9�/�~(Yѷ-ca�Ó&Xx�L3$L�}z����t\T�"P�S
�pn�>���(!��7���^���)h�і����By      2   K   x�3��r�uq���O�L��M,ItH�M���K���tt����5202�2���/J���RE�ŉŨ���b���� ���      6   Z   x�3���w�t�����O�L��M�LtH�M���K���tt����5202�2�������������ƮƘ�/�(1(�3H�'cW���� )8$�     