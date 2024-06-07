--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: tbl_d_ujian; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_d_ujian (
    kode integer NOT NULL,
    nis character(8) DEFAULT NULL::bpchar,
    pelajaran character varying(20) DEFAULT NULL::character varying,
    nilai integer
);


ALTER TABLE public.tbl_d_ujian OWNER TO postgres;

--
-- Name: tbl_d_ujian_kode_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tbl_d_ujian_kode_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tbl_d_ujian_kode_seq OWNER TO postgres;

--
-- Name: tbl_d_ujian_kode_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tbl_d_ujian_kode_seq OWNED BY public.tbl_d_ujian.kode;


--
-- Name: tbl_guru; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_guru (
    nig character(20) NOT NULL,
    nama character varying(50) DEFAULT NULL::character varying,
    tanggal_lahir date,
    jenis_kelamin character(1),
    jabatan character varying(50) DEFAULT NULL::character varying
);


ALTER TABLE public.tbl_guru OWNER TO postgres;

--
-- Name: tbl_h_ujian; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_h_ujian (
    nis character(8) NOT NULL,
    pengawas character(20)
);


ALTER TABLE public.tbl_h_ujian OWNER TO postgres;

--
-- Name: tbl_siswa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_siswa (
    nis character(8) NOT NULL,
    nama character varying(50) DEFAULT NULL::character varying,
    kota character varying(15) DEFAULT NULL::character varying,
    tgl_lahir date,
    jenis_kelamin character(1) DEFAULT 'L'::bpchar,
    tabungan numeric DEFAULT '0'::numeric
);


ALTER TABLE public.tbl_siswa OWNER TO postgres;

--
-- Name: tbl_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_user (
    user_id integer NOT NULL,
    user_name character varying(20) NOT NULL,
    user_password character varying(20),
    user_full_name character varying(50),
    user_level integer,
    user_status integer
);


ALTER TABLE public.tbl_user OWNER TO postgres;

--
-- Name: tbl_user_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tbl_user_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tbl_user_user_id_seq OWNER TO postgres;

--
-- Name: tbl_user_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tbl_user_user_id_seq OWNED BY public.tbl_user.user_id;


--
-- Name: tbl_d_ujian kode; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_d_ujian ALTER COLUMN kode SET DEFAULT nextval('public.tbl_d_ujian_kode_seq'::regclass);


--
-- Name: tbl_user user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_user ALTER COLUMN user_id SET DEFAULT nextval('public.tbl_user_user_id_seq'::regclass);


--
-- Data for Name: tbl_d_ujian; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tbl_d_ujian (kode, nis, pelajaran, nilai) FROM stdin;
55	20240001	Fisika	100
56	20240001	Sejarah	90
57	20240001	Seni Budaya	50
58	20240001	Bhs Jawa	100
\.


--
-- Data for Name: tbl_guru; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tbl_guru (nig, nama, tanggal_lahir, jenis_kelamin, jabatan) FROM stdin;
G2403001            	Alex Rinso	1985-03-05	L	Guru Bahasa Prancis
G2403002            	Mr Rehan Wangsaf	2000-02-01	L	Guru Prakarya
G2403003            	Cipto Donyo	1976-02-06	L	Guru Kimia
G2403004            	Bambang Wuling	1965-04-30	L	Guru Bahasa Prancis
G2403005            	Friska Martabak	1976-12-25	P	Guru Bahasa Indo
\.


--
-- Data for Name: tbl_h_ujian; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tbl_h_ujian (nis, pengawas) FROM stdin;
20240001	G2403004            
\.


--
-- Data for Name: tbl_siswa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tbl_siswa (nis, nama, kota, tgl_lahir, jenis_kelamin, tabungan) FROM stdin;
20240001	Sherryl Fara Nuzlyana	Kudus	2006-05-18	P	700000.000000
20240002	Dimas Solar	Kudus	2007-05-10	L	100000.000000
20240003	Abdul Siomi	Kudus	1998-12-17	L	300000.000000
\.


--
-- Data for Name: tbl_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tbl_user (user_id, user_name, user_password, user_full_name, user_level, user_status) FROM stdin;
1	ADMIN-001	ADMIN	Administrator	1	1
7	ADMIN-002	8#+W!C7!	Administrator 2	1	1
8	USER-001	@^1O8C%0	USERBARUNOLSATU	0	1
10	USER-002	XYIT^!7+	AKULAMAK	0	1
\.


--
-- Name: tbl_d_ujian_kode_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tbl_d_ujian_kode_seq', 66, true);


--
-- Name: tbl_user_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tbl_user_user_id_seq', 10, true);


--
-- Name: tbl_d_ujian tbl_d_ujian_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_d_ujian
    ADD CONSTRAINT tbl_d_ujian_pkey PRIMARY KEY (kode);


--
-- Name: tbl_guru tbl_guru_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_guru
    ADD CONSTRAINT tbl_guru_pkey PRIMARY KEY (nig);


--
-- Name: tbl_siswa tbl_siswa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_siswa
    ADD CONSTRAINT tbl_siswa_pkey PRIMARY KEY (nis);


--
-- Name: tbl_user tbl_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_user
    ADD CONSTRAINT tbl_user_pkey PRIMARY KEY (user_id);


--
-- Name: tbl_d_ujian FK_tbl_d_ujian_tbl_siswa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_d_ujian
    ADD CONSTRAINT "FK_tbl_d_ujian_tbl_siswa" FOREIGN KEY (nis) REFERENCES public.tbl_siswa(nis) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: tbl_h_ujian FK_tbl_h_ujian_tbl_guru; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_h_ujian
    ADD CONSTRAINT "FK_tbl_h_ujian_tbl_guru" FOREIGN KEY (pengawas) REFERENCES public.tbl_guru(nig) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: tbl_h_ujian FK_tbl_h_ujian_tbl_siswa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_h_ujian
    ADD CONSTRAINT "FK_tbl_h_ujian_tbl_siswa" FOREIGN KEY (nis) REFERENCES public.tbl_siswa(nis) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

