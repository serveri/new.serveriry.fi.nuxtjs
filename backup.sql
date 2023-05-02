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
    fi_button_url text,
    fi_long_desc text,
    en_long_desc text
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
-- Name: board_members; Type: TABLE; Schema: public; Owner: serveri
--

CREATE TABLE public.board_members (
    id integer NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    name character varying(255) DEFAULT 'Matti Meikäläinen'::character varying,
    email character varying(255) DEFAULT 'matti.meikalainen'::character varying,
    telegram character varying(255) DEFAULT 'mattimeikalainen'::character varying,
    hover_img character varying(255) DEFAULT '/images/placeholder-square.jpg'::character varying,
    img character varying(255) DEFAULT '/images/placeholder-square.jpg'::character varying,
    fi_role character varying(255) DEFAULT 'Jäsen'::character varying,
    en_role character varying(255) DEFAULT 'Member'::character varying,
    fi_desc text DEFAULT 'Hallituksen jäsen toimii hallituksessa'::text,
    en_desc text DEFAULT 'A member of the board serves on the board :)'::text
);


ALTER TABLE public.board_members OWNER TO serveri;

--
-- Name: board_members_id_seq; Type: SEQUENCE; Schema: public; Owner: serveri
--

CREATE SEQUENCE public.board_members_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.board_members_id_seq OWNER TO serveri;

--
-- Name: board_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: serveri
--

ALTER SEQUENCE public.board_members_id_seq OWNED BY public.board_members.id;


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
-- Name: events; Type: TABLE; Schema: public; Owner: serveri
--

CREATE TABLE public.events (
    id integer NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    sort integer,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone
);


ALTER TABLE public.events OWNER TO serveri;

--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: serveri
--

CREATE SEQUENCE public.events_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_id_seq OWNER TO serveri;

--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: serveri
--

ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;


--
-- Name: for_new_student; Type: TABLE; Schema: public; Owner: serveri
--

CREATE TABLE public.for_new_student (
    id integer NOT NULL,
    user_updated uuid,
    date_updated timestamp with time zone,
    fi_text text,
    en_text text
);


ALTER TABLE public.for_new_student OWNER TO serveri;

--
-- Name: for_new_student_id_seq; Type: SEQUENCE; Schema: public; Owner: serveri
--

CREATE SEQUENCE public.for_new_student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.for_new_student_id_seq OWNER TO serveri;

--
-- Name: for_new_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: serveri
--

ALTER SEQUENCE public.for_new_student_id_seq OWNED BY public.for_new_student.id;


--
-- Name: gdpr; Type: TABLE; Schema: public; Owner: serveri
--

CREATE TABLE public.gdpr (
    id integer NOT NULL,
    user_updated uuid,
    date_updated timestamp with time zone,
    fi_text text,
    en_text text
);


ALTER TABLE public.gdpr OWNER TO serveri;

--
-- Name: gdpr_id_seq; Type: SEQUENCE; Schema: public; Owner: serveri
--

CREATE SEQUENCE public.gdpr_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gdpr_id_seq OWNER TO serveri;

--
-- Name: gdpr_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: serveri
--

ALTER SEQUENCE public.gdpr_id_seq OWNED BY public.gdpr.id;


--
-- Name: hallitus_page; Type: TABLE; Schema: public; Owner: serveri
--

CREATE TABLE public.hallitus_page (
    id integer NOT NULL,
    user_updated uuid,
    date_updated timestamp with time zone,
    fi_text text,
    en_text text
);


ALTER TABLE public.hallitus_page OWNER TO serveri;

--
-- Name: hallitus_page_id_seq; Type: SEQUENCE; Schema: public; Owner: serveri
--

CREATE SEQUENCE public.hallitus_page_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hallitus_page_id_seq OWNER TO serveri;

--
-- Name: hallitus_page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: serveri
--

ALTER SEQUENCE public.hallitus_page_id_seq OWNED BY public.hallitus_page.id;


--
-- Name: liity_serveriin; Type: TABLE; Schema: public; Owner: serveri
--

CREATE TABLE public.liity_serveriin (
    id integer NOT NULL,
    user_updated uuid,
    date_updated timestamp with time zone,
    fi_text text,
    en_text text
);


ALTER TABLE public.liity_serveriin OWNER TO serveri;

--
-- Name: liity_serveriin_id_seq; Type: SEQUENCE; Schema: public; Owner: serveri
--

CREATE SEQUENCE public.liity_serveriin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.liity_serveriin_id_seq OWNER TO serveri;

--
-- Name: liity_serveriin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: serveri
--

ALTER SEQUENCE public.liity_serveriin_id_seq OWNED BY public.liity_serveriin.id;


--
-- Name: lomake_vastaukset; Type: TABLE; Schema: public; Owner: serveri
--

CREATE TABLE public.lomake_vastaukset (
    id integer NOT NULL,
    firm_name character varying(255),
    firm_contact character varying(255),
    firm_message text
);


ALTER TABLE public.lomake_vastaukset OWNER TO serveri;

--
-- Name: lomake_vastaukset_id_seq; Type: SEQUENCE; Schema: public; Owner: serveri
--

CREATE SEQUENCE public.lomake_vastaukset_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lomake_vastaukset_id_seq OWNER TO serveri;

--
-- Name: lomake_vastaukset_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: serveri
--

ALTER SEQUENCE public.lomake_vastaukset_id_seq OWNED BY public.lomake_vastaukset.id;


--
-- Name: news; Type: TABLE; Schema: public; Owner: serveri
--

CREATE TABLE public.news (
    id integer NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    sort integer,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    fi_title character varying(255) DEFAULT NULL::character varying,
    en_title character varying(255),
    image character varying(255),
    fi_text text,
    en_text text
);


ALTER TABLE public.news OWNER TO serveri;

--
-- Name: news_id_seq; Type: SEQUENCE; Schema: public; Owner: serveri
--

CREATE SEQUENCE public.news_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.news_id_seq OWNER TO serveri;

--
-- Name: news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: serveri
--

ALTER SEQUENCE public.news_id_seq OWNED BY public.news.id;


--
-- Name: partners; Type: TABLE; Schema: public; Owner: serveri
--

CREATE TABLE public.partners (
    id integer NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    name character varying(255) DEFAULT NULL::character varying,
    url character varying(255),
    img character varying(255)
);


ALTER TABLE public.partners OWNER TO serveri;

--
-- Name: partners_id_seq; Type: SEQUENCE; Schema: public; Owner: serveri
--

CREATE SEQUENCE public.partners_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.partners_id_seq OWNER TO serveri;

--
-- Name: partners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: serveri
--

ALTER SEQUENCE public.partners_id_seq OWNED BY public.partners.id;


--
-- Name: serveri_rules; Type: TABLE; Schema: public; Owner: serveri
--

CREATE TABLE public.serveri_rules (
    id integer NOT NULL,
    user_updated uuid,
    date_updated timestamp with time zone,
    rules_fi text,
    rules_en text
);


ALTER TABLE public.serveri_rules OWNER TO serveri;

--
-- Name: serveri_rules_id_seq; Type: SEQUENCE; Schema: public; Owner: serveri
--

CREATE SEQUENCE public.serveri_rules_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.serveri_rules_id_seq OWNER TO serveri;

--
-- Name: serveri_rules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: serveri
--

ALTER SEQUENCE public.serveri_rules_id_seq OWNED BY public.serveri_rules.id;


--
-- Name: social_medias; Type: TABLE; Schema: public; Owner: serveri
--

CREATE TABLE public.social_medias (
    id integer NOT NULL,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    name character varying(255),
    url character varying(255),
    icon character varying(255)
);


ALTER TABLE public.social_medias OWNER TO serveri;

--
-- Name: social_medias_id_seq; Type: SEQUENCE; Schema: public; Owner: serveri
--

CREATE SEQUENCE public.social_medias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_medias_id_seq OWNER TO serveri;

--
-- Name: social_medias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: serveri
--

ALTER SEQUENCE public.social_medias_id_seq OWNED BY public.social_medias.id;


--
-- Name: study_club; Type: TABLE; Schema: public; Owner: serveri
--

CREATE TABLE public.study_club (
    id integer NOT NULL,
    user_updated uuid,
    date_updated timestamp with time zone,
    fi_text text,
    en_text text
);


ALTER TABLE public.study_club OWNER TO serveri;

--
-- Name: study_club_id_seq; Type: SEQUENCE; Schema: public; Owner: serveri
--

CREATE SEQUENCE public.study_club_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.study_club_id_seq OWNER TO serveri;

--
-- Name: study_club_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: serveri
--

ALTER SEQUENCE public.study_club_id_seq OWNED BY public.study_club.id;


--
-- Name: turvallinen_tila; Type: TABLE; Schema: public; Owner: serveri
--

CREATE TABLE public.turvallinen_tila (
    id integer NOT NULL,
    user_updated uuid,
    date_updated timestamp with time zone,
    turvallinen_tila_fi text,
    turvalinen_tila_en text
);


ALTER TABLE public.turvallinen_tila OWNER TO serveri;

--
-- Name: turvallinen_tila_id_seq; Type: SEQUENCE; Schema: public; Owner: serveri
--

CREATE SEQUENCE public.turvallinen_tila_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.turvallinen_tila_id_seq OWNER TO serveri;

--
-- Name: turvallinen_tila_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: serveri
--

ALTER SEQUENCE public.turvallinen_tila_id_seq OWNED BY public.turvallinen_tila.id;


--
-- Name: LandingPage id; Type: DEFAULT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public."LandingPage" ALTER COLUMN id SET DEFAULT nextval('public."LandingPage_id_seq"'::regclass);


--
-- Name: board_members id; Type: DEFAULT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.board_members ALTER COLUMN id SET DEFAULT nextval('public.board_members_id_seq'::regclass);


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
-- Name: events id; Type: DEFAULT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);


--
-- Name: for_new_student id; Type: DEFAULT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.for_new_student ALTER COLUMN id SET DEFAULT nextval('public.for_new_student_id_seq'::regclass);


--
-- Name: gdpr id; Type: DEFAULT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.gdpr ALTER COLUMN id SET DEFAULT nextval('public.gdpr_id_seq'::regclass);


--
-- Name: hallitus_page id; Type: DEFAULT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.hallitus_page ALTER COLUMN id SET DEFAULT nextval('public.hallitus_page_id_seq'::regclass);


--
-- Name: liity_serveriin id; Type: DEFAULT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.liity_serveriin ALTER COLUMN id SET DEFAULT nextval('public.liity_serveriin_id_seq'::regclass);


--
-- Name: lomake_vastaukset id; Type: DEFAULT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.lomake_vastaukset ALTER COLUMN id SET DEFAULT nextval('public.lomake_vastaukset_id_seq'::regclass);


--
-- Name: news id; Type: DEFAULT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.news ALTER COLUMN id SET DEFAULT nextval('public.news_id_seq'::regclass);


--
-- Name: partners id; Type: DEFAULT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.partners ALTER COLUMN id SET DEFAULT nextval('public.partners_id_seq'::regclass);


--
-- Name: serveri_rules id; Type: DEFAULT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.serveri_rules ALTER COLUMN id SET DEFAULT nextval('public.serveri_rules_id_seq'::regclass);


--
-- Name: social_medias id; Type: DEFAULT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.social_medias ALTER COLUMN id SET DEFAULT nextval('public.social_medias_id_seq'::regclass);


--
-- Name: study_club id; Type: DEFAULT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.study_club ALTER COLUMN id SET DEFAULT nextval('public.study_club_id_seq'::regclass);


--
-- Name: turvallinen_tila id; Type: DEFAULT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.turvallinen_tila ALTER COLUMN id SET DEFAULT nextval('public.turvallinen_tila_id_seq'::regclass);


--
-- Data for Name: LandingPage; Type: TABLE DATA; Schema: public; Owner: serveri
--

COPY public."LandingPage" (id, user_updated, date_updated, fi_title, en_title, fi_description, en_description, fi_button_text, en_button_text, en_button_url, fi_button_url, fi_long_desc, en_long_desc) FROM stdin;
1	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 12:08:03.842+00	Serveri ry	Serveri ry	Itä-Suomen yliopiston Kuopion kampuksen tietojenkäsittelytieteen opiskelijoiden ainejärjestö 	The computer science students' subject organization of the Kuopio campus of the University of Eastern Finland	Millaista tietojenkäsittelytiede on?	What is computer science like?	/opiskelu/tkt	/opiskelu/tkt	# Mitä me teemme?\n\nToimimme linkkinä yliopiston ja opiskelijoiden välillä mm. keräämällä ja välittämällä opiskelijapalautetta yliopistolle. Tarjoamme opiskelijajäsenillemme ohjausta edunvalvonnallisissa asioissa ja järjestämme opintojen oheen vapaa-ajan toimintaa sekä itsenäisesti että yhdessä muiden ainejärjestöjen kanssa. Järjestämme toimintaa myös työelämään valmistelevalla näkökulmalla ottamalla silloin tällöin vaikutteita suoraan tietojenkäsittelytieteen alan yritysten toiminnasta, jakamalla tietoa valmistumisen jälkeisistä mahdollisuusista ja helpotamme siten tulevien tietojenkäsittelijöiden erikoistuvaa suuntautumista.\n\nServerit ovat legendaarisia hauskanpitäjiä - omien hippaloiden lisäksi valkohaalariset tunnetaankin ahkerina kuokkijoina ja keräämme mielellämme kyseenalaista kunniaa opiskelijatapahtumissa ympäri Suomen. Ei siis ihme että Serverin tavaramerkkinä pidetään loistavaa yhteishenkeä ja mahtavaa aktiivisuutta, nörtti-imagosta puhumattakaan! 	# What do we do?\n\nWe act as a link between the university and students, for example by collecting and transmitting student feedback to the university. We offer our student members guidance on advocacy issues and organise extracurricular activities, both independently and in cooperation with other student organisations. We also organise activities with a view to preparing students for the world of work by occasionally taking direct inspiration from companies in the computer science sector, sharing information about opportunities after graduation and thus facilitating the specialisation of future computer scientists.\n\nServers are legendary fun lovers - in addition to our own hijinks, the Whitefish are known as hard-working hackers and we like to garner questionable glory at student events all over Finland. It's no wonder that Server is known for its great team spirit and awesome activity, not to mention its nerd image! 
\.


--
-- Data for Name: board_members; Type: TABLE DATA; Schema: public; Owner: serveri
--

COPY public.board_members (id, status, user_created, date_created, user_updated, date_updated, name, email, telegram, hover_img, img, fi_role, en_role, fi_desc, en_desc) FROM stdin;
5	published	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 13:45:19.334+00	\N	\N	Matti Meikäläinen	matti.meikalainen	mattimeikalainen	/images/placeholder-square.jpg	/images/placeholder-square.jpg	Jäsen	Member	Hallituksen jäsen toimii hallituksessa	A member of the board serves on the board :)
6	published	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 13:45:48.364+00	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 13:45:54.987+00	Essi Esimerkki	matti.meikalainen	mattimeikalainen	/images/placeholder-square.jpg	/images/placeholder-square.jpg	Tapahtumavastaava	Event manager	Hallituksen jäsen toimii hallituksessa	A member of the board serves on the board :)
7	published	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 13:46:28.935+00	\N	\N	Erkki Esimerkki	erkki.merkki	erkkimerkki	/images/placeholder-square.jpg	/images/placeholder-square.jpg	Puheenjohtaja	Chariman	Hallituksen jäsen toimii hallituksessa	A member of the board serves on the board :)
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
49	login	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:12:35.82+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_users	0891a0cd-876b-4a0d-a22e-0cce30121382	\N	http://127.0.0.1:8081
50	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:16:26.479+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	LandingPage	1	\N	http://127.0.0.1:8081
51	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:19:17.022+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	LandingPage	1	\N	http://127.0.0.1:8081
52	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:19:43.808+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	LandingPage	1	\N	http://127.0.0.1:8081
53	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:21:01.212+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	LandingPage	1	\N	http://127.0.0.1:8081
54	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:21:30.889+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	LandingPage	1	\N	http://127.0.0.1:8081
55	login	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:21:54.228+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_users	0891a0cd-876b-4a0d-a22e-0cce30121382	\N	http://localhost:8081
56	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:22:03.133+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	LandingPage	1	\N	http://localhost:8081
57	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:25:53.835+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	LandingPage	1	\N	http://localhost:8081
58	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:40:45.279+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	LandingPage	1	\N	http://localhost:8081
59	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:40:56.872+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	LandingPage	1	\N	http://localhost:8081
60	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:48:01.677+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	18	\N	http://localhost:8081
61	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:48:01.695+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	19	\N	http://localhost:8081
62	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:48:01.709+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	20	\N	http://localhost:8081
63	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:48:01.723+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	21	\N	http://localhost:8081
64	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:48:01.747+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	22	\N	http://localhost:8081
65	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:48:01.768+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	23	\N	http://localhost:8081
66	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:48:01.782+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_collections	board_members	\N	http://localhost:8081
67	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:53:40.745+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	24	\N	http://localhost:8081
68	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:53:51.295+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	25	\N	http://localhost:8081
69	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:53:58.555+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	26	\N	http://localhost:8081
70	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:54:46.054+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	27	\N	http://localhost:8081
71	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:55:02.943+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	28	\N	http://localhost:8081
72	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:55:39.308+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	29	\N	http://localhost:8081
73	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:56:46.686+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	30	\N	http://localhost:8081
74	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:57:12.076+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	31	\N	http://localhost:8081
75	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:57:16.308+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	18	\N	http://localhost:8081
76	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:57:16.359+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	19	\N	http://localhost:8081
77	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:57:16.409+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	20	\N	http://localhost:8081
78	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:57:16.459+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	21	\N	http://localhost:8081
79	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:57:16.545+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	22	\N	http://localhost:8081
80	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:57:16.612+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	23	\N	http://localhost:8081
81	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:57:16.668+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	30	\N	http://localhost:8081
82	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:57:16.713+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	24	\N	http://localhost:8081
83	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:57:16.763+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	25	\N	http://localhost:8081
84	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:57:16.81+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	26	\N	http://localhost:8081
85	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:57:16.858+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	28	\N	http://localhost:8081
86	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:57:16.947+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	29	\N	http://localhost:8081
87	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:57:16.987+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	31	\N	http://localhost:8081
101	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:57:33.371+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	24	\N	http://localhost:8081
102	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:57:46.659+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	25	\N	http://localhost:8081
103	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:58:07.375+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	26	\N	http://localhost:8081
105	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:58:23.972+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	29	\N	http://localhost:8081
108	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:58:32.261+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	25	\N	http://localhost:8081
110	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:58:36.523+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	31	\N	http://localhost:8081
88	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:57:18.251+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	18	\N	http://localhost:8081
89	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:57:18.304+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	19	\N	http://localhost:8081
90	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:57:18.353+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	20	\N	http://localhost:8081
91	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:57:18.405+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	21	\N	http://localhost:8081
92	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:57:18.458+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	22	\N	http://localhost:8081
93	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:57:18.505+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	23	\N	http://localhost:8081
94	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:57:18.548+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	30	\N	http://localhost:8081
95	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:57:18.598+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	31	\N	http://localhost:8081
96	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:57:18.642+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	24	\N	http://localhost:8081
97	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:57:18.684+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	25	\N	http://localhost:8081
98	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:57:18.736+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	26	\N	http://localhost:8081
99	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:57:18.79+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	28	\N	http://localhost:8081
100	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:57:18.852+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	29	\N	http://localhost:8081
104	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:58:18.536+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	28	\N	http://localhost:8081
106	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:58:26.86+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	28	\N	http://localhost:8081
107	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:58:29.438+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	26	\N	http://localhost:8081
109	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:58:34.46+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	24	\N	http://localhost:8081
111	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:58:39.032+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	30	\N	http://localhost:8081
112	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:59:13.184+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	29	\N	http://localhost:8081
113	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 15:59:24.803+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_collections	board_members	\N	http://localhost:8081
114	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 16:04:05.8+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	32	\N	http://localhost:8081
115	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 16:04:08.198+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	18	\N	http://localhost:8081
116	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 16:04:08.261+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	19	\N	http://localhost:8081
117	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 16:04:08.309+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	20	\N	http://localhost:8081
118	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 16:04:08.365+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	21	\N	http://localhost:8081
119	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 16:04:08.416+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	22	\N	http://localhost:8081
120	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 16:04:08.471+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	23	\N	http://localhost:8081
121	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 16:04:08.535+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	32	\N	http://localhost:8081
122	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 16:04:08.6+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	31	\N	http://localhost:8081
123	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 16:04:08.649+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	24	\N	http://localhost:8081
124	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 16:04:08.694+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	25	\N	http://localhost:8081
125	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 16:04:08.745+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	26	\N	http://localhost:8081
126	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 16:04:08.846+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	28	\N	http://localhost:8081
127	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 16:04:08.913+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	29	\N	http://localhost:8081
128	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 16:04:22.146+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	32	\N	http://localhost:8081
129	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 16:04:30.263+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_fields	31	\N	http://localhost:8081
130	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 16:04:40.409+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	board_members	1	\N	http://localhost:8081
131	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 16:05:10.471+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	board_members	2	\N	http://localhost:8081
132	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 16:05:39.856+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_permissions	5	\N	http://localhost:8081
133	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-16 16:06:15.098+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0	directus_permissions	5	\N	http://localhost:8081
134	login	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-17 10:29:38.86+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_users	0891a0cd-876b-4a0d-a22e-0cce30121382	\N	http://127.0.0.1:8081
135	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-17 10:30:09.436+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	LandingPage	1	\N	http://127.0.0.1:8081
136	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-17 10:37:48.226+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	board_members	3	\N	http://127.0.0.1:8081
137	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-17 10:43:51.3+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	board_members	2	\N	http://127.0.0.1:8081
138	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-17 10:55:16.162+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	33	\N	http://127.0.0.1:8081
139	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-17 10:55:16.211+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	34	\N	http://127.0.0.1:8081
140	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-17 10:55:16.267+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	35	\N	http://127.0.0.1:8081
141	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-17 10:55:16.323+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	36	\N	http://127.0.0.1:8081
142	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-17 10:55:16.4+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	37	\N	http://127.0.0.1:8081
143	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-17 10:55:16.483+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_collections	social_medias	\N	http://127.0.0.1:8081
144	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-17 10:56:29.229+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	38	\N	http://127.0.0.1:8081
145	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-17 10:56:47.29+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	39	\N	http://127.0.0.1:8081
146	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-17 10:57:18.102+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	40	\N	http://127.0.0.1:8081
147	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-17 10:57:43.245+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_permissions	6	\N	http://127.0.0.1:8081
148	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-17 10:57:53.467+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_permissions	6	\N	http://127.0.0.1:8081
149	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-17 10:59:01.27+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	social_medias	1	\N	http://127.0.0.1:8081
150	login	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 09:41:59.856+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	directus_users	0891a0cd-876b-4a0d-a22e-0cce30121382	\N	http://10.143.20.7:8081
151	login	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 11:04:19.081+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_users	0891a0cd-876b-4a0d-a22e-0cce30121382	\N	http://127.0.0.1:8081
152	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 11:05:58.393+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	41	\N	http://127.0.0.1:8081
153	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 11:05:58.518+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	42	\N	http://127.0.0.1:8081
154	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 11:05:58.675+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	43	\N	http://127.0.0.1:8081
155	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 11:05:58.727+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	44	\N	http://127.0.0.1:8081
156	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 11:05:58.796+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	45	\N	http://127.0.0.1:8081
157	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 11:05:58.922+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	46	\N	http://127.0.0.1:8081
158	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 11:05:59.039+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	47	\N	http://127.0.0.1:8081
159	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 11:05:59.126+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_collections	news	\N	http://127.0.0.1:8081
160	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 11:09:01.841+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	48	\N	http://127.0.0.1:8081
161	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 11:09:41.502+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	49	\N	http://127.0.0.1:8081
162	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 11:10:46.293+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	50	\N	http://127.0.0.1:8081
163	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 11:11:14.304+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	51	\N	http://127.0.0.1:8081
164	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 11:11:47.142+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	52	\N	http://127.0.0.1:8081
165	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 11:12:03.345+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	51	\N	http://127.0.0.1:8081
166	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 11:13:32.957+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	51	\N	http://127.0.0.1:8081
167	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 11:13:52.634+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	52	\N	http://127.0.0.1:8081
168	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 11:23:18.483+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	53	\N	http://127.0.0.1:8081
169	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 11:23:18.542+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	54	\N	http://127.0.0.1:8081
170	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 11:23:18.594+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	55	\N	http://127.0.0.1:8081
171	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 11:23:18.734+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_collections	serveri_rules	\N	http://127.0.0.1:8081
172	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 11:23:33.373+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	56	\N	http://127.0.0.1:8081
173	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 11:23:53.335+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	57	\N	http://127.0.0.1:8081
174	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 11:24:03.387+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_permissions	7	\N	http://127.0.0.1:8081
175	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 11:24:04.805+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_permissions	8	\N	http://127.0.0.1:8081
176	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 11:25:24.126+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	serveri_rules	1	\N	http://127.0.0.1:8081
177	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 11:32:32.134+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	serveri_rules	1	\N	http://127.0.0.1:8081
178	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 11:37:48.757+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	serveri_rules	1	\N	http://127.0.0.1:8081
179	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 12:05:34.791+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	serveri_rules	1	\N	http://127.0.0.1:8081
180	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 13:02:45.175+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	58	\N	http://127.0.0.1:8081
181	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 13:02:45.231+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	59	\N	http://127.0.0.1:8081
182	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 13:02:45.281+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	60	\N	http://127.0.0.1:8081
183	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 13:02:45.334+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_collections	turvallinen_tila	\N	http://127.0.0.1:8081
184	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 13:03:32.383+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	61	\N	http://127.0.0.1:8081
185	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 13:03:48.196+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	62	\N	http://127.0.0.1:8081
186	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 13:10:14.466+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	63	\N	http://10.143.20.7:8081
187	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 13:10:14.57+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	64	\N	http://10.143.20.7:8081
188	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 13:10:14.613+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	65	\N	http://10.143.20.7:8081
189	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 13:10:14.656+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	66	\N	http://10.143.20.7:8081
190	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 13:10:14.695+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	directus_collections	form_submits	\N	http://10.143.20.7:8081
191	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 13:13:05.938+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	67	\N	http://10.143.20.7:8081
192	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 13:13:23.567+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	68	\N	http://10.143.20.7:8081
193	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 13:14:01.478+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	69	\N	http://10.143.20.7:8081
194	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 13:14:18.366+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	directus_collections	form_submits	\N	http://10.143.20.7:8081
195	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 13:16:28.597+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	directus_collections	form_submits	\N	http://10.143.20.7:8081
196	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 13:16:55.727+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	70	\N	http://10.143.20.7:8081
197	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 13:16:55.785+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	71	\N	http://10.143.20.7:8081
198	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 13:16:55.832+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	72	\N	http://10.143.20.7:8081
199	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 13:16:55.941+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	directus_collections	lomake_vastaukset	\N	http://10.143.20.7:8081
200	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 13:17:09.96+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	73	\N	http://10.143.20.7:8081
201	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 13:17:21.922+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	74	\N	http://10.143.20.7:8081
202	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 13:17:34.005+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	75	\N	http://10.143.20.7:8081
203	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 13:17:59.39+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	directus_collections	lomake_vastaukset	\N	http://10.143.20.7:8081
204	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 13:19:10.947+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	turvallinen_tila	1	\N	http://127.0.0.1:8081
205	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 13:19:51.8+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	turvallinen_tila	1	\N	http://127.0.0.1:8081
206	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 13:25:30.744+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_permissions	9	\N	http://127.0.0.1:8081
207	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 13:26:13.234+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_permissions	7	\N	http://127.0.0.1:8081
208	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 13:26:24.088+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_permissions	8	\N	http://127.0.0.1:8081
209	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 13:26:32.193+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_permissions	9	\N	http://127.0.0.1:8081
210	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 13:58:50.571+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	news	1	\N	http://127.0.0.1:8081
211	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 13:59:40.333+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	news	1	\N	http://127.0.0.1:8081
212	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 14:57:24.273+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	directus_permissions	10	\N	http://10.143.20.7:8081
213	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 14:57:32.703+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	directus_permissions	10	\N	http://10.143.20.7:8081
214	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 14:57:35.59+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	directus_permissions	11	\N	http://10.143.20.7:8081
215	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 14:58:08.675+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	directus_permissions	12	\N	http://10.143.20.7:8081
216	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 14:58:27.79+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	directus_permissions	13	\N	http://10.143.20.7:8081
217	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 15:15:02.909+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	directus_users	0891a0cd-876b-4a0d-a22e-0cce30121382	\N	http://10.143.20.7:8081
218	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 15:56:49.246+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	news	1	\N	http://127.0.0.1:8081
219	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 15:57:07.372+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	news	1	\N	http://127.0.0.1:8081
220	create	\N	2023-04-29 17:28:29.802+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	1	\N	http://10.143.20.7:3000
221	create	\N	2023-04-29 17:28:40.271+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	2	\N	http://10.143.20.7:3000
222	create	\N	2023-04-29 17:28:40.278+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	3	\N	http://10.143.20.7:3000
223	create	\N	2023-04-29 17:28:40.493+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	5	\N	http://10.143.20.7:3000
224	create	\N	2023-04-29 17:28:40.507+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	4	\N	http://10.143.20.7:3000
225	create	\N	2023-04-29 17:28:40.531+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	6	\N	http://10.143.20.7:3000
226	create	\N	2023-04-29 17:28:40.762+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	7	\N	http://10.143.20.7:3000
227	create	\N	2023-04-29 17:28:40.964+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	8	\N	http://10.143.20.7:3000
228	create	\N	2023-04-29 17:28:40.985+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	9	\N	http://10.143.20.7:3000
229	create	\N	2023-04-29 17:28:41.011+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	10	\N	http://10.143.20.7:3000
230	create	\N	2023-04-29 17:28:41.012+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	11	\N	http://10.143.20.7:3000
231	create	\N	2023-04-29 17:28:41.019+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	12	\N	http://10.143.20.7:3000
232	create	\N	2023-04-29 17:28:41.027+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	13	\N	http://10.143.20.7:3000
233	create	\N	2023-04-29 17:28:46.938+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	14	\N	http://10.143.20.7:3000
234	create	\N	2023-04-29 17:29:17.778+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	15	\N	http://10.143.20.7:3000
235	create	\N	2023-04-29 17:30:02.173+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	16	\N	http://10.143.20.7:3000
236	create	\N	2023-04-29 17:30:03.39+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	17	\N	http://10.143.20.7:3000
237	create	\N	2023-04-29 17:30:04.403+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	18	\N	http://10.143.20.7:3000
238	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 17:30:20.345+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	19	\N	http://10.143.20.7:3000
239	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 17:30:22.25+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	20	\N	http://10.143.20.7:3000
240	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 17:30:30.815+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	21	\N	http://10.143.20.7:3000
241	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 17:39:18.363+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	22	\N	http://10.143.20.7:3000
242	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 17:51:47.853+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	23	\N	http://10.143.20.7:3000
243	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 17:53:10.047+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	24	\N	http://10.143.20.7:3000
244	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 17:53:10.05+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	25	\N	http://10.143.20.7:3000
245	login	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 17:53:24.391+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	directus_users	0891a0cd-876b-4a0d-a22e-0cce30121382	\N	http://10.143.20.7:8081
246	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 17:53:38.457+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	1	\N	http://10.143.20.7:8081
247	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 17:53:38.465+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	2	\N	http://10.143.20.7:8081
248	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 17:53:38.474+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	3	\N	http://10.143.20.7:8081
249	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 17:53:38.482+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	4	\N	http://10.143.20.7:8081
250	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 17:53:38.498+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	5	\N	http://10.143.20.7:8081
251	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 17:53:38.506+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	6	\N	http://10.143.20.7:8081
252	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 17:53:38.514+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	7	\N	http://10.143.20.7:8081
253	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 17:53:38.522+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	8	\N	http://10.143.20.7:8081
254	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 17:53:38.53+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	9	\N	http://10.143.20.7:8081
255	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 17:53:38.538+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	10	\N	http://10.143.20.7:8081
256	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 17:53:38.546+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	11	\N	http://10.143.20.7:8081
257	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 17:53:38.554+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	12	\N	http://10.143.20.7:8081
258	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 17:53:38.562+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	13	\N	http://10.143.20.7:8081
259	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 17:53:38.569+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	14	\N	http://10.143.20.7:8081
260	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 17:53:38.577+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	15	\N	http://10.143.20.7:8081
261	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 17:53:38.583+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	16	\N	http://10.143.20.7:8081
262	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 17:53:38.589+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	17	\N	http://10.143.20.7:8081
263	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 17:53:38.609+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	18	\N	http://10.143.20.7:8081
264	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 17:53:38.629+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	19	\N	http://10.143.20.7:8081
265	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 17:53:38.636+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	20	\N	http://10.143.20.7:8081
266	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 17:53:38.643+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	21	\N	http://10.143.20.7:8081
267	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 17:53:38.651+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	22	\N	http://10.143.20.7:8081
268	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 17:53:38.659+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	23	\N	http://10.143.20.7:8081
269	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 17:53:38.667+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	24	\N	http://10.143.20.7:8081
270	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 17:53:38.673+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	25	\N	http://10.143.20.7:8081
271	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 17:53:46.277+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	26	\N	http://10.143.20.7:3000
272	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 17:54:11.55+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	27	\N	http://10.143.20.7:3000
273	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 17:54:56.265+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	28	\N	http://10.143.20.7:3000
274	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 17:57:21.598+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	29	\N	http://10.143.20.7:3000
275	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 17:57:35.545+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	30	\N	http://10.143.20.7:3000
276	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 17:57:44.481+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	31	\N	http://10.143.20.7:3000
277	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 17:57:50.864+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	32	\N	http://10.143.20.7:3000
278	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 17:57:52.316+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	33	\N	http://10.143.20.7:3000
279	create	\N	2023-04-29 17:57:56.299+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	34	\N	http://10.143.20.7:3000
280	create	\N	2023-04-29 17:57:57.705+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	35	\N	http://10.143.20.7:3000
281	create	\N	2023-04-29 17:57:57.784+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	36	\N	http://10.143.20.7:3000
282	create	\N	2023-04-29 17:57:59.053+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	37	\N	http://10.143.20.7:3000
283	create	\N	2023-04-29 17:58:05.613+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	38	\N	http://10.143.20.7:3000
284	create	\N	2023-04-29 17:58:06.52+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	39	\N	http://10.143.20.7:3000
285	create	\N	2023-04-29 17:58:07.555+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	40	\N	http://10.143.20.7:3000
286	create	\N	2023-04-29 17:59:59.757+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	41	\N	http://10.143.20.7:3000
287	create	\N	2023-04-29 18:00:06.115+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	42	\N	http://10.143.20.7:3000
288	create	\N	2023-04-29 18:00:07.3+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	43	\N	http://10.143.20.7:3000
289	create	\N	2023-04-29 18:00:08.171+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	44	\N	http://10.143.20.7:3000
290	create	\N	2023-04-29 18:00:08.926+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	45	\N	http://10.143.20.7:3000
291	create	\N	2023-04-29 18:15:25.194+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	46	\N	http://10.143.20.7:3000
292	create	\N	2023-04-29 18:15:41.524+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	47	\N	http://10.143.20.7:3000
293	create	\N	2023-04-29 18:16:16.283+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	48	\N	http://10.143.20.7:3000
294	create	\N	2023-04-29 18:16:49.354+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	49	\N	http://10.143.20.7:3000
295	create	\N	2023-04-29 18:17:52.339+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	50	\N	http://10.143.20.7:3000
296	create	\N	2023-04-29 18:18:21.694+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	51	\N	http://10.143.20.7:3000
297	create	\N	2023-04-29 18:18:23.14+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	52	\N	http://10.143.20.7:3000
298	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:18:39.461+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	51	\N	http://10.143.20.7:8081
299	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:18:39.473+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	52	\N	http://10.143.20.7:8081
300	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:18:42.715+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	26	\N	http://10.143.20.7:8081
301	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:18:42.721+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	27	\N	http://10.143.20.7:8081
302	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:18:42.727+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	28	\N	http://10.143.20.7:8081
303	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:18:42.742+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	29	\N	http://10.143.20.7:8081
304	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:18:42.747+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	30	\N	http://10.143.20.7:8081
305	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:18:42.752+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	31	\N	http://10.143.20.7:8081
306	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:18:42.757+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	32	\N	http://10.143.20.7:8081
307	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:18:42.763+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	33	\N	http://10.143.20.7:8081
308	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:18:42.768+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	34	\N	http://10.143.20.7:8081
309	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:18:42.778+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	35	\N	http://10.143.20.7:8081
310	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:18:42.788+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	36	\N	http://10.143.20.7:8081
311	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:18:42.794+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	37	\N	http://10.143.20.7:8081
312	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:18:42.801+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	38	\N	http://10.143.20.7:8081
313	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:18:42.813+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	39	\N	http://10.143.20.7:8081
314	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:18:42.829+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	40	\N	http://10.143.20.7:8081
315	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:18:42.852+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	41	\N	http://10.143.20.7:8081
316	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:18:42.874+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	42	\N	http://10.143.20.7:8081
317	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:18:42.894+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	43	\N	http://10.143.20.7:8081
318	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:18:42.9+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	44	\N	http://10.143.20.7:8081
319	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:18:42.906+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	45	\N	http://10.143.20.7:8081
320	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:18:42.912+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	46	\N	http://10.143.20.7:8081
321	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:18:42.918+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	47	\N	http://10.143.20.7:8081
322	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:18:42.925+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	48	\N	http://10.143.20.7:8081
323	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:18:42.93+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	49	\N	http://10.143.20.7:8081
324	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:18:42.935+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	50	\N	http://10.143.20.7:8081
325	create	\N	2023-04-29 18:20:34.453+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	53	\N	http://10.143.20.7:3000
326	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:21:09.916+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	76	\N	http://127.0.0.1:8081
327	create	\N	2023-04-29 18:21:09.932+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	54	\N	http://10.143.20.7:3000
328	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:21:10.049+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	77	\N	http://127.0.0.1:8081
329	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:21:10.119+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	78	\N	http://127.0.0.1:8081
330	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:21:10.162+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	79	\N	http://127.0.0.1:8081
331	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:21:10.254+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	80	\N	http://127.0.0.1:8081
332	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:21:10.418+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	81	\N	http://127.0.0.1:8081
333	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:21:11.089+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_collections	partners	\N	http://127.0.0.1:8081
334	create	\N	2023-04-29 18:21:24.854+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	55	\N	http://10.143.20.7:3000
335	create	\N	2023-04-29 18:21:29.304+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	56	\N	http://10.143.20.7:3000
336	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:21:37.379+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	57	\N	http://10.143.20.7:3000
337	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:21:54.353+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	82	\N	http://127.0.0.1:8081
338	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:22:03.936+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	82	\N	http://127.0.0.1:8081
339	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:22:39.582+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	83	\N	http://127.0.0.1:8081
340	create	\N	2023-04-29 18:22:52.825+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	58	\N	http://10.143.20.7:3000
341	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:23:05.159+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	84	\N	http://127.0.0.1:8081
342	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:23:17.078+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_permissions	14	\N	http://127.0.0.1:8081
343	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:23:31.646+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_permissions	14	\N	http://127.0.0.1:8081
344	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:23:51.641+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	partners	1	\N	http://127.0.0.1:8081
345	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:24:08.313+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	partners	2	\N	http://127.0.0.1:8081
346	create	\N	2023-04-29 18:24:19.274+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	59	\N	http://10.143.20.7:3000
347	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:24:26.518+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	partners	3	\N	http://127.0.0.1:8081
348	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:24:44.05+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	partners	4	\N	http://127.0.0.1:8081
349	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:24:47.909+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	partners	2	\N	http://127.0.0.1:8081
350	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:24:50.942+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	partners	1	\N	http://127.0.0.1:8081
351	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:25:06.436+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	partners	5	\N	http://127.0.0.1:8081
352	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:25:29.413+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	partners	6	\N	http://127.0.0.1:8081
353	create	\N	2023-04-29 18:25:41.74+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	60	\N	http://10.143.20.7:3000
354	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:25:46.79+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	partners	7	\N	http://127.0.0.1:8081
355	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:26:02.815+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	partners	8	\N	http://127.0.0.1:8081
356	create	\N	2023-04-29 18:27:08.615+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	61	\N	http://10.143.20.7:3000
357	create	\N	2023-04-29 18:27:24.032+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	62	\N	http://10.143.20.7:3000
358	create	\N	2023-04-29 18:28:14.025+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	63	\N	http://10.143.20.7:3000
359	create	\N	2023-04-29 18:28:49.216+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	64	\N	http://10.143.20.7:3000
360	create	\N	2023-04-29 18:29:17.891+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	65	\N	http://10.143.20.7:3000
361	create	\N	2023-04-29 18:30:42.204+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	66	\N	http://10.143.20.7:3000
362	create	\N	2023-04-29 18:31:23.898+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	67	\N	http://10.143.20.7:3000
363	create	\N	2023-04-29 18:31:25.191+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	68	\N	http://10.143.20.7:3000
364	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:32:20.49+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	10	\N	http://127.0.0.1:8081
365	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:32:27.902+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	11	\N	http://127.0.0.1:8081
366	create	\N	2023-04-29 18:32:40.938+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	69	\N	http://10.143.20.7:3000
367	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:32:43.632+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	14	\N	http://127.0.0.1:8081
368	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:32:51.841+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	15	\N	http://127.0.0.1:8081
369	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:32:59.013+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	17	\N	http://127.0.0.1:8081
370	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:33:04.895+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	16	\N	http://127.0.0.1:8081
371	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:33:31.154+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	12	\N	http://127.0.0.1:8081
372	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:33:53.283+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	12	\N	http://127.0.0.1:8081
373	create	\N	2023-04-29 18:33:54.8+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	70	\N	http://10.143.20.7:3000
374	create	\N	2023-04-29 18:34:13.672+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	71	\N	http://10.143.20.7:3000
375	create	\N	2023-04-29 18:34:23.872+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	72	\N	http://10.143.20.7:3000
376	create	\N	2023-04-29 18:35:16.612+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	73	\N	http://10.143.20.7:3000
377	create	\N	2023-04-29 18:35:27.512+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	74	\N	http://10.143.20.7:3000
378	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:35:27.588+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	85	\N	http://127.0.0.1:8081
379	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:35:38.197+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	86	\N	http://127.0.0.1:8081
380	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:36:05.044+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	85	\N	http://127.0.0.1:8081
381	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:36:13.356+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	86	\N	http://127.0.0.1:8081
382	create	\N	2023-04-29 18:36:41.012+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	75	\N	http://10.143.20.7:3000
383	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:37:07.203+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	53	\N	http://10.143.20.7:8081
384	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:37:07.215+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	54	\N	http://10.143.20.7:8081
385	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:37:07.235+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	55	\N	http://10.143.20.7:8081
386	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:37:07.263+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	56	\N	http://10.143.20.7:8081
387	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:37:07.279+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	57	\N	http://10.143.20.7:8081
388	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:37:07.297+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	58	\N	http://10.143.20.7:8081
389	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:37:07.32+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	59	\N	http://10.143.20.7:8081
390	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:37:07.336+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	60	\N	http://10.143.20.7:8081
391	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:37:07.342+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	61	\N	http://10.143.20.7:8081
392	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:37:07.348+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	62	\N	http://10.143.20.7:8081
393	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:37:07.355+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	63	\N	http://10.143.20.7:8081
394	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:37:07.411+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	64	\N	http://10.143.20.7:8081
395	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:37:07.434+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	65	\N	http://10.143.20.7:8081
396	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:37:07.445+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	66	\N	http://10.143.20.7:8081
397	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:37:07.454+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	67	\N	http://10.143.20.7:8081
398	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:37:07.495+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	68	\N	http://10.143.20.7:8081
399	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:37:07.526+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	69	\N	http://10.143.20.7:8081
400	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:37:07.531+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	70	\N	http://10.143.20.7:8081
401	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:37:07.537+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	71	\N	http://10.143.20.7:8081
402	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:37:07.542+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	72	\N	http://10.143.20.7:8081
403	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:37:07.547+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	73	\N	http://10.143.20.7:8081
520	create	\N	2023-04-29 20:26:58.166+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	112	\N	http://localhost:3000
404	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:37:07.553+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	74	\N	http://10.143.20.7:8081
405	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:37:07.559+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	75	\N	http://10.143.20.7:8081
406	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:37:27.704+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	LandingPage	1	\N	http://127.0.0.1:8081
407	create	\N	2023-04-29 18:39:42.063+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	76	\N	http://10.143.20.7:3000
408	create	\N	2023-04-29 18:40:19.746+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	77	\N	http://10.143.20.7:3000
409	create	\N	2023-04-29 18:41:19.42+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	78	\N	http://10.143.20.7:3000
410	create	\N	2023-04-29 18:41:46.051+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	79	\N	http://10.143.20.7:3000
411	create	\N	2023-04-29 18:47:45.687+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	80	\N	http://10.143.20.7:3000
412	create	\N	2023-04-29 18:51:11.987+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	81	\N	http://10.143.20.7:3000
413	create	\N	2023-04-29 18:53:41.901+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	82	\N	http://10.143.20.7:3000
414	create	\N	2023-04-29 18:54:40.937+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	83	\N	http://10.143.20.7:3000
415	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:55:15.06+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_permissions	1	\N	http://127.0.0.1:8081
416	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:55:32.246+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	LandingPage	1	\N	http://127.0.0.1:8081
417	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:55:50.268+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	LandingPage	1	\N	http://127.0.0.1:8081
418	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:56:01.077+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	LandingPage	1	\N	http://127.0.0.1:8081
419	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:56:05.957+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	LandingPage	1	\N	http://127.0.0.1:8081
420	create	\N	2023-04-29 18:56:08.734+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	84	\N	http://10.143.20.7:3000
421	create	\N	2023-04-29 18:56:30.879+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	85	\N	http://10.143.20.7:3000
422	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:56:31.347+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	LandingPage	1	\N	http://127.0.0.1:8081
423	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:56:57.317+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	76	\N	http://10.143.20.7:8081
424	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:56:57.324+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	77	\N	http://10.143.20.7:8081
425	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:56:57.329+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	78	\N	http://10.143.20.7:8081
426	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:56:57.35+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	79	\N	http://10.143.20.7:8081
427	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:56:57.377+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	80	\N	http://10.143.20.7:8081
428	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:56:57.402+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	81	\N	http://10.143.20.7:8081
429	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:56:57.454+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	82	\N	http://10.143.20.7:8081
430	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:56:57.504+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	83	\N	http://10.143.20.7:8081
431	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:56:57.589+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	84	\N	http://10.143.20.7:8081
432	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:56:57.593+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	85	\N	http://10.143.20.7:8081
433	create	\N	2023-04-29 18:58:47.132+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	86	\N	http://localhost:3000
434	create	\N	2023-04-29 18:58:49.147+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	87	\N	http://localhost:3000
435	create	\N	2023-04-29 19:20:47.788+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	88	\N	http://10.143.20.7:3000
436	create	\N	2023-04-29 19:23:43.572+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	89	\N	http://10.143.20.7:3000
437	create	\N	2023-04-29 19:23:54.881+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	90	\N	http://10.143.20.7:3000
438	create	\N	2023-04-29 19:23:56.046+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	91	\N	http://10.143.20.7:3000
439	create	\N	2023-04-29 19:23:56.749+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	92	\N	http://10.143.20.7:3000
440	create	\N	2023-04-29 19:23:57.442+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	93	\N	http://10.143.20.7:3000
441	create	\N	2023-04-29 19:23:58.008+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	94	\N	http://10.143.20.7:3000
442	create	\N	2023-04-29 19:23:58.42+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	95	\N	http://10.143.20.7:3000
443	create	\N	2023-04-29 19:23:58.636+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	96	\N	http://10.143.20.7:3000
444	create	\N	2023-04-29 19:23:58.823+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	97	\N	http://10.143.20.7:3000
445	create	\N	2023-04-29 19:23:58.961+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	98	\N	http://10.143.20.7:3000
446	create	\N	2023-04-29 19:23:59.129+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	99	\N	http://10.143.20.7:3000
447	create	\N	2023-04-29 19:23:59.269+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	100	\N	http://10.143.20.7:3000
448	create	\N	2023-04-29 19:23:59.411+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	101	\N	http://10.143.20.7:3000
449	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 19:24:11.137+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	86	\N	http://10.143.20.7:8081
450	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 19:24:11.143+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	87	\N	http://10.143.20.7:8081
451	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 19:24:11.15+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	88	\N	http://10.143.20.7:8081
452	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 19:24:11.156+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	89	\N	http://10.143.20.7:8081
453	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 19:24:11.161+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	90	\N	http://10.143.20.7:8081
454	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 19:24:11.167+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	91	\N	http://10.143.20.7:8081
455	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 19:24:11.172+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	92	\N	http://10.143.20.7:8081
456	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 19:24:11.177+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	93	\N	http://10.143.20.7:8081
457	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 19:24:11.191+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	94	\N	http://10.143.20.7:8081
458	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 19:24:11.21+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	95	\N	http://10.143.20.7:8081
459	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 19:24:11.228+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	96	\N	http://10.143.20.7:8081
460	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 19:24:11.251+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	97	\N	http://10.143.20.7:8081
461	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 19:24:11.259+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	98	\N	http://10.143.20.7:8081
462	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 19:24:11.267+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	99	\N	http://10.143.20.7:8081
463	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 19:24:11.275+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	100	\N	http://10.143.20.7:8081
464	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 19:24:11.282+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	101	\N	http://10.143.20.7:8081
465	create	\N	2023-04-29 19:31:20.829+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	102	\N	http://10.143.20.7:3000
466	create	\N	2023-04-29 19:32:58.908+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	103	\N	http://10.143.20.7:3000
467	create	\N	2023-04-29 19:33:44.152+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	104	\N	http://10.143.20.7:3000
468	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 19:36:41.902+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	87	\N	http://127.0.0.1:8081
469	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 19:36:41.962+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	88	\N	http://127.0.0.1:8081
470	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 19:36:42.009+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	89	\N	http://127.0.0.1:8081
471	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 19:36:42.069+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_collections	hallitus_page	\N	http://127.0.0.1:8081
472	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 19:37:01.131+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	90	\N	http://127.0.0.1:8081
473	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 19:37:13.738+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	91	\N	http://127.0.0.1:8081
474	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 19:38:41.352+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	hallitus_page	1	\N	http://127.0.0.1:8081
475	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 19:40:46.696+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_permissions	15	\N	http://127.0.0.1:8081
476	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 19:40:52.051+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_permissions	15	\N	http://127.0.0.1:8081
477	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 20:01:19.863+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	92	\N	http://127.0.0.1:8081
478	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 20:01:19.943+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	93	\N	http://127.0.0.1:8081
479	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 20:01:19.983+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	94	\N	http://127.0.0.1:8081
480	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 20:01:20.029+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_collections	study_club	\N	http://127.0.0.1:8081
481	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 20:01:29.966+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	95	\N	http://127.0.0.1:8081
482	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 20:01:39.084+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	96	\N	http://127.0.0.1:8081
483	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 20:02:04.214+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	97	\N	http://127.0.0.1:8081
484	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 20:02:04.258+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	98	\N	http://127.0.0.1:8081
485	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 20:02:04.295+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	99	\N	http://127.0.0.1:8081
486	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 20:02:04.367+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_collections	for_new_student	\N	http://127.0.0.1:8081
487	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 20:02:19.305+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	100	\N	http://127.0.0.1:8081
488	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 20:02:29.801+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	101	\N	http://127.0.0.1:8081
489	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 20:07:38.198+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	study_club	1	\N	http://127.0.0.1:8081
490	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 20:08:45.801+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	study_club	1	\N	http://127.0.0.1:8081
491	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 20:09:06.362+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	for_new_student	1	\N	http://127.0.0.1:8081
492	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 20:09:12.577+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	for_new_student	1	\N	http://127.0.0.1:8081
493	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 20:09:26.914+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	study_club	1	\N	http://127.0.0.1:8081
494	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 20:10:58.139+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	study_club	1	\N	http://127.0.0.1:8081
495	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 20:11:41.757+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	102	\N	http://127.0.0.1:8081
496	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 20:11:41.814+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	103	\N	http://127.0.0.1:8081
497	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 20:11:41.886+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	104	\N	http://127.0.0.1:8081
498	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 20:11:41.949+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_collections	liity_serveriin	\N	http://127.0.0.1:8081
499	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 20:11:51.075+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	105	\N	http://127.0.0.1:8081
500	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 20:11:58.974+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	105	\N	http://127.0.0.1:8081
501	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 20:13:34.312+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	liity_serveriin	1	\N	http://127.0.0.1:8081
502	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 20:13:51.476+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	106	\N	http://127.0.0.1:8081
503	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 20:13:59.216+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	107	\N	http://127.0.0.1:8081
504	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 20:15:32.523+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	liity_serveriin	1	\N	http://127.0.0.1:8081
505	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 20:15:42.837+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_permissions	16	\N	http://127.0.0.1:8081
506	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 20:15:48.011+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_permissions	16	\N	http://127.0.0.1:8081
507	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 20:15:51.069+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_permissions	17	\N	http://127.0.0.1:8081
508	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 20:15:55.287+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_permissions	17	\N	http://127.0.0.1:8081
509	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 20:15:58.646+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_permissions	18	\N	http://127.0.0.1:8081
510	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 20:16:03.667+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_permissions	18	\N	http://127.0.0.1:8081
511	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 20:20:58.976+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_permissions	12	\N	http://127.0.0.1:8081
512	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 20:21:02.159+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_permissions	11	\N	http://127.0.0.1:8081
513	create	\N	2023-04-29 20:24:44.104+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	105	\N	http://localhost:3000
514	create	\N	2023-04-29 20:24:46.468+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	106	\N	http://localhost:3000
515	create	\N	2023-04-29 20:24:46.918+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	107	\N	http://localhost:3000
516	create	\N	2023-04-29 20:24:47.161+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	108	\N	http://localhost:3000
517	create	\N	2023-04-29 20:24:47.349+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	109	\N	http://localhost:3000
518	create	\N	2023-04-29 20:25:17.165+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	110	\N	http://localhost:3000
519	create	\N	2023-04-29 20:25:47.357+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	111	\N	http://localhost:3000
521	create	\N	2023-04-29 20:27:50.991+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	113	\N	http://localhost:3000
522	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 20:30:00.122+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	108	\N	http://127.0.0.1:8081
523	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 20:30:00.185+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	109	\N	http://127.0.0.1:8081
524	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 20:30:00.24+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	110	\N	http://127.0.0.1:8081
525	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 20:30:00.35+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_collections	gdpr	\N	http://127.0.0.1:8081
526	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 20:30:10.479+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	111	\N	http://127.0.0.1:8081
527	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 20:31:03.538+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	112	\N	http://127.0.0.1:8081
528	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 20:31:11.648+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	113	\N	http://127.0.0.1:8081
529	create	\N	2023-04-29 20:31:59.996+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	114	\N	http://localhost:3000
530	create	\N	2023-04-29 20:32:00.147+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	115	\N	http://localhost:3000
531	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 20:37:16.432+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	gdpr	1	\N	http://127.0.0.1:8081
532	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 20:37:43.389+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_permissions	19	\N	http://127.0.0.1:8081
533	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 20:37:47.716+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_permissions	19	\N	http://127.0.0.1:8081
534	login	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 09:14:20.661+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_users	0891a0cd-876b-4a0d-a22e-0cce30121382	\N	http://127.0.0.1:8081
535	create	\N	2023-05-02 09:36:20.611+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	116	\N	http://127.0.0.1:8080
536	create	\N	2023-05-02 09:39:09.827+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	117	\N	http://127.0.0.1:8080
537	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 09:40:36.123+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	hallitus_page	1	\N	http://127.0.0.1:8081
538	create	\N	2023-05-02 12:00:54.771+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	118	\N	http://localhost:3000
539	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 12:08:03.844+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	LandingPage	1	\N	http://127.0.0.1:8081
540	create	\N	2023-05-02 12:23:47.614+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	119	\N	http://localhost:3000
541	create	\N	2023-05-02 12:25:34.446+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	120	\N	http://localhost:3000
542	create	\N	2023-05-02 12:26:46.646+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	121	\N	http://localhost:3000
543	create	\N	2023-05-02 12:27:57.306+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	122	\N	http://localhost:3000
544	create	\N	2023-05-02 12:34:21.739+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	123	\N	http://localhost:3000
545	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 12:39:50.191+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	board_members	1	\N	http://127.0.0.1:8081
546	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 12:39:54.083+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	board_members	2	\N	http://127.0.0.1:8081
547	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 12:39:58.961+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	board_members	3	\N	http://127.0.0.1:8081
548	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 12:45:35.929+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	board_members	2	\N	http://127.0.0.1:8081
549	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 12:47:21.641+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	board_members	2	\N	http://127.0.0.1:8081
550	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 12:47:25.354+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	board_members	2	\N	http://127.0.0.1:8081
551	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 13:03:15.981+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	board_members	2	\N	http://127.0.0.1:8081
552	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 13:03:50.127+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	board_members	2	\N	http://127.0.0.1:8081
553	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 13:04:19.154+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	32	\N	http://127.0.0.1:8081
554	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 13:04:36.138+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	31	\N	http://127.0.0.1:8081
555	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 13:04:41.779+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	24	\N	http://127.0.0.1:8081
556	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 13:04:46.735+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	25	\N	http://127.0.0.1:8081
557	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 13:04:49.774+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	26	\N	http://127.0.0.1:8081
558	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 13:04:52.992+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	28	\N	http://127.0.0.1:8081
559	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 13:05:05.891+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	29	\N	http://127.0.0.1:8081
560	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 13:05:38.532+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	board_members	4	\N	http://127.0.0.1:8081
561	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 13:06:28.372+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	26	\N	http://127.0.0.1:8081
562	create	\N	2023-05-02 13:09:57.713+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	lomake_vastaukset	124	\N	http://localhost:3000
563	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 13:40:44.738+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	board_members	1	\N	http://127.0.0.1:8081
564	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 13:40:44.744+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	board_members	2	\N	http://127.0.0.1:8081
565	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 13:40:44.746+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	board_members	3	\N	http://127.0.0.1:8081
566	delete	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 13:40:44.749+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	board_members	4	\N	http://127.0.0.1:8081
567	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 13:41:59.252+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	114	\N	http://127.0.0.1:8081
568	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 13:42:20.726+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	115	\N	http://127.0.0.1:8081
569	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 13:42:45.597+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	116	\N	http://127.0.0.1:8081
570	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 13:43:33.348+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	117	\N	http://127.0.0.1:8081
571	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 13:44:00.367+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	118	\N	http://127.0.0.1:8081
572	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 13:44:11.347+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	119	\N	http://127.0.0.1:8081
573	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 13:44:31.049+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	118	\N	http://127.0.0.1:8081
574	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 13:45:19.349+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	board_members	5	\N	http://127.0.0.1:8081
575	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 13:45:48.367+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	board_members	6	\N	http://127.0.0.1:8081
576	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 13:45:54.988+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	board_members	6	\N	http://127.0.0.1:8081
577	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 13:46:28.936+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	board_members	7	\N	http://127.0.0.1:8081
578	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 13:51:04.713+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	for_new_student	1	\N	http://127.0.0.1:8081
579	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 13:52:09.117+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	for_new_student	1	\N	http://127.0.0.1:8081
580	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 13:52:43.567+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_collections	gdpr	\N	http://127.0.0.1:8081
581	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 13:52:58.5+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_collections	hallitus_page	\N	http://127.0.0.1:8081
582	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 13:53:06.158+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_collections	news	\N	http://127.0.0.1:8081
583	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 13:54:24.979+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_collections	partners	\N	http://127.0.0.1:8081
584	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 13:54:43.84+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_collections	social_medias	\N	http://127.0.0.1:8081
585	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 13:55:11.326+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_collections	lomake_vastaukset	\N	http://127.0.0.1:8081
586	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 13:55:29.798+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_collections	liity_serveriin	\N	http://127.0.0.1:8081
587	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 13:56:22.053+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_collections	turvallinen_tila	\N	http://127.0.0.1:8081
588	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 13:56:56.12+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_collections	LandingPage	\N	http://127.0.0.1:8081
589	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 13:57:04.676+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_collections	for_new_student	\N	http://127.0.0.1:8081
590	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 13:57:12.355+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_collections	serveri_rules	\N	http://127.0.0.1:8081
591	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 13:58:00.893+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_collections	social_medias	\N	http://127.0.0.1:8081
592	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 13:58:09.603+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_collections	study_club	\N	http://127.0.0.1:8081
593	update	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 13:59:18.995+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_collections	liity_serveriin	\N	http://127.0.0.1:8081
594	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 14:00:19.929+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	120	\N	http://127.0.0.1:8081
595	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 14:00:19.938+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	121	\N	http://127.0.0.1:8081
596	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 14:00:19.949+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	122	\N	http://127.0.0.1:8081
597	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 14:00:19.955+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	123	\N	http://127.0.0.1:8081
598	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 14:00:19.97+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	124	\N	http://127.0.0.1:8081
599	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 14:00:19.992+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	125	\N	http://127.0.0.1:8081
600	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 14:00:20+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_fields	126	\N	http://127.0.0.1:8081
601	create	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 14:00:20.012+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	directus_collections	events	\N	http://127.0.0.1:8081
\.


--
-- Data for Name: directus_collections; Type: TABLE DATA; Schema: public; Owner: serveri
--

COPY public.directus_collections (collection, icon, note, display_template, hidden, singleton, translations, archive_field, archive_app_filter, archive_value, unarchive_value, sort_field, accountability, color, item_duplication_fields, sort, "group", collapse) FROM stdin;
board_members	account_circle	Collection of board members.	\N	f	f	\N	status	t	archived	draft	\N	all	\N	\N	\N	\N	open
gdpr	policy	\N	\N	f	t	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open
hallitus_page	contact_page	\N	\N	f	t	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open
news	newspaper	\N	\N	f	f	\N	status	t	archived	draft	sort	all	\N	\N	\N	\N	open
partners	attach_money	\N	\N	f	f	\N	status	t	archived	draft	\N	all	\N	\N	\N	\N	open
lomake_vastaukset	drive_folder_upload	Sisältää kaikki verkkosivun lomakkeiden vastaukset.	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open
turvallinen_tila	balance	\N	\N	f	t	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open
LandingPage	web	\N	\N	f	t	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open
for_new_student	fiber_new	\N	\N	f	t	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open
serveri_rules	balance	\N	\N	f	t	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open
social_medias	auto_awesome_mosaic	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open
study_club	menu_book	\N	\N	f	t	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open
liity_serveriin	subdirectory_arrow_right	\N	\N	f	t	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open
events	\N	\N	\N	f	f	\N	status	t	archived	draft	sort	all	\N	\N	\N	\N	open
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
13	LandingPage	en_description	\N	input-multiline	\N	\N	\N	f	f	7	full	\N	\N	\N	f	\N	\N	\N
18	board_members	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
19	board_members	status	\N	select-dropdown	{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]}	labels	{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]}	f	f	2	full	\N	\N	\N	f	\N	\N	\N
20	board_members	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	3	half	\N	\N	\N	f	\N	\N	\N
21	board_members	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	4	half	\N	\N	\N	f	\N	\N	\N
22	board_members	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	5	half	\N	\N	\N	f	\N	\N	\N
23	board_members	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	6	half	\N	\N	\N	f	\N	\N	\N
33	social_medias	id	\N	input	\N	\N	\N	t	t	\N	full	\N	\N	\N	f	\N	\N	\N
34	social_medias	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	\N	half	\N	\N	\N	f	\N	\N	\N
35	social_medias	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	\N	half	\N	\N	\N	f	\N	\N	\N
36	social_medias	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	\N	half	\N	\N	\N	f	\N	\N	\N
37	social_medias	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	\N	half	\N	\N	\N	f	\N	\N	\N
38	social_medias	name	\N	input	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
39	social_medias	url	\N	input	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
40	social_medias	icon	\N	input	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
41	news	id	\N	input	\N	\N	\N	t	t	\N	full	\N	\N	\N	f	\N	\N	\N
42	news	status	\N	select-dropdown	{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]}	labels	{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]}	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
43	news	sort	\N	input	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
44	news	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	\N	half	\N	\N	\N	f	\N	\N	\N
45	news	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	\N	half	\N	\N	\N	f	\N	\N	\N
46	news	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	\N	half	\N	\N	\N	f	\N	\N	\N
47	news	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	\N	half	\N	\N	\N	f	\N	\N	\N
48	news	fi_title	\N	input	{"placeholder":"Uutisen otsikko"}	\N	\N	f	f	\N	full	\N	\N	\N	t	\N	\N	\N
49	news	en_title	\N	input	{"placeholder":"News title"}	\N	\N	f	f	\N	full	\N	\N	\N	t	\N	\N	\N
50	news	image	\N	input	{"placeholder":"link to the cover image"}	\N	\N	f	f	\N	full	\N	\N	\N	t	\N	\N	\N
62	turvallinen_tila	turvalinen_tila_en	\N	input-rich-text-md	{"placeholder":"safer space is ..."}	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
51	news	fi_text	\N	input-rich-text-md	{"placeholder":"Uutisen tekstisisältö","softLength":1000}	\N	\N	f	f	\N	full	\N	\N	\N	t	\N	\N	\N
52	news	en_text	\N	input-rich-text-md	{"placeholder":"The text content of the news","softLength":1000}	\N	\N	f	f	\N	full	\N	\N	\N	t	\N	\N	\N
53	serveri_rules	id	\N	input	\N	\N	\N	t	t	\N	full	\N	\N	\N	f	\N	\N	\N
54	serveri_rules	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	\N	half	\N	\N	\N	f	\N	\N	\N
55	serveri_rules	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	\N	half	\N	\N	\N	f	\N	\N	\N
56	serveri_rules	rules_fi	\N	input-rich-text-md	\N	\N	\N	f	f	\N	full	\N	\N	\N	t	\N	\N	\N
57	serveri_rules	rules_en	\N	input-rich-text-md	{"placeholder":"Write rules of serveri ry"}	\N	\N	f	f	\N	full	\N	\N	\N	t	\N	\N	\N
58	turvallinen_tila	id	\N	input	\N	\N	\N	t	t	\N	full	\N	\N	\N	f	\N	\N	\N
59	turvallinen_tila	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	\N	half	\N	\N	\N	f	\N	\N	\N
60	turvallinen_tila	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	\N	half	\N	\N	\N	f	\N	\N	\N
61	turvallinen_tila	turvallinen_tila_fi	\N	input-rich-text-md	{"placeholder":"Turvallisen tilan periaatteet"}	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
10	LandingPage	fi_title	\N	input	\N	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N
11	LandingPage	en_title	\N	input	\N	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N
14	LandingPage	fi_button_text	\N	input	\N	\N	\N	f	f	8	full	\N	\N	\N	f	\N	\N	\N
15	LandingPage	en_button_text	\N	input	\N	\N	\N	f	f	9	full	\N	\N	\N	f	\N	\N	\N
17	LandingPage	fi_button_url	\N	input	\N	\N	\N	f	f	10	full	\N	\N	\N	f	\N	\N	\N
16	LandingPage	en_button_url	\N	input	\N	\N	\N	f	f	11	full	\N	\N	\N	f	\N	\N	\N
12	LandingPage	fi_description	\N	input-multiline	{"softLength":null}	\N	\N	f	f	6	full	\N	\N	\N	f	\N	\N	\N
70	lomake_vastaukset	id	\N	input	\N	\N	\N	t	t	\N	full	\N	\N	\N	f	\N	\N	\N
73	lomake_vastaukset	firm_name	\N	input	\N	\N	\N	f	f	\N	full	\N	\N	\N	t	\N	\N	\N
74	lomake_vastaukset	firm_contact	\N	input	\N	\N	\N	f	f	\N	full	\N	\N	\N	t	\N	\N	\N
75	lomake_vastaukset	firm_message	\N	input-multiline	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
76	partners	id	\N	input	\N	\N	\N	t	t	\N	full	\N	\N	\N	f	\N	\N	\N
77	partners	status	\N	select-dropdown	{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]}	labels	{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]}	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
32	board_members	img	\N	input	\N	\N	\N	f	f	7	full	\N	\N	\N	t	\N	\N	\N
31	board_members	hover_img	\N	input	\N	\N	\N	f	f	8	full	\N	\N	\N	t	\N	\N	\N
28	board_members	telegram	\N	input	\N	\N	\N	f	f	12	full	\N	\N	\N	t	\N	\N	\N
26	board_members	email	\N	input	\N	\N	\N	f	f	11	full	\N	etunimi.sukunimi tai rooli, ei päätettä serveriry.fi	\N	t	\N	\N	\N
78	partners	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	\N	half	\N	\N	\N	f	\N	\N	\N
79	partners	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	\N	half	\N	\N	\N	f	\N	\N	\N
80	partners	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	\N	half	\N	\N	\N	f	\N	\N	\N
81	partners	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	\N	half	\N	\N	\N	f	\N	\N	\N
82	partners	name	\N	input	{"placeholder":"Yrityksen nimi"}	\N	\N	f	f	\N	full	\N	\N	\N	t	\N	\N	\N
83	partners	url	\N	input	{"placeholder":"Yrityksen verkkosivujen url osoite"}	\N	\N	f	f	\N	full	\N	\N	\N	t	\N	\N	\N
84	partners	img	\N	input	{"placeholder":"linkki yrityksen logo kuvaan"}	\N	\N	f	f	\N	full	\N	\N	\N	t	\N	\N	\N
85	LandingPage	fi_long_desc	\N	input-rich-text-md	{"placeholder":null}	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
86	LandingPage	en_long_desc	\N	input-rich-text-md	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
87	hallitus_page	id	\N	input	\N	\N	\N	t	t	\N	full	\N	\N	\N	f	\N	\N	\N
88	hallitus_page	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	\N	half	\N	\N	\N	f	\N	\N	\N
89	hallitus_page	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	\N	half	\N	\N	\N	f	\N	\N	\N
90	hallitus_page	fi_text	\N	input-rich-text-md	\N	\N	\N	f	f	\N	full	\N	\N	\N	t	\N	\N	\N
91	hallitus_page	en_text	\N	input-rich-text-md	\N	\N	\N	f	f	\N	full	\N	\N	\N	t	\N	\N	\N
92	study_club	id	\N	input	\N	\N	\N	t	t	\N	full	\N	\N	\N	f	\N	\N	\N
93	study_club	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	\N	half	\N	\N	\N	f	\N	\N	\N
94	study_club	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	\N	half	\N	\N	\N	f	\N	\N	\N
95	study_club	fi_text	\N	input-rich-text-md	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
96	study_club	en_text	\N	input-rich-text-md	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
97	for_new_student	id	\N	input	\N	\N	\N	t	t	\N	full	\N	\N	\N	f	\N	\N	\N
98	for_new_student	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	\N	half	\N	\N	\N	f	\N	\N	\N
99	for_new_student	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	\N	half	\N	\N	\N	f	\N	\N	\N
100	for_new_student	fi_text	\N	input-rich-text-md	\N	\N	\N	f	f	\N	full	\N	\N	\N	t	\N	\N	\N
101	for_new_student	en_text	\N	input-rich-text-md	\N	\N	\N	f	f	\N	full	\N	\N	\N	t	\N	\N	\N
102	liity_serveriin	id	\N	input	\N	\N	\N	t	t	\N	full	\N	\N	\N	f	\N	\N	\N
103	liity_serveriin	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	\N	half	\N	\N	\N	f	\N	\N	\N
104	liity_serveriin	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	\N	half	\N	\N	\N	f	\N	\N	\N
106	liity_serveriin	fi_text	\N	input-rich-text-md	\N	\N	\N	f	f	\N	full	\N	\N	\N	t	\N	\N	\N
107	liity_serveriin	en_text	\N	input-rich-text-md	\N	\N	\N	f	f	\N	full	\N	\N	\N	t	\N	\N	\N
108	gdpr	id	\N	input	\N	\N	\N	t	t	\N	full	\N	\N	\N	f	\N	\N	\N
109	gdpr	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	\N	half	\N	\N	\N	f	\N	\N	\N
110	gdpr	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	\N	half	\N	\N	\N	f	\N	\N	\N
112	gdpr	fi_text	\N	input-rich-text-md	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
113	gdpr	en_text	\N	input-rich-text-md	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
24	board_members	name	\N	input	{"url":null}	\N	\N	f	f	9	full	\N	\N	\N	t	\N	\N	\N
114	board_members	fi_role	\N	input	{"placeholder":null}	\N	\N	f	f	\N	full	\N	\N	\N	t	\N	\N	\N
115	board_members	en_role	\N	input	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
119	board_members	en_desc	\N	input-multiline	\N	\N	\N	f	f	\N	full	\N	\N	\N	t	\N	\N	\N
118	board_members	fi_desc	\N	input-multiline	\N	\N	\N	f	f	\N	full	\N	\N	\N	t	\N	\N	\N
120	events	id	\N	input	\N	\N	\N	t	t	\N	full	\N	\N	\N	f	\N	\N	\N
121	events	status	\N	select-dropdown	{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]}	labels	{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]}	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
122	events	sort	\N	input	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N	\N	\N
123	events	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	\N	half	\N	\N	\N	f	\N	\N	\N
124	events	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	\N	half	\N	\N	\N	f	\N	\N	\N
125	events	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	\N	half	\N	\N	\N	f	\N	\N	\N
126	events	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	\N	half	\N	\N	\N	f	\N	\N	\N
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
5	\N	board_members	read	\N	\N	\N	img,hover_img,role,email,telegram,name,description
6	\N	social_medias	read	\N	\N	\N	url,icon,name
7	\N	news	read	{}	{}	\N	fi_title,en_title,image,fi_text,en_text,id,sort,status,date_created
8	\N	serveri_rules	read	{}	{}	\N	date_updated,rules_fi,rules_en
9	\N	turvallinen_tila	read	{}	{}	\N	date_updated,turvallinen_tila_fi,turvalinen_tila_en
13	\N	lomake_vastaukset	create	{}	{}	\N	*
14	\N	partners	read	{}	{}	\N	name,url,img
1	\N	LandingPage	read	\N	{}	\N	fi_title,en_title,fi_description,en_description,fi_button_text,en_button_text,fi_button_url,en_button_url,en_long_desc,fi_long_desc
15	\N	hallitus_page	read	\N	\N	\N	fi_text,en_text,date_updated
16	\N	liity_serveriin	read	\N	\N	\N	fi_text,en_text,date_updated
17	\N	study_club	read	\N	\N	\N	fi_text,en_text,date_updated
18	\N	for_new_student	read	\N	\N	\N	fi_text,en_text,date_updated
19	\N	gdpr	read	\N	\N	\N	fi_text,en_text,date_updated
\.


--
-- Data for Name: directus_presets; Type: TABLE DATA; Schema: public; Owner: serveri
--

COPY public.directus_presets (id, bookmark, "user", role, collection, search, layout, layout_query, layout_options, refresh_interval, filter, icon, color) FROM stdin;
2	\N	0891a0cd-876b-4a0d-a22e-0cce30121382	\N	social_medias	\N	\N	{"tabular":{"page":1}}	\N	\N	\N	bookmark	\N
1	\N	0891a0cd-876b-4a0d-a22e-0cce30121382	\N	directus_users	\N	cards	{"cards":{"sort":["email"],"page":1}}	{"cards":{"icon":"account_circle","title":"{{ first_name }} {{ last_name }}","subtitle":"{{ email }}","size":4}}	\N	\N	bookmark	\N
4	\N	0891a0cd-876b-4a0d-a22e-0cce30121382	\N	lomake_vastaukset	\N	\N	{"tabular":{"page":1,"fields":["firm_contact","firm_message","firm_name"]}}	{"tabular":{"widths":{"firm_message":284}}}	\N	\N	bookmark	\N
3	\N	0891a0cd-876b-4a0d-a22e-0cce30121382	\N	board_members	\N	\N	{"tabular":{"page":1}}	\N	\N	\N	bookmark	\N
\.


--
-- Data for Name: directus_relations; Type: TABLE DATA; Schema: public; Owner: serveri
--

COPY public.directus_relations (id, many_collection, many_field, one_collection, one_field, one_collection_field, one_allowed_collections, junction_field, sort_field, one_deselect_action) FROM stdin;
1	LandingPage	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
2	board_members	user_created	directus_users	\N	\N	\N	\N	\N	nullify
3	board_members	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
4	social_medias	user_created	directus_users	\N	\N	\N	\N	\N	nullify
5	social_medias	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
6	news	user_created	directus_users	\N	\N	\N	\N	\N	nullify
7	news	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
8	serveri_rules	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
9	turvallinen_tila	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
12	partners	user_created	directus_users	\N	\N	\N	\N	\N	nullify
13	partners	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
14	hallitus_page	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
15	study_club	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
16	for_new_student	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
17	liity_serveriin	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
18	gdpr	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
19	events	user_created	directus_users	\N	\N	\N	\N	\N	nullify
20	events	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
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
163	171	directus_collections	serveri_rules	{"singleton":true,"collection":"serveri_rules"}	{"singleton":true,"collection":"serveri_rules"}	\N
171	179	serveri_rules	1	{"id":1,"user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-29T12:05:34.771Z","rules_fi":"# Serveri ry:n järjestyssäännöt\\n\\n## 1. NIMI JA KOTIPAIKKA\\n\\nYhdistyksen nimi on Itä-Suomen yliopiston tietojenkäsittelytieteen opiskelijat - Serveri ry. Yhdistyksen kotipaikka on\\nKuopio.\\n\\n## 2. TARKOITUS JA TOIMINTA\\n\\nYhdistyksen tarkoituksena on yhdistää Itä-Suomen yliopiston tietojenkäsittelytieteen opiskelijoita ja tukea heidän\\nhenkisiä sekä aineellisia pyrkimyksiään, niin ammattiin liittyvissä kuin vapaa-ajan kysymyksissä. Tarkoituksensa\\ntoteuttamiseksi yhdistys valvoo jäsentensä etuja pitämällä yhteyksiä muihin yhdistyksiin, yrityksiin ja yliopiston\\nhallintoelimiin. Yhdistys järjestää erilaisia informaatio-, esitelmä-, luento-, ja keskustelutilaisuuksia sekä\\nillanviettoja. Yhdistys pyrkii tukemaan jäsentensä alaan liittyviä opintoja ja opintomatkoja. Toimintansa tukemiseksi\\nyhdistys voi myös vastaanottaa avustuksia, lahjoituksia ja testamentteja, panna toimeen asianomaisella luvalla\\nrahankeräyksiä ja arpajaisia, hankkia, myydä ja omistaa toimintaansa varten tarpeellista irtainta että kiinteätä\\nomaisuutta tai harjoittaa välittömästi yhdistyksen tarkoituksen toteuttamiseen liittyvää tai taloudellisesti\\nvähäarvoisena pidettävää ansiotoimintaa.\\n\\n\\n## 3 KIELI\\n\\nYhdistyksen kielenä on suomi. Pöytäkirjat laaditaan suomen kielellä.\\n\\n## 4 PUOLUEETTOMUUS\\n\\nYhdistys on puoluepoliittisesti sitoutumaton.\\n\\n## 5 JÄSENET\\n\\nJäseniä voivat olla:\\n\\n1. Varsinaiset jäsenet: Itä-Suomen yliopistossa kirjoilla olevat (läsnä- tai poissaolevana) tietojenkäsittelytiedettä\\n   opiskelevat henkilöt.\\n2. Kannatusjäsenet: Kannatusjäseniä voivat olla henkilöt tai oikeuskelpoiset yhteisöt, jotka ovat kiinnostuneita\\n   yhdistyksen toiminnasta ja haluavat tukea sitä.\\n3. Kunniajäsenet: Kunniajäseneksi voidaan kutsua henkilö, joka on erikoisesti tukenut yhdistyksen toimintaa. Ehdotuksen\\n   kunniajäseneksi kutsumisesta voi tehdä kuka tahansa jäsenistä suullisesti tai kirjallisesti hallitukselle, joka\\n   esittää ehdotuksen yhdistyksen kokoukselle tai suoraan yhdistyksen kokoukselle, jossa riittää yksinkertainen\\n   enemmistö mahdollisessa äänestyksessä esityksen hyväksymiseksi. Kaikki valmistuneet jäsenet voidaan hallituksen\\n   päätöksellä valita kunniajäseneksi.\\n4. Yhteisöjäsenet: Yhteisöjäsen voi olla oikeuskelpoinen yhteisö, joka on kiinnostunut yhdistyksen toiminnasta ja haluaa\\n   tukea sitä.\\n\\nVarsinaiset jäsenet, kannatusjäsenet ja yhteisöjäsenet hyväksyy hakemuksesta yhdistyksen hallitus. Jäsenyys astuu\\nvoimaan hallituksen päätöksen jälkeen. Jäsenyydestä eroaminen tapahtuu ilmoittamalla siitä kirjallisesti hallitukselle\\ntai sen puheenjohtajalle tai ilmoittamalla erosta yhdistyksen kokouksessa pöytäkirjaan merkittäväksi. Erottamisesta\\njäsenmaksun maksamatta jättämisen vuoksi päättää hallitus.\\n\\n## 6 JÄSENEN VELVOLLISUUDET\\n\\nJäsenellä on velvollisuus ilmoittaa yhdistyslain määräämät tiedot yhdistyksen hallitukselle aina muutosten yhteydessä,\\nkuitenkin vähintään viiden (5) vuoden välein.\\n\\n## 7 JÄSENMAKSUT\\n\\nVarsinaisten jäsenten ja kannatusjäsenten liittymismaksun ja vuotuisen jäsenmaksun suuruudesta erikseen kullekin\\njäsenryhmälle päättää syyskokous. Yhteisöjäsenten jäsenmaksuista päättää yhdistyksen hallitus. Kunniapuheenjohtajat ja\\nkunniajäsenet eivät suorita jäsenmaksuja.\\n\\n## 8 HALLITUS\\n\\nHallituksen muodostavat syyskokouksessa valitut puheenjohtaja ja vähintään seitsemän (7), enintään viisitoista (15)\\nmuuta varsinaista jäsentä sekä vähintään nolla (0) ja enintään viisi (5) varajäsentä. Varsinaisten ja varajäsenten\\nlukumäärä päätetään syyskokouksessa. Hallituksen toimikausi on kalenterivuosi. Hallitus valitsee keskuudestaan\\nvarapuheenjohtajan ja sihteerin, lisäksi hallitus nimittää rahastonhoitajan sekä muut tarvittavat toimihenkilöt.\\n\\n## 9 HALLITUKSEN TEHTÄVÄT\\n\\nHallituksen tehtävänä on:\\n\\n1. Pitää yllä jäsenluetteloa\\n2. Kutsua yhdistyksen kokous tarvittaessa koolle\\n3. Hoitaa yhdistyksen asioita sekä taloutta sääntöjen ja toimintasuunnitelman mukaan.\\n\\n## 10 YHDISTYKSEN NIMEN KIRJOITTAMINEN\\n\\nYhdistyksen nimen kirjoittaa hallituksen puheenjohtaja, sihteeri tai muu hallituksen jäsen jonka hallitus on\\nnimenkirjoittajaksi määrännyt, kukin erikseen.\\n\\n## 11 HALLITUKSEN KOOLLE KUTSUMINEN\\n\\nHallitus kokoontuu puheenjohtajan tai hänen estyneenä ollessaan varapuheenjohtajan kutsusta, kun he katsovat siihen\\nolevan aihetta tai jonkun hallituksen jäsenen niin halutessa. Hallitus on päätösvaltainen, mikäli puolet hallituksen\\njäsenistä puheenjohtaja tai varapuheenjohtaja mukaan lukien on paikalla ja kokouksesta on tiedotettu hallituksen\\njäsenille vähintään kolme vuorokautta ennen kokousta tai mikäli neljä viidesosaa (4/5) hallituksen varsinaisista\\njäsenistä on ilmaissut suostumuksensa kokouksen järjestämiseen aikaisemmin. Hallitus päättää kokousten\\nkoollekutsumistavasta järjestäytymiskokouksessaan. Päätökset tehdään hallituksessa yksinkertaisella enemmistöllä\\navoimella äänestyksellä, ellei joku halua suljettua lippuäänestystä. Äänten mennessä tasan kokouksen puheenjohtajan ääni\\nratkaisee, paitsi vaaleissa arpa.\\n\\n## 12 TILIT\\n\\nYhdistyksen tilikausi on kalenterivuosi. Rahastonhoitaja esittää tilit, kirjallisen selonteon varojen käytöstä ja\\ntaloudellisesta asemasta hallitukselle tilikautta seuraavan tammikuun 15. päivään mennessä. Hallitus laatii\\npuheenjohtajan ja sihteerin johdolla toimintakertomuksen. Tilinpäätös tarvittavine asiakirjoineen ja hallituksen\\nvuosikertomus on annettava toiminnantarkastajille viimeistään kolme viikkoa ennen kevätkokousta. Toiminnantarkastajien\\ntulee antaa kirjallinen lausuntonsa viimeistään kaksi viikkoa ennen kevätkokousta hallitukselle. Hallitus esittää\\ntilinpäätöksen ja toiminnantarkastajien lausunnon sekä toimintakertomuksen yhdistyksen kevätkokoukselle.\\n\\n## 13 YHDISTYKSEN KOKOUKSEN KOOLLE KUTSUMINEN\\n\\nYhdistyksen kevät- ja syyskokouksen ja ylimääräisen kokouksen koolle kutsuminen tapahtuu ilmoituksella viimeistään\\nviikkoa ennen kokousta yhdistyksen ilmoitustaululla. Ylimääräinen kokous pidetään, jos hallitus katsoo siihen olevan\\naihetta tai jos vähintään yksi kahdeskymmenesosa (1/20) tai 30 yhdistyksen äänioikeutetuista jäsenistä sitä\\nhallitukselta erityisesti ilmoitettua asiaa varten kirjallisesti vaatii.\\n\\n## 14 VUOSIKOKOUKSET\\n\\nYhdistyksen kevätkokous pidetään helmikuussa. Kokouksessa käsitellään vähintään seuraavat asiat:\\n\\n1. Todetaan kokouksen laillisuus ja päätösvaltaisuus.\\n2. Valitaan kokoukselle puheenjohtaja, sihteeri ja kaksi pöytäkirjantarkastajaa sekä ääntenlaskijaa.\\n3. Vahvistetaan kokouksen esityslista.\\n4. Esitetään edellisen vuoden toimintakertomus.\\n5. Esitetään toiminnantarkastajien lausunto. Vahvistetaan tilinpäätös ja päätetään vastuuvapauden myöntämisestä tilivelvollisille.\\n6. Käsitellään muut kokouksessa mahdolliset esille tulevat asiat.\\n\\nYhdistyksen syyskokous pidetään marraskuussa, kokouksessa käsitellään vähintään seuraavat asiat:\\n\\n1. Todetaan kokouksen laillisuus ja päätösvaltaisuus.\\n2. Valitaan kokoukselle puheenjohtaja, sihteeri ja kaksi pöytäkirjantarkastajaa sekä ääntenlaskijaa.\\n3. Vahvistetaan kokouksen esityslista.\\n4. Päätetään yhdistyksen mahdollisten toimihenkilöiden palkkioista ja korvauksista.\\n5. Esitetään toimintasuunnitelma tulevalle vuodelle.\\n6. Käsitellään ja vahvistetaan hallituksen laatima tulo- ja menoarvioehdotus sekä jäsenmaksujen suuruus.\\n7. Valitaan kaksi toiminnantarkastajaa ja kaksi varatoiminnantarkastajaa.\\n8. Valitaan yhdistyksen hallitukselle puheenjohtaja.\\n9. Päätetään hallituksen jäsenten määrä.\\n10. Valitaan muut hallituksen jäsenet.\\n11. Käsitellään muut kokouksessa esille tulevat asiat\\n\\nMikäli yhdistyksen jäsen haluaa saada jonkin asian yhdistyksen kevät- tai syyskokouksen käsiteltäväksi, on hänen\\nilmoitettava siitä kirjallisesti hallitukselle viimeistään kaksi viikkoa ennen kokousta, että asia voidaan sisällyttää\\nkokouskutsuun.\\n\\n## 15 ÄÄNIOIKEUS\\n\\nYhdistyksen kokouksissa on jokaisella varsinaisella jäsenellä yksi ääni. Kunnia-, kannatus- ja yhteisöjäsenellä on\\nläsnäolo- ja puheoikeus, mutta ei äänioikeutta yhdistyksen kokouksessa. Äänten mennessä tasan puheenjohtajan ääni\\nratkaisee, vaaleissa kuitenkin arpa. Äänestys tulee suorittaa suljettuna lippuäänestyksenä, mikäli joku jäsenistä niin\\nhaluaa.\\n\\n## 16 VUOSIPÄIVÄ\\n\\nYhdistys viettää vuosipäiväänsä lokakuun 21. päivänä. Yhdistys on perustettu vuonna 1987.\\n\\n## 17 HARRASTUSTOIMINTA\\n\\nYhdistyksen tarkoitusperien kanssa sopusoinnussa olevien harrastusten tukemiseksi ja kehittämiseksi voivat jäsenet\\nperustaa rekisteröimättömän kerhon tai harrastuspiirin, joiden toimintaa yhdistys pyrkii tukemaan mahdollisuuksiensa\\nmukaan.\\n\\n## 18 SÄÄNTÖJEN MUUTTAMINEN JA YHDISTYKSEN PURKAMINEN\\n\\nPäätös sääntöjen muuttamisesta ja yhdistyksen purkamisesta on tehtävä yhdistyksen kokouksessa vähintään kolmen\\nneljäsosan (3/4) enemmistöllä annetuista äänistä. Kokouskutsussa on mainittava sääntöjen muuttamisesta tai yhdistyksen\\npurkamisesta. Yhdistyksen purkautuessa käytetään yhdistyksen varat yhdistyksen tarkoituksen edistämiseen purkamisesta\\npäättävän kokouksen määräämällä tavalla. Yhdistyksen tullessa lakkautetuksi käytetään sen varat samaan tarkoitukseen.\\n\\n## 19 JÄSENOIKEUDET\\n\\nSaavutetut jäsenoikeudet säilyvät.\\n\\n## 20 YHDISTYKSEN TUNNUKSET\\n\\nYhdistyksen tunnuksen sekä arvo- ja kunniamerkkien muodosta päättää yleiskokous. Merkkien jakamisesta päättää hallitus.","rules_en":"# Serveri ry's rules of order\\n\\n## 1. NAME AND SEAT\\n\\nThe name of the association is Students of Computer Science at the University of Eastern Finland - Serveri ry. The registered office of the association is\\nKuopio.\\n\\n## 2. PURPOSE AND ACTIVITIES\\n\\nThe purpose of the association is to unite students of Computer Science at the University of Eastern Finland and to support their work in the field of computer science.\\nintellectual and material aspirations, both in professional and recreational matters. Its purpose\\ninterests of its members by maintaining contacts with other associations, companies and the university.\\nadministrative bodies. The association organises various information, presentation, lecture and discussion events, and\\nevening events. The association aims to support the studies and study trips of its members. To support its activities\\nthe Association may also receive grants, donations and bequests, and may, with the permission of the person concerned, carry out\\nfund-raising and raffles, acquire, sell and own movable and immovable property necessary for its activities.\\nproperty, or to engage in any activity directly related to the realisation of the objects of the association or economically related to the realisation of the objects of the association\\nconsidered to be of negligible economic value.\\n\\n## 3 LANGUAGE\\n\\nThe language of the Association is Finnish. Minutes shall be drawn up in Finnish.\\n\\n## 4 IMPARTIALITY\\n\\nThe Association is politically neutral.\\n\\n## 5 MEMBERS\\n\\nMembers can be:\\n\\n1. Full members: persons enrolled at the University of Eastern Finland (present or absent) in the field of computer science.\\n   Students of Computer Science (current or present).\\n2. Sustaining members: Sustaining members may be individuals or legal entities with an interest in the field of computer science.\\n   and wish to support the activities of the association.\\n3. Honorary members: A person who has made a special contribution to the activities of the Association may be invited to become an honorary member. The proposal is submitted to\\n   any member may make a proposal for honorary membership, orally or in writing, to the Board of Directors, which shall invite the member to become an honorary member.\\n   The proposal may be submitted to the Association's General Assembly or directly to the Association's General Assembly, where a simple majority is sufficient.\\n   majority of the votes cast, if any, to approve the proposal. Any graduate member may be elected by the Board of\\n   by decision of the Board.\\n4. Community members: Community members may be any legal entity interested in the activities of the Association and wishing to\\n   The association may be supported by a legal entity who is interested in the association and who wishes to support it.\\n\\nFull members, sustaining members and community members shall be approved by the Board of Directors of the Association upon application. Membership takes effect from the date of application.\\nThe membership of a member, in addition to the members, shall take effect after the decision of the Board of Directors. Withdrawal from membership shall be effected by written notification to the Board of Directors.\\nor its President or by announcing the resignation at a meeting of the Association to be recorded in the minutes. For resignation\\nfor non-payment of the membership fee shall be decided by the Board of Directors.\\n\\n## 6 OBLIGATIONS OF THE MEMBER\\n\\nMembers are obliged to inform the Board of Directors of the Association of the information required by the Association Act whenever changes occur,\\nat least every five (5) years.\\n\\n## 7 MEMBERSHIP FEES\\n\\nThe amount of the joining fee and the annual membership fee for full members and sustaining members shall be set separately for each of the following.\\nfor each category of member shall be decided by the Autumn Meeting. The membership fees for Community members are decided by the Board of Directors of the Association. Honorary Presidents and\\nhonorary members do not pay membership fees.\\n\\n## 8 BOARD OF DIRECTORS\\n\\nThe Board of Directors shall consist of a President elected at the Autumn Meeting and a minimum of seven (7) and a maximum of fifteen (15) members.\\nother full members and at least zero (0) and no more than five (5) alternate members. The number of full and alternate members shall be\\nshall be decided at the Autumn Meeting. The term of office of the Board of Directors shall be one calendar year. The Board shall elect from among its members\\nThe Board of Directors shall appoint from among its members a Vice-Chairman and a Secretary, and shall appoint a Treasurer and other necessary officers.\\n\\n## 9 FUNCTIONS OF THE BOARD\\n\\nThe tasks of the Board of Directors are:\\n\\n1. Maintain the list of members\\n2. to convene meetings of the Association when necessary\\n3. Call the meeting of the General Assembly at 3.00 a.m. Call the General Assembly at 3.00 a.m. Call the meeting at 3.00 a.m.\\n\\n## 10 WRITING THE NAME OF THE ASSOCIATION\\n\\nThe name of the Association shall be written by the Chairman of the Board, the Secretary or any other member of the Board whose name is\\nThe secretary, the secretary or the board of directors, as designated by the board of directors, shall sign the name of the association, each individually.\\n\\n## 11 CONVENING OF MEETINGS OF THE BOARD OF DIRECTORS\\n\\nThe Board of Directors shall meet at the call of the Chairman or, in his absence, the Vice-Chairman, whenever they deem it necessary.\\nwhen they deem it necessary or at the request of a member of the Board of Directors. A quorum shall exist if half of the members of the Board of Directors\\nmembers, including the Chairman or Vice-Chairman, are present and notice of the meeting has been given to the Board of Directors.\\nmembers at least three days before the meeting, or if four fifths (4/5) of the members of the Board of Directors are present at the meeting.\\nof the members of the Board have given their prior consent to the holding of the meeting. The Board of Directors shall decide on the meetings\\nat its organizational meeting. Decisions are taken by a simple majority of the Board.\\nby open ballot, unless a person wishes to have a closed ballot. In the event of a tie, the chairman of the meeting shall have the casting vote.\\nshall have the casting vote, except in the case of elections by lot.\\n\\n## 12 ACCOUNTS\\n\\nThe financial year of the Association shall be the calendar year. The treasurer shall present the accounts, a written statement of the use of the funds and a\\nfinancial position to the Board of Directors by 15 January following the end of the financial year. The Board shall draw up\\nunder the direction of the President and the Secretary, a report on its activities. The financial statements, together with the necessary documents and the\\nthe annual report of the Board of Directors and the annual report of the Board of Directors shall be submitted to the auditors at least three weeks before the spring meeting. For the auditors\\nshall submit their written opinion to the Governing Board no later than two weeks before the spring meeting. The Board of Directors shall propose\\nthe financial statements and the opinion of the auditors, together with the report of the auditors, to the Spring Assembly of the Association.\\n\\n## 13 CONVENING A MEETING OF THE ASSOCIATION\\n\\nThe convening of the spring and autumn meetings and extraordinary meetings of the Association shall be convened by notice given no later than.\\none week before the meeting on the notice board of the Association. An extraordinary meeting shall be held if the Board of Directors considers it necessary.\\nor if at least one twentieth (1/20) or 30 of the members of the Association with voting rights so request.\\nthe Board of Directors in writing for a specifically notified matter.\\n\\n## 14 ANNUAL MEETINGS\\n\\nThe Spring Meeting of the Association shall be held in February. The meeting shall consider at least the following matters:\\n\\n1. to establish the legality and quorum of the meeting.\\n2. to elect a chairman, a secretary, two scrutineers and a scrutineer.\\n3. To approve the agenda for the meeting.\\n4. to present the report of the previous year's activities.\\n5. Presentation of the auditors' report. Approval of the accounts and decision on the discharge to the accounting officers.\\n6. to consider any other business that may arise at the meeting.\\n\\nThe Association's autumn meeting will be held in November, at which at least the following items will be discussed:\\n\\n1. to establish the legality and quorum of the meeting.\\n2. to elect a chairman, a secretary, two scrutineers of the minutes and a scrutineer of the votes.\\n3. To approve the agenda of the meeting.\\n4. to decide on the remuneration and compensation of any officers of the Association.\\n5. to present an action plan for the coming year.\\n6. to consider and approve the proposed budget of income and expenditure and the amount of membership fees, as prepared by the Board of Directors.\\n7. to elect two auditors and two deputy auditors.\\n8. To elect a Chairman of the Board of the Association.\\n9. to decide on the number of members of the Board of Directors.\\n10. to elect the other members of the Board of Directors.\\n11. to consider any other business to be transacted at the meeting\\n\\nIf a member of the Association wishes to have a matter brought before the Spring or Autumn Meeting of the Association, he/she must\\nto the Board of Directors at least two weeks before the meeting so that the matter can be included in the agenda of the next general meeting.\\nbe included in the notice of the meeting.\\n\\n## 15 VOTING RIGHTS\\n\\nAt meetings of the Association, each full member shall have one vote. An honorary, supporting and corporate member shall have\\nhave the right to attend and speak, but not to vote, at meetings of the Association. In the event of a tie, the President shall have the vote of\\nshall have the casting vote, but in the case of elections, the election shall be by lot. Voting shall be by closed ballot if any member so decides.\\nif one of the members wishes.\\n\\n## 16TH ANNIVERSARY\\n\\nThe Association shall celebrate its anniversary on 21 October. The Association was founded in 1987.\\n\\n## 17 RECREATIONAL ACTIVITIES\\n\\nIn order to support and develop hobbies consistent with the purposes of the Association, members may\\nestablish an unregistered club or hobby group, the activities of which the Association shall endeavour to support as far as possible\\nas far as possible.\\n\\n\\n## 18 AMENDMENT OF THE STATUTES AND DISSOLUTION OF THE ASSOCIATION\\n\\nThe decision to amend the statutes and dissolve the association must be taken at a meeting of the association at least three\\nmajority of three quarters (3/4) of the votes cast. The notice of the meeting shall state that the amendment of the Statutes or the dissolution of the Association\\ndissolution. In the event of the dissolution of the Association, the assets of the Association shall be used to further the purposes of the Association.\\nin the manner determined by the meeting which decides on the dissolution of the association. If the Association is dissolved, its assets shall be used for the same purpose.\\n\\n## 19 MEMBERSHIP RIGHTS\\n\\nThe membership rights acquired shall be maintained.\\n\\n## 20 ASSOCIATION SYMBOLS\\n\\nThe form of the Association's emblem and of the decorations and medals shall be decided by the General Assembly. The distribution of the badges is decided by the Board of Directors.\\n\\n"}	{"rules_fi":"# Serveri ry:n järjestyssäännöt\\n\\n## 1. NIMI JA KOTIPAIKKA\\n\\nYhdistyksen nimi on Itä-Suomen yliopiston tietojenkäsittelytieteen opiskelijat - Serveri ry. Yhdistyksen kotipaikka on\\nKuopio.\\n\\n## 2. TARKOITUS JA TOIMINTA\\n\\nYhdistyksen tarkoituksena on yhdistää Itä-Suomen yliopiston tietojenkäsittelytieteen opiskelijoita ja tukea heidän\\nhenkisiä sekä aineellisia pyrkimyksiään, niin ammattiin liittyvissä kuin vapaa-ajan kysymyksissä. Tarkoituksensa\\ntoteuttamiseksi yhdistys valvoo jäsentensä etuja pitämällä yhteyksiä muihin yhdistyksiin, yrityksiin ja yliopiston\\nhallintoelimiin. Yhdistys järjestää erilaisia informaatio-, esitelmä-, luento-, ja keskustelutilaisuuksia sekä\\nillanviettoja. Yhdistys pyrkii tukemaan jäsentensä alaan liittyviä opintoja ja opintomatkoja. Toimintansa tukemiseksi\\nyhdistys voi myös vastaanottaa avustuksia, lahjoituksia ja testamentteja, panna toimeen asianomaisella luvalla\\nrahankeräyksiä ja arpajaisia, hankkia, myydä ja omistaa toimintaansa varten tarpeellista irtainta että kiinteätä\\nomaisuutta tai harjoittaa välittömästi yhdistyksen tarkoituksen toteuttamiseen liittyvää tai taloudellisesti\\nvähäarvoisena pidettävää ansiotoimintaa.\\n\\n\\n## 3 KIELI\\n\\nYhdistyksen kielenä on suomi. Pöytäkirjat laaditaan suomen kielellä.\\n\\n## 4 PUOLUEETTOMUUS\\n\\nYhdistys on puoluepoliittisesti sitoutumaton.\\n\\n## 5 JÄSENET\\n\\nJäseniä voivat olla:\\n\\n1. Varsinaiset jäsenet: Itä-Suomen yliopistossa kirjoilla olevat (läsnä- tai poissaolevana) tietojenkäsittelytiedettä\\n   opiskelevat henkilöt.\\n2. Kannatusjäsenet: Kannatusjäseniä voivat olla henkilöt tai oikeuskelpoiset yhteisöt, jotka ovat kiinnostuneita\\n   yhdistyksen toiminnasta ja haluavat tukea sitä.\\n3. Kunniajäsenet: Kunniajäseneksi voidaan kutsua henkilö, joka on erikoisesti tukenut yhdistyksen toimintaa. Ehdotuksen\\n   kunniajäseneksi kutsumisesta voi tehdä kuka tahansa jäsenistä suullisesti tai kirjallisesti hallitukselle, joka\\n   esittää ehdotuksen yhdistyksen kokoukselle tai suoraan yhdistyksen kokoukselle, jossa riittää yksinkertainen\\n   enemmistö mahdollisessa äänestyksessä esityksen hyväksymiseksi. Kaikki valmistuneet jäsenet voidaan hallituksen\\n   päätöksellä valita kunniajäseneksi.\\n4. Yhteisöjäsenet: Yhteisöjäsen voi olla oikeuskelpoinen yhteisö, joka on kiinnostunut yhdistyksen toiminnasta ja haluaa\\n   tukea sitä.\\n\\nVarsinaiset jäsenet, kannatusjäsenet ja yhteisöjäsenet hyväksyy hakemuksesta yhdistyksen hallitus. Jäsenyys astuu\\nvoimaan hallituksen päätöksen jälkeen. Jäsenyydestä eroaminen tapahtuu ilmoittamalla siitä kirjallisesti hallitukselle\\ntai sen puheenjohtajalle tai ilmoittamalla erosta yhdistyksen kokouksessa pöytäkirjaan merkittäväksi. Erottamisesta\\njäsenmaksun maksamatta jättämisen vuoksi päättää hallitus.\\n\\n## 6 JÄSENEN VELVOLLISUUDET\\n\\nJäsenellä on velvollisuus ilmoittaa yhdistyslain määräämät tiedot yhdistyksen hallitukselle aina muutosten yhteydessä,\\nkuitenkin vähintään viiden (5) vuoden välein.\\n\\n## 7 JÄSENMAKSUT\\n\\nVarsinaisten jäsenten ja kannatusjäsenten liittymismaksun ja vuotuisen jäsenmaksun suuruudesta erikseen kullekin\\njäsenryhmälle päättää syyskokous. Yhteisöjäsenten jäsenmaksuista päättää yhdistyksen hallitus. Kunniapuheenjohtajat ja\\nkunniajäsenet eivät suorita jäsenmaksuja.\\n\\n## 8 HALLITUS\\n\\nHallituksen muodostavat syyskokouksessa valitut puheenjohtaja ja vähintään seitsemän (7), enintään viisitoista (15)\\nmuuta varsinaista jäsentä sekä vähintään nolla (0) ja enintään viisi (5) varajäsentä. Varsinaisten ja varajäsenten\\nlukumäärä päätetään syyskokouksessa. Hallituksen toimikausi on kalenterivuosi. Hallitus valitsee keskuudestaan\\nvarapuheenjohtajan ja sihteerin, lisäksi hallitus nimittää rahastonhoitajan sekä muut tarvittavat toimihenkilöt.\\n\\n## 9 HALLITUKSEN TEHTÄVÄT\\n\\nHallituksen tehtävänä on:\\n\\n1. Pitää yllä jäsenluetteloa\\n2. Kutsua yhdistyksen kokous tarvittaessa koolle\\n3. Hoitaa yhdistyksen asioita sekä taloutta sääntöjen ja toimintasuunnitelman mukaan.\\n\\n## 10 YHDISTYKSEN NIMEN KIRJOITTAMINEN\\n\\nYhdistyksen nimen kirjoittaa hallituksen puheenjohtaja, sihteeri tai muu hallituksen jäsen jonka hallitus on\\nnimenkirjoittajaksi määrännyt, kukin erikseen.\\n\\n## 11 HALLITUKSEN KOOLLE KUTSUMINEN\\n\\nHallitus kokoontuu puheenjohtajan tai hänen estyneenä ollessaan varapuheenjohtajan kutsusta, kun he katsovat siihen\\nolevan aihetta tai jonkun hallituksen jäsenen niin halutessa. Hallitus on päätösvaltainen, mikäli puolet hallituksen\\njäsenistä puheenjohtaja tai varapuheenjohtaja mukaan lukien on paikalla ja kokouksesta on tiedotettu hallituksen\\njäsenille vähintään kolme vuorokautta ennen kokousta tai mikäli neljä viidesosaa (4/5) hallituksen varsinaisista\\njäsenistä on ilmaissut suostumuksensa kokouksen järjestämiseen aikaisemmin. Hallitus päättää kokousten\\nkoollekutsumistavasta järjestäytymiskokouksessaan. Päätökset tehdään hallituksessa yksinkertaisella enemmistöllä\\navoimella äänestyksellä, ellei joku halua suljettua lippuäänestystä. Äänten mennessä tasan kokouksen puheenjohtajan ääni\\nratkaisee, paitsi vaaleissa arpa.\\n\\n## 12 TILIT\\n\\nYhdistyksen tilikausi on kalenterivuosi. Rahastonhoitaja esittää tilit, kirjallisen selonteon varojen käytöstä ja\\ntaloudellisesta asemasta hallitukselle tilikautta seuraavan tammikuun 15. päivään mennessä. Hallitus laatii\\npuheenjohtajan ja sihteerin johdolla toimintakertomuksen. Tilinpäätös tarvittavine asiakirjoineen ja hallituksen\\nvuosikertomus on annettava toiminnantarkastajille viimeistään kolme viikkoa ennen kevätkokousta. Toiminnantarkastajien\\ntulee antaa kirjallinen lausuntonsa viimeistään kaksi viikkoa ennen kevätkokousta hallitukselle. Hallitus esittää\\ntilinpäätöksen ja toiminnantarkastajien lausunnon sekä toimintakertomuksen yhdistyksen kevätkokoukselle.\\n\\n## 13 YHDISTYKSEN KOKOUKSEN KOOLLE KUTSUMINEN\\n\\nYhdistyksen kevät- ja syyskokouksen ja ylimääräisen kokouksen koolle kutsuminen tapahtuu ilmoituksella viimeistään\\nviikkoa ennen kokousta yhdistyksen ilmoitustaululla. Ylimääräinen kokous pidetään, jos hallitus katsoo siihen olevan\\naihetta tai jos vähintään yksi kahdeskymmenesosa (1/20) tai 30 yhdistyksen äänioikeutetuista jäsenistä sitä\\nhallitukselta erityisesti ilmoitettua asiaa varten kirjallisesti vaatii.\\n\\n## 14 VUOSIKOKOUKSET\\n\\nYhdistyksen kevätkokous pidetään helmikuussa. Kokouksessa käsitellään vähintään seuraavat asiat:\\n\\n1. Todetaan kokouksen laillisuus ja päätösvaltaisuus.\\n2. Valitaan kokoukselle puheenjohtaja, sihteeri ja kaksi pöytäkirjantarkastajaa sekä ääntenlaskijaa.\\n3. Vahvistetaan kokouksen esityslista.\\n4. Esitetään edellisen vuoden toimintakertomus.\\n5. Esitetään toiminnantarkastajien lausunto. Vahvistetaan tilinpäätös ja päätetään vastuuvapauden myöntämisestä tilivelvollisille.\\n6. Käsitellään muut kokouksessa mahdolliset esille tulevat asiat.\\n\\nYhdistyksen syyskokous pidetään marraskuussa, kokouksessa käsitellään vähintään seuraavat asiat:\\n\\n1. Todetaan kokouksen laillisuus ja päätösvaltaisuus.\\n2. Valitaan kokoukselle puheenjohtaja, sihteeri ja kaksi pöytäkirjantarkastajaa sekä ääntenlaskijaa.\\n3. Vahvistetaan kokouksen esityslista.\\n4. Päätetään yhdistyksen mahdollisten toimihenkilöiden palkkioista ja korvauksista.\\n5. Esitetään toimintasuunnitelma tulevalle vuodelle.\\n6. Käsitellään ja vahvistetaan hallituksen laatima tulo- ja menoarvioehdotus sekä jäsenmaksujen suuruus.\\n7. Valitaan kaksi toiminnantarkastajaa ja kaksi varatoiminnantarkastajaa.\\n8. Valitaan yhdistyksen hallitukselle puheenjohtaja.\\n9. Päätetään hallituksen jäsenten määrä.\\n10. Valitaan muut hallituksen jäsenet.\\n11. Käsitellään muut kokouksessa esille tulevat asiat\\n\\nMikäli yhdistyksen jäsen haluaa saada jonkin asian yhdistyksen kevät- tai syyskokouksen käsiteltäväksi, on hänen\\nilmoitettava siitä kirjallisesti hallitukselle viimeistään kaksi viikkoa ennen kokousta, että asia voidaan sisällyttää\\nkokouskutsuun.\\n\\n## 15 ÄÄNIOIKEUS\\n\\nYhdistyksen kokouksissa on jokaisella varsinaisella jäsenellä yksi ääni. Kunnia-, kannatus- ja yhteisöjäsenellä on\\nläsnäolo- ja puheoikeus, mutta ei äänioikeutta yhdistyksen kokouksessa. Äänten mennessä tasan puheenjohtajan ääni\\nratkaisee, vaaleissa kuitenkin arpa. Äänestys tulee suorittaa suljettuna lippuäänestyksenä, mikäli joku jäsenistä niin\\nhaluaa.\\n\\n## 16 VUOSIPÄIVÄ\\n\\nYhdistys viettää vuosipäiväänsä lokakuun 21. päivänä. Yhdistys on perustettu vuonna 1987.\\n\\n## 17 HARRASTUSTOIMINTA\\n\\nYhdistyksen tarkoitusperien kanssa sopusoinnussa olevien harrastusten tukemiseksi ja kehittämiseksi voivat jäsenet\\nperustaa rekisteröimättömän kerhon tai harrastuspiirin, joiden toimintaa yhdistys pyrkii tukemaan mahdollisuuksiensa\\nmukaan.\\n\\n## 18 SÄÄNTÖJEN MUUTTAMINEN JA YHDISTYKSEN PURKAMINEN\\n\\nPäätös sääntöjen muuttamisesta ja yhdistyksen purkamisesta on tehtävä yhdistyksen kokouksessa vähintään kolmen\\nneljäsosan (3/4) enemmistöllä annetuista äänistä. Kokouskutsussa on mainittava sääntöjen muuttamisesta tai yhdistyksen\\npurkamisesta. Yhdistyksen purkautuessa käytetään yhdistyksen varat yhdistyksen tarkoituksen edistämiseen purkamisesta\\npäättävän kokouksen määräämällä tavalla. Yhdistyksen tullessa lakkautetuksi käytetään sen varat samaan tarkoitukseen.\\n\\n## 19 JÄSENOIKEUDET\\n\\nSaavutetut jäsenoikeudet säilyvät.\\n\\n## 20 YHDISTYKSEN TUNNUKSET\\n\\nYhdistyksen tunnuksen sekä arvo- ja kunniamerkkien muodosta päättää yleiskokous. Merkkien jakamisesta päättää hallitus.","user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-29T12:05:34.771Z"}	\N
262	325	lomake_vastaukset	53	\N	\N	\N
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
164	172	directus_fields	56	{"interface":"input-rich-text-md","special":null,"required":true,"collection":"serveri_rules","field":"rules_fi"}	{"interface":"input-rich-text-md","special":null,"required":true,"collection":"serveri_rules","field":"rules_fi"}	\N
264	327	lomake_vastaukset	54	\N	\N	\N
239	275	lomake_vastaukset	30	\N	\N	\N
38	39	directus_permissions	1	{"id":1,"role":null,"collection":"LandingPage","action":"read","permissions":{},"validation":{},"presets":null,"fields":["fi_title","en_title","fi_description","en_description","fi_button_text","en_button_text","fi_button_url","en_button_url"]}	{"role":null,"collection":"LandingPage","action":"read","permissions":{},"validation":{},"presets":null,"fields":["fi_title","en_title","fi_description","en_description","fi_button_text","en_button_text","fi_button_url","en_button_url"]}	\N
39	40	directus_permissions	2	{"role":null,"collection":"directus_fields","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"directus_fields","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N
40	41	directus_permissions	3	{"role":null,"collection":"directus_collections","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"directus_collections","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N
41	42	directus_permissions	1	{"id":1,"role":null,"collection":"LandingPage","action":"read","permissions":{},"validation":{},"presets":null,"fields":["*"]}	{"permissions":{},"validation":{},"fields":["*"]}	\N
42	43	directus_permissions	4	{"role":null,"collection":"directus_users","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"directus_users","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N
43	44	directus_permissions	1	{"id":1,"role":null,"collection":"LandingPage","action":"read","permissions":null,"validation":{},"presets":null,"fields":["fi_title","en_title","fi_description","en_description","fi_button_text","en_button_text","fi_button_url","en_button_url"]}	{"role":null,"collection":"LandingPage","action":"read","permissions":null,"validation":{},"presets":null,"fields":["fi_title","en_title","fi_description","en_description","fi_button_text","en_button_text","fi_button_url","en_button_url"]}	\N
44	45	directus_permissions	1	{"id":1,"role":null,"collection":"LandingPage","action":"read","permissions":null,"validation":{},"presets":null,"fields":["fi_title","en_title","fi_description","en_description","fi_button_text","en_button_text","fi_button_url","en_button_url"]}	{"role":null,"collection":"LandingPage","action":"read","permissions":null,"validation":{},"presets":null,"fields":["fi_title","en_title","fi_description","en_description","fi_button_text","en_button_text","fi_button_url","en_button_url"]}	\N
45	46	directus_permissions	1	{"id":1,"role":null,"collection":"LandingPage","action":"read","permissions":null,"validation":{},"presets":null,"fields":["fi_title","en_title","fi_description","en_description","fi_button_text","en_button_text","fi_button_url","en_button_url"]}	{"role":null,"collection":"LandingPage","action":"read","permissions":null,"validation":{},"presets":null,"fields":["fi_title","en_title","fi_description","en_description","fi_button_text","en_button_text","fi_button_url","en_button_url"]}	\N
46	50	LandingPage	1	{"id":1,"user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-16T15:16:26.473Z","fi_title":"Serveri ry MUOKKAUS","en_title":"Serveri ry","fi_description":"Itä-Suomen yliopiston Kuopion kampuksen tietojenkäsittelytieteen opiskelijoiden ainejärjestö ","en_description":"The computer science students' subject organization of the Kuopio campus of the University of Eastern Finland","fi_button_text":"Millaista tietojenkäsittelytiede on?","en_button_text":"What is computer science like?","en_button_url":"/opiskelu/tkt","fi_button_url":"/opiskelu/tkt"}	{"fi_title":"Serveri ry MUOKKAUS","user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-16T15:16:26.473Z"}	\N
47	51	LandingPage	1	{"id":1,"user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-16T15:19:17.017Z","fi_title":"Serveri ry MUOKKA","en_title":"Serveri ry","fi_description":"Itä-Suomen yliopiston Kuopion kampuksen tietojenkäsittelytieteen opiskelijoiden ainejärjestö ","en_description":"The computer science students' subject organization of the Kuopio campus of the University of Eastern Finland","fi_button_text":"Millaista tietojenkäsittelytiede on?","en_button_text":"What is computer science like?","en_button_url":"/opiskelu/tkt","fi_button_url":"/opiskelu/tkt"}	{"fi_title":"Serveri ry MUOKKA","user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-16T15:19:17.017Z"}	\N
48	52	LandingPage	1	{"id":1,"user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-16T15:19:43.805Z","fi_title":"Serveri ry","en_title":"Serveri ry","fi_description":"Itä-Suomen yliopiston Kuopion kampuksen tietojenkäsittelytieteen opiskelijoiden ainejärjestö ","en_description":"The computer science students' subject organization of the Kuopio campus of the University of Eastern Finland","fi_button_text":"Millaista tietojenkäsittelytiede on?","en_button_text":"What is computer science like?","en_button_url":"/opiskelu/tkt","fi_button_url":"/opiskelu/tkt"}	{"fi_title":"Serveri ry","user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-16T15:19:43.805Z"}	\N
49	53	LandingPage	1	{"id":1,"user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-16T15:21:01.208Z","fi_title":"Serveri ry ASD","en_title":"Serveri ry","fi_description":"Itä-Suomen yliopiston Kuopion kampuksen tietojenkäsittelytieteen opiskelijoiden ainejärjestö ","en_description":"The computer science students' subject organization of the Kuopio campus of the University of Eastern Finland","fi_button_text":"Millaista tietojenkäsittelytiede on?","en_button_text":"What is computer science like?","en_button_url":"/opiskelu/tkt","fi_button_url":"/opiskelu/tkt"}	{"fi_title":"Serveri ry ASD","user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-16T15:21:01.208Z"}	\N
50	54	LandingPage	1	{"id":1,"user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-16T15:21:30.886Z","fi_title":"Serveri ry","en_title":"Serveri ry","fi_description":"Itä-Suomen yliopiston Kuopion kampuksen tietojenkäsittelytieteen opiskelijoiden ainejärjestö ","en_description":"The computer science students' subject organization of the Kuopio campus of the University of Eastern Finland","fi_button_text":"Millaista tietojenkäsittelytiede on?","en_button_text":"What is computer science like?","en_button_url":"/opiskelu/tkt","fi_button_url":"/opiskelu/tkt"}	{"fi_title":"Serveri ry","user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-16T15:21:30.886Z"}	\N
51	56	LandingPage	1	{"id":1,"user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-16T15:22:03.131Z","fi_title":"Serveri ry Muokkaus","en_title":"Serveri ry","fi_description":"Itä-Suomen yliopiston Kuopion kampuksen tietojenkäsittelytieteen opiskelijoiden ainejärjestö ","en_description":"The computer science students' subject organization of the Kuopio campus of the University of Eastern Finland","fi_button_text":"Millaista tietojenkäsittelytiede on?","en_button_text":"What is computer science like?","en_button_url":"/opiskelu/tkt","fi_button_url":"/opiskelu/tkt"}	{"fi_title":"Serveri ry Muokkaus","user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-16T15:22:03.131Z"}	\N
166	174	directus_permissions	7	{"role":null,"collection":"news","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"news","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N
52	57	LandingPage	1	{"id":1,"user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-16T15:25:53.828Z","fi_title":"Serveri ry Moro","en_title":"Serveri ry","fi_description":"Itä-Suomen yliopiston Kuopion kampuksen tietojenkäsittelytieteen opiskelijoiden ainejärjestö ","en_description":"The computer science students' subject organization of the Kuopio campus of the University of Eastern Finland","fi_button_text":"Millaista tietojenkäsittelytiede on?","en_button_text":"What is computer science like?","en_button_url":"/opiskelu/tkt","fi_button_url":"/opiskelu/tkt"}	{"fi_title":"Serveri ry Moro","user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-16T15:25:53.828Z"}	\N
53	58	LandingPage	1	{"id":1,"user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-16T15:40:45.270Z","fi_title":"Serveri ry ASDASDASDASDASD","en_title":"Serveri ry","fi_description":"Itä-Suomen yliopiston Kuopion kampuksen tietojenkäsittelytieteen opiskelijoiden ainejärjestö ","en_description":"The computer science students' subject organization of the Kuopio campus of the University of Eastern Finland","fi_button_text":"Millaista tietojenkäsittelytiede on?","en_button_text":"What is computer science like?","en_button_url":"/opiskelu/tkt","fi_button_url":"/opiskelu/tkt"}	{"fi_title":"Serveri ry ASDASDASDASDASD","user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-16T15:40:45.270Z"}	\N
54	59	LandingPage	1	{"id":1,"user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-16T15:40:56.866Z","fi_title":"Serveri ry MOROOOO","en_title":"Serveri ry","fi_description":"Itä-Suomen yliopiston Kuopion kampuksen tietojenkäsittelytieteen opiskelijoiden ainejärjestö ","en_description":"The computer science students' subject organization of the Kuopio campus of the University of Eastern Finland","fi_button_text":"Millaista tietojenkäsittelytiede on?","en_button_text":"What is computer science like?","en_button_url":"/opiskelu/tkt","fi_button_url":"/opiskelu/tkt"}	{"fi_title":"Serveri ry MOROOOO","user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-16T15:40:56.866Z"}	\N
55	60	directus_fields	18	{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"board_members"}	{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"board_members"}	\N
56	61	directus_fields	19	{"width":"full","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]},"field":"status","collection":"board_members"}	{"width":"full","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]},"field":"status","collection":"board_members"}	\N
57	62	directus_fields	20	{"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"board_members"}	{"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"board_members"}	\N
58	63	directus_fields	21	{"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"board_members"}	{"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"board_members"}	\N
59	64	directus_fields	22	{"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"board_members"}	{"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"board_members"}	\N
60	65	directus_fields	23	{"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"board_members"}	{"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"board_members"}	\N
61	66	directus_collections	board_members	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"board_members"}	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"board_members"}	\N
62	67	directus_fields	24	{"interface":"input","special":null,"options":{"url":null},"collection":"board_members","field":"name"}	{"interface":"input","special":null,"options":{"url":null},"collection":"board_members","field":"name"}	\N
63	68	directus_fields	25	{"interface":"input","special":null,"collection":"board_members","field":"role"}	{"interface":"input","special":null,"collection":"board_members","field":"role"}	\N
64	69	directus_fields	26	{"interface":"input","special":null,"collection":"board_members","field":"email"}	{"interface":"input","special":null,"collection":"board_members","field":"email"}	\N
65	70	directus_fields	27	{"interface":"input","special":null,"collection":"board_members","field":"telegram_nickname"}	{"interface":"input","special":null,"collection":"board_members","field":"telegram_nickname"}	\N
66	71	directus_fields	28	{"interface":"input","special":null,"collection":"board_members","field":"telegram"}	{"interface":"input","special":null,"collection":"board_members","field":"telegram"}	\N
67	72	directus_fields	29	{"interface":"input-multiline","special":null,"collection":"board_members","field":"description"}	{"interface":"input-multiline","special":null,"collection":"board_members","field":"description"}	\N
68	73	directus_fields	30	{"interface":"input","special":["file"],"collection":"board_members","field":"img"}	{"interface":"input","special":["file"],"collection":"board_members","field":"img"}	\N
69	74	directus_fields	31	{"interface":"input","special":null,"collection":"board_members","field":"hover_img"}	{"interface":"input","special":null,"collection":"board_members","field":"hover_img"}	\N
70	75	directus_fields	18	{"id":18,"collection":"board_members","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"id","sort":1,"group":null}	\N
71	76	directus_fields	19	{"id":19,"collection":"board_members","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]},"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"status","sort":2,"group":null}	\N
72	77	directus_fields	20	{"id":20,"collection":"board_members","field":"user_created","special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"user_created","sort":3,"group":null}	\N
73	78	directus_fields	21	{"id":21,"collection":"board_members","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":4,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"date_created","sort":4,"group":null}	\N
74	79	directus_fields	22	{"id":22,"collection":"board_members","field":"user_updated","special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"user_updated","sort":5,"group":null}	\N
75	80	directus_fields	23	{"id":23,"collection":"board_members","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":6,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"date_updated","sort":6,"group":null}	\N
76	81	directus_fields	30	{"id":30,"collection":"board_members","field":"img","special":["file"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"img","sort":7,"group":null}	\N
77	82	directus_fields	24	{"id":24,"collection":"board_members","field":"name","special":null,"interface":"input","options":{"url":null},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"name","sort":8,"group":null}	\N
78	83	directus_fields	25	{"id":25,"collection":"board_members","field":"role","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"role","sort":9,"group":null}	\N
79	84	directus_fields	26	{"id":26,"collection":"board_members","field":"email","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"email","sort":10,"group":null}	\N
80	85	directus_fields	28	{"id":28,"collection":"board_members","field":"telegram","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":11,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"telegram","sort":11,"group":null}	\N
81	86	directus_fields	29	{"id":29,"collection":"board_members","field":"description","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":12,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"description","sort":12,"group":null}	\N
82	87	directus_fields	31	{"id":31,"collection":"board_members","field":"hover_img","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":13,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"hover_img","sort":13,"group":null}	\N
96	101	directus_fields	24	{"id":24,"collection":"board_members","field":"name","special":null,"interface":"input","options":{"url":null},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"name","special":null,"interface":"input","options":{"url":null},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N
97	102	directus_fields	25	{"id":25,"collection":"board_members","field":"role","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"role","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N
83	88	directus_fields	18	{"id":18,"collection":"board_members","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"id","sort":1,"group":null}	\N
84	89	directus_fields	19	{"id":19,"collection":"board_members","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]},"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"status","sort":2,"group":null}	\N
85	90	directus_fields	20	{"id":20,"collection":"board_members","field":"user_created","special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"user_created","sort":3,"group":null}	\N
86	91	directus_fields	21	{"id":21,"collection":"board_members","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":4,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"date_created","sort":4,"group":null}	\N
87	92	directus_fields	22	{"id":22,"collection":"board_members","field":"user_updated","special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"user_updated","sort":5,"group":null}	\N
88	93	directus_fields	23	{"id":23,"collection":"board_members","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":6,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"date_updated","sort":6,"group":null}	\N
89	94	directus_fields	30	{"id":30,"collection":"board_members","field":"img","special":["file"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"img","sort":7,"group":null}	\N
90	95	directus_fields	31	{"id":31,"collection":"board_members","field":"hover_img","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"hover_img","sort":8,"group":null}	\N
91	96	directus_fields	24	{"id":24,"collection":"board_members","field":"name","special":null,"interface":"input","options":{"url":null},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"name","sort":9,"group":null}	\N
92	97	directus_fields	25	{"id":25,"collection":"board_members","field":"role","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"role","sort":10,"group":null}	\N
93	98	directus_fields	26	{"id":26,"collection":"board_members","field":"email","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":11,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"email","sort":11,"group":null}	\N
94	99	directus_fields	28	{"id":28,"collection":"board_members","field":"telegram","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":12,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"telegram","sort":12,"group":null}	\N
95	100	directus_fields	29	{"id":29,"collection":"board_members","field":"description","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":13,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"description","sort":13,"group":null}	\N
99	104	directus_fields	28	{"id":28,"collection":"board_members","field":"telegram","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":12,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"telegram","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":12,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N
101	106	directus_fields	28	{"id":28,"collection":"board_members","field":"telegram","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":12,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"telegram","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":12,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N
98	103	directus_fields	26	{"id":26,"collection":"board_members","field":"email","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":11,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"email","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":11,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N
100	105	directus_fields	29	{"id":29,"collection":"board_members","field":"description","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":13,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"description","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":13,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N
103	108	directus_fields	25	{"id":25,"collection":"board_members","field":"role","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"role","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N
105	110	directus_fields	31	{"id":31,"collection":"board_members","field":"hover_img","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"hover_img","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N
102	107	directus_fields	26	{"id":26,"collection":"board_members","field":"email","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":11,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"email","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":11,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N
104	109	directus_fields	24	{"id":24,"collection":"board_members","field":"name","special":null,"interface":"input","options":{"url":null},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"name","special":null,"interface":"input","options":{"url":null},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N
106	111	directus_fields	30	{"id":30,"collection":"board_members","field":"img","special":["file"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"img","special":["file"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N
107	112	directus_fields	29	{"id":29,"collection":"board_members","field":"description","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":13,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"description","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":13,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N
108	113	directus_collections	board_members	{"collection":"board_members","icon":"account_circle","note":"Collection of board members.","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":null,"group":null,"collapse":"open"}	{"icon":"account_circle","note":"Collection of board members."}	\N
109	114	directus_fields	32	{"interface":"input","special":null,"collection":"board_members","field":"img"}	{"interface":"input","special":null,"collection":"board_members","field":"img"}	\N
110	115	directus_fields	18	{"id":18,"collection":"board_members","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"id","sort":1,"group":null}	\N
111	116	directus_fields	19	{"id":19,"collection":"board_members","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]},"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"status","sort":2,"group":null}	\N
167	175	directus_permissions	8	{"role":null,"collection":"serveri_rules","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"serveri_rules","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N
112	117	directus_fields	20	{"id":20,"collection":"board_members","field":"user_created","special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"user_created","sort":3,"group":null}	\N
113	118	directus_fields	21	{"id":21,"collection":"board_members","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":4,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"date_created","sort":4,"group":null}	\N
114	119	directus_fields	22	{"id":22,"collection":"board_members","field":"user_updated","special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"user_updated","sort":5,"group":null}	\N
115	120	directus_fields	23	{"id":23,"collection":"board_members","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":6,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"date_updated","sort":6,"group":null}	\N
116	121	directus_fields	32	{"id":32,"collection":"board_members","field":"img","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"img","sort":7,"group":null}	\N
117	122	directus_fields	31	{"id":31,"collection":"board_members","field":"hover_img","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"hover_img","sort":8,"group":null}	\N
118	123	directus_fields	24	{"id":24,"collection":"board_members","field":"name","special":null,"interface":"input","options":{"url":null},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"name","sort":9,"group":null}	\N
119	124	directus_fields	25	{"id":25,"collection":"board_members","field":"role","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"role","sort":10,"group":null}	\N
120	125	directus_fields	26	{"id":26,"collection":"board_members","field":"email","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":11,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"email","sort":11,"group":null}	\N
121	126	directus_fields	28	{"id":28,"collection":"board_members","field":"telegram","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":12,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"telegram","sort":12,"group":null}	\N
122	127	directus_fields	29	{"id":29,"collection":"board_members","field":"description","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":13,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"description","sort":13,"group":null}	\N
123	128	directus_fields	32	{"id":32,"collection":"board_members","field":"img","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"img","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N
124	129	directus_fields	31	{"id":31,"collection":"board_members","field":"hover_img","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"hover_img","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N
125	130	board_members	1	{"status":"published"}	{"status":"published"}	\N
126	131	board_members	2	{"status":"published","name":"Maija Meikäläinen","email":"maija.meikalainen@serveriry.fi","telegram":"maijameikalainen"}	{"status":"published","name":"Maija Meikäläinen","email":"maija.meikalainen@serveriry.fi","telegram":"maijameikalainen"}	\N
127	132	directus_permissions	5	{"role":null,"collection":"board_members","action":"read"}	{"role":null,"collection":"board_members","action":"read"}	\N
128	133	directus_permissions	5	{"id":5,"role":null,"collection":"board_members","action":"read","permissions":null,"validation":null,"presets":null,"fields":["img","hover_img","role","email","telegram","name","description"]}	{"role":null,"collection":"board_members","action":"read","permissions":null,"validation":null,"presets":null,"fields":["img","hover_img","role","email","telegram","name","description"]}	\N
169	177	serveri_rules	1	{"id":1,"user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-29T11:32:32.086Z","rules_fi":"# Serveri ry:n järjestyssäännöt\\n\\n## 1. NIMI JA KOTIPAIKKA\\n\\nYhdistyksen nimi on Itä-Suomen yliopiston tietojenkäsittelytieteen opiskelijat - Serveri ry. Yhdistyksen kotipaikka on\\nKuopio.\\n\\n## 2. TARKOITUS JA TOIMINTA\\n\\nYhdistyksen tarkoituksena on yhdistää Itä-Suomen yliopiston tietojenkäsittelytieteen opiskelijoita ja tukea heidän\\nhenkisiä sekä aineellisia pyrkimyksiään, niin ammattiin liittyvissä kuin vapaa-ajan kysymyksissä. Tarkoituksensa\\ntoteuttamiseksi yhdistys valvoo jäsentensä etuja pitämällä yhteyksiä muihin yhdistyksiin, yrityksiin ja yliopiston\\nhallintoelimiin. Yhdistys järjestää erilaisia informaatio-, esitelmä-, luento-, ja keskustelutilaisuuksia sekä\\nillanviettoja. Yhdistys pyrkii tukemaan jäsentensä alaan liittyviä opintoja ja opintomatkoja. Toimintansa tukemiseksi\\nyhdistys voi myös vastaanottaa avustuksia, lahjoituksia ja testamentteja, panna toimeen asianomaisella luvalla\\nrahankeräyksiä ja arpajaisia, hankkia, myydä ja omistaa toimintaansa varten tarpeellista irtainta että kiinteätä\\nomaisuutta tai harjoittaa välittömästi yhdistyksen tarkoituksen toteuttamiseen liittyvää tai taloudellisesti\\nvähäarvoisena pidettävää ansiotoimintaa.\\n\\n## 3 KIELI\\n\\nYhdistyksen kielenä on suomi. Pöytäkirjat laaditaan suomen kielellä.\\n\\n## 4 PUOLUEETTOMUUS\\n\\nYhdistys on puoluepoliittisesti sitoutumaton.\\n\\n## 5 JÄSENET\\n\\nJäseniä voivat olla:\\n\\n1. Varsinaiset jäsenet: Itä-Suomen yliopistossa kirjoilla olevat (läsnä- tai poissaolevana) tietojenkäsittelytiedettä\\n   opiskelevat henkilöt.\\n2. Kannatusjäsenet: Kannatusjäseniä voivat olla henkilöt tai oikeuskelpoiset yhteisöt, jotka ovat kiinnostuneita\\n   yhdistyksen toiminnasta ja haluavat tukea sitä.\\n3. Kunniajäsenet: Kunniajäseneksi voidaan kutsua henkilö, joka on erikoisesti tukenut yhdistyksen toimintaa. Ehdotuksen\\n   kunniajäseneksi kutsumisesta voi tehdä kuka tahansa jäsenistä suullisesti tai kirjallisesti hallitukselle, joka\\n   esittää ehdotuksen yhdistyksen kokoukselle tai suoraan yhdistyksen kokoukselle, jossa riittää yksinkertainen\\n   enemmistö mahdollisessa äänestyksessä esityksen hyväksymiseksi. Kaikki valmistuneet jäsenet voidaan hallituksen\\n   päätöksellä valita kunniajäseneksi.\\n4. Yhteisöjäsenet: Yhteisöjäsen voi olla oikeuskelpoinen yhteisö, joka on kiinnostunut yhdistyksen toiminnasta ja haluaa\\n   tukea sitä.\\n\\nVarsinaiset jäsenet, kannatusjäsenet ja yhteisöjäsenet hyväksyy hakemuksesta yhdistyksen hallitus. Jäsenyys astuu\\nvoimaan hallituksen päätöksen jälkeen. Jäsenyydestä eroaminen tapahtuu ilmoittamalla siitä kirjallisesti hallitukselle\\ntai sen puheenjohtajalle tai ilmoittamalla erosta yhdistyksen kokouksessa pöytäkirjaan merkittäväksi. Erottamisesta\\njäsenmaksun maksamatta jättämisen vuoksi päättää hallitus.\\n\\n## 6 JÄSENEN VELVOLLISUUDET\\n\\nJäsenellä on velvollisuus ilmoittaa yhdistyslain määräämät tiedot yhdistyksen hallitukselle aina muutosten yhteydessä,\\nkuitenkin vähintään viiden (5) vuoden välein.\\n\\n## 7 JÄSENMAKSUT\\n\\nVarsinaisten jäsenten ja kannatusjäsenten liittymismaksun ja vuotuisen jäsenmaksun suuruudesta erikseen kullekin\\njäsenryhmälle päättää syyskokous. Yhteisöjäsenten jäsenmaksuista päättää yhdistyksen hallitus. Kunniapuheenjohtajat ja\\nkunniajäsenet eivät suorita jäsenmaksuja.\\n\\n## 8 HALLITUS\\n\\nHallituksen muodostavat syyskokouksessa valitut puheenjohtaja ja vähintään seitsemän (7), enintään viisitoista (15)\\nmuuta varsinaista jäsentä sekä vähintään nolla (0) ja enintään viisi (5) varajäsentä. Varsinaisten ja varajäsenten\\nlukumäärä päätetään syyskokouksessa. Hallituksen toimikausi on kalenterivuosi. Hallitus valitsee keskuudestaan\\nvarapuheenjohtajan ja sihteerin, lisäksi hallitus nimittää rahastonhoitajan sekä muut tarvittavat toimihenkilöt.\\n\\n## 9 HALLITUKSEN TEHTÄVÄT\\n\\nHallituksen tehtävänä on:\\n\\n1. Pitää yllä jäsenluetteloa\\n2. Kutsua yhdistyksen kokous tarvittaessa koolle\\n3. Hoitaa yhdistyksen asioita sekä taloutta sääntöjen ja toimintasuunnitelman mukaan.\\n\\n## 10 YHDISTYKSEN NIMEN KIRJOITTAMINEN\\n\\nYhdistyksen nimen kirjoittaa hallituksen puheenjohtaja, sihteeri tai muu hallituksen jäsen jonka hallitus on\\nnimenkirjoittajaksi määrännyt, kukin erikseen.\\n\\n## 11 HALLITUKSEN KOOLLE KUTSUMINEN\\n\\nHallitus kokoontuu puheenjohtajan tai hänen estyneenä ollessaan varapuheenjohtajan kutsusta, kun he katsovat siihen\\nolevan aihetta tai jonkun hallituksen jäsenen niin halutessa. Hallitus on päätösvaltainen, mikäli puolet hallituksen\\njäsenistä puheenjohtaja tai varapuheenjohtaja mukaan lukien on paikalla ja kokouksesta on tiedotettu hallituksen\\njäsenille vähintään kolme vuorokautta ennen kokousta tai mikäli neljä viidesosaa (4/5) hallituksen varsinaisista\\njäsenistä on ilmaissut suostumuksensa kokouksen järjestämiseen aikaisemmin. Hallitus päättää kokousten\\nkoollekutsumistavasta järjestäytymiskokouksessaan. Päätökset tehdään hallituksessa yksinkertaisella enemmistöllä\\navoimella äänestyksellä, ellei joku halua suljettua lippuäänestystä. Äänten mennessä tasan kokouksen puheenjohtajan ääni\\nratkaisee, paitsi vaaleissa arpa.\\n\\n## 12 TILIT\\n\\nYhdistyksen tilikausi on kalenterivuosi. Rahastonhoitaja esittää tilit, kirjallisen selonteon varojen käytöstä ja\\ntaloudellisesta asemasta hallitukselle tilikautta seuraavan tammikuun 15. päivään mennessä. Hallitus laatii\\npuheenjohtajan ja sihteerin johdolla toimintakertomuksen. Tilinpäätös tarvittavine asiakirjoineen ja hallituksen\\nvuosikertomus on annettava toiminnantarkastajille viimeistään kolme viikkoa ennen kevätkokousta. Toiminnantarkastajien\\ntulee antaa kirjallinen lausuntonsa viimeistään kaksi viikkoa ennen kevätkokousta hallitukselle. Hallitus esittää\\ntilinpäätöksen ja toiminnantarkastajien lausunnon sekä toimintakertomuksen yhdistyksen kevätkokoukselle.\\n\\n## 13 YHDISTYKSEN KOKOUKSEN KOOLLE KUTSUMINEN\\n\\nYhdistyksen kevät- ja syyskokouksen ja ylimääräisen kokouksen koolle kutsuminen tapahtuu ilmoituksella viimeistään\\nviikkoa ennen kokousta yhdistyksen ilmoitustaululla. Ylimääräinen kokous pidetään, jos hallitus katsoo siihen olevan\\naihetta tai jos vähintään yksi kahdeskymmenesosa (1/20) tai 30 yhdistyksen äänioikeutetuista jäsenistä sitä\\nhallitukselta erityisesti ilmoitettua asiaa varten kirjallisesti vaatii.\\n\\n## 14 VUOSIKOKOUKSET\\n\\nYhdistyksen kevätkokous pidetään helmikuussa. Kokouksessa käsitellään vähintään seuraavat asiat:\\n\\n1. Todetaan kokouksen laillisuus ja päätösvaltaisuus.\\n2. Valitaan kokoukselle puheenjohtaja, sihteeri ja kaksi pöytäkirjantarkastajaa sekä ääntenlaskijaa.\\n3. Vahvistetaan kokouksen esityslista.\\n4. Esitetään edellisen vuoden toimintakertomus.\\n5. Esitetään toiminnantarkastajien lausunto. Vahvistetaan tilinpäätös ja päätetään vastuuvapauden myöntämisestä tilivelvollisille.\\n6. Käsitellään muut kokouksessa mahdolliset esille tulevat asiat.\\n\\nYhdistyksen syyskokous pidetään marraskuussa, kokouksessa käsitellään vähintään seuraavat asiat:\\n\\n1. Todetaan kokouksen laillisuus ja päätösvaltaisuus.\\n2. Valitaan kokoukselle puheenjohtaja, sihteeri ja kaksi pöytäkirjantarkastajaa sekä ääntenlaskijaa.\\n3. Vahvistetaan kokouksen esityslista.\\n4. Päätetään yhdistyksen mahdollisten toimihenkilöiden palkkioista ja korvauksista.\\n5. Esitetään toimintasuunnitelma tulevalle vuodelle.\\n6. Käsitellään ja vahvistetaan hallituksen laatima tulo- ja menoarvioehdotus sekä jäsenmaksujen suuruus.\\n7. Valitaan kaksi toiminnantarkastajaa ja kaksi varatoiminnantarkastajaa.\\n8. Valitaan yhdistyksen hallitukselle puheenjohtaja.\\n9. Päätetään hallituksen jäsenten määrä.\\n10. Valitaan muut hallituksen jäsenet.\\n11. Käsitellään muut kokouksessa esille tulevat asiat\\n\\nMikäli yhdistyksen jäsen haluaa saada jonkin asian yhdistyksen kevät- tai syyskokouksen käsiteltäväksi, on hänen\\nilmoitettava siitä kirjallisesti hallitukselle viimeistään kaksi viikkoa ennen kokousta, että asia voidaan sisällyttää\\nkokouskutsuun.\\n\\n## 15 ÄÄNIOIKEUS\\n\\nYhdistyksen kokouksissa on jokaisella varsinaisella jäsenellä yksi ääni. Kunnia-, kannatus- ja yhteisöjäsenellä on\\nläsnäolo- ja puheoikeus, mutta ei äänioikeutta yhdistyksen kokouksessa. Äänten mennessä tasan puheenjohtajan ääni\\nratkaisee, vaaleissa kuitenkin arpa. Äänestys tulee suorittaa suljettuna lippuäänestyksenä, mikäli joku jäsenistä niin\\nhaluaa.\\n\\n## 16 VUOSIPÄIVÄ\\n\\nYhdistys viettää vuosipäiväänsä lokakuun 21. päivänä. Yhdistys on perustettu vuonna 1987.\\n\\n## 17 HARRASTUSTOIMINTA\\n\\nYhdistyksen tarkoitusperien kanssa sopusoinnussa olevien harrastusten tukemiseksi ja kehittämiseksi voivat jäsenet\\nperustaa rekisteröimättömän kerhon tai harrastuspiirin, joiden toimintaa yhdistys pyrkii tukemaan mahdollisuuksiensa\\nmukaan.\\n\\n## 18 SÄÄNTÖJEN MUUTTAMINEN JA YHDISTYKSEN PURKAMINEN\\n\\nPäätös sääntöjen muuttamisesta ja yhdistyksen purkamisesta on tehtävä yhdistyksen kokouksessa vähintään kolmen\\nneljäsosan (3/4) enemmistöllä annetuista äänistä. Kokouskutsussa on mainittava sääntöjen muuttamisesta tai yhdistyksen\\npurkamisesta. Yhdistyksen purkautuessa käytetään yhdistyksen varat yhdistyksen tarkoituksen edistämiseen purkamisesta\\npäättävän kokouksen määräämällä tavalla. Yhdistyksen tullessa lakkautetuksi käytetään sen varat samaan tarkoitukseen.\\n\\n## 19 JÄSENOIKEUDET\\n\\nSaavutetut jäsenoikeudet säilyvät.\\n\\n## 20 YHDISTYKSEN TUNNUKSET\\n\\nYhdistyksen tunnuksen sekä arvo- ja kunniamerkkien muodosta päättää yleiskokous. Merkkien jakamisesta päättää hallitus.","rules_en":"Rules of order of Serveri ry\\n1. NAME AND RESIDENCE\\nThe name of the association is Computer Science Students of the University of Eastern Finland - Serveri ry. The registered office of the association is Kuopio.\\n2. PURPOSE AND OPERATION\\nThe purpose of the association is to unite computer science students of the University of Eastern Finland and support their spiritual and material aspirations, both in professional and leisure matters. In order to fulfill its purpose, the association monitors the interests of its members by maintaining connections with other associations, companies and the university's administrative bodies. The association organizes various information, presentation, lecture and discussion events as well as evening parties. The association aims to support its members' field-related studies and study tours. In order to support its activities, the association can also receive grants, donations and bequests, carry out fundraisers and lotteries with the relevant permission, acquire, sell and own movable and immovable property necessary for its activities, or engage in gainful activities that are directly related to the realization of the association's purpose or that are considered to be of low economic value.\\n3 LANGUAGE\\nThe language of the association is Finnish. The minutes are drawn up in Finnish.\\n4 IMPARTIALITY\\nThe association is non-partisan politically.\\n5 MEMBERS\\nMembers can be:\\n\\n     Actual members: Persons enrolled in the University of Eastern Finland (in attendance or absent) studying computer science.\\n     Supporting members: Supporting members can be individuals or legal entities that are interested in the association's activities and want to support it.\\n     Honorary members: A person who has specially supported the association's activities can be called an honorary member. Any of the members can make a proposal to be called an honorary member orally or in writing to the board, which presents the proposal to the association meeting or directly to the association meeting, where a simple majority in a possible vote is sufficient to approve the proposal. All graduated members can be elected honorary members by the board's decision.\\n     Community members: A community member can be a legal entity that is interested in the association's activities and wants to support it.\\n\\nFull members, supporting members and community members are approved by the board of the association upon application. The membership takes effect after the board's decision. Resignation from membership is done by notifying the board of directors or its chairman in writing, or by announcing the resignation in the minutes of the association's meeting. Dismissal due to non-payment of membership fee is decided by the board.\\n6 MEMBER'S OBLIGATIONS\\nThe member has the obligation to notify the association's board of directors of the information required by the Association Act whenever there are changes, but at least every five (5) years.\\n7 MEMBERSHIP FEES\\nThe size of the joining fee and the annual membership fee for regular members and supporting members will be decided separately for each member group by the autumn meeting. The board of the association decides on the membership fees of community members. Honorary presidents and honorary members do not pay membership fees.\\n8 GOVERNMENT\\nThe board consists of the chairman elected at the autumn meeting and at least seven (7), at most fifteen (15) other full members and at least zero (0) and at most five (5) alternate members. The number of regular and alternate members is decided at the autumn meeting. The board's term of office is a calendar year. The board chooses a vice-chairman and a secretary from among themselves, in addition, the board appoints a treasurer and other necessary officials.\\n9 TASKS OF THE BOARD OF DIRECTORS\\nThe board's task is to:\\n\\n     Maintains the membership list\\n     Call a meeting of the association if necessary\\n     Manages the association's affairs and finances according to the rules and the action plan.\\n\\n10 WRITING THE NAME OF THE ASSOCIATION\\nThe name of the association is written by the chairman of the board, the secretary or another member of the board appointed by the board as a signatory, each separately.\\n11 CONVENING THE BOARD OF DIRECTORS\\nThe board meets at the invitation of the chairman or the vice-chairman in his absence, when they consider there is a reason for it or when a member of the board so wishes. The board has quorum if half of the board members, including the chairman or vice chairman, are present and the board members have been informed of the meeting at least three days before the meeting, or if four-fifths (4/5) of the actual members of the board have expressed their consent to holding the meeting earlier. The board of directors decides on the method of convening the meetings in its organizational meeting. Decisions are made in the board by a simple majority with an open vote, unless someone wants a closed ticket vote. In the event of a tie, the vote of the chairman of the meeting is decisive, except for elections by lottery.\\n12 ACCOUNTS\\nThe association's accounting period is a calendar year. The treasurer presents the accounts, a written report on the use of funds and"}	{"rules_fi":"# Serveri ry:n järjestyssäännöt\\n\\n## 1. NIMI JA KOTIPAIKKA\\n\\nYhdistyksen nimi on Itä-Suomen yliopiston tietojenkäsittelytieteen opiskelijat - Serveri ry. Yhdistyksen kotipaikka on\\nKuopio.\\n\\n## 2. TARKOITUS JA TOIMINTA\\n\\nYhdistyksen tarkoituksena on yhdistää Itä-Suomen yliopiston tietojenkäsittelytieteen opiskelijoita ja tukea heidän\\nhenkisiä sekä aineellisia pyrkimyksiään, niin ammattiin liittyvissä kuin vapaa-ajan kysymyksissä. Tarkoituksensa\\ntoteuttamiseksi yhdistys valvoo jäsentensä etuja pitämällä yhteyksiä muihin yhdistyksiin, yrityksiin ja yliopiston\\nhallintoelimiin. Yhdistys järjestää erilaisia informaatio-, esitelmä-, luento-, ja keskustelutilaisuuksia sekä\\nillanviettoja. Yhdistys pyrkii tukemaan jäsentensä alaan liittyviä opintoja ja opintomatkoja. Toimintansa tukemiseksi\\nyhdistys voi myös vastaanottaa avustuksia, lahjoituksia ja testamentteja, panna toimeen asianomaisella luvalla\\nrahankeräyksiä ja arpajaisia, hankkia, myydä ja omistaa toimintaansa varten tarpeellista irtainta että kiinteätä\\nomaisuutta tai harjoittaa välittömästi yhdistyksen tarkoituksen toteuttamiseen liittyvää tai taloudellisesti\\nvähäarvoisena pidettävää ansiotoimintaa.\\n\\n## 3 KIELI\\n\\nYhdistyksen kielenä on suomi. Pöytäkirjat laaditaan suomen kielellä.\\n\\n## 4 PUOLUEETTOMUUS\\n\\nYhdistys on puoluepoliittisesti sitoutumaton.\\n\\n## 5 JÄSENET\\n\\nJäseniä voivat olla:\\n\\n1. Varsinaiset jäsenet: Itä-Suomen yliopistossa kirjoilla olevat (läsnä- tai poissaolevana) tietojenkäsittelytiedettä\\n   opiskelevat henkilöt.\\n2. Kannatusjäsenet: Kannatusjäseniä voivat olla henkilöt tai oikeuskelpoiset yhteisöt, jotka ovat kiinnostuneita\\n   yhdistyksen toiminnasta ja haluavat tukea sitä.\\n3. Kunniajäsenet: Kunniajäseneksi voidaan kutsua henkilö, joka on erikoisesti tukenut yhdistyksen toimintaa. Ehdotuksen\\n   kunniajäseneksi kutsumisesta voi tehdä kuka tahansa jäsenistä suullisesti tai kirjallisesti hallitukselle, joka\\n   esittää ehdotuksen yhdistyksen kokoukselle tai suoraan yhdistyksen kokoukselle, jossa riittää yksinkertainen\\n   enemmistö mahdollisessa äänestyksessä esityksen hyväksymiseksi. Kaikki valmistuneet jäsenet voidaan hallituksen\\n   päätöksellä valita kunniajäseneksi.\\n4. Yhteisöjäsenet: Yhteisöjäsen voi olla oikeuskelpoinen yhteisö, joka on kiinnostunut yhdistyksen toiminnasta ja haluaa\\n   tukea sitä.\\n\\nVarsinaiset jäsenet, kannatusjäsenet ja yhteisöjäsenet hyväksyy hakemuksesta yhdistyksen hallitus. Jäsenyys astuu\\nvoimaan hallituksen päätöksen jälkeen. Jäsenyydestä eroaminen tapahtuu ilmoittamalla siitä kirjallisesti hallitukselle\\ntai sen puheenjohtajalle tai ilmoittamalla erosta yhdistyksen kokouksessa pöytäkirjaan merkittäväksi. Erottamisesta\\njäsenmaksun maksamatta jättämisen vuoksi päättää hallitus.\\n\\n## 6 JÄSENEN VELVOLLISUUDET\\n\\nJäsenellä on velvollisuus ilmoittaa yhdistyslain määräämät tiedot yhdistyksen hallitukselle aina muutosten yhteydessä,\\nkuitenkin vähintään viiden (5) vuoden välein.\\n\\n## 7 JÄSENMAKSUT\\n\\nVarsinaisten jäsenten ja kannatusjäsenten liittymismaksun ja vuotuisen jäsenmaksun suuruudesta erikseen kullekin\\njäsenryhmälle päättää syyskokous. Yhteisöjäsenten jäsenmaksuista päättää yhdistyksen hallitus. Kunniapuheenjohtajat ja\\nkunniajäsenet eivät suorita jäsenmaksuja.\\n\\n## 8 HALLITUS\\n\\nHallituksen muodostavat syyskokouksessa valitut puheenjohtaja ja vähintään seitsemän (7), enintään viisitoista (15)\\nmuuta varsinaista jäsentä sekä vähintään nolla (0) ja enintään viisi (5) varajäsentä. Varsinaisten ja varajäsenten\\nlukumäärä päätetään syyskokouksessa. Hallituksen toimikausi on kalenterivuosi. Hallitus valitsee keskuudestaan\\nvarapuheenjohtajan ja sihteerin, lisäksi hallitus nimittää rahastonhoitajan sekä muut tarvittavat toimihenkilöt.\\n\\n## 9 HALLITUKSEN TEHTÄVÄT\\n\\nHallituksen tehtävänä on:\\n\\n1. Pitää yllä jäsenluetteloa\\n2. Kutsua yhdistyksen kokous tarvittaessa koolle\\n3. Hoitaa yhdistyksen asioita sekä taloutta sääntöjen ja toimintasuunnitelman mukaan.\\n\\n## 10 YHDISTYKSEN NIMEN KIRJOITTAMINEN\\n\\nYhdistyksen nimen kirjoittaa hallituksen puheenjohtaja, sihteeri tai muu hallituksen jäsen jonka hallitus on\\nnimenkirjoittajaksi määrännyt, kukin erikseen.\\n\\n## 11 HALLITUKSEN KOOLLE KUTSUMINEN\\n\\nHallitus kokoontuu puheenjohtajan tai hänen estyneenä ollessaan varapuheenjohtajan kutsusta, kun he katsovat siihen\\nolevan aihetta tai jonkun hallituksen jäsenen niin halutessa. Hallitus on päätösvaltainen, mikäli puolet hallituksen\\njäsenistä puheenjohtaja tai varapuheenjohtaja mukaan lukien on paikalla ja kokouksesta on tiedotettu hallituksen\\njäsenille vähintään kolme vuorokautta ennen kokousta tai mikäli neljä viidesosaa (4/5) hallituksen varsinaisista\\njäsenistä on ilmaissut suostumuksensa kokouksen järjestämiseen aikaisemmin. Hallitus päättää kokousten\\nkoollekutsumistavasta järjestäytymiskokouksessaan. Päätökset tehdään hallituksessa yksinkertaisella enemmistöllä\\navoimella äänestyksellä, ellei joku halua suljettua lippuäänestystä. Äänten mennessä tasan kokouksen puheenjohtajan ääni\\nratkaisee, paitsi vaaleissa arpa.\\n\\n## 12 TILIT\\n\\nYhdistyksen tilikausi on kalenterivuosi. Rahastonhoitaja esittää tilit, kirjallisen selonteon varojen käytöstä ja\\ntaloudellisesta asemasta hallitukselle tilikautta seuraavan tammikuun 15. päivään mennessä. Hallitus laatii\\npuheenjohtajan ja sihteerin johdolla toimintakertomuksen. Tilinpäätös tarvittavine asiakirjoineen ja hallituksen\\nvuosikertomus on annettava toiminnantarkastajille viimeistään kolme viikkoa ennen kevätkokousta. Toiminnantarkastajien\\ntulee antaa kirjallinen lausuntonsa viimeistään kaksi viikkoa ennen kevätkokousta hallitukselle. Hallitus esittää\\ntilinpäätöksen ja toiminnantarkastajien lausunnon sekä toimintakertomuksen yhdistyksen kevätkokoukselle.\\n\\n## 13 YHDISTYKSEN KOKOUKSEN KOOLLE KUTSUMINEN\\n\\nYhdistyksen kevät- ja syyskokouksen ja ylimääräisen kokouksen koolle kutsuminen tapahtuu ilmoituksella viimeistään\\nviikkoa ennen kokousta yhdistyksen ilmoitustaululla. Ylimääräinen kokous pidetään, jos hallitus katsoo siihen olevan\\naihetta tai jos vähintään yksi kahdeskymmenesosa (1/20) tai 30 yhdistyksen äänioikeutetuista jäsenistä sitä\\nhallitukselta erityisesti ilmoitettua asiaa varten kirjallisesti vaatii.\\n\\n## 14 VUOSIKOKOUKSET\\n\\nYhdistyksen kevätkokous pidetään helmikuussa. Kokouksessa käsitellään vähintään seuraavat asiat:\\n\\n1. Todetaan kokouksen laillisuus ja päätösvaltaisuus.\\n2. Valitaan kokoukselle puheenjohtaja, sihteeri ja kaksi pöytäkirjantarkastajaa sekä ääntenlaskijaa.\\n3. Vahvistetaan kokouksen esityslista.\\n4. Esitetään edellisen vuoden toimintakertomus.\\n5. Esitetään toiminnantarkastajien lausunto. Vahvistetaan tilinpäätös ja päätetään vastuuvapauden myöntämisestä tilivelvollisille.\\n6. Käsitellään muut kokouksessa mahdolliset esille tulevat asiat.\\n\\nYhdistyksen syyskokous pidetään marraskuussa, kokouksessa käsitellään vähintään seuraavat asiat:\\n\\n1. Todetaan kokouksen laillisuus ja päätösvaltaisuus.\\n2. Valitaan kokoukselle puheenjohtaja, sihteeri ja kaksi pöytäkirjantarkastajaa sekä ääntenlaskijaa.\\n3. Vahvistetaan kokouksen esityslista.\\n4. Päätetään yhdistyksen mahdollisten toimihenkilöiden palkkioista ja korvauksista.\\n5. Esitetään toimintasuunnitelma tulevalle vuodelle.\\n6. Käsitellään ja vahvistetaan hallituksen laatima tulo- ja menoarvioehdotus sekä jäsenmaksujen suuruus.\\n7. Valitaan kaksi toiminnantarkastajaa ja kaksi varatoiminnantarkastajaa.\\n8. Valitaan yhdistyksen hallitukselle puheenjohtaja.\\n9. Päätetään hallituksen jäsenten määrä.\\n10. Valitaan muut hallituksen jäsenet.\\n11. Käsitellään muut kokouksessa esille tulevat asiat\\n\\nMikäli yhdistyksen jäsen haluaa saada jonkin asian yhdistyksen kevät- tai syyskokouksen käsiteltäväksi, on hänen\\nilmoitettava siitä kirjallisesti hallitukselle viimeistään kaksi viikkoa ennen kokousta, että asia voidaan sisällyttää\\nkokouskutsuun.\\n\\n## 15 ÄÄNIOIKEUS\\n\\nYhdistyksen kokouksissa on jokaisella varsinaisella jäsenellä yksi ääni. Kunnia-, kannatus- ja yhteisöjäsenellä on\\nläsnäolo- ja puheoikeus, mutta ei äänioikeutta yhdistyksen kokouksessa. Äänten mennessä tasan puheenjohtajan ääni\\nratkaisee, vaaleissa kuitenkin arpa. Äänestys tulee suorittaa suljettuna lippuäänestyksenä, mikäli joku jäsenistä niin\\nhaluaa.\\n\\n## 16 VUOSIPÄIVÄ\\n\\nYhdistys viettää vuosipäiväänsä lokakuun 21. päivänä. Yhdistys on perustettu vuonna 1987.\\n\\n## 17 HARRASTUSTOIMINTA\\n\\nYhdistyksen tarkoitusperien kanssa sopusoinnussa olevien harrastusten tukemiseksi ja kehittämiseksi voivat jäsenet\\nperustaa rekisteröimättömän kerhon tai harrastuspiirin, joiden toimintaa yhdistys pyrkii tukemaan mahdollisuuksiensa\\nmukaan.\\n\\n## 18 SÄÄNTÖJEN MUUTTAMINEN JA YHDISTYKSEN PURKAMINEN\\n\\nPäätös sääntöjen muuttamisesta ja yhdistyksen purkamisesta on tehtävä yhdistyksen kokouksessa vähintään kolmen\\nneljäsosan (3/4) enemmistöllä annetuista äänistä. Kokouskutsussa on mainittava sääntöjen muuttamisesta tai yhdistyksen\\npurkamisesta. Yhdistyksen purkautuessa käytetään yhdistyksen varat yhdistyksen tarkoituksen edistämiseen purkamisesta\\npäättävän kokouksen määräämällä tavalla. Yhdistyksen tullessa lakkautetuksi käytetään sen varat samaan tarkoitukseen.\\n\\n## 19 JÄSENOIKEUDET\\n\\nSaavutetut jäsenoikeudet säilyvät.\\n\\n## 20 YHDISTYKSEN TUNNUKSET\\n\\nYhdistyksen tunnuksen sekä arvo- ja kunniamerkkien muodosta päättää yleiskokous. Merkkien jakamisesta päättää hallitus.","user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-29T11:32:32.086Z"}	\N
170	178	serveri_rules	1	{"id":1,"user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-29T11:37:48.747Z","rules_fi":"# Serveri ry:n järjestyssäännöt\\n\\n## 1. NIMI JA KOTIPAIKKA\\n\\nYhdistyksen nimi on Itä-Suomen yliopiston tietojenkäsittelytieteen opiskelijat - Serveri ry. Yhdistyksen kotipaikka on\\nKuopio.\\n\\n## 2. TARKOITUS JA TOIMINTA\\n\\nYhdistyksen tarkoituksena on yhdistää Itä-Suomen yliopiston tietojenkäsittelytieteen opiskelijoita ja tukea heidän\\nhenkisiä sekä aineellisia pyrkimyksiään, niin ammattiin liittyvissä kuin vapaa-ajan kysymyksissä. Tarkoituksensa\\ntoteuttamiseksi yhdistys valvoo jäsentensä etuja pitämällä yhteyksiä muihin yhdistyksiin, yrityksiin ja yliopiston\\nhallintoelimiin. Yhdistys järjestää erilaisia informaatio-, esitelmä-, luento-, ja keskustelutilaisuuksia sekä\\nillanviettoja. Yhdistys pyrkii tukemaan jäsentensä alaan liittyviä opintoja ja opintomatkoja. Toimintansa tukemiseksi\\nyhdistys voi myös vastaanottaa avustuksia, lahjoituksia ja testamentteja, panna toimeen asianomaisella luvalla\\nrahankeräyksiä ja arpajaisia, hankkia, myydä ja omistaa toimintaansa varten tarpeellista irtainta että kiinteätä\\nomaisuutta tai harjoittaa välittömästi yhdistyksen tarkoituksen toteuttamiseen liittyvää tai taloudellisesti\\nvähäarvoisena pidettävää ansiotoimintaa.\\n\\n## 3 KIELI\\n\\nYhdistyksen kielenä on suomi. Pöytäkirjat laaditaan suomen kielellä.\\n\\n## 4 PUOLUEETTOMUUS\\n\\nYhdistys on puoluepoliittisesti sitoutumaton.\\n\\n## 5 JÄSENET\\n\\nJäseniä voivat olla:\\n\\n1. Varsinaiset jäsenet: Itä-Suomen yliopistossa kirjoilla olevat (läsnä- tai poissaolevana) tietojenkäsittelytiedettä\\n   opiskelevat henkilöt.\\n2. Kannatusjäsenet: Kannatusjäseniä voivat olla henkilöt tai oikeuskelpoiset yhteisöt, jotka ovat kiinnostuneita\\n   yhdistyksen toiminnasta ja haluavat tukea sitä.\\n3. Kunniajäsenet: Kunniajäseneksi voidaan kutsua henkilö, joka on erikoisesti tukenut yhdistyksen toimintaa. Ehdotuksen\\n   kunniajäseneksi kutsumisesta voi tehdä kuka tahansa jäsenistä suullisesti tai kirjallisesti hallitukselle, joka\\n   esittää ehdotuksen yhdistyksen kokoukselle tai suoraan yhdistyksen kokoukselle, jossa riittää yksinkertainen\\n   enemmistö mahdollisessa äänestyksessä esityksen hyväksymiseksi. Kaikki valmistuneet jäsenet voidaan hallituksen\\n   päätöksellä valita kunniajäseneksi.\\n4. Yhteisöjäsenet: Yhteisöjäsen voi olla oikeuskelpoinen yhteisö, joka on kiinnostunut yhdistyksen toiminnasta ja haluaa\\n   tukea sitä.\\n\\nVarsinaiset jäsenet, kannatusjäsenet ja yhteisöjäsenet hyväksyy hakemuksesta yhdistyksen hallitus. Jäsenyys astuu\\nvoimaan hallituksen päätöksen jälkeen. Jäsenyydestä eroaminen tapahtuu ilmoittamalla siitä kirjallisesti hallitukselle\\ntai sen puheenjohtajalle tai ilmoittamalla erosta yhdistyksen kokouksessa pöytäkirjaan merkittäväksi. Erottamisesta\\njäsenmaksun maksamatta jättämisen vuoksi päättää hallitus.\\n\\n## 6 JÄSENEN VELVOLLISUUDET\\n\\nJäsenellä on velvollisuus ilmoittaa yhdistyslain määräämät tiedot yhdistyksen hallitukselle aina muutosten yhteydessä,\\nkuitenkin vähintään viiden (5) vuoden välein.\\n\\n## 7 JÄSENMAKSUT\\n\\nVarsinaisten jäsenten ja kannatusjäsenten liittymismaksun ja vuotuisen jäsenmaksun suuruudesta erikseen kullekin\\njäsenryhmälle päättää syyskokous. Yhteisöjäsenten jäsenmaksuista päättää yhdistyksen hallitus. Kunniapuheenjohtajat ja\\nkunniajäsenet eivät suorita jäsenmaksuja.\\n\\n## 8 HALLITUS\\n\\nHallituksen muodostavat syyskokouksessa valitut puheenjohtaja ja vähintään seitsemän (7), enintään viisitoista (15)\\nmuuta varsinaista jäsentä sekä vähintään nolla (0) ja enintään viisi (5) varajäsentä. Varsinaisten ja varajäsenten\\nlukumäärä päätetään syyskokouksessa. Hallituksen toimikausi on kalenterivuosi. Hallitus valitsee keskuudestaan\\nvarapuheenjohtajan ja sihteerin, lisäksi hallitus nimittää rahastonhoitajan sekä muut tarvittavat toimihenkilöt.\\n\\n## 9 HALLITUKSEN TEHTÄVÄT\\n\\nHallituksen tehtävänä on:\\n\\n1. Pitää yllä jäsenluetteloa\\n2. Kutsua yhdistyksen kokous tarvittaessa koolle\\n3. Hoitaa yhdistyksen asioita sekä taloutta sääntöjen ja toimintasuunnitelman mukaan.\\n\\n## 10 YHDISTYKSEN NIMEN KIRJOITTAMINEN\\n\\nYhdistyksen nimen kirjoittaa hallituksen puheenjohtaja, sihteeri tai muu hallituksen jäsen jonka hallitus on\\nnimenkirjoittajaksi määrännyt, kukin erikseen.\\n\\n## 11 HALLITUKSEN KOOLLE KUTSUMINEN\\n\\nHallitus kokoontuu puheenjohtajan tai hänen estyneenä ollessaan varapuheenjohtajan kutsusta, kun he katsovat siihen\\nolevan aihetta tai jonkun hallituksen jäsenen niin halutessa. Hallitus on päätösvaltainen, mikäli puolet hallituksen\\njäsenistä puheenjohtaja tai varapuheenjohtaja mukaan lukien on paikalla ja kokouksesta on tiedotettu hallituksen\\njäsenille vähintään kolme vuorokautta ennen kokousta tai mikäli neljä viidesosaa (4/5) hallituksen varsinaisista\\njäsenistä on ilmaissut suostumuksensa kokouksen järjestämiseen aikaisemmin. Hallitus päättää kokousten\\nkoollekutsumistavasta järjestäytymiskokouksessaan. Päätökset tehdään hallituksessa yksinkertaisella enemmistöllä\\navoimella äänestyksellä, ellei joku halua suljettua lippuäänestystä. Äänten mennessä tasan kokouksen puheenjohtajan ääni\\nratkaisee, paitsi vaaleissa arpa.\\n\\n## 12 TILIT\\n\\nYhdistyksen tilikausi on kalenterivuosi. Rahastonhoitaja esittää tilit, kirjallisen selonteon varojen käytöstä ja\\ntaloudellisesta asemasta hallitukselle tilikautta seuraavan tammikuun 15. päivään mennessä. Hallitus laatii\\npuheenjohtajan ja sihteerin johdolla toimintakertomuksen. Tilinpäätös tarvittavine asiakirjoineen ja hallituksen\\nvuosikertomus on annettava toiminnantarkastajille viimeistään kolme viikkoa ennen kevätkokousta. Toiminnantarkastajien\\ntulee antaa kirjallinen lausuntonsa viimeistään kaksi viikkoa ennen kevätkokousta hallitukselle. Hallitus esittää\\ntilinpäätöksen ja toiminnantarkastajien lausunnon sekä toimintakertomuksen yhdistyksen kevätkokoukselle.\\n\\n## 13 YHDISTYKSEN KOKOUKSEN KOOLLE KUTSUMINEN\\n\\nYhdistyksen kevät- ja syyskokouksen ja ylimääräisen kokouksen koolle kutsuminen tapahtuu ilmoituksella viimeistään\\nviikkoa ennen kokousta yhdistyksen ilmoitustaululla. Ylimääräinen kokous pidetään, jos hallitus katsoo siihen olevan\\naihetta tai jos vähintään yksi kahdeskymmenesosa (1/20) tai 30 yhdistyksen äänioikeutetuista jäsenistä sitä\\nhallitukselta erityisesti ilmoitettua asiaa varten kirjallisesti vaatii.\\n\\n## 14 VUOSIKOKOUKSET\\n\\nYhdistyksen kevätkokous pidetään helmikuussa. Kokouksessa käsitellään vähintään seuraavat asiat:\\n\\n1. Todetaan kokouksen laillisuus ja päätösvaltaisuus.\\n2. Valitaan kokoukselle puheenjohtaja, sihteeri ja kaksi pöytäkirjantarkastajaa sekä ääntenlaskijaa.\\n3. Vahvistetaan kokouksen esityslista.\\n4. Esitetään edellisen vuoden toimintakertomus.\\n5. Esitetään toiminnantarkastajien lausunto. Vahvistetaan tilinpäätös ja päätetään vastuuvapauden myöntämisestä tilivelvollisille.\\n6. Käsitellään muut kokouksessa mahdolliset esille tulevat asiat.\\n\\nYhdistyksen syyskokous pidetään marraskuussa, kokouksessa käsitellään vähintään seuraavat asiat:\\n\\n1. Todetaan kokouksen laillisuus ja päätösvaltaisuus.\\n2. Valitaan kokoukselle puheenjohtaja, sihteeri ja kaksi pöytäkirjantarkastajaa sekä ääntenlaskijaa.\\n3. Vahvistetaan kokouksen esityslista.\\n4. Päätetään yhdistyksen mahdollisten toimihenkilöiden palkkioista ja korvauksista.\\n5. Esitetään toimintasuunnitelma tulevalle vuodelle.\\n6. Käsitellään ja vahvistetaan hallituksen laatima tulo- ja menoarvioehdotus sekä jäsenmaksujen suuruus.\\n7. Valitaan kaksi toiminnantarkastajaa ja kaksi varatoiminnantarkastajaa.\\n8. Valitaan yhdistyksen hallitukselle puheenjohtaja.\\n9. Päätetään hallituksen jäsenten määrä.\\n10. Valitaan muut hallituksen jäsenet.\\n11. Käsitellään muut kokouksessa esille tulevat asiat\\n\\nMikäli yhdistyksen jäsen haluaa saada jonkin asian yhdistyksen kevät- tai syyskokouksen käsiteltäväksi, on hänen\\nilmoitettava siitä kirjallisesti hallitukselle viimeistään kaksi viikkoa ennen kokousta, että asia voidaan sisällyttää\\nkokouskutsuun.\\n\\n## 15 ÄÄNIOIKEUS\\n\\nYhdistyksen kokouksissa on jokaisella varsinaisella jäsenellä yksi ääni. Kunnia-, kannatus- ja yhteisöjäsenellä on\\nläsnäolo- ja puheoikeus, mutta ei äänioikeutta yhdistyksen kokouksessa. Äänten mennessä tasan puheenjohtajan ääni\\nratkaisee, vaaleissa kuitenkin arpa. Äänestys tulee suorittaa suljettuna lippuäänestyksenä, mikäli joku jäsenistä niin\\nhaluaa.\\n\\n## 16 VUOSIPÄIVÄ\\n\\nYhdistys viettää vuosipäiväänsä lokakuun 21. päivänä. Yhdistys on perustettu vuonna 1987.\\n\\n## 17 HARRASTUSTOIMINTA\\n\\nYhdistyksen tarkoitusperien kanssa sopusoinnussa olevien harrastusten tukemiseksi ja kehittämiseksi voivat jäsenet\\nperustaa rekisteröimättömän kerhon tai harrastuspiirin, joiden toimintaa yhdistys pyrkii tukemaan mahdollisuuksiensa\\nmukaan.\\n\\n## 18 SÄÄNTÖJEN MUUTTAMINEN JA YHDISTYKSEN PURKAMINEN\\n\\nPäätös sääntöjen muuttamisesta ja yhdistyksen purkamisesta on tehtävä yhdistyksen kokouksessa vähintään kolmen\\nneljäsosan (3/4) enemmistöllä annetuista äänistä. Kokouskutsussa on mainittava sääntöjen muuttamisesta tai yhdistyksen\\npurkamisesta. Yhdistyksen purkautuessa käytetään yhdistyksen varat yhdistyksen tarkoituksen edistämiseen purkamisesta\\npäättävän kokouksen määräämällä tavalla. Yhdistyksen tullessa lakkautetuksi käytetään sen varat samaan tarkoitukseen.\\n\\n## 19 JÄSENOIKEUDET\\n\\nSaavutetut jäsenoikeudet säilyvät.\\n\\n## 20 YHDISTYKSEN TUNNUKSET\\n\\nYhdistyksen tunnuksen sekä arvo- ja kunniamerkkien muodosta päättää yleiskokous. Merkkien jakamisesta päättää hallitus.","rules_en":"# Serveri ry's rules of order\\n\\n## 1. NAME AND SEAT\\n\\nThe name of the association is Students of Computer Science at the University of Eastern Finland - Serveri ry. The registered office of the association is\\nKuopio.\\n\\n## 2. PURPOSE AND ACTIVITIES\\n\\nThe purpose of the association is to unite students of Computer Science at the University of Eastern Finland and to support their work in the field of computer science.\\nintellectual and material aspirations, both in professional and recreational matters. Its purpose\\ninterests of its members by maintaining contacts with other associations, companies and the university.\\nadministrative bodies. The association organises various information, presentation, lecture and discussion events, and\\nevening events. The association aims to support the studies and study trips of its members. To support its activities\\nthe Association may also receive grants, donations and bequests, and may, with the permission of the person concerned, carry out\\nfund-raising and raffles, acquire, sell and own movable and immovable property necessary for its activities.\\nproperty, or to engage in any activity directly related to the realisation of the objects of the association or economically related to the realisation of the objects of the association\\nconsidered to be of negligible economic value.\\n\\n## 3 LANGUAGE\\n\\nThe language of the Association is Finnish. Minutes shall be drawn up in Finnish.\\n\\n## 4 IMPARTIALITY\\n\\nThe Association is politically neutral.\\n\\n## 5 MEMBERS\\n\\nMembers can be:\\n\\n1. Full members: persons enrolled at the University of Eastern Finland (present or absent) in the field of computer science.\\n   Students of Computer Science (current or present).\\n2. Sustaining members: Sustaining members may be individuals or legal entities with an interest in the field of computer science.\\n   and wish to support the activities of the association.\\n3. Honorary members: A person who has made a special contribution to the activities of the Association may be invited to become an honorary member. The proposal is submitted to\\n   any member may make a proposal for honorary membership, orally or in writing, to the Board of Directors, which shall invite the member to become an honorary member.\\n   The proposal may be submitted to the Association's General Assembly or directly to the Association's General Assembly, where a simple majority is sufficient.\\n   majority of the votes cast, if any, to approve the proposal. Any graduate member may be elected by the Board of\\n   by decision of the Board.\\n4. Community members: Community members may be any legal entity interested in the activities of the Association and wishing to\\n   The association may be supported by a legal entity who is interested in the association and who wishes to support it.\\n\\nFull members, sustaining members and community members shall be approved by the Board of Directors of the Association upon application. Membership takes effect from the date of application.\\nThe membership of a member, in addition to the members, shall take effect after the decision of the Board of Directors. Withdrawal from membership shall be effected by written notification to the Board of Directors.\\nor its President or by announcing the resignation at a meeting of the Association to be recorded in the minutes. For resignation\\nfor non-payment of the membership fee shall be decided by the Board of Directors.\\n\\n## 6 OBLIGATIONS OF THE MEMBER\\n\\nMembers are obliged to inform the Board of Directors of the Association of the information required by the Association Act whenever changes occur,\\nat least every five (5) years.\\n\\n## 7 MEMBERSHIP FEES\\n\\nThe amount of the joining fee and the annual membership fee for full members and sustaining members shall be set separately for each of the following.\\nfor each category of member shall be decided by the Autumn Meeting. The membership fees for Community members are decided by the Board of Directors of the Association. Honorary Presidents and\\nhonorary members do not pay membership fees.\\n\\n## 8 BOARD OF DIRECTORS\\n\\nThe Board of Directors shall consist of a President elected at the Autumn Meeting and a minimum of seven (7) and a maximum of fifteen (15) members.\\nother full members and at least zero (0) and no more than five (5) alternate members. The number of full and alternate members shall be\\nshall be decided at the Autumn Meeting. The term of office of the Board of Directors shall be one calendar year. The Board shall elect from among its members\\nThe Board of Directors shall appoint from among its members a Vice-Chairman and a Secretary, and shall appoint a Treasurer and other necessary officers.\\n\\n## 9 FUNCTIONS OF THE BOARD\\n\\nThe tasks of the Board of Directors are:\\n\\n1. Maintain the list of members\\n2. to convene meetings of the Association when necessary\\n3. Call the meeting of the General Assembly at 3.00 a.m. Call the General Assembly at 3.00 a.m. Call the meeting at 3.00 a.m.\\n\\n## 10 WRITING THE NAME OF THE ASSOCIATION\\n\\nThe name of the Association shall be written by the Chairman of the Board, the Secretary or any other member of the Board whose name is\\nThe secretary, the secretary or the board of directors, as designated by the board of directors, shall sign the name of the association, each individually.\\n\\n## 11 CONVENING OF MEETINGS OF THE BOARD OF DIRECTORS\\n\\nThe Board of Directors shall meet at the call of the Chairman or, in his absence, the Vice-Chairman, whenever they deem it necessary.\\nwhen they deem it necessary or at the request of a member of the Board of Directors. A quorum shall exist if half of the members of the Board of Directors\\nmembers, including the Chairman or Vice-Chairman, are present and notice of the meeting has been given to the Board of Directors.\\nmembers at least three days before the meeting, or if four fifths (4/5) of the members of the Board of Directors are present at the meeting.\\nof the members of the Board have given their prior consent to the holding of the meeting. The Board of Directors shall decide on the meetings\\nat its organizational meeting. Decisions are taken by a simple majority of the Board.\\nby open ballot, unless a person wishes to have a closed ballot. In the event of a tie, the chairman of the meeting shall have the casting vote.\\nshall have the casting vote, except in the case of elections by lot.\\n\\n## 12 ACCOUNTS\\n\\nThe financial year of the Association shall be the calendar year. The treasurer shall present the accounts, a written statement of the use of the funds and a\\nfinancial position to the Board of Directors by 15 January following the end of the financial year. The Board shall draw up\\nunder the direction of the President and the Secretary, a report on its activities. The financial statements, together with the necessary documents and the\\nthe annual report of the Board of Directors and the annual report of the Board of Directors shall be submitted to the auditors at least three weeks before the spring meeting. For the auditors\\nshall submit their written opinion to the Governing Board no later than two weeks before the spring meeting. The Board of Directors shall propose\\nthe financial statements and the opinion of the auditors, together with the report of the auditors, to the Spring Assembly of the Association.\\n\\n## 13 CONVENING A MEETING OF THE ASSOCIATION\\n\\nThe convening of the spring and autumn meetings and extraordinary meetings of the Association shall be convened by notice given no later than.\\none week before the meeting on the notice board of the Association. An extraordinary meeting shall be held if the Board of Directors considers it necessary.\\nor if at least one twentieth (1/20) or 30 of the members of the Association with voting rights so request.\\nthe Board of Directors in writing for a specifically notified matter.\\n\\n## 14 ANNUAL MEETINGS\\n\\nThe Spring Meeting of the Association shall be held in February. The meeting shall consider at least the following matters:\\n\\n1. to establish the legality and quorum of the meeting.\\n2. to elect a chairman, a secretary, two scrutineers and a scrutineer.\\n3. To approve the agenda for the meeting.\\n4. to present the report of the previous year's activities.\\n5. Presentation of the auditors' report. Approval of the accounts and decision on the discharge to the accounting officers.\\n6. to consider any other business that may arise at the meeting.\\n\\nThe Association's autumn meeting will be held in November, at which at least the following items will be discussed:\\n\\n1. to establish the legality and quorum of the meeting.\\n2. to elect a chairman, a secretary, two scrutineers of the minutes and a scrutineer of the votes.\\n3. To approve the agenda of the meeting.\\n4. to decide on the remuneration and compensation of any officers of the Association.\\n5. to present an action plan for the coming year.\\n6. to consider and approve the proposed budget of income and expenditure and the amount of membership fees, as prepared by the Board of Directors.\\n7. to elect two auditors and two deputy auditors.\\n8. To elect a Chairman of the Board of the Association.\\n9. to decide on the number of members of the Board of Directors.\\n10. to elect the other members of the Board of Directors.\\n11. to consider any other business to be transacted at the meeting\\n\\nIf a member of the Association wishes to have a matter brought before the Spring or Autumn Meeting of the Association, he/she must\\nto the Board of Directors at least two weeks before the meeting so that the matter can be included in the agenda of the next general meeting.\\nbe included in the notice of the meeting.\\n\\n## 15 VOTING RIGHTS\\n\\nAt meetings of the Association, each full member shall have one vote. An honorary, supporting and corporate member shall have\\nhave the right to attend and speak, but not to vote, at meetings of the Association. In the event of a tie, the President shall have the vote of\\nshall have the casting vote, but in the case of elections, the election shall be by lot. Voting shall be by closed ballot if any member so decides.\\nif one of the members wishes.\\n\\n## 16TH ANNIVERSARY\\n\\nThe Association shall celebrate its anniversary on 21 October. The Association was founded in 1987.\\n\\n## 17 RECREATIONAL ACTIVITIES\\n\\nIn order to support and develop hobbies consistent with the purposes of the Association, members may\\nestablish an unregistered club or hobby group, the activities of which the Association shall endeavour to support as far as possible\\nas far as possible.\\n\\n\\n## 18 AMENDMENT OF THE STATUTES AND DISSOLUTION OF THE ASSOCIATION\\n\\nThe decision to amend the statutes and dissolve the association must be taken at a meeting of the association at least three\\nmajority of three quarters (3/4) of the votes cast. The notice of the meeting shall state that the amendment of the Statutes or the dissolution of the Association\\ndissolution. In the event of the dissolution of the Association, the assets of the Association shall be used to further the purposes of the Association.\\nin the manner determined by the meeting which decides on the dissolution of the association. If the Association is dissolved, its assets shall be used for the same purpose.\\n\\n## 19 MEMBERSHIP RIGHTS\\n\\nThe membership rights acquired shall be maintained.\\n\\n## 20 ASSOCIATION SYMBOLS\\n\\nThe form of the Association's emblem and of the decorations and medals shall be decided by the General Assembly. The distribution of the badges is decided by the Board of Directors.\\n\\n"}	{"rules_en":"# Serveri ry's rules of order\\n\\n## 1. NAME AND SEAT\\n\\nThe name of the association is Students of Computer Science at the University of Eastern Finland - Serveri ry. The registered office of the association is\\nKuopio.\\n\\n## 2. PURPOSE AND ACTIVITIES\\n\\nThe purpose of the association is to unite students of Computer Science at the University of Eastern Finland and to support their work in the field of computer science.\\nintellectual and material aspirations, both in professional and recreational matters. Its purpose\\ninterests of its members by maintaining contacts with other associations, companies and the university.\\nadministrative bodies. The association organises various information, presentation, lecture and discussion events, and\\nevening events. The association aims to support the studies and study trips of its members. To support its activities\\nthe Association may also receive grants, donations and bequests, and may, with the permission of the person concerned, carry out\\nfund-raising and raffles, acquire, sell and own movable and immovable property necessary for its activities.\\nproperty, or to engage in any activity directly related to the realisation of the objects of the association or economically related to the realisation of the objects of the association\\nconsidered to be of negligible economic value.\\n\\n## 3 LANGUAGE\\n\\nThe language of the Association is Finnish. Minutes shall be drawn up in Finnish.\\n\\n## 4 IMPARTIALITY\\n\\nThe Association is politically neutral.\\n\\n## 5 MEMBERS\\n\\nMembers can be:\\n\\n1. Full members: persons enrolled at the University of Eastern Finland (present or absent) in the field of computer science.\\n   Students of Computer Science (current or present).\\n2. Sustaining members: Sustaining members may be individuals or legal entities with an interest in the field of computer science.\\n   and wish to support the activities of the association.\\n3. Honorary members: A person who has made a special contribution to the activities of the Association may be invited to become an honorary member. The proposal is submitted to\\n   any member may make a proposal for honorary membership, orally or in writing, to the Board of Directors, which shall invite the member to become an honorary member.\\n   The proposal may be submitted to the Association's General Assembly or directly to the Association's General Assembly, where a simple majority is sufficient.\\n   majority of the votes cast, if any, to approve the proposal. Any graduate member may be elected by the Board of\\n   by decision of the Board.\\n4. Community members: Community members may be any legal entity interested in the activities of the Association and wishing to\\n   The association may be supported by a legal entity who is interested in the association and who wishes to support it.\\n\\nFull members, sustaining members and community members shall be approved by the Board of Directors of the Association upon application. Membership takes effect from the date of application.\\nThe membership of a member, in addition to the members, shall take effect after the decision of the Board of Directors. Withdrawal from membership shall be effected by written notification to the Board of Directors.\\nor its President or by announcing the resignation at a meeting of the Association to be recorded in the minutes. For resignation\\nfor non-payment of the membership fee shall be decided by the Board of Directors.\\n\\n## 6 OBLIGATIONS OF THE MEMBER\\n\\nMembers are obliged to inform the Board of Directors of the Association of the information required by the Association Act whenever changes occur,\\nat least every five (5) years.\\n\\n## 7 MEMBERSHIP FEES\\n\\nThe amount of the joining fee and the annual membership fee for full members and sustaining members shall be set separately for each of the following.\\nfor each category of member shall be decided by the Autumn Meeting. The membership fees for Community members are decided by the Board of Directors of the Association. Honorary Presidents and\\nhonorary members do not pay membership fees.\\n\\n## 8 BOARD OF DIRECTORS\\n\\nThe Board of Directors shall consist of a President elected at the Autumn Meeting and a minimum of seven (7) and a maximum of fifteen (15) members.\\nother full members and at least zero (0) and no more than five (5) alternate members. The number of full and alternate members shall be\\nshall be decided at the Autumn Meeting. The term of office of the Board of Directors shall be one calendar year. The Board shall elect from among its members\\nThe Board of Directors shall appoint from among its members a Vice-Chairman and a Secretary, and shall appoint a Treasurer and other necessary officers.\\n\\n## 9 FUNCTIONS OF THE BOARD\\n\\nThe tasks of the Board of Directors are:\\n\\n1. Maintain the list of members\\n2. to convene meetings of the Association when necessary\\n3. Call the meeting of the General Assembly at 3.00 a.m. Call the General Assembly at 3.00 a.m. Call the meeting at 3.00 a.m.\\n\\n## 10 WRITING THE NAME OF THE ASSOCIATION\\n\\nThe name of the Association shall be written by the Chairman of the Board, the Secretary or any other member of the Board whose name is\\nThe secretary, the secretary or the board of directors, as designated by the board of directors, shall sign the name of the association, each individually.\\n\\n## 11 CONVENING OF MEETINGS OF THE BOARD OF DIRECTORS\\n\\nThe Board of Directors shall meet at the call of the Chairman or, in his absence, the Vice-Chairman, whenever they deem it necessary.\\nwhen they deem it necessary or at the request of a member of the Board of Directors. A quorum shall exist if half of the members of the Board of Directors\\nmembers, including the Chairman or Vice-Chairman, are present and notice of the meeting has been given to the Board of Directors.\\nmembers at least three days before the meeting, or if four fifths (4/5) of the members of the Board of Directors are present at the meeting.\\nof the members of the Board have given their prior consent to the holding of the meeting. The Board of Directors shall decide on the meetings\\nat its organizational meeting. Decisions are taken by a simple majority of the Board.\\nby open ballot, unless a person wishes to have a closed ballot. In the event of a tie, the chairman of the meeting shall have the casting vote.\\nshall have the casting vote, except in the case of elections by lot.\\n\\n## 12 ACCOUNTS\\n\\nThe financial year of the Association shall be the calendar year. The treasurer shall present the accounts, a written statement of the use of the funds and a\\nfinancial position to the Board of Directors by 15 January following the end of the financial year. The Board shall draw up\\nunder the direction of the President and the Secretary, a report on its activities. The financial statements, together with the necessary documents and the\\nthe annual report of the Board of Directors and the annual report of the Board of Directors shall be submitted to the auditors at least three weeks before the spring meeting. For the auditors\\nshall submit their written opinion to the Governing Board no later than two weeks before the spring meeting. The Board of Directors shall propose\\nthe financial statements and the opinion of the auditors, together with the report of the auditors, to the Spring Assembly of the Association.\\n\\n## 13 CONVENING A MEETING OF THE ASSOCIATION\\n\\nThe convening of the spring and autumn meetings and extraordinary meetings of the Association shall be convened by notice given no later than.\\none week before the meeting on the notice board of the Association. An extraordinary meeting shall be held if the Board of Directors considers it necessary.\\nor if at least one twentieth (1/20) or 30 of the members of the Association with voting rights so request.\\nthe Board of Directors in writing for a specifically notified matter.\\n\\n## 14 ANNUAL MEETINGS\\n\\nThe Spring Meeting of the Association shall be held in February. The meeting shall consider at least the following matters:\\n\\n1. to establish the legality and quorum of the meeting.\\n2. to elect a chairman, a secretary, two scrutineers and a scrutineer.\\n3. To approve the agenda for the meeting.\\n4. to present the report of the previous year's activities.\\n5. Presentation of the auditors' report. Approval of the accounts and decision on the discharge to the accounting officers.\\n6. to consider any other business that may arise at the meeting.\\n\\nThe Association's autumn meeting will be held in November, at which at least the following items will be discussed:\\n\\n1. to establish the legality and quorum of the meeting.\\n2. to elect a chairman, a secretary, two scrutineers of the minutes and a scrutineer of the votes.\\n3. To approve the agenda of the meeting.\\n4. to decide on the remuneration and compensation of any officers of the Association.\\n5. to present an action plan for the coming year.\\n6. to consider and approve the proposed budget of income and expenditure and the amount of membership fees, as prepared by the Board of Directors.\\n7. to elect two auditors and two deputy auditors.\\n8. To elect a Chairman of the Board of the Association.\\n9. to decide on the number of members of the Board of Directors.\\n10. to elect the other members of the Board of Directors.\\n11. to consider any other business to be transacted at the meeting\\n\\nIf a member of the Association wishes to have a matter brought before the Spring or Autumn Meeting of the Association, he/she must\\nto the Board of Directors at least two weeks before the meeting so that the matter can be included in the agenda of the next general meeting.\\nbe included in the notice of the meeting.\\n\\n## 15 VOTING RIGHTS\\n\\nAt meetings of the Association, each full member shall have one vote. An honorary, supporting and corporate member shall have\\nhave the right to attend and speak, but not to vote, at meetings of the Association. In the event of a tie, the President shall have the vote of\\nshall have the casting vote, but in the case of elections, the election shall be by lot. Voting shall be by closed ballot if any member so decides.\\nif one of the members wishes.\\n\\n## 16TH ANNIVERSARY\\n\\nThe Association shall celebrate its anniversary on 21 October. The Association was founded in 1987.\\n\\n## 17 RECREATIONAL ACTIVITIES\\n\\nIn order to support and develop hobbies consistent with the purposes of the Association, members may\\nestablish an unregistered club or hobby group, the activities of which the Association shall endeavour to support as far as possible\\nas far as possible.\\n\\n\\n## 18 AMENDMENT OF THE STATUTES AND DISSOLUTION OF THE ASSOCIATION\\n\\nThe decision to amend the statutes and dissolve the association must be taken at a meeting of the association at least three\\nmajority of three quarters (3/4) of the votes cast. The notice of the meeting shall state that the amendment of the Statutes or the dissolution of the Association\\ndissolution. In the event of the dissolution of the Association, the assets of the Association shall be used to further the purposes of the Association.\\nin the manner determined by the meeting which decides on the dissolution of the association. If the Association is dissolved, its assets shall be used for the same purpose.\\n\\n## 19 MEMBERSHIP RIGHTS\\n\\nThe membership rights acquired shall be maintained.\\n\\n## 20 ASSOCIATION SYMBOLS\\n\\nThe form of the Association's emblem and of the decorations and medals shall be decided by the General Assembly. The distribution of the badges is decided by the Board of Directors.\\n\\n","user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-29T11:37:48.747Z"}	\N
240	276	lomake_vastaukset	31	\N	\N	\N
241	277	lomake_vastaukset	32	\N	\N	\N
242	278	lomake_vastaukset	33	\N	\N	\N
129	135	LandingPage	1	{"id":1,"user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-17T10:30:09.414Z","fi_title":"Servetti ry","en_title":"Servetti ry","fi_description":"Itä-Suomen yliopiston Kuopion kampuksen tietojenkäsittelytieteen opiskelijoiden ainejärjestö ","en_description":"The computer science students' subject organization of the Kuopio campus of the University of Eastern Finland","fi_button_text":"Millaista tietojenkäsittelytiede on?","en_button_text":"What is computer science like?","en_button_url":"/opiskelu/tkt","fi_button_url":"/opiskelu/tkt"}	{"fi_title":"Servetti ry","en_title":"Servetti ry","user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-17T10:30:09.414Z"}	\N
130	136	board_members	3	{"status":"published","name":"Erkki Pesonen","email":"consult@serveriry.fi","telegram":"epesonen"}	{"status":"published","name":"Erkki Pesonen","email":"consult@serveriry.fi","telegram":"epesonen"}	\N
131	137	board_members	2	{"id":2,"status":"published","user_created":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_created":"2023-04-16T16:05:10.468Z","user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-17T10:43:51.251Z","name":"Maija Meikäläinen","role":"Jäsen","email":"maija.meikalainen@serveriry.fi","telegram":"maijameikalainen","description":"Hallituksen jäsen toimii hallituksessa.","hover_img":"https://img.ilcdn.fi/cgh7U4SKQ1ujJ-_uO6uNxT91crU=/full-fit-in/612x0/img-s3.ilcdn.fi/0b222e185bd67c4f1c37ac0461dd816622d9a66a2d31bcd6d0c1243b21f26d3d.jpg","img":"/images/member.jpeg"}	{"hover_img":"https://img.ilcdn.fi/cgh7U4SKQ1ujJ-_uO6uNxT91crU=/full-fit-in/612x0/img-s3.ilcdn.fi/0b222e185bd67c4f1c37ac0461dd816622d9a66a2d31bcd6d0c1243b21f26d3d.jpg","user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-17T10:43:51.251Z"}	\N
132	138	directus_fields	33	{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"social_medias"}	{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"social_medias"}	\N
133	139	directus_fields	34	{"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"social_medias"}	{"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"social_medias"}	\N
134	140	directus_fields	35	{"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"social_medias"}	{"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"social_medias"}	\N
135	141	directus_fields	36	{"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"social_medias"}	{"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"social_medias"}	\N
136	142	directus_fields	37	{"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"social_medias"}	{"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"social_medias"}	\N
137	143	directus_collections	social_medias	{"singleton":false,"collection":"social_medias"}	{"singleton":false,"collection":"social_medias"}	\N
138	144	directus_fields	38	{"interface":"input","special":null,"collection":"social_medias","field":"name"}	{"interface":"input","special":null,"collection":"social_medias","field":"name"}	\N
139	145	directus_fields	39	{"interface":"input","special":null,"collection":"social_medias","field":"url"}	{"interface":"input","special":null,"collection":"social_medias","field":"url"}	\N
140	146	directus_fields	40	{"interface":"input","special":null,"collection":"social_medias","field":"icon"}	{"interface":"input","special":null,"collection":"social_medias","field":"icon"}	\N
141	147	directus_permissions	6	{"role":null,"collection":"social_medias","action":"read"}	{"role":null,"collection":"social_medias","action":"read"}	\N
142	148	directus_permissions	6	{"id":6,"role":null,"collection":"social_medias","action":"read","permissions":null,"validation":null,"presets":null,"fields":["url","icon","name"]}	{"role":null,"collection":"social_medias","action":"read","permissions":null,"validation":null,"presets":null,"fields":["url","icon","name"]}	\N
143	149	social_medias	1	{"name":"Discord","url":"www.google.com","icon":"https://assets-global.website-files.com/6257adef93867e50d84d30e2/636e0a6a49cf127bf92de1e2_icon_clyde_blurple_RGB.png"}	{"name":"Discord","url":"www.google.com","icon":"https://assets-global.website-files.com/6257adef93867e50d84d30e2/636e0a6a49cf127bf92de1e2_icon_clyde_blurple_RGB.png"}	\N
144	152	directus_fields	41	{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"news"}	{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"news"}	\N
145	153	directus_fields	42	{"width":"full","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]},"field":"status","collection":"news"}	{"width":"full","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]},"field":"status","collection":"news"}	\N
146	154	directus_fields	43	{"interface":"input","hidden":true,"field":"sort","collection":"news"}	{"interface":"input","hidden":true,"field":"sort","collection":"news"}	\N
165	173	directus_fields	57	{"interface":"input-rich-text-md","special":null,"required":true,"options":{"placeholder":"Write rules of serveri ry"},"collection":"serveri_rules","field":"rules_en"}	{"interface":"input-rich-text-md","special":null,"required":true,"options":{"placeholder":"Write rules of serveri ry"},"collection":"serveri_rules","field":"rules_en"}	\N
147	155	directus_fields	44	{"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"news"}	{"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"news"}	\N
148	156	directus_fields	45	{"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"news"}	{"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"news"}	\N
149	157	directus_fields	46	{"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"news"}	{"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"news"}	\N
150	158	directus_fields	47	{"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"news"}	{"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"news"}	\N
151	159	directus_collections	news	{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"news"}	{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"news"}	\N
152	160	directus_fields	48	{"interface":"input","special":null,"required":true,"options":{"placeholder":"Uutisen otsikko"},"collection":"news","field":"fi_title"}	{"interface":"input","special":null,"required":true,"options":{"placeholder":"Uutisen otsikko"},"collection":"news","field":"fi_title"}	\N
153	161	directus_fields	49	{"interface":"input","special":null,"required":true,"options":{"placeholder":"News title"},"collection":"news","field":"en_title"}	{"interface":"input","special":null,"required":true,"options":{"placeholder":"News title"},"collection":"news","field":"en_title"}	\N
154	162	directus_fields	50	{"interface":"input","special":null,"options":{"placeholder":"link to the cover image"},"required":true,"collection":"news","field":"image"}	{"interface":"input","special":null,"options":{"placeholder":"link to the cover image"},"required":true,"collection":"news","field":"image"}	\N
155	163	directus_fields	51	{"interface":"input-multiline","special":null,"required":true,"options":{"placeholder":"Uutisen tekstisisältö"},"collection":"news","field":"fi_text"}	{"interface":"input-multiline","special":null,"required":true,"options":{"placeholder":"Uutisen tekstisisältö"},"collection":"news","field":"fi_text"}	\N
156	164	directus_fields	52	{"interface":"input-multiline","special":null,"required":true,"options":{"placeholder":"The text content of the news","softLength":1000},"collection":"news","field":"en_text"}	{"interface":"input-multiline","special":null,"required":true,"options":{"placeholder":"The text content of the news","softLength":1000},"collection":"news","field":"en_text"}	\N
157	165	directus_fields	51	{"id":51,"collection":"news","field":"fi_text","special":null,"interface":"input-multiline","options":{"placeholder":"Uutisen tekstisisältö","softLength":1000},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"news","field":"fi_text","special":null,"interface":"input-multiline","options":{"placeholder":"Uutisen tekstisisältö","softLength":1000},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	\N
158	166	directus_fields	51	{"id":51,"collection":"news","field":"fi_text","special":null,"interface":"input-rich-text-md","options":{"placeholder":"Uutisen tekstisisältö","softLength":1000},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"news","field":"fi_text","special":null,"interface":"input-rich-text-md","options":{"placeholder":"Uutisen tekstisisältö","softLength":1000},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	\N
159	167	directus_fields	52	{"id":52,"collection":"news","field":"en_text","special":null,"interface":"input-rich-text-md","options":{"placeholder":"The text content of the news","softLength":1000},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"news","field":"en_text","special":null,"interface":"input-rich-text-md","options":{"placeholder":"The text content of the news","softLength":1000},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	\N
160	168	directus_fields	53	{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"serveri_rules"}	{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"serveri_rules"}	\N
161	169	directus_fields	54	{"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"serveri_rules"}	{"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"serveri_rules"}	\N
162	170	directus_fields	55	{"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"serveri_rules"}	{"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"serveri_rules"}	\N
168	176	serveri_rules	1	{"rules_fi":"Serveri ry:n järjestyssäännöt\\n1. NIMI JA KOTIPAIKKA\\nYhdistyksen nimi on Itä-Suomen yliopiston tietojenkäsittelytieteen opiskelijat - Serveri ry. Yhdistyksen kotipaikka on Kuopio.\\n2. TARKOITUS JA TOIMINTA\\nYhdistyksen tarkoituksena on yhdistää Itä-Suomen yliopiston tietojenkäsittelytieteen opiskelijoita ja tukea heidän henkisiä sekä aineellisia pyrkimyksiään, niin ammattiin liittyvissä kuin vapaa-ajan kysymyksissä. Tarkoituksensa toteuttamiseksi yhdistys valvoo jäsentensä etuja pitämällä yhteyksiä muihin yhdistyksiin, yrityksiin ja yliopiston hallintoelimiin. Yhdistys järjestää erilaisia informaatio-, esitelmä-, luento-, ja keskustelutilaisuuksia sekä illanviettoja. Yhdistys pyrkii tukemaan jäsentensä alaan liittyviä opintoja ja opintomatkoja. Toimintansa tukemiseksi yhdistys voi myös vastaanottaa avustuksia, lahjoituksia ja testamentteja, panna toimeen asianomaisella luvalla rahankeräyksiä ja arpajaisia, hankkia, myydä ja omistaa toimintaansa varten tarpeellista irtainta että kiinteätä omaisuutta tai harjoittaa välittömästi yhdistyksen tarkoituksen toteuttamiseen liittyvää tai taloudellisesti vähäarvoisena pidettävää ansiotoimintaa.\\n3 KIELI\\nYhdistyksen kielenä on suomi. Pöytäkirjat laaditaan suomen kielellä.\\n4 PUOLUEETTOMUUS\\nYhdistys on puoluepoliittisesti sitoutumaton.\\n5 JÄSENET\\nJäseniä voivat olla:\\n\\n    Varsinaiset jäsenet: Itä-Suomen yliopistossa kirjoilla olevat (läsnä- tai poissaolevana) tietojenkäsittelytiedettä opiskelevat henkilöt.\\n    Kannatusjäsenet: Kannatusjäseniä voivat olla henkilöt tai oikeuskelpoiset yhteisöt, jotka ovat kiinnostuneita yhdistyksen toiminnasta ja haluavat tukea sitä.\\n    Kunniajäsenet: Kunniajäseneksi voidaan kutsua henkilö, joka on erikoisesti tukenut yhdistyksen toimintaa. Ehdotuksen kunniajäseneksi kutsumisesta voi tehdä kuka tahansa jäsenistä suullisesti tai kirjallisesti hallitukselle, joka esittää ehdotuksen yhdistyksen kokoukselle tai suoraan yhdistyksen kokoukselle, jossa riittää yksinkertainen enemmistö mahdollisessa äänestyksessä esityksen hyväksymiseksi. Kaikki valmistuneet jäsenet voidaan hallituksen päätöksellä valita kunniajäseneksi.\\n    Yhteisöjäsenet: Yhteisöjäsen voi olla oikeuskelpoinen yhteisö, joka on kiinnostunut yhdistyksen toiminnasta ja haluaa tukea sitä. \\n\\nVarsinaiset jäsenet, kannatusjäsenet ja yhteisöjäsenet hyväksyy hakemuksesta yhdistyksen hallitus. Jäsenyys astuu voimaan hallituksen päätöksen jälkeen. Jäsenyydestä eroaminen tapahtuu ilmoittamalla siitä kirjallisesti hallitukselle tai sen puheenjohtajalle tai ilmoittamalla erosta yhdistyksen kokouksessa pöytäkirjaan merkittäväksi. Erottamisesta jäsenmaksun maksamatta jättämisen vuoksi päättää hallitus.\\n6 JÄSENEN VELVOLLISUUDET\\nJäsenellä on velvollisuus ilmoittaa yhdistyslain määräämät tiedot yhdistyksen hallitukselle aina muutosten yhteydessä, kuitenkin vähintään viiden (5) vuoden välein.\\n7 JÄSENMAKSUT\\nVarsinaisten jäsenten ja kannatusjäsenten liittymismaksun ja vuotuisen jäsenmaksun suuruudesta erikseen kullekin jäsenryhmälle päättää syyskokous. Yhteisöjäsenten jäsenmaksuista päättää yhdistyksen hallitus. Kunniapuheenjohtajat ja kunniajäsenet eivät suorita jäsenmaksuja.\\n8 HALLITUS\\nHallituksen muodostavat syyskokouksessa valitut puheenjohtaja ja vähintään seitsemän (7), enintään viisitoista (15) muuta varsinaista jäsentä sekä vähintään nolla (0) ja enintään viisi (5) varajäsentä. Varsinaisten ja varajäsenten lukumäärä päätetään syyskokouksessa. Hallituksen toimikausi on kalenterivuosi. Hallitus valitsee keskuudestaan varapuheenjohtajan ja sihteerin, lisäksi hallitus nimittää rahastonhoitajan sekä muut tarvittavat toimihenkilöt.\\n9 HALLITUKSEN TEHTÄVÄT\\nHallituksen tehtävänä on:\\n\\n    Pitää yllä jäsenluetteloa\\n    Kutsua yhdistyksen kokous tarvittaessa koolle\\n    Hoitaa yhdistyksen asioita sekä taloutta sääntöjen ja toimintasuunnitelman mukaan. \\n\\n10 YHDISTYKSEN NIMEN KIRJOITTAMINEN\\nYhdistyksen nimen kirjoittaa hallituksen puheenjohtaja, sihteeri tai muu hallituksen jäsen jonka hallitus on nimenkirjoittajaksi määrännyt, kukin erikseen.\\n11 HALLITUKSEN KOOLLE KUTSUMINEN\\nHallitus kokoontuu puheenjohtajan tai hänen estyneenä ollessaan varapuheenjohtajan kutsusta, kun he katsovat siihen olevan aihetta tai jonkun hallituksen jäsenen niin halutessa. Hallitus on päätösvaltainen, mikäli puolet hallituksen jäsenistä puheenjohtaja tai varapuheenjohtaja mukaan lukien on paikalla ja kokouksesta on tiedotettu hallituksen jäsenille vähintään kolme vuorokautta ennen kokousta tai mikäli neljä viidesosaa (4/5) hallituksen varsinaisista jäsenistä on ilmaissut suostumuksensa kokouksen järjestämiseen aikaisemmin. Hallitus päättää kokousten koollekutsumistavasta järjestäytymiskokouksessaan. Päätökset tehdään hallituksessa yksinkertaisella enemmistöllä avoimella äänestyksellä, ellei joku halua suljettua lippuäänestystä. Äänten mennessä tasan kokouksen puheenjohtajan ääni ratkaisee, paitsi vaaleissa arpa.\\n12 TILIT\\nYhdistyksen tilikausi on kalenterivuosi. Rahastonhoitaja esittää tilit, kirjallisen selonteon varojen käytöstä ja taloudellisesta asemasta hallitukselle tilikautta seuraavan tammikuun 15. päivään mennessä. Hallitus laatii puheenjohtajan ja sihteerin johdolla toimintakertomuksen. Tilinpäätös tarvittavine asiakirjoineen ja hallituksen vuosikertomus on annettava toiminnantarkastajille viimeistään kolme viikkoa ennen kevätkokousta. Toiminnantarkastajien tulee antaa kirjallinen lausuntonsa viimeistään kaksi viikkoa ennen kevätkokousta hallitukselle. Hallitus esittää tilinpäätöksen ja toiminnantarkastajien lausunnon sekä toimintakertomuksen yhdistyksen kevätkokoukselle.\\n13 YHDISTYKSEN KOKOUKSEN KOOLLE KUTSUMINEN\\nYhdistyksen kevät- ja syyskokouksen ja ylimääräisen kokouksen koolle kutsuminen tapahtuu ilmoituksella viimeistään viikkoa ennen kokousta yhdistyksen ilmoitustaululla. Ylimääräinen kokous pidetään, jos hallitus katsoo siihen olevan aihetta tai jos vähintään yksi kahdeskymmenesosa (1/20) tai 30 yhdistyksen äänioikeutetuista jäsenistä sitä hallitukselta erityisesti ilmoitettua asiaa varten kirjallisesti vaatii.\\n14 VUOSIKOKOUKSET\\nYhdistyksen kevätkokous pidetään helmikuussa. Kokouksessa käsitellään vähintään seuraavat asiat:\\n\\n    Todetaan kokouksen laillisuus ja päätösvaltaisuus.\\n    Valitaan kokoukselle puheenjohtaja, sihteeri ja kaksi pöytäkirjantarkastajaa sekä ääntenlaskijaa.\\n    Vahvistetaan kokouksen esityslista.\\n    Esitetään edellisen vuoden toimintakertomus.\\n    Esitetään toiminnantarkastajien lausunto. Vahvistetaan tilinpäätös ja päätetään vastuuvapauden myöntämisestä tilivelvollisille.\\n    Käsitellään muut kokouksessa mahdolliset esille tulevat asiat.\\n\\nYhdistyksen syyskokous pidetään marraskuussa, kokouksessa käsitellään vähintään seuraavat asiat:\\n\\n    Todetaan kokouksen laillisuus ja päätösvaltaisuus.\\n    Valitaan kokoukselle puheenjohtaja, sihteeri ja kaksi pöytäkirjantarkastajaa sekä ääntenlaskijaa.\\n    Vahvistetaan kokouksen esityslista.\\n    Päätetään yhdistyksen mahdollisten toimihenkilöiden palkkioista ja korvauksista.\\n    Esitetään toimintasuunnitelma tulevalle vuodelle.\\n    Käsitellään ja vahvistetaan hallituksen laatima tulo- ja menoarvioehdotus sekä jäsenmaksujen suuruus.\\n    Valitaan kaksi toiminnantarkastajaa ja kaksi varatoiminnantarkastajaa.\\n    Valitaan yhdistyksen hallitukselle puheenjohtaja.\\n    Päätetään hallituksen jäsenten määrä.\\n    Valitaan muut hallituksen jäsenet.\\n    Käsitellään muut kokouksessa esille tulevat asiat\\n\\nMikäli yhdistyksen jäsen haluaa saada jonkin asian yhdistyksen kevät- tai syyskokouksen käsiteltäväksi, on hänen ilmoitettava siitä kirjallisesti hallitukselle viimeistään kaksi viikkoa ennen kokousta, että asia voidaan sisällyttää kokouskutsuun.\\n15 ÄÄNIOIKEUS\\nYhdistyksen kokouksissa on jokaisella varsinaisella jäsenellä yksi ääni. Kunnia-, kannatus- ja yhteisöjäsenellä on läsnäolo- ja puheoikeus, mutta ei äänioikeutta yhdistyksen kokouksessa. Äänten mennessä tasan puheenjohtajan ääni ratkaisee, vaaleissa kuitenkin arpa. Äänestys tulee suorittaa suljettuna lippuäänestyksenä, mikäli joku jäsenistä niin haluaa.\\n16 VUOSIPÄIVÄ\\nYhdistys viettää vuosipäiväänsä lokakuun 21. päivänä. Yhdistys on perustettu vuonna 1987.\\n17 HARRASTUSTOIMINTA\\nYhdistyksen tarkoitusperien kanssa sopusoinnussa olevien harrastusten tukemiseksi ja kehittämiseksi voivat jäsenet perustaa rekisteröimättömän kerhon tai harrastuspiirin, joiden toimintaa yhdistys pyrkii tukemaan mahdollisuuksiensa mukaan.\\n18 SÄÄNTÖJEN MUUTTAMINEN JA YHDISTYKSEN PURKAMINEN\\nPäätös sääntöjen muuttamisesta ja yhdistyksen purkamisesta on tehtävä yhdistyksen kokouksessa vähintään kolmen neljäsosan (3/4) enemmistöllä annetuista äänistä. Kokouskutsussa on mainittava sääntöjen muuttamisesta tai yhdistyksen purkamisesta. Yhdistyksen purkautuessa käytetään yhdistyksen varat yhdistyksen tarkoituksen edistämiseen purkamisesta päättävän kokouksen määräämällä tavalla. Yhdistyksen tullessa lakkautetuksi käytetään sen varat samaan tarkoitukseen.\\n19 JÄSENOIKEUDET\\nSaavutetut jäsenoikeudet säilyvät.\\n20 YHDISTYKSEN TUNNUKSET\\nYhdistyksen tunnuksen sekä arvo- ja kunniamerkkien muodosta päättää yleiskokous. Merkkien jakamisesta päättää hallitus.","rules_en":"Rules of order of Serveri ry\\n1. NAME AND RESIDENCE\\nThe name of the association is Computer Science Students of the University of Eastern Finland - Serveri ry. The registered office of the association is Kuopio.\\n2. PURPOSE AND OPERATION\\nThe purpose of the association is to unite computer science students of the University of Eastern Finland and support their spiritual and material aspirations, both in professional and leisure matters. In order to fulfill its purpose, the association monitors the interests of its members by maintaining connections with other associations, companies and the university's administrative bodies. The association organizes various information, presentation, lecture and discussion events as well as evening parties. The association aims to support its members' field-related studies and study tours. In order to support its activities, the association can also receive grants, donations and bequests, carry out fundraisers and lotteries with the relevant permission, acquire, sell and own movable and immovable property necessary for its activities, or engage in gainful activities that are directly related to the realization of the association's purpose or that are considered to be of low economic value.\\n3 LANGUAGE\\nThe language of the association is Finnish. The minutes are drawn up in Finnish.\\n4 IMPARTIALITY\\nThe association is non-partisan politically.\\n5 MEMBERS\\nMembers can be:\\n\\n     Actual members: Persons enrolled in the University of Eastern Finland (in attendance or absent) studying computer science.\\n     Supporting members: Supporting members can be individuals or legal entities that are interested in the association's activities and want to support it.\\n     Honorary members: A person who has specially supported the association's activities can be called an honorary member. Any of the members can make a proposal to be called an honorary member orally or in writing to the board, which presents the proposal to the association meeting or directly to the association meeting, where a simple majority in a possible vote is sufficient to approve the proposal. All graduated members can be elected honorary members by the board's decision.\\n     Community members: A community member can be a legal entity that is interested in the association's activities and wants to support it.\\n\\nFull members, supporting members and community members are approved by the board of the association upon application. The membership takes effect after the board's decision. Resignation from membership is done by notifying the board of directors or its chairman in writing, or by announcing the resignation in the minutes of the association's meeting. Dismissal due to non-payment of membership fee is decided by the board.\\n6 MEMBER'S OBLIGATIONS\\nThe member has the obligation to notify the association's board of directors of the information required by the Association Act whenever there are changes, but at least every five (5) years.\\n7 MEMBERSHIP FEES\\nThe size of the joining fee and the annual membership fee for regular members and supporting members will be decided separately for each member group by the autumn meeting. The board of the association decides on the membership fees of community members. Honorary presidents and honorary members do not pay membership fees.\\n8 GOVERNMENT\\nThe board consists of the chairman elected at the autumn meeting and at least seven (7), at most fifteen (15) other full members and at least zero (0) and at most five (5) alternate members. The number of regular and alternate members is decided at the autumn meeting. The board's term of office is a calendar year. The board chooses a vice-chairman and a secretary from among themselves, in addition, the board appoints a treasurer and other necessary officials.\\n9 TASKS OF THE BOARD OF DIRECTORS\\nThe board's task is to:\\n\\n     Maintains the membership list\\n     Call a meeting of the association if necessary\\n     Manages the association's affairs and finances according to the rules and the action plan.\\n\\n10 WRITING THE NAME OF THE ASSOCIATION\\nThe name of the association is written by the chairman of the board, the secretary or another member of the board appointed by the board as a signatory, each separately.\\n11 CONVENING THE BOARD OF DIRECTORS\\nThe board meets at the invitation of the chairman or the vice-chairman in his absence, when they consider there is a reason for it or when a member of the board so wishes. The board has quorum if half of the board members, including the chairman or vice chairman, are present and the board members have been informed of the meeting at least three days before the meeting, or if four-fifths (4/5) of the actual members of the board have expressed their consent to holding the meeting earlier. The board of directors decides on the method of convening the meetings in its organizational meeting. Decisions are made in the board by a simple majority with an open vote, unless someone wants a closed ticket vote. In the event of a tie, the vote of the chairman of the meeting is decisive, except for elections by lottery.\\n12 ACCOUNTS\\nThe association's accounting period is a calendar year. The treasurer presents the accounts, a written report on the use of funds and"}	{"rules_fi":"Serveri ry:n järjestyssäännöt\\n1. NIMI JA KOTIPAIKKA\\nYhdistyksen nimi on Itä-Suomen yliopiston tietojenkäsittelytieteen opiskelijat - Serveri ry. Yhdistyksen kotipaikka on Kuopio.\\n2. TARKOITUS JA TOIMINTA\\nYhdistyksen tarkoituksena on yhdistää Itä-Suomen yliopiston tietojenkäsittelytieteen opiskelijoita ja tukea heidän henkisiä sekä aineellisia pyrkimyksiään, niin ammattiin liittyvissä kuin vapaa-ajan kysymyksissä. Tarkoituksensa toteuttamiseksi yhdistys valvoo jäsentensä etuja pitämällä yhteyksiä muihin yhdistyksiin, yrityksiin ja yliopiston hallintoelimiin. Yhdistys järjestää erilaisia informaatio-, esitelmä-, luento-, ja keskustelutilaisuuksia sekä illanviettoja. Yhdistys pyrkii tukemaan jäsentensä alaan liittyviä opintoja ja opintomatkoja. Toimintansa tukemiseksi yhdistys voi myös vastaanottaa avustuksia, lahjoituksia ja testamentteja, panna toimeen asianomaisella luvalla rahankeräyksiä ja arpajaisia, hankkia, myydä ja omistaa toimintaansa varten tarpeellista irtainta että kiinteätä omaisuutta tai harjoittaa välittömästi yhdistyksen tarkoituksen toteuttamiseen liittyvää tai taloudellisesti vähäarvoisena pidettävää ansiotoimintaa.\\n3 KIELI\\nYhdistyksen kielenä on suomi. Pöytäkirjat laaditaan suomen kielellä.\\n4 PUOLUEETTOMUUS\\nYhdistys on puoluepoliittisesti sitoutumaton.\\n5 JÄSENET\\nJäseniä voivat olla:\\n\\n    Varsinaiset jäsenet: Itä-Suomen yliopistossa kirjoilla olevat (läsnä- tai poissaolevana) tietojenkäsittelytiedettä opiskelevat henkilöt.\\n    Kannatusjäsenet: Kannatusjäseniä voivat olla henkilöt tai oikeuskelpoiset yhteisöt, jotka ovat kiinnostuneita yhdistyksen toiminnasta ja haluavat tukea sitä.\\n    Kunniajäsenet: Kunniajäseneksi voidaan kutsua henkilö, joka on erikoisesti tukenut yhdistyksen toimintaa. Ehdotuksen kunniajäseneksi kutsumisesta voi tehdä kuka tahansa jäsenistä suullisesti tai kirjallisesti hallitukselle, joka esittää ehdotuksen yhdistyksen kokoukselle tai suoraan yhdistyksen kokoukselle, jossa riittää yksinkertainen enemmistö mahdollisessa äänestyksessä esityksen hyväksymiseksi. Kaikki valmistuneet jäsenet voidaan hallituksen päätöksellä valita kunniajäseneksi.\\n    Yhteisöjäsenet: Yhteisöjäsen voi olla oikeuskelpoinen yhteisö, joka on kiinnostunut yhdistyksen toiminnasta ja haluaa tukea sitä. \\n\\nVarsinaiset jäsenet, kannatusjäsenet ja yhteisöjäsenet hyväksyy hakemuksesta yhdistyksen hallitus. Jäsenyys astuu voimaan hallituksen päätöksen jälkeen. Jäsenyydestä eroaminen tapahtuu ilmoittamalla siitä kirjallisesti hallitukselle tai sen puheenjohtajalle tai ilmoittamalla erosta yhdistyksen kokouksessa pöytäkirjaan merkittäväksi. Erottamisesta jäsenmaksun maksamatta jättämisen vuoksi päättää hallitus.\\n6 JÄSENEN VELVOLLISUUDET\\nJäsenellä on velvollisuus ilmoittaa yhdistyslain määräämät tiedot yhdistyksen hallitukselle aina muutosten yhteydessä, kuitenkin vähintään viiden (5) vuoden välein.\\n7 JÄSENMAKSUT\\nVarsinaisten jäsenten ja kannatusjäsenten liittymismaksun ja vuotuisen jäsenmaksun suuruudesta erikseen kullekin jäsenryhmälle päättää syyskokous. Yhteisöjäsenten jäsenmaksuista päättää yhdistyksen hallitus. Kunniapuheenjohtajat ja kunniajäsenet eivät suorita jäsenmaksuja.\\n8 HALLITUS\\nHallituksen muodostavat syyskokouksessa valitut puheenjohtaja ja vähintään seitsemän (7), enintään viisitoista (15) muuta varsinaista jäsentä sekä vähintään nolla (0) ja enintään viisi (5) varajäsentä. Varsinaisten ja varajäsenten lukumäärä päätetään syyskokouksessa. Hallituksen toimikausi on kalenterivuosi. Hallitus valitsee keskuudestaan varapuheenjohtajan ja sihteerin, lisäksi hallitus nimittää rahastonhoitajan sekä muut tarvittavat toimihenkilöt.\\n9 HALLITUKSEN TEHTÄVÄT\\nHallituksen tehtävänä on:\\n\\n    Pitää yllä jäsenluetteloa\\n    Kutsua yhdistyksen kokous tarvittaessa koolle\\n    Hoitaa yhdistyksen asioita sekä taloutta sääntöjen ja toimintasuunnitelman mukaan. \\n\\n10 YHDISTYKSEN NIMEN KIRJOITTAMINEN\\nYhdistyksen nimen kirjoittaa hallituksen puheenjohtaja, sihteeri tai muu hallituksen jäsen jonka hallitus on nimenkirjoittajaksi määrännyt, kukin erikseen.\\n11 HALLITUKSEN KOOLLE KUTSUMINEN\\nHallitus kokoontuu puheenjohtajan tai hänen estyneenä ollessaan varapuheenjohtajan kutsusta, kun he katsovat siihen olevan aihetta tai jonkun hallituksen jäsenen niin halutessa. Hallitus on päätösvaltainen, mikäli puolet hallituksen jäsenistä puheenjohtaja tai varapuheenjohtaja mukaan lukien on paikalla ja kokouksesta on tiedotettu hallituksen jäsenille vähintään kolme vuorokautta ennen kokousta tai mikäli neljä viidesosaa (4/5) hallituksen varsinaisista jäsenistä on ilmaissut suostumuksensa kokouksen järjestämiseen aikaisemmin. Hallitus päättää kokousten koollekutsumistavasta järjestäytymiskokouksessaan. Päätökset tehdään hallituksessa yksinkertaisella enemmistöllä avoimella äänestyksellä, ellei joku halua suljettua lippuäänestystä. Äänten mennessä tasan kokouksen puheenjohtajan ääni ratkaisee, paitsi vaaleissa arpa.\\n12 TILIT\\nYhdistyksen tilikausi on kalenterivuosi. Rahastonhoitaja esittää tilit, kirjallisen selonteon varojen käytöstä ja taloudellisesta asemasta hallitukselle tilikautta seuraavan tammikuun 15. päivään mennessä. Hallitus laatii puheenjohtajan ja sihteerin johdolla toimintakertomuksen. Tilinpäätös tarvittavine asiakirjoineen ja hallituksen vuosikertomus on annettava toiminnantarkastajille viimeistään kolme viikkoa ennen kevätkokousta. Toiminnantarkastajien tulee antaa kirjallinen lausuntonsa viimeistään kaksi viikkoa ennen kevätkokousta hallitukselle. Hallitus esittää tilinpäätöksen ja toiminnantarkastajien lausunnon sekä toimintakertomuksen yhdistyksen kevätkokoukselle.\\n13 YHDISTYKSEN KOKOUKSEN KOOLLE KUTSUMINEN\\nYhdistyksen kevät- ja syyskokouksen ja ylimääräisen kokouksen koolle kutsuminen tapahtuu ilmoituksella viimeistään viikkoa ennen kokousta yhdistyksen ilmoitustaululla. Ylimääräinen kokous pidetään, jos hallitus katsoo siihen olevan aihetta tai jos vähintään yksi kahdeskymmenesosa (1/20) tai 30 yhdistyksen äänioikeutetuista jäsenistä sitä hallitukselta erityisesti ilmoitettua asiaa varten kirjallisesti vaatii.\\n14 VUOSIKOKOUKSET\\nYhdistyksen kevätkokous pidetään helmikuussa. Kokouksessa käsitellään vähintään seuraavat asiat:\\n\\n    Todetaan kokouksen laillisuus ja päätösvaltaisuus.\\n    Valitaan kokoukselle puheenjohtaja, sihteeri ja kaksi pöytäkirjantarkastajaa sekä ääntenlaskijaa.\\n    Vahvistetaan kokouksen esityslista.\\n    Esitetään edellisen vuoden toimintakertomus.\\n    Esitetään toiminnantarkastajien lausunto. Vahvistetaan tilinpäätös ja päätetään vastuuvapauden myöntämisestä tilivelvollisille.\\n    Käsitellään muut kokouksessa mahdolliset esille tulevat asiat.\\n\\nYhdistyksen syyskokous pidetään marraskuussa, kokouksessa käsitellään vähintään seuraavat asiat:\\n\\n    Todetaan kokouksen laillisuus ja päätösvaltaisuus.\\n    Valitaan kokoukselle puheenjohtaja, sihteeri ja kaksi pöytäkirjantarkastajaa sekä ääntenlaskijaa.\\n    Vahvistetaan kokouksen esityslista.\\n    Päätetään yhdistyksen mahdollisten toimihenkilöiden palkkioista ja korvauksista.\\n    Esitetään toimintasuunnitelma tulevalle vuodelle.\\n    Käsitellään ja vahvistetaan hallituksen laatima tulo- ja menoarvioehdotus sekä jäsenmaksujen suuruus.\\n    Valitaan kaksi toiminnantarkastajaa ja kaksi varatoiminnantarkastajaa.\\n    Valitaan yhdistyksen hallitukselle puheenjohtaja.\\n    Päätetään hallituksen jäsenten määrä.\\n    Valitaan muut hallituksen jäsenet.\\n    Käsitellään muut kokouksessa esille tulevat asiat\\n\\nMikäli yhdistyksen jäsen haluaa saada jonkin asian yhdistyksen kevät- tai syyskokouksen käsiteltäväksi, on hänen ilmoitettava siitä kirjallisesti hallitukselle viimeistään kaksi viikkoa ennen kokousta, että asia voidaan sisällyttää kokouskutsuun.\\n15 ÄÄNIOIKEUS\\nYhdistyksen kokouksissa on jokaisella varsinaisella jäsenellä yksi ääni. Kunnia-, kannatus- ja yhteisöjäsenellä on läsnäolo- ja puheoikeus, mutta ei äänioikeutta yhdistyksen kokouksessa. Äänten mennessä tasan puheenjohtajan ääni ratkaisee, vaaleissa kuitenkin arpa. Äänestys tulee suorittaa suljettuna lippuäänestyksenä, mikäli joku jäsenistä niin haluaa.\\n16 VUOSIPÄIVÄ\\nYhdistys viettää vuosipäiväänsä lokakuun 21. päivänä. Yhdistys on perustettu vuonna 1987.\\n17 HARRASTUSTOIMINTA\\nYhdistyksen tarkoitusperien kanssa sopusoinnussa olevien harrastusten tukemiseksi ja kehittämiseksi voivat jäsenet perustaa rekisteröimättömän kerhon tai harrastuspiirin, joiden toimintaa yhdistys pyrkii tukemaan mahdollisuuksiensa mukaan.\\n18 SÄÄNTÖJEN MUUTTAMINEN JA YHDISTYKSEN PURKAMINEN\\nPäätös sääntöjen muuttamisesta ja yhdistyksen purkamisesta on tehtävä yhdistyksen kokouksessa vähintään kolmen neljäsosan (3/4) enemmistöllä annetuista äänistä. Kokouskutsussa on mainittava sääntöjen muuttamisesta tai yhdistyksen purkamisesta. Yhdistyksen purkautuessa käytetään yhdistyksen varat yhdistyksen tarkoituksen edistämiseen purkamisesta päättävän kokouksen määräämällä tavalla. Yhdistyksen tullessa lakkautetuksi käytetään sen varat samaan tarkoitukseen.\\n19 JÄSENOIKEUDET\\nSaavutetut jäsenoikeudet säilyvät.\\n20 YHDISTYKSEN TUNNUKSET\\nYhdistyksen tunnuksen sekä arvo- ja kunniamerkkien muodosta päättää yleiskokous. Merkkien jakamisesta päättää hallitus.","rules_en":"Rules of order of Serveri ry\\n1. NAME AND RESIDENCE\\nThe name of the association is Computer Science Students of the University of Eastern Finland - Serveri ry. The registered office of the association is Kuopio.\\n2. PURPOSE AND OPERATION\\nThe purpose of the association is to unite computer science students of the University of Eastern Finland and support their spiritual and material aspirations, both in professional and leisure matters. In order to fulfill its purpose, the association monitors the interests of its members by maintaining connections with other associations, companies and the university's administrative bodies. The association organizes various information, presentation, lecture and discussion events as well as evening parties. The association aims to support its members' field-related studies and study tours. In order to support its activities, the association can also receive grants, donations and bequests, carry out fundraisers and lotteries with the relevant permission, acquire, sell and own movable and immovable property necessary for its activities, or engage in gainful activities that are directly related to the realization of the association's purpose or that are considered to be of low economic value.\\n3 LANGUAGE\\nThe language of the association is Finnish. The minutes are drawn up in Finnish.\\n4 IMPARTIALITY\\nThe association is non-partisan politically.\\n5 MEMBERS\\nMembers can be:\\n\\n     Actual members: Persons enrolled in the University of Eastern Finland (in attendance or absent) studying computer science.\\n     Supporting members: Supporting members can be individuals or legal entities that are interested in the association's activities and want to support it.\\n     Honorary members: A person who has specially supported the association's activities can be called an honorary member. Any of the members can make a proposal to be called an honorary member orally or in writing to the board, which presents the proposal to the association meeting or directly to the association meeting, where a simple majority in a possible vote is sufficient to approve the proposal. All graduated members can be elected honorary members by the board's decision.\\n     Community members: A community member can be a legal entity that is interested in the association's activities and wants to support it.\\n\\nFull members, supporting members and community members are approved by the board of the association upon application. The membership takes effect after the board's decision. Resignation from membership is done by notifying the board of directors or its chairman in writing, or by announcing the resignation in the minutes of the association's meeting. Dismissal due to non-payment of membership fee is decided by the board.\\n6 MEMBER'S OBLIGATIONS\\nThe member has the obligation to notify the association's board of directors of the information required by the Association Act whenever there are changes, but at least every five (5) years.\\n7 MEMBERSHIP FEES\\nThe size of the joining fee and the annual membership fee for regular members and supporting members will be decided separately for each member group by the autumn meeting. The board of the association decides on the membership fees of community members. Honorary presidents and honorary members do not pay membership fees.\\n8 GOVERNMENT\\nThe board consists of the chairman elected at the autumn meeting and at least seven (7), at most fifteen (15) other full members and at least zero (0) and at most five (5) alternate members. The number of regular and alternate members is decided at the autumn meeting. The board's term of office is a calendar year. The board chooses a vice-chairman and a secretary from among themselves, in addition, the board appoints a treasurer and other necessary officials.\\n9 TASKS OF THE BOARD OF DIRECTORS\\nThe board's task is to:\\n\\n     Maintains the membership list\\n     Call a meeting of the association if necessary\\n     Manages the association's affairs and finances according to the rules and the action plan.\\n\\n10 WRITING THE NAME OF THE ASSOCIATION\\nThe name of the association is written by the chairman of the board, the secretary or another member of the board appointed by the board as a signatory, each separately.\\n11 CONVENING THE BOARD OF DIRECTORS\\nThe board meets at the invitation of the chairman or the vice-chairman in his absence, when they consider there is a reason for it or when a member of the board so wishes. The board has quorum if half of the board members, including the chairman or vice chairman, are present and the board members have been informed of the meeting at least three days before the meeting, or if four-fifths (4/5) of the actual members of the board have expressed their consent to holding the meeting earlier. The board of directors decides on the method of convening the meetings in its organizational meeting. Decisions are made in the board by a simple majority with an open vote, unless someone wants a closed ticket vote. In the event of a tie, the vote of the chairman of the meeting is decisive, except for elections by lottery.\\n12 ACCOUNTS\\nThe association's accounting period is a calendar year. The treasurer presents the accounts, a written report on the use of funds and"}	\N
259	295	lomake_vastaukset	50	\N	\N	\N
172	180	directus_fields	58	{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"turvallinen_tila"}	{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"turvallinen_tila"}	\N
173	181	directus_fields	59	{"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"turvallinen_tila"}	{"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"turvallinen_tila"}	\N
174	182	directus_fields	60	{"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"turvallinen_tila"}	{"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"turvallinen_tila"}	\N
175	183	directus_collections	turvallinen_tila	{"singleton":true,"collection":"turvallinen_tila"}	{"singleton":true,"collection":"turvallinen_tila"}	\N
176	184	directus_fields	61	{"interface":"input-rich-text-md","special":null,"options":{"placeholder":"Turvallisen tilan periaatteet"},"collection":"turvallinen_tila","field":"turvallinen_tila_fi"}	{"interface":"input-rich-text-md","special":null,"options":{"placeholder":"Turvallisen tilan periaatteet"},"collection":"turvallinen_tila","field":"turvallinen_tila_fi"}	\N
177	185	directus_fields	62	{"interface":"input-rich-text-md","special":null,"options":{"placeholder":"safer space is ..."},"collection":"turvallinen_tila","field":"turvalinen_tila_en"}	{"interface":"input-rich-text-md","special":null,"options":{"placeholder":"safer space is ..."},"collection":"turvallinen_tila","field":"turvalinen_tila_en"}	\N
178	186	directus_fields	63	{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"form_submits"}	{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"form_submits"}	\N
179	187	directus_fields	64	{"width":"full","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]},"field":"status","collection":"form_submits"}	{"width":"full","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]},"field":"status","collection":"form_submits"}	\N
180	188	directus_fields	65	{"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"form_submits"}	{"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"form_submits"}	\N
181	189	directus_fields	66	{"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"form_submits"}	{"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"form_submits"}	\N
182	190	directus_collections	form_submits	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"form_submits"}	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"form_submits"}	\N
183	191	directus_fields	67	{"interface":"input","special":null,"required":true,"collection":"form_submits","field":"firm_name"}	{"interface":"input","special":null,"required":true,"collection":"form_submits","field":"firm_name"}	\N
184	192	directus_fields	68	{"interface":"input","special":null,"required":true,"collection":"form_submits","field":"firm_contact"}	{"interface":"input","special":null,"required":true,"collection":"form_submits","field":"firm_contact"}	\N
185	193	directus_fields	69	{"interface":"input-multiline","special":null,"required":false,"collection":"form_submits","field":"firm_message"}	{"interface":"input-multiline","special":null,"required":false,"collection":"form_submits","field":"firm_message"}	\N
186	194	directus_collections	form_submits	{"collection":"form_submits","icon":"dock_to_bottom","note":"Sisältää kaikki verkkosivujen lomakkeiden lähetykset","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":null,"group":null,"collapse":"open"}	{"icon":"dock_to_bottom","note":"Sisältää kaikki verkkosivujen lomakkeiden lähetykset"}	\N
187	196	directus_fields	70	{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"lomake_vastaukset"}	{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"lomake_vastaukset"}	\N
188	197	directus_fields	71	{"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"lomake_vastaukset"}	{"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"lomake_vastaukset"}	\N
189	198	directus_fields	72	{"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"lomake_vastaukset"}	{"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"lomake_vastaukset"}	\N
190	199	directus_collections	lomake_vastaukset	{"singleton":false,"collection":"lomake_vastaukset"}	{"singleton":false,"collection":"lomake_vastaukset"}	\N
260	296	lomake_vastaukset	51	\N	\N	\N
191	200	directus_fields	73	{"interface":"input","special":null,"required":true,"collection":"lomake_vastaukset","field":"firm_name"}	{"interface":"input","special":null,"required":true,"collection":"lomake_vastaukset","field":"firm_name"}	\N
192	201	directus_fields	74	{"interface":"input","special":null,"required":true,"collection":"lomake_vastaukset","field":"firm_contact"}	{"interface":"input","special":null,"required":true,"collection":"lomake_vastaukset","field":"firm_contact"}	\N
194	203	directus_collections	lomake_vastaukset	{"collection":"lomake_vastaukset","icon":null,"note":"Sisältää kaikki verkkosivun lomakkeiden vastaukset.","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":null,"group":null,"collapse":"open"}	{"note":"Sisältää kaikki verkkosivun lomakkeiden vastaukset."}	\N
193	202	directus_fields	75	{"interface":"input-multiline","special":null,"collection":"lomake_vastaukset","field":"firm_message"}	{"interface":"input-multiline","special":null,"collection":"lomake_vastaukset","field":"firm_message"}	\N
195	204	turvallinen_tila	1	{"turvallinen_tila_fi":"# Turvallinen tila\\n\\n\\"Turvallisemmat tilat\\" on termi, jota käytetään kuvaamaan yhteisön ponnistuksia luoda ympäristöjä, jotka edistävät turvallisuutta. Käytännössä turvallisempi tila edellyttää opiskelijajärjestön ja sen jäsenten vastuunottoa haastavissa tilanteissa. Konflikteja käsitellään sen sijaan että niitä siedettäisiin.\\n\\n1. On tärkeää olla kunnioittava ja välttää kysymyksiä toisen erilaisuudesta. Käsittele herkkiä aiheita huolellisesti ja varmista, että kaikilla on ääni ja heidät otetaan huomioon.\\n2. Kunnioita jokaisen fyysistä ja henkistä hyvinvointia sekä heidän oikeuttaan itsemääräämiseen. Älä tee oletuksia stereotypioiden perusteella.\\n3. Vältä rasististen tai syrjivien stereotypioiden uusintamista, vaikka se olisi tarkoitus tehdä \\"vitsinä\\" tai ironisesti. Älä häiritse ketään sanallisesti, fyysisesti tai visuaalisesti. Jos joku sanoo \\"ei\\", kunnioita heidän rajojaan ja muuta käyttäytymistäsi tarvittaessa.\\n4. Jos tilanne tuntuu epämukavalta, kerro siitä järjestön hallitukselle tai johtajille. Voit myös antaa palautetta nimettömänä.\\n5. On tärkeää olla kunnioittava ja välttää kysymyksiä toisen erilaisuudesta. Käsittele herkkiä aiheita huolellisesti ja varmista, että kaikilla on ääni ja heidät otetaan huomioon.\\n6. On olennaista puuttua, jos todistat rasismia, syrjintää, häirintää tai muuta sopimatonta käytöstä.\\n\\nValerija Kirpu toimii häirintäyhteyshenkilönä Serveri ry:ssä, hänen roolissaan sosiaalipoliittisena edustajana.\\n\\nOsallistumalla Serveri ry:hyn jäsenet sitoutuvat noudattamaan tätä käytännesääntöä ja tukemaan positiivista ja kunnioittavaa yhteisöä. Tämän käytännesäännön rikkomukset voivat johtaa kurinpitotoimenpiteisiin, mukaan lukien poistaminen Serveri ry:stä."}	{"turvallinen_tila_fi":"# Turvallinen tila\\n\\n\\"Turvallisemmat tilat\\" on termi, jota käytetään kuvaamaan yhteisön ponnistuksia luoda ympäristöjä, jotka edistävät turvallisuutta. Käytännössä turvallisempi tila edellyttää opiskelijajärjestön ja sen jäsenten vastuunottoa haastavissa tilanteissa. Konflikteja käsitellään sen sijaan että niitä siedettäisiin.\\n\\n1. On tärkeää olla kunnioittava ja välttää kysymyksiä toisen erilaisuudesta. Käsittele herkkiä aiheita huolellisesti ja varmista, että kaikilla on ääni ja heidät otetaan huomioon.\\n2. Kunnioita jokaisen fyysistä ja henkistä hyvinvointia sekä heidän oikeuttaan itsemääräämiseen. Älä tee oletuksia stereotypioiden perusteella.\\n3. Vältä rasististen tai syrjivien stereotypioiden uusintamista, vaikka se olisi tarkoitus tehdä \\"vitsinä\\" tai ironisesti. Älä häiritse ketään sanallisesti, fyysisesti tai visuaalisesti. Jos joku sanoo \\"ei\\", kunnioita heidän rajojaan ja muuta käyttäytymistäsi tarvittaessa.\\n4. Jos tilanne tuntuu epämukavalta, kerro siitä järjestön hallitukselle tai johtajille. Voit myös antaa palautetta nimettömänä.\\n5. On tärkeää olla kunnioittava ja välttää kysymyksiä toisen erilaisuudesta. Käsittele herkkiä aiheita huolellisesti ja varmista, että kaikilla on ääni ja heidät otetaan huomioon.\\n6. On olennaista puuttua, jos todistat rasismia, syrjintää, häirintää tai muuta sopimatonta käytöstä.\\n\\nValerija Kirpu toimii häirintäyhteyshenkilönä Serveri ry:ssä, hänen roolissaan sosiaalipoliittisena edustajana.\\n\\nOsallistumalla Serveri ry:hyn jäsenet sitoutuvat noudattamaan tätä käytännesääntöä ja tukemaan positiivista ja kunnioittavaa yhteisöä. Tämän käytännesäännön rikkomukset voivat johtaa kurinpitotoimenpiteisiin, mukaan lukien poistaminen Serveri ry:stä."}	\N
196	205	turvallinen_tila	1	{"id":1,"user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-29T13:19:51.778Z","turvallinen_tila_fi":"# Turvallinen tila\\n\\n\\"Turvallisemmat tilat\\" on termi, jota käytetään kuvaamaan yhteisön ponnistuksia luoda ympäristöjä, jotka edistävät turvallisuutta. Käytännössä turvallisempi tila edellyttää opiskelijajärjestön ja sen jäsenten vastuunottoa haastavissa tilanteissa. Konflikteja käsitellään sen sijaan että niitä siedettäisiin.\\n\\n1. On tärkeää olla kunnioittava ja välttää kysymyksiä toisen erilaisuudesta. Käsittele herkkiä aiheita huolellisesti ja varmista, että kaikilla on ääni ja heidät otetaan huomioon.\\n2. Kunnioita jokaisen fyysistä ja henkistä hyvinvointia sekä heidän oikeuttaan itsemääräämiseen. Älä tee oletuksia stereotypioiden perusteella.\\n3. Vältä rasististen tai syrjivien stereotypioiden uusintamista, vaikka se olisi tarkoitus tehdä \\"vitsinä\\" tai ironisesti. Älä häiritse ketään sanallisesti, fyysisesti tai visuaalisesti. Jos joku sanoo \\"ei\\", kunnioita heidän rajojaan ja muuta käyttäytymistäsi tarvittaessa.\\n4. Jos tilanne tuntuu epämukavalta, kerro siitä järjestön hallitukselle tai johtajille. Voit myös antaa palautetta nimettömänä.\\n5. On tärkeää olla kunnioittava ja välttää kysymyksiä toisen erilaisuudesta. Käsittele herkkiä aiheita huolellisesti ja varmista, että kaikilla on ääni ja heidät otetaan huomioon.\\n6. On olennaista puuttua, jos todistat rasismia, syrjintää, häirintää tai muuta sopimatonta käytöstä.\\n\\nValerija Kirpu toimii häirintäyhteyshenkilönä Serveri ry:ssä, hänen roolissaan sosiaalipoliittisena edustajana.\\n\\nOsallistumalla Serveri ry:hyn jäsenet sitoutuvat noudattamaan tätä käytännesääntöä ja tukemaan positiivista ja kunnioittavaa yhteisöä. Tämän käytännesäännön rikkomukset voivat johtaa kurinpitotoimenpiteisiin, mukaan lukien poistaminen Serveri ry:stä.","turvalinen_tila_en":"# Safer Spaces\\n\\nSafer spaces\\" is a term used to describe the communal effort to create environments that promote safety. In practice, a safer space involves the student organization and its members taking responsibility for challenging situations. Conflicts are addressed instead of being tolerated.\\n\\n1. It is important to be respectful, avoiding any questioning of someone's differences. Handle sensitive topics with care, and ensure that everyone has a voice and is included.\\n2. Respect everyone's physical and mental well-being, as well as their right to self-determination. Do not make assumptions based on stereotypes.\\n3. Avoid reproducing racist or discriminatory stereotypes, even if intended as \\"jokes\\" or irony. Do not harass anyone verbally, physically, or visually. If someone says \\"no,\\" respect their boundaries and change your behavior if necessary.\\n4. If a situation feels uncomfortable, raise it with the organization's board or leadership. You can also give feedback anonymously.\\n5. It is important to be respectful, avoiding any questioning of someone's differences. Handle sensitive topics with care, and ensure that everyone has a voice and is included.\\n6. It is essential to intervene if you witness racism, discrimination, harassment, or any other inappropriate behavior.\\n\\nValerija Kirpu serves as our harassment contact person at Serveri ry, in her role as the social policy representative.\\n\\nBy participating in the Serveri ry, members agree to adhere to this Code of Conduct and support a positive and respectful community. Any violations of this Code of Conduct may result in disciplinary action, up to and including removal from the Serveri ry."}	{"turvalinen_tila_en":"# Safer Spaces\\n\\nSafer spaces\\" is a term used to describe the communal effort to create environments that promote safety. In practice, a safer space involves the student organization and its members taking responsibility for challenging situations. Conflicts are addressed instead of being tolerated.\\n\\n1. It is important to be respectful, avoiding any questioning of someone's differences. Handle sensitive topics with care, and ensure that everyone has a voice and is included.\\n2. Respect everyone's physical and mental well-being, as well as their right to self-determination. Do not make assumptions based on stereotypes.\\n3. Avoid reproducing racist or discriminatory stereotypes, even if intended as \\"jokes\\" or irony. Do not harass anyone verbally, physically, or visually. If someone says \\"no,\\" respect their boundaries and change your behavior if necessary.\\n4. If a situation feels uncomfortable, raise it with the organization's board or leadership. You can also give feedback anonymously.\\n5. It is important to be respectful, avoiding any questioning of someone's differences. Handle sensitive topics with care, and ensure that everyone has a voice and is included.\\n6. It is essential to intervene if you witness racism, discrimination, harassment, or any other inappropriate behavior.\\n\\nValerija Kirpu serves as our harassment contact person at Serveri ry, in her role as the social policy representative.\\n\\nBy participating in the Serveri ry, members agree to adhere to this Code of Conduct and support a positive and respectful community. Any violations of this Code of Conduct may result in disciplinary action, up to and including removal from the Serveri ry.","user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-29T13:19:51.778Z"}	\N
197	206	directus_permissions	9	{"role":null,"collection":"turvallinen_tila","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"turvallinen_tila","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N
198	207	directus_permissions	7	{"id":7,"role":null,"collection":"news","action":"read","permissions":{},"validation":{},"presets":null,"fields":["fi_title","en_title","image","fi_text","en_text","id","sort","status","date_created"]}	{"role":null,"collection":"news","action":"read","permissions":{},"validation":{},"presets":null,"fields":["fi_title","en_title","image","fi_text","en_text","id","sort","status","date_created"]}	\N
199	208	directus_permissions	8	{"id":8,"role":null,"collection":"serveri_rules","action":"read","permissions":{},"validation":{},"presets":null,"fields":["date_updated","rules_fi","rules_en"]}	{"role":null,"collection":"serveri_rules","action":"read","permissions":{},"validation":{},"presets":null,"fields":["date_updated","rules_fi","rules_en"]}	\N
200	209	directus_permissions	9	{"id":9,"role":null,"collection":"turvallinen_tila","action":"read","permissions":{},"validation":{},"presets":null,"fields":["date_updated","turvallinen_tila_fi","turvalinen_tila_en"]}	{"role":null,"collection":"turvallinen_tila","action":"read","permissions":{},"validation":{},"presets":null,"fields":["date_updated","turvallinen_tila_fi","turvalinen_tila_en"]}	\N
201	210	news	1	{"status":"published","fi_title":"Muista YTHS maksu","en_title":"Remember YTHS payment","image":"https://sammakko.fi/wp-content/uploads/2022/08/THmaksubanneri-1080x675.png","fi_text":"Korkeakouluopiskelijoiden opiskeluterveydenhuollosta annetun lain mukaiset opiskeluterveydenhuollon maksujen määrät vuodelle 2023 on vahvistettu.\\n\\nKorkeakouluopiskelijoiden opiskeluterveydenhuollon opiskelijakohtainen terveydenhoitomaksu on 73,60 euroa, eli 36,80 euroa lukukautta kohden vuonna 2023. Opiskelijan tulee maksaa terveydenhoitomaksu Kelalle oma-aloitteisesti sekä kevät- että syyslukukaudelta.\\n\\nTerveydenhoitomaksu nousee kahdella eurolla edellisvuoteen verrattuna palvelujen saatavuuden parantamiseksi. Viivästymismaksu sekä käyttämättä jääneistä ajoista perittävä maksu säilyvät ennallaan. Kela perii viivästymismaksuna 5 euroa, jos opiskelija maksaa terveydenhoitomaksunsa myöhässä.\\n\\n[Maksa nyt](https://www.kela.fi/ajankohtaista-henkiloasiakkaat/4943918/korkeakouluopiskelijat-voivat-nyt-maksaa-vuoden-2023-terveydenhoitomaksun-kelalle) (kela.fi)","en_text":"Students who are completing a degree and have registered as attending a traditional university or a university of applied sciences must pay a healthcare fee to Kela each term. The 2023 rate of the student healthcare fee is EUR 36.80 per term. Students can pay the fee starting now.\\n\\nIn 2023, the student healthcare fee in higher education is 36.80 euros per term. The fee for the whole calendar year, i.e. the spring and autumn term 2023, can be paid at the same time. Students are not billed for the fee but are expected to pay it on their own initiative.\\n\\nThe due date of payment is determined based on the date on which the student has registered as attending. For the spring term, the healthcare fee must be paid by 31 January at the latest, provided the student has registered as attending by then.\\n\\n[Pay now](https://www.kela.fi/news-archive/4943918/higher-education-students-can-pay-the-healthcare-fee-for-2023-to-kela-now) (kela.fi)"}	{"status":"published","fi_title":"Muista YTHS maksu","en_title":"Remember YTHS payment","image":"https://sammakko.fi/wp-content/uploads/2022/08/THmaksubanneri-1080x675.png","fi_text":"Korkeakouluopiskelijoiden opiskeluterveydenhuollosta annetun lain mukaiset opiskeluterveydenhuollon maksujen määrät vuodelle 2023 on vahvistettu.\\n\\nKorkeakouluopiskelijoiden opiskeluterveydenhuollon opiskelijakohtainen terveydenhoitomaksu on 73,60 euroa, eli 36,80 euroa lukukautta kohden vuonna 2023. Opiskelijan tulee maksaa terveydenhoitomaksu Kelalle oma-aloitteisesti sekä kevät- että syyslukukaudelta.\\n\\nTerveydenhoitomaksu nousee kahdella eurolla edellisvuoteen verrattuna palvelujen saatavuuden parantamiseksi. Viivästymismaksu sekä käyttämättä jääneistä ajoista perittävä maksu säilyvät ennallaan. Kela perii viivästymismaksuna 5 euroa, jos opiskelija maksaa terveydenhoitomaksunsa myöhässä.\\n\\n[Maksa nyt](https://www.kela.fi/ajankohtaista-henkiloasiakkaat/4943918/korkeakouluopiskelijat-voivat-nyt-maksaa-vuoden-2023-terveydenhoitomaksun-kelalle) (kela.fi)","en_text":"Students who are completing a degree and have registered as attending a traditional university or a university of applied sciences must pay a healthcare fee to Kela each term. The 2023 rate of the student healthcare fee is EUR 36.80 per term. Students can pay the fee starting now.\\n\\nIn 2023, the student healthcare fee in higher education is 36.80 euros per term. The fee for the whole calendar year, i.e. the spring and autumn term 2023, can be paid at the same time. Students are not billed for the fee but are expected to pay it on their own initiative.\\n\\nThe due date of payment is determined based on the date on which the student has registered as attending. For the spring term, the healthcare fee must be paid by 31 January at the latest, provided the student has registered as attending by then.\\n\\n[Pay now](https://www.kela.fi/news-archive/4943918/higher-education-students-can-pay-the-healthcare-fee-for-2023-to-kela-now) (kela.fi)"}	\N
261	297	lomake_vastaukset	52	\N	\N	\N
263	326	directus_fields	76	{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"partners"}	{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"partners"}	\N
243	279	lomake_vastaukset	34	\N	\N	\N
244	280	lomake_vastaukset	35	\N	\N	\N
265	328	directus_fields	77	{"width":"full","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]},"field":"status","collection":"partners"}	{"width":"full","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]},"field":"status","collection":"partners"}	\N
202	211	news	1	{"id":1,"status":"published","sort":null,"user_created":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_created":"2023-04-29T13:58:50.555Z","user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-29T13:59:40.317Z","fi_title":"Muista YTHS maksu","en_title":"Remember YTHS payment","image":"https://cdn.discordapp.com/attachments/492188265487532032/1101870335789383720/THmaksubanneri-1080x675.png","fi_text":"Korkeakouluopiskelijoiden opiskeluterveydenhuollosta annetun lain mukaiset opiskeluterveydenhuollon maksujen määrät vuodelle 2023 on vahvistettu.\\n\\nKorkeakouluopiskelijoiden opiskeluterveydenhuollon opiskelijakohtainen terveydenhoitomaksu on 73,60 euroa, eli 36,80 euroa lukukautta kohden vuonna 2023. Opiskelijan tulee maksaa terveydenhoitomaksu Kelalle oma-aloitteisesti sekä kevät- että syyslukukaudelta.\\n\\nTerveydenhoitomaksu nousee kahdella eurolla edellisvuoteen verrattuna palvelujen saatavuuden parantamiseksi. Viivästymismaksu sekä käyttämättä jääneistä ajoista perittävä maksu säilyvät ennallaan. Kela perii viivästymismaksuna 5 euroa, jos opiskelija maksaa terveydenhoitomaksunsa myöhässä.\\n\\n[Maksa nyt](https://www.kela.fi/ajankohtaista-henkiloasiakkaat/4943918/korkeakouluopiskelijat-voivat-nyt-maksaa-vuoden-2023-terveydenhoitomaksun-kelalle) (kela.fi)","en_text":"Students who are completing a degree and have registered as attending a traditional university or a university of applied sciences must pay a healthcare fee to Kela each term. The 2023 rate of the student healthcare fee is EUR 36.80 per term. Students can pay the fee starting now.\\n\\nIn 2023, the student healthcare fee in higher education is 36.80 euros per term. The fee for the whole calendar year, i.e. the spring and autumn term 2023, can be paid at the same time. Students are not billed for the fee but are expected to pay it on their own initiative.\\n\\nThe due date of payment is determined based on the date on which the student has registered as attending. For the spring term, the healthcare fee must be paid by 31 January at the latest, provided the student has registered as attending by then.\\n\\n[Pay now](https://www.kela.fi/news-archive/4943918/higher-education-students-can-pay-the-healthcare-fee-for-2023-to-kela-now) (kela.fi)"}	{"image":"https://cdn.discordapp.com/attachments/492188265487532032/1101870335789383720/THmaksubanneri-1080x675.png","user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-29T13:59:40.317Z"}	\N
203	212	directus_permissions	10	{"role":null,"collection":"lomake_vastaukset","action":"update"}	{"role":null,"collection":"lomake_vastaukset","action":"update"}	\N
204	214	directus_permissions	11	{"role":null,"collection":"lomake_vastaukset","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"lomake_vastaukset","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N
205	215	directus_permissions	12	{"role":null,"collection":"lomake_vastaukset","action":"update","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"lomake_vastaukset","action":"update","fields":["*"],"permissions":{},"validation":{}}	\N
206	216	directus_permissions	13	{"role":null,"collection":"lomake_vastaukset","action":"create","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"lomake_vastaukset","action":"create","fields":["*"],"permissions":{},"validation":{}}	\N
207	217	directus_users	0891a0cd-876b-4a0d-a22e-0cce30121382	{"id":"0891a0cd-876b-4a0d-a22e-0cce30121382","first_name":"Admin","last_name":"User","email":"dev@serveriry.fi","password":"**********","location":null,"title":null,"description":null,"tags":null,"avatar":null,"language":null,"theme":"auto","tfa_secret":null,"status":"active","role":"7bd45b9d-d719-4ab1-b7ec-2c68f2eefc76","token":"**********","last_access":"2023-04-29T15:05:42.618Z","last_page":"/content","provider":"default","external_identifier":null,"auth_data":null,"email_notifications":true}	{"token":"**********"}	\N
208	218	news	1	{"id":1,"status":"published","sort":null,"user_created":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_created":"2023-04-29T13:58:50.555Z","user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-29T15:56:49.224Z","fi_title":"Muista YTHS maksu","en_title":"Remember YTHS payment","image":"https://cdn.discordapp.com/attachments/492188265487532032/1101870335789383720/THmaksubanneri-1080x675.png","fi_text":"Korkeakouluopiskelijoiden opiskeluterveydenhuollosta annetun lain mukaiset opiskeluterveydenhuollon maksujen määrät vuodelle 2023 on vahvistettu.\\n\\nKorkeakouluopiskelijoiden opiskeluterveydenhuollon opiskelijakohtainen terveydenhoitomaksu on 73,60 euroa, eli 36,80 euroa lukukautta kohden vuonna 2023. Opiskelijan tulee maksaa terveydenhoitomaksu Kelalle oma-aloitteisesti sekä kevät- että syyslukukaudelta.\\n\\nTerveydenhoitomaksu nousee kahdella eurolla edellisvuoteen verrattuna palvelujen saatavuuden parantamiseksi. Viivästymismaksu sekä käyttämättä jääneistä ajoista perittävä maksu säilyvät ennallaan. Kela perii viivästymismaksuna 5 euroa, jos opiskelija maksaa terveydenhoitomaksunsa myöhässä.\\n[maksa nyt](https://www.kela.fi/ajankohtaista-henkiloasiakkaat/4943918/korkeakouluopiskelijat-voivat-nyt-maksaa-vuoden-2023-terveydenhoitomaksun-kelalle)","en_text":"Students who are completing a degree and have registered as attending a traditional university or a university of applied sciences must pay a healthcare fee to Kela each term. The 2023 rate of the student healthcare fee is EUR 36.80 per term. Students can pay the fee starting now.\\n\\nIn 2023, the student healthcare fee in higher education is 36.80 euros per term. The fee for the whole calendar year, i.e. the spring and autumn term 2023, can be paid at the same time. Students are not billed for the fee but are expected to pay it on their own initiative.\\n\\nThe due date of payment is determined based on the date on which the student has registered as attending. For the spring term, the healthcare fee must be paid by 31 January at the latest, provided the student has registered as attending by then.\\n\\n[Pay now](https://www.kela.fi/news-archive/4943918/higher-education-students-can-pay-the-healthcare-fee-for-2023-to-kela-now) (kela.fi)"}	{"fi_text":"Korkeakouluopiskelijoiden opiskeluterveydenhuollosta annetun lain mukaiset opiskeluterveydenhuollon maksujen määrät vuodelle 2023 on vahvistettu.\\n\\nKorkeakouluopiskelijoiden opiskeluterveydenhuollon opiskelijakohtainen terveydenhoitomaksu on 73,60 euroa, eli 36,80 euroa lukukautta kohden vuonna 2023. Opiskelijan tulee maksaa terveydenhoitomaksu Kelalle oma-aloitteisesti sekä kevät- että syyslukukaudelta.\\n\\nTerveydenhoitomaksu nousee kahdella eurolla edellisvuoteen verrattuna palvelujen saatavuuden parantamiseksi. Viivästymismaksu sekä käyttämättä jääneistä ajoista perittävä maksu säilyvät ennallaan. Kela perii viivästymismaksuna 5 euroa, jos opiskelija maksaa terveydenhoitomaksunsa myöhässä.\\n[maksa nyt](https://www.kela.fi/ajankohtaista-henkiloasiakkaat/4943918/korkeakouluopiskelijat-voivat-nyt-maksaa-vuoden-2023-terveydenhoitomaksun-kelalle)","user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-29T15:56:49.224Z"}	\N
209	219	news	1	{"id":1,"status":"published","sort":null,"user_created":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_created":"2023-04-29T13:58:50.555Z","user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-29T15:57:07.360Z","fi_title":"Muista YTHS maksu","en_title":"Remember YTHS payment","image":"https://cdn.discordapp.com/attachments/492188265487532032/1101870335789383720/THmaksubanneri-1080x675.png","fi_text":"Korkeakouluopiskelijoiden opiskeluterveydenhuollosta annetun lain mukaiset opiskeluterveydenhuollon maksujen määrät vuodelle 2023 on vahvistettu.\\n\\nKorkeakouluopiskelijoiden opiskeluterveydenhuollon opiskelijakohtainen terveydenhoitomaksu on 73,60 euroa, eli 36,80 euroa lukukautta kohden vuonna 2023. Opiskelijan tulee maksaa terveydenhoitomaksu Kelalle oma-aloitteisesti sekä kevät- että syyslukukaudelta.\\n\\nTerveydenhoitomaksu nousee kahdella eurolla edellisvuoteen verrattuna palvelujen saatavuuden parantamiseksi. Viivästymismaksu sekä käyttämättä jääneistä ajoista perittävä maksu säilyvät ennallaan. Kela perii viivästymismaksuna 5 euroa, jos opiskelija maksaa terveydenhoitomaksunsa myöhässä.\\n\\n[Maksa nyt](https://www.kela.fi/ajankohtaista-henkiloasiakkaat/4943918/korkeakouluopiskelijat-voivat-nyt-maksaa-vuoden-2023-terveydenhoitomaksun-kelalle) (kela.fi)","en_text":"Students who are completing a degree and have registered as attending a traditional university or a university of applied sciences must pay a healthcare fee to Kela each term. The 2023 rate of the student healthcare fee is EUR 36.80 per term. Students can pay the fee starting now.\\n\\nIn 2023, the student healthcare fee in higher education is 36.80 euros per term. The fee for the whole calendar year, i.e. the spring and autumn term 2023, can be paid at the same time. Students are not billed for the fee but are expected to pay it on their own initiative.\\n\\nThe due date of payment is determined based on the date on which the student has registered as attending. For the spring term, the healthcare fee must be paid by 31 January at the latest, provided the student has registered as attending by then.\\n\\n[Pay now](https://www.kela.fi/news-archive/4943918/higher-education-students-can-pay-the-healthcare-fee-for-2023-to-kela-now) (kela.fi)"}	{"fi_text":"Korkeakouluopiskelijoiden opiskeluterveydenhuollosta annetun lain mukaiset opiskeluterveydenhuollon maksujen määrät vuodelle 2023 on vahvistettu.\\n\\nKorkeakouluopiskelijoiden opiskeluterveydenhuollon opiskelijakohtainen terveydenhoitomaksu on 73,60 euroa, eli 36,80 euroa lukukautta kohden vuonna 2023. Opiskelijan tulee maksaa terveydenhoitomaksu Kelalle oma-aloitteisesti sekä kevät- että syyslukukaudelta.\\n\\nTerveydenhoitomaksu nousee kahdella eurolla edellisvuoteen verrattuna palvelujen saatavuuden parantamiseksi. Viivästymismaksu sekä käyttämättä jääneistä ajoista perittävä maksu säilyvät ennallaan. Kela perii viivästymismaksuna 5 euroa, jos opiskelija maksaa terveydenhoitomaksunsa myöhässä.\\n\\n[Maksa nyt](https://www.kela.fi/ajankohtaista-henkiloasiakkaat/4943918/korkeakouluopiskelijat-voivat-nyt-maksaa-vuoden-2023-terveydenhoitomaksun-kelalle) (kela.fi)","user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-29T15:57:07.360Z"}	\N
210	220	lomake_vastaukset	1	\N	\N	\N
211	221	lomake_vastaukset	2	\N	\N	\N
212	222	lomake_vastaukset	3	\N	\N	\N
213	224	lomake_vastaukset	4	\N	\N	\N
214	223	lomake_vastaukset	5	\N	\N	\N
215	225	lomake_vastaukset	6	\N	\N	\N
216	226	lomake_vastaukset	7	\N	\N	\N
217	227	lomake_vastaukset	8	\N	\N	\N
218	228	lomake_vastaukset	9	\N	\N	\N
219	229	lomake_vastaukset	10	\N	\N	\N
220	230	lomake_vastaukset	11	\N	\N	\N
221	231	lomake_vastaukset	12	\N	\N	\N
222	232	lomake_vastaukset	13	\N	\N	\N
223	233	lomake_vastaukset	14	\N	\N	\N
224	234	lomake_vastaukset	15	\N	\N	\N
225	235	lomake_vastaukset	16	\N	\N	\N
226	236	lomake_vastaukset	17	\N	\N	\N
227	237	lomake_vastaukset	18	\N	\N	\N
228	238	lomake_vastaukset	19	\N	\N	\N
229	239	lomake_vastaukset	20	\N	\N	\N
230	240	lomake_vastaukset	21	\N	\N	\N
231	241	lomake_vastaukset	22	\N	\N	\N
232	242	lomake_vastaukset	23	\N	\N	\N
233	243	lomake_vastaukset	24	\N	\N	\N
234	244	lomake_vastaukset	25	\N	\N	\N
235	271	lomake_vastaukset	26	\N	\N	\N
236	272	lomake_vastaukset	27	\N	\N	\N
237	273	lomake_vastaukset	28	\N	\N	\N
238	274	lomake_vastaukset	29	\N	\N	\N
245	281	lomake_vastaukset	36	\N	\N	\N
246	282	lomake_vastaukset	37	\N	\N	\N
247	283	lomake_vastaukset	38	\N	\N	\N
248	284	lomake_vastaukset	39	\N	\N	\N
249	285	lomake_vastaukset	40	\N	\N	\N
250	286	lomake_vastaukset	41	\N	\N	\N
251	287	lomake_vastaukset	42	\N	\N	\N
252	288	lomake_vastaukset	43	\N	\N	\N
253	289	lomake_vastaukset	44	\N	\N	\N
254	290	lomake_vastaukset	45	\N	\N	\N
255	291	lomake_vastaukset	46	\N	\N	\N
256	292	lomake_vastaukset	47	\N	\N	\N
257	293	lomake_vastaukset	48	\N	\N	\N
258	294	lomake_vastaukset	49	\N	\N	\N
266	329	directus_fields	78	{"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"partners"}	{"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"partners"}	\N
267	330	directus_fields	79	{"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"partners"}	{"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"partners"}	\N
268	331	directus_fields	80	{"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"partners"}	{"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"partners"}	\N
269	332	directus_fields	81	{"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"partners"}	{"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"partners"}	\N
270	333	directus_collections	partners	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"partners"}	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"partners"}	\N
271	334	lomake_vastaukset	55	\N	\N	\N
272	335	lomake_vastaukset	56	\N	\N	\N
273	336	lomake_vastaukset	57	\N	\N	\N
274	337	directus_fields	82	{"interface":"input","special":null,"options":{"placeholder":"Yrityksen nimi"},"collection":"partners","field":"name"}	{"interface":"input","special":null,"options":{"placeholder":"Yrityksen nimi"},"collection":"partners","field":"name"}	\N
275	338	directus_fields	82	{"id":82,"collection":"partners","field":"name","special":null,"interface":"input","options":{"placeholder":"Yrityksen nimi"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"partners","field":"name","special":null,"interface":"input","options":{"placeholder":"Yrityksen nimi"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	\N
277	340	lomake_vastaukset	58	\N	\N	\N
278	341	directus_fields	84	{"interface":"input","special":null,"required":true,"options":{"placeholder":"linkki yrityksen logo kuvaan"},"collection":"partners","field":"img"}	{"interface":"input","special":null,"required":true,"options":{"placeholder":"linkki yrityksen logo kuvaan"},"collection":"partners","field":"img"}	\N
279	342	directus_permissions	14	{"role":null,"collection":"partners","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"partners","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N
280	343	directus_permissions	14	{"id":14,"role":null,"collection":"partners","action":"read","permissions":{},"validation":{},"presets":null,"fields":["name","url","img"]}	{"role":null,"collection":"partners","action":"read","permissions":{},"validation":{},"presets":null,"fields":["name","url","img"]}	\N
276	339	directus_fields	83	{"interface":"input","special":null,"required":true,"options":{"placeholder":"Yrityksen verkkosivujen url osoite"},"collection":"partners","field":"url"}	{"interface":"input","special":null,"required":true,"options":{"placeholder":"Yrityksen verkkosivujen url osoite"},"collection":"partners","field":"url"}	\N
281	344	partners	1	{"name":"Efecte","url":"https://www.efecte.com/","img":"https://api.serveriry.fi/uploads/efecte_logo_eaa50a1bf4.png"}	{"name":"Efecte","url":"https://www.efecte.com/","img":"https://api.serveriry.fi/uploads/efecte_logo_eaa50a1bf4.png"}	\N
282	345	partners	2	{"name":"Innofactor","url":"https://www.innofactor.com/","img":"https://api.serveriry.fi/uploads/innofactor_365559a4a1.png"}	{"name":"Innofactor","url":"https://www.innofactor.com/","img":"https://api.serveriry.fi/uploads/innofactor_365559a4a1.png"}	\N
283	346	lomake_vastaukset	59	\N	\N	\N
284	347	partners	3	{"status":"published","name":"Olvi","url":"https://www.olvi.fi/","img":"https://upload.wikimedia.org/wikipedia/fi/thumb/f/f9/Olvin_logo.svg/1200px-Olvin_logo.svg.png"}	{"status":"published","name":"Olvi","url":"https://www.olvi.fi/","img":"https://upload.wikimedia.org/wikipedia/fi/thumb/f/f9/Olvin_logo.svg/1200px-Olvin_logo.svg.png"}	\N
285	348	partners	4	{"status":"published","name":"Hurja","url":"https://www.hurja.fi/","img":"https://api.serveriry.fi/uploads/g9_1f987a430f.png"}	{"status":"published","name":"Hurja","url":"https://www.hurja.fi/","img":"https://api.serveriry.fi/uploads/g9_1f987a430f.png"}	\N
286	349	partners	2	{"id":2,"status":"published","user_created":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_created":"2023-04-29T18:24:08.307Z","user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-29T18:24:47.898Z","name":"Innofactor","url":"https://www.innofactor.com/","img":"https://api.serveriry.fi/uploads/innofactor_365559a4a1.png"}	{"status":"published","user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-29T18:24:47.898Z"}	\N
342	438	lomake_vastaukset	91	{"firm_message":"Morooo","firm_contact":"savonen.emppu@gmail.com","firm_name":"Efecte"}	{"firm_message":"Morooo","firm_contact":"savonen.emppu@gmail.com","firm_name":"Efecte"}	\N
287	350	partners	1	{"id":1,"status":"published","user_created":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_created":"2023-04-29T18:23:51.629Z","user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-29T18:24:50.932Z","name":"Efecte","url":"https://www.efecte.com/","img":"https://api.serveriry.fi/uploads/efecte_logo_eaa50a1bf4.png"}	{"status":"published","user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-29T18:24:50.932Z"}	\N
288	351	partners	5	{"name":"Etteplan","status":"published","url":"https://www.etteplan.com/","img":"https://cdn.discordapp.com/attachments/492188265487532032/1082006440102871131/logo.svg"}	{"name":"Etteplan","status":"published","url":"https://www.etteplan.com/","img":"https://cdn.discordapp.com/attachments/492188265487532032/1082006440102871131/logo.svg"}	\N
289	352	partners	6	{"status":"published","name":"UEF Avoin Yliopisto","url":"https://api.serveriry.fi/uploads/uefjatkuva_5bbe818e67.png","img":"https://www.uef.fi/sites/default/files/2022-02/Jatkuva_oppiminen_logo_yhdistelma_2.png"}	{"status":"published","name":"UEF Avoin Yliopisto","url":"https://api.serveriry.fi/uploads/uefjatkuva_5bbe818e67.png","img":"https://www.uef.fi/sites/default/files/2022-02/Jatkuva_oppiminen_logo_yhdistelma_2.png"}	\N
290	353	lomake_vastaukset	60	\N	\N	\N
291	354	partners	7	{"status":"published","name":"Calacucco","url":"https://npg.fi/ravintolat/calacucco/","img":"https://cdn.discordapp.com/attachments/492188265487532032/1084905505119535244/kalacucco-removebg-preview.png"}	{"status":"published","name":"Calacucco","url":"https://npg.fi/ravintolat/calacucco/","img":"https://cdn.discordapp.com/attachments/492188265487532032/1084905505119535244/kalacucco-removebg-preview.png"}	\N
292	355	partners	8	{"status":"published","name":"Tek","url":"https://www.tek.fi/","img":"https://www.tek.fi/sites/default/files/attachments/TEK_logo_CMYK_sininen.png"}	{"status":"published","name":"Tek","url":"https://www.tek.fi/","img":"https://www.tek.fi/sites/default/files/attachments/TEK_logo_CMYK_sininen.png"}	\N
293	356	lomake_vastaukset	61	\N	\N	\N
294	357	lomake_vastaukset	62	\N	\N	\N
295	358	lomake_vastaukset	63	\N	\N	\N
296	359	lomake_vastaukset	64	\N	\N	\N
297	360	lomake_vastaukset	65	\N	\N	\N
298	361	lomake_vastaukset	66	\N	\N	\N
299	362	lomake_vastaukset	67	\N	\N	\N
300	363	lomake_vastaukset	68	\N	\N	\N
301	364	directus_fields	10	{"id":10,"collection":"LandingPage","field":"fi_title","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"LandingPage","field":"fi_title","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N
302	365	directus_fields	11	{"id":11,"collection":"LandingPage","field":"en_title","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"LandingPage","field":"en_title","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N
303	366	lomake_vastaukset	69	\N	\N	\N
304	367	directus_fields	14	{"id":14,"collection":"LandingPage","field":"fi_button_text","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"LandingPage","field":"fi_button_text","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N
305	368	directus_fields	15	{"id":15,"collection":"LandingPage","field":"en_button_text","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"LandingPage","field":"en_button_text","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N
306	369	directus_fields	17	{"id":17,"collection":"LandingPage","field":"fi_button_url","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"LandingPage","field":"fi_button_url","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N
309	372	directus_fields	12	{"id":12,"collection":"LandingPage","field":"fi_description","special":null,"interface":"input-multiline","options":{"softLength":null},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"LandingPage","field":"fi_description","special":null,"interface":"input-multiline","options":{"softLength":null},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N
315	378	directus_fields	85	{"interface":"input-multiline","special":null,"options":{"placeholder":null},"collection":"LandingPage","field":"fi_long_desc"}	{"interface":"input-multiline","special":null,"options":{"placeholder":null},"collection":"LandingPage","field":"fi_long_desc"}	\N
316	379	directus_fields	86	{"interface":"input-multiline","special":null,"collection":"LandingPage","field":"en_long_desc"}	{"interface":"input-multiline","special":null,"collection":"LandingPage","field":"en_long_desc"}	\N
343	439	lomake_vastaukset	92	{"firm_message":"Morooo","firm_contact":"savonen.emppu@gmail.com","firm_name":"Efecte"}	{"firm_message":"Morooo","firm_contact":"savonen.emppu@gmail.com","firm_name":"Efecte"}	\N
307	370	directus_fields	16	{"id":16,"collection":"LandingPage","field":"en_button_url","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":11,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"LandingPage","field":"en_button_url","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":11,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N
308	371	directus_fields	12	{"id":12,"collection":"LandingPage","field":"fi_description","special":null,"interface":"input-multiline","options":{"softLength":128},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"LandingPage","field":"fi_description","special":null,"interface":"input-multiline","options":{"softLength":128},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N
310	373	lomake_vastaukset	70	\N	\N	\N
311	374	lomake_vastaukset	71	\N	\N	\N
312	375	lomake_vastaukset	72	\N	\N	\N
313	376	lomake_vastaukset	73	\N	\N	\N
314	377	lomake_vastaukset	74	\N	\N	\N
317	380	directus_fields	85	{"id":85,"collection":"LandingPage","field":"fi_long_desc","special":null,"interface":"input-rich-text-md","options":{"placeholder":null},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"LandingPage","field":"fi_long_desc","special":null,"interface":"input-rich-text-md","options":{"placeholder":null},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N
318	381	directus_fields	86	{"id":86,"collection":"LandingPage","field":"en_long_desc","special":null,"interface":"input-rich-text-md","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"LandingPage","field":"en_long_desc","special":null,"interface":"input-rich-text-md","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N
319	382	lomake_vastaukset	75	{"firm_message":"ASDASD","firm_contact":"aasd@asd.com","firm_name":"asd"}	{"firm_message":"ASDASD","firm_contact":"aasd@asd.com","firm_name":"asd"}	\N
320	406	LandingPage	1	{"id":1,"user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-29T18:37:27.682Z","fi_title":"Servetti ry","en_title":"Servetti ry","fi_description":"Itä-Suomen yliopiston Kuopion kampuksen tietojenkäsittelytieteen opiskelijoiden ainejärjestö ","en_description":"The computer science students' subject organization of the Kuopio campus of the University of Eastern Finland","fi_button_text":"Millaista tietojenkäsittelytiede on?","en_button_text":"What is computer science like?","en_button_url":"/opiskelu/tkt","fi_button_url":"/opiskelu/tkt","fi_long_desc":"# Mitä me teemme?\\n\\nToimimme linkkinä yliopiston ja opiskelijoiden välillä mm. keräämällä ja välittämällä opiskelijapalautetta yliopistolle. Tarjoamme opiskelijajäsenillemme ohjausta edunvalvonnallisissa asioissa ja järjestämme opintojen oheen vapaa-ajan toimintaa sekä itsenäisesti että yhdessä muiden ainejärjestöjen kanssa. Järjestämme toimintaa myös työelämään valmistelevalla näkökulmalla ottamalla silloin tällöin vaikutteita suoraan tietojenkäsittelytieteen alan yritysten toiminnasta, jakamalla tietoa valmistumisen jälkeisistä mahdollisuusista ja helpotamme siten tulevien tietojenkäsittelijöiden erikoistuvaa suuntautumista.\\n\\nServerit ovat legendaarisia hauskanpitäjiä - omien hippaloiden lisäksi valkohaalariset tunnetaankin ahkerina kuokkijoina ja keräämme mielellämme kyseenalaista kunniaa opiskelijatapahtumissa ympäri Suomen. Ei siis ihme että Serverin tavaramerkkinä pidetään loistavaa yhteishenkeä ja mahtavaa aktiivisuutta, nörtti-imagosta puhumattakaan! ","en_long_desc":"# What do we do?\\n\\nWe act as a link between the university and students, for example by collecting and transmitting student feedback to the university. We offer our student members guidance on advocacy issues and organise extracurricular activities, both independently and in cooperation with other student organisations. We also organise activities with a view to preparing students for the world of work by occasionally taking direct inspiration from companies in the computer science sector, sharing information about opportunities after graduation and thus facilitating the specialisation of future computer scientists.\\n\\nServers are legendary fun lovers - in addition to our own hijinks, the Whitefish are known as hard-working hackers and we like to garner questionable glory at student events all over Finland. It's no wonder that Server is known for its great team spirit and awesome activity, not to mention its nerd image! "}	{"fi_long_desc":"# Mitä me teemme?\\n\\nToimimme linkkinä yliopiston ja opiskelijoiden välillä mm. keräämällä ja välittämällä opiskelijapalautetta yliopistolle. Tarjoamme opiskelijajäsenillemme ohjausta edunvalvonnallisissa asioissa ja järjestämme opintojen oheen vapaa-ajan toimintaa sekä itsenäisesti että yhdessä muiden ainejärjestöjen kanssa. Järjestämme toimintaa myös työelämään valmistelevalla näkökulmalla ottamalla silloin tällöin vaikutteita suoraan tietojenkäsittelytieteen alan yritysten toiminnasta, jakamalla tietoa valmistumisen jälkeisistä mahdollisuusista ja helpotamme siten tulevien tietojenkäsittelijöiden erikoistuvaa suuntautumista.\\n\\nServerit ovat legendaarisia hauskanpitäjiä - omien hippaloiden lisäksi valkohaalariset tunnetaankin ahkerina kuokkijoina ja keräämme mielellämme kyseenalaista kunniaa opiskelijatapahtumissa ympäri Suomen. Ei siis ihme että Serverin tavaramerkkinä pidetään loistavaa yhteishenkeä ja mahtavaa aktiivisuutta, nörtti-imagosta puhumattakaan! ","en_long_desc":"# What do we do?\\n\\nWe act as a link between the university and students, for example by collecting and transmitting student feedback to the university. We offer our student members guidance on advocacy issues and organise extracurricular activities, both independently and in cooperation with other student organisations. We also organise activities with a view to preparing students for the world of work by occasionally taking direct inspiration from companies in the computer science sector, sharing information about opportunities after graduation and thus facilitating the specialisation of future computer scientists.\\n\\nServers are legendary fun lovers - in addition to our own hijinks, the Whitefish are known as hard-working hackers and we like to garner questionable glory at student events all over Finland. It's no wonder that Server is known for its great team spirit and awesome activity, not to mention its nerd image! ","user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-29T18:37:27.682Z"}	\N
321	407	lomake_vastaukset	76	\N	\N	\N
322	408	lomake_vastaukset	77	\N	\N	\N
323	409	lomake_vastaukset	78	\N	\N	\N
324	410	lomake_vastaukset	79	{"firm_name":"ASD"}	{"firm_name":"ASD"}	\N
325	411	lomake_vastaukset	80	\N	\N	\N
326	412	lomake_vastaukset	81	\N	\N	\N
327	413	lomake_vastaukset	82	\N	\N	\N
328	414	lomake_vastaukset	83	\N	\N	\N
329	415	directus_permissions	1	{"id":1,"role":null,"collection":"LandingPage","action":"read","permissions":null,"validation":{},"presets":null,"fields":["fi_title","en_title","fi_description","en_description","fi_button_text","en_button_text","fi_button_url","en_button_url","en_long_desc","fi_long_desc"]}	{"role":null,"collection":"LandingPage","action":"read","permissions":null,"validation":{},"presets":null,"fields":["fi_title","en_title","fi_description","en_description","fi_button_text","en_button_text","fi_button_url","en_button_url","en_long_desc","fi_long_desc"]}	\N
337	433	lomake_vastaukset	86	{"firm_message":"Olisko teillä pari webbi devaajaa?","firm_contact":"firma@email.fi","firm_name":"firma"}	{"firm_message":"Olisko teillä pari webbi devaajaa?","firm_contact":"firma@email.fi","firm_name":"firma"}	\N
338	434	lomake_vastaukset	87	{"firm_message":"Olisko teillä pari webbi devaajaa?","firm_contact":"firma@email.fi","firm_name":"firma"}	{"firm_message":"Olisko teillä pari webbi devaajaa?","firm_contact":"firma@email.fi","firm_name":"firma"}	\N
339	435	lomake_vastaukset	88	{"firm_message":"Kokeillaan redirectaa","firm_contact":"matti.meikalainen@gmail.com","firm_name":"Efecte"}	{"firm_message":"Kokeillaan redirectaa","firm_contact":"matti.meikalainen@gmail.com","firm_name":"Efecte"}	\N
340	436	lomake_vastaukset	89	{"firm_message":"Morooo","firm_contact":"savonen.emppu@gmail.com","firm_name":"Efecte"}	{"firm_message":"Morooo","firm_contact":"savonen.emppu@gmail.com","firm_name":"Efecte"}	\N
341	437	lomake_vastaukset	90	{"firm_message":"Morooo","firm_contact":"savonen.emppu@gmail.com","firm_name":"Efecte"}	{"firm_message":"Morooo","firm_contact":"savonen.emppu@gmail.com","firm_name":"Efecte"}	\N
330	416	LandingPage	1	{"id":1,"user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-29T18:55:32.237Z","fi_title":"Servetti ry","en_title":"Servetti ry","fi_description":"Itä-Suomen yliopiston Kuopion kampuksen tietojenkäsittelytieteen opiskelijoiden ainejärjestö ","en_description":"The computer science students' subject organization of the Kuopio campus of the University of Eastern Finland","fi_button_text":"Millaista tietojenkäsittelytiede on?","en_button_text":"What is computer science like?","en_button_url":"/opiskelu/tkt","fi_button_url":"/opiskelu/tkt","fi_long_desc":"# Mitä me teemme?\\n\\nToimimme linkkinä yliopiston ja opiskelijoiden välillä mm. keräämällä ja välittämällä opiskelijapalautetta yliopistolle. Tarjoamme opiskelijajäsenillemme ohjausta edunvalvonnallisissa asioissa ja järjestämme opintojen oheen vapaa-ajan toimintaa sekä itsenäisesti että yhdessä muiden ainejärjestöjen kanssa. Järjestämme toimintaa myös työelämään valmistelevalla näkökulmalla ottamalla silloin tällöin vaikutteita suoraan tietojenkäsittelytieteen alan yritysten toiminnasta, jakamalla tietoa valmistumisen jälkeisistä mahdollisuusista ja helpotamme siten tulevien tietojenkäsittelijöiden erikoistuvaa suuntautumista.\\n\\n\\nServerit ovat legendaarisia hauskanpitäjiä - omien hippaloiden lisäksi valkohaalariset tunnetaankin ahkerina kuokkijoina ja keräämme mielellämme kyseenalaista kunniaa opiskelijatapahtumissa ympäri Suomen. Ei siis ihme että Serverin tavaramerkkinä pidetään loistavaa yhteishenkeä ja mahtavaa aktiivisuutta, nörtti-imagosta puhumattakaan! ","en_long_desc":"# What do we do?\\n\\nWe act as a link between the university and students, for example by collecting and transmitting student feedback to the university. We offer our student members guidance on advocacy issues and organise extracurricular activities, both independently and in cooperation with other student organisations. We also organise activities with a view to preparing students for the world of work by occasionally taking direct inspiration from companies in the computer science sector, sharing information about opportunities after graduation and thus facilitating the specialisation of future computer scientists.\\n\\n\\nServers are legendary fun lovers - in addition to our own hijinks, the Whitefish are known as hard-working hackers and we like to garner questionable glory at student events all over Finland. It's no wonder that Server is known for its great team spirit and awesome activity, not to mention its nerd image! "}	{"fi_long_desc":"# Mitä me teemme?\\n\\nToimimme linkkinä yliopiston ja opiskelijoiden välillä mm. keräämällä ja välittämällä opiskelijapalautetta yliopistolle. Tarjoamme opiskelijajäsenillemme ohjausta edunvalvonnallisissa asioissa ja järjestämme opintojen oheen vapaa-ajan toimintaa sekä itsenäisesti että yhdessä muiden ainejärjestöjen kanssa. Järjestämme toimintaa myös työelämään valmistelevalla näkökulmalla ottamalla silloin tällöin vaikutteita suoraan tietojenkäsittelytieteen alan yritysten toiminnasta, jakamalla tietoa valmistumisen jälkeisistä mahdollisuusista ja helpotamme siten tulevien tietojenkäsittelijöiden erikoistuvaa suuntautumista.\\n\\n\\nServerit ovat legendaarisia hauskanpitäjiä - omien hippaloiden lisäksi valkohaalariset tunnetaankin ahkerina kuokkijoina ja keräämme mielellämme kyseenalaista kunniaa opiskelijatapahtumissa ympäri Suomen. Ei siis ihme että Serverin tavaramerkkinä pidetään loistavaa yhteishenkeä ja mahtavaa aktiivisuutta, nörtti-imagosta puhumattakaan! ","en_long_desc":"# What do we do?\\n\\nWe act as a link between the university and students, for example by collecting and transmitting student feedback to the university. We offer our student members guidance on advocacy issues and organise extracurricular activities, both independently and in cooperation with other student organisations. We also organise activities with a view to preparing students for the world of work by occasionally taking direct inspiration from companies in the computer science sector, sharing information about opportunities after graduation and thus facilitating the specialisation of future computer scientists.\\n\\n\\nServers are legendary fun lovers - in addition to our own hijinks, the Whitefish are known as hard-working hackers and we like to garner questionable glory at student events all over Finland. It's no wonder that Server is known for its great team spirit and awesome activity, not to mention its nerd image! ","user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-29T18:55:32.237Z"}	\N
331	417	LandingPage	1	{"id":1,"user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-29T18:55:50.256Z","fi_title":"Servetti ry","en_title":"Servetti ry","fi_description":"Itä-Suomen yliopiston Kuopion kampuksen tietojenkäsittelytieteen opiskelijoiden ainejärjestö ","en_description":"The computer science students' subject organization of the Kuopio campus of the University of Eastern Finland","fi_button_text":"Millaista tietojenkäsittelytiede on?","en_button_text":"What is computer science like?","en_button_url":"/opiskelu/tkt","fi_button_url":"/opiskelu/tkt","fi_long_desc":"# Mitä me teemme?\\n\\nToimimme linkkinä yliopiston ja opiskelijoiden välillä mm. keräämällä ja välittämällä opiskelijapalautetta yliopistolle. Tarjoamme opiskelijajäsenillemme ohjausta edunvalvonnallisissa asioissa ja järjestämme opintojen oheen vapaa-ajan toimintaa sekä itsenäisesti että yhdessä muiden ainejärjestöjen kanssa. Järjestämme toimintaa myös työelämään valmistelevalla näkökulmalla ottamalla silloin tällöin vaikutteita suoraan tietojenkäsittelytieteen alan yritysten toiminnasta, jakamalla tietoa valmistumisen jälkeisistä mahdollisuusista ja helpotamme siten tulevien tietojenkäsittelijöiden erikoistuvaa suuntautumista.\\n\\n\\nServerit ovat legendaarisia hauskanpitäjiä - omien hippaloiden lisäksi valkohaalariset tunnetaankin ahkerina kuokkijoina ja keräämme mielellämme kyseenalaista kunniaa opiskelijatapahtumissa ympäri Suomen. Ei siis ihme että Serverin tavaramerkkinä pidetään loistavaa yhteishenkeä ja mahtavaa aktiivisuutta, nörtti-imagosta puhumattakaan! ","en_long_desc":"# What do we do?\\n\\nWe act as a link between the university and students, for example by collecting and transmitting student feedback to the university. We offer our student members guidance on advocacy issues and organise extracurricular activities, both independently and in cooperation with other student organisations. We also organise activities with a view to preparing students for the world of work by occasionally taking direct inspiration from companies in the computer science sector, sharing information about opportunities after graduation and thus facilitating the specialisation of future computer scientists.\\n\\n\\n\\nServers are legendary fun lovers - in addition to our own hijinks, the Whitefish are known as hard-working hackers and we like to garner questionable glory at student events all over Finland. It's no wonder that Server is known for its great team spirit and awesome activity, not to mention its nerd image! "}	{"en_long_desc":"# What do we do?\\n\\nWe act as a link between the university and students, for example by collecting and transmitting student feedback to the university. We offer our student members guidance on advocacy issues and organise extracurricular activities, both independently and in cooperation with other student organisations. We also organise activities with a view to preparing students for the world of work by occasionally taking direct inspiration from companies in the computer science sector, sharing information about opportunities after graduation and thus facilitating the specialisation of future computer scientists.\\n\\n\\n\\nServers are legendary fun lovers - in addition to our own hijinks, the Whitefish are known as hard-working hackers and we like to garner questionable glory at student events all over Finland. It's no wonder that Server is known for its great team spirit and awesome activity, not to mention its nerd image! ","user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-29T18:55:50.256Z"}	\N
332	418	LandingPage	1	{"id":1,"user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-29T18:56:01.059Z","fi_title":"Servetti ry","en_title":"Servetti ry","fi_description":"Itä-Suomen yliopiston Kuopion kampuksen tietojenkäsittelytieteen opiskelijoiden ainejärjestö ","en_description":"The computer science students' subject organization of the Kuopio campus of the University of Eastern Finland","fi_button_text":"Millaista tietojenkäsittelytiede on?","en_button_text":"What is computer science like?","en_button_url":"/opiskelu/tkt","fi_button_url":"/opiskelu/tkt","fi_long_desc":"# Mitä me teemme?\\n\\nToimimme linkkinä yliopiston ja opiskelijoiden välillä mm. keräämällä ja välittämällä opiskelijapalautetta yliopistolle. Tarjoamme opiskelijajäsenillemme ohjausta edunvalvonnallisissa asioissa ja järjestämme opintojen oheen vapaa-ajan toimintaa sekä itsenäisesti että yhdessä muiden ainejärjestöjen kanssa. Järjestämme toimintaa myös työelämään valmistelevalla näkökulmalla ottamalla silloin tällöin vaikutteita suoraan tietojenkäsittelytieteen alan yritysten toiminnasta, jakamalla tietoa valmistumisen jälkeisistä mahdollisuusista ja helpotamme siten tulevien tietojenkäsittelijöiden erikoistuvaa suuntautumista.\\n\\n\\nServerit ovat legendaarisia hauskanpitäjiä - omien hippaloiden lisäksi valkohaalariset tunnetaankin ahkerina kuokkijoina ja keräämme mielellämme kyseenalaista kunniaa opiskelijatapahtumissa ympäri Suomen. Ei siis ihme että Serverin tavaramerkkinä pidetään loistavaa yhteishenkeä ja mahtavaa aktiivisuutta, nörtti-imagosta puhumattakaan! ","en_long_desc":"# What do we do?\\n\\nWe act as a link between the university and students, for example by collecting and transmitting student feedback to the university. We offer our student members guidance on advocacy issues and organise extracurricular activities, both independently and in cooperation with other student organisations. We also organise activities with a view to preparing students for the world of work by occasionally taking direct inspiration from companies in the computer science sector, sharing information about opportunities after graduation and thus facilitating the specialisation of future computer scientists.\\n\\n<br>\\n\\nServers are legendary fun lovers - in addition to our own hijinks, the Whitefish are known as hard-working hackers and we like to garner questionable glory at student events all over Finland. It's no wonder that Server is known for its great team spirit and awesome activity, not to mention its nerd image! "}	{"en_long_desc":"# What do we do?\\n\\nWe act as a link between the university and students, for example by collecting and transmitting student feedback to the university. We offer our student members guidance on advocacy issues and organise extracurricular activities, both independently and in cooperation with other student organisations. We also organise activities with a view to preparing students for the world of work by occasionally taking direct inspiration from companies in the computer science sector, sharing information about opportunities after graduation and thus facilitating the specialisation of future computer scientists.\\n\\n<br>\\n\\nServers are legendary fun lovers - in addition to our own hijinks, the Whitefish are known as hard-working hackers and we like to garner questionable glory at student events all over Finland. It's no wonder that Server is known for its great team spirit and awesome activity, not to mention its nerd image! ","user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-29T18:56:01.059Z"}	\N
333	419	LandingPage	1	{"id":1,"user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-29T18:56:05.949Z","fi_title":"Servetti ry","en_title":"Servetti ry","fi_description":"Itä-Suomen yliopiston Kuopion kampuksen tietojenkäsittelytieteen opiskelijoiden ainejärjestö ","en_description":"The computer science students' subject organization of the Kuopio campus of the University of Eastern Finland","fi_button_text":"Millaista tietojenkäsittelytiede on?","en_button_text":"What is computer science like?","en_button_url":"/opiskelu/tkt","fi_button_url":"/opiskelu/tkt","fi_long_desc":"# Mitä me teemme?\\n\\nToimimme linkkinä yliopiston ja opiskelijoiden välillä mm. keräämällä ja välittämällä opiskelijapalautetta yliopistolle. Tarjoamme opiskelijajäsenillemme ohjausta edunvalvonnallisissa asioissa ja järjestämme opintojen oheen vapaa-ajan toimintaa sekä itsenäisesti että yhdessä muiden ainejärjestöjen kanssa. Järjestämme toimintaa myös työelämään valmistelevalla näkökulmalla ottamalla silloin tällöin vaikutteita suoraan tietojenkäsittelytieteen alan yritysten toiminnasta, jakamalla tietoa valmistumisen jälkeisistä mahdollisuusista ja helpotamme siten tulevien tietojenkäsittelijöiden erikoistuvaa suuntautumista.\\n\\n<br>\\n\\nServerit ovat legendaarisia hauskanpitäjiä - omien hippaloiden lisäksi valkohaalariset tunnetaankin ahkerina kuokkijoina ja keräämme mielellämme kyseenalaista kunniaa opiskelijatapahtumissa ympäri Suomen. Ei siis ihme että Serverin tavaramerkkinä pidetään loistavaa yhteishenkeä ja mahtavaa aktiivisuutta, nörtti-imagosta puhumattakaan! ","en_long_desc":"# What do we do?\\n\\nWe act as a link between the university and students, for example by collecting and transmitting student feedback to the university. We offer our student members guidance on advocacy issues and organise extracurricular activities, both independently and in cooperation with other student organisations. We also organise activities with a view to preparing students for the world of work by occasionally taking direct inspiration from companies in the computer science sector, sharing information about opportunities after graduation and thus facilitating the specialisation of future computer scientists.\\n\\n<br>\\n\\nServers are legendary fun lovers - in addition to our own hijinks, the Whitefish are known as hard-working hackers and we like to garner questionable glory at student events all over Finland. It's no wonder that Server is known for its great team spirit and awesome activity, not to mention its nerd image! "}	{"fi_long_desc":"# Mitä me teemme?\\n\\nToimimme linkkinä yliopiston ja opiskelijoiden välillä mm. keräämällä ja välittämällä opiskelijapalautetta yliopistolle. Tarjoamme opiskelijajäsenillemme ohjausta edunvalvonnallisissa asioissa ja järjestämme opintojen oheen vapaa-ajan toimintaa sekä itsenäisesti että yhdessä muiden ainejärjestöjen kanssa. Järjestämme toimintaa myös työelämään valmistelevalla näkökulmalla ottamalla silloin tällöin vaikutteita suoraan tietojenkäsittelytieteen alan yritysten toiminnasta, jakamalla tietoa valmistumisen jälkeisistä mahdollisuusista ja helpotamme siten tulevien tietojenkäsittelijöiden erikoistuvaa suuntautumista.\\n\\n<br>\\n\\nServerit ovat legendaarisia hauskanpitäjiä - omien hippaloiden lisäksi valkohaalariset tunnetaankin ahkerina kuokkijoina ja keräämme mielellämme kyseenalaista kunniaa opiskelijatapahtumissa ympäri Suomen. Ei siis ihme että Serverin tavaramerkkinä pidetään loistavaa yhteishenkeä ja mahtavaa aktiivisuutta, nörtti-imagosta puhumattakaan! ","user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-29T18:56:05.949Z"}	\N
334	420	lomake_vastaukset	84	{"firm_message":"jhjhjjhj","firm_contact":"matti.meikalainen@gmail.com","firm_name":"Efecte"}	{"firm_message":"jhjhjjhj","firm_contact":"matti.meikalainen@gmail.com","firm_name":"Efecte"}	\N
335	421	lomake_vastaukset	85	{"firm_message":"momomomomomom","firm_contact":"valtteri@ikius.com","firm_name":"Efecte"}	{"firm_message":"momomomomomom","firm_contact":"valtteri@ikius.com","firm_name":"Efecte"}	\N
336	422	LandingPage	1	{"id":1,"user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-29T18:56:31.333Z","fi_title":"Servetti ry","en_title":"Servetti ry","fi_description":"Itä-Suomen yliopiston Kuopion kampuksen tietojenkäsittelytieteen opiskelijoiden ainejärjestö ","en_description":"The computer science students' subject organization of the Kuopio campus of the University of Eastern Finland","fi_button_text":"Millaista tietojenkäsittelytiede on?","en_button_text":"What is computer science like?","en_button_url":"/opiskelu/tkt","fi_button_url":"/opiskelu/tkt","fi_long_desc":"# Mitä me teemme?\\n\\nToimimme linkkinä yliopiston ja opiskelijoiden välillä mm. keräämällä ja välittämällä opiskelijapalautetta yliopistolle. Tarjoamme opiskelijajäsenillemme ohjausta edunvalvonnallisissa asioissa ja järjestämme opintojen oheen vapaa-ajan toimintaa sekä itsenäisesti että yhdessä muiden ainejärjestöjen kanssa. Järjestämme toimintaa myös työelämään valmistelevalla näkökulmalla ottamalla silloin tällöin vaikutteita suoraan tietojenkäsittelytieteen alan yritysten toiminnasta, jakamalla tietoa valmistumisen jälkeisistä mahdollisuusista ja helpotamme siten tulevien tietojenkäsittelijöiden erikoistuvaa suuntautumista.\\n\\nServerit ovat legendaarisia hauskanpitäjiä - omien hippaloiden lisäksi valkohaalariset tunnetaankin ahkerina kuokkijoina ja keräämme mielellämme kyseenalaista kunniaa opiskelijatapahtumissa ympäri Suomen. Ei siis ihme että Serverin tavaramerkkinä pidetään loistavaa yhteishenkeä ja mahtavaa aktiivisuutta, nörtti-imagosta puhumattakaan! ","en_long_desc":"# What do we do?\\n\\nWe act as a link between the university and students, for example by collecting and transmitting student feedback to the university. We offer our student members guidance on advocacy issues and organise extracurricular activities, both independently and in cooperation with other student organisations. We also organise activities with a view to preparing students for the world of work by occasionally taking direct inspiration from companies in the computer science sector, sharing information about opportunities after graduation and thus facilitating the specialisation of future computer scientists.\\n\\nServers are legendary fun lovers - in addition to our own hijinks, the Whitefish are known as hard-working hackers and we like to garner questionable glory at student events all over Finland. It's no wonder that Server is known for its great team spirit and awesome activity, not to mention its nerd image! "}	{"fi_long_desc":"# Mitä me teemme?\\n\\nToimimme linkkinä yliopiston ja opiskelijoiden välillä mm. keräämällä ja välittämällä opiskelijapalautetta yliopistolle. Tarjoamme opiskelijajäsenillemme ohjausta edunvalvonnallisissa asioissa ja järjestämme opintojen oheen vapaa-ajan toimintaa sekä itsenäisesti että yhdessä muiden ainejärjestöjen kanssa. Järjestämme toimintaa myös työelämään valmistelevalla näkökulmalla ottamalla silloin tällöin vaikutteita suoraan tietojenkäsittelytieteen alan yritysten toiminnasta, jakamalla tietoa valmistumisen jälkeisistä mahdollisuusista ja helpotamme siten tulevien tietojenkäsittelijöiden erikoistuvaa suuntautumista.\\n\\nServerit ovat legendaarisia hauskanpitäjiä - omien hippaloiden lisäksi valkohaalariset tunnetaankin ahkerina kuokkijoina ja keräämme mielellämme kyseenalaista kunniaa opiskelijatapahtumissa ympäri Suomen. Ei siis ihme että Serverin tavaramerkkinä pidetään loistavaa yhteishenkeä ja mahtavaa aktiivisuutta, nörtti-imagosta puhumattakaan! ","en_long_desc":"# What do we do?\\n\\nWe act as a link between the university and students, for example by collecting and transmitting student feedback to the university. We offer our student members guidance on advocacy issues and organise extracurricular activities, both independently and in cooperation with other student organisations. We also organise activities with a view to preparing students for the world of work by occasionally taking direct inspiration from companies in the computer science sector, sharing information about opportunities after graduation and thus facilitating the specialisation of future computer scientists.\\n\\nServers are legendary fun lovers - in addition to our own hijinks, the Whitefish are known as hard-working hackers and we like to garner questionable glory at student events all over Finland. It's no wonder that Server is known for its great team spirit and awesome activity, not to mention its nerd image! ","user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-29T18:56:31.333Z"}	\N
344	440	lomake_vastaukset	93	{"firm_message":"Morooo","firm_contact":"savonen.emppu@gmail.com","firm_name":"Efecte"}	{"firm_message":"Morooo","firm_contact":"savonen.emppu@gmail.com","firm_name":"Efecte"}	\N
345	441	lomake_vastaukset	94	{"firm_message":"Morooo","firm_contact":"savonen.emppu@gmail.com","firm_name":"Efecte"}	{"firm_message":"Morooo","firm_contact":"savonen.emppu@gmail.com","firm_name":"Efecte"}	\N
346	442	lomake_vastaukset	95	{"firm_message":"Morooo","firm_contact":"savonen.emppu@gmail.com","firm_name":"Efecte"}	{"firm_message":"Morooo","firm_contact":"savonen.emppu@gmail.com","firm_name":"Efecte"}	\N
347	443	lomake_vastaukset	96	{"firm_message":"Morooo","firm_contact":"savonen.emppu@gmail.com","firm_name":"Efecte"}	{"firm_message":"Morooo","firm_contact":"savonen.emppu@gmail.com","firm_name":"Efecte"}	\N
348	444	lomake_vastaukset	97	{"firm_message":"Morooo","firm_contact":"savonen.emppu@gmail.com","firm_name":"Efecte"}	{"firm_message":"Morooo","firm_contact":"savonen.emppu@gmail.com","firm_name":"Efecte"}	\N
349	445	lomake_vastaukset	98	{"firm_message":"Morooo","firm_contact":"savonen.emppu@gmail.com","firm_name":"Efecte"}	{"firm_message":"Morooo","firm_contact":"savonen.emppu@gmail.com","firm_name":"Efecte"}	\N
350	446	lomake_vastaukset	99	{"firm_message":"Morooo","firm_contact":"savonen.emppu@gmail.com","firm_name":"Efecte"}	{"firm_message":"Morooo","firm_contact":"savonen.emppu@gmail.com","firm_name":"Efecte"}	\N
351	447	lomake_vastaukset	100	{"firm_message":"Morooo","firm_contact":"savonen.emppu@gmail.com","firm_name":"Efecte"}	{"firm_message":"Morooo","firm_contact":"savonen.emppu@gmail.com","firm_name":"Efecte"}	\N
352	448	lomake_vastaukset	101	{"firm_message":"Morooo","firm_contact":"savonen.emppu@gmail.com","firm_name":"Efecte"}	{"firm_message":"Morooo","firm_contact":"savonen.emppu@gmail.com","firm_name":"Efecte"}	\N
353	465	lomake_vastaukset	102	{"firm_message":"asdasdasd","firm_contact":"asdasd@gmail.com","firm_name":"Efecte"}	{"firm_message":"asdasdasd","firm_contact":"asdasd@gmail.com","firm_name":"Efecte"}	\N
354	466	lomake_vastaukset	103	{"firm_message":"Moro","firm_contact":"matti.meikalainen@gmail.com","firm_name":"Moro"}	{"firm_message":"Moro","firm_contact":"matti.meikalainen@gmail.com","firm_name":"Moro"}	\N
355	467	lomake_vastaukset	104	{"firm_message":"Moro","firm_contact":"matti.meikalainen@gmail.com","firm_name":"MOro"}	{"firm_message":"Moro","firm_contact":"matti.meikalainen@gmail.com","firm_name":"MOro"}	\N
356	468	directus_fields	87	{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"hallitus_page"}	{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"hallitus_page"}	\N
357	469	directus_fields	88	{"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"hallitus_page"}	{"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"hallitus_page"}	\N
358	470	directus_fields	89	{"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"hallitus_page"}	{"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"hallitus_page"}	\N
359	471	directus_collections	hallitus_page	{"singleton":true,"collection":"hallitus_page"}	{"singleton":true,"collection":"hallitus_page"}	\N
360	472	directus_fields	90	{"interface":"input-rich-text-md","special":null,"required":true,"collection":"hallitus_page","field":"fi_text"}	{"interface":"input-rich-text-md","special":null,"required":true,"collection":"hallitus_page","field":"fi_text"}	\N
361	473	directus_fields	91	{"interface":"input-rich-text-md","special":null,"required":true,"collection":"hallitus_page","field":"en_text"}	{"interface":"input-rich-text-md","special":null,"required":true,"collection":"hallitus_page","field":"en_text"}	\N
362	474	hallitus_page	1	{"fi_text":"# Board activities\\n\\nServerin hallitus vastaa ainejärjestötoiminnan käytännön asioiden hoidosta. Asioita tehdään yhdessä, mutta käytännön syistä tehtäviä on jaettu \\"hallitusrooleihin\\" jäsenten kiinnostuksen ja osaamisen mukaan. Mikäli haluat olla yhteydessä hallitukseen, tapahtuu se helpoiten sähköpostitse hallitus[ät]serveriry.fi tai Serverin jäsenenä löydät kaikki hallituslaiset myös Oppositiosta.\\n\\nServerin hallituksen jäsenet vaihtuvat vuosittain ja heidät valitaan kaikille jäsenille avoimessa syyskokouksessa. Ainejärjestötoiminnan sisältö mukautuu aikaan, mutta hallituksen varsinaiset tehtävät muuttuvat harvemmin ja hitaammin. Mikäli ainejärjestötoiminta kiinnostaa, kannattaa harkita hallitustoimintaan mukaan lähtemistä! Syyskokouksessa valitut jäsenet järjestäytyvät hallituskautensa alussa ja valitsevat keskuudestaan vastuuhenkilöt eri osaalueiden hoitamiseen. Vastuuhenkilöiden titteleistä saa jo hyvän kuvan siitä, minkälaista hallitustoiminta on.\\n\\nServerin hallituksen koko määräytyy syyskokouksessa ja tällä kaudella se koostuu 15:sta varsinaisesta ja 5:stä varajäsenestä. Hallituslaisiin ja heidän rooleihinsa voit tutustua alta, josta löydät myös yhteystiedot. Roolikohtaisten sähköpostiosotteiden lisäksi jokaisella hallituksen varsinaisella- ja varajäsenellä on henkilökohtainen sähköpostiosoite muodossa etunimi.sukunimi[ät]serveriry.fi.\\n\\n## Serverin Oppositio\\n\\nKiinnostaako ainejärjestötoiminta? Serverin Oppositio on ryhmä Telegramissa, jossa pääsee seuraamaan ainejärjestötoimintaa hieman lähempää. Ryhmään liittyminen ei sido mihinkään ja voit liittyä/poistua täysin vapaasti. Tervetuloa mukaan! [Liittymislinkki](https://t.me/) TG-ryhmään. ","en_text":"# Board activities\\n\\nThe server's board is responsible for the practical management of the association's activities. Things are done collectively, but for practical reasons, tasks are divided into \\"board roles\\" according to members' interests and skills. If you want to get in touch with the board, the easiest way is to email hallitus[ät]serveriry.fi or, as a Server member, you can also find all board members in the Opposition.\\n\\nServer's board members rotate annually and are elected at an autumn meeting open to all members. The content of the Board's activities adapts over time, but the actual tasks of the Board change less frequently and more slowly. If you are interested, you should consider joining the board! The members elected at the autumn meeting organise themselves at the beginning of their term of office and choose from among themselves the persons responsible for the various areas of activity. The titles of these people give you a good idea of what government is like.\\n\\nThe size of the Server Board is decided at the autumn meeting and this term it consists of 15 full members and 5 alternates. You can find out more about the board members and their roles below, where you can also find their contact details. In addition to the role-specific email addresses, each member and alternate member of the Board has a personal email address in the form of firstname.lastname[at]serveriry.fi.\\n\\n## Serveriry Opposition\\n\\nAre you interested in student union activities? Server's Opposition is a group on Telegram where you can follow the activities of the student union a little closer. Joining the group is not binding and you are free to join/leave. Welcome to join! [Join](https://t.me/) TG group. "}	{"fi_text":"# Board activities\\n\\nServerin hallitus vastaa ainejärjestötoiminnan käytännön asioiden hoidosta. Asioita tehdään yhdessä, mutta käytännön syistä tehtäviä on jaettu \\"hallitusrooleihin\\" jäsenten kiinnostuksen ja osaamisen mukaan. Mikäli haluat olla yhteydessä hallitukseen, tapahtuu se helpoiten sähköpostitse hallitus[ät]serveriry.fi tai Serverin jäsenenä löydät kaikki hallituslaiset myös Oppositiosta.\\n\\nServerin hallituksen jäsenet vaihtuvat vuosittain ja heidät valitaan kaikille jäsenille avoimessa syyskokouksessa. Ainejärjestötoiminnan sisältö mukautuu aikaan, mutta hallituksen varsinaiset tehtävät muuttuvat harvemmin ja hitaammin. Mikäli ainejärjestötoiminta kiinnostaa, kannattaa harkita hallitustoimintaan mukaan lähtemistä! Syyskokouksessa valitut jäsenet järjestäytyvät hallituskautensa alussa ja valitsevat keskuudestaan vastuuhenkilöt eri osaalueiden hoitamiseen. Vastuuhenkilöiden titteleistä saa jo hyvän kuvan siitä, minkälaista hallitustoiminta on.\\n\\nServerin hallituksen koko määräytyy syyskokouksessa ja tällä kaudella se koostuu 15:sta varsinaisesta ja 5:stä varajäsenestä. Hallituslaisiin ja heidän rooleihinsa voit tutustua alta, josta löydät myös yhteystiedot. Roolikohtaisten sähköpostiosotteiden lisäksi jokaisella hallituksen varsinaisella- ja varajäsenellä on henkilökohtainen sähköpostiosoite muodossa etunimi.sukunimi[ät]serveriry.fi.\\n\\n## Serverin Oppositio\\n\\nKiinnostaako ainejärjestötoiminta? Serverin Oppositio on ryhmä Telegramissa, jossa pääsee seuraamaan ainejärjestötoimintaa hieman lähempää. Ryhmään liittyminen ei sido mihinkään ja voit liittyä/poistua täysin vapaasti. Tervetuloa mukaan! [Liittymislinkki](https://t.me/) TG-ryhmään. ","en_text":"# Board activities\\n\\nThe server's board is responsible for the practical management of the association's activities. Things are done collectively, but for practical reasons, tasks are divided into \\"board roles\\" according to members' interests and skills. If you want to get in touch with the board, the easiest way is to email hallitus[ät]serveriry.fi or, as a Server member, you can also find all board members in the Opposition.\\n\\nServer's board members rotate annually and are elected at an autumn meeting open to all members. The content of the Board's activities adapts over time, but the actual tasks of the Board change less frequently and more slowly. If you are interested, you should consider joining the board! The members elected at the autumn meeting organise themselves at the beginning of their term of office and choose from among themselves the persons responsible for the various areas of activity. The titles of these people give you a good idea of what government is like.\\n\\nThe size of the Server Board is decided at the autumn meeting and this term it consists of 15 full members and 5 alternates. You can find out more about the board members and their roles below, where you can also find their contact details. In addition to the role-specific email addresses, each member and alternate member of the Board has a personal email address in the form of firstname.lastname[at]serveriry.fi.\\n\\n## Serveriry Opposition\\n\\nAre you interested in student union activities? Server's Opposition is a group on Telegram where you can follow the activities of the student union a little closer. Joining the group is not binding and you are free to join/leave. Welcome to join! [Join](https://t.me/) TG group. "}	\N
363	475	directus_permissions	15	{"role":null,"collection":"hallitus_page","action":"read"}	{"role":null,"collection":"hallitus_page","action":"read"}	\N
364	476	directus_permissions	15	{"id":15,"role":null,"collection":"hallitus_page","action":"read","permissions":null,"validation":null,"presets":null,"fields":["fi_text","en_text","date_updated"]}	{"role":null,"collection":"hallitus_page","action":"read","permissions":null,"validation":null,"presets":null,"fields":["fi_text","en_text","date_updated"]}	\N
365	477	directus_fields	92	{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"study_club"}	{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"study_club"}	\N
366	478	directus_fields	93	{"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"study_club"}	{"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"study_club"}	\N
367	479	directus_fields	94	{"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"study_club"}	{"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"study_club"}	\N
368	480	directus_collections	study_club	{"singleton":true,"collection":"study_club"}	{"singleton":true,"collection":"study_club"}	\N
369	481	directus_fields	95	{"interface":"input-rich-text-md","special":null,"collection":"study_club","field":"fi_text"}	{"interface":"input-rich-text-md","special":null,"collection":"study_club","field":"fi_text"}	\N
370	482	directus_fields	96	{"interface":"input-rich-text-md","special":null,"collection":"study_club","field":"en_text"}	{"interface":"input-rich-text-md","special":null,"collection":"study_club","field":"en_text"}	\N
371	483	directus_fields	97	{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"for_new_student"}	{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"for_new_student"}	\N
421	536	lomake_vastaukset	117	{"firm_message":"Tehdäänkö yhteistyötä","firm_contact":"klada@vappen.fi","firm_name":"klada vappen"}	{"firm_message":"Tehdäänkö yhteistyötä","firm_contact":"klada@vappen.fi","firm_name":"klada vappen"}	\N
372	484	directus_fields	98	{"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"for_new_student"}	{"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"for_new_student"}	\N
373	485	directus_fields	99	{"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"for_new_student"}	{"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"for_new_student"}	\N
374	486	directus_collections	for_new_student	{"singleton":true,"collection":"for_new_student"}	{"singleton":true,"collection":"for_new_student"}	\N
375	487	directus_fields	100	{"interface":"input-rich-text-md","special":null,"required":true,"collection":"for_new_student","field":"fi_text"}	{"interface":"input-rich-text-md","special":null,"required":true,"collection":"for_new_student","field":"fi_text"}	\N
376	488	directus_fields	101	{"interface":"input-rich-text-md","special":null,"required":true,"collection":"for_new_student","field":"en_text"}	{"interface":"input-rich-text-md","special":null,"required":true,"collection":"for_new_student","field":"en_text"}	\N
377	489	study_club	1	{"fi_text":"# Uudelle opiskelijalle\\n\\nTietojenkäsittelytieteen uudet opiskelijat aloittavat syksyllä pitkän ja kivikkoisen, mutta niin kovin antoisan tiensä kohti luonnontieteen kandidaatin ja filosofian maisterin titteleitä.\\nFuksin muistilista\\n\\n- Muista maksaa jäsenmaksut Itä-Suomen yliopiston ylioppilaskunnalle (ISYY) 31.8 mennessä\\n- YTHS maksu on myös pakollinen ja se maksetaan erikseen Kelalle, kannattaa se kurkistella kuntoon\\n- Kannattaa lukea Tietojenkäsittelytieteen laitoksen Smart Start -opas ja kamusta ohjeet uudelle opiskelijalle\\n- Liity Serverin jäseneksi.\\n- Liity Serverin tiedotuskanavalle: https://t.me/serveriry\\n- Tsekkaa syksyn tuutorit täältä\\n- Hanki opiskelijakortti\\n\\n## Opiskelijakortti\\n\\nOpiskelijakortilla todistat opiskelijastatuksesi, jotta voit saada opiskelija-alennuksia. Fyysisiä opiskelijakortteja hankitaan kirjoittamishetkellä (kevät 2021) kautta ja maksaa 25€. Fyysisellä ja sähköisillä korteilla ei ole muuta eroa kuin myöntäjä ja mahdollisesti joitain eroja alennuksissa. Tenttitilaisuuksissa kelpaa sähköinen kortti tai muu henkilöllisyystodistus. Kaikki vaihtoehdot kirjoittamishetkellä (kevät 2021) ilmaisia Kansainväliset kortit hankitaan kautta. Saatavilla sekä fyysinen että sähköinen versio.\\n\\n\\n## Hyvä tietää\\n\\n- Serveri tiedottaa tapahtumistaan ensisijaisesti Telegramissa, mutta myös kotisivuilla ja postilistalla. Uudet jäsenet lisätään postilistalle, kun hallitus on hyväksynyt heidät jäseniksi jäsenmaksun maksamisen jälkeen.\\n- Serverimeininkiä löytyy edellä mainittujen alustojen lisäksi myös Facebookista ja Instagramista\\n\\n## Mahdollisesti hyödyllistä sisältöä\\n\\n- [Sykettä](https://sykettä.fi/kuopio/) eli korkeakoulujen liikuntapalvelut, jos liikunnan harrastaminen kiinnostaa. Ensimmäisillä opiskeluviikoilla palveluita pääsee usein kokeilemaan ilmaiseksi\\n- [ISYY](https://www.isyy.fi/palvelut/uudelle-opiskelijalle.html)n sivut uudelle opiskelijalle"}	{"fi_text":"# Uudelle opiskelijalle\\n\\nTietojenkäsittelytieteen uudet opiskelijat aloittavat syksyllä pitkän ja kivikkoisen, mutta niin kovin antoisan tiensä kohti luonnontieteen kandidaatin ja filosofian maisterin titteleitä.\\nFuksin muistilista\\n\\n- Muista maksaa jäsenmaksut Itä-Suomen yliopiston ylioppilaskunnalle (ISYY) 31.8 mennessä\\n- YTHS maksu on myös pakollinen ja se maksetaan erikseen Kelalle, kannattaa se kurkistella kuntoon\\n- Kannattaa lukea Tietojenkäsittelytieteen laitoksen Smart Start -opas ja kamusta ohjeet uudelle opiskelijalle\\n- Liity Serverin jäseneksi.\\n- Liity Serverin tiedotuskanavalle: https://t.me/serveriry\\n- Tsekkaa syksyn tuutorit täältä\\n- Hanki opiskelijakortti\\n\\n## Opiskelijakortti\\n\\nOpiskelijakortilla todistat opiskelijastatuksesi, jotta voit saada opiskelija-alennuksia. Fyysisiä opiskelijakortteja hankitaan kirjoittamishetkellä (kevät 2021) kautta ja maksaa 25€. Fyysisellä ja sähköisillä korteilla ei ole muuta eroa kuin myöntäjä ja mahdollisesti joitain eroja alennuksissa. Tenttitilaisuuksissa kelpaa sähköinen kortti tai muu henkilöllisyystodistus. Kaikki vaihtoehdot kirjoittamishetkellä (kevät 2021) ilmaisia Kansainväliset kortit hankitaan kautta. Saatavilla sekä fyysinen että sähköinen versio.\\n\\n\\n## Hyvä tietää\\n\\n- Serveri tiedottaa tapahtumistaan ensisijaisesti Telegramissa, mutta myös kotisivuilla ja postilistalla. Uudet jäsenet lisätään postilistalle, kun hallitus on hyväksynyt heidät jäseniksi jäsenmaksun maksamisen jälkeen.\\n- Serverimeininkiä löytyy edellä mainittujen alustojen lisäksi myös Facebookista ja Instagramista\\n\\n## Mahdollisesti hyödyllistä sisältöä\\n\\n- [Sykettä](https://sykettä.fi/kuopio/) eli korkeakoulujen liikuntapalvelut, jos liikunnan harrastaminen kiinnostaa. Ensimmäisillä opiskeluviikoilla palveluita pääsee usein kokeilemaan ilmaiseksi\\n- [ISYY](https://www.isyy.fi/palvelut/uudelle-opiskelijalle.html)n sivut uudelle opiskelijalle"}	\N
378	490	study_club	1	{"id":1,"user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-29T20:08:45.775Z","fi_text":"# Uudelle opiskelijalle\\n\\nTietojenkäsittelytieteen uudet opiskelijat aloittavat syksyllä pitkän ja kivikkoisen, mutta niin kovin antoisan tiensä kohti luonnontieteen kandidaatin ja filosofian maisterin titteleitä.\\nFuksin muistilista\\n\\n- Muista maksaa jäsenmaksut Itä-Suomen yliopiston ylioppilaskunnalle (ISYY) 31.8 mennessä\\n- YTHS maksu on myös pakollinen ja se maksetaan erikseen Kelalle, kannattaa se kurkistella kuntoon\\n- Kannattaa lukea Tietojenkäsittelytieteen laitoksen Smart Start -opas ja kamusta ohjeet uudelle opiskelijalle\\n- Liity Serverin jäseneksi.\\n- Liity Serverin tiedotuskanavalle: https://t.me/serveriry\\n- Tsekkaa syksyn tuutorit täältä\\n- Hanki opiskelijakortti\\n\\n## Opiskelijakortti\\n\\nOpiskelijakortilla todistat opiskelijastatuksesi, jotta voit saada opiskelija-alennuksia. Fyysisiä opiskelijakortteja hankitaan kirjoittamishetkellä (kevät 2021) kautta ja maksaa 25€. Fyysisellä ja sähköisillä korteilla ei ole muuta eroa kuin myöntäjä ja mahdollisesti joitain eroja alennuksissa. Tenttitilaisuuksissa kelpaa sähköinen kortti tai muu henkilöllisyystodistus. Kaikki vaihtoehdot kirjoittamishetkellä (kevät 2021) ilmaisia Kansainväliset kortit hankitaan kautta. Saatavilla sekä fyysinen että sähköinen versio.\\n\\n\\n## Hyvä tietää\\n\\n- Serveri tiedottaa tapahtumistaan ensisijaisesti Telegramissa, mutta myös kotisivuilla ja postilistalla. Uudet jäsenet lisätään postilistalle, kun hallitus on hyväksynyt heidät jäseniksi jäsenmaksun maksamisen jälkeen.\\n- Serverimeininkiä löytyy edellä mainittujen alustojen lisäksi myös Facebookista ja Instagramista\\n\\n## Mahdollisesti hyödyllistä sisältöä\\n\\n- [Sykettä](https://sykettä.fi/kuopio/) eli korkeakoulujen liikuntapalvelut, jos liikunnan harrastaminen kiinnostaa. Ensimmäisillä opiskeluviikoilla palveluita pääsee usein kokeilemaan ilmaiseksi\\n- [ISYY](https://www.isyy.fi/palvelut/uudelle-opiskelijalle.html)n sivut uudelle opiskelijalle","en_text":"# For a new student\\n\\nThis autumn, new students in Computer Science will begin the long and rocky, but so very rewarding journey towards their Bachelor of Science and Master of Philosophy degrees.\\nFreshman checklist\\n\\n- Remember to pay your membership fees to the Student Union of the University of Eastern Finland (ISYY) by 31 August\\n- The YTHS fee is also compulsory and is paid separately to Kela, it's worth checking it out\\n- You should read the Smart Start guide of the Department of Computer Science and the instructions for new students\\n- Join the Server.\\n- Join the Server information channel: https://t.me/serveriry\\n- Check out the autumn tutors here\\n- Get your student card\\n\\n## Student card\\n\\nThe student card is your proof of student status to qualify for student discounts. Physical student cards are available at the time of writing (Spring 2021) and cost €25. There is no difference between physical and electronic cards other than the issuer and possibly some differences in discounts. For exams, an electronic card or other form of ID will be accepted. All options at time of writing (spring 2021) free International cards are purchased via. Both physical and electronic versions are available.\\n\\n\\n## Good to know\\n\\n- The server informs about its events primarily on Telegram, but also on its website and mailing list. New members are added to the mailing list after being accepted as members by the board of directors after payment of the membership fee.\\n- In addition to the platforms mentioned above, Serverimeinink can also be found on Facebook and Instagram\\n\\n## Potentially useful content\\n\\n- [Sykettä](https://sykettä.fi/kuopio/), the sports services of universities, if you are interested in sports. You can often try out the services for free during the first weeks of your studies\\n- [ISYY](https://www.isyy.fi/palvelut/uudelle-opiskelijalle.html) website for new students"}	{"en_text":"# For a new student\\n\\nThis autumn, new students in Computer Science will begin the long and rocky, but so very rewarding journey towards their Bachelor of Science and Master of Philosophy degrees.\\nFreshman checklist\\n\\n- Remember to pay your membership fees to the Student Union of the University of Eastern Finland (ISYY) by 31 August\\n- The YTHS fee is also compulsory and is paid separately to Kela, it's worth checking it out\\n- You should read the Smart Start guide of the Department of Computer Science and the instructions for new students\\n- Join the Server.\\n- Join the Server information channel: https://t.me/serveriry\\n- Check out the autumn tutors here\\n- Get your student card\\n\\n## Student card\\n\\nThe student card is your proof of student status to qualify for student discounts. Physical student cards are available at the time of writing (Spring 2021) and cost €25. There is no difference between physical and electronic cards other than the issuer and possibly some differences in discounts. For exams, an electronic card or other form of ID will be accepted. All options at time of writing (spring 2021) free International cards are purchased via. Both physical and electronic versions are available.\\n\\n\\n## Good to know\\n\\n- The server informs about its events primarily on Telegram, but also on its website and mailing list. New members are added to the mailing list after being accepted as members by the board of directors after payment of the membership fee.\\n- In addition to the platforms mentioned above, Serverimeinink can also be found on Facebook and Instagram\\n\\n## Potentially useful content\\n\\n- [Sykettä](https://sykettä.fi/kuopio/), the sports services of universities, if you are interested in sports. You can often try out the services for free during the first weeks of your studies\\n- [ISYY](https://www.isyy.fi/palvelut/uudelle-opiskelijalle.html) website for new students","user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-29T20:08:45.775Z"}	\N
379	491	for_new_student	1	{"fi_text":"# For a new student\\n\\nThis autumn, new students in Computer Science will begin the long and rocky, but so very rewarding journey towards their Bachelor of Science and Master of Philosophy degrees.\\nFreshman checklist\\n\\n- Remember to pay your membership fees to the Student Union of the University of Eastern Finland (ISYY) by 31 August\\n- The YTHS fee is also compulsory and is paid separately to Kela, it's worth checking it out\\n- You should read the Smart Start guide of the Department of Computer Science and the instructions for new students\\n- Join the Server.\\n- Join the Server information channel: https://t.me/serveriry\\n- Check out the autumn tutors here\\n- Get your student card\\n\\n## Student card\\n\\nThe student card is your proof of student status to qualify for student discounts. Physical student cards are available at the time of writing (Spring 2021) and cost €25. There is no difference between physical and electronic cards other than the issuer and possibly some differences in discounts. For exams, an electronic card or other form of ID will be accepted. All options at time of writing (spring 2021) free International cards are purchased via. Both physical and electronic versions are available.\\n\\n\\n## Good to know\\n\\n- The server informs about its events primarily on Telegram, but also on its website and mailing list. New members are added to the mailing list after being accepted as members by the board of directors after payment of the membership fee.\\n- In addition to the platforms mentioned above, Serverimeinink can also be found on Facebook and Instagram\\n\\n## Potentially useful content\\n\\n- [Sykettä](https://sykettä.fi/kuopio/), the sports services of universities, if you are interested in sports. You can often try out the services for free during the first weeks of your studies\\n- [ISYY](https://www.isyy.fi/palvelut/uudelle-opiskelijalle.html) website for new students","en_text":"# For a new student\\n\\nThis autumn, new students in Computer Science will begin the long and rocky, but so very rewarding journey towards their Bachelor of Science and Master of Philosophy degrees.\\nFreshman checklist\\n\\n- Remember to pay your membership fees to the Student Union of the University of Eastern Finland (ISYY) by 31 August\\n- The YTHS fee is also compulsory and is paid separately to Kela, it's worth checking it out\\n- You should read the Smart Start guide of the Department of Computer Science and the instructions for new students\\n- Join the Server.\\n- Join the Server information channel: https://t.me/serveriry\\n- Check out the autumn tutors here\\n- Get your student card\\n\\n## Student card\\n\\nThe student card is your proof of student status to qualify for student discounts. Physical student cards are available at the time of writing (Spring 2021) and cost €25. There is no difference between physical and electronic cards other than the issuer and possibly some differences in discounts. For exams, an electronic card or other form of ID will be accepted. All options at time of writing (spring 2021) free International cards are purchased via. Both physical and electronic versions are available.\\n\\n\\n## Good to know\\n\\n- The server informs about its events primarily on Telegram, but also on its website and mailing list. New members are added to the mailing list after being accepted as members by the board of directors after payment of the membership fee.\\n- In addition to the platforms mentioned above, Serverimeinink can also be found on Facebook and Instagram\\n\\n## Potentially useful content\\n\\n- [Sykettä](https://sykettä.fi/kuopio/), the sports services of universities, if you are interested in sports. You can often try out the services for free during the first weeks of your studies\\n- [ISYY](https://www.isyy.fi/palvelut/uudelle-opiskelijalle.html) website for new students"}	{"fi_text":"# For a new student\\n\\nThis autumn, new students in Computer Science will begin the long and rocky, but so very rewarding journey towards their Bachelor of Science and Master of Philosophy degrees.\\nFreshman checklist\\n\\n- Remember to pay your membership fees to the Student Union of the University of Eastern Finland (ISYY) by 31 August\\n- The YTHS fee is also compulsory and is paid separately to Kela, it's worth checking it out\\n- You should read the Smart Start guide of the Department of Computer Science and the instructions for new students\\n- Join the Server.\\n- Join the Server information channel: https://t.me/serveriry\\n- Check out the autumn tutors here\\n- Get your student card\\n\\n## Student card\\n\\nThe student card is your proof of student status to qualify for student discounts. Physical student cards are available at the time of writing (Spring 2021) and cost €25. There is no difference between physical and electronic cards other than the issuer and possibly some differences in discounts. For exams, an electronic card or other form of ID will be accepted. All options at time of writing (spring 2021) free International cards are purchased via. Both physical and electronic versions are available.\\n\\n\\n## Good to know\\n\\n- The server informs about its events primarily on Telegram, but also on its website and mailing list. New members are added to the mailing list after being accepted as members by the board of directors after payment of the membership fee.\\n- In addition to the platforms mentioned above, Serverimeinink can also be found on Facebook and Instagram\\n\\n## Potentially useful content\\n\\n- [Sykettä](https://sykettä.fi/kuopio/), the sports services of universities, if you are interested in sports. You can often try out the services for free during the first weeks of your studies\\n- [ISYY](https://www.isyy.fi/palvelut/uudelle-opiskelijalle.html) website for new students","en_text":"# For a new student\\n\\nThis autumn, new students in Computer Science will begin the long and rocky, but so very rewarding journey towards their Bachelor of Science and Master of Philosophy degrees.\\nFreshman checklist\\n\\n- Remember to pay your membership fees to the Student Union of the University of Eastern Finland (ISYY) by 31 August\\n- The YTHS fee is also compulsory and is paid separately to Kela, it's worth checking it out\\n- You should read the Smart Start guide of the Department of Computer Science and the instructions for new students\\n- Join the Server.\\n- Join the Server information channel: https://t.me/serveriry\\n- Check out the autumn tutors here\\n- Get your student card\\n\\n## Student card\\n\\nThe student card is your proof of student status to qualify for student discounts. Physical student cards are available at the time of writing (Spring 2021) and cost €25. There is no difference between physical and electronic cards other than the issuer and possibly some differences in discounts. For exams, an electronic card or other form of ID will be accepted. All options at time of writing (spring 2021) free International cards are purchased via. Both physical and electronic versions are available.\\n\\n\\n## Good to know\\n\\n- The server informs about its events primarily on Telegram, but also on its website and mailing list. New members are added to the mailing list after being accepted as members by the board of directors after payment of the membership fee.\\n- In addition to the platforms mentioned above, Serverimeinink can also be found on Facebook and Instagram\\n\\n## Potentially useful content\\n\\n- [Sykettä](https://sykettä.fi/kuopio/), the sports services of universities, if you are interested in sports. You can often try out the services for free during the first weeks of your studies\\n- [ISYY](https://www.isyy.fi/palvelut/uudelle-opiskelijalle.html) website for new students"}	\N
419	533	directus_permissions	19	{"id":19,"role":null,"collection":"gdpr","action":"read","permissions":null,"validation":null,"presets":null,"fields":["fi_text","en_text","date_updated"]}	{"role":null,"collection":"gdpr","action":"read","permissions":null,"validation":null,"presets":null,"fields":["fi_text","en_text","date_updated"]}	\N
438	553	directus_fields	32	{"id":32,"collection":"board_members","field":"img","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"img","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	\N
439	554	directus_fields	31	{"id":31,"collection":"board_members","field":"hover_img","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"hover_img","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	\N
380	492	for_new_student	1	{"id":1,"user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-29T20:09:12.545Z","fi_text":"# Uudelle opiskelijalle\\n\\nTietojenkäsittelytieteen uudet opiskelijat aloittavat syksyllä pitkän ja kivikkoisen, mutta niin kovin antoisan tiensä kohti luonnontieteen kandidaatin ja filosofian maisterin titteleitä.\\nFuksin muistilista\\n\\n- Muista maksaa jäsenmaksut Itä-Suomen yliopiston ylioppilaskunnalle (ISYY) 31.8 mennessä\\n- YTHS maksu on myös pakollinen ja se maksetaan erikseen Kelalle, kannattaa se kurkistella kuntoon\\n- Kannattaa lukea Tietojenkäsittelytieteen laitoksen Smart Start -opas ja kamusta ohjeet uudelle opiskelijalle\\n- Liity Serverin jäseneksi.\\n- Liity Serverin tiedotuskanavalle: https://t.me/serveriry\\n- Tsekkaa syksyn tuutorit täältä\\n- Hanki opiskelijakortti\\n\\n## Opiskelijakortti\\n\\nOpiskelijakortilla todistat opiskelijastatuksesi, jotta voit saada opiskelija-alennuksia. Fyysisiä opiskelijakortteja hankitaan kirjoittamishetkellä (kevät 2021) kautta ja maksaa 25€. Fyysisellä ja sähköisillä korteilla ei ole muuta eroa kuin myöntäjä ja mahdollisesti joitain eroja alennuksissa. Tenttitilaisuuksissa kelpaa sähköinen kortti tai muu henkilöllisyystodistus. Kaikki vaihtoehdot kirjoittamishetkellä (kevät 2021) ilmaisia Kansainväliset kortit hankitaan kautta. Saatavilla sekä fyysinen että sähköinen versio.\\n\\n\\n## Hyvä tietää\\n\\n- Serveri tiedottaa tapahtumistaan ensisijaisesti Telegramissa, mutta myös kotisivuilla ja postilistalla. Uudet jäsenet lisätään postilistalle, kun hallitus on hyväksynyt heidät jäseniksi jäsenmaksun maksamisen jälkeen.\\n- Serverimeininkiä löytyy edellä mainittujen alustojen lisäksi myös Facebookista ja Instagramista\\n\\n## Mahdollisesti hyödyllistä sisältöä\\n\\n- [Sykettä](https://sykettä.fi/kuopio/) eli korkeakoulujen liikuntapalvelut, jos liikunnan harrastaminen kiinnostaa. Ensimmäisillä opiskeluviikoilla palveluita pääsee usein kokeilemaan ilmaiseksi\\n- [ISYY](https://www.isyy.fi/palvelut/uudelle-opiskelijalle.html)n sivut uudelle opiskelijalle","en_text":"# For a new student\\n\\nThis autumn, new students in Computer Science will begin the long and rocky, but so very rewarding journey towards their Bachelor of Science and Master of Philosophy degrees.\\nFreshman checklist\\n\\n- Remember to pay your membership fees to the Student Union of the University of Eastern Finland (ISYY) by 31 August\\n- The YTHS fee is also compulsory and is paid separately to Kela, it's worth checking it out\\n- You should read the Smart Start guide of the Department of Computer Science and the instructions for new students\\n- Join the Server.\\n- Join the Server information channel: https://t.me/serveriry\\n- Check out the autumn tutors here\\n- Get your student card\\n\\n## Student card\\n\\nThe student card is your proof of student status to qualify for student discounts. Physical student cards are available at the time of writing (Spring 2021) and cost €25. There is no difference between physical and electronic cards other than the issuer and possibly some differences in discounts. For exams, an electronic card or other form of ID will be accepted. All options at time of writing (spring 2021) free International cards are purchased via. Both physical and electronic versions are available.\\n\\n\\n## Good to know\\n\\n- The server informs about its events primarily on Telegram, but also on its website and mailing list. New members are added to the mailing list after being accepted as members by the board of directors after payment of the membership fee.\\n- In addition to the platforms mentioned above, Serverimeinink can also be found on Facebook and Instagram\\n\\n## Potentially useful content\\n\\n- [Sykettä](https://sykettä.fi/kuopio/), the sports services of universities, if you are interested in sports. You can often try out the services for free during the first weeks of your studies\\n- [ISYY](https://www.isyy.fi/palvelut/uudelle-opiskelijalle.html) website for new students"}	{"fi_text":"# Uudelle opiskelijalle\\n\\nTietojenkäsittelytieteen uudet opiskelijat aloittavat syksyllä pitkän ja kivikkoisen, mutta niin kovin antoisan tiensä kohti luonnontieteen kandidaatin ja filosofian maisterin titteleitä.\\nFuksin muistilista\\n\\n- Muista maksaa jäsenmaksut Itä-Suomen yliopiston ylioppilaskunnalle (ISYY) 31.8 mennessä\\n- YTHS maksu on myös pakollinen ja se maksetaan erikseen Kelalle, kannattaa se kurkistella kuntoon\\n- Kannattaa lukea Tietojenkäsittelytieteen laitoksen Smart Start -opas ja kamusta ohjeet uudelle opiskelijalle\\n- Liity Serverin jäseneksi.\\n- Liity Serverin tiedotuskanavalle: https://t.me/serveriry\\n- Tsekkaa syksyn tuutorit täältä\\n- Hanki opiskelijakortti\\n\\n## Opiskelijakortti\\n\\nOpiskelijakortilla todistat opiskelijastatuksesi, jotta voit saada opiskelija-alennuksia. Fyysisiä opiskelijakortteja hankitaan kirjoittamishetkellä (kevät 2021) kautta ja maksaa 25€. Fyysisellä ja sähköisillä korteilla ei ole muuta eroa kuin myöntäjä ja mahdollisesti joitain eroja alennuksissa. Tenttitilaisuuksissa kelpaa sähköinen kortti tai muu henkilöllisyystodistus. Kaikki vaihtoehdot kirjoittamishetkellä (kevät 2021) ilmaisia Kansainväliset kortit hankitaan kautta. Saatavilla sekä fyysinen että sähköinen versio.\\n\\n\\n## Hyvä tietää\\n\\n- Serveri tiedottaa tapahtumistaan ensisijaisesti Telegramissa, mutta myös kotisivuilla ja postilistalla. Uudet jäsenet lisätään postilistalle, kun hallitus on hyväksynyt heidät jäseniksi jäsenmaksun maksamisen jälkeen.\\n- Serverimeininkiä löytyy edellä mainittujen alustojen lisäksi myös Facebookista ja Instagramista\\n\\n## Mahdollisesti hyödyllistä sisältöä\\n\\n- [Sykettä](https://sykettä.fi/kuopio/) eli korkeakoulujen liikuntapalvelut, jos liikunnan harrastaminen kiinnostaa. Ensimmäisillä opiskeluviikoilla palveluita pääsee usein kokeilemaan ilmaiseksi\\n- [ISYY](https://www.isyy.fi/palvelut/uudelle-opiskelijalle.html)n sivut uudelle opiskelijalle","user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-29T20:09:12.545Z"}	\N
381	493	study_club	1	{"id":1,"user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-29T20:09:26.905Z","fi_text":"# Läksykerho","en_text":"# Study club"}	{"fi_text":"# Läksykerho","en_text":"# Study club","user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-29T20:09:26.905Z"}	\N
382	494	study_club	1	{"id":1,"user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-29T20:10:58.119Z","fi_text":"# Läksykerho\\n\\nLäksykerho on tarkoitettu kaikille TKT:n opiskelijoille ja vuosikursseille. Tulkaa yhdessä miettimään ja ratkomaan kurssien harjoitustehtäviä. Läksykerhon aika on 4 h, mutta se ei tarkoita sitä, että siellä tulee olla koko aikaa. Tulkaa silloin, kun muilta opinnoiltanne kerkiätte.  \\n\\nLäksykerho päivinä laitos tarjoaa kahvit/teet klo 13.45-14.15 laitoksen aulassa. Silloin on mahdollista tavata myös paikalla olevaa laitoksen henkilökuntaa.","en_text":"# Study club\\n\\nThe club is open to all TKT students and year groups. Come together to think about and solve course exercises. The time of the club is 4 hours, but that does not mean that you have to be there all the time. Please come when you can from your other studies.  \\n\\nOn the days of the study club, the department offers coffee/tea from 13.45 to 14.15 in the lobby of the department. It is also possible to meet the staff of the institution on site."}	{"fi_text":"# Läksykerho\\n\\nLäksykerho on tarkoitettu kaikille TKT:n opiskelijoille ja vuosikursseille. Tulkaa yhdessä miettimään ja ratkomaan kurssien harjoitustehtäviä. Läksykerhon aika on 4 h, mutta se ei tarkoita sitä, että siellä tulee olla koko aikaa. Tulkaa silloin, kun muilta opinnoiltanne kerkiätte.  \\n\\nLäksykerho päivinä laitos tarjoaa kahvit/teet klo 13.45-14.15 laitoksen aulassa. Silloin on mahdollista tavata myös paikalla olevaa laitoksen henkilökuntaa.","en_text":"# Study club\\n\\nThe club is open to all TKT students and year groups. Come together to think about and solve course exercises. The time of the club is 4 hours, but that does not mean that you have to be there all the time. Please come when you can from your other studies.  \\n\\nOn the days of the study club, the department offers coffee/tea from 13.45 to 14.15 in the lobby of the department. It is also possible to meet the staff of the institution on site.","user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-29T20:10:58.119Z"}	\N
383	495	directus_fields	102	{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"liity_serveriin"}	{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"liity_serveriin"}	\N
384	496	directus_fields	103	{"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"liity_serveriin"}	{"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"liity_serveriin"}	\N
385	497	directus_fields	104	{"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"liity_serveriin"}	{"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"liity_serveriin"}	\N
386	498	directus_collections	liity_serveriin	{"singleton":true,"collection":"liity_serveriin"}	{"singleton":true,"collection":"liity_serveriin"}	\N
387	499	directus_fields	105	{"interface":"input-rich-text-md","special":null,"collection":"liity_serveriin","field":"text"}	{"interface":"input-rich-text-md","special":null,"collection":"liity_serveriin","field":"text"}	\N
388	500	directus_fields	105	{"id":105,"collection":"liity_serveriin","field":"text","special":null,"interface":"input-rich-text-md","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"liity_serveriin","field":"text","special":null,"interface":"input-rich-text-md","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	\N
389	501	liity_serveriin	1	{"text":"# Liity jäseneksi\\n\\nAktiivisen kampusalueella tapahtuvan toiminnan lisäksi Serveri neuvottelee etuja jäsenilleen. Jäsenedut ovat suoraan käytettävissä jäsenmaksun maksaneena, jäsenyys tarkistetaan aina suoraan jäsenrekisteristä.\\n\\n- Haalarit jäsenhintaan\\n\\t- Hinta vaihtelee vuosittain sponsoreiden anteliaisuuden mukaan, mutta voit olla varma että jäsenenä saat merkittävän alennuksen.\\n- Ainejärjestön reissut ja excursiot reilulla alennuksella\\n- Osallistuminen Serverin sitseille myöskin jäsenhintaan\\n- Pääset Serverin sähköpostilistalle\\n- Oikeus lähteä mukaan hallitustoimintaan\\n\\n\\nJäseneksi liittyminen\\nUutta! Jäseneksi voi liittyä nyt hieman elegantimmin\\n\\nAlla oleva nappi vie Stripen lomakkeelle jolla maksu ja tiedot käsitellään. Liittymällä hyväksyt tietosuoja- ja rekisteriehdot\\nRekisteri- ja tietosuojaseloste\\n\\nOngelmatilanteessa ota yhteyttä @jimboolio:on Telegramissa\\nVanha mutta edelleen toimiva tapa liittyä - jos uusi tapa on räjähtänyt:\\n\\nServerin jäseneksi voit liittyä maksamalla kertamaksun 25 euroa Serverin tilille (Nordea FI87 1078 3000 2205 16) Jos olet saanut jäsenmaksullesi maksuviitteen, käytä sitä. Muuten laita maksun viestikenttään nimesi.\\n\\nTämän jälkeen lähetä nimesi ja jäsenrekisteriin kirjattava sähköpostiosoitteesi osoitteeseen hallitus at serveriry.fi Tietosuojaselosteen löydät osoitteesta https://www.serveriry.fi/tietosuojaseloste/ Tämän jälkeen hallitus hyväksyy uudet jäsenet kuukausittaisessa kokouksessa. Hyväksytyille jäsenille ilmoitetaan sähköpostitse."}	{"text":"# Liity jäseneksi\\n\\nAktiivisen kampusalueella tapahtuvan toiminnan lisäksi Serveri neuvottelee etuja jäsenilleen. Jäsenedut ovat suoraan käytettävissä jäsenmaksun maksaneena, jäsenyys tarkistetaan aina suoraan jäsenrekisteristä.\\n\\n- Haalarit jäsenhintaan\\n\\t- Hinta vaihtelee vuosittain sponsoreiden anteliaisuuden mukaan, mutta voit olla varma että jäsenenä saat merkittävän alennuksen.\\n- Ainejärjestön reissut ja excursiot reilulla alennuksella\\n- Osallistuminen Serverin sitseille myöskin jäsenhintaan\\n- Pääset Serverin sähköpostilistalle\\n- Oikeus lähteä mukaan hallitustoimintaan\\n\\n\\nJäseneksi liittyminen\\nUutta! Jäseneksi voi liittyä nyt hieman elegantimmin\\n\\nAlla oleva nappi vie Stripen lomakkeelle jolla maksu ja tiedot käsitellään. Liittymällä hyväksyt tietosuoja- ja rekisteriehdot\\nRekisteri- ja tietosuojaseloste\\n\\nOngelmatilanteessa ota yhteyttä @jimboolio:on Telegramissa\\nVanha mutta edelleen toimiva tapa liittyä - jos uusi tapa on räjähtänyt:\\n\\nServerin jäseneksi voit liittyä maksamalla kertamaksun 25 euroa Serverin tilille (Nordea FI87 1078 3000 2205 16) Jos olet saanut jäsenmaksullesi maksuviitteen, käytä sitä. Muuten laita maksun viestikenttään nimesi.\\n\\nTämän jälkeen lähetä nimesi ja jäsenrekisteriin kirjattava sähköpostiosoitteesi osoitteeseen hallitus at serveriry.fi Tietosuojaselosteen löydät osoitteesta https://www.serveriry.fi/tietosuojaseloste/ Tämän jälkeen hallitus hyväksyy uudet jäsenet kuukausittaisessa kokouksessa. Hyväksytyille jäsenille ilmoitetaan sähköpostitse."}	\N
390	502	directus_fields	106	{"interface":"input-rich-text-md","special":null,"required":true,"collection":"liity_serveriin","field":"fi_text"}	{"interface":"input-rich-text-md","special":null,"required":true,"collection":"liity_serveriin","field":"fi_text"}	\N
391	503	directus_fields	107	{"interface":"input-rich-text-md","special":null,"required":true,"collection":"liity_serveriin","field":"en_text"}	{"interface":"input-rich-text-md","special":null,"required":true,"collection":"liity_serveriin","field":"en_text"}	\N
442	557	directus_fields	26	{"id":26,"collection":"board_members","field":"email","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":11,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"email","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":11,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	\N
392	504	liity_serveriin	1	{"id":1,"user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-29T20:15:32.510Z","fi_text":"# Liity jäseneksi\\n\\nAktiivisen kampusalueella tapahtuvan toiminnan lisäksi Serveri neuvottelee etuja jäsenilleen. Jäsenedut ovat suoraan käytettävissä jäsenmaksun maksaneena, jäsenyys tarkistetaan aina suoraan jäsenrekisteristä.\\n\\n## Jäsenedut\\n\\n- Haalarit jäsenhintaan\\n\\t- Hinta vaihtelee vuosittain sponsoreiden anteliaisuuden mukaan, mutta voit olla varma että jäsenenä saat merkittävän alennuksen.\\n- Ainejärjestön reissut ja excursiot reilulla alennuksella\\n- Osallistuminen Serverin sitseille myöskin jäsenhintaan\\n- Pääset Serverin sähköpostilistalle\\n- Oikeus lähteä mukaan hallitustoimintaan\\n\\n\\n## Jäseneksi liittyminen\\n\\nServerin jäseneksi voit liittyä maksamalla ~~kertamaksun~~ 25 euroa Serverin tilille (Nordea FI87 1078 3000 2205 16) Jos olet saanut jäsenmaksullesi maksuviitteen, käytä sitä. Muuten laita maksun viestikenttään nimesi.\\n\\nTämän jälkeen lähetä nimesi ja jäsenrekisteriin kirjattava sähköpostiosoitteesi osoitteeseen hallitus at serveriry.fi Tietosuojaselosteen löydät osoitteesta https://www.serveriry.fi/tietosuojaseloste/ Tämän jälkeen hallitus hyväksyy uudet jäsenet kuukausittaisessa kokouksessa. Hyväksytyille jäsenille ilmoitetaan sähköpostitse.","en_text":"# Join serveri ry\\n\\nIn addition to active campus activities, the Server negotiates benefits for its members. Member benefits are directly available upon payment of the membership fee, membership is always checked directly in the membership register.\\n\\n## Member benefits\\n\\n- Overalls at member prices\\n\\t- The price varies from year to year depending on the generosity of sponsors, but you can be sure that as a member you will receive a significant discount.\\n- Association trips and excursions at a fair discount\\n- Attendance at Server's meetings also at a member price\\n- Get on the Server email list\\n- The right to get involved in board activities\\n\\n\\n## Become a member\\n\\nYou can become a member of the Server by paying a ~~one-time fee~~ € 25 to the Server's account (Nordea FI87 1078 3000 2205 16) If you have received a payment reference for your membership fee, please use it. Otherwise, please put your name in the message field of the payment.\\n\\nThen send your name and your email address to be entered in the membership register to hallitus at serveriry.fi You can find the privacy policy at https://www.serveriry.fi/tietosuojaseloste/ The board will then approve new members at the monthly meeting. Approved members will be notified by email."}	{"fi_text":"# Liity jäseneksi\\n\\nAktiivisen kampusalueella tapahtuvan toiminnan lisäksi Serveri neuvottelee etuja jäsenilleen. Jäsenedut ovat suoraan käytettävissä jäsenmaksun maksaneena, jäsenyys tarkistetaan aina suoraan jäsenrekisteristä.\\n\\n## Jäsenedut\\n\\n- Haalarit jäsenhintaan\\n\\t- Hinta vaihtelee vuosittain sponsoreiden anteliaisuuden mukaan, mutta voit olla varma että jäsenenä saat merkittävän alennuksen.\\n- Ainejärjestön reissut ja excursiot reilulla alennuksella\\n- Osallistuminen Serverin sitseille myöskin jäsenhintaan\\n- Pääset Serverin sähköpostilistalle\\n- Oikeus lähteä mukaan hallitustoimintaan\\n\\n\\n## Jäseneksi liittyminen\\n\\nServerin jäseneksi voit liittyä maksamalla ~~kertamaksun~~ 25 euroa Serverin tilille (Nordea FI87 1078 3000 2205 16) Jos olet saanut jäsenmaksullesi maksuviitteen, käytä sitä. Muuten laita maksun viestikenttään nimesi.\\n\\nTämän jälkeen lähetä nimesi ja jäsenrekisteriin kirjattava sähköpostiosoitteesi osoitteeseen hallitus at serveriry.fi Tietosuojaselosteen löydät osoitteesta https://www.serveriry.fi/tietosuojaseloste/ Tämän jälkeen hallitus hyväksyy uudet jäsenet kuukausittaisessa kokouksessa. Hyväksytyille jäsenille ilmoitetaan sähköpostitse.","en_text":"# Join serveri ry\\n\\nIn addition to active campus activities, the Server negotiates benefits for its members. Member benefits are directly available upon payment of the membership fee, membership is always checked directly in the membership register.\\n\\n## Member benefits\\n\\n- Overalls at member prices\\n\\t- The price varies from year to year depending on the generosity of sponsors, but you can be sure that as a member you will receive a significant discount.\\n- Association trips and excursions at a fair discount\\n- Attendance at Server's meetings also at a member price\\n- Get on the Server email list\\n- The right to get involved in board activities\\n\\n\\n## Become a member\\n\\nYou can become a member of the Server by paying a ~~one-time fee~~ € 25 to the Server's account (Nordea FI87 1078 3000 2205 16) If you have received a payment reference for your membership fee, please use it. Otherwise, please put your name in the message field of the payment.\\n\\nThen send your name and your email address to be entered in the membership register to hallitus at serveriry.fi You can find the privacy policy at https://www.serveriry.fi/tietosuojaseloste/ The board will then approve new members at the monthly meeting. Approved members will be notified by email.","user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-04-29T20:15:32.510Z"}	\N
393	505	directus_permissions	16	{"role":null,"collection":"liity_serveriin","action":"read"}	{"role":null,"collection":"liity_serveriin","action":"read"}	\N
394	506	directus_permissions	16	{"id":16,"role":null,"collection":"liity_serveriin","action":"read","permissions":null,"validation":null,"presets":null,"fields":["fi_text","en_text","date_updated"]}	{"role":null,"collection":"liity_serveriin","action":"read","permissions":null,"validation":null,"presets":null,"fields":["fi_text","en_text","date_updated"]}	\N
395	507	directus_permissions	17	{"role":null,"collection":"study_club","action":"read"}	{"role":null,"collection":"study_club","action":"read"}	\N
396	508	directus_permissions	17	{"id":17,"role":null,"collection":"study_club","action":"read","permissions":null,"validation":null,"presets":null,"fields":["fi_text","en_text","date_updated"]}	{"role":null,"collection":"study_club","action":"read","permissions":null,"validation":null,"presets":null,"fields":["fi_text","en_text","date_updated"]}	\N
397	509	directus_permissions	18	{"role":null,"collection":"for_new_student","action":"read"}	{"role":null,"collection":"for_new_student","action":"read"}	\N
398	510	directus_permissions	18	{"id":18,"role":null,"collection":"for_new_student","action":"read","permissions":null,"validation":null,"presets":null,"fields":["fi_text","en_text","date_updated"]}	{"role":null,"collection":"for_new_student","action":"read","permissions":null,"validation":null,"presets":null,"fields":["fi_text","en_text","date_updated"]}	\N
399	513	lomake_vastaukset	105	{"firm_message":"moro mite menee","firm_contact":"nimi@email.co","firm_name":"yritys"}	{"firm_message":"moro mite menee","firm_contact":"nimi@email.co","firm_name":"yritys"}	\N
400	514	lomake_vastaukset	106	{"firm_message":"moro mite menee","firm_contact":"nimi@email.co","firm_name":"yritys"}	{"firm_message":"moro mite menee","firm_contact":"nimi@email.co","firm_name":"yritys"}	\N
401	515	lomake_vastaukset	107	{"firm_message":"moro mite menee","firm_contact":"nimi@email.co","firm_name":"yritys"}	{"firm_message":"moro mite menee","firm_contact":"nimi@email.co","firm_name":"yritys"}	\N
402	516	lomake_vastaukset	108	{"firm_message":"moro mite menee","firm_contact":"nimi@email.co","firm_name":"yritys"}	{"firm_message":"moro mite menee","firm_contact":"nimi@email.co","firm_name":"yritys"}	\N
403	517	lomake_vastaukset	109	{"firm_message":"moro mite menee","firm_contact":"nimi@email.co","firm_name":"yritys"}	{"firm_message":"moro mite menee","firm_contact":"nimi@email.co","firm_name":"yritys"}	\N
404	518	lomake_vastaukset	110	{"firm_message":"moro... 1","firm_contact":"nimi@email.co","firm_name":"Footer on mobile"}	{"firm_message":"moro... 1","firm_contact":"nimi@email.co","firm_name":"Footer on mobile"}	\N
405	519	lomake_vastaukset	111	{"firm_message":"moro... 1","firm_contact":"nimi@email.co","firm_name":"Footer on mobile"}	{"firm_message":"moro... 1","firm_contact":"nimi@email.co","firm_name":"Footer on mobile"}	\N
406	520	lomake_vastaukset	112	\N	\N	\N
407	521	lomake_vastaukset	113	{"firm_message":"dawdaw","firm_contact":"dawd","firm_name":"fuksipassi"}	{"firm_message":"dawdaw","firm_contact":"dawd","firm_name":"fuksipassi"}	\N
408	522	directus_fields	108	{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"gdpr"}	{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"gdpr"}	\N
409	523	directus_fields	109	{"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"gdpr"}	{"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"gdpr"}	\N
410	524	directus_fields	110	{"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"gdpr"}	{"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"gdpr"}	\N
411	525	directus_collections	gdpr	{"singleton":true,"collection":"gdpr"}	{"singleton":true,"collection":"gdpr"}	\N
412	526	directus_fields	111	{"interface":"input-rich-text-md","special":null,"required":true,"collection":"gdpr","field":"text"}	{"interface":"input-rich-text-md","special":null,"required":true,"collection":"gdpr","field":"text"}	\N
413	527	directus_fields	112	{"interface":"input-rich-text-md","special":null,"collection":"gdpr","field":"fi_text"}	{"interface":"input-rich-text-md","special":null,"collection":"gdpr","field":"fi_text"}	\N
414	528	directus_fields	113	{"interface":"input-rich-text-md","special":null,"collection":"gdpr","field":"en_text"}	{"interface":"input-rich-text-md","special":null,"collection":"gdpr","field":"en_text"}	\N
415	529	lomake_vastaukset	114	\N	\N	\N
416	530	lomake_vastaukset	115	\N	\N	\N
417	531	gdpr	1	{"fi_text":"# Rekisteri- ja tietosuojaseloste\\n\\n## Keitä olemme\\n\\nOlemme Itä-Suomen yliopiston tietojenkäsittelytieteen opiskelijoiden ainejärjestö eli Serveri ry.\\n\\nPostiosoitteemme löydät connect sivun alareumasta.\\n\\nLisätietoja järjestöstämme löydät osiosta järjestö. Jäsenrekisteristä vastaa ylläpitovastaava ja sihteeri.\\n\\n## Henkilötiedot\\n\\n### Jäsenrekisterin henkilötiedot\\n\\nMikäli liityt jäseneksi tallennamme jäsenrekisteriin käyttötarkoitusta varten luovuttamasi tiedot. (Emme ikinä tallenna maksukorttisi tietoja.) Jäsenrekisteriimme kuuluu sellaiset Itä-Suomen yliopiston Kuopion kampuksen opiskelijat jotka jäsenmaksun maksamalla ovat ilmaisseet halukkuutensa liittyä jäseneksi.\\n\\n\\nJäsenrekisterin käyttöperusteena on Henkilön itsensä antama suostumus sekä yhdistyslain mukainen vaatimus ylläpitää jäsenrekisteriä. Tietoja käytetään toiminnasta viestimiseen eli lähinnä yhteydenpitoon esimerkiksi sähköpostilistan muodossa. Mahdollisista muutoksista tiedotetaan hallituksen kokouksissa.\\n\\n\\nTietojen lähteenä on käyttäjän itse toimittama tieto.\\n\\n### Evästeet\\n\\nVain tekniset evästeet käytössä. Emme louhi dataa \\"sisällön parantamiseen\\". Jos havaitset teknisiä puutteita tai haluat esittää parannusta, ilmoita ylläpidolle tai hallitukselle.\\n\\n### Analytiikka\\n\\nTallennamme verkkosivustolla vierailuista lokitietoja joihin kuuluu IP osoitteet, kellonajat sekä muuta mahdollista palvelinpään analytiikkaa. Tietoja käytetään tietoturvan monitorointiin sekä mahdollisen haitallisen toiminnan estämiseen. Lokitietoja voidaan jakaa viranomaisille. Lokitietoja poistetaan vanhimmasta alkaen, siten että tallessa on viimeisimmän vuoden tapahtumat.\\n\\n## Kenen kanssa jaamme dataasi\\n\\nSähköpostilistamme taustajärjestelmää ylläpitää Itä-Suomen yliopisto. Jäsenrekisterin tietoja käsittelee hallitus. Emme luovuta tietojasi ulkopuolisille, ellei jokin seuraavista ehdoista täyty:\\n\\n-  Jos itse niin pyydät tai kysyessämme saamme tietojen luovutukseen luvan\\n-  Jos teet oston sivustomme kautta joudumme välittämään maksutapahtuman käsittelyyn vaadittavat tiedot maksutietojen käsittelijälle Stripelle. Halutessasi voit sopia vaihtoehtoisista maksutavoista hallituksemme kanssa. Stripen tietosuojaselosteen löydät osoitteesta: https://stripe.com/en-fi/privacy\\n-  Jos laki niin vaatii\\n-  Keräämämme tietoa käytetään oikeudessa järjestön edun puolustamiseen.\\n\\n## Kuinka kauan säilytämme tietojasi\\n\\nSäilytämme lokitietoja tarpeen mukaan, maksimissaan kaksi vuotta, yleensä vuoden.\\n\\nEmme säilytä jäsenrekisterihistoriaa, eli vanhentuneet tiedot poistetaan muutospyynnön saapuessa ylläpitovastaavalle, sihteerille tai hallitukselle.\\n\\n## Oikeutesi tietojesi suhteen\\n\\nVoit pyytää tietojesi poistoa, päivitystä tai kopiota tiedoistasi ylläpitovastaavalta. Lähtökohtaisesti jäsenrekisterin tietoja säilytetään niin kauan kuin ne ovat ajantasaiset.\\n\\n## Miten tietosi suojataan\\n\\nKäytämme tietojesi suojaukseen tarpeellisia suojauskeinoja. Emme siirrä tietojasi Suomen rajojen ulkopuolelle. Kirjoitushetkellä suurin osa tallennetuista tiedoista sijaitsee kaupallisen palveluntarjoajan palvelimilla Tuusulassa.\\nFyysisestä tietoturvasta vastaa palveluntarjoajamme. Palvelumme on suojattu automaattisilta hyökkäyksiltä siten että tietosuoja on etusijalla tiedon saavutettavuuteen nähden. Pyrimme käyttämään palvelinpäässä laajalti vertaisarvioitua, vapaata ohjelmistoa ja tarkistamaan suojausasetukset mielellään vähintään kahden henkilön toimesta turvalliseksi, joista toinen on ylläpitovastaava.\\n\\n## Muuta\\n\\nEmme käytä automaattista päätöksentekoa\\n\\nLisätietoa saat [ylläpitovastaavalta](https://t.me/vsavonen/)","en_text":"# Register and Privacy Policy\\n\\n## Who we are\\n\\nWe are the Serveri ry, an association of students of computer science at the University of Eastern Finland.\\n\\nYou can find our postal address at the bottom of the connect page.\\n\\nFor more information about our organisation, please see the organisation section. The membership register is managed by a maintenance officer and a secretary.\\n\\n## Personal data\\n\\n### Personal data of the register of members\\n\\nIf you become a member, we will store the information you provide for the purpose of the membership register. (We will never store your payment card details.) Our membership register includes students at the Kuopio campus of the University of Eastern Finland who have expressed their willingness to become a member by paying the membership fee.\\n\\n\\nThe membership register is based on the consent of the person himself/herself and the requirement to maintain a membership register in accordance with the Associations Act. The data is used to communicate activities, mainly for contact purposes, for example in the form of an e-mail list. Any changes will be communicated at board meetings.\\n\\n\\nThe source of the data is the information provided by the user.\\n\\n### Cookies\\n\\nOnly technical cookies are used. We do not mine data to \\"improve content\\". If you find any technical deficiencies or would like to suggest an improvement, please inform the administrator or the board.\\n\\n### Analytics\\n\\nWe record log information about visits to the website including IP addresses, time of day and other possible server-side analytics. This information is used for security monitoring and to prevent potential malicious activity. Log information may be shared with authorities. Logs are deleted starting with the oldest, so that the most recent year's events are stored.\\n\\n## With whom we share your data\\n\\nThe backend system of our email list is maintained by the University of Eastern Finland. The data in the membership register is processed by the Board of Directors. We will not share your data with third parties unless one of the following conditions is met:\\n\\n- If you ask us to do so or if we obtain your permission to disclose your data when you ask us to do so.\\n- If you make a purchase through our website we will need to pass the information required to process the transaction to the payment processor Stripe. If you wish, you can agree alternative payment methods with our Board of Directors. Stripe's Privacy Policy can be found at: https://stripe.com/en-fi/privacy\\n- If required by law\\n- The information we collect will be used in court to defend the interests of the organisation.\\n\\n## How long we keep your data\\n\\nWe keep log information as needed, up to a maximum of two years, usually one year.\\n\\nWe do not keep membership register history, i.e. outdated information is deleted when a request for change is received by the Maintenance Officer, Secretary or Board.\\n\\n## Your rights with regard to your data\\n\\nYou may request deletion, updating or copying of your data from the administrator. As a general rule, information in the membership register will be kept as long as it is up to date.\\n\\n## How your data is protected\\n\\nWe use the necessary security measures to protect your information. We will not transfer your data outside the borders of Finland. At the time of writing, most of the data stored is located on the servers of a commercial service provider in Tuusula.\\nOur service provider is responsible for physical security. Our service is protected against automated attacks so that data protection takes priority over data accessibility. We strive to use widely peer-reviewed, free software at the server end and to check the security settings for security, preferably by at least two people, one of whom is the maintainer.\\n\\n## Other\\n\\nWe do not use automated decision making\\n\\nFor more information, please contact [the maintainer](https://t.me/vsavonen/)"}	{"fi_text":"# Rekisteri- ja tietosuojaseloste\\n\\n## Keitä olemme\\n\\nOlemme Itä-Suomen yliopiston tietojenkäsittelytieteen opiskelijoiden ainejärjestö eli Serveri ry.\\n\\nPostiosoitteemme löydät connect sivun alareumasta.\\n\\nLisätietoja järjestöstämme löydät osiosta järjestö. Jäsenrekisteristä vastaa ylläpitovastaava ja sihteeri.\\n\\n## Henkilötiedot\\n\\n### Jäsenrekisterin henkilötiedot\\n\\nMikäli liityt jäseneksi tallennamme jäsenrekisteriin käyttötarkoitusta varten luovuttamasi tiedot. (Emme ikinä tallenna maksukorttisi tietoja.) Jäsenrekisteriimme kuuluu sellaiset Itä-Suomen yliopiston Kuopion kampuksen opiskelijat jotka jäsenmaksun maksamalla ovat ilmaisseet halukkuutensa liittyä jäseneksi.\\n\\n\\nJäsenrekisterin käyttöperusteena on Henkilön itsensä antama suostumus sekä yhdistyslain mukainen vaatimus ylläpitää jäsenrekisteriä. Tietoja käytetään toiminnasta viestimiseen eli lähinnä yhteydenpitoon esimerkiksi sähköpostilistan muodossa. Mahdollisista muutoksista tiedotetaan hallituksen kokouksissa.\\n\\n\\nTietojen lähteenä on käyttäjän itse toimittama tieto.\\n\\n### Evästeet\\n\\nVain tekniset evästeet käytössä. Emme louhi dataa \\"sisällön parantamiseen\\". Jos havaitset teknisiä puutteita tai haluat esittää parannusta, ilmoita ylläpidolle tai hallitukselle.\\n\\n### Analytiikka\\n\\nTallennamme verkkosivustolla vierailuista lokitietoja joihin kuuluu IP osoitteet, kellonajat sekä muuta mahdollista palvelinpään analytiikkaa. Tietoja käytetään tietoturvan monitorointiin sekä mahdollisen haitallisen toiminnan estämiseen. Lokitietoja voidaan jakaa viranomaisille. Lokitietoja poistetaan vanhimmasta alkaen, siten että tallessa on viimeisimmän vuoden tapahtumat.\\n\\n## Kenen kanssa jaamme dataasi\\n\\nSähköpostilistamme taustajärjestelmää ylläpitää Itä-Suomen yliopisto. Jäsenrekisterin tietoja käsittelee hallitus. Emme luovuta tietojasi ulkopuolisille, ellei jokin seuraavista ehdoista täyty:\\n\\n-  Jos itse niin pyydät tai kysyessämme saamme tietojen luovutukseen luvan\\n-  Jos teet oston sivustomme kautta joudumme välittämään maksutapahtuman käsittelyyn vaadittavat tiedot maksutietojen käsittelijälle Stripelle. Halutessasi voit sopia vaihtoehtoisista maksutavoista hallituksemme kanssa. Stripen tietosuojaselosteen löydät osoitteesta: https://stripe.com/en-fi/privacy\\n-  Jos laki niin vaatii\\n-  Keräämämme tietoa käytetään oikeudessa järjestön edun puolustamiseen.\\n\\n## Kuinka kauan säilytämme tietojasi\\n\\nSäilytämme lokitietoja tarpeen mukaan, maksimissaan kaksi vuotta, yleensä vuoden.\\n\\nEmme säilytä jäsenrekisterihistoriaa, eli vanhentuneet tiedot poistetaan muutospyynnön saapuessa ylläpitovastaavalle, sihteerille tai hallitukselle.\\n\\n## Oikeutesi tietojesi suhteen\\n\\nVoit pyytää tietojesi poistoa, päivitystä tai kopiota tiedoistasi ylläpitovastaavalta. Lähtökohtaisesti jäsenrekisterin tietoja säilytetään niin kauan kuin ne ovat ajantasaiset.\\n\\n## Miten tietosi suojataan\\n\\nKäytämme tietojesi suojaukseen tarpeellisia suojauskeinoja. Emme siirrä tietojasi Suomen rajojen ulkopuolelle. Kirjoitushetkellä suurin osa tallennetuista tiedoista sijaitsee kaupallisen palveluntarjoajan palvelimilla Tuusulassa.\\nFyysisestä tietoturvasta vastaa palveluntarjoajamme. Palvelumme on suojattu automaattisilta hyökkäyksiltä siten että tietosuoja on etusijalla tiedon saavutettavuuteen nähden. Pyrimme käyttämään palvelinpäässä laajalti vertaisarvioitua, vapaata ohjelmistoa ja tarkistamaan suojausasetukset mielellään vähintään kahden henkilön toimesta turvalliseksi, joista toinen on ylläpitovastaava.\\n\\n## Muuta\\n\\nEmme käytä automaattista päätöksentekoa\\n\\nLisätietoa saat [ylläpitovastaavalta](https://t.me/vsavonen/)","en_text":"# Register and Privacy Policy\\n\\n## Who we are\\n\\nWe are the Serveri ry, an association of students of computer science at the University of Eastern Finland.\\n\\nYou can find our postal address at the bottom of the connect page.\\n\\nFor more information about our organisation, please see the organisation section. The membership register is managed by a maintenance officer and a secretary.\\n\\n## Personal data\\n\\n### Personal data of the register of members\\n\\nIf you become a member, we will store the information you provide for the purpose of the membership register. (We will never store your payment card details.) Our membership register includes students at the Kuopio campus of the University of Eastern Finland who have expressed their willingness to become a member by paying the membership fee.\\n\\n\\nThe membership register is based on the consent of the person himself/herself and the requirement to maintain a membership register in accordance with the Associations Act. The data is used to communicate activities, mainly for contact purposes, for example in the form of an e-mail list. Any changes will be communicated at board meetings.\\n\\n\\nThe source of the data is the information provided by the user.\\n\\n### Cookies\\n\\nOnly technical cookies are used. We do not mine data to \\"improve content\\". If you find any technical deficiencies or would like to suggest an improvement, please inform the administrator or the board.\\n\\n### Analytics\\n\\nWe record log information about visits to the website including IP addresses, time of day and other possible server-side analytics. This information is used for security monitoring and to prevent potential malicious activity. Log information may be shared with authorities. Logs are deleted starting with the oldest, so that the most recent year's events are stored.\\n\\n## With whom we share your data\\n\\nThe backend system of our email list is maintained by the University of Eastern Finland. The data in the membership register is processed by the Board of Directors. We will not share your data with third parties unless one of the following conditions is met:\\n\\n- If you ask us to do so or if we obtain your permission to disclose your data when you ask us to do so.\\n- If you make a purchase through our website we will need to pass the information required to process the transaction to the payment processor Stripe. If you wish, you can agree alternative payment methods with our Board of Directors. Stripe's Privacy Policy can be found at: https://stripe.com/en-fi/privacy\\n- If required by law\\n- The information we collect will be used in court to defend the interests of the organisation.\\n\\n## How long we keep your data\\n\\nWe keep log information as needed, up to a maximum of two years, usually one year.\\n\\nWe do not keep membership register history, i.e. outdated information is deleted when a request for change is received by the Maintenance Officer, Secretary or Board.\\n\\n## Your rights with regard to your data\\n\\nYou may request deletion, updating or copying of your data from the administrator. As a general rule, information in the membership register will be kept as long as it is up to date.\\n\\n## How your data is protected\\n\\nWe use the necessary security measures to protect your information. We will not transfer your data outside the borders of Finland. At the time of writing, most of the data stored is located on the servers of a commercial service provider in Tuusula.\\nOur service provider is responsible for physical security. Our service is protected against automated attacks so that data protection takes priority over data accessibility. We strive to use widely peer-reviewed, free software at the server end and to check the security settings for security, preferably by at least two people, one of whom is the maintainer.\\n\\n## Other\\n\\nWe do not use automated decision making\\n\\nFor more information, please contact [the maintainer](https://t.me/vsavonen/)"}	\N
418	532	directus_permissions	19	{"role":null,"collection":"gdpr","action":"read"}	{"role":null,"collection":"gdpr","action":"read"}	\N
420	535	lomake_vastaukset	116	\N	\N	\N
422	537	hallitus_page	1	{"id":1,"user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-05-02T09:40:36.118Z","fi_text":"# Hallitus\\n\\nServerin hallitus vastaa ainejärjestötoiminnan käytännön asioiden hoidosta. Asioita tehdään yhdessä, mutta käytännön syistä tehtäviä on jaettu \\"hallitusrooleihin\\" jäsenten kiinnostuksen ja osaamisen mukaan. Mikäli haluat olla yhteydessä hallitukseen, tapahtuu se helpoiten sähköpostitse hallitus[ät]serveriry.fi tai Serverin jäsenenä löydät kaikki hallituslaiset myös Oppositiosta.\\n\\nServerin hallituksen jäsenet vaihtuvat vuosittain ja heidät valitaan kaikille jäsenille avoimessa syyskokouksessa. Ainejärjestötoiminnan sisältö mukautuu aikaan, mutta hallituksen varsinaiset tehtävät muuttuvat harvemmin ja hitaammin. Mikäli ainejärjestötoiminta kiinnostaa, kannattaa harkita hallitustoimintaan mukaan lähtemistä! Syyskokouksessa valitut jäsenet järjestäytyvät hallituskautensa alussa ja valitsevat keskuudestaan vastuuhenkilöt eri osaalueiden hoitamiseen. Vastuuhenkilöiden titteleistä saa jo hyvän kuvan siitä, minkälaista hallitustoiminta on.\\n\\nServerin hallituksen koko määräytyy syyskokouksessa ja tällä kaudella se koostuu 15:sta varsinaisesta ja 5:stä varajäsenestä. Hallituslaisiin ja heidän rooleihinsa voit tutustua alta, josta löydät myös yhteystiedot. Roolikohtaisten sähköpostiosotteiden lisäksi jokaisella hallituksen varsinaisella- ja varajäsenellä on henkilökohtainen sähköpostiosoite muodossa etunimi.sukunimi[ät]serveriry.fi.\\n\\n## Serverin Oppositio\\n\\nKiinnostaako ainejärjestötoiminta? Serverin Oppositio on ryhmä Telegramissa, jossa pääsee seuraamaan ainejärjestötoimintaa hieman lähempää. Ryhmään liittyminen ei sido mihinkään ja voit liittyä/poistua täysin vapaasti. Tervetuloa mukaan! [Liittymislinkki](https://t.me/) TG-ryhmään. ","en_text":"# Board activities\\n\\nThe server's board is responsible for the practical management of the association's activities. Things are done collectively, but for practical reasons, tasks are divided into \\"board roles\\" according to members' interests and skills. If you want to get in touch with the board, the easiest way is to email hallitus[ät]serveriry.fi or, as a Server member, you can also find all board members in the Opposition.\\n\\nServer's board members rotate annually and are elected at an autumn meeting open to all members. The content of the Board's activities adapts over time, but the actual tasks of the Board change less frequently and more slowly. If you are interested, you should consider joining the board! The members elected at the autumn meeting organise themselves at the beginning of their term of office and choose from among themselves the persons responsible for the various areas of activity. The titles of these people give you a good idea of what government is like.\\n\\nThe size of the Server Board is decided at the autumn meeting and this term it consists of 15 full members and 5 alternates. You can find out more about the board members and their roles below, where you can also find their contact details. In addition to the role-specific email addresses, each member and alternate member of the Board has a personal email address in the form of firstname.lastname[at]serveriry.fi.\\n\\n## Serveriry Opposition\\n\\nAre you interested in student union activities? Server's Opposition is a group on Telegram where you can follow the activities of the student union a little closer. Joining the group is not binding and you are free to join/leave. Welcome to join! [Join](https://t.me/) TG group. "}	{"fi_text":"# Hallitus\\n\\nServerin hallitus vastaa ainejärjestötoiminnan käytännön asioiden hoidosta. Asioita tehdään yhdessä, mutta käytännön syistä tehtäviä on jaettu \\"hallitusrooleihin\\" jäsenten kiinnostuksen ja osaamisen mukaan. Mikäli haluat olla yhteydessä hallitukseen, tapahtuu se helpoiten sähköpostitse hallitus[ät]serveriry.fi tai Serverin jäsenenä löydät kaikki hallituslaiset myös Oppositiosta.\\n\\nServerin hallituksen jäsenet vaihtuvat vuosittain ja heidät valitaan kaikille jäsenille avoimessa syyskokouksessa. Ainejärjestötoiminnan sisältö mukautuu aikaan, mutta hallituksen varsinaiset tehtävät muuttuvat harvemmin ja hitaammin. Mikäli ainejärjestötoiminta kiinnostaa, kannattaa harkita hallitustoimintaan mukaan lähtemistä! Syyskokouksessa valitut jäsenet järjestäytyvät hallituskautensa alussa ja valitsevat keskuudestaan vastuuhenkilöt eri osaalueiden hoitamiseen. Vastuuhenkilöiden titteleistä saa jo hyvän kuvan siitä, minkälaista hallitustoiminta on.\\n\\nServerin hallituksen koko määräytyy syyskokouksessa ja tällä kaudella se koostuu 15:sta varsinaisesta ja 5:stä varajäsenestä. Hallituslaisiin ja heidän rooleihinsa voit tutustua alta, josta löydät myös yhteystiedot. Roolikohtaisten sähköpostiosotteiden lisäksi jokaisella hallituksen varsinaisella- ja varajäsenellä on henkilökohtainen sähköpostiosoite muodossa etunimi.sukunimi[ät]serveriry.fi.\\n\\n## Serverin Oppositio\\n\\nKiinnostaako ainejärjestötoiminta? Serverin Oppositio on ryhmä Telegramissa, jossa pääsee seuraamaan ainejärjestötoimintaa hieman lähempää. Ryhmään liittyminen ei sido mihinkään ja voit liittyä/poistua täysin vapaasti. Tervetuloa mukaan! [Liittymislinkki](https://t.me/) TG-ryhmään. ","user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-05-02T09:40:36.118Z"}	\N
423	538	lomake_vastaukset	118	\N	\N	\N
424	539	LandingPage	1	{"id":1,"user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-05-02T12:08:03.842Z","fi_title":"Serveri ry","en_title":"Serveri ry","fi_description":"Itä-Suomen yliopiston Kuopion kampuksen tietojenkäsittelytieteen opiskelijoiden ainejärjestö ","en_description":"The computer science students' subject organization of the Kuopio campus of the University of Eastern Finland","fi_button_text":"Millaista tietojenkäsittelytiede on?","en_button_text":"What is computer science like?","en_button_url":"/opiskelu/tkt","fi_button_url":"/opiskelu/tkt","fi_long_desc":"# Mitä me teemme?\\n\\nToimimme linkkinä yliopiston ja opiskelijoiden välillä mm. keräämällä ja välittämällä opiskelijapalautetta yliopistolle. Tarjoamme opiskelijajäsenillemme ohjausta edunvalvonnallisissa asioissa ja järjestämme opintojen oheen vapaa-ajan toimintaa sekä itsenäisesti että yhdessä muiden ainejärjestöjen kanssa. Järjestämme toimintaa myös työelämään valmistelevalla näkökulmalla ottamalla silloin tällöin vaikutteita suoraan tietojenkäsittelytieteen alan yritysten toiminnasta, jakamalla tietoa valmistumisen jälkeisistä mahdollisuusista ja helpotamme siten tulevien tietojenkäsittelijöiden erikoistuvaa suuntautumista.\\n\\nServerit ovat legendaarisia hauskanpitäjiä - omien hippaloiden lisäksi valkohaalariset tunnetaankin ahkerina kuokkijoina ja keräämme mielellämme kyseenalaista kunniaa opiskelijatapahtumissa ympäri Suomen. Ei siis ihme että Serverin tavaramerkkinä pidetään loistavaa yhteishenkeä ja mahtavaa aktiivisuutta, nörtti-imagosta puhumattakaan! ","en_long_desc":"# What do we do?\\n\\nWe act as a link between the university and students, for example by collecting and transmitting student feedback to the university. We offer our student members guidance on advocacy issues and organise extracurricular activities, both independently and in cooperation with other student organisations. We also organise activities with a view to preparing students for the world of work by occasionally taking direct inspiration from companies in the computer science sector, sharing information about opportunities after graduation and thus facilitating the specialisation of future computer scientists.\\n\\nServers are legendary fun lovers - in addition to our own hijinks, the Whitefish are known as hard-working hackers and we like to garner questionable glory at student events all over Finland. It's no wonder that Server is known for its great team spirit and awesome activity, not to mention its nerd image! "}	{"fi_title":"Serveri ry","en_title":"Serveri ry","user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-05-02T12:08:03.842Z"}	\N
425	540	lomake_vastaukset	119	\N	\N	\N
426	541	lomake_vastaukset	120	\N	\N	\N
427	542	lomake_vastaukset	121	\N	\N	\N
428	543	lomake_vastaukset	122	{"firm_message":"1","firm_contact":"1","firm_name":"1"}	{"firm_message":"1","firm_contact":"1","firm_name":"1"}	\N
429	544	lomake_vastaukset	123	\N	\N	\N
430	545	board_members	1	{"id":1,"status":"published","user_created":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_created":"2023-04-16T16:04:40.405Z","user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-05-02T12:39:50.188Z","name":"Matti Meikäläinen","role":"Jäsen","email":"matti.meikalainen","telegram":"mattimeikalainen","description":"Hallituksen jäsen toimii hallituksessa.","hover_img":"/images/member2.jpeg","img":"/images/member.jpeg"}	{"email":"matti.meikalainen","user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-05-02T12:39:50.188Z"}	\N
431	546	board_members	2	{"id":2,"status":"published","user_created":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_created":"2023-04-16T16:05:10.468Z","user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-05-02T12:39:54.081Z","name":"Maija Meikäläinen","role":"Jäsen","email":"maija.meikalainen","telegram":"maijameikalainen","description":"Hallituksen jäsen toimii hallituksessa.","hover_img":"https://img.ilcdn.fi/cgh7U4SKQ1ujJ-_uO6uNxT91crU=/full-fit-in/612x0/img-s3.ilcdn.fi/0b222e185bd67c4f1c37ac0461dd816622d9a66a2d31bcd6d0c1243b21f26d3d.jpg","img":"/images/member.jpeg"}	{"email":"maija.meikalainen","user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-05-02T12:39:54.081Z"}	\N
432	547	board_members	3	{"id":3,"status":"published","user_created":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_created":"2023-04-17T10:37:48.208Z","user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-05-02T12:39:58.960Z","name":"Erkki Pesonen","role":"Jäsen","email":"consult","telegram":"epesonen","description":"Hallituksen jäsen toimii hallituksessa.","hover_img":"/images/member2.jpeg","img":"/images/member.jpeg"}	{"email":"consult","user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-05-02T12:39:58.960Z"}	\N
433	548	board_members	2	{"id":2,"status":"published","user_created":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_created":"2023-04-16T16:05:10.468Z","user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-05-02T12:45:35.919Z","name":"Maija Meikäläinen","role":"Jäsen","email":"maija.meikalainen","telegram":"maijameikalainen","description":"Hallituksen jäsen toimii hallituksessa.","hover_img":null,"img":"placeholder.png"}	{"hover_img":null,"img":"placeholder.png","user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-05-02T12:45:35.919Z"}	\N
434	549	board_members	2	{"id":2,"status":"published","user_created":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_created":"2023-04-16T16:05:10.468Z","user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-05-02T12:47:21.639Z","name":"Maija Meikäläinen","role":"Jäsen","email":"maija.meikalainen","telegram":"maijameikalainen","description":"Hallituksen jäsen toimii hallituksessa.","hover_img":null,"img":"/images/placeholder.jpg"}	{"img":"/images/placeholder.jpg","user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-05-02T12:47:21.639Z"}	\N
435	550	board_members	2	{"id":2,"status":"published","user_created":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_created":"2023-04-16T16:05:10.468Z","user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-05-02T12:47:25.352Z","name":"Maija Meikäläinen","role":"Jäsen","email":"maija.meikalainen","telegram":"maijameikalainen","description":"Hallituksen jäsen toimii hallituksessa.","hover_img":"/images/placeholder.jpg","img":"/images/placeholder.jpg"}	{"hover_img":"/images/placeholder.jpg","user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-05-02T12:47:25.352Z"}	\N
436	551	board_members	2	{"id":2,"status":"published","user_created":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_created":"2023-04-16T16:05:10.468Z","user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-05-02T13:03:15.980Z","name":"Maija Meikäläinen","role":"Jäsen","email":"maija.meikalainen","telegram":"maijameikalainen","description":"Hallituksen jäsen toimii hallituksessa.","hover_img":null,"img":"/images/placeholder-square.jpg"}	{"hover_img":null,"img":"/images/placeholder-square.jpg","user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-05-02T13:03:15.980Z"}	\N
437	552	board_members	2	{"id":2,"status":"published","user_created":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_created":"2023-04-16T16:05:10.468Z","user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-05-02T13:03:50.109Z","name":"Maija Meikäläinen","role":"Jäsen","email":"maija.meikalainen","telegram":"maijameikalainen","description":"Hallituksen jäsen toimii hallituksessa.","hover_img":"/images/placeholder-square.jpg","img":"/images/placeholder-square.jpg"}	{"hover_img":"/images/placeholder-square.jpg","user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-05-02T13:03:50.109Z"}	\N
477	596	directus_fields	122	{"interface":"input","hidden":true,"field":"sort","collection":"events"}	{"interface":"input","hidden":true,"field":"sort","collection":"events"}	\N
440	555	directus_fields	24	{"id":24,"collection":"board_members","field":"name","special":null,"interface":"input","options":{"url":null},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"name","special":null,"interface":"input","options":{"url":null},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	\N
441	556	directus_fields	25	{"id":25,"collection":"board_members","field":"role","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"role","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	\N
444	559	directus_fields	29	{"id":29,"collection":"board_members","field":"description","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":13,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"description","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":13,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	\N
443	558	directus_fields	28	{"id":28,"collection":"board_members","field":"telegram","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":12,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"telegram","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":12,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	\N
445	560	board_members	4	{"status":"published","role":"Puheenjohtaja"}	{"status":"published","role":"Puheenjohtaja"}	\N
446	561	directus_fields	26	{"id":26,"collection":"board_members","field":"email","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":11,"width":"full","translations":null,"note":"etunimi.sukunimi tai rooli, ei päätettä serveriry.fi","conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"email","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":11,"width":"full","translations":null,"note":"etunimi.sukunimi tai rooli, ei päätettä serveriry.fi","conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	\N
447	562	lomake_vastaukset	124	\N	\N	\N
448	567	directus_fields	114	{"interface":"input","special":null,"options":{"placeholder":null},"required":true,"collection":"board_members","field":"fi_role"}	{"interface":"input","special":null,"options":{"placeholder":null},"required":true,"collection":"board_members","field":"fi_role"}	\N
449	568	directus_fields	115	{"interface":"input","special":null,"collection":"board_members","field":"en_role"}	{"interface":"input","special":null,"collection":"board_members","field":"en_role"}	\N
450	569	directus_fields	116	{"interface":"input-rich-text-md","special":null,"collection":"board_members","field":"fi_desc"}	{"interface":"input-rich-text-md","special":null,"collection":"board_members","field":"fi_desc"}	\N
451	570	directus_fields	117	{"interface":"input-multiline","special":null,"required":true,"collection":"board_members","field":"en_desc"}	{"interface":"input-multiline","special":null,"required":true,"collection":"board_members","field":"en_desc"}	\N
452	571	directus_fields	118	{"collection":"board_members","field":"fi_desc","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null}	{"collection":"board_members","field":"fi_desc","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null}	\N
453	572	directus_fields	119	{"collection":"board_members","field":"en_desc","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null}	{"collection":"board_members","field":"en_desc","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null}	\N
454	573	directus_fields	118	{"id":118,"collection":"board_members","field":"fi_desc","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"board_members","field":"fi_desc","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	\N
455	574	board_members	5	{"status":"published"}	{"status":"published"}	\N
456	575	board_members	6	{"name":"Essi Esimerkki","fi_role":"Tapahtumavastaava","en_role":"Event manager"}	{"name":"Essi Esimerkki","fi_role":"Tapahtumavastaava","en_role":"Event manager"}	\N
457	576	board_members	6	{"id":6,"status":"published","user_created":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_created":"2023-05-02T13:45:48.364Z","user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-05-02T13:45:54.987Z","name":"Essi Esimerkki","email":"matti.meikalainen","telegram":"mattimeikalainen","hover_img":"/images/placeholder-square.jpg","img":"/images/placeholder-square.jpg","fi_role":"Tapahtumavastaava","en_role":"Event manager","fi_desc":"Hallituksen jäsen toimii hallituksessa","en_desc":"A member of the board serves on the board :)"}	{"status":"published","user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-05-02T13:45:54.987Z"}	\N
458	577	board_members	7	{"status":"published","name":"Erkki Esimerkki","email":"erkki.merkki","telegram":"erkkimerkki","fi_role":"Puheenjohtaja","en_role":"Chariman"}	{"status":"published","name":"Erkki Esimerkki","email":"erkki.merkki","telegram":"erkkimerkki","fi_role":"Puheenjohtaja","en_role":"Chariman"}	\N
459	578	for_new_student	1	{"id":1,"user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-05-02T13:51:04.710Z","fi_text":"# Uudelle opiskelijalle\\n\\nTietojenkäsittelytieteen uudet opiskelijat aloittavat syksyllä pitkän ja kivikkoisen, mutta niin kovin antoisan tiensä kohti luonnontieteen kandidaatin ja filosofian maisterin titteleitä.\\nFuksin muistilista\\n\\n- Muista maksaa jäsenmaksut Itä-Suomen yliopiston ylioppilaskunnalle (ISYY) 31.8 mennessä\\n- YTHS maksu on myös pakollinen ja se maksetaan erikseen Kelalle, kannattaa se kurkistella kuntoon\\n- Kannattaa lukea Tietojenkäsittelytieteen laitoksen Smart Start -opas ja kamusta ohjeet uudelle opiskelijalle\\n- Liity Serverin jäseneksi.\\n- Liity Serverin tiedotuskanavalle: https://t.me/serveriry\\n- Tsekkaa syksyn tuutorit täältä\\n- Hanki opiskelijakortti\\n\\n## Opiskelijakortti\\n\\nFyysinen kortti\\nOpiskelijakortilla todistat opiskelijastatuksesi, jotta voit saada opiskelija-alennuksia. Fyysisiä opiskelijakortteja hankitaan kirjoittamishetkellä (kevät 2021) Frankin kautta ja maksaa 25€. Fyysisellä ja sähköisillä korteilla ei ole muuta eroa kuin myöntäjä ja mahdollisesti joitain eroja alennuksissa. Tenttitilaisuuksissa kelpaa sähköinen kortti tai muu henkilöllisyystodistus.\\n\\n### Sähköisiä vaihtoehtoja\\n\\nKaikki vaihtoehdot kirjoittamishetkellä (kevät 2021) ilmaisia\\n\\n- [Frank](https://www.frank.fi/opiskelijakortti/)\\n- [Tuudo](https://www.tuudo.fi/)\\n- [Pivo](https://pivo.fi/palvelut/pivo-student-card/)\\n\\n### Kansainväliset kortit\\nKansainväliset kortit hankitaan [Frankin](https://www.frank.fi/opiskelijakortti/) kautta. Saatavilla sekä fyysinen että sähköinen versio. \\n\\n## Hyvä tietää\\n\\n- Serveri tiedottaa tapahtumistaan ensisijaisesti Telegramissa, mutta myös kotisivuilla ja postilistalla. Uudet jäsenet lisätään postilistalle, kun hallitus on hyväksynyt heidät jäseniksi jäsenmaksun maksamisen jälkeen.\\n- Serverimeininkiä löytyy edellä mainittujen alustojen lisäksi myös Facebookista ja Instagramista\\n\\n## Mahdollisesti hyödyllistä sisältöä\\n\\n- [Sykettä](https://sykettä.fi/kuopio/) eli korkeakoulujen liikuntapalvelut, jos liikunnan harrastaminen kiinnostaa. Ensimmäisillä opiskeluviikoilla palveluita pääsee usein kokeilemaan ilmaiseksi\\n- [ISYY](https://www.isyy.fi/palvelut/uudelle-opiskelijalle.html)n sivut uudelle opiskelijalle","en_text":"# For a new student\\n\\nThis autumn, new students in Computer Science will begin the long and rocky, but so very rewarding journey towards their Bachelor of Science and Master of Philosophy degrees.\\nFreshman checklist\\n\\n- Remember to pay your membership fees to the Student Union of the University of Eastern Finland (ISYY) by 31 August\\n- The YTHS fee is also compulsory and is paid separately to Kela, it's worth checking it out\\n- You should read the Smart Start guide of the Department of Computer Science and the instructions for new students\\n- Join the Server.\\n- Join the Server information channel: https://t.me/serveriry\\n- Check out the autumn tutors here\\n- Get your student card\\n\\n## Student card\\n\\nPhysical card\\nThe student card is used to prove your student status in order to qualify for student discounts. At the time of writing (spring 2021), physical student cards will be purchased through Frank and cost €25. There is no difference between physical and electronic cards other than the issuer and possibly some differences in discounts. For exams, an electronic card or other form of ID will be accepted.\\n\\n### Electronic options\\n\\nAll options free at the time of writing (spring 2021)\\n\\n- [Frank](https://www.frank.fi/opiskelijakortti/)\\n- [Tuudo](https://www.tuudo.fi/)\\n- [Pivo](https://pivo.fi/palvelut/pivo-student-card/)\\n\\n### International cards\\nInternational cards are purchased through [Frank](https://www.frank.fi/opiskelijakortti/). Both physical and electronic versions are available.\\n\\n## Good to know\\n\\n- The server informs about its events primarily on Telegram, but also on its website and mailing list. New members are added to the mailing list after being accepted as members by the board of directors after payment of the membership fee.\\n- In addition to the platforms mentioned above, Serverimeinink can also be found on Facebook and Instagram\\n\\n## Potentially useful content\\n\\n- [Sykettä](https://sykettä.fi/kuopio/), the sports services of universities, if you are interested in sports. You can often try out the services for free during the first weeks of your studies\\n- [ISYY](https://www.isyy.fi/palvelut/uudelle-opiskelijalle.html) website for new students"}	{"fi_text":"# Uudelle opiskelijalle\\n\\nTietojenkäsittelytieteen uudet opiskelijat aloittavat syksyllä pitkän ja kivikkoisen, mutta niin kovin antoisan tiensä kohti luonnontieteen kandidaatin ja filosofian maisterin titteleitä.\\nFuksin muistilista\\n\\n- Muista maksaa jäsenmaksut Itä-Suomen yliopiston ylioppilaskunnalle (ISYY) 31.8 mennessä\\n- YTHS maksu on myös pakollinen ja se maksetaan erikseen Kelalle, kannattaa se kurkistella kuntoon\\n- Kannattaa lukea Tietojenkäsittelytieteen laitoksen Smart Start -opas ja kamusta ohjeet uudelle opiskelijalle\\n- Liity Serverin jäseneksi.\\n- Liity Serverin tiedotuskanavalle: https://t.me/serveriry\\n- Tsekkaa syksyn tuutorit täältä\\n- Hanki opiskelijakortti\\n\\n## Opiskelijakortti\\n\\nFyysinen kortti\\nOpiskelijakortilla todistat opiskelijastatuksesi, jotta voit saada opiskelija-alennuksia. Fyysisiä opiskelijakortteja hankitaan kirjoittamishetkellä (kevät 2021) Frankin kautta ja maksaa 25€. Fyysisellä ja sähköisillä korteilla ei ole muuta eroa kuin myöntäjä ja mahdollisesti joitain eroja alennuksissa. Tenttitilaisuuksissa kelpaa sähköinen kortti tai muu henkilöllisyystodistus.\\n\\n### Sähköisiä vaihtoehtoja\\n\\nKaikki vaihtoehdot kirjoittamishetkellä (kevät 2021) ilmaisia\\n\\n- [Frank](https://www.frank.fi/opiskelijakortti/)\\n- [Tuudo](https://www.tuudo.fi/)\\n- [Pivo](https://pivo.fi/palvelut/pivo-student-card/)\\n\\n### Kansainväliset kortit\\nKansainväliset kortit hankitaan [Frankin](https://www.frank.fi/opiskelijakortti/) kautta. Saatavilla sekä fyysinen että sähköinen versio. \\n\\n## Hyvä tietää\\n\\n- Serveri tiedottaa tapahtumistaan ensisijaisesti Telegramissa, mutta myös kotisivuilla ja postilistalla. Uudet jäsenet lisätään postilistalle, kun hallitus on hyväksynyt heidät jäseniksi jäsenmaksun maksamisen jälkeen.\\n- Serverimeininkiä löytyy edellä mainittujen alustojen lisäksi myös Facebookista ja Instagramista\\n\\n## Mahdollisesti hyödyllistä sisältöä\\n\\n- [Sykettä](https://sykettä.fi/kuopio/) eli korkeakoulujen liikuntapalvelut, jos liikunnan harrastaminen kiinnostaa. Ensimmäisillä opiskeluviikoilla palveluita pääsee usein kokeilemaan ilmaiseksi\\n- [ISYY](https://www.isyy.fi/palvelut/uudelle-opiskelijalle.html)n sivut uudelle opiskelijalle","en_text":"# For a new student\\n\\nThis autumn, new students in Computer Science will begin the long and rocky, but so very rewarding journey towards their Bachelor of Science and Master of Philosophy degrees.\\nFreshman checklist\\n\\n- Remember to pay your membership fees to the Student Union of the University of Eastern Finland (ISYY) by 31 August\\n- The YTHS fee is also compulsory and is paid separately to Kela, it's worth checking it out\\n- You should read the Smart Start guide of the Department of Computer Science and the instructions for new students\\n- Join the Server.\\n- Join the Server information channel: https://t.me/serveriry\\n- Check out the autumn tutors here\\n- Get your student card\\n\\n## Student card\\n\\nPhysical card\\nThe student card is used to prove your student status in order to qualify for student discounts. At the time of writing (spring 2021), physical student cards will be purchased through Frank and cost €25. There is no difference between physical and electronic cards other than the issuer and possibly some differences in discounts. For exams, an electronic card or other form of ID will be accepted.\\n\\n### Electronic options\\n\\nAll options free at the time of writing (spring 2021)\\n\\n- [Frank](https://www.frank.fi/opiskelijakortti/)\\n- [Tuudo](https://www.tuudo.fi/)\\n- [Pivo](https://pivo.fi/palvelut/pivo-student-card/)\\n\\n### International cards\\nInternational cards are purchased through [Frank](https://www.frank.fi/opiskelijakortti/). Both physical and electronic versions are available.\\n\\n## Good to know\\n\\n- The server informs about its events primarily on Telegram, but also on its website and mailing list. New members are added to the mailing list after being accepted as members by the board of directors after payment of the membership fee.\\n- In addition to the platforms mentioned above, Serverimeinink can also be found on Facebook and Instagram\\n\\n## Potentially useful content\\n\\n- [Sykettä](https://sykettä.fi/kuopio/), the sports services of universities, if you are interested in sports. You can often try out the services for free during the first weeks of your studies\\n- [ISYY](https://www.isyy.fi/palvelut/uudelle-opiskelijalle.html) website for new students","user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-05-02T13:51:04.710Z"}	\N
460	579	for_new_student	1	{"id":1,"user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-05-02T13:52:09.115Z","fi_text":"# Uudelle opiskelijalle\\n\\nTietojenkäsittelytieteen uudet opiskelijat aloittavat syksyllä pitkän ja kivikkoisen, mutta niin kovin antoisan tiensä kohti luonnontieteen kandidaatin ja filosofian maisterin titteleitä.\\nFuksin muistilista\\n\\n- Muista maksaa jäsenmaksut Itä-Suomen yliopiston ylioppilaskunnalle (ISYY) 31.8 mennessä\\n- YTHS maksu on myös pakollinen ja se maksetaan erikseen Kelalle, kannattaa se kurkistella kuntoon\\n- Kannattaa lukea Tietojenkäsittelytieteen laitoksen Smart Start -opas ja kamusta ohjeet uudelle opiskelijalle\\n- Liity Serverin jäseneksi.\\n- Liity Serverin tiedotuskanavalle: https://t.me/serveriry\\n- Tsekkaa syksyn tuutorit täältä\\n- Hanki opiskelijakortti\\n\\n## Opiskelijakortti\\n\\nFyysinen kortti\\nOpiskelijakortilla todistat opiskelijastatuksesi, jotta voit saada opiskelija-alennuksia. Fyysisiä opiskelijakortteja hankitaan kirjoittamishetkellä (kevät 2021) Frankin kautta ja maksaa 25€. Fyysisellä ja sähköisillä korteilla ei ole muuta eroa kuin myöntäjä ja mahdollisesti joitain eroja alennuksissa. Tenttitilaisuuksissa kelpaa sähköinen kortti tai muu henkilöllisyystodistus.\\n\\n### Sähköisiä vaihtoehtoja\\n\\nKaikki vaihtoehdot kirjoittamishetkellä (kevät 2021) ilmaisia\\n\\n- [Frank](https://www.frank.fi/opiskelijakortti/)\\n- [Tuudo](https://www.tuudo.fi/)\\n- [Pivo](https://pivo.fi/palvelut/pivo-student-card/)\\n\\n### Kansainväliset kortit\\nKansainväliset kortit hankitaan [Frankin](https://www.frank.fi/opiskelijakortti/) kautta. Saatavilla sekä fyysinen että sähköinen versio. \\n\\n## Hyvä tietää\\n\\n- Serveri tiedottaa tapahtumistaan ensisijaisesti Telegramissa, mutta myös kotisivuilla ja postilistalla. Uudet jäsenet lisätään postilistalle, kun hallitus on hyväksynyt heidät jäseniksi jäsenmaksun maksamisen jälkeen.\\n- Serverimeininkiä löytyy edellä mainittujen alustojen lisäksi myös Facebookista ja Instagramista\\n\\n## Mahdollisesti hyödyllistä sisältöä\\n\\n- [Sykettä](https://sykettä.fi/kuopio/) eli korkeakoulujen liikuntapalvelut, jos liikunnan harrastaminen kiinnostaa. Ensimmäisillä opiskeluviikoilla palveluita pääsee usein kokeilemaan ilmaiseksi\\n- [ISYY](https://www.isyy.fi/palvelut/uudelle-opiskelijalle.html)n sivut uudelle opiskelijalle","en_text":"# For a new student\\n\\nThis autumn, new students in Computer Science will begin the long and rocky, but so very rewarding journey towards their Bachelor of Science and Master of Philosophy degrees.\\nFreshman checklist\\n\\n- Remember to pay your membership fees to the Student Union of the University of Eastern Finland (ISYY) by 31 August\\n- The YTHS fee is also compulsory and is paid separately to Kela, it's worth checking it out\\n- You should read the Smart Start guide of the Department of Computer Science and the instructions for new students\\n- Join the Server.\\n- Join the Server information channel: https://t.me/serveriry\\n- Check out the autumn tutors here\\n- Get your student card\\n\\n## Student card\\n\\nPhysical card\\nThe student card is used to prove your student status in order to qualify for student discounts. At the time of writing (spring 2021), physical student cards will be purchased through Frank and cost €25. There is no difference between physical and electronic cards other than the issuer and possibly some differences in discounts. For exams, an electronic card or other form of ID will be accepted.\\n\\n### Electronic options\\n\\nAll options free at the time of writing (spring 2021)\\n\\n- [Frank](https://www.frank.fi/opiskelijakortti/)\\n- [Tuudo](https://www.tuudo.fi/)\\n- [Pivo](https://pivo.fi/palvelut/pivo-student-card/)\\n\\n### International cards\\nInternational cards are purchased through [Frank](https://www.frank.fi/opiskelijakortti/). Both physical and electronic versions are available.\\n\\n## Good to know\\n\\n- The server informs about its events primarily on Telegram, but also on its website and mailing list. New members are added to the mailing list after being accepted as members by the board of directors after payment of the membership fee.\\n- In addition to the platforms mentioned above, Serverimeinink can also be found on Facebook and Instagram\\n\\n## Potentially useful content\\n\\n- [Sykettä](https://sykettä.fi/kuopio/), the sports services of universities, if you are interested in sports. You can often try out the services for free during the first weeks of your studies\\n- [ISYY](https://www.isyy.fi/en/international-students.html) website for new students"}	{"en_text":"# For a new student\\n\\nThis autumn, new students in Computer Science will begin the long and rocky, but so very rewarding journey towards their Bachelor of Science and Master of Philosophy degrees.\\nFreshman checklist\\n\\n- Remember to pay your membership fees to the Student Union of the University of Eastern Finland (ISYY) by 31 August\\n- The YTHS fee is also compulsory and is paid separately to Kela, it's worth checking it out\\n- You should read the Smart Start guide of the Department of Computer Science and the instructions for new students\\n- Join the Server.\\n- Join the Server information channel: https://t.me/serveriry\\n- Check out the autumn tutors here\\n- Get your student card\\n\\n## Student card\\n\\nPhysical card\\nThe student card is used to prove your student status in order to qualify for student discounts. At the time of writing (spring 2021), physical student cards will be purchased through Frank and cost €25. There is no difference between physical and electronic cards other than the issuer and possibly some differences in discounts. For exams, an electronic card or other form of ID will be accepted.\\n\\n### Electronic options\\n\\nAll options free at the time of writing (spring 2021)\\n\\n- [Frank](https://www.frank.fi/opiskelijakortti/)\\n- [Tuudo](https://www.tuudo.fi/)\\n- [Pivo](https://pivo.fi/palvelut/pivo-student-card/)\\n\\n### International cards\\nInternational cards are purchased through [Frank](https://www.frank.fi/opiskelijakortti/). Both physical and electronic versions are available.\\n\\n## Good to know\\n\\n- The server informs about its events primarily on Telegram, but also on its website and mailing list. New members are added to the mailing list after being accepted as members by the board of directors after payment of the membership fee.\\n- In addition to the platforms mentioned above, Serverimeinink can also be found on Facebook and Instagram\\n\\n## Potentially useful content\\n\\n- [Sykettä](https://sykettä.fi/kuopio/), the sports services of universities, if you are interested in sports. You can often try out the services for free during the first weeks of your studies\\n- [ISYY](https://www.isyy.fi/en/international-students.html) website for new students","user_updated":"0891a0cd-876b-4a0d-a22e-0cce30121382","date_updated":"2023-05-02T13:52:09.115Z"}	\N
461	580	directus_collections	gdpr	{"collection":"gdpr","icon":"policy","note":null,"display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":null,"group":null,"collapse":"open"}	{"icon":"policy"}	\N
462	581	directus_collections	hallitus_page	{"collection":"hallitus_page","icon":"contact_page","note":null,"display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":null,"group":null,"collapse":"open"}	{"icon":"contact_page"}	\N
463	582	directus_collections	news	{"collection":"news","icon":"newspaper","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":null,"group":null,"collapse":"open"}	{"icon":"newspaper"}	\N
464	583	directus_collections	partners	{"collection":"partners","icon":"attach_money","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":null,"group":null,"collapse":"open"}	{"icon":"attach_money"}	\N
465	584	directus_collections	social_medias	{"collection":"social_medias","icon":"auto_awesome","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":null,"group":null,"collapse":"open"}	{"icon":"auto_awesome"}	\N
466	585	directus_collections	lomake_vastaukset	{"collection":"lomake_vastaukset","icon":"drive_folder_upload","note":"Sisältää kaikki verkkosivun lomakkeiden vastaukset.","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":null,"group":null,"collapse":"open"}	{"icon":"drive_folder_upload"}	\N
467	586	directus_collections	liity_serveriin	{"collection":"liity_serveriin","icon":"line_end_arrow","note":null,"display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":null,"group":null,"collapse":"open"}	{"icon":"line_end_arrow"}	\N
468	587	directus_collections	turvallinen_tila	{"collection":"turvallinen_tila","icon":"balance","note":null,"display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":null,"group":null,"collapse":"open"}	{"icon":"balance"}	\N
469	588	directus_collections	LandingPage	{"collection":"LandingPage","icon":"web","note":null,"display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":null,"group":null,"collapse":"open"}	{"icon":"web"}	\N
470	589	directus_collections	for_new_student	{"collection":"for_new_student","icon":"fiber_new","note":null,"display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":null,"group":null,"collapse":"open"}	{"icon":"fiber_new"}	\N
471	590	directus_collections	serveri_rules	{"collection":"serveri_rules","icon":"balance","note":null,"display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":null,"group":null,"collapse":"open"}	{"icon":"balance"}	\N
472	591	directus_collections	social_medias	{"collection":"social_medias","icon":"auto_awesome_mosaic","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":null,"group":null,"collapse":"open"}	{"icon":"auto_awesome_mosaic"}	\N
473	592	directus_collections	study_club	{"collection":"study_club","icon":"menu_book","note":null,"display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":null,"group":null,"collapse":"open"}	{"icon":"menu_book"}	\N
474	593	directus_collections	liity_serveriin	{"collection":"liity_serveriin","icon":"subdirectory_arrow_right","note":null,"display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":null,"group":null,"collapse":"open"}	{"icon":"subdirectory_arrow_right"}	\N
475	594	directus_fields	120	{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"events"}	{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"events"}	\N
476	595	directus_fields	121	{"width":"full","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]},"field":"status","collection":"events"}	{"width":"full","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]},"field":"status","collection":"events"}	\N
478	597	directus_fields	123	{"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"events"}	{"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"events"}	\N
479	598	directus_fields	124	{"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"events"}	{"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"events"}	\N
480	599	directus_fields	125	{"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"events"}	{"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"events"}	\N
481	600	directus_fields	126	{"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"events"}	{"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"events"}	\N
482	601	directus_collections	events	{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"events"}	{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"events"}	\N
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
gwwvrfo2Zj5dxPjVi891OZjXX-A-kMARoiBk8NsfDen1zzFvzLQnzMSKyl8Yaqjt	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-06 20:15:45.698+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	\N	http://10.143.20.7:8081
p9GrZu96161jO-rGhi_iYMTxDhlRDzk2awUIQVbQ806yYFBOXrNrsAQsAS2U2vQd	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-06 20:32:04.979+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	\N	http://127.0.0.1:8081
DzQC0N7BhOhQav01s3XGfuyy0atI13_FaqJVawsrKyLQPmvcPjX3vGjx_IOiEzw3	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-06 17:53:10.026+00	10.0.2.2	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/112.0	\N	http://10.143.20.7:8081
ddKudaMplwgkJz4wdb4ag7OPM2Fjfeh_LO3Qeym5T7Jx6rJVwiPmPlvCz2X1jnvA	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-09 14:26:47.196+00	10.0.2.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0	\N	http://127.0.0.1:8081
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
0891a0cd-876b-4a0d-a22e-0cce30121382	Admin	User	dev@serveriry.fi	$argon2id$v=19$m=65536,t=3,p=4$hVskI8M5iDcSrNlBjYgpqQ$VOD9EUHOMkKmWrElydlVl/7ysElrGr+dZcdOU34Ugm0	\N	\N	\N	\N	\N	\N	auto	\N	active	7bd45b9d-d719-4ab1-b7ec-2c68f2eefc76	Of2wfHYZ3N-yP0IoKDuR-REqH1-0eZCV	2023-05-02 14:26:47.198+00	/content/for_new_student	default	\N	\N	t
\.


--
-- Data for Name: directus_webhooks; Type: TABLE DATA; Schema: public; Owner: serveri
--

COPY public.directus_webhooks (id, name, method, url, status, data, actions, collections, headers) FROM stdin;
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: serveri
--

COPY public.events (id, status, sort, user_created, date_created, user_updated, date_updated) FROM stdin;
\.


--
-- Data for Name: for_new_student; Type: TABLE DATA; Schema: public; Owner: serveri
--

COPY public.for_new_student (id, user_updated, date_updated, fi_text, en_text) FROM stdin;
1	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 13:52:09.115+00	# Uudelle opiskelijalle\n\nTietojenkäsittelytieteen uudet opiskelijat aloittavat syksyllä pitkän ja kivikkoisen, mutta niin kovin antoisan tiensä kohti luonnontieteen kandidaatin ja filosofian maisterin titteleitä.\nFuksin muistilista\n\n- Muista maksaa jäsenmaksut Itä-Suomen yliopiston ylioppilaskunnalle (ISYY) 31.8 mennessä\n- YTHS maksu on myös pakollinen ja se maksetaan erikseen Kelalle, kannattaa se kurkistella kuntoon\n- Kannattaa lukea Tietojenkäsittelytieteen laitoksen Smart Start -opas ja kamusta ohjeet uudelle opiskelijalle\n- Liity Serverin jäseneksi.\n- Liity Serverin tiedotuskanavalle: https://t.me/serveriry\n- Tsekkaa syksyn tuutorit täältä\n- Hanki opiskelijakortti\n\n## Opiskelijakortti\n\nFyysinen kortti\nOpiskelijakortilla todistat opiskelijastatuksesi, jotta voit saada opiskelija-alennuksia. Fyysisiä opiskelijakortteja hankitaan kirjoittamishetkellä (kevät 2021) Frankin kautta ja maksaa 25€. Fyysisellä ja sähköisillä korteilla ei ole muuta eroa kuin myöntäjä ja mahdollisesti joitain eroja alennuksissa. Tenttitilaisuuksissa kelpaa sähköinen kortti tai muu henkilöllisyystodistus.\n\n### Sähköisiä vaihtoehtoja\n\nKaikki vaihtoehdot kirjoittamishetkellä (kevät 2021) ilmaisia\n\n- [Frank](https://www.frank.fi/opiskelijakortti/)\n- [Tuudo](https://www.tuudo.fi/)\n- [Pivo](https://pivo.fi/palvelut/pivo-student-card/)\n\n### Kansainväliset kortit\nKansainväliset kortit hankitaan [Frankin](https://www.frank.fi/opiskelijakortti/) kautta. Saatavilla sekä fyysinen että sähköinen versio. \n\n## Hyvä tietää\n\n- Serveri tiedottaa tapahtumistaan ensisijaisesti Telegramissa, mutta myös kotisivuilla ja postilistalla. Uudet jäsenet lisätään postilistalle, kun hallitus on hyväksynyt heidät jäseniksi jäsenmaksun maksamisen jälkeen.\n- Serverimeininkiä löytyy edellä mainittujen alustojen lisäksi myös Facebookista ja Instagramista\n\n## Mahdollisesti hyödyllistä sisältöä\n\n- [Sykettä](https://sykettä.fi/kuopio/) eli korkeakoulujen liikuntapalvelut, jos liikunnan harrastaminen kiinnostaa. Ensimmäisillä opiskeluviikoilla palveluita pääsee usein kokeilemaan ilmaiseksi\n- [ISYY](https://www.isyy.fi/palvelut/uudelle-opiskelijalle.html)n sivut uudelle opiskelijalle	# For a new student\n\nThis autumn, new students in Computer Science will begin the long and rocky, but so very rewarding journey towards their Bachelor of Science and Master of Philosophy degrees.\nFreshman checklist\n\n- Remember to pay your membership fees to the Student Union of the University of Eastern Finland (ISYY) by 31 August\n- The YTHS fee is also compulsory and is paid separately to Kela, it's worth checking it out\n- You should read the Smart Start guide of the Department of Computer Science and the instructions for new students\n- Join the Server.\n- Join the Server information channel: https://t.me/serveriry\n- Check out the autumn tutors here\n- Get your student card\n\n## Student card\n\nPhysical card\nThe student card is used to prove your student status in order to qualify for student discounts. At the time of writing (spring 2021), physical student cards will be purchased through Frank and cost €25. There is no difference between physical and electronic cards other than the issuer and possibly some differences in discounts. For exams, an electronic card or other form of ID will be accepted.\n\n### Electronic options\n\nAll options free at the time of writing (spring 2021)\n\n- [Frank](https://www.frank.fi/opiskelijakortti/)\n- [Tuudo](https://www.tuudo.fi/)\n- [Pivo](https://pivo.fi/palvelut/pivo-student-card/)\n\n### International cards\nInternational cards are purchased through [Frank](https://www.frank.fi/opiskelijakortti/). Both physical and electronic versions are available.\n\n## Good to know\n\n- The server informs about its events primarily on Telegram, but also on its website and mailing list. New members are added to the mailing list after being accepted as members by the board of directors after payment of the membership fee.\n- In addition to the platforms mentioned above, Serverimeinink can also be found on Facebook and Instagram\n\n## Potentially useful content\n\n- [Sykettä](https://sykettä.fi/kuopio/), the sports services of universities, if you are interested in sports. You can often try out the services for free during the first weeks of your studies\n- [ISYY](https://www.isyy.fi/en/international-students.html) website for new students
\.


--
-- Data for Name: gdpr; Type: TABLE DATA; Schema: public; Owner: serveri
--

COPY public.gdpr (id, user_updated, date_updated, fi_text, en_text) FROM stdin;
1	\N	\N	# Rekisteri- ja tietosuojaseloste\n\n## Keitä olemme\n\nOlemme Itä-Suomen yliopiston tietojenkäsittelytieteen opiskelijoiden ainejärjestö eli Serveri ry.\n\nPostiosoitteemme löydät connect sivun alareumasta.\n\nLisätietoja järjestöstämme löydät osiosta järjestö. Jäsenrekisteristä vastaa ylläpitovastaava ja sihteeri.\n\n## Henkilötiedot\n\n### Jäsenrekisterin henkilötiedot\n\nMikäli liityt jäseneksi tallennamme jäsenrekisteriin käyttötarkoitusta varten luovuttamasi tiedot. (Emme ikinä tallenna maksukorttisi tietoja.) Jäsenrekisteriimme kuuluu sellaiset Itä-Suomen yliopiston Kuopion kampuksen opiskelijat jotka jäsenmaksun maksamalla ovat ilmaisseet halukkuutensa liittyä jäseneksi.\n\n\nJäsenrekisterin käyttöperusteena on Henkilön itsensä antama suostumus sekä yhdistyslain mukainen vaatimus ylläpitää jäsenrekisteriä. Tietoja käytetään toiminnasta viestimiseen eli lähinnä yhteydenpitoon esimerkiksi sähköpostilistan muodossa. Mahdollisista muutoksista tiedotetaan hallituksen kokouksissa.\n\n\nTietojen lähteenä on käyttäjän itse toimittama tieto.\n\n### Evästeet\n\nVain tekniset evästeet käytössä. Emme louhi dataa "sisällön parantamiseen". Jos havaitset teknisiä puutteita tai haluat esittää parannusta, ilmoita ylläpidolle tai hallitukselle.\n\n### Analytiikka\n\nTallennamme verkkosivustolla vierailuista lokitietoja joihin kuuluu IP osoitteet, kellonajat sekä muuta mahdollista palvelinpään analytiikkaa. Tietoja käytetään tietoturvan monitorointiin sekä mahdollisen haitallisen toiminnan estämiseen. Lokitietoja voidaan jakaa viranomaisille. Lokitietoja poistetaan vanhimmasta alkaen, siten että tallessa on viimeisimmän vuoden tapahtumat.\n\n## Kenen kanssa jaamme dataasi\n\nSähköpostilistamme taustajärjestelmää ylläpitää Itä-Suomen yliopisto. Jäsenrekisterin tietoja käsittelee hallitus. Emme luovuta tietojasi ulkopuolisille, ellei jokin seuraavista ehdoista täyty:\n\n-  Jos itse niin pyydät tai kysyessämme saamme tietojen luovutukseen luvan\n-  Jos teet oston sivustomme kautta joudumme välittämään maksutapahtuman käsittelyyn vaadittavat tiedot maksutietojen käsittelijälle Stripelle. Halutessasi voit sopia vaihtoehtoisista maksutavoista hallituksemme kanssa. Stripen tietosuojaselosteen löydät osoitteesta: https://stripe.com/en-fi/privacy\n-  Jos laki niin vaatii\n-  Keräämämme tietoa käytetään oikeudessa järjestön edun puolustamiseen.\n\n## Kuinka kauan säilytämme tietojasi\n\nSäilytämme lokitietoja tarpeen mukaan, maksimissaan kaksi vuotta, yleensä vuoden.\n\nEmme säilytä jäsenrekisterihistoriaa, eli vanhentuneet tiedot poistetaan muutospyynnön saapuessa ylläpitovastaavalle, sihteerille tai hallitukselle.\n\n## Oikeutesi tietojesi suhteen\n\nVoit pyytää tietojesi poistoa, päivitystä tai kopiota tiedoistasi ylläpitovastaavalta. Lähtökohtaisesti jäsenrekisterin tietoja säilytetään niin kauan kuin ne ovat ajantasaiset.\n\n## Miten tietosi suojataan\n\nKäytämme tietojesi suojaukseen tarpeellisia suojauskeinoja. Emme siirrä tietojasi Suomen rajojen ulkopuolelle. Kirjoitushetkellä suurin osa tallennetuista tiedoista sijaitsee kaupallisen palveluntarjoajan palvelimilla Tuusulassa.\nFyysisestä tietoturvasta vastaa palveluntarjoajamme. Palvelumme on suojattu automaattisilta hyökkäyksiltä siten että tietosuoja on etusijalla tiedon saavutettavuuteen nähden. Pyrimme käyttämään palvelinpäässä laajalti vertaisarvioitua, vapaata ohjelmistoa ja tarkistamaan suojausasetukset mielellään vähintään kahden henkilön toimesta turvalliseksi, joista toinen on ylläpitovastaava.\n\n## Muuta\n\nEmme käytä automaattista päätöksentekoa\n\nLisätietoa saat [ylläpitovastaavalta](https://t.me/vsavonen/)	# Register and Privacy Policy\n\n## Who we are\n\nWe are the Serveri ry, an association of students of computer science at the University of Eastern Finland.\n\nYou can find our postal address at the bottom of the connect page.\n\nFor more information about our organisation, please see the organisation section. The membership register is managed by a maintenance officer and a secretary.\n\n## Personal data\n\n### Personal data of the register of members\n\nIf you become a member, we will store the information you provide for the purpose of the membership register. (We will never store your payment card details.) Our membership register includes students at the Kuopio campus of the University of Eastern Finland who have expressed their willingness to become a member by paying the membership fee.\n\n\nThe membership register is based on the consent of the person himself/herself and the requirement to maintain a membership register in accordance with the Associations Act. The data is used to communicate activities, mainly for contact purposes, for example in the form of an e-mail list. Any changes will be communicated at board meetings.\n\n\nThe source of the data is the information provided by the user.\n\n### Cookies\n\nOnly technical cookies are used. We do not mine data to "improve content". If you find any technical deficiencies or would like to suggest an improvement, please inform the administrator or the board.\n\n### Analytics\n\nWe record log information about visits to the website including IP addresses, time of day and other possible server-side analytics. This information is used for security monitoring and to prevent potential malicious activity. Log information may be shared with authorities. Logs are deleted starting with the oldest, so that the most recent year's events are stored.\n\n## With whom we share your data\n\nThe backend system of our email list is maintained by the University of Eastern Finland. The data in the membership register is processed by the Board of Directors. We will not share your data with third parties unless one of the following conditions is met:\n\n- If you ask us to do so or if we obtain your permission to disclose your data when you ask us to do so.\n- If you make a purchase through our website we will need to pass the information required to process the transaction to the payment processor Stripe. If you wish, you can agree alternative payment methods with our Board of Directors. Stripe's Privacy Policy can be found at: https://stripe.com/en-fi/privacy\n- If required by law\n- The information we collect will be used in court to defend the interests of the organisation.\n\n## How long we keep your data\n\nWe keep log information as needed, up to a maximum of two years, usually one year.\n\nWe do not keep membership register history, i.e. outdated information is deleted when a request for change is received by the Maintenance Officer, Secretary or Board.\n\n## Your rights with regard to your data\n\nYou may request deletion, updating or copying of your data from the administrator. As a general rule, information in the membership register will be kept as long as it is up to date.\n\n## How your data is protected\n\nWe use the necessary security measures to protect your information. We will not transfer your data outside the borders of Finland. At the time of writing, most of the data stored is located on the servers of a commercial service provider in Tuusula.\nOur service provider is responsible for physical security. Our service is protected against automated attacks so that data protection takes priority over data accessibility. We strive to use widely peer-reviewed, free software at the server end and to check the security settings for security, preferably by at least two people, one of whom is the maintainer.\n\n## Other\n\nWe do not use automated decision making\n\nFor more information, please contact [the maintainer](https://t.me/vsavonen/)
\.


--
-- Data for Name: hallitus_page; Type: TABLE DATA; Schema: public; Owner: serveri
--

COPY public.hallitus_page (id, user_updated, date_updated, fi_text, en_text) FROM stdin;
1	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-05-02 09:40:36.118+00	# Hallitus\n\nServerin hallitus vastaa ainejärjestötoiminnan käytännön asioiden hoidosta. Asioita tehdään yhdessä, mutta käytännön syistä tehtäviä on jaettu "hallitusrooleihin" jäsenten kiinnostuksen ja osaamisen mukaan. Mikäli haluat olla yhteydessä hallitukseen, tapahtuu se helpoiten sähköpostitse hallitus[ät]serveriry.fi tai Serverin jäsenenä löydät kaikki hallituslaiset myös Oppositiosta.\n\nServerin hallituksen jäsenet vaihtuvat vuosittain ja heidät valitaan kaikille jäsenille avoimessa syyskokouksessa. Ainejärjestötoiminnan sisältö mukautuu aikaan, mutta hallituksen varsinaiset tehtävät muuttuvat harvemmin ja hitaammin. Mikäli ainejärjestötoiminta kiinnostaa, kannattaa harkita hallitustoimintaan mukaan lähtemistä! Syyskokouksessa valitut jäsenet järjestäytyvät hallituskautensa alussa ja valitsevat keskuudestaan vastuuhenkilöt eri osaalueiden hoitamiseen. Vastuuhenkilöiden titteleistä saa jo hyvän kuvan siitä, minkälaista hallitustoiminta on.\n\nServerin hallituksen koko määräytyy syyskokouksessa ja tällä kaudella se koostuu 15:sta varsinaisesta ja 5:stä varajäsenestä. Hallituslaisiin ja heidän rooleihinsa voit tutustua alta, josta löydät myös yhteystiedot. Roolikohtaisten sähköpostiosotteiden lisäksi jokaisella hallituksen varsinaisella- ja varajäsenellä on henkilökohtainen sähköpostiosoite muodossa etunimi.sukunimi[ät]serveriry.fi.\n\n## Serverin Oppositio\n\nKiinnostaako ainejärjestötoiminta? Serverin Oppositio on ryhmä Telegramissa, jossa pääsee seuraamaan ainejärjestötoimintaa hieman lähempää. Ryhmään liittyminen ei sido mihinkään ja voit liittyä/poistua täysin vapaasti. Tervetuloa mukaan! [Liittymislinkki](https://t.me/) TG-ryhmään. 	# Board activities\n\nThe server's board is responsible for the practical management of the association's activities. Things are done collectively, but for practical reasons, tasks are divided into "board roles" according to members' interests and skills. If you want to get in touch with the board, the easiest way is to email hallitus[ät]serveriry.fi or, as a Server member, you can also find all board members in the Opposition.\n\nServer's board members rotate annually and are elected at an autumn meeting open to all members. The content of the Board's activities adapts over time, but the actual tasks of the Board change less frequently and more slowly. If you are interested, you should consider joining the board! The members elected at the autumn meeting organise themselves at the beginning of their term of office and choose from among themselves the persons responsible for the various areas of activity. The titles of these people give you a good idea of what government is like.\n\nThe size of the Server Board is decided at the autumn meeting and this term it consists of 15 full members and 5 alternates. You can find out more about the board members and their roles below, where you can also find their contact details. In addition to the role-specific email addresses, each member and alternate member of the Board has a personal email address in the form of firstname.lastname[at]serveriry.fi.\n\n## Serveriry Opposition\n\nAre you interested in student union activities? Server's Opposition is a group on Telegram where you can follow the activities of the student union a little closer. Joining the group is not binding and you are free to join/leave. Welcome to join! [Join](https://t.me/) TG group. 
\.


--
-- Data for Name: liity_serveriin; Type: TABLE DATA; Schema: public; Owner: serveri
--

COPY public.liity_serveriin (id, user_updated, date_updated, fi_text, en_text) FROM stdin;
1	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 20:15:32.51+00	# Liity jäseneksi\n\nAktiivisen kampusalueella tapahtuvan toiminnan lisäksi Serveri neuvottelee etuja jäsenilleen. Jäsenedut ovat suoraan käytettävissä jäsenmaksun maksaneena, jäsenyys tarkistetaan aina suoraan jäsenrekisteristä.\n\n## Jäsenedut\n\n- Haalarit jäsenhintaan\n\t- Hinta vaihtelee vuosittain sponsoreiden anteliaisuuden mukaan, mutta voit olla varma että jäsenenä saat merkittävän alennuksen.\n- Ainejärjestön reissut ja excursiot reilulla alennuksella\n- Osallistuminen Serverin sitseille myöskin jäsenhintaan\n- Pääset Serverin sähköpostilistalle\n- Oikeus lähteä mukaan hallitustoimintaan\n\n\n## Jäseneksi liittyminen\n\nServerin jäseneksi voit liittyä maksamalla ~~kertamaksun~~ 25 euroa Serverin tilille (Nordea FI87 1078 3000 2205 16) Jos olet saanut jäsenmaksullesi maksuviitteen, käytä sitä. Muuten laita maksun viestikenttään nimesi.\n\nTämän jälkeen lähetä nimesi ja jäsenrekisteriin kirjattava sähköpostiosoitteesi osoitteeseen hallitus at serveriry.fi Tietosuojaselosteen löydät osoitteesta https://www.serveriry.fi/tietosuojaseloste/ Tämän jälkeen hallitus hyväksyy uudet jäsenet kuukausittaisessa kokouksessa. Hyväksytyille jäsenille ilmoitetaan sähköpostitse.	# Join serveri ry\n\nIn addition to active campus activities, the Server negotiates benefits for its members. Member benefits are directly available upon payment of the membership fee, membership is always checked directly in the membership register.\n\n## Member benefits\n\n- Overalls at member prices\n\t- The price varies from year to year depending on the generosity of sponsors, but you can be sure that as a member you will receive a significant discount.\n- Association trips and excursions at a fair discount\n- Attendance at Server's meetings also at a member price\n- Get on the Server email list\n- The right to get involved in board activities\n\n\n## Become a member\n\nYou can become a member of the Server by paying a ~~one-time fee~~ € 25 to the Server's account (Nordea FI87 1078 3000 2205 16) If you have received a payment reference for your membership fee, please use it. Otherwise, please put your name in the message field of the payment.\n\nThen send your name and your email address to be entered in the membership register to hallitus at serveriry.fi You can find the privacy policy at https://www.serveriry.fi/tietosuojaseloste/ The board will then approve new members at the monthly meeting. Approved members will be notified by email.
\.


--
-- Data for Name: lomake_vastaukset; Type: TABLE DATA; Schema: public; Owner: serveri
--

COPY public.lomake_vastaukset (id, firm_name, firm_contact, firm_message) FROM stdin;
102	Efecte	asdasd@gmail.com	asdasdasd
103	Moro	matti.meikalainen@gmail.com	Moro
104	MOro	matti.meikalainen@gmail.com	Moro
105	yritys	nimi@email.co	moro mite menee
106	yritys	nimi@email.co	moro mite menee
107	yritys	nimi@email.co	moro mite menee
108	yritys	nimi@email.co	moro mite menee
109	yritys	nimi@email.co	moro mite menee
110	Footer on mobile	nimi@email.co	moro... 1
111	Footer on mobile	nimi@email.co	moro... 1
112	\N	\N	\N
113	fuksipassi	dawd	dawdaw
114	\N	\N	\N
115	\N	\N	\N
116	\N	\N	\N
117	klada vappen	klada@vappen.fi	Tehdäänkö yhteistyötä
118	\N	\N	\N
119	\N	\N	\N
120	\N	\N	\N
121	\N	\N	\N
122	1	1	1
123	\N	\N	\N
124	\N	\N	\N
\.


--
-- Data for Name: news; Type: TABLE DATA; Schema: public; Owner: serveri
--

COPY public.news (id, status, sort, user_created, date_created, user_updated, date_updated, fi_title, en_title, image, fi_text, en_text) FROM stdin;
1	published	\N	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 13:58:50.555+00	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 15:57:07.36+00	Muista YTHS maksu	Remember YTHS payment	https://cdn.discordapp.com/attachments/492188265487532032/1101870335789383720/THmaksubanneri-1080x675.png	Korkeakouluopiskelijoiden opiskeluterveydenhuollosta annetun lain mukaiset opiskeluterveydenhuollon maksujen määrät vuodelle 2023 on vahvistettu.\n\nKorkeakouluopiskelijoiden opiskeluterveydenhuollon opiskelijakohtainen terveydenhoitomaksu on 73,60 euroa, eli 36,80 euroa lukukautta kohden vuonna 2023. Opiskelijan tulee maksaa terveydenhoitomaksu Kelalle oma-aloitteisesti sekä kevät- että syyslukukaudelta.\n\nTerveydenhoitomaksu nousee kahdella eurolla edellisvuoteen verrattuna palvelujen saatavuuden parantamiseksi. Viivästymismaksu sekä käyttämättä jääneistä ajoista perittävä maksu säilyvät ennallaan. Kela perii viivästymismaksuna 5 euroa, jos opiskelija maksaa terveydenhoitomaksunsa myöhässä.\n\n[Maksa nyt](https://www.kela.fi/ajankohtaista-henkiloasiakkaat/4943918/korkeakouluopiskelijat-voivat-nyt-maksaa-vuoden-2023-terveydenhoitomaksun-kelalle) (kela.fi)	Students who are completing a degree and have registered as attending a traditional university or a university of applied sciences must pay a healthcare fee to Kela each term. The 2023 rate of the student healthcare fee is EUR 36.80 per term. Students can pay the fee starting now.\n\nIn 2023, the student healthcare fee in higher education is 36.80 euros per term. The fee for the whole calendar year, i.e. the spring and autumn term 2023, can be paid at the same time. Students are not billed for the fee but are expected to pay it on their own initiative.\n\nThe due date of payment is determined based on the date on which the student has registered as attending. For the spring term, the healthcare fee must be paid by 31 January at the latest, provided the student has registered as attending by then.\n\n[Pay now](https://www.kela.fi/news-archive/4943918/higher-education-students-can-pay-the-healthcare-fee-for-2023-to-kela-now) (kela.fi)
\.


--
-- Data for Name: partners; Type: TABLE DATA; Schema: public; Owner: serveri
--

COPY public.partners (id, status, user_created, date_created, user_updated, date_updated, name, url, img) FROM stdin;
3	published	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:24:26.504+00	\N	\N	Olvi	https://www.olvi.fi/	https://upload.wikimedia.org/wikipedia/fi/thumb/f/f9/Olvin_logo.svg/1200px-Olvin_logo.svg.png
4	published	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:24:44.026+00	\N	\N	Hurja	https://www.hurja.fi/	https://api.serveriry.fi/uploads/g9_1f987a430f.png
2	published	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:24:08.307+00	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:24:47.898+00	Innofactor	https://www.innofactor.com/	https://api.serveriry.fi/uploads/innofactor_365559a4a1.png
1	published	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:23:51.629+00	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:24:50.932+00	Efecte	https://www.efecte.com/	https://api.serveriry.fi/uploads/efecte_logo_eaa50a1bf4.png
5	published	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:25:06.429+00	\N	\N	Etteplan	https://www.etteplan.com/	https://cdn.discordapp.com/attachments/492188265487532032/1082006440102871131/logo.svg
6	published	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:25:29.399+00	\N	\N	UEF Avoin Yliopisto	https://api.serveriry.fi/uploads/uefjatkuva_5bbe818e67.png	https://www.uef.fi/sites/default/files/2022-02/Jatkuva_oppiminen_logo_yhdistelma_2.png
7	published	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:25:46.775+00	\N	\N	Calacucco	https://npg.fi/ravintolat/calacucco/	https://cdn.discordapp.com/attachments/492188265487532032/1084905505119535244/kalacucco-removebg-preview.png
8	published	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 18:26:02.8+00	\N	\N	Tek	https://www.tek.fi/	https://www.tek.fi/sites/default/files/attachments/TEK_logo_CMYK_sininen.png
\.


--
-- Data for Name: serveri_rules; Type: TABLE DATA; Schema: public; Owner: serveri
--

COPY public.serveri_rules (id, user_updated, date_updated, rules_fi, rules_en) FROM stdin;
1	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 12:05:34.771+00	# Serveri ry:n järjestyssäännöt\n\n## 1. NIMI JA KOTIPAIKKA\n\nYhdistyksen nimi on Itä-Suomen yliopiston tietojenkäsittelytieteen opiskelijat - Serveri ry. Yhdistyksen kotipaikka on\nKuopio.\n\n## 2. TARKOITUS JA TOIMINTA\n\nYhdistyksen tarkoituksena on yhdistää Itä-Suomen yliopiston tietojenkäsittelytieteen opiskelijoita ja tukea heidän\nhenkisiä sekä aineellisia pyrkimyksiään, niin ammattiin liittyvissä kuin vapaa-ajan kysymyksissä. Tarkoituksensa\ntoteuttamiseksi yhdistys valvoo jäsentensä etuja pitämällä yhteyksiä muihin yhdistyksiin, yrityksiin ja yliopiston\nhallintoelimiin. Yhdistys järjestää erilaisia informaatio-, esitelmä-, luento-, ja keskustelutilaisuuksia sekä\nillanviettoja. Yhdistys pyrkii tukemaan jäsentensä alaan liittyviä opintoja ja opintomatkoja. Toimintansa tukemiseksi\nyhdistys voi myös vastaanottaa avustuksia, lahjoituksia ja testamentteja, panna toimeen asianomaisella luvalla\nrahankeräyksiä ja arpajaisia, hankkia, myydä ja omistaa toimintaansa varten tarpeellista irtainta että kiinteätä\nomaisuutta tai harjoittaa välittömästi yhdistyksen tarkoituksen toteuttamiseen liittyvää tai taloudellisesti\nvähäarvoisena pidettävää ansiotoimintaa.\n\n\n## 3 KIELI\n\nYhdistyksen kielenä on suomi. Pöytäkirjat laaditaan suomen kielellä.\n\n## 4 PUOLUEETTOMUUS\n\nYhdistys on puoluepoliittisesti sitoutumaton.\n\n## 5 JÄSENET\n\nJäseniä voivat olla:\n\n1. Varsinaiset jäsenet: Itä-Suomen yliopistossa kirjoilla olevat (läsnä- tai poissaolevana) tietojenkäsittelytiedettä\n   opiskelevat henkilöt.\n2. Kannatusjäsenet: Kannatusjäseniä voivat olla henkilöt tai oikeuskelpoiset yhteisöt, jotka ovat kiinnostuneita\n   yhdistyksen toiminnasta ja haluavat tukea sitä.\n3. Kunniajäsenet: Kunniajäseneksi voidaan kutsua henkilö, joka on erikoisesti tukenut yhdistyksen toimintaa. Ehdotuksen\n   kunniajäseneksi kutsumisesta voi tehdä kuka tahansa jäsenistä suullisesti tai kirjallisesti hallitukselle, joka\n   esittää ehdotuksen yhdistyksen kokoukselle tai suoraan yhdistyksen kokoukselle, jossa riittää yksinkertainen\n   enemmistö mahdollisessa äänestyksessä esityksen hyväksymiseksi. Kaikki valmistuneet jäsenet voidaan hallituksen\n   päätöksellä valita kunniajäseneksi.\n4. Yhteisöjäsenet: Yhteisöjäsen voi olla oikeuskelpoinen yhteisö, joka on kiinnostunut yhdistyksen toiminnasta ja haluaa\n   tukea sitä.\n\nVarsinaiset jäsenet, kannatusjäsenet ja yhteisöjäsenet hyväksyy hakemuksesta yhdistyksen hallitus. Jäsenyys astuu\nvoimaan hallituksen päätöksen jälkeen. Jäsenyydestä eroaminen tapahtuu ilmoittamalla siitä kirjallisesti hallitukselle\ntai sen puheenjohtajalle tai ilmoittamalla erosta yhdistyksen kokouksessa pöytäkirjaan merkittäväksi. Erottamisesta\njäsenmaksun maksamatta jättämisen vuoksi päättää hallitus.\n\n## 6 JÄSENEN VELVOLLISUUDET\n\nJäsenellä on velvollisuus ilmoittaa yhdistyslain määräämät tiedot yhdistyksen hallitukselle aina muutosten yhteydessä,\nkuitenkin vähintään viiden (5) vuoden välein.\n\n## 7 JÄSENMAKSUT\n\nVarsinaisten jäsenten ja kannatusjäsenten liittymismaksun ja vuotuisen jäsenmaksun suuruudesta erikseen kullekin\njäsenryhmälle päättää syyskokous. Yhteisöjäsenten jäsenmaksuista päättää yhdistyksen hallitus. Kunniapuheenjohtajat ja\nkunniajäsenet eivät suorita jäsenmaksuja.\n\n## 8 HALLITUS\n\nHallituksen muodostavat syyskokouksessa valitut puheenjohtaja ja vähintään seitsemän (7), enintään viisitoista (15)\nmuuta varsinaista jäsentä sekä vähintään nolla (0) ja enintään viisi (5) varajäsentä. Varsinaisten ja varajäsenten\nlukumäärä päätetään syyskokouksessa. Hallituksen toimikausi on kalenterivuosi. Hallitus valitsee keskuudestaan\nvarapuheenjohtajan ja sihteerin, lisäksi hallitus nimittää rahastonhoitajan sekä muut tarvittavat toimihenkilöt.\n\n## 9 HALLITUKSEN TEHTÄVÄT\n\nHallituksen tehtävänä on:\n\n1. Pitää yllä jäsenluetteloa\n2. Kutsua yhdistyksen kokous tarvittaessa koolle\n3. Hoitaa yhdistyksen asioita sekä taloutta sääntöjen ja toimintasuunnitelman mukaan.\n\n## 10 YHDISTYKSEN NIMEN KIRJOITTAMINEN\n\nYhdistyksen nimen kirjoittaa hallituksen puheenjohtaja, sihteeri tai muu hallituksen jäsen jonka hallitus on\nnimenkirjoittajaksi määrännyt, kukin erikseen.\n\n## 11 HALLITUKSEN KOOLLE KUTSUMINEN\n\nHallitus kokoontuu puheenjohtajan tai hänen estyneenä ollessaan varapuheenjohtajan kutsusta, kun he katsovat siihen\nolevan aihetta tai jonkun hallituksen jäsenen niin halutessa. Hallitus on päätösvaltainen, mikäli puolet hallituksen\njäsenistä puheenjohtaja tai varapuheenjohtaja mukaan lukien on paikalla ja kokouksesta on tiedotettu hallituksen\njäsenille vähintään kolme vuorokautta ennen kokousta tai mikäli neljä viidesosaa (4/5) hallituksen varsinaisista\njäsenistä on ilmaissut suostumuksensa kokouksen järjestämiseen aikaisemmin. Hallitus päättää kokousten\nkoollekutsumistavasta järjestäytymiskokouksessaan. Päätökset tehdään hallituksessa yksinkertaisella enemmistöllä\navoimella äänestyksellä, ellei joku halua suljettua lippuäänestystä. Äänten mennessä tasan kokouksen puheenjohtajan ääni\nratkaisee, paitsi vaaleissa arpa.\n\n## 12 TILIT\n\nYhdistyksen tilikausi on kalenterivuosi. Rahastonhoitaja esittää tilit, kirjallisen selonteon varojen käytöstä ja\ntaloudellisesta asemasta hallitukselle tilikautta seuraavan tammikuun 15. päivään mennessä. Hallitus laatii\npuheenjohtajan ja sihteerin johdolla toimintakertomuksen. Tilinpäätös tarvittavine asiakirjoineen ja hallituksen\nvuosikertomus on annettava toiminnantarkastajille viimeistään kolme viikkoa ennen kevätkokousta. Toiminnantarkastajien\ntulee antaa kirjallinen lausuntonsa viimeistään kaksi viikkoa ennen kevätkokousta hallitukselle. Hallitus esittää\ntilinpäätöksen ja toiminnantarkastajien lausunnon sekä toimintakertomuksen yhdistyksen kevätkokoukselle.\n\n## 13 YHDISTYKSEN KOKOUKSEN KOOLLE KUTSUMINEN\n\nYhdistyksen kevät- ja syyskokouksen ja ylimääräisen kokouksen koolle kutsuminen tapahtuu ilmoituksella viimeistään\nviikkoa ennen kokousta yhdistyksen ilmoitustaululla. Ylimääräinen kokous pidetään, jos hallitus katsoo siihen olevan\naihetta tai jos vähintään yksi kahdeskymmenesosa (1/20) tai 30 yhdistyksen äänioikeutetuista jäsenistä sitä\nhallitukselta erityisesti ilmoitettua asiaa varten kirjallisesti vaatii.\n\n## 14 VUOSIKOKOUKSET\n\nYhdistyksen kevätkokous pidetään helmikuussa. Kokouksessa käsitellään vähintään seuraavat asiat:\n\n1. Todetaan kokouksen laillisuus ja päätösvaltaisuus.\n2. Valitaan kokoukselle puheenjohtaja, sihteeri ja kaksi pöytäkirjantarkastajaa sekä ääntenlaskijaa.\n3. Vahvistetaan kokouksen esityslista.\n4. Esitetään edellisen vuoden toimintakertomus.\n5. Esitetään toiminnantarkastajien lausunto. Vahvistetaan tilinpäätös ja päätetään vastuuvapauden myöntämisestä tilivelvollisille.\n6. Käsitellään muut kokouksessa mahdolliset esille tulevat asiat.\n\nYhdistyksen syyskokous pidetään marraskuussa, kokouksessa käsitellään vähintään seuraavat asiat:\n\n1. Todetaan kokouksen laillisuus ja päätösvaltaisuus.\n2. Valitaan kokoukselle puheenjohtaja, sihteeri ja kaksi pöytäkirjantarkastajaa sekä ääntenlaskijaa.\n3. Vahvistetaan kokouksen esityslista.\n4. Päätetään yhdistyksen mahdollisten toimihenkilöiden palkkioista ja korvauksista.\n5. Esitetään toimintasuunnitelma tulevalle vuodelle.\n6. Käsitellään ja vahvistetaan hallituksen laatima tulo- ja menoarvioehdotus sekä jäsenmaksujen suuruus.\n7. Valitaan kaksi toiminnantarkastajaa ja kaksi varatoiminnantarkastajaa.\n8. Valitaan yhdistyksen hallitukselle puheenjohtaja.\n9. Päätetään hallituksen jäsenten määrä.\n10. Valitaan muut hallituksen jäsenet.\n11. Käsitellään muut kokouksessa esille tulevat asiat\n\nMikäli yhdistyksen jäsen haluaa saada jonkin asian yhdistyksen kevät- tai syyskokouksen käsiteltäväksi, on hänen\nilmoitettava siitä kirjallisesti hallitukselle viimeistään kaksi viikkoa ennen kokousta, että asia voidaan sisällyttää\nkokouskutsuun.\n\n## 15 ÄÄNIOIKEUS\n\nYhdistyksen kokouksissa on jokaisella varsinaisella jäsenellä yksi ääni. Kunnia-, kannatus- ja yhteisöjäsenellä on\nläsnäolo- ja puheoikeus, mutta ei äänioikeutta yhdistyksen kokouksessa. Äänten mennessä tasan puheenjohtajan ääni\nratkaisee, vaaleissa kuitenkin arpa. Äänestys tulee suorittaa suljettuna lippuäänestyksenä, mikäli joku jäsenistä niin\nhaluaa.\n\n## 16 VUOSIPÄIVÄ\n\nYhdistys viettää vuosipäiväänsä lokakuun 21. päivänä. Yhdistys on perustettu vuonna 1987.\n\n## 17 HARRASTUSTOIMINTA\n\nYhdistyksen tarkoitusperien kanssa sopusoinnussa olevien harrastusten tukemiseksi ja kehittämiseksi voivat jäsenet\nperustaa rekisteröimättömän kerhon tai harrastuspiirin, joiden toimintaa yhdistys pyrkii tukemaan mahdollisuuksiensa\nmukaan.\n\n## 18 SÄÄNTÖJEN MUUTTAMINEN JA YHDISTYKSEN PURKAMINEN\n\nPäätös sääntöjen muuttamisesta ja yhdistyksen purkamisesta on tehtävä yhdistyksen kokouksessa vähintään kolmen\nneljäsosan (3/4) enemmistöllä annetuista äänistä. Kokouskutsussa on mainittava sääntöjen muuttamisesta tai yhdistyksen\npurkamisesta. Yhdistyksen purkautuessa käytetään yhdistyksen varat yhdistyksen tarkoituksen edistämiseen purkamisesta\npäättävän kokouksen määräämällä tavalla. Yhdistyksen tullessa lakkautetuksi käytetään sen varat samaan tarkoitukseen.\n\n## 19 JÄSENOIKEUDET\n\nSaavutetut jäsenoikeudet säilyvät.\n\n## 20 YHDISTYKSEN TUNNUKSET\n\nYhdistyksen tunnuksen sekä arvo- ja kunniamerkkien muodosta päättää yleiskokous. Merkkien jakamisesta päättää hallitus.	# Serveri ry's rules of order\n\n## 1. NAME AND SEAT\n\nThe name of the association is Students of Computer Science at the University of Eastern Finland - Serveri ry. The registered office of the association is\nKuopio.\n\n## 2. PURPOSE AND ACTIVITIES\n\nThe purpose of the association is to unite students of Computer Science at the University of Eastern Finland and to support their work in the field of computer science.\nintellectual and material aspirations, both in professional and recreational matters. Its purpose\ninterests of its members by maintaining contacts with other associations, companies and the university.\nadministrative bodies. The association organises various information, presentation, lecture and discussion events, and\nevening events. The association aims to support the studies and study trips of its members. To support its activities\nthe Association may also receive grants, donations and bequests, and may, with the permission of the person concerned, carry out\nfund-raising and raffles, acquire, sell and own movable and immovable property necessary for its activities.\nproperty, or to engage in any activity directly related to the realisation of the objects of the association or economically related to the realisation of the objects of the association\nconsidered to be of negligible economic value.\n\n## 3 LANGUAGE\n\nThe language of the Association is Finnish. Minutes shall be drawn up in Finnish.\n\n## 4 IMPARTIALITY\n\nThe Association is politically neutral.\n\n## 5 MEMBERS\n\nMembers can be:\n\n1. Full members: persons enrolled at the University of Eastern Finland (present or absent) in the field of computer science.\n   Students of Computer Science (current or present).\n2. Sustaining members: Sustaining members may be individuals or legal entities with an interest in the field of computer science.\n   and wish to support the activities of the association.\n3. Honorary members: A person who has made a special contribution to the activities of the Association may be invited to become an honorary member. The proposal is submitted to\n   any member may make a proposal for honorary membership, orally or in writing, to the Board of Directors, which shall invite the member to become an honorary member.\n   The proposal may be submitted to the Association's General Assembly or directly to the Association's General Assembly, where a simple majority is sufficient.\n   majority of the votes cast, if any, to approve the proposal. Any graduate member may be elected by the Board of\n   by decision of the Board.\n4. Community members: Community members may be any legal entity interested in the activities of the Association and wishing to\n   The association may be supported by a legal entity who is interested in the association and who wishes to support it.\n\nFull members, sustaining members and community members shall be approved by the Board of Directors of the Association upon application. Membership takes effect from the date of application.\nThe membership of a member, in addition to the members, shall take effect after the decision of the Board of Directors. Withdrawal from membership shall be effected by written notification to the Board of Directors.\nor its President or by announcing the resignation at a meeting of the Association to be recorded in the minutes. For resignation\nfor non-payment of the membership fee shall be decided by the Board of Directors.\n\n## 6 OBLIGATIONS OF THE MEMBER\n\nMembers are obliged to inform the Board of Directors of the Association of the information required by the Association Act whenever changes occur,\nat least every five (5) years.\n\n## 7 MEMBERSHIP FEES\n\nThe amount of the joining fee and the annual membership fee for full members and sustaining members shall be set separately for each of the following.\nfor each category of member shall be decided by the Autumn Meeting. The membership fees for Community members are decided by the Board of Directors of the Association. Honorary Presidents and\nhonorary members do not pay membership fees.\n\n## 8 BOARD OF DIRECTORS\n\nThe Board of Directors shall consist of a President elected at the Autumn Meeting and a minimum of seven (7) and a maximum of fifteen (15) members.\nother full members and at least zero (0) and no more than five (5) alternate members. The number of full and alternate members shall be\nshall be decided at the Autumn Meeting. The term of office of the Board of Directors shall be one calendar year. The Board shall elect from among its members\nThe Board of Directors shall appoint from among its members a Vice-Chairman and a Secretary, and shall appoint a Treasurer and other necessary officers.\n\n## 9 FUNCTIONS OF THE BOARD\n\nThe tasks of the Board of Directors are:\n\n1. Maintain the list of members\n2. to convene meetings of the Association when necessary\n3. Call the meeting of the General Assembly at 3.00 a.m. Call the General Assembly at 3.00 a.m. Call the meeting at 3.00 a.m.\n\n## 10 WRITING THE NAME OF THE ASSOCIATION\n\nThe name of the Association shall be written by the Chairman of the Board, the Secretary or any other member of the Board whose name is\nThe secretary, the secretary or the board of directors, as designated by the board of directors, shall sign the name of the association, each individually.\n\n## 11 CONVENING OF MEETINGS OF THE BOARD OF DIRECTORS\n\nThe Board of Directors shall meet at the call of the Chairman or, in his absence, the Vice-Chairman, whenever they deem it necessary.\nwhen they deem it necessary or at the request of a member of the Board of Directors. A quorum shall exist if half of the members of the Board of Directors\nmembers, including the Chairman or Vice-Chairman, are present and notice of the meeting has been given to the Board of Directors.\nmembers at least three days before the meeting, or if four fifths (4/5) of the members of the Board of Directors are present at the meeting.\nof the members of the Board have given their prior consent to the holding of the meeting. The Board of Directors shall decide on the meetings\nat its organizational meeting. Decisions are taken by a simple majority of the Board.\nby open ballot, unless a person wishes to have a closed ballot. In the event of a tie, the chairman of the meeting shall have the casting vote.\nshall have the casting vote, except in the case of elections by lot.\n\n## 12 ACCOUNTS\n\nThe financial year of the Association shall be the calendar year. The treasurer shall present the accounts, a written statement of the use of the funds and a\nfinancial position to the Board of Directors by 15 January following the end of the financial year. The Board shall draw up\nunder the direction of the President and the Secretary, a report on its activities. The financial statements, together with the necessary documents and the\nthe annual report of the Board of Directors and the annual report of the Board of Directors shall be submitted to the auditors at least three weeks before the spring meeting. For the auditors\nshall submit their written opinion to the Governing Board no later than two weeks before the spring meeting. The Board of Directors shall propose\nthe financial statements and the opinion of the auditors, together with the report of the auditors, to the Spring Assembly of the Association.\n\n## 13 CONVENING A MEETING OF THE ASSOCIATION\n\nThe convening of the spring and autumn meetings and extraordinary meetings of the Association shall be convened by notice given no later than.\none week before the meeting on the notice board of the Association. An extraordinary meeting shall be held if the Board of Directors considers it necessary.\nor if at least one twentieth (1/20) or 30 of the members of the Association with voting rights so request.\nthe Board of Directors in writing for a specifically notified matter.\n\n## 14 ANNUAL MEETINGS\n\nThe Spring Meeting of the Association shall be held in February. The meeting shall consider at least the following matters:\n\n1. to establish the legality and quorum of the meeting.\n2. to elect a chairman, a secretary, two scrutineers and a scrutineer.\n3. To approve the agenda for the meeting.\n4. to present the report of the previous year's activities.\n5. Presentation of the auditors' report. Approval of the accounts and decision on the discharge to the accounting officers.\n6. to consider any other business that may arise at the meeting.\n\nThe Association's autumn meeting will be held in November, at which at least the following items will be discussed:\n\n1. to establish the legality and quorum of the meeting.\n2. to elect a chairman, a secretary, two scrutineers of the minutes and a scrutineer of the votes.\n3. To approve the agenda of the meeting.\n4. to decide on the remuneration and compensation of any officers of the Association.\n5. to present an action plan for the coming year.\n6. to consider and approve the proposed budget of income and expenditure and the amount of membership fees, as prepared by the Board of Directors.\n7. to elect two auditors and two deputy auditors.\n8. To elect a Chairman of the Board of the Association.\n9. to decide on the number of members of the Board of Directors.\n10. to elect the other members of the Board of Directors.\n11. to consider any other business to be transacted at the meeting\n\nIf a member of the Association wishes to have a matter brought before the Spring or Autumn Meeting of the Association, he/she must\nto the Board of Directors at least two weeks before the meeting so that the matter can be included in the agenda of the next general meeting.\nbe included in the notice of the meeting.\n\n## 15 VOTING RIGHTS\n\nAt meetings of the Association, each full member shall have one vote. An honorary, supporting and corporate member shall have\nhave the right to attend and speak, but not to vote, at meetings of the Association. In the event of a tie, the President shall have the vote of\nshall have the casting vote, but in the case of elections, the election shall be by lot. Voting shall be by closed ballot if any member so decides.\nif one of the members wishes.\n\n## 16TH ANNIVERSARY\n\nThe Association shall celebrate its anniversary on 21 October. The Association was founded in 1987.\n\n## 17 RECREATIONAL ACTIVITIES\n\nIn order to support and develop hobbies consistent with the purposes of the Association, members may\nestablish an unregistered club or hobby group, the activities of which the Association shall endeavour to support as far as possible\nas far as possible.\n\n\n## 18 AMENDMENT OF THE STATUTES AND DISSOLUTION OF THE ASSOCIATION\n\nThe decision to amend the statutes and dissolve the association must be taken at a meeting of the association at least three\nmajority of three quarters (3/4) of the votes cast. The notice of the meeting shall state that the amendment of the Statutes or the dissolution of the Association\ndissolution. In the event of the dissolution of the Association, the assets of the Association shall be used to further the purposes of the Association.\nin the manner determined by the meeting which decides on the dissolution of the association. If the Association is dissolved, its assets shall be used for the same purpose.\n\n## 19 MEMBERSHIP RIGHTS\n\nThe membership rights acquired shall be maintained.\n\n## 20 ASSOCIATION SYMBOLS\n\nThe form of the Association's emblem and of the decorations and medals shall be decided by the General Assembly. The distribution of the badges is decided by the Board of Directors.\n\n
\.


--
-- Data for Name: social_medias; Type: TABLE DATA; Schema: public; Owner: serveri
--

COPY public.social_medias (id, user_created, date_created, user_updated, date_updated, name, url, icon) FROM stdin;
1	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-17 10:59:01.244+00	\N	\N	Discord	www.google.com	https://assets-global.website-files.com/6257adef93867e50d84d30e2/636e0a6a49cf127bf92de1e2_icon_clyde_blurple_RGB.png
\.


--
-- Data for Name: study_club; Type: TABLE DATA; Schema: public; Owner: serveri
--

COPY public.study_club (id, user_updated, date_updated, fi_text, en_text) FROM stdin;
1	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 20:10:58.119+00	# Läksykerho\n\nLäksykerho on tarkoitettu kaikille TKT:n opiskelijoille ja vuosikursseille. Tulkaa yhdessä miettimään ja ratkomaan kurssien harjoitustehtäviä. Läksykerhon aika on 4 h, mutta se ei tarkoita sitä, että siellä tulee olla koko aikaa. Tulkaa silloin, kun muilta opinnoiltanne kerkiätte.  \n\nLäksykerho päivinä laitos tarjoaa kahvit/teet klo 13.45-14.15 laitoksen aulassa. Silloin on mahdollista tavata myös paikalla olevaa laitoksen henkilökuntaa.	# Study club\n\nThe club is open to all TKT students and year groups. Come together to think about and solve course exercises. The time of the club is 4 hours, but that does not mean that you have to be there all the time. Please come when you can from your other studies.  \n\nOn the days of the study club, the department offers coffee/tea from 13.45 to 14.15 in the lobby of the department. It is also possible to meet the staff of the institution on site.
\.


--
-- Data for Name: turvallinen_tila; Type: TABLE DATA; Schema: public; Owner: serveri
--

COPY public.turvallinen_tila (id, user_updated, date_updated, turvallinen_tila_fi, turvalinen_tila_en) FROM stdin;
1	0891a0cd-876b-4a0d-a22e-0cce30121382	2023-04-29 13:19:51.778+00	# Turvallinen tila\n\n"Turvallisemmat tilat" on termi, jota käytetään kuvaamaan yhteisön ponnistuksia luoda ympäristöjä, jotka edistävät turvallisuutta. Käytännössä turvallisempi tila edellyttää opiskelijajärjestön ja sen jäsenten vastuunottoa haastavissa tilanteissa. Konflikteja käsitellään sen sijaan että niitä siedettäisiin.\n\n1. On tärkeää olla kunnioittava ja välttää kysymyksiä toisen erilaisuudesta. Käsittele herkkiä aiheita huolellisesti ja varmista, että kaikilla on ääni ja heidät otetaan huomioon.\n2. Kunnioita jokaisen fyysistä ja henkistä hyvinvointia sekä heidän oikeuttaan itsemääräämiseen. Älä tee oletuksia stereotypioiden perusteella.\n3. Vältä rasististen tai syrjivien stereotypioiden uusintamista, vaikka se olisi tarkoitus tehdä "vitsinä" tai ironisesti. Älä häiritse ketään sanallisesti, fyysisesti tai visuaalisesti. Jos joku sanoo "ei", kunnioita heidän rajojaan ja muuta käyttäytymistäsi tarvittaessa.\n4. Jos tilanne tuntuu epämukavalta, kerro siitä järjestön hallitukselle tai johtajille. Voit myös antaa palautetta nimettömänä.\n5. On tärkeää olla kunnioittava ja välttää kysymyksiä toisen erilaisuudesta. Käsittele herkkiä aiheita huolellisesti ja varmista, että kaikilla on ääni ja heidät otetaan huomioon.\n6. On olennaista puuttua, jos todistat rasismia, syrjintää, häirintää tai muuta sopimatonta käytöstä.\n\nValerija Kirpu toimii häirintäyhteyshenkilönä Serveri ry:ssä, hänen roolissaan sosiaalipoliittisena edustajana.\n\nOsallistumalla Serveri ry:hyn jäsenet sitoutuvat noudattamaan tätä käytännesääntöä ja tukemaan positiivista ja kunnioittavaa yhteisöä. Tämän käytännesäännön rikkomukset voivat johtaa kurinpitotoimenpiteisiin, mukaan lukien poistaminen Serveri ry:stä.	# Safer Spaces\n\nSafer spaces" is a term used to describe the communal effort to create environments that promote safety. In practice, a safer space involves the student organization and its members taking responsibility for challenging situations. Conflicts are addressed instead of being tolerated.\n\n1. It is important to be respectful, avoiding any questioning of someone's differences. Handle sensitive topics with care, and ensure that everyone has a voice and is included.\n2. Respect everyone's physical and mental well-being, as well as their right to self-determination. Do not make assumptions based on stereotypes.\n3. Avoid reproducing racist or discriminatory stereotypes, even if intended as "jokes" or irony. Do not harass anyone verbally, physically, or visually. If someone says "no," respect their boundaries and change your behavior if necessary.\n4. If a situation feels uncomfortable, raise it with the organization's board or leadership. You can also give feedback anonymously.\n5. It is important to be respectful, avoiding any questioning of someone's differences. Handle sensitive topics with care, and ensure that everyone has a voice and is included.\n6. It is essential to intervene if you witness racism, discrimination, harassment, or any other inappropriate behavior.\n\nValerija Kirpu serves as our harassment contact person at Serveri ry, in her role as the social policy representative.\n\nBy participating in the Serveri ry, members agree to adhere to this Code of Conduct and support a positive and respectful community. Any violations of this Code of Conduct may result in disciplinary action, up to and including removal from the Serveri ry.
\.


--
-- Name: LandingPage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: serveri
--

SELECT pg_catalog.setval('public."LandingPage_id_seq"', 1, true);


--
-- Name: board_members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: serveri
--

SELECT pg_catalog.setval('public.board_members_id_seq', 7, true);


--
-- Name: directus_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: serveri
--

SELECT pg_catalog.setval('public.directus_activity_id_seq', 601, true);


--
-- Name: directus_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: serveri
--

SELECT pg_catalog.setval('public.directus_fields_id_seq', 126, true);


--
-- Name: directus_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: serveri
--

SELECT pg_catalog.setval('public.directus_notifications_id_seq', 1, false);


--
-- Name: directus_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: serveri
--

SELECT pg_catalog.setval('public.directus_permissions_id_seq', 19, true);


--
-- Name: directus_presets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: serveri
--

SELECT pg_catalog.setval('public.directus_presets_id_seq', 4, true);


--
-- Name: directus_relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: serveri
--

SELECT pg_catalog.setval('public.directus_relations_id_seq', 20, true);


--
-- Name: directus_revisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: serveri
--

SELECT pg_catalog.setval('public.directus_revisions_id_seq', 482, true);


--
-- Name: directus_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: serveri
--

SELECT pg_catalog.setval('public.directus_settings_id_seq', 1, true);


--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: serveri
--

SELECT pg_catalog.setval('public.directus_webhooks_id_seq', 1, false);


--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: serveri
--

SELECT pg_catalog.setval('public.events_id_seq', 1, false);


--
-- Name: for_new_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: serveri
--

SELECT pg_catalog.setval('public.for_new_student_id_seq', 1, true);


--
-- Name: gdpr_id_seq; Type: SEQUENCE SET; Schema: public; Owner: serveri
--

SELECT pg_catalog.setval('public.gdpr_id_seq', 1, true);


--
-- Name: hallitus_page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: serveri
--

SELECT pg_catalog.setval('public.hallitus_page_id_seq', 1, true);


--
-- Name: liity_serveriin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: serveri
--

SELECT pg_catalog.setval('public.liity_serveriin_id_seq', 1, true);


--
-- Name: lomake_vastaukset_id_seq; Type: SEQUENCE SET; Schema: public; Owner: serveri
--

SELECT pg_catalog.setval('public.lomake_vastaukset_id_seq', 124, true);


--
-- Name: news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: serveri
--

SELECT pg_catalog.setval('public.news_id_seq', 1, true);


--
-- Name: partners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: serveri
--

SELECT pg_catalog.setval('public.partners_id_seq', 8, true);


--
-- Name: serveri_rules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: serveri
--

SELECT pg_catalog.setval('public.serveri_rules_id_seq', 1, true);


--
-- Name: social_medias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: serveri
--

SELECT pg_catalog.setval('public.social_medias_id_seq', 1, true);


--
-- Name: study_club_id_seq; Type: SEQUENCE SET; Schema: public; Owner: serveri
--

SELECT pg_catalog.setval('public.study_club_id_seq', 1, true);


--
-- Name: turvallinen_tila_id_seq; Type: SEQUENCE SET; Schema: public; Owner: serveri
--

SELECT pg_catalog.setval('public.turvallinen_tila_id_seq', 1, true);


--
-- Name: LandingPage LandingPage_pkey; Type: CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public."LandingPage"
    ADD CONSTRAINT "LandingPage_pkey" PRIMARY KEY (id);


--
-- Name: board_members board_members_pkey; Type: CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.board_members
    ADD CONSTRAINT board_members_pkey PRIMARY KEY (id);


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
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: for_new_student for_new_student_pkey; Type: CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.for_new_student
    ADD CONSTRAINT for_new_student_pkey PRIMARY KEY (id);


--
-- Name: gdpr gdpr_pkey; Type: CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.gdpr
    ADD CONSTRAINT gdpr_pkey PRIMARY KEY (id);


--
-- Name: hallitus_page hallitus_page_pkey; Type: CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.hallitus_page
    ADD CONSTRAINT hallitus_page_pkey PRIMARY KEY (id);


--
-- Name: liity_serveriin liity_serveriin_pkey; Type: CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.liity_serveriin
    ADD CONSTRAINT liity_serveriin_pkey PRIMARY KEY (id);


--
-- Name: lomake_vastaukset lomake_vastaukset_pkey; Type: CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.lomake_vastaukset
    ADD CONSTRAINT lomake_vastaukset_pkey PRIMARY KEY (id);


--
-- Name: news news_pkey; Type: CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_pkey PRIMARY KEY (id);


--
-- Name: partners partners_pkey; Type: CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.partners
    ADD CONSTRAINT partners_pkey PRIMARY KEY (id);


--
-- Name: serveri_rules serveri_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.serveri_rules
    ADD CONSTRAINT serveri_rules_pkey PRIMARY KEY (id);


--
-- Name: social_medias social_medias_pkey; Type: CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.social_medias
    ADD CONSTRAINT social_medias_pkey PRIMARY KEY (id);


--
-- Name: study_club study_club_pkey; Type: CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.study_club
    ADD CONSTRAINT study_club_pkey PRIMARY KEY (id);


--
-- Name: turvallinen_tila turvallinen_tila_pkey; Type: CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.turvallinen_tila
    ADD CONSTRAINT turvallinen_tila_pkey PRIMARY KEY (id);


--
-- Name: board_members board_members_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.board_members
    ADD CONSTRAINT board_members_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);


--
-- Name: board_members board_members_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.board_members
    ADD CONSTRAINT board_members_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


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
-- Name: events events_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);


--
-- Name: events events_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: for_new_student for_new_student_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.for_new_student
    ADD CONSTRAINT for_new_student_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: gdpr gdpr_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.gdpr
    ADD CONSTRAINT gdpr_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: hallitus_page hallitus_page_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.hallitus_page
    ADD CONSTRAINT hallitus_page_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: LandingPage landingpage_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public."LandingPage"
    ADD CONSTRAINT landingpage_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: liity_serveriin liity_serveriin_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.liity_serveriin
    ADD CONSTRAINT liity_serveriin_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: news news_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);


--
-- Name: news news_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: partners partners_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.partners
    ADD CONSTRAINT partners_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);


--
-- Name: partners partners_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.partners
    ADD CONSTRAINT partners_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: serveri_rules serveri_rules_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.serveri_rules
    ADD CONSTRAINT serveri_rules_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: social_medias social_medias_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.social_medias
    ADD CONSTRAINT social_medias_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);


--
-- Name: social_medias social_medias_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.social_medias
    ADD CONSTRAINT social_medias_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: study_club study_club_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.study_club
    ADD CONSTRAINT study_club_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: turvallinen_tila turvallinen_tila_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: serveri
--

ALTER TABLE ONLY public.turvallinen_tila
    ADD CONSTRAINT turvallinen_tila_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- PostgreSQL database dump complete
--

