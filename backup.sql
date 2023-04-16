--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

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
-- Name: LandingPage; Type: TABLE; Schema: public; Owner: serveri
--

CREATE TABLE public."LandingPage" (
    id integer NOT NULL,
    user_updated uuid,
    date_updated timestamp with time zone,
    fi_title text,
    en_title text,
    fi_description text,
    en_description text,
    fi_button_text text,
    en_button_text text,
    en_button_url text,
    fi_button_url text
);


ALTER TABLE public."LandingPage" OWNER TO serveri;

--
-- Name: LandingPage_id_seq; Type: SEQUENCE; Schema: public; Owner: serveri
--

CREATE SEQUENCE public."LandingPage_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."LandingPage_id_seq" OWNER TO serveri;

--
-- Name: LandingPage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: serveri
--

ALTER SEQUENCE public."LandingPage_id_seq" OWNED BY public."LandingPage".id;


--
-- Name: directus_activity; Type: TABLE; Schema: public; Owner: serveri
--

CREATE TABLE public.directus_activity (
    id integer NOT NULL,
    action character varying(45) NOT NULL,
    "user" uuid,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    ip character varying(50),
    user_agent character varying(255),
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    comment text,
    origin character varying(255)
);


ALTER TABLE public.directus_activity OWNER TO serveri;

--
-- Name: directus_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: serveri
--

CREATE SEQUENCE public.directus_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_activity_id_seq OWNER TO serveri;

--
-- Name: directus_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: serveri
--

ALTER SEQUENCE public.directus_activity_id_seq OWNED BY public.directus_activity.id;


--
-- Name: directus_collections; Type: TABLE; Schema: public; Owner: serveri
--

CREATE TABLE public.directus_collections (
    collection character varying(64) NOT NULL,
    icon character varying(30),
    note text,
    display_template character varying(255),
    hidden boolean DEFAULT false NOT NULL,
    singleton boolean DEFAULT false NOT NULL,
    translations json,
    archive_field character varying(64),
    archive_app_filter boolean DEFAULT true NOT NULL,
    archive_value character varying(255),
    unarchive_value character varying(255),
    sort_field character varying(64),
    accountability character varying(255) DEFAULT 'all'::character varying,
    color character varying(255),
    item_duplication_fields json,
    sort integer,
    "group" character varying(64),
    collapse character varying(255) DEFAULT 'open'::character varying NOT NULL
);


ALTER TABLE public.directus_collections OWNER TO serveri;

--
-- Name: directus_dashboards; Type: TABLE; Schema: public; Owner: serveri
--

CREATE TABLE public.directus_dashboards (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(30) DEFAULT 'dashboard'::character varying NOT NULL,
    note text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    color character varying(255)
);


ALTER TABLE public.directus_dashboards OWNER TO serveri;

--
-- Name: directus_fields; Type: TABLE; Schema: public; Owner: serveri
--

CREATE TABLE public.directus_fields (
    id integer NOT NULL,
    collection character varying(64) NOT NULL,
    field character varying(64) NOT NULL,
    special character varying(64),
    interface character varying(64),
    options json,
    display character varying(64),
    display_options json,
    readonly boolean DEFAULT false NOT NULL,
    hidden boolean DEFAULT false NOT NULL,
    sort integer,
    width character varying(30) DEFAULT 'full'::character varying,
    translations json,
    note text,
    conditions json,
    required boolean DEFAULT false,
    "group" character varying(64),
    validation json,
    validation_message text
);


ALTER TABLE public.directus_fields OWNER TO serveri;

--
-- Name: directus_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: serveri
--

CREATE SEQUENCE public.directus_fields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_fields_id_seq OWNER TO serveri;

--
-- Name: directus_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: serveri
--

ALTER SEQUENCE public.directus_fields_id_seq OWNED BY public.directus_fields.id;


--
-- Name: directus_files; Type: TABLE; Schema: public; Owner: serveri
--

CREATE TABLE public.directus_files (
    id uuid NOT NULL,
    storage character varying(255) NOT NULL,
    filename_disk character varying(255),
    filename_download character varying(255) NOT NULL,
    title character varying(255),
    type character varying(255),
    folder uuid,
    uploaded_by uuid,
    uploaded_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modified_by uuid,
    modified_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    charset character varying(50),
    filesize bigint,
    width integer,
    height integer,
    duration integer,
    embed character varying(200),
    description text,
    location text,
    tags text,
    metadata json
);


ALTER TABLE public.directus_files OWNER TO serveri;

--
-- Name: directus_flows; Type: TABLE; Schema: public; Owner: serveri
--

CREATE TABLE public.directus_flows (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(30),
    color character varying(255),
    description text,
    status character varying(255) DEFAULT 'active'::character varying NOT NULL,
    trigger character varying(255),
    accountability character varying(255) DEFAULT 'all'::character varying,
    options json,
    operation uuid,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_flows OWNER TO serveri;

--
-- Name: directus_folders; Type: TABLE; Schema: public; Owner: serveri
--

CREATE TABLE public.directus_folders (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    parent uuid
);


ALTER TABLE public.directus_folders OWNER TO serveri;

--
-- Name: directus_migrations; Type: TABLE; Schema: public; Owner: serveri
--

CREATE TABLE public.directus_migrations (
    version character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.directus_migrations OWNER TO serveri;

--
-- Name: directus_notifications; Type: TABLE; Schema: public; Owner: serveri
--

CREATE TABLE public.directus_notifications (
    id integer NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    status character varying(255) DEFAULT 'inbox'::character varying,
    recipient uuid NOT NULL,
    sender uuid,
    subject character varying(255) NOT NULL,
    message text,
    collection character varying(64),
    item character varying(255)
);


ALTER TABLE public.directus_notifications OWNER TO serveri;

--
-- Name: directus_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: serveri
--

CREATE SEQUENCE public.directus_notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_notifications_id_seq OWNER TO serveri;

--
-- Name: directus_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: serveri
--

ALTER SEQUENCE public.directus_notifications_id_seq OWNED BY public.directus_notifications.id;


--
-- Name: directus_operations; Type: TABLE; Schema: public; Owner: serveri
--

CREATE TABLE public.directus_operations (
    id uuid NOT NULL,
    name character varying(255),
    key character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    position_x integer NOT NULL,
    position_y integer NOT NULL,
    options json,
    resolve uuid,
    reject uuid,
    flow uuid NOT NULL,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_operations OWNER TO serveri;

--
-- Name: directus_panels; Type: TABLE; Schema: public; Owner: serveri
--

CREATE TABLE public.directus_panels (
    id uuid NOT NULL,
    dashboard uuid NOT NULL,
    name character varying(255),
    icon character varying(30) DEFAULT NULL::character varying,
    color character varying(10),
    show_header boolean DEFAULT false NOT NULL,
    note text,
    type character varying(255) NOT NULL,
    position_x integer NOT NULL,
    position_y integer NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    options json,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_panels OWNER TO serveri;

--
-- Name: directus_permissions; Type: TABLE; Schema: public; Owner: serveri
--

CREATE TABLE public.directus_permissions (
    id integer NOT NULL,
    role uuid,
    collection character varying(64) NOT NULL,
    action character varying(10) NOT NULL,
    permissions json,
    validation json,
    presets json,
    fields text
);


ALTER TABLE public.directus_permissions OWNER TO serveri;

--
-- Name: directus_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: serveri
--

CREATE SEQUENCE public.directus_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_permissions_id_seq OWNER TO serveri;

--
-- Name: directus_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: serveri
--

ALTER SEQUENCE public.directus_permissions_id_seq OWNED BY public.directus_permissions.id;


--
-- Name: directus_presets; Type: TABLE; Schema: public; Owner: serveri
--

CREATE TABLE public.directus_presets (
    id integer NOT NULL,
    bookmark character varying(255),
    "user" uuid,
    role uuid,
    collection character varying(64),
    search character varying(100),
    layout character varying(100) DEFAULT 'tabular'::character varying,
    layout_query json,
    layout_options json,
    refresh_interval integer,
    filter json,
    icon character varying(30) DEFAULT 'bookmark'::character varying,
    color character varying(255)
);


ALTER TABLE public.directus_presets OWNER TO serveri;

--
-- Name: directus_presets_id_seq; Type: SEQUENCE; Schema: public; Owner: serveri
--

CREATE SEQUENCE public.directus_presets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_presets_id_seq OWNER TO serveri;

--
-- Name: directus_presets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: serveri
--

ALTER SEQUENCE public.directus_presets_id_seq OWNED BY public.directus_presets.id;


--
-- Name: directus_relations; Type: TABLE; Schema: public; Owner: serveri
--

CREATE TABLE public.directus_relations (
    id integer NOT NULL,
    many_collection character varying(64) NOT NULL,
    many_field character varying(64) NOT NULL,
    one_collection character varying(64),
    one_field character varying(64),
    one_collection_field character varying(64),
    one_allowed_collections text,
    junction_field character varying(64),
    sort_field character varying(64),
    one_deselect_action character varying(255) DEFAULT 'nullify'::character varying NOT NULL
);


ALTER TABLE public.directus_relations OWNER TO serveri;

--
-- Name: directus_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: serveri
--

CREATE SEQUENCE public.directus_relations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_relations_id_seq OWNER TO serveri;

--
-- Name: directus_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: serveri
--

ALTER SEQUENCE public.directus_relations_id_seq OWNED BY public.directus_relations.id;


--
-- Name: directus_revisions; Type: TABLE; Schema: public; Owner: serveri
--

CREATE TABLE public.directus_revisions (
    id integer NOT NULL,
    activity integer NOT NULL,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    data json,
    delta json,
    parent integer
);


ALTER TABLE public.directus_revisions OWNER TO serveri;

--
-- Name: directus_revisions_id_seq; Type: SEQUENCE; Schema: public; Owner: serveri
--

CREATE SEQUENCE public.directus_revisions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_revisions_id_seq OWNER TO serveri;

--
-- Name: directus_revisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: serveri
--

ALTER SEQUENCE public.directus_revisions_id_seq OWNED BY public.directus_revisions.id;


--
-- Name: directus_roles; Type: TABLE; Schema: public; Owner: serveri
--

CREATE TABLE public.directus_roles (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    icon character varying(30) DEFAULT 'supervised_user_circle'::character varying NOT NULL,
    description text,
    ip_access text,
    enforce_tfa boolean DEFAULT false NOT NULL,
    admin_access boolean DEFAULT false NOT NULL,
    app_access boolean DEFAULT true NOT NULL
);


ALTER TABLE public.directus_roles OWNER TO serveri;

--
-- Name: directus_sessions; Type: TABLE; Schema: public; Owner: serveri
--

CREATE TABLE public.directus_sessions (
    token character varying(64) NOT NULL,
    "user" uuid,
    expires timestamp with time zone NOT NULL,
    ip character varying(255),
    user_agent character varying(255),
    share uuid,
    origin character varying(255)
);


ALTER TABLE public.directus_sessions OWNER TO serveri;

--
-- Name: directus_settings; Type: TABLE; Schema: public; Owner: serveri
--

CREATE TABLE public.directus_settings (
    id integer NOT NULL,
    project_name character varying(100) DEFAULT 'Directus'::character varying NOT NULL,
    project_url character varying(255),
    project_color character varying(50) DEFAULT NULL::character varying,
    project_logo uuid,
    public_foreground uuid,
    public_background uuid,
    public_note text,
    auth_login_attempts integer DEFAULT 25,
    auth_password_policy character varying(100),
    storage_asset_transform character varying(7) DEFAULT 'all'::character varying,
    storage_asset_presets json,
    custom_css text,
    storage_default_folder uuid,
    basemaps json,
    mapbox_key character varying(255),
    module_bar json,
    project_descriptor character varying(100),
    translation_strings json,
    default_language character varying(255) DEFAULT 'en-US'::character varying NOT NULL,
    custom_aspect_ratios json
);


ALTER TABLE public.directus_settings OWNER TO serveri;

--
-- Name: directus_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: serveri
--

CREATE SEQUENCE public.directus_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_settings_id_seq OWNER TO serveri;

--
-- Name: directus_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: serveri
--

ALTER SEQUENCE public.directus_settings_id_seq OWNED BY public.directus_settings.id;


--
-- Name: directus_shares; Type: TABLE; Schema: public; Owner: serveri
--

CREATE TABLE public.directus_shares (
    id uuid NOT NULL,
    name character varying(255),
    collection character varying(64),
    item character varying(255),
    role uuid,
    password character varying(255),
    user_created uuid,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_start timestamp with time zone,
    date_end timestamp with time zone,
    times_used integer DEFAULT 0,
    max_uses integer
);


ALTER TABLE public.directus_shares OWNER TO serveri;

--
-- Name: directus_users; Type: TABLE; Schema: public; Owner: serveri
--

CREATE TABLE public.directus_users (
    id uuid NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(128),
    password character varying(255),
    location character varying(255),
    title character varying(50),
    description text,
    tags json,
    avatar uuid,
    language character varying(255) DEFAULT NULL::character varying,
    theme character varying(20) DEFAULT 'auto'::character varying,
    tfa_secret character varying(255),
    status character varying(16) DEFAULT 'active'::character varying NOT NULL,
    role uuid,
    token character varying(255),
    last_access timestamp with time zone,
    last_page character varying(255),
    provider character varying(128) DEFAULT 'default'::character varying NOT NULL,
    external_identifier character varying(255),
    auth_data json,
    email_notifications boolean DEFAULT true
);


ALTER TABLE public.directus_users OWNER TO serveri;

--
-- Name: directus_webhooks; Type: TABLE; Schema: public; Owner: serveri
--

CREATE TABLE public.directus_webhooks (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    method character varying(10) DEFAULT 'POST'::character varying NOT NULL,
    url character varying(255) NOT NULL,
    status character varying(10) DEFAULT 'active'::character varying NOT NULL,
    data boolean DEFAULT true NOT NULL,
    actions character varying(100) NOT NULL,
    collections character varying(255) NOT NULL,
    headers json
);


ALTER TABLE public.directus_webhooks OWNER TO serveri;

--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: serveri
--

CREATE SEQUENCE public.directus_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_webhooks_id_seq OWNER TO serveri;

--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: serveri
--

ALTER SEQUENCE public.directus_webhooks_id_seq OWNED BY public.directus_webhooks.id;


--
-- Name: LandingPage id; Type: DEFAULT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public."LandingPage" ALTER COLUMN id SET DEFAULT nextval('public."LandingPage_id_seq"'::regclass);


--
-- Name: directus_activity id; Type: DEFAULT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_activity ALTER COLUMN id SET DEFAULT nextval('public.directus_activity_id_seq'::regclass);


--
-- Name: directus_fields id; Type: DEFAULT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_fields ALTER COLUMN id SET DEFAULT nextval('public.directus_fields_id_seq'::regclass);


--
-- Name: directus_notifications id; Type: DEFAULT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_notifications ALTER COLUMN id SET DEFAULT nextval('public.directus_notifications_id_seq'::regclass);


--
-- Name: directus_permissions id; Type: DEFAULT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_permissions ALTER COLUMN id SET DEFAULT nextval('public.directus_permissions_id_seq'::regclass);


--
-- Name: directus_presets id; Type: DEFAULT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_presets ALTER COLUMN id SET DEFAULT nextval('public.directus_presets_id_seq'::regclass);


--
-- Name: directus_relations id; Type: DEFAULT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_relations ALTER COLUMN id SET DEFAULT nextval('public.directus_relations_id_seq'::regclass);


--
-- Name: directus_revisions id; Type: DEFAULT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_revisions ALTER COLUMN id SET DEFAULT nextval('public.directus_revisions_id_seq'::regclass);


--
-- Name: directus_settings id; Type: DEFAULT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_settings ALTER COLUMN id SET DEFAULT nextval('public.directus_settings_id_seq'::regclass);


--
-- Name: directus_webhooks id; Type: DEFAULT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_webhooks ALTER COLUMN id SET DEFAULT nextval('public.directus_webhooks_id_seq'::regclass);


--
-- Data for Name: LandingPage; Type: TABLE DATA; Schema: public; Owner: serveri
--

COPY public."LandingPage" (id, user_updated, date_updated, fi_title, en_title, fi_description, en_description, fi_button_text, en_button_text, en_button_url, fi_button_url) FROM stdin;
1	\N	\N	Serveri ry	Serveri ry	Itä-Suomen yliopiston Kuopion kampuksen tietojenkäsittelytieteen opiskelijoiden ainejärjestö 	The computer science students' subject organization of the Kuopio campus of the University of Eastern Finland	Millaista tietojenkäsittelytiede on?	What is computer science like?	/opiskelu/tkt	/opiskelu/tkt
\.


--
-- Data for Name: directus_activity; Type: TABLE DATA; Schema: public; Owner: serveri
--

COPY public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) FROM stdin;
1	login	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 10:55:14.183+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_users	0891a0cd-876b-4a0d-a22e-0cce30121382	\N	http://localhost:8081
2	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 11:02:40.383+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	1	\N	http://localhost:8081
3	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 11:02:40.392+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	2	\N	http://localhost:8081
4	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 11:02:40.398+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	3	\N	http://localhost:8081
5	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 11:02:40.406+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_collections	LandingPage	\N	http://localhost:8081
6	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 11:04:13.436+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	4	\N	http://localhost:8081
7	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 11:04:48.805+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	5	\N	http://localhost:8081
8	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 11:06:58.202+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	6	\N	http://localhost:8081
9	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 11:07:10.585+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	7	\N	http://localhost:8081
10	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 11:07:20.647+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	8	\N	http://localhost:8081
11	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 11:07:30.776+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	9	\N	http://localhost:8081
12	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 11:07:42.331+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	7	\N	http://localhost:8081
13	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 11:07:46.538+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	9	\N	http://localhost:8081
14	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 11:08:49.735+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	10	\N	http://localhost:8081
15	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 11:08:55.748+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	11	\N	http://localhost:8081
16	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 11:09:18.332+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	12	\N	http://localhost:8081
17	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 11:09:31.231+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	13	\N	http://localhost:8081
18	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 11:09:44.479+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	14	\N	http://localhost:8081
19	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 11:09:52.131+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	15	\N	http://localhost:8081
20	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 11:09:59.44+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	16	\N	http://localhost:8081
21	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 11:10:07.545+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	17	\N	http://localhost:8081
22	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 11:10:09.74+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	1	\N	http://localhost:8081
23	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 11:10:09.774+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	2	\N	http://localhost:8081
24	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 11:10:09.812+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	3	\N	http://localhost:8081
25	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 11:10:09.851+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	10	\N	http://localhost:8081
26	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 11:10:09.889+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	11	\N	http://localhost:8081
27	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 11:10:09.949+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	12	\N	http://localhost:8081
28	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 11:10:09.993+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	13	\N	http://localhost:8081
29	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 11:10:10.034+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	14	\N	http://localhost:8081
30	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 11:10:10.057+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	15	\N	http://localhost:8081
31	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 11:10:10.093+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	17	\N	http://localhost:8081
32	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 11:10:10.121+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	16	\N	http://localhost:8081
33	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 11:11:54.68+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	LandingPage	1	\N	http://localhost:8081
34	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 11:12:46.837+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_settings	1	\N	http://localhost:8081
35	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 11:12:52.744+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_settings	1	\N	http://localhost:8081
36	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 11:13:13.953+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_settings	1	\N	http://localhost:8081
37	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 11:13:30.185+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_settings	1	\N	http://localhost:8081
38	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 11:14:15.77+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_permissions	1	\N	http://localhost:8081
39	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 11:14:29.314+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_permissions	1	\N	http://localhost:8081
40	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 11:28:13.382+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_permissions	2	\N	http://localhost:8081
41	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 11:28:21.934+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_permissions	3	\N	http://localhost:8081
42	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 11:28:38.358+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_permissions	1	\N	http://localhost:8081
43	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 11:28:45.792+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_permissions	4	\N	http://localhost:8081
44	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 11:43:41.392+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_permissions	1	\N	http://localhost:8081
45	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 11:44:00.475+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_permissions	1	\N	http://localhost:8081
46	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 11:44:28.41+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_permissions	1	\N	http://localhost:8081
47	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 11:49:32.978+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_permissions	3	\N	http://localhost:8081
48	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 11:49:34.638+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_permissions	2	\N	http://localhost:8081
\.


--
-- Data for Name: directus_collections; Type: TABLE DATA; Schema: public; Owner: serveri
--

COPY public.directus_collections (collection, icon, note, display_template, hidden, singleton, translations, archive_field, archive_app_filter, archive_value, unarchive_value, sort_field, accountability, color, item_duplication_fields, sort, "group", collapse) FROM stdin;
LandingPage	\N	\N	\N	f	t	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open
\.


--
-- Data for Name: directus_dashboards; Type: TABLE DATA; Schema: public; Owner: serveri
--

COPY public.directus_dashboards (id, name, icon, note, date_created, user_created, color) FROM stdin;
\.


--
-- Data for Name: directus_fields; Type: TABLE DATA; Schema: public; Owner: serveri
--

COPY public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) FROM stdin;
1	LandingPage	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
2	LandingPage	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	2	half	\N	\N	\N	f	\N	\N	\N
3	LandingPage	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	3	half	\N	\N	\N	f	\N	\N	\N
10	LandingPage	fi_title	\N	input-multiline	\N	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N
11	LandingPage	en_title	\N	input-multiline	\N	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N
12	LandingPage	fi_description	\N	input-multiline	\N	\N	\N	f	f	6	full	\N	\N	\N	f	\N	\N	\N
13	LandingPage	en_description	\N	input-multiline	\N	\N	\N	f	f	7	full	\N	\N	\N	f	\N	\N	\N
14	LandingPage	fi_button_text	\N	input-multiline	\N	\N	\N	f	f	8	full	\N	\N	\N	f	\N	\N	\N
15	LandingPage	en_button_text	\N	input-multiline	\N	\N	\N	f	f	9	full	\N	\N	\N	f	\N	\N	\N
17	LandingPage	fi_button_url	\N	input-multiline	\N	\N	\N	f	f	10	full	\N	\N	\N	f	\N	\N	\N
16	LandingPage	en_button_url	\N	input-multiline	\N	\N	\N	f	f	11	full	\N	\N	\N	f	\N	\N	\N
\.


--
-- Data for Name: directus_files; Type: TABLE DATA; Schema: public; Owner: serveri
--

COPY public.directus_files (id, storage, filename_disk, filename_download, title, type, folder, uploaded_by, uploaded_on, modified_by, modified_on, charset, filesize, width, height, duration, embed, description, location, tags, metadata) FROM stdin;
\.


--
-- Data for Name: directus_flows; Type: TABLE DATA; Schema: public; Owner: serveri
--

COPY public.directus_flows (id, name, icon, color, description, status, trigger, accountability, options, operation, date_created, user_created) FROM stdin;
\.


--
-- Data for Name: directus_folders; Type: TABLE DATA; Schema: public; Owner: serveri
--

COPY public.directus_folders (id, name, parent) FROM stdin;
\.


--
-- Data for Name: directus_migrations; Type: TABLE DATA; Schema: public; Owner: serveri
--

COPY public.directus_migrations (version, name, "timestamp") FROM stdin;
20201028A	Remove Collection Foreign Keys	2023-04-16 10:51:10.718225+00
20201029A	Remove System Relations	2023-04-16 10:51:10.726135+00
20201029B	Remove System Collections	2023-04-16 10:51:10.732+00
20201029C	Remove System Fields	2023-04-16 10:51:10.761463+00
20201105A	Add Cascade System Relations	2023-04-16 10:51:10.848501+00
20201105B	Change Webhook URL Type	2023-04-16 10:51:10.85757+00
20210225A	Add Relations Sort Field	2023-04-16 10:51:10.86574+00
20210304A	Remove Locked Fields	2023-04-16 10:51:10.870992+00
20210312A	Webhooks Collections Text	2023-04-16 10:51:10.881343+00
20210331A	Add Refresh Interval	2023-04-16 10:51:10.886145+00
20210415A	Make Filesize Nullable	2023-04-16 10:51:10.897545+00
20210416A	Add Collections Accountability	2023-04-16 10:51:10.904285+00
20210422A	Remove Files Interface	2023-04-16 10:51:10.908282+00
20210506A	Rename Interfaces	2023-04-16 10:51:10.958152+00
20210510A	Restructure Relations	2023-04-16 10:51:10.997309+00
20210518A	Add Foreign Key Constraints	2023-04-16 10:51:11.00551+00
20210519A	Add System Fk Triggers	2023-04-16 10:51:11.047388+00
20210521A	Add Collections Icon Color	2023-04-16 10:51:11.052445+00
20210525A	Add Insights	2023-04-16 10:51:11.083298+00
20210608A	Add Deep Clone Config	2023-04-16 10:51:11.088423+00
20210626A	Change Filesize Bigint	2023-04-16 10:51:11.107037+00
20210716A	Add Conditions to Fields	2023-04-16 10:51:11.111944+00
20210721A	Add Default Folder	2023-04-16 10:51:11.119499+00
20210802A	Replace Groups	2023-04-16 10:51:11.124366+00
20210803A	Add Required to Fields	2023-04-16 10:51:11.129387+00
20210805A	Update Groups	2023-04-16 10:51:11.136197+00
20210805B	Change Image Metadata Structure	2023-04-16 10:51:11.141626+00
20210811A	Add Geometry Config	2023-04-16 10:51:11.146535+00
20210831A	Remove Limit Column	2023-04-16 10:51:11.151326+00
20210903A	Add Auth Provider	2023-04-16 10:51:11.176141+00
20210907A	Webhooks Collections Not Null	2023-04-16 10:51:11.18746+00
20210910A	Move Module Setup	2023-04-16 10:51:11.194855+00
20210920A	Webhooks URL Not Null	2023-04-16 10:51:11.207416+00
20210924A	Add Collection Organization	2023-04-16 10:51:11.215632+00
20210927A	Replace Fields Group	2023-04-16 10:51:11.228307+00
20210927B	Replace M2M Interface	2023-04-16 10:51:11.2321+00
20210929A	Rename Login Action	2023-04-16 10:51:11.235525+00
20211007A	Update Presets	2023-04-16 10:51:11.245421+00
20211009A	Add Auth Data	2023-04-16 10:51:11.250379+00
20211016A	Add Webhook Headers	2023-04-16 10:51:11.255453+00
20211103A	Set Unique to User Token	2023-04-16 10:51:11.264709+00
20211103B	Update Special Geometry	2023-04-16 10:51:11.268403+00
20211104A	Remove Collections Listing	2023-04-16 10:51:11.274301+00
20211118A	Add Notifications	2023-04-16 10:51:11.295958+00
20211211A	Add Shares	2023-04-16 10:51:11.325663+00
20211230A	Add Project Descriptor	2023-04-16 10:51:11.331067+00
20220303A	Remove Default Project Color	2023-04-16 10:51:11.341866+00
20220308A	Add Bookmark Icon and Color	2023-04-16 10:51:11.346835+00
20220314A	Add Translation Strings	2023-04-16 10:51:11.352197+00
20220322A	Rename Field Typecast Flags	2023-04-16 10:51:11.356815+00
20220323A	Add Field Validation	2023-04-16 10:51:11.362203+00
20220325A	Fix Typecast Flags	2023-04-16 10:51:11.366317+00
20220325B	Add Default Language	2023-04-16 10:51:11.38078+00
20220402A	Remove Default Value Panel Icon	2023-04-16 10:51:11.391991+00
20220429A	Add Flows	2023-04-16 10:51:11.447155+00
20220429B	Add Color to Insights Icon	2023-04-16 10:51:11.451901+00
20220429C	Drop Non Null From IP of Activity	2023-04-16 10:51:11.457711+00
20220429D	Drop Non Null From Sender of Notifications	2023-04-16 10:51:11.46374+00
20220614A	Rename Hook Trigger to Event	2023-04-16 10:51:11.467942+00
20220801A	Update Notifications Timestamp Column	2023-04-16 10:51:11.480534+00
20220802A	Add Custom Aspect Ratios	2023-04-16 10:51:11.485302+00
20220826A	Add Origin to Accountability	2023-04-16 10:51:11.493317+00
20230401A	Update Material Icons	2023-04-16 10:51:11.50648+00
\.


--
-- Data for Name: directus_notifications; Type: TABLE DATA; Schema: public; Owner: serveri
--

COPY public.directus_notifications (id, "timestamp", status, recipient, sender, subject, message, collection, item) FROM stdin;
\.


--
-- Data for Name: directus_operations; Type: TABLE DATA; Schema: public; Owner: serveri
--

COPY public.directus_operations (id, name, key, type, position_x, position_y, options, resolve, reject, flow, date_created, user_created) FROM stdin;
\.


--
-- Data for Name: directus_panels; Type: TABLE DATA; Schema: public; Owner: serveri
--

COPY public.directus_panels (id, dashboard, name, icon, color, show_header, note, type, position_x, position_y, width, height, options, date_created, user_created) FROM stdin;
\.


--
-- Data for Name: directus_permissions; Type: TABLE DATA; Schema: public; Owner: serveri
--

COPY public.directus_permissions (id, role, collection, action, permissions, validation, presets, fields) FROM stdin;
4	\N	directus_users	read	{}	{}	\N	*
1	\N	LandingPage	read	\N	{}	\N	fi_title,en_title,fi_description,en_description,fi_button_text,en_button_text,fi_button_url,en_button_url
\.


--
-- Data for Name: directus_presets; Type: TABLE DATA; Schema: public; Owner: serveri
--

COPY public.directus_presets (id, bookmark, "user", role, collection, search, layout, layout_query, layout_options, refresh_interval, filter, icon, color) FROM stdin;
\.


--
-- Data for Name: directus_relations; Type: TABLE DATA; Schema: public; Owner: serveri
--

COPY public.directus_relations (id, many_collection, many_field, one_collection, one_field, one_collection_field, one_allowed_collections, junction_field, sort_field, one_deselect_action) FROM stdin;
1	LandingPage	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
\.


--
-- Data for Name: directus_revisions; Type: TABLE DATA; Schema: public; Owner: serveri
--

COPY public.directus_revisions (id, activity, collection, item, data, delta, parent) FROM stdin;
1	2	directus_fields	1	{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"LandingPage"}	{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"LandingPage"}	\N
2	3	directus_fields	2	{"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"LandingPage"}	{"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"LandingPage"}	\N
3	4	directus_fields	3	{"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"LandingPage"}	{"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"LandingPage"}	\N
4	5	directus_collections	LandingPage	{"singleton":true,"collection":"LandingPage"}	{"singleton":true,"collection":"LandingPage"}	\N
5	6	directus_fields	4	{"interface":"input-multiline","special":null,"options":{"placeholder":"The big text on landing page"},"required":false,"collection":"LandingPage","field":"title"}	{"interface":"input-multiline","special":null,"options":{"placeholder":"The big text on landing page"},"required":false,"collection":"LandingPage","field":"title"}	\N
6	7	directus_fields	5	{"interface":"input-multiline","special":null,"options":{"placeholder":"Description of serveri ry"},"collection":"LandingPage","field":"description"}	{"interface":"input-multiline","special":null,"options":{"placeholder":"Description of serveri ry"},"collection":"LandingPage","field":"description"}	\N
7	8	directus_fields	6	{"interface":"input-multiline","special":null,"options":{"placeholder":null},"collection":"LandingPage","field":"fi_button_text"}	{"interface":"input-multiline","special":null,"options":{"placeholder":null},"collection":"LandingPage","field":"fi_button_text"}	\N
8	9	directus_fields	7	{"interface":"input-multiline","special":null,"collection":"LandingPage","field":"fi_button_link"}	{"interface":"input-multiline","special":null,"collection":"LandingPage","field":"fi_button_link"}	\N
9	10	directus_fields	8	{"interface":"input-multiline","special":null,"collection":"LandingPage","field":"en_button_text"}	{"interface":"input-multiline","special":null,"collection":"LandingPage","field":"en_button_text"}	\N
10	11	directus_fields	9	{"interface":"input-multiline","special":null,"collection":"LandingPage","field":"en_button_url"}	{"interface":"input-multiline","special":null,"collection":"LandingPage","field":"en_button_url"}	\N
11	12	directus_fields	7	{"id":7,"collection":"LandingPage","field":"fi_button_link","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"LandingPage","field":"fi_button_link","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N
12	13	directus_fields	9	{"id":9,"collection":"LandingPage","field":"en_button_url","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"LandingPage","field":"en_button_url","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N
13	14	directus_fields	10	{"interface":"input-multiline","special":null,"collection":"LandingPage","field":"fi_title"}	{"interface":"input-multiline","special":null,"collection":"LandingPage","field":"fi_title"}	\N
14	15	directus_fields	11	{"interface":"input-multiline","special":null,"collection":"LandingPage","field":"en_title"}	{"interface":"input-multiline","special":null,"collection":"LandingPage","field":"en_title"}	\N
15	16	directus_fields	12	{"interface":"input-multiline","special":null,"collection":"LandingPage","field":"fi_description"}	{"interface":"input-multiline","special":null,"collection":"LandingPage","field":"fi_description"}	\N
16	17	directus_fields	13	{"interface":"input-multiline","special":null,"collection":"LandingPage","field":"en_description"}	{"interface":"input-multiline","special":null,"collection":"LandingPage","field":"en_description"}	\N
17	18	directus_fields	14	{"interface":"input-multiline","special":null,"collection":"LandingPage","field":"fi_button_text"}	{"interface":"input-multiline","special":null,"collection":"LandingPage","field":"fi_button_text"}	\N
18	19	directus_fields	15	{"interface":"input-multiline","special":null,"collection":"LandingPage","field":"en_button_text"}	{"interface":"input-multiline","special":null,"collection":"LandingPage","field":"en_button_text"}	\N
19	20	directus_fields	16	{"interface":"input-multiline","special":null,"collection":"LandingPage","field":"en_button_url"}	{"interface":"input-multiline","special":null,"collection":"LandingPage","field":"en_button_url"}	\N
20	21	directus_fields	17	{"interface":"input-multiline","special":null,"collection":"LandingPage","field":"fi_button_url"}	{"interface":"input-multiline","special":null,"collection":"LandingPage","field":"fi_button_url"}	\N
21	22	directus_fields	1	{"id":1,"collection":"LandingPage","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"LandingPage","field":"id","sort":1,"group":null}	\N
22	23	directus_fields	2	{"id":2,"collection":"LandingPage","field":"user_updated","special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":2,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"LandingPage","field":"user_updated","sort":2,"group":null}	\N
23	24	directus_fields	3	{"id":3,"collection":"LandingPage","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"LandingPage","field":"date_updated","sort":3,"group":null}	\N
24	25	directus_fields	10	{"id":10,"collection":"LandingPage","field":"fi_title","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"LandingPage","field":"fi_title","sort":4,"group":null}	\N
25	26	directus_fields	11	{"id":11,"collection":"LandingPage","field":"en_title","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"LandingPage","field":"en_title","sort":5,"group":null}	\N
26	27	directus_fields	12	{"id":12,"collection":"LandingPage","field":"fi_description","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"LandingPage","field":"fi_description","sort":6,"group":null}	\N
27	28	directus_fields	13	{"id":13,"collection":"LandingPage","field":"en_description","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"LandingPage","field":"en_description","sort":7,"group":null}	\N
28	29	directus_fields	14	{"id":14,"collection":"LandingPage","field":"fi_button_text","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"LandingPage","field":"fi_button_text","sort":8,"group":null}	\N
29	30	directus_fields	15	{"id":15,"collection":"LandingPage","field":"en_button_text","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"LandingPage","field":"en_button_text","sort":9,"group":null}	\N
30	31	directus_fields	17	{"id":17,"collection":"LandingPage","field":"fi_button_url","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"LandingPage","field":"fi_button_url","sort":10,"group":null}	\N
31	32	directus_fields	16	{"id":16,"collection":"LandingPage","field":"en_button_url","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":11,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"LandingPage","field":"en_button_url","sort":11,"group":null}	\N
32	33	LandingPage	1	{"fi_title":"Serveri ry","en_title":"Serveri ry","fi_description":"Itä-Suomen yliopiston Kuopion kampuksen tietojenkäsittelytieteen opiskelijoiden ainejärjestö ","en_description":"The computer science students' subject organization of the Kuopio campus of the University of Eastern Finland","fi_button_text":"Millaista tietojenkäsittelytiede on?","en_button_text":"What is computer science like?","fi_button_url":"/opiskelu/tkt","en_button_url":"/opiskelu/tkt"}	{"fi_title":"Serveri ry","en_title":"Serveri ry","fi_description":"Itä-Suomen yliopiston Kuopion kampuksen tietojenkäsittelytieteen opiskelijoiden ainejärjestö ","en_description":"The computer science students' subject organization of the Kuopio campus of the University of Eastern Finland","fi_button_text":"Millaista tietojenkäsittelytiede on?","en_button_text":"What is computer science like?","fi_button_url":"/opiskelu/tkt","en_button_url":"/opiskelu/tkt"}	\N
33	34	directus_settings	1	{"project_name":"Serveri ry web","project_url":"https://serveriry.fi"}	{"project_name":"Serveri ry web","project_url":"https://serveriry.fi"}	\N
34	35	directus_settings	1	{"id":1,"project_name":"Serveri ry nuxt","project_url":"https://serveriry.fi","project_color":null,"project_logo":null,"public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"all","storage_asset_presets":null,"custom_css":null,"storage_default_folder":null,"basemaps":null,"mapbox_key":null,"module_bar":null,"project_descriptor":null,"translation_strings":null,"default_language":"en-US","custom_aspect_ratios":null}	{"project_name":"Serveri ry nuxt"}	\N
35	36	directus_settings	1	{"id":1,"project_name":"Serveri ry nuxt","project_url":"https://serveriry.fi","project_color":null,"project_logo":null,"public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"all","storage_asset_presets":null,"custom_css":null,"storage_default_folder":null,"basemaps":null,"mapbox_key":null,"module_bar":null,"project_descriptor":"Serveri ry web page content api written with nuxt","translation_strings":null,"default_language":"en-US","custom_aspect_ratios":null}	{"project_descriptor":"Serveri ry web page content api written with nuxt"}	\N
36	37	directus_settings	1	{"id":1,"project_name":"Serveri ry nuxt","project_url":"https://serveriry.fi","project_color":null,"project_logo":null,"public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"all","storage_asset_presets":null,"custom_css":null,"storage_default_folder":null,"basemaps":null,"mapbox_key":null,"module_bar":null,"project_descriptor":"Serveri ry web page content api for nuxt frontend","translation_strings":null,"default_language":"en-US","custom_aspect_ratios":null}	{"project_descriptor":"Serveri ry web page content api for nuxt frontend"}	\N
37	38	directus_permissions	1	{"role":null,"collection":"LandingPage","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"LandingPage","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N
38	39	directus_permissions	1	{"id":1,"role":null,"collection":"LandingPage","action":"read","permissions":{},"validation":{},"presets":null,"fields":["fi_title","en_title","fi_description","en_description","fi_button_text","en_button_text","fi_button_url","en_button_url"]}	{"role":null,"collection":"LandingPage","action":"read","permissions":{},"validation":{},"presets":null,"fields":["fi_title","en_title","fi_description","en_description","fi_button_text","en_button_text","fi_button_url","en_button_url"]}	\N
39	40	directus_permissions	2	{"role":null,"collection":"directus_fields","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"directus_fields","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N
40	41	directus_permissions	3	{"role":null,"collection":"directus_collections","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"directus_collections","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N
41	42	directus_permissions	1	{"id":1,"role":null,"collection":"LandingPage","action":"read","permissions":{},"validation":{},"presets":null,"fields":["*"]}	{"permissions":{},"validation":{},"fields":["*"]}	\N
42	43	directus_permissions	4	{"role":null,"collection":"directus_users","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"directus_users","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N
43	44	directus_permissions	1	{"id":1,"role":null,"collection":"LandingPage","action":"read","permissions":null,"validation":{},"presets":null,"fields":["fi_title","en_title","fi_description","en_description","fi_button_text","en_button_text","fi_button_url","en_button_url"]}	{"role":null,"collection":"LandingPage","action":"read","permissions":null,"validation":{},"presets":null,"fields":["fi_title","en_title","fi_description","en_description","fi_button_text","en_button_text","fi_button_url","en_button_url"]}	\N
44	45	directus_permissions	1	{"id":1,"role":null,"collection":"LandingPage","action":"read","permissions":null,"validation":{},"presets":null,"fields":["fi_title","en_title","fi_description","en_description","fi_button_text","en_button_text","fi_button_url","en_button_url"]}	{"role":null,"collection":"LandingPage","action":"read","permissions":null,"validation":{},"presets":null,"fields":["fi_title","en_title","fi_description","en_description","fi_button_text","en_button_text","fi_button_url","en_button_url"]}	\N
45	46	directus_permissions	1	{"id":1,"role":null,"collection":"LandingPage","action":"read","permissions":null,"validation":{},"presets":null,"fields":["fi_title","en_title","fi_description","en_description","fi_button_text","en_button_text","fi_button_url","en_button_url"]}	{"role":null,"collection":"LandingPage","action":"read","permissions":null,"validation":{},"presets":null,"fields":["fi_title","en_title","fi_description","en_description","fi_button_text","en_button_text","fi_button_url","en_button_url"]}	\N
\.


--
-- Data for Name: directus_roles; Type: TABLE DATA; Schema: public; Owner: serveri
--

COPY public.directus_roles (id, name, icon, description, ip_access, enforce_tfa, admin_access, app_access) FROM stdin;
7bd45b9d-d719-4ab1-b7ec-2c68f2eefc76	Administrator	verified	$t:admin_description	\N	f	t	t
\.


--
-- Data for Name: directus_sessions; Type: TABLE DATA; Schema: public; Owner: serveri
--

COPY public.directus_sessions (token, "user", expires, ip, user_agent, share, origin) FROM stdin;
oX01L2tUAAZESn9NIlFFHlv7B49a-zo1o_yzC47ecGucz849B81C7b0TdQhUICYy	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-23 11:48:36.707+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	\N	http://localhost:8081
\.


--
-- Data for Name: directus_settings; Type: TABLE DATA; Schema: public; Owner: serveri
--

COPY public.directus_settings (id, project_name, project_url, project_color, project_logo, public_foreground, public_background, public_note, auth_login_attempts, auth_password_policy, storage_asset_transform, storage_asset_presets, custom_css, storage_default_folder, basemaps, mapbox_key, module_bar, project_descriptor, translation_strings, default_language, custom_aspect_ratios) FROM stdin;
1	Serveri ry nuxt	https://serveriry.fi	\N	\N	\N	\N	\N	25	\N	all	\N	\N	\N	\N	\N	\N	Serveri ry web page content api for nuxt frontend	\N	en-US	\N
\.


--
-- Data for Name: directus_shares; Type: TABLE DATA; Schema: public; Owner: serveri
--

COPY public.directus_shares (id, name, collection, item, role, password, user_created, date_created, date_start, date_end, times_used, max_uses) FROM stdin;
\.


--
-- Data for Name: directus_users; Type: TABLE DATA; Schema: public; Owner: serveri
--

COPY public.directus_users (id, first_name, last_name, email, password, location, title, description, tags, avatar, language, theme, tfa_secret, status, role, token, last_access, last_page, provider, external_identifier, auth_data, email_notifications) FROM stdin;
0891a0cd-876b-4a0d-a22e-0cce30121382	Admin	User	dev@serveriry.fi	$argon2id$v=19$m=65536,t=3,p=4$hVskI8M5iDcSrNlBjYgpqQ$VOD9EUHOMkKmWrElydlVl/7ysElrGr+dZcdOU34Ugm0	\N	\N	\N	\N	\N	\N	auto	\N	active	7bd45b9d-d719-4ab1-b7ec-2c68f2eefc76	\N	2023-04-16 11:48:36.708+00	/settings/roles/	default	\N	\N	t
\.


--
-- Data for Name: directus_webhooks; Type: TABLE DATA; Schema: public; Owner: serveri
--

COPY public.directus_webhooks (id, name, method, url, status, data, actions, collections, headers) FROM stdin;
\.


--
-- Name: LandingPage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: serveri
--

SELECT pg_catalog.setval('public."LandingPage_id_seq"', 1, true);


--
-- Name: directus_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: serveri
--

SELECT pg_catalog.setval('public.directus_activity_id_seq', 48, true);


--
-- Name: directus_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: serveri
--

SELECT pg_catalog.setval('public.directus_fields_id_seq', 17, true);


--
-- Name: directus_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: serveri
--

SELECT pg_catalog.setval('public.directus_notifications_id_seq', 1, false);


--
-- Name: directus_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: serveri
--

SELECT pg_catalog.setval('public.directus_permissions_id_seq', 4, true);


--
-- Name: directus_presets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: serveri
--

SELECT pg_catalog.setval('public.directus_presets_id_seq', 1, false);


--
-- Name: directus_relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: serveri
--

SELECT pg_catalog.setval('public.directus_relations_id_seq', 1, true);


--
-- Name: directus_revisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: serveri
--

SELECT pg_catalog.setval('public.directus_revisions_id_seq', 45, true);


--
-- Name: directus_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: serveri
--

SELECT pg_catalog.setval('public.directus_settings_id_seq', 1, true);


--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: serveri
--

SELECT pg_catalog.setval('public.directus_webhooks_id_seq', 1, false);


--
-- Name: LandingPage LandingPage_pkey; Type: CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public."LandingPage"
    ADD CONSTRAINT "LandingPage_pkey" PRIMARY KEY (id);


--
-- Name: directus_activity directus_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_activity
    ADD CONSTRAINT directus_activity_pkey PRIMARY KEY (id);


--
-- Name: directus_collections directus_collections_pkey; Type: CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_pkey PRIMARY KEY (collection);


--
-- Name: directus_dashboards directus_dashboards_pkey; Type: CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_pkey PRIMARY KEY (id);


--
-- Name: directus_fields directus_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_fields
    ADD CONSTRAINT directus_fields_pkey PRIMARY KEY (id);


--
-- Name: directus_files directus_files_pkey; Type: CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_pkey PRIMARY KEY (id);


--
-- Name: directus_flows directus_flows_operation_unique; Type: CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_operation_unique UNIQUE (operation);


--
-- Name: directus_flows directus_flows_pkey; Type: CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_pkey PRIMARY KEY (id);


--
-- Name: directus_folders directus_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_pkey PRIMARY KEY (id);


--
-- Name: directus_migrations directus_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_migrations
    ADD CONSTRAINT directus_migrations_pkey PRIMARY KEY (version);


--
-- Name: directus_notifications directus_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_pkey PRIMARY KEY (id);


--
-- Name: directus_operations directus_operations_pkey; Type: CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_pkey PRIMARY KEY (id);


--
-- Name: directus_operations directus_operations_reject_unique; Type: CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_unique UNIQUE (reject);


--
-- Name: directus_operations directus_operations_resolve_unique; Type: CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_unique UNIQUE (resolve);


--
-- Name: directus_panels directus_panels_pkey; Type: CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_pkey PRIMARY KEY (id);


--
-- Name: directus_permissions directus_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_pkey PRIMARY KEY (id);


--
-- Name: directus_presets directus_presets_pkey; Type: CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_pkey PRIMARY KEY (id);


--
-- Name: directus_relations directus_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_relations
    ADD CONSTRAINT directus_relations_pkey PRIMARY KEY (id);


--
-- Name: directus_revisions directus_revisions_pkey; Type: CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_pkey PRIMARY KEY (id);


--
-- Name: directus_roles directus_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_roles
    ADD CONSTRAINT directus_roles_pkey PRIMARY KEY (id);


--
-- Name: directus_sessions directus_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_pkey PRIMARY KEY (token);


--
-- Name: directus_settings directus_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_pkey PRIMARY KEY (id);


--
-- Name: directus_shares directus_shares_pkey; Type: CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_pkey PRIMARY KEY (id);


--
-- Name: directus_users directus_users_email_unique; Type: CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_email_unique UNIQUE (email);


--
-- Name: directus_users directus_users_external_identifier_unique; Type: CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_external_identifier_unique UNIQUE (external_identifier);


--
-- Name: directus_users directus_users_pkey; Type: CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_pkey PRIMARY KEY (id);


--
-- Name: directus_users directus_users_token_unique; Type: CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_token_unique UNIQUE (token);


--
-- Name: directus_webhooks directus_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_webhooks
    ADD CONSTRAINT directus_webhooks_pkey PRIMARY KEY (id);


--
-- Name: directus_collections directus_collections_group_foreign; Type: FK CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_group_foreign FOREIGN KEY ("group") REFERENCES public.directus_collections(collection);


--
-- Name: directus_dashboards directus_dashboards_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_files directus_files_folder_foreign; Type: FK CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_folder_foreign FOREIGN KEY (folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;


--
-- Name: directus_files directus_files_modified_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_modified_by_foreign FOREIGN KEY (modified_by) REFERENCES public.directus_users(id);


--
-- Name: directus_files directus_files_uploaded_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_uploaded_by_foreign FOREIGN KEY (uploaded_by) REFERENCES public.directus_users(id);


--
-- Name: directus_flows directus_flows_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_folders directus_folders_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_folders(id);


--
-- Name: directus_notifications directus_notifications_recipient_foreign; Type: FK CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_recipient_foreign FOREIGN KEY (recipient) REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_notifications directus_notifications_sender_foreign; Type: FK CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_sender_foreign FOREIGN KEY (sender) REFERENCES public.directus_users(id);


--
-- Name: directus_operations directus_operations_flow_foreign; Type: FK CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_flow_foreign FOREIGN KEY (flow) REFERENCES public.directus_flows(id) ON DELETE CASCADE;


--
-- Name: directus_operations directus_operations_reject_foreign; Type: FK CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_foreign FOREIGN KEY (reject) REFERENCES public.directus_operations(id);


--
-- Name: directus_operations directus_operations_resolve_foreign; Type: FK CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_foreign FOREIGN KEY (resolve) REFERENCES public.directus_operations(id);


--
-- Name: directus_operations directus_operations_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_panels directus_panels_dashboard_foreign; Type: FK CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_dashboard_foreign FOREIGN KEY (dashboard) REFERENCES public.directus_dashboards(id) ON DELETE CASCADE;


--
-- Name: directus_panels directus_panels_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_permissions directus_permissions_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_presets directus_presets_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_presets directus_presets_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_revisions directus_revisions_activity_foreign; Type: FK CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_activity_foreign FOREIGN KEY (activity) REFERENCES public.directus_activity(id) ON DELETE CASCADE;


--
-- Name: directus_revisions directus_revisions_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_revisions(id);


--
-- Name: directus_sessions directus_sessions_share_foreign; Type: FK CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_share_foreign FOREIGN KEY (share) REFERENCES public.directus_shares(id) ON DELETE CASCADE;


--
-- Name: directus_sessions directus_sessions_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_settings directus_settings_project_logo_foreign; Type: FK CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_project_logo_foreign FOREIGN KEY (project_logo) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_background_foreign; Type: FK CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_background_foreign FOREIGN KEY (public_background) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_foreground_foreign; Type: FK CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_foreground_foreign FOREIGN KEY (public_foreground) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_storage_default_folder_foreign; Type: FK CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_storage_default_folder_foreign FOREIGN KEY (storage_default_folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;


--
-- Name: directus_shares directus_shares_collection_foreign; Type: FK CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_collection_foreign FOREIGN KEY (collection) REFERENCES public.directus_collections(collection) ON DELETE CASCADE;


--
-- Name: directus_shares directus_shares_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_shares directus_shares_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_users directus_users_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE SET NULL;


--
-- Name: LandingPage landingpage_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public."LandingPage"
    ADD CONSTRAINT landingpage_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- PostgreSQL database dump complete
--

