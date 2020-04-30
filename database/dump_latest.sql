--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO djangouser;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO djangouser;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO djangouser;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO djangouser;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO djangouser;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO djangouser;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO djangouser;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO djangouser;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO djangouser;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO djangouser;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO djangouser;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO djangouser;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO djangouser;

--
-- Name: cms_aliaspluginmodel; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cms_aliaspluginmodel (
    cmsplugin_ptr_id integer NOT NULL,
    plugin_id integer,
    alias_placeholder_id integer
);


ALTER TABLE public.cms_aliaspluginmodel OWNER TO djangouser;

--
-- Name: cms_cmsplugin; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cms_cmsplugin (
    id integer NOT NULL,
    "position" smallint NOT NULL,
    language character varying(15) NOT NULL,
    plugin_type character varying(50) NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    changed_date timestamp with time zone NOT NULL,
    parent_id integer,
    placeholder_id integer,
    depth integer NOT NULL,
    numchild integer NOT NULL,
    path character varying(255) NOT NULL,
    CONSTRAINT cms_cmsplugin_depth_check CHECK ((depth >= 0)),
    CONSTRAINT cms_cmsplugin_numchild_check CHECK ((numchild >= 0)),
    CONSTRAINT cms_cmsplugin_position_check CHECK (("position" >= 0))
);


ALTER TABLE public.cms_cmsplugin OWNER TO djangouser;

--
-- Name: cms_cmsplugin_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cms_cmsplugin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_cmsplugin_id_seq OWNER TO djangouser;

--
-- Name: cms_cmsplugin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cms_cmsplugin_id_seq OWNED BY public.cms_cmsplugin.id;


--
-- Name: cms_globalpagepermission; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cms_globalpagepermission (
    id integer NOT NULL,
    can_change boolean NOT NULL,
    can_add boolean NOT NULL,
    can_delete boolean NOT NULL,
    can_change_advanced_settings boolean NOT NULL,
    can_publish boolean NOT NULL,
    can_change_permissions boolean NOT NULL,
    can_move_page boolean NOT NULL,
    can_view boolean NOT NULL,
    can_recover_page boolean NOT NULL,
    group_id integer,
    user_id integer
);


ALTER TABLE public.cms_globalpagepermission OWNER TO djangouser;

--
-- Name: cms_globalpagepermission_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cms_globalpagepermission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_globalpagepermission_id_seq OWNER TO djangouser;

--
-- Name: cms_globalpagepermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cms_globalpagepermission_id_seq OWNED BY public.cms_globalpagepermission.id;


--
-- Name: cms_globalpagepermission_sites; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cms_globalpagepermission_sites (
    id integer NOT NULL,
    globalpagepermission_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.cms_globalpagepermission_sites OWNER TO djangouser;

--
-- Name: cms_globalpagepermission_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cms_globalpagepermission_sites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_globalpagepermission_sites_id_seq OWNER TO djangouser;

--
-- Name: cms_globalpagepermission_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cms_globalpagepermission_sites_id_seq OWNED BY public.cms_globalpagepermission_sites.id;


--
-- Name: cms_page; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cms_page (
    id integer NOT NULL,
    created_by character varying(255) NOT NULL,
    changed_by character varying(255) NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    changed_date timestamp with time zone NOT NULL,
    publication_date timestamp with time zone,
    publication_end_date timestamp with time zone,
    in_navigation boolean NOT NULL,
    soft_root boolean NOT NULL,
    reverse_id character varying(40),
    navigation_extenders character varying(80),
    template character varying(100) NOT NULL,
    login_required boolean NOT NULL,
    limit_visibility_in_menu smallint,
    is_home boolean NOT NULL,
    application_urls character varying(200),
    application_namespace character varying(200),
    publisher_is_draft boolean NOT NULL,
    languages character varying(255),
    xframe_options integer NOT NULL,
    publisher_public_id integer,
    is_page_type boolean NOT NULL,
    node_id integer NOT NULL
);


ALTER TABLE public.cms_page OWNER TO djangouser;

--
-- Name: cms_page_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cms_page_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_page_id_seq OWNER TO djangouser;

--
-- Name: cms_page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cms_page_id_seq OWNED BY public.cms_page.id;


--
-- Name: cms_page_placeholders; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cms_page_placeholders (
    id integer NOT NULL,
    page_id integer NOT NULL,
    placeholder_id integer NOT NULL
);


ALTER TABLE public.cms_page_placeholders OWNER TO djangouser;

--
-- Name: cms_page_placeholders_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cms_page_placeholders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_page_placeholders_id_seq OWNER TO djangouser;

--
-- Name: cms_page_placeholders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cms_page_placeholders_id_seq OWNED BY public.cms_page_placeholders.id;


--
-- Name: cms_pagepermission; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cms_pagepermission (
    id integer NOT NULL,
    can_change boolean NOT NULL,
    can_add boolean NOT NULL,
    can_delete boolean NOT NULL,
    can_change_advanced_settings boolean NOT NULL,
    can_publish boolean NOT NULL,
    can_change_permissions boolean NOT NULL,
    can_move_page boolean NOT NULL,
    can_view boolean NOT NULL,
    grant_on integer NOT NULL,
    group_id integer,
    page_id integer,
    user_id integer
);


ALTER TABLE public.cms_pagepermission OWNER TO djangouser;

--
-- Name: cms_pagepermission_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cms_pagepermission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_pagepermission_id_seq OWNER TO djangouser;

--
-- Name: cms_pagepermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cms_pagepermission_id_seq OWNED BY public.cms_pagepermission.id;


--
-- Name: cms_pageuser; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cms_pageuser (
    user_ptr_id integer NOT NULL,
    created_by_id integer NOT NULL
);


ALTER TABLE public.cms_pageuser OWNER TO djangouser;

--
-- Name: cms_pageusergroup; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cms_pageusergroup (
    group_ptr_id integer NOT NULL,
    created_by_id integer NOT NULL
);


ALTER TABLE public.cms_pageusergroup OWNER TO djangouser;

--
-- Name: cms_placeholder; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cms_placeholder (
    id integer NOT NULL,
    slot character varying(255) NOT NULL,
    default_width smallint,
    CONSTRAINT cms_placeholder_default_width_check CHECK ((default_width >= 0))
);


ALTER TABLE public.cms_placeholder OWNER TO djangouser;

--
-- Name: cms_placeholder_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cms_placeholder_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_placeholder_id_seq OWNER TO djangouser;

--
-- Name: cms_placeholder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cms_placeholder_id_seq OWNED BY public.cms_placeholder.id;


--
-- Name: cms_placeholderreference; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cms_placeholderreference (
    cmsplugin_ptr_id integer NOT NULL,
    name character varying(255) NOT NULL,
    placeholder_ref_id integer
);


ALTER TABLE public.cms_placeholderreference OWNER TO djangouser;

--
-- Name: cms_staticplaceholder; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cms_staticplaceholder (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    code character varying(255) NOT NULL,
    dirty boolean NOT NULL,
    creation_method character varying(20) NOT NULL,
    draft_id integer,
    public_id integer,
    site_id integer
);


ALTER TABLE public.cms_staticplaceholder OWNER TO djangouser;

--
-- Name: cms_staticplaceholder_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cms_staticplaceholder_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_staticplaceholder_id_seq OWNER TO djangouser;

--
-- Name: cms_staticplaceholder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cms_staticplaceholder_id_seq OWNED BY public.cms_staticplaceholder.id;


--
-- Name: cms_title; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cms_title (
    id integer NOT NULL,
    language character varying(15) NOT NULL,
    title character varying(255) NOT NULL,
    page_title character varying(255),
    menu_title character varying(255),
    meta_description text,
    slug character varying(255) NOT NULL,
    path character varying(255) NOT NULL,
    has_url_overwrite boolean NOT NULL,
    redirect character varying(2048),
    creation_date timestamp with time zone NOT NULL,
    published boolean NOT NULL,
    publisher_is_draft boolean NOT NULL,
    publisher_state smallint NOT NULL,
    page_id integer NOT NULL,
    publisher_public_id integer
);


ALTER TABLE public.cms_title OWNER TO djangouser;

--
-- Name: cms_title_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cms_title_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_title_id_seq OWNER TO djangouser;

--
-- Name: cms_title_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cms_title_id_seq OWNED BY public.cms_title.id;


--
-- Name: cms_treenode; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cms_treenode (
    id integer NOT NULL,
    path character varying(255) NOT NULL,
    depth integer NOT NULL,
    numchild integer NOT NULL,
    parent_id integer,
    site_id integer NOT NULL,
    CONSTRAINT cms_treenode_depth_check CHECK ((depth >= 0)),
    CONSTRAINT cms_treenode_numchild_check CHECK ((numchild >= 0))
);


ALTER TABLE public.cms_treenode OWNER TO djangouser;

--
-- Name: cms_treenode_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cms_treenode_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_treenode_id_seq OWNER TO djangouser;

--
-- Name: cms_treenode_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cms_treenode_id_seq OWNED BY public.cms_treenode.id;


--
-- Name: cms_urlconfrevision; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cms_urlconfrevision (
    id integer NOT NULL,
    revision character varying(255) NOT NULL
);


ALTER TABLE public.cms_urlconfrevision OWNER TO djangouser;

--
-- Name: cms_urlconfrevision_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cms_urlconfrevision_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_urlconfrevision_id_seq OWNER TO djangouser;

--
-- Name: cms_urlconfrevision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cms_urlconfrevision_id_seq OWNED BY public.cms_urlconfrevision.id;


--
-- Name: cms_usersettings; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cms_usersettings (
    id integer NOT NULL,
    language character varying(10) NOT NULL,
    clipboard_id integer,
    user_id integer NOT NULL
);


ALTER TABLE public.cms_usersettings OWNER TO djangouser;

--
-- Name: cms_usersettings_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cms_usersettings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_usersettings_id_seq OWNER TO djangouser;

--
-- Name: cms_usersettings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cms_usersettings_id_seq OWNED BY public.cms_usersettings.id;


--
-- Name: cmsplugin_cascade_cascadeclipboard; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cmsplugin_cascade_cascadeclipboard (
    id integer NOT NULL,
    identifier character varying(50) NOT NULL,
    data text
);


ALTER TABLE public.cmsplugin_cascade_cascadeclipboard OWNER TO djangouser;

--
-- Name: cmsplugin_cascade_cascadeclipboard_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cmsplugin_cascade_cascadeclipboard_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cmsplugin_cascade_cascadeclipboard_id_seq OWNER TO djangouser;

--
-- Name: cmsplugin_cascade_cascadeclipboard_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cmsplugin_cascade_cascadeclipboard_id_seq OWNED BY public.cmsplugin_cascade_cascadeclipboard.id;


--
-- Name: cmsplugin_cascade_element; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cmsplugin_cascade_element (
    cmsplugin_ptr_id integer NOT NULL,
    glossary text NOT NULL,
    shared_glossary_id integer
);


ALTER TABLE public.cmsplugin_cascade_element OWNER TO djangouser;

--
-- Name: cmsplugin_cascade_iconfont; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cmsplugin_cascade_iconfont (
    id integer NOT NULL,
    identifier character varying(50) NOT NULL,
    config_data text NOT NULL,
    font_folder character varying(100) NOT NULL,
    zip_file_id integer NOT NULL,
    is_default boolean NOT NULL
);


ALTER TABLE public.cmsplugin_cascade_iconfont OWNER TO djangouser;

--
-- Name: cmsplugin_cascade_iconfont_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cmsplugin_cascade_iconfont_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cmsplugin_cascade_iconfont_id_seq OWNER TO djangouser;

--
-- Name: cmsplugin_cascade_iconfont_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cmsplugin_cascade_iconfont_id_seq OWNED BY public.cmsplugin_cascade_iconfont.id;


--
-- Name: cmsplugin_cascade_inline; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cmsplugin_cascade_inline (
    id integer NOT NULL,
    glossary text NOT NULL,
    cascade_element_id integer NOT NULL
);


ALTER TABLE public.cmsplugin_cascade_inline OWNER TO djangouser;

--
-- Name: cmsplugin_cascade_inline_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cmsplugin_cascade_inline_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cmsplugin_cascade_inline_id_seq OWNER TO djangouser;

--
-- Name: cmsplugin_cascade_inline_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cmsplugin_cascade_inline_id_seq OWNED BY public.cmsplugin_cascade_inline.id;


--
-- Name: cmsplugin_cascade_page; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cmsplugin_cascade_page (
    id integer NOT NULL,
    settings text NOT NULL,
    glossary text NOT NULL,
    extended_object_id integer NOT NULL,
    public_extension_id integer,
    icon_font_id integer,
    menu_symbol character varying(32)
);


ALTER TABLE public.cmsplugin_cascade_page OWNER TO djangouser;

--
-- Name: cmsplugin_cascade_page_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cmsplugin_cascade_page_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cmsplugin_cascade_page_id_seq OWNER TO djangouser;

--
-- Name: cmsplugin_cascade_page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cmsplugin_cascade_page_id_seq OWNED BY public.cmsplugin_cascade_page.id;


--
-- Name: cmsplugin_cascade_pluginextrafields; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cmsplugin_cascade_pluginextrafields (
    id integer NOT NULL,
    plugin_type character varying(50) NOT NULL,
    allow_id_tag boolean NOT NULL,
    css_classes text,
    inline_styles text,
    site_id integer NOT NULL
);


ALTER TABLE public.cmsplugin_cascade_pluginextrafields OWNER TO djangouser;

--
-- Name: cmsplugin_cascade_pluginextrafields_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cmsplugin_cascade_pluginextrafields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cmsplugin_cascade_pluginextrafields_id_seq OWNER TO djangouser;

--
-- Name: cmsplugin_cascade_pluginextrafields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cmsplugin_cascade_pluginextrafields_id_seq OWNED BY public.cmsplugin_cascade_pluginextrafields.id;


--
-- Name: cmsplugin_cascade_sharedglossary; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cmsplugin_cascade_sharedglossary (
    id integer NOT NULL,
    plugin_type character varying(50) NOT NULL,
    identifier character varying(50) NOT NULL,
    glossary text
);


ALTER TABLE public.cmsplugin_cascade_sharedglossary OWNER TO djangouser;

--
-- Name: cmsplugin_cascade_sharedglossary_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cmsplugin_cascade_sharedglossary_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cmsplugin_cascade_sharedglossary_id_seq OWNER TO djangouser;

--
-- Name: cmsplugin_cascade_sharedglossary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cmsplugin_cascade_sharedglossary_id_seq OWNED BY public.cmsplugin_cascade_sharedglossary.id;


--
-- Name: cmsplugin_cascade_sortinline; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cmsplugin_cascade_sortinline (
    id integer NOT NULL,
    glossary text NOT NULL,
    "order" integer NOT NULL,
    cascade_element_id integer NOT NULL,
    CONSTRAINT cmsplugin_cascade_sortinline_order_check CHECK (("order" >= 0))
);


ALTER TABLE public.cmsplugin_cascade_sortinline OWNER TO djangouser;

--
-- Name: cmsplugin_cascade_sortinline_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cmsplugin_cascade_sortinline_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cmsplugin_cascade_sortinline_id_seq OWNER TO djangouser;

--
-- Name: cmsplugin_cascade_sortinline_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cmsplugin_cascade_sortinline_id_seq OWNED BY public.cmsplugin_cascade_sortinline.id;


--
-- Name: cmsplugin_cascade_texteditorconfigfields; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cmsplugin_cascade_texteditorconfigfields (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    element_type character varying(12) NOT NULL,
    css_classes character varying(250) NOT NULL
);


ALTER TABLE public.cmsplugin_cascade_texteditorconfigfields OWNER TO djangouser;

--
-- Name: cmsplugin_cascade_texteditorconfigfields_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cmsplugin_cascade_texteditorconfigfields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cmsplugin_cascade_texteditorconfigfields_id_seq OWNER TO djangouser;

--
-- Name: cmsplugin_cascade_texteditorconfigfields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cmsplugin_cascade_texteditorconfigfields_id_seq OWNED BY public.cmsplugin_cascade_texteditorconfigfields.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO djangouser;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO djangouser;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO djangouser;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO djangouser;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO djangouser;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO djangouser;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO djangouser;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO djangouser;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO djangouser;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: djangocms_text_ckeditor_text; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.djangocms_text_ckeditor_text (
    cmsplugin_ptr_id integer NOT NULL,
    body text NOT NULL
);


ALTER TABLE public.djangocms_text_ckeditor_text OWNER TO djangouser;

--
-- Name: easy_thumbnails_source; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.easy_thumbnails_source (
    id integer NOT NULL,
    storage_hash character varying(40) NOT NULL,
    name character varying(255) NOT NULL,
    modified timestamp with time zone NOT NULL
);


ALTER TABLE public.easy_thumbnails_source OWNER TO djangouser;

--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.easy_thumbnails_source_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.easy_thumbnails_source_id_seq OWNER TO djangouser;

--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.easy_thumbnails_source_id_seq OWNED BY public.easy_thumbnails_source.id;


--
-- Name: easy_thumbnails_thumbnail; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.easy_thumbnails_thumbnail (
    id integer NOT NULL,
    storage_hash character varying(40) NOT NULL,
    name character varying(255) NOT NULL,
    modified timestamp with time zone NOT NULL,
    source_id integer NOT NULL
);


ALTER TABLE public.easy_thumbnails_thumbnail OWNER TO djangouser;

--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.easy_thumbnails_thumbnail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.easy_thumbnails_thumbnail_id_seq OWNER TO djangouser;

--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.easy_thumbnails_thumbnail_id_seq OWNED BY public.easy_thumbnails_thumbnail.id;


--
-- Name: easy_thumbnails_thumbnaildimensions; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.easy_thumbnails_thumbnaildimensions (
    id integer NOT NULL,
    thumbnail_id integer NOT NULL,
    width integer,
    height integer,
    CONSTRAINT easy_thumbnails_thumbnaildimensions_height_check CHECK ((height >= 0)),
    CONSTRAINT easy_thumbnails_thumbnaildimensions_width_check CHECK ((width >= 0))
);


ALTER TABLE public.easy_thumbnails_thumbnaildimensions OWNER TO djangouser;

--
-- Name: easy_thumbnails_thumbnaildimensions_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.easy_thumbnails_thumbnaildimensions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.easy_thumbnails_thumbnaildimensions_id_seq OWNER TO djangouser;

--
-- Name: easy_thumbnails_thumbnaildimensions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.easy_thumbnails_thumbnaildimensions_id_seq OWNED BY public.easy_thumbnails_thumbnaildimensions.id;


--
-- Name: filer_clipboard; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.filer_clipboard (
    id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.filer_clipboard OWNER TO djangouser;

--
-- Name: filer_clipboard_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.filer_clipboard_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.filer_clipboard_id_seq OWNER TO djangouser;

--
-- Name: filer_clipboard_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.filer_clipboard_id_seq OWNED BY public.filer_clipboard.id;


--
-- Name: filer_clipboarditem; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.filer_clipboarditem (
    id integer NOT NULL,
    clipboard_id integer NOT NULL,
    file_id integer NOT NULL
);


ALTER TABLE public.filer_clipboarditem OWNER TO djangouser;

--
-- Name: filer_clipboarditem_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.filer_clipboarditem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.filer_clipboarditem_id_seq OWNER TO djangouser;

--
-- Name: filer_clipboarditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.filer_clipboarditem_id_seq OWNED BY public.filer_clipboarditem.id;


--
-- Name: filer_file; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.filer_file (
    id integer NOT NULL,
    file character varying(255),
    _file_size bigint,
    sha1 character varying(40) NOT NULL,
    has_all_mandatory_data boolean NOT NULL,
    original_filename character varying(255),
    name character varying(255) NOT NULL,
    description text,
    uploaded_at timestamp with time zone NOT NULL,
    modified_at timestamp with time zone NOT NULL,
    is_public boolean NOT NULL,
    folder_id integer,
    owner_id integer,
    polymorphic_ctype_id integer
);


ALTER TABLE public.filer_file OWNER TO djangouser;

--
-- Name: filer_file_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.filer_file_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.filer_file_id_seq OWNER TO djangouser;

--
-- Name: filer_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.filer_file_id_seq OWNED BY public.filer_file.id;


--
-- Name: filer_folder; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.filer_folder (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    uploaded_at timestamp with time zone NOT NULL,
    created_at timestamp with time zone NOT NULL,
    modified_at timestamp with time zone NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    owner_id integer,
    parent_id integer,
    CONSTRAINT filer_folder_level_check CHECK ((level >= 0)),
    CONSTRAINT filer_folder_lft_check CHECK ((lft >= 0)),
    CONSTRAINT filer_folder_rght_check CHECK ((rght >= 0)),
    CONSTRAINT filer_folder_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.filer_folder OWNER TO djangouser;

--
-- Name: filer_folder_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.filer_folder_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.filer_folder_id_seq OWNER TO djangouser;

--
-- Name: filer_folder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.filer_folder_id_seq OWNED BY public.filer_folder.id;


--
-- Name: filer_folderpermission; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.filer_folderpermission (
    id integer NOT NULL,
    type smallint NOT NULL,
    everybody boolean NOT NULL,
    can_edit smallint,
    can_read smallint,
    can_add_children smallint,
    folder_id integer,
    group_id integer,
    user_id integer
);


ALTER TABLE public.filer_folderpermission OWNER TO djangouser;

--
-- Name: filer_folderpermission_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.filer_folderpermission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.filer_folderpermission_id_seq OWNER TO djangouser;

--
-- Name: filer_folderpermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.filer_folderpermission_id_seq OWNED BY public.filer_folderpermission.id;


--
-- Name: filer_image; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.filer_image (
    file_ptr_id integer NOT NULL,
    _height integer,
    _width integer,
    date_taken timestamp with time zone,
    default_alt_text character varying(255),
    default_caption character varying(255),
    author character varying(255),
    must_always_publish_author_credit boolean NOT NULL,
    must_always_publish_copyright boolean NOT NULL,
    subject_location character varying(64) NOT NULL
);


ALTER TABLE public.filer_image OWNER TO djangouser;

--
-- Name: filer_thumbnailoption; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.filer_thumbnailoption (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    crop boolean NOT NULL,
    upscale boolean NOT NULL
);


ALTER TABLE public.filer_thumbnailoption OWNER TO djangouser;

--
-- Name: filer_thumbnailoption_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.filer_thumbnailoption_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.filer_thumbnailoption_id_seq OWNER TO djangouser;

--
-- Name: filer_thumbnailoption_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.filer_thumbnailoption_id_seq OWNED BY public.filer_thumbnailoption.id;


--
-- Name: menus_cachekey; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.menus_cachekey (
    id integer NOT NULL,
    language character varying(255) NOT NULL,
    site integer NOT NULL,
    key character varying(255) NOT NULL,
    CONSTRAINT menus_cachekey_site_check CHECK ((site >= 0))
);


ALTER TABLE public.menus_cachekey OWNER TO djangouser;

--
-- Name: menus_cachekey_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.menus_cachekey_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menus_cachekey_id_seq OWNER TO djangouser;

--
-- Name: menus_cachekey_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.menus_cachekey_id_seq OWNED BY public.menus_cachekey.id;


--
-- Name: post_office_attachment; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.post_office_attachment (
    id integer NOT NULL,
    file character varying(100) NOT NULL,
    name character varying(255) NOT NULL,
    mimetype character varying(255) NOT NULL,
    headers text
);


ALTER TABLE public.post_office_attachment OWNER TO djangouser;

--
-- Name: post_office_attachment_emails; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.post_office_attachment_emails (
    id integer NOT NULL,
    attachment_id integer NOT NULL,
    email_id integer NOT NULL
);


ALTER TABLE public.post_office_attachment_emails OWNER TO djangouser;

--
-- Name: post_office_attachment_emails_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.post_office_attachment_emails_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_office_attachment_emails_id_seq OWNER TO djangouser;

--
-- Name: post_office_attachment_emails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.post_office_attachment_emails_id_seq OWNED BY public.post_office_attachment_emails.id;


--
-- Name: post_office_attachment_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.post_office_attachment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_office_attachment_id_seq OWNER TO djangouser;

--
-- Name: post_office_attachment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.post_office_attachment_id_seq OWNED BY public.post_office_attachment.id;


--
-- Name: post_office_email; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.post_office_email (
    id integer NOT NULL,
    from_email character varying(254) NOT NULL,
    "to" text NOT NULL,
    cc text NOT NULL,
    bcc text NOT NULL,
    subject character varying(989) NOT NULL,
    message text NOT NULL,
    html_message text NOT NULL,
    status smallint,
    priority smallint,
    created timestamp with time zone NOT NULL,
    last_updated timestamp with time zone NOT NULL,
    scheduled_time timestamp with time zone,
    headers text,
    context text,
    template_id integer,
    backend_alias character varying(64) NOT NULL,
    CONSTRAINT post_office_email_priority_check CHECK ((priority >= 0)),
    CONSTRAINT post_office_email_status_check CHECK ((status >= 0))
);


ALTER TABLE public.post_office_email OWNER TO djangouser;

--
-- Name: post_office_email_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.post_office_email_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_office_email_id_seq OWNER TO djangouser;

--
-- Name: post_office_email_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.post_office_email_id_seq OWNED BY public.post_office_email.id;


--
-- Name: post_office_emailtemplate; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.post_office_emailtemplate (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL,
    subject character varying(255) NOT NULL,
    content text NOT NULL,
    html_content text NOT NULL,
    created timestamp with time zone NOT NULL,
    last_updated timestamp with time zone NOT NULL,
    default_template_id integer,
    language character varying(12) NOT NULL
);


ALTER TABLE public.post_office_emailtemplate OWNER TO djangouser;

--
-- Name: post_office_emailtemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.post_office_emailtemplate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_office_emailtemplate_id_seq OWNER TO djangouser;

--
-- Name: post_office_emailtemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.post_office_emailtemplate_id_seq OWNED BY public.post_office_emailtemplate.id;


--
-- Name: post_office_log; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.post_office_log (
    id integer NOT NULL,
    date timestamp with time zone NOT NULL,
    status smallint NOT NULL,
    exception_type character varying(255) NOT NULL,
    message text NOT NULL,
    email_id integer NOT NULL,
    CONSTRAINT post_office_log_status_check CHECK ((status >= 0))
);


ALTER TABLE public.post_office_log OWNER TO djangouser;

--
-- Name: post_office_log_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.post_office_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_office_log_id_seq OWNER TO djangouser;

--
-- Name: post_office_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.post_office_log_id_seq OWNED BY public.post_office_log.id;


--
-- Name: shop_notification; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.shop_notification (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    transition_target character varying(50) NOT NULL,
    recipient_id integer,
    mail_template_id integer NOT NULL,
    notify smallint NOT NULL,
    CONSTRAINT shop_notification_notify_check CHECK ((notify >= 0))
);


ALTER TABLE public.shop_notification OWNER TO djangouser;

--
-- Name: shop_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.shop_notification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_notification_id_seq OWNER TO djangouser;

--
-- Name: shop_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.shop_notification_id_seq OWNED BY public.shop_notification.id;


--
-- Name: shop_notificationattachment; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.shop_notificationattachment (
    id integer NOT NULL,
    attachment_id integer,
    notification_id integer NOT NULL
);


ALTER TABLE public.shop_notificationattachment OWNER TO djangouser;

--
-- Name: shop_notificationattachment_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.shop_notificationattachment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_notificationattachment_id_seq OWNER TO djangouser;

--
-- Name: shop_notificationattachment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.shop_notificationattachment_id_seq OWNED BY public.shop_notificationattachment.id;


--
-- Name: weltladen_billingaddress; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.weltladen_billingaddress (
    id integer NOT NULL,
    priority smallint NOT NULL,
    name character varying(1024) NOT NULL,
    address1 character varying(1024) NOT NULL,
    address2 character varying(1024),
    zip_code character varying(12) NOT NULL,
    city character varying(1024) NOT NULL,
    country character varying(3) NOT NULL,
    customer_id integer NOT NULL
);


ALTER TABLE public.weltladen_billingaddress OWNER TO djangouser;

--
-- Name: weltladen_billingaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.weltladen_billingaddress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.weltladen_billingaddress_id_seq OWNER TO djangouser;

--
-- Name: weltladen_billingaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.weltladen_billingaddress_id_seq OWNED BY public.weltladen_billingaddress.id;


--
-- Name: weltladen_cart; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.weltladen_cart (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    extra jsonb NOT NULL,
    billing_address_id integer,
    customer_id integer NOT NULL,
    shipping_address_id integer
);


ALTER TABLE public.weltladen_cart OWNER TO djangouser;

--
-- Name: weltladen_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.weltladen_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.weltladen_cart_id_seq OWNER TO djangouser;

--
-- Name: weltladen_cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.weltladen_cart_id_seq OWNED BY public.weltladen_cart.id;


--
-- Name: weltladen_cartitem; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.weltladen_cartitem (
    id integer NOT NULL,
    product_code character varying(255),
    updated_at timestamp with time zone NOT NULL,
    extra jsonb NOT NULL,
    quantity integer NOT NULL,
    cart_id integer NOT NULL,
    product_id integer NOT NULL,
    CONSTRAINT weltladen_cartitem_quantity_check CHECK ((quantity >= 0))
);


ALTER TABLE public.weltladen_cartitem OWNER TO djangouser;

--
-- Name: weltladen_cartitem_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.weltladen_cartitem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.weltladen_cartitem_id_seq OWNER TO djangouser;

--
-- Name: weltladen_cartitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.weltladen_cartitem_id_seq OWNED BY public.weltladen_cartitem.id;


--
-- Name: weltladen_delivery; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.weltladen_delivery (
    id integer NOT NULL,
    shipping_id character varying(255),
    fulfilled_at timestamp with time zone,
    shipped_at timestamp with time zone,
    shipping_method character varying(50) NOT NULL,
    order_id integer NOT NULL
);


ALTER TABLE public.weltladen_delivery OWNER TO djangouser;

--
-- Name: weltladen_delivery_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.weltladen_delivery_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.weltladen_delivery_id_seq OWNER TO djangouser;

--
-- Name: weltladen_delivery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.weltladen_delivery_id_seq OWNED BY public.weltladen_delivery.id;


--
-- Name: weltladen_deliveryitem; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.weltladen_deliveryitem (
    id integer NOT NULL,
    quantity integer NOT NULL,
    delivery_id integer NOT NULL,
    item_id integer NOT NULL
);


ALTER TABLE public.weltladen_deliveryitem OWNER TO djangouser;

--
-- Name: weltladen_deliveryitem_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.weltladen_deliveryitem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.weltladen_deliveryitem_id_seq OWNER TO djangouser;

--
-- Name: weltladen_deliveryitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.weltladen_deliveryitem_id_seq OWNED BY public.weltladen_deliveryitem.id;


--
-- Name: weltladen_locations; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.weltladen_locations (
    id integer NOT NULL,
    zip_code character varying(12) NOT NULL,
    city character varying(1024) NOT NULL,
    country character varying(25) NOT NULL,
    distance integer NOT NULL,
    CONSTRAINT weltladen_locations_distance_check CHECK ((distance >= 0))
);


ALTER TABLE public.weltladen_locations OWNER TO djangouser;

--
-- Name: weltladen_locations_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.weltladen_locations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.weltladen_locations_id_seq OWNER TO djangouser;

--
-- Name: weltladen_locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.weltladen_locations_id_seq OWNED BY public.weltladen_locations.id;


--
-- Name: weltladen_manufacturer; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.weltladen_manufacturer (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.weltladen_manufacturer OWNER TO djangouser;

--
-- Name: weltladen_manufacturer_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.weltladen_manufacturer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.weltladen_manufacturer_id_seq OWNER TO djangouser;

--
-- Name: weltladen_manufacturer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.weltladen_manufacturer_id_seq OWNED BY public.weltladen_manufacturer.id;


--
-- Name: weltladen_order; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.weltladen_order (
    id integer NOT NULL,
    status character varying(50) NOT NULL,
    currency character varying(7) NOT NULL,
    _subtotal numeric(30,2) NOT NULL,
    _total numeric(30,2) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    extra jsonb NOT NULL,
    stored_request jsonb NOT NULL,
    number integer,
    shipping_address_text text,
    billing_address_text text,
    token character varying(40),
    customer_id integer NOT NULL,
    CONSTRAINT weltladen_order_number_check CHECK ((number >= 0))
);


ALTER TABLE public.weltladen_order OWNER TO djangouser;

--
-- Name: weltladen_order_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.weltladen_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.weltladen_order_id_seq OWNER TO djangouser;

--
-- Name: weltladen_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.weltladen_order_id_seq OWNED BY public.weltladen_order.id;


--
-- Name: weltladen_orderitem; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.weltladen_orderitem (
    id integer NOT NULL,
    product_name character varying(255),
    product_code character varying(255),
    _unit_price numeric(30,2),
    _line_total numeric(30,2),
    extra jsonb NOT NULL,
    quantity integer NOT NULL,
    canceled boolean NOT NULL,
    order_id integer NOT NULL,
    product_id integer,
    CONSTRAINT weltladen_orderitem_quantity_check CHECK ((quantity >= 0))
);


ALTER TABLE public.weltladen_orderitem OWNER TO djangouser;

--
-- Name: weltladen_orderitem_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.weltladen_orderitem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.weltladen_orderitem_id_seq OWNER TO djangouser;

--
-- Name: weltladen_orderitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.weltladen_orderitem_id_seq OWNED BY public.weltladen_orderitem.id;


--
-- Name: weltladen_orderpayment; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.weltladen_orderpayment (
    id integer NOT NULL,
    amount numeric(30,2) NOT NULL,
    transaction_id character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    payment_method character varying(50) NOT NULL,
    order_id integer NOT NULL
);


ALTER TABLE public.weltladen_orderpayment OWNER TO djangouser;

--
-- Name: weltladen_orderpayment_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.weltladen_orderpayment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.weltladen_orderpayment_id_seq OWNER TO djangouser;

--
-- Name: weltladen_orderpayment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.weltladen_orderpayment_id_seq OWNED BY public.weltladen_orderpayment.id;


--
-- Name: weltladen_productimage; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.weltladen_productimage (
    id integer NOT NULL,
    "order" smallint NOT NULL,
    image_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.weltladen_productimage OWNER TO djangouser;

--
-- Name: weltladen_productimage_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.weltladen_productimage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.weltladen_productimage_id_seq OWNER TO djangouser;

--
-- Name: weltladen_productimage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.weltladen_productimage_id_seq OWNED BY public.weltladen_productimage.id;


--
-- Name: weltladen_productpage; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.weltladen_productpage (
    id integer NOT NULL,
    page_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.weltladen_productpage OWNER TO djangouser;

--
-- Name: weltladen_productpage_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.weltladen_productpage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.weltladen_productpage_id_seq OWNER TO djangouser;

--
-- Name: weltladen_productpage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.weltladen_productpage_id_seq OWNED BY public.weltladen_productpage.id;


--
-- Name: weltladen_shippingaddress; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.weltladen_shippingaddress (
    id integer NOT NULL,
    priority smallint NOT NULL,
    name character varying(1024) NOT NULL,
    address1 character varying(1024) NOT NULL,
    address2 character varying(1024),
    zip_code character varying(12) NOT NULL,
    city character varying(1024) NOT NULL,
    country character varying(3) NOT NULL,
    customer_id integer NOT NULL
);


ALTER TABLE public.weltladen_shippingaddress OWNER TO djangouser;

--
-- Name: weltladen_shippingaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.weltladen_shippingaddress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.weltladen_shippingaddress_id_seq OWNER TO djangouser;

--
-- Name: weltladen_shippingaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.weltladen_shippingaddress_id_seq OWNED BY public.weltladen_shippingaddress.id;


--
-- Name: weltladen_supplier; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.weltladen_supplier (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.weltladen_supplier OWNER TO djangouser;

--
-- Name: weltladen_supplier_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.weltladen_supplier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.weltladen_supplier_id_seq OWNER TO djangouser;

--
-- Name: weltladen_supplier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.weltladen_supplier_id_seq OWNED BY public.weltladen_supplier.id;


--
-- Name: weltladen_weltladencustomer; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.weltladen_weltladencustomer (
    user_id integer NOT NULL,
    recognized smallint NOT NULL,
    last_access timestamp with time zone NOT NULL,
    extra jsonb NOT NULL,
    number integer,
    phonenumber character varying(128),
    salutation character varying(5) NOT NULL,
    CONSTRAINT weltladen_weltladencustomer_number_check CHECK ((number >= 0)),
    CONSTRAINT weltladen_weltladencustomer_recognized_check CHECK ((recognized >= 0))
);


ALTER TABLE public.weltladen_weltladencustomer OWNER TO djangouser;

--
-- Name: weltladen_weltladenproduct; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.weltladen_weltladenproduct (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    active boolean NOT NULL,
    product_name character varying(255) NOT NULL,
    slug character varying(50) NOT NULL,
    country_of_origin character varying(3) NOT NULL,
    "order" integer NOT NULL,
    unit_price numeric(30,3) NOT NULL,
    product_code character varying(255) NOT NULL,
    manufacturer_id integer NOT NULL,
    polymorphic_ctype_id integer,
    supplier_id integer NOT NULL,
    tax_switch boolean NOT NULL,
    vegan boolean NOT NULL,
    CONSTRAINT weltladen_weltladenproduct_order_check CHECK (("order" >= 0))
);


ALTER TABLE public.weltladen_weltladenproduct OWNER TO djangouser;

--
-- Name: weltladen_weltladenproduct_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.weltladen_weltladenproduct_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.weltladen_weltladenproduct_id_seq OWNER TO djangouser;

--
-- Name: weltladen_weltladenproduct_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.weltladen_weltladenproduct_id_seq OWNED BY public.weltladen_weltladenproduct.id;


--
-- Name: weltladen_weltladenproducttranslation; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.weltladen_weltladenproducttranslation (
    id integer NOT NULL,
    language_code character varying(15) NOT NULL,
    caption text NOT NULL,
    short_description text NOT NULL,
    description text NOT NULL,
    master_id integer
);


ALTER TABLE public.weltladen_weltladenproducttranslation OWNER TO djangouser;

--
-- Name: weltladen_weltladenproducttranslation_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.weltladen_weltladenproducttranslation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.weltladen_weltladenproducttranslation_id_seq OWNER TO djangouser;

--
-- Name: weltladen_weltladenproducttranslation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.weltladen_weltladenproducttranslation_id_seq OWNED BY public.weltladen_weltladenproducttranslation.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: cms_cmsplugin id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_cmsplugin ALTER COLUMN id SET DEFAULT nextval('public.cms_cmsplugin_id_seq'::regclass);


--
-- Name: cms_globalpagepermission id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_globalpagepermission ALTER COLUMN id SET DEFAULT nextval('public.cms_globalpagepermission_id_seq'::regclass);


--
-- Name: cms_globalpagepermission_sites id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_globalpagepermission_sites ALTER COLUMN id SET DEFAULT nextval('public.cms_globalpagepermission_sites_id_seq'::regclass);


--
-- Name: cms_page id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_page ALTER COLUMN id SET DEFAULT nextval('public.cms_page_id_seq'::regclass);


--
-- Name: cms_page_placeholders id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_page_placeholders ALTER COLUMN id SET DEFAULT nextval('public.cms_page_placeholders_id_seq'::regclass);


--
-- Name: cms_pagepermission id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_pagepermission ALTER COLUMN id SET DEFAULT nextval('public.cms_pagepermission_id_seq'::regclass);


--
-- Name: cms_placeholder id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_placeholder ALTER COLUMN id SET DEFAULT nextval('public.cms_placeholder_id_seq'::regclass);


--
-- Name: cms_staticplaceholder id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_staticplaceholder ALTER COLUMN id SET DEFAULT nextval('public.cms_staticplaceholder_id_seq'::regclass);


--
-- Name: cms_title id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_title ALTER COLUMN id SET DEFAULT nextval('public.cms_title_id_seq'::regclass);


--
-- Name: cms_treenode id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_treenode ALTER COLUMN id SET DEFAULT nextval('public.cms_treenode_id_seq'::regclass);


--
-- Name: cms_urlconfrevision id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_urlconfrevision ALTER COLUMN id SET DEFAULT nextval('public.cms_urlconfrevision_id_seq'::regclass);


--
-- Name: cms_usersettings id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_usersettings ALTER COLUMN id SET DEFAULT nextval('public.cms_usersettings_id_seq'::regclass);


--
-- Name: cmsplugin_cascade_cascadeclipboard id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cmsplugin_cascade_cascadeclipboard ALTER COLUMN id SET DEFAULT nextval('public.cmsplugin_cascade_cascadeclipboard_id_seq'::regclass);


--
-- Name: cmsplugin_cascade_iconfont id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cmsplugin_cascade_iconfont ALTER COLUMN id SET DEFAULT nextval('public.cmsplugin_cascade_iconfont_id_seq'::regclass);


--
-- Name: cmsplugin_cascade_inline id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cmsplugin_cascade_inline ALTER COLUMN id SET DEFAULT nextval('public.cmsplugin_cascade_inline_id_seq'::regclass);


--
-- Name: cmsplugin_cascade_page id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cmsplugin_cascade_page ALTER COLUMN id SET DEFAULT nextval('public.cmsplugin_cascade_page_id_seq'::regclass);


--
-- Name: cmsplugin_cascade_pluginextrafields id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cmsplugin_cascade_pluginextrafields ALTER COLUMN id SET DEFAULT nextval('public.cmsplugin_cascade_pluginextrafields_id_seq'::regclass);


--
-- Name: cmsplugin_cascade_sharedglossary id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cmsplugin_cascade_sharedglossary ALTER COLUMN id SET DEFAULT nextval('public.cmsplugin_cascade_sharedglossary_id_seq'::regclass);


--
-- Name: cmsplugin_cascade_sortinline id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cmsplugin_cascade_sortinline ALTER COLUMN id SET DEFAULT nextval('public.cmsplugin_cascade_sortinline_id_seq'::regclass);


--
-- Name: cmsplugin_cascade_texteditorconfigfields id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cmsplugin_cascade_texteditorconfigfields ALTER COLUMN id SET DEFAULT nextval('public.cmsplugin_cascade_texteditorconfigfields_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: easy_thumbnails_source id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.easy_thumbnails_source ALTER COLUMN id SET DEFAULT nextval('public.easy_thumbnails_source_id_seq'::regclass);


--
-- Name: easy_thumbnails_thumbnail id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.easy_thumbnails_thumbnail ALTER COLUMN id SET DEFAULT nextval('public.easy_thumbnails_thumbnail_id_seq'::regclass);


--
-- Name: easy_thumbnails_thumbnaildimensions id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.easy_thumbnails_thumbnaildimensions ALTER COLUMN id SET DEFAULT nextval('public.easy_thumbnails_thumbnaildimensions_id_seq'::regclass);


--
-- Name: filer_clipboard id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.filer_clipboard ALTER COLUMN id SET DEFAULT nextval('public.filer_clipboard_id_seq'::regclass);


--
-- Name: filer_clipboarditem id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.filer_clipboarditem ALTER COLUMN id SET DEFAULT nextval('public.filer_clipboarditem_id_seq'::regclass);


--
-- Name: filer_file id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.filer_file ALTER COLUMN id SET DEFAULT nextval('public.filer_file_id_seq'::regclass);


--
-- Name: filer_folder id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.filer_folder ALTER COLUMN id SET DEFAULT nextval('public.filer_folder_id_seq'::regclass);


--
-- Name: filer_folderpermission id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.filer_folderpermission ALTER COLUMN id SET DEFAULT nextval('public.filer_folderpermission_id_seq'::regclass);


--
-- Name: filer_thumbnailoption id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.filer_thumbnailoption ALTER COLUMN id SET DEFAULT nextval('public.filer_thumbnailoption_id_seq'::regclass);


--
-- Name: menus_cachekey id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.menus_cachekey ALTER COLUMN id SET DEFAULT nextval('public.menus_cachekey_id_seq'::regclass);


--
-- Name: post_office_attachment id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.post_office_attachment ALTER COLUMN id SET DEFAULT nextval('public.post_office_attachment_id_seq'::regclass);


--
-- Name: post_office_attachment_emails id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.post_office_attachment_emails ALTER COLUMN id SET DEFAULT nextval('public.post_office_attachment_emails_id_seq'::regclass);


--
-- Name: post_office_email id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.post_office_email ALTER COLUMN id SET DEFAULT nextval('public.post_office_email_id_seq'::regclass);


--
-- Name: post_office_emailtemplate id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.post_office_emailtemplate ALTER COLUMN id SET DEFAULT nextval('public.post_office_emailtemplate_id_seq'::regclass);


--
-- Name: post_office_log id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.post_office_log ALTER COLUMN id SET DEFAULT nextval('public.post_office_log_id_seq'::regclass);


--
-- Name: shop_notification id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.shop_notification ALTER COLUMN id SET DEFAULT nextval('public.shop_notification_id_seq'::regclass);


--
-- Name: shop_notificationattachment id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.shop_notificationattachment ALTER COLUMN id SET DEFAULT nextval('public.shop_notificationattachment_id_seq'::regclass);


--
-- Name: weltladen_billingaddress id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_billingaddress ALTER COLUMN id SET DEFAULT nextval('public.weltladen_billingaddress_id_seq'::regclass);


--
-- Name: weltladen_cart id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_cart ALTER COLUMN id SET DEFAULT nextval('public.weltladen_cart_id_seq'::regclass);


--
-- Name: weltladen_cartitem id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_cartitem ALTER COLUMN id SET DEFAULT nextval('public.weltladen_cartitem_id_seq'::regclass);


--
-- Name: weltladen_delivery id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_delivery ALTER COLUMN id SET DEFAULT nextval('public.weltladen_delivery_id_seq'::regclass);


--
-- Name: weltladen_deliveryitem id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_deliveryitem ALTER COLUMN id SET DEFAULT nextval('public.weltladen_deliveryitem_id_seq'::regclass);


--
-- Name: weltladen_locations id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_locations ALTER COLUMN id SET DEFAULT nextval('public.weltladen_locations_id_seq'::regclass);


--
-- Name: weltladen_manufacturer id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_manufacturer ALTER COLUMN id SET DEFAULT nextval('public.weltladen_manufacturer_id_seq'::regclass);


--
-- Name: weltladen_order id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_order ALTER COLUMN id SET DEFAULT nextval('public.weltladen_order_id_seq'::regclass);


--
-- Name: weltladen_orderitem id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_orderitem ALTER COLUMN id SET DEFAULT nextval('public.weltladen_orderitem_id_seq'::regclass);


--
-- Name: weltladen_orderpayment id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_orderpayment ALTER COLUMN id SET DEFAULT nextval('public.weltladen_orderpayment_id_seq'::regclass);


--
-- Name: weltladen_productimage id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_productimage ALTER COLUMN id SET DEFAULT nextval('public.weltladen_productimage_id_seq'::regclass);


--
-- Name: weltladen_productpage id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_productpage ALTER COLUMN id SET DEFAULT nextval('public.weltladen_productpage_id_seq'::regclass);


--
-- Name: weltladen_shippingaddress id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_shippingaddress ALTER COLUMN id SET DEFAULT nextval('public.weltladen_shippingaddress_id_seq'::regclass);


--
-- Name: weltladen_supplier id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_supplier ALTER COLUMN id SET DEFAULT nextval('public.weltladen_supplier_id_seq'::regclass);


--
-- Name: weltladen_weltladenproduct id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_weltladenproduct ALTER COLUMN id SET DEFAULT nextval('public.weltladen_weltladenproduct_id_seq'::regclass);


--
-- Name: weltladen_weltladenproducttranslation id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_weltladenproducttranslation ALTER COLUMN id SET DEFAULT nextval('public.weltladen_weltladenproducttranslation_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can use Structure mode	1	use_structure
2	Can change page	2	change_page
3	Can add permission	3	add_permission
4	Can change permission	3	change_permission
5	Can delete permission	3	delete_permission
6	Can view permission	3	view_permission
7	Can add group	4	add_group
8	Can change group	4	change_group
9	Can delete group	4	delete_group
10	Can view group	4	view_group
11	Can add Customer	5	add_user
12	Can change Customer	5	change_user
13	Can delete Customer	5	delete_user
14	Can view Customer	5	view_user
15	Can add content type	6	add_contenttype
16	Can change content type	6	change_contenttype
17	Can delete content type	6	delete_contenttype
18	Can view content type	6	view_contenttype
19	Can add session	7	add_session
20	Can change session	7	change_session
21	Can delete session	7	delete_session
22	Can view session	7	view_session
23	Can add site	8	add_site
24	Can change site	8	change_site
25	Can delete site	8	delete_site
26	Can view site	8	view_site
27	Can add log entry	9	add_logentry
28	Can change log entry	9	change_logentry
29	Can delete log entry	9	delete_logentry
30	Can view log entry	9	view_logentry
31	Can add text	10	add_text
32	Can change text	10	change_text
33	Can delete text	10	delete_text
34	Can view text	10	view_text
35	Can add Element	11	add_cascadeelement
36	Can change Element	11	change_cascadeelement
37	Can delete Element	11	delete_cascadeelement
38	Can view Element	11	view_cascadeelement
39	Can add Custom CSS classes and styles	12	add_pluginextrafields
40	Can change Custom CSS classes and styles	12	change_pluginextrafields
41	Can delete Custom CSS classes and styles	12	delete_pluginextrafields
42	Can view Custom CSS classes and styles	12	view_pluginextrafields
43	Can add Shared between Plugins	13	add_sharedglossary
44	Can change Shared between Plugins	13	change_sharedglossary
45	Can delete Shared between Plugins	13	delete_sharedglossary
46	Can view Shared between Plugins	13	view_sharedglossary
47	Can add Segmentation	14	add_segmentation
48	Can change Segmentation	14	change_segmentation
49	Can delete Segmentation	14	delete_segmentation
50	Can view Segmentation	14	view_segmentation
51	Can add inline cascade element	15	add_inlinecascadeelement
52	Can change inline cascade element	15	change_inlinecascadeelement
53	Can delete inline cascade element	15	delete_inlinecascadeelement
54	Can view inline cascade element	15	view_inlinecascadeelement
55	Can add Persisted Clipboard Content	16	add_cascadeclipboard
56	Can change Persisted Clipboard Content	16	change_cascadeclipboard
57	Can delete Persisted Clipboard Content	16	delete_cascadeclipboard
58	Can view Persisted Clipboard Content	16	view_cascadeclipboard
59	Can add sortable inline cascade element	17	add_sortableinlinecascadeelement
60	Can change sortable inline cascade element	17	change_sortableinlinecascadeelement
61	Can delete sortable inline cascade element	17	delete_sortableinlinecascadeelement
62	Can view sortable inline cascade element	17	view_sortableinlinecascadeelement
63	Can add Cascade Page Settings	18	add_cascadepage
64	Can change Cascade Page Settings	18	change_cascadepage
65	Can delete Cascade Page Settings	18	delete_cascadepage
66	Can view Cascade Page Settings	18	view_cascadepage
67	Can add sharable cascade element	19	add_sharablecascadeelement
68	Can change sharable cascade element	19	change_sharablecascadeelement
69	Can delete sharable cascade element	19	delete_sharablecascadeelement
70	Can view sharable cascade element	19	view_sharablecascadeelement
71	Can add Uploaded Icon Font	20	add_iconfont
72	Can change Uploaded Icon Font	20	change_iconfont
73	Can delete Uploaded Icon Font	20	delete_iconfont
74	Can view Uploaded Icon Font	20	view_iconfont
75	Can add bootstrap accordion group plugin model	21	add_bootstrapaccordiongrouppluginmodel
76	Can change bootstrap accordion group plugin model	21	change_bootstrapaccordiongrouppluginmodel
77	Can delete bootstrap accordion group plugin model	21	delete_bootstrapaccordiongrouppluginmodel
78	Can view bootstrap accordion group plugin model	21	view_bootstrapaccordiongrouppluginmodel
79	Can add bootstrap accordion plugin model	22	add_bootstrapaccordionpluginmodel
80	Can change bootstrap accordion plugin model	22	change_bootstrapaccordionpluginmodel
81	Can delete bootstrap accordion plugin model	22	delete_bootstrapaccordionpluginmodel
82	Can view bootstrap accordion plugin model	22	view_bootstrapaccordionpluginmodel
83	Can add bootstrap button plugin model	23	add_bootstrapbuttonpluginmodel
84	Can change bootstrap button plugin model	23	change_bootstrapbuttonpluginmodel
85	Can delete bootstrap button plugin model	23	delete_bootstrapbuttonpluginmodel
86	Can view bootstrap button plugin model	23	view_bootstrapbuttonpluginmodel
87	Can add bootstrap card body plugin model	24	add_bootstrapcardbodypluginmodel
88	Can change bootstrap card body plugin model	24	change_bootstrapcardbodypluginmodel
89	Can delete bootstrap card body plugin model	24	delete_bootstrapcardbodypluginmodel
90	Can view bootstrap card body plugin model	24	view_bootstrapcardbodypluginmodel
91	Can add bootstrap card footer plugin model	25	add_bootstrapcardfooterpluginmodel
92	Can change bootstrap card footer plugin model	25	change_bootstrapcardfooterpluginmodel
93	Can delete bootstrap card footer plugin model	25	delete_bootstrapcardfooterpluginmodel
94	Can view bootstrap card footer plugin model	25	view_bootstrapcardfooterpluginmodel
95	Can add bootstrap card header plugin model	26	add_bootstrapcardheaderpluginmodel
96	Can change bootstrap card header plugin model	26	change_bootstrapcardheaderpluginmodel
97	Can delete bootstrap card header plugin model	26	delete_bootstrapcardheaderpluginmodel
98	Can view bootstrap card header plugin model	26	view_bootstrapcardheaderpluginmodel
99	Can add bootstrap card plugin model	27	add_bootstrapcardpluginmodel
100	Can change bootstrap card plugin model	27	change_bootstrapcardpluginmodel
101	Can delete bootstrap card plugin model	27	delete_bootstrapcardpluginmodel
102	Can view bootstrap card plugin model	27	view_bootstrapcardpluginmodel
103	Can add bootstrap carousel plugin model	28	add_bootstrapcarouselpluginmodel
104	Can change bootstrap carousel plugin model	28	change_bootstrapcarouselpluginmodel
105	Can delete bootstrap carousel plugin model	28	delete_bootstrapcarouselpluginmodel
106	Can view bootstrap carousel plugin model	28	view_bootstrapcarouselpluginmodel
107	Can add bootstrap carousel slide plugin model	29	add_bootstrapcarouselslidepluginmodel
108	Can change bootstrap carousel slide plugin model	29	change_bootstrapcarouselslidepluginmodel
109	Can delete bootstrap carousel slide plugin model	29	delete_bootstrapcarouselslidepluginmodel
110	Can view bootstrap carousel slide plugin model	29	view_bootstrapcarouselslidepluginmodel
111	Can add bootstrap column plugin model	30	add_bootstrapcolumnpluginmodel
112	Can change bootstrap column plugin model	30	change_bootstrapcolumnpluginmodel
113	Can delete bootstrap column plugin model	30	delete_bootstrapcolumnpluginmodel
114	Can view bootstrap column plugin model	30	view_bootstrapcolumnpluginmodel
115	Can add bootstrap container plugin model	31	add_bootstrapcontainerpluginmodel
116	Can change bootstrap container plugin model	31	change_bootstrapcontainerpluginmodel
117	Can delete bootstrap container plugin model	31	delete_bootstrapcontainerpluginmodel
118	Can view bootstrap container plugin model	31	view_bootstrapcontainerpluginmodel
119	Can add bootstrap image plugin model	32	add_bootstrapimagepluginmodel
120	Can change bootstrap image plugin model	32	change_bootstrapimagepluginmodel
121	Can delete bootstrap image plugin model	32	delete_bootstrapimagepluginmodel
122	Can view bootstrap image plugin model	32	view_bootstrapimagepluginmodel
123	Can add bootstrap jumbotron plugin model	33	add_bootstrapjumbotronpluginmodel
124	Can change bootstrap jumbotron plugin model	33	change_bootstrapjumbotronpluginmodel
125	Can delete bootstrap jumbotron plugin model	33	delete_bootstrapjumbotronpluginmodel
126	Can view bootstrap jumbotron plugin model	33	view_bootstrapjumbotronpluginmodel
127	Can add bootstrap picture plugin model	34	add_bootstrappicturepluginmodel
128	Can change bootstrap picture plugin model	34	change_bootstrappicturepluginmodel
129	Can delete bootstrap picture plugin model	34	delete_bootstrappicturepluginmodel
130	Can view bootstrap picture plugin model	34	view_bootstrappicturepluginmodel
131	Can add bootstrap plugin base model	35	add_bootstrappluginbasemodel
132	Can change bootstrap plugin base model	35	change_bootstrappluginbasemodel
133	Can delete bootstrap plugin base model	35	delete_bootstrappluginbasemodel
134	Can view bootstrap plugin base model	35	view_bootstrappluginbasemodel
135	Can add bootstrap row plugin model	36	add_bootstraprowpluginmodel
136	Can change bootstrap row plugin model	36	change_bootstraprowpluginmodel
137	Can delete bootstrap row plugin model	36	delete_bootstraprowpluginmodel
138	Can view bootstrap row plugin model	36	view_bootstraprowpluginmodel
139	Can add bootstrap secondary menu plugin model	37	add_bootstrapsecondarymenupluginmodel
140	Can change bootstrap secondary menu plugin model	37	change_bootstrapsecondarymenupluginmodel
141	Can delete bootstrap secondary menu plugin model	37	delete_bootstrapsecondarymenupluginmodel
142	Can view bootstrap secondary menu plugin model	37	view_bootstrapsecondarymenupluginmodel
143	Can add bootstrap tab pane plugin model	38	add_bootstraptabpanepluginmodel
144	Can change bootstrap tab pane plugin model	38	change_bootstraptabpanepluginmodel
145	Can delete bootstrap tab pane plugin model	38	delete_bootstraptabpanepluginmodel
146	Can view bootstrap tab pane plugin model	38	view_bootstraptabpanepluginmodel
147	Can add bootstrap tab set plugin model	39	add_bootstraptabsetpluginmodel
148	Can change bootstrap tab set plugin model	39	change_bootstraptabsetpluginmodel
149	Can delete bootstrap tab set plugin model	39	delete_bootstraptabsetpluginmodel
150	Can view bootstrap tab set plugin model	39	view_bootstraptabsetpluginmodel
151	Can add bootstrap youtube plugin model	40	add_bootstrapyoutubepluginmodel
152	Can change bootstrap youtube plugin model	40	change_bootstrapyoutubepluginmodel
153	Can delete bootstrap youtube plugin model	40	delete_bootstrapyoutubepluginmodel
154	Can view bootstrap youtube plugin model	40	view_bootstrapyoutubepluginmodel
155	Can add breadcrumb plugin model	41	add_breadcrumbpluginmodel
156	Can change breadcrumb plugin model	41	change_breadcrumbpluginmodel
157	Can delete breadcrumb plugin model	41	delete_breadcrumbpluginmodel
158	Can view breadcrumb plugin model	41	view_breadcrumbpluginmodel
159	Can add card child base model	42	add_cardchildbasemodel
160	Can change card child base model	42	change_cardchildbasemodel
161	Can delete card child base model	42	delete_cardchildbasemodel
162	Can view card child base model	42	view_cardchildbasemodel
163	Can add cascade plugin base model	43	add_cascadepluginbasemodel
164	Can change cascade plugin base model	43	change_cascadepluginbasemodel
165	Can delete cascade plugin base model	43	delete_cascadepluginbasemodel
166	Can view cascade plugin base model	43	view_cascadepluginbasemodel
167	Can add catalog link plugin base model	44	add_cataloglinkpluginbasemodel
168	Can change catalog link plugin base model	44	change_cataloglinkpluginbasemodel
169	Can delete catalog link plugin base model	44	delete_cataloglinkpluginbasemodel
170	Can view catalog link plugin base model	44	view_cataloglinkpluginbasemodel
171	Can add checkout address plugin model	45	add_checkoutaddresspluginmodel
172	Can change checkout address plugin model	45	change_checkoutaddresspluginmodel
173	Can delete checkout address plugin model	45	delete_checkoutaddresspluginmodel
174	Can view checkout address plugin model	45	view_checkoutaddresspluginmodel
175	Can add custom snippet plugin model	46	add_customsnippetpluginmodel
176	Can change custom snippet plugin model	46	change_customsnippetpluginmodel
177	Can delete custom snippet plugin model	46	delete_customsnippetpluginmodel
178	Can view custom snippet plugin model	46	view_customsnippetpluginmodel
179	Can add customer form plugin base model	47	add_customerformpluginbasemodel
180	Can change customer form plugin base model	47	change_customerformpluginbasemodel
181	Can delete customer form plugin base model	47	delete_customerformpluginbasemodel
182	Can view customer form plugin base model	47	view_customerformpluginbasemodel
183	Can add customer form plugin model	48	add_customerformpluginmodel
184	Can change customer form plugin model	48	change_customerformpluginmodel
185	Can delete customer form plugin model	48	delete_customerformpluginmodel
186	Can view customer form plugin model	48	view_customerformpluginmodel
187	Can add default link plugin base model	49	add_defaultlinkpluginbasemodel
188	Can change default link plugin base model	49	change_defaultlinkpluginbasemodel
189	Can delete default link plugin base model	49	delete_defaultlinkpluginbasemodel
190	Can view default link plugin base model	49	view_defaultlinkpluginbasemodel
191	Can add dialog form plugin base model	50	add_dialogformpluginbasemodel
192	Can change dialog form plugin base model	50	change_dialogformpluginbasemodel
193	Can delete dialog form plugin base model	50	delete_dialogformpluginbasemodel
194	Can view dialog form plugin base model	50	view_dialogformpluginbasemodel
195	Can add extra annotation form plugin model	51	add_extraannotationformpluginmodel
196	Can change extra annotation form plugin model	51	change_extraannotationformpluginmodel
197	Can delete extra annotation form plugin model	51	delete_extraannotationformpluginmodel
198	Can view extra annotation form plugin model	51	view_extraannotationformpluginmodel
199	Can add framed icon plugin model	52	add_framediconpluginmodel
200	Can change framed icon plugin model	52	change_framediconpluginmodel
201	Can delete framed icon plugin model	52	delete_framediconpluginmodel
202	Can view framed icon plugin model	52	view_framediconpluginmodel
203	Can add guest form plugin model	53	add_guestformpluginmodel
204	Can change guest form plugin model	53	change_guestformpluginmodel
205	Can delete guest form plugin model	53	delete_guestformpluginmodel
206	Can view guest form plugin model	53	view_guestformpluginmodel
207	Can add heading plugin model	54	add_headingpluginmodel
208	Can change heading plugin model	54	change_headingpluginmodel
209	Can delete heading plugin model	54	delete_headingpluginmodel
210	Can view heading plugin model	54	view_headingpluginmodel
211	Can add horizontal rule plugin model	55	add_horizontalrulepluginmodel
212	Can change horizontal rule plugin model	55	change_horizontalrulepluginmodel
213	Can delete horizontal rule plugin model	55	delete_horizontalrulepluginmodel
214	Can view horizontal rule plugin model	55	view_horizontalrulepluginmodel
215	Can add leaflet plugin model	56	add_leafletpluginmodel
216	Can change leaflet plugin model	56	change_leafletpluginmodel
217	Can delete leaflet plugin model	56	delete_leafletpluginmodel
218	Can view leaflet plugin model	56	view_leafletpluginmodel
219	Can add link plugin base model	57	add_linkpluginbasemodel
220	Can change link plugin base model	57	change_linkpluginbasemodel
221	Can delete link plugin base model	57	delete_linkpluginbasemodel
222	Can view link plugin base model	57	view_linkpluginbasemodel
223	Can add order button base model	58	add_orderbuttonbasemodel
224	Can change order button base model	58	change_orderbuttonbasemodel
225	Can delete order button base model	58	delete_orderbuttonbasemodel
226	Can view order button base model	58	view_orderbuttonbasemodel
227	Can add payment method form plugin model	59	add_paymentmethodformpluginmodel
228	Can change payment method form plugin model	59	change_paymentmethodformpluginmodel
229	Can delete payment method form plugin model	59	delete_paymentmethodformpluginmodel
230	Can view payment method form plugin model	59	view_paymentmethodformpluginmodel
231	Can add process bar plugin model	60	add_processbarpluginmodel
232	Can change process bar plugin model	60	change_processbarpluginmodel
233	Can delete process bar plugin model	60	delete_processbarpluginmodel
234	Can view process bar plugin model	60	view_processbarpluginmodel
235	Can add process step plugin model	61	add_processsteppluginmodel
236	Can change process step plugin model	61	change_processsteppluginmodel
237	Can delete process step plugin model	61	delete_processsteppluginmodel
238	Can view process step plugin model	61	view_processsteppluginmodel
239	Can add required form fields plugin model	62	add_requiredformfieldspluginmodel
240	Can change required form fields plugin model	62	change_requiredformfieldspluginmodel
241	Can delete required form fields plugin model	62	delete_requiredformfieldspluginmodel
242	Can view required form fields plugin model	62	view_requiredformfieldspluginmodel
243	Can add segment plugin model	63	add_segmentpluginmodel
244	Can change segment plugin model	63	change_segmentpluginmodel
245	Can delete segment plugin model	63	delete_segmentpluginmodel
246	Can view segment plugin model	63	view_segmentpluginmodel
247	Can add shipping method form plugin model	64	add_shippingmethodformpluginmodel
248	Can change shipping method form plugin model	64	change_shippingmethodformpluginmodel
249	Can delete shipping method form plugin model	64	delete_shippingmethodformpluginmodel
250	Can view shipping method form plugin model	64	view_shippingmethodformpluginmodel
251	Can add shop add to cart plugin model	65	add_shopaddtocartpluginmodel
252	Can change shop add to cart plugin model	65	change_shopaddtocartpluginmodel
253	Can delete shop add to cart plugin model	65	delete_shopaddtocartpluginmodel
254	Can view shop add to cart plugin model	65	view_shopaddtocartpluginmodel
255	Can add shop authentication plugin model	66	add_shopauthenticationpluginmodel
256	Can change shop authentication plugin model	66	change_shopauthenticationpluginmodel
257	Can delete shop authentication plugin model	66	delete_shopauthenticationpluginmodel
258	Can view shop authentication plugin model	66	view_shopauthenticationpluginmodel
259	Can add shop cancel order button plugin model	67	add_shopcancelorderbuttonpluginmodel
260	Can change shop cancel order button plugin model	67	change_shopcancelorderbuttonpluginmodel
261	Can delete shop cancel order button plugin model	67	delete_shopcancelorderbuttonpluginmodel
262	Can view shop cancel order button plugin model	67	view_shopcancelorderbuttonpluginmodel
263	Can add shop cart plugin model	68	add_shopcartpluginmodel
264	Can change shop cart plugin model	68	change_shopcartpluginmodel
265	Can delete shop cart plugin model	68	delete_shopcartpluginmodel
266	Can view shop cart plugin model	68	view_shopcartpluginmodel
267	Can add shop catalog plugin model	69	add_shopcatalogpluginmodel
268	Can change shop catalog plugin model	69	change_shopcatalogpluginmodel
269	Can delete shop catalog plugin model	69	delete_shopcatalogpluginmodel
270	Can view shop catalog plugin model	69	view_shopcatalogpluginmodel
271	Can add shop left extension model	70	add_shopleftextensionmodel
272	Can change shop left extension model	70	change_shopleftextensionmodel
273	Can delete shop left extension model	70	delete_shopleftextensionmodel
274	Can view shop left extension model	70	view_shopleftextensionmodel
275	Can add shop order addendum form plugin model	71	add_shoporderaddendumformpluginmodel
276	Can change shop order addendum form plugin model	71	change_shoporderaddendumformpluginmodel
277	Can delete shop order addendum form plugin model	71	delete_shoporderaddendumformpluginmodel
278	Can view shop order addendum form plugin model	71	view_shoporderaddendumformpluginmodel
279	Can add shop order views plugin model	72	add_shoporderviewspluginmodel
280	Can change shop order views plugin model	72	change_shoporderviewspluginmodel
281	Can delete shop order views plugin model	72	delete_shoporderviewspluginmodel
282	Can view shop order views plugin model	72	view_shoporderviewspluginmodel
283	Can add shop plugin base model	73	add_shoppluginbasemodel
284	Can change shop plugin base model	73	change_shoppluginbasemodel
285	Can delete shop plugin base model	73	delete_shoppluginbasemodel
286	Can view shop plugin base model	73	view_shoppluginbasemodel
287	Can add shop proceed button model	74	add_shopproceedbuttonmodel
288	Can change shop proceed button model	74	change_shopproceedbuttonmodel
289	Can delete shop proceed button model	74	delete_shopproceedbuttonmodel
290	Can view shop proceed button model	74	view_shopproceedbuttonmodel
291	Can add shop product gallery model	75	add_shopproductgallerymodel
292	Can change shop product gallery model	75	change_shopproductgallerymodel
293	Can delete shop product gallery model	75	delete_shopproductgallerymodel
294	Can view shop product gallery model	75	view_shopproductgallerymodel
295	Can add shop reorder button plugin model	76	add_shopreorderbuttonpluginmodel
296	Can change shop reorder button plugin model	76	change_shopreorderbuttonpluginmodel
297	Can delete shop reorder button plugin model	76	delete_shopreorderbuttonpluginmodel
298	Can view shop reorder button plugin model	76	view_shopreorderbuttonpluginmodel
299	Can add shop right extension model	77	add_shoprightextensionmodel
300	Can change shop right extension model	77	change_shoprightextensionmodel
301	Can delete shop right extension model	77	delete_shoprightextensionmodel
302	Can view shop right extension model	77	view_shoprightextensionmodel
303	Can add shop search results plugin model	78	add_shopsearchresultspluginmodel
304	Can change shop search results plugin model	78	change_shopsearchresultspluginmodel
305	Can delete shop search results plugin model	78	delete_shopsearchresultspluginmodel
306	Can view shop search results plugin model	78	view_shopsearchresultspluginmodel
307	Can add simple icon plugin model	79	add_simpleiconpluginmodel
308	Can change simple icon plugin model	79	change_simpleiconpluginmodel
309	Can delete simple icon plugin model	79	delete_simpleiconpluginmodel
310	Can view simple icon plugin model	79	view_simpleiconpluginmodel
311	Can add simple wrapper plugin model	80	add_simplewrapperpluginmodel
312	Can change simple wrapper plugin model	80	change_simplewrapperpluginmodel
313	Can delete simple wrapper plugin model	80	delete_simplewrapperpluginmodel
314	Can view simple wrapper plugin model	80	view_simplewrapperpluginmodel
315	Can add text icon plugin model	81	add_texticonpluginmodel
316	Can change text icon plugin model	81	change_texticonpluginmodel
317	Can delete text icon plugin model	81	delete_texticonpluginmodel
318	Can view text icon plugin model	81	view_texticonpluginmodel
319	Can add text image plugin model	82	add_textimagepluginmodel
320	Can change text image plugin model	82	change_textimagepluginmodel
321	Can delete text image plugin model	82	delete_textimagepluginmodel
322	Can view text image plugin model	82	view_textimagepluginmodel
323	Can add text link plugin model	83	add_textlinkpluginmodel
324	Can change text link plugin model	83	change_textlinkpluginmodel
325	Can delete text link plugin model	83	delete_textlinkpluginmodel
326	Can view text link plugin model	83	view_textlinkpluginmodel
327	Can add validate set of forms plugin model	84	add_validatesetofformspluginmodel
328	Can change validate set of forms plugin model	84	change_validatesetofformspluginmodel
329	Can delete validate set of forms plugin model	84	delete_validatesetofformspluginmodel
330	Can view validate set of forms plugin model	84	view_validatesetofformspluginmodel
331	Can add Text Editor Config	85	add_texteditorconfigfields
332	Can change Text Editor Config	85	change_texteditorconfigfields
333	Can delete Text Editor Config	85	delete_texteditorconfigfields
334	Can view Text Editor Config	85	view_texteditorconfigfields
335	Can add Token	86	add_token
336	Can change Token	86	change_token
337	Can delete Token	86	delete_token
338	Can view Token	86	view_token
339	Can add cms plugin	87	add_cmsplugin
340	Can change cms plugin	87	change_cmsplugin
341	Can delete cms plugin	87	delete_cmsplugin
342	Can view cms plugin	87	view_cmsplugin
343	Can add alias plugin model	88	add_aliaspluginmodel
344	Can change alias plugin model	88	change_aliaspluginmodel
345	Can delete alias plugin model	88	delete_aliaspluginmodel
346	Can view alias plugin model	88	view_aliaspluginmodel
347	Can add Page global permission	89	add_globalpagepermission
348	Can change Page global permission	89	change_globalpagepermission
349	Can delete Page global permission	89	delete_globalpagepermission
350	Can view Page global permission	89	view_globalpagepermission
351	Can add page	2	add_page
352	Can delete page	2	delete_page
353	Can view page	2	view_page
354	Can publish page	2	publish_page
355	Can edit static placeholders	2	edit_static_placeholder
356	Can add Page permission	90	add_pagepermission
357	Can change Page permission	90	change_pagepermission
358	Can delete Page permission	90	delete_pagepermission
359	Can view Page permission	90	view_pagepermission
360	Can add User (page)	91	add_pageuser
361	Can change User (page)	91	change_pageuser
362	Can delete User (page)	91	delete_pageuser
363	Can view User (page)	91	view_pageuser
364	Can add User group (page)	92	add_pageusergroup
365	Can change User group (page)	92	change_pageusergroup
366	Can delete User group (page)	92	delete_pageusergroup
367	Can view User group (page)	92	view_pageusergroup
368	Can add placeholder	1	add_placeholder
369	Can change placeholder	1	change_placeholder
370	Can delete placeholder	1	delete_placeholder
371	Can view placeholder	1	view_placeholder
372	Can add placeholder reference	93	add_placeholderreference
373	Can change placeholder reference	93	change_placeholderreference
374	Can delete placeholder reference	93	delete_placeholderreference
375	Can view placeholder reference	93	view_placeholderreference
376	Can add static placeholder	94	add_staticplaceholder
377	Can change static placeholder	94	change_staticplaceholder
378	Can delete static placeholder	94	delete_staticplaceholder
379	Can view static placeholder	94	view_staticplaceholder
380	Can add title	95	add_title
381	Can change title	95	change_title
382	Can delete title	95	delete_title
383	Can view title	95	view_title
384	Can add user setting	96	add_usersettings
385	Can change user setting	96	change_usersettings
386	Can delete user setting	96	delete_usersettings
387	Can view user setting	96	view_usersettings
388	Can add urlconf revision	97	add_urlconfrevision
389	Can change urlconf revision	97	change_urlconfrevision
390	Can delete urlconf revision	97	delete_urlconfrevision
391	Can view urlconf revision	97	view_urlconfrevision
392	Can add cache key	100	add_cachekey
393	Can change cache key	100	change_cachekey
394	Can delete cache key	100	delete_cachekey
395	Can view cache key	100	view_cachekey
396	Can add clipboard	101	add_clipboard
397	Can change clipboard	101	change_clipboard
398	Can delete clipboard	101	delete_clipboard
399	Can view clipboard	101	view_clipboard
400	Can add clipboard item	102	add_clipboarditem
401	Can change clipboard item	102	change_clipboarditem
402	Can delete clipboard item	102	delete_clipboarditem
403	Can view clipboard item	102	view_clipboarditem
404	Can add file	103	add_file
405	Can change file	103	change_file
406	Can delete file	103	delete_file
407	Can view file	103	view_file
408	Can add Folder	104	add_folder
409	Can change Folder	104	change_folder
410	Can delete Folder	104	delete_folder
411	Can view Folder	104	view_folder
412	Can use directory listing	104	can_use_directory_listing
413	Can add folder permission	105	add_folderpermission
414	Can change folder permission	105	change_folderpermission
415	Can delete folder permission	105	delete_folderpermission
416	Can view folder permission	105	view_folderpermission
417	Can add image	106	add_image
418	Can change image	106	change_image
419	Can delete image	106	delete_image
420	Can view image	106	view_image
421	Can add thumbnail option	107	add_thumbnailoption
422	Can change thumbnail option	107	change_thumbnailoption
423	Can delete thumbnail option	107	delete_thumbnailoption
424	Can view thumbnail option	107	view_thumbnailoption
425	Can add source	108	add_source
426	Can change source	108	change_source
427	Can delete source	108	delete_source
428	Can view source	108	view_source
429	Can add thumbnail	109	add_thumbnail
430	Can change thumbnail	109	change_thumbnail
431	Can delete thumbnail	109	delete_thumbnail
432	Can view thumbnail	109	view_thumbnail
433	Can add thumbnail dimensions	110	add_thumbnaildimensions
434	Can change thumbnail dimensions	110	change_thumbnaildimensions
435	Can delete thumbnail dimensions	110	delete_thumbnaildimensions
436	Can view thumbnail dimensions	110	view_thumbnaildimensions
437	Can add Attachment	111	add_attachment
438	Can change Attachment	111	change_attachment
439	Can delete Attachment	111	delete_attachment
440	Can view Attachment	111	view_attachment
441	Can add Email	112	add_email
442	Can change Email	112	change_email
443	Can delete Email	112	delete_email
444	Can view Email	112	view_email
445	Can add Email Template	113	add_emailtemplate
446	Can change Email Template	113	change_emailtemplate
447	Can delete Email Template	113	delete_emailtemplate
448	Can view Email Template	113	view_emailtemplate
449	Can add Log	114	add_log
450	Can change Log	114	change_log
451	Can delete Log	114	delete_log
452	Can view Log	114	view_log
453	Can add Notification	115	add_notification
454	Can change Notification	115	change_notification
455	Can delete Notification	115	delete_notification
456	Can view Notification	115	view_notification
457	Can add notification attachment	116	add_notificationattachment
458	Can change notification attachment	116	change_notificationattachment
459	Can delete notification attachment	116	delete_notificationattachment
460	Can view notification attachment	116	view_notificationattachment
461	Can add Customer	117	add_customerproxy
462	Can change Customer	117	change_customerproxy
463	Can delete Customer	117	delete_customerproxy
464	Can view Customer	117	view_customerproxy
465	Can add Billing Address	118	add_billingaddress
466	Can change Billing Address	118	change_billingaddress
467	Can delete Billing Address	118	delete_billingaddress
468	Can view Billing Address	118	view_billingaddress
469	Can add cart	119	add_cart
470	Can change cart	119	change_cart
471	Can delete cart	119	delete_cart
472	Can view cart	119	view_cart
473	Can add customer	120	add_customer
474	Can change customer	120	change_customer
475	Can delete customer	120	delete_customer
476	Can view customer	120	view_customer
477	Can add Delivery	121	add_delivery
478	Can change Delivery	121	change_delivery
479	Can delete Delivery	121	delete_delivery
480	Can view Delivery	121	view_delivery
481	Can add manufacturer	122	add_manufacturer
482	Can change manufacturer	122	change_manufacturer
483	Can delete manufacturer	122	delete_manufacturer
484	Can view manufacturer	122	view_manufacturer
485	Can add Order	123	add_order
486	Can change Order	123	change_order
487	Can delete Order	123	delete_order
488	Can view Order	123	view_order
489	Can add Product Image	124	add_productimage
490	Can change Product Image	124	change_productimage
491	Can delete Product Image	124	delete_productimage
492	Can view Product Image	124	view_productimage
493	Can add Category	125	add_productpage
494	Can change Category	125	change_productpage
495	Can delete Category	125	delete_productpage
496	Can view Category	125	view_productpage
497	Can add Smart Card	126	add_smartcard
498	Can change Smart Card	126	change_smartcard
499	Can delete Smart Card	126	delete_smartcard
500	Can view Smart Card	126	view_smartcard
501	Can add Shipping Address	127	add_shippingaddress
502	Can change Shipping Address	127	change_shippingaddress
503	Can delete Shipping Address	127	delete_shippingaddress
504	Can view Shipping Address	127	view_shippingaddress
505	Can add Order payment	128	add_orderpayment
506	Can change Order payment	128	change_orderpayment
507	Can delete Order payment	128	delete_orderpayment
508	Can view Order payment	128	view_orderpayment
509	Can add order item	129	add_orderitem
510	Can change order item	129	change_orderitem
511	Can delete order item	129	delete_orderitem
512	Can view order item	129	view_orderitem
513	Can add delivery item	130	add_deliveryitem
514	Can change delivery item	130	change_deliveryitem
515	Can delete delivery item	130	delete_deliveryitem
516	Can view delivery item	130	view_deliveryitem
517	Can add cart item	131	add_cartitem
518	Can change cart item	131	change_cartitem
519	Can delete cart item	131	delete_cartitem
520	Can view cart item	131	view_cartitem
521	Can add smart card translation	132	add_smartcardtranslation
522	Can change smart card translation	132	change_smartcardtranslation
523	Can delete smart card translation	132	delete_smartcardtranslation
524	Can view smart card translation	132	view_smartcardtranslation
525	Can add supplier	133	add_supplier
526	Can change supplier	133	change_supplier
527	Can delete supplier	133	delete_supplier
528	Can view supplier	133	view_supplier
529	Can add weltladen customer	134	add_weltladencustomer
530	Can change weltladen customer	134	change_weltladencustomer
531	Can delete weltladen customer	134	delete_weltladencustomer
532	Can view weltladen customer	134	view_weltladencustomer
533	Can add Smart Card	135	add_weltladenproduct
534	Can change Smart Card	135	change_weltladenproduct
535	Can delete Smart Card	135	delete_weltladenproduct
536	Can view Smart Card	135	view_weltladenproduct
537	Can add weltladen product translation	136	add_weltladenproducttranslation
538	Can change weltladen product translation	136	change_weltladenproducttranslation
539	Can delete weltladen product translation	136	delete_weltladenproducttranslation
540	Can view weltladen product translation	136	view_weltladenproducttranslation
541	Can add Location	137	add_locations
542	Can change Location	137	change_locations
543	Can delete Location	137	delete_locations
544	Can view Location	137	view_locations
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$36000$aW5f365D8NcY$t6ud/cxz3Ffjma/fn739Os2O/UtJZE/SyK3Fj2n8Quo=	2019-02-27 22:38:19.929+01	t	admin	Adam	De Mol	admin@example.com	t	t	2015-10-16 15:01:57.437+02
2	!qIyv4xYdiE292blenyXr9eduHxBYU3k5EhvpGwyK	\N	f	9OmKacig9RrdWbzpDJH9KHFxkCE2			guest@somewhere.net	f	f	2016-01-20 12:49:10.545+01
4	pbkdf2_sha256$150000$l8ruPs8DuMkn$Dd+OJblLFtibKWDMqgF6CMSHsktTNhBxcvODxM5FQyw=	2020-04-30 19:42:25.106958+02	t	markus	Markus	Mohanty	markus.mohanty@gmail.com	t	t	2020-04-26 20:36:02.839145+02
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
864f2ec530b0896465f0dd6af7159050be78b057	2020-04-30 19:42:25.094792+02	4
\.


--
-- Data for Name: cms_aliaspluginmodel; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cms_aliaspluginmodel (cmsplugin_ptr_id, plugin_id, alias_placeholder_id) FROM stdin;
\.


--
-- Data for Name: cms_cmsplugin; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cms_cmsplugin (id, "position", language, plugin_type, creation_date, changed_date, parent_id, placeholder_id, depth, numchild, path) FROM stdin;
914	0	de	BootstrapContainerPlugin	2020-04-30 19:44:29.263691+02	2020-04-30 19:44:29.271629+02	\N	16	1	1	004C
1089	1	de	TextLinkPlugin	2020-04-30 19:52:32.545099+02	2020-04-30 19:52:32.557484+02	469	80	8	0	002V0001000100010001000400090002
1164	1	de	BootstrapRowPlugin	2020-04-30 20:05:19.26675+02	2020-04-30 20:05:39.362382+02	1159	6	2	1	004J0003
30	0	de	HeadingPlugin	2020-04-26 19:50:04.132708+02	2020-04-27 21:12:50.200461+02	29	3	4	0	0003000100020001
877	2	de	BootstrapJumbotronPlugin	2020-04-29 20:58:31.177955+02	2020-04-29 20:59:49.55772+02	837	2	2	0	003X0003
33	3	de	BootstrapColumnPlugin	2020-04-26 19:50:04.16802+02	2020-04-26 19:50:04.176802+02	25	3	3	2	000300010004
32	0	de	HeadingPlugin	2020-04-26 19:50:04.15713+02	2020-04-27 21:12:59.127269+02	31	3	4	0	0003000100030001
1166	0	de	ShopProductGallery	2020-04-30 20:04:43.808419+02	2020-04-30 20:05:39.374987+02	1165	6	4	0	004J000300010001
35	0	de	HeadingPlugin	2020-04-26 19:50:04.193812+02	2020-04-27 21:13:23.364772+02	34	3	5	0	00030001000400010001
38	0	de	HeadingPlugin	2020-04-26 19:50:04.230854+02	2020-04-27 21:13:35.678806+02	37	3	5	0	00030001000400020001
29	1	de	BootstrapColumnPlugin	2020-04-26 19:50:04.119953+02	2020-04-26 19:50:04.128037+02	25	3	3	2	000300010002
27	0	de	HeadingPlugin	2020-04-26 19:50:04.095634+02	2020-04-27 21:12:39.020601+02	26	3	4	0	0003000100010001
893	0	en	BreadcrumbPlugin	2020-04-26 19:50:06.623418+02	2020-04-29 21:18:52.013325+02	\N	45	1	0	0048
31	2	de	BootstrapColumnPlugin	2020-04-26 19:50:04.14395+02	2020-04-26 19:50:04.152597+02	25	3	3	2	000300010003
894	0	en	BootstrapContainerPlugin	2020-04-26 19:50:06.561762+02	2020-04-29 21:18:52.038564+02	\N	46	1	1	0049
895	0	en	BootstrapRowPlugin	2020-04-26 19:50:06.569573+02	2020-04-29 21:18:52.044066+02	894	46	2	1	00490001
897	0	en	HeadingPlugin	2020-04-26 19:50:06.598873+02	2020-04-29 21:18:52.057844+02	896	46	4	0	0049000100010001
898	1	en	ShopCartPlugin	2020-04-26 19:50:06.609808+02	2020-04-29 21:18:52.065769+02	896	46	4	0	0049000100010002
896	0	en	BootstrapColumnPlugin	2020-04-26 19:50:06.586812+02	2020-04-29 21:18:52.050811+02	895	46	3	2	004900010001
1160	0	de	BootstrapRowPlugin	2020-04-29 20:03:02.014463+02	2020-04-30 20:05:39.328049+02	1159	6	2	1	004J0001
1161	0	de	BootstrapColumnPlugin	2020-04-29 20:03:02.036325+02	2020-04-30 20:05:39.334589+02	1160	6	3	1	004J00010001
1163	2	de	BootstrapJumbotronPlugin	2020-04-29 20:58:31.177955+02	2020-04-30 20:05:39.353273+02	1159	6	2	0	004J0002
1165	0	de	BootstrapColumnPlugin	2020-04-30 20:05:19.288586+02	2020-04-30 20:05:39.369065+02	1164	6	3	1	004J00030001
24	0	de	BootstrapContainerPlugin	2020-04-26 19:50:04.066196+02	2020-04-26 19:50:04.067884+02	\N	3	1	1	0003
42	0	en	BootstrapColumnPlugin	2020-04-26 19:50:03.796649+02	2020-04-26 19:50:04.303729+02	41	2	3	1	000400010001
1159	0	de	BootstrapContainerPlugin	2020-04-26 19:50:03.777868+02	2020-04-30 20:05:39.32254+02	\N	6	1	3	004J
1162	0	de	TextPlugin	2020-04-29 21:00:10.104613+02	2020-04-30 20:05:39.389148+02	1161	6	4	0	004J000100010001
43	0	en	BootstrapImagePlugin	2020-04-26 19:50:03.807133+02	2020-04-26 19:50:04.322843+02	42	2	4	0	0004000100010001
25	0	de	BootstrapRowPlugin	2020-04-26 19:50:04.072496+02	2020-04-26 19:50:04.078744+02	24	3	2	4	00030001
26	0	de	BootstrapColumnPlugin	2020-04-26 19:50:04.083187+02	2020-04-26 19:50:04.090163+02	25	3	3	2	000300010001
28	1	de	BootstrapSecondaryMenuPlugin	2020-04-26 19:50:04.107723+02	2020-04-26 19:50:04.115723+02	26	3	4	0	0003000100010002
41	0	en	BootstrapRowPlugin	2020-04-26 19:50:03.785219+02	2020-04-26 19:50:04.292993+02	40	2	2	2	00040001
37	1	de	SegmentPlugin	2020-04-26 19:50:04.217315+02	2020-04-26 19:50:04.22607+02	33	3	4	2	0003000100040002
34	0	de	SegmentPlugin	2020-04-26 19:50:04.182149+02	2020-04-26 19:50:04.189101+02	33	3	4	2	0003000100040001
36	1	de	BootstrapSecondaryMenuPlugin	2020-04-26 19:50:04.204742+02	2020-04-26 19:50:04.212589+02	34	3	5	0	00030001000400010002
39	1	de	BootstrapSecondaryMenuPlugin	2020-04-26 19:50:04.241751+02	2020-04-26 19:50:04.250628+02	37	3	5	0	00030001000400020002
40	0	en	BootstrapContainerPlugin	2020-04-26 19:50:03.777868+02	2020-04-26 19:50:04.280721+02	\N	2	1	1	0004
45	0	en	HeadingPlugin	2020-04-26 19:50:03.843423+02	2020-04-26 19:50:04.345934+02	44	2	4	0	0004000100020001
44	1	en	BootstrapColumnPlugin	2020-04-26 19:50:03.830774+02	2020-04-26 19:50:04.335114+02	41	2	3	2	000400010002
46	1	en	TextPlugin	2020-04-26 19:50:03.853836+02	2020-04-26 19:50:04.381532+02	44	2	4	0	0004000100020002
61	0	de	BootstrapContainerPlugin	2020-04-26 19:50:05.238092+02	2020-04-26 19:50:05.239675+02	\N	32	1	1	0007
62	0	de	BootstrapRowPlugin	2020-04-26 19:50:05.244066+02	2020-04-26 19:50:05.250611+02	61	32	2	1	00070001
63	0	de	BootstrapColumnPlugin	2020-04-26 19:50:05.255836+02	2020-04-29 20:24:52.354218+02	62	32	3	2	000700010001
101	0	de	BootstrapRowPlugin	2020-04-26 19:50:05.615967+02	2020-04-26 19:50:05.781753+02	100	38	2	1	000K0001
66	1	de	ShopCatalogPlugin	2020-04-26 19:50:05.299093+02	2020-04-26 19:50:05.306722+02	63	32	4	0	0007000100010003
64	0	de	TextPlugin	2020-04-26 19:50:05.269796+02	2020-04-26 19:50:05.280774+02	63	32	4	0	0007000100010001
469	8	de	AcceptConditionPlugin	2020-04-26 19:50:10.373352+02	2020-04-30 19:52:36.577071+02	458	80	7	1	002V000100010001000100040009
71	0	en	BootstrapColumnPlugin	2020-04-26 19:50:05.255836+02	2020-04-29 20:33:11.481098+02	70	32	3	2	000A00010001
72	0	en	TextPlugin	2020-04-26 19:50:05.269796+02	2020-04-26 19:50:05.413055+02	71	32	4	0	000A000100010001
74	1	en	ShopCatalogPlugin	2020-04-26 19:50:05.299093+02	2020-04-26 19:50:05.401831+02	71	32	4	0	000A000100010003
89	0	de	BootstrapContainerPlugin	2020-04-26 19:50:05.607937+02	2020-04-26 19:50:05.609977+02	\N	36	1	1	000F
915	0	de	BootstrapRowPlugin	2020-04-30 19:44:38.524892+02	2020-04-30 19:44:38.533846+02	914	16	2	1	004C0001
67	0	de	BreadcrumbPlugin	2020-04-26 19:50:05.311082+02	2020-04-26 19:50:05.31278+02	\N	31	1	0	0008
68	0	en	BreadcrumbPlugin	2020-04-26 19:50:05.311082+02	2020-04-26 19:50:05.328591+02	\N	31	1	0	0009
103	0	de	ShopSearchResultsPlugin	2020-04-26 19:50:05.644169+02	2020-04-26 19:50:05.791429+02	102	38	4	0	000K000100010001
69	0	en	BootstrapContainerPlugin	2020-04-26 19:50:05.238092+02	2020-04-26 19:50:05.346279+02	\N	32	1	1	000A
102	0	de	BootstrapColumnPlugin	2020-04-26 19:50:05.632461+02	2020-04-26 19:50:05.78656+02	101	38	3	1	000K00010001
70	0	en	BootstrapRowPlugin	2020-04-26 19:50:05.244066+02	2020-04-26 19:50:05.357475+02	69	32	2	1	000A0001
90	0	de	BootstrapRowPlugin	2020-04-26 19:50:05.615967+02	2020-04-26 19:50:05.625301+02	89	36	2	1	000F0001
987	2	de	AcceptConditionPlugin	2020-04-30 19:49:20.202133+02	2020-04-30 19:50:10.142931+02	438	80	7	1	002V000100010001000100010005
916	0	de	BootstrapColumnPlugin	2020-04-30 19:44:38.550182+02	2020-04-30 19:44:38.568831+02	915	16	3	2	004C00010001
112	0	de	HeadingPlugin	2020-04-26 19:50:05.930673+02	2020-04-30 19:47:14.015703+02	111	40	4	0	000N000100010001
122	0	de	BootstrapButtonPlugin	2020-04-26 19:50:06.050428+02	2020-04-30 19:47:31.184116+02	121	40	6	0	000N00010001000200020001
91	0	de	BootstrapColumnPlugin	2020-04-26 19:50:05.632461+02	2020-04-26 19:50:05.63912+02	90	36	3	1	000F00010001
92	0	de	ShopSearchResultsPlugin	2020-04-26 19:50:05.644169+02	2020-04-26 19:50:05.651562+02	91	36	4	0	000F000100010001
93	0	de	BreadcrumbPlugin	2020-04-26 19:50:05.655877+02	2020-04-26 19:50:05.657533+02	\N	35	1	0	000G
94	0	en	BreadcrumbPlugin	2020-04-26 19:50:05.655877+02	2020-04-26 19:50:05.671832+02	\N	35	1	0	000H
95	0	en	BootstrapContainerPlugin	2020-04-26 19:50:05.607937+02	2020-04-26 19:50:05.69426+02	\N	36	1	1	000I
96	0	en	BootstrapRowPlugin	2020-04-26 19:50:05.615967+02	2020-04-26 19:50:05.712715+02	95	36	2	1	000I0001
97	0	en	BootstrapColumnPlugin	2020-04-26 19:50:05.632461+02	2020-04-26 19:50:05.724577+02	96	36	3	1	000I00010001
98	0	en	ShopSearchResultsPlugin	2020-04-26 19:50:05.644169+02	2020-04-26 19:50:05.735788+02	97	36	4	0	000I000100010001
99	0	de	BreadcrumbPlugin	2020-04-26 19:50:05.655877+02	2020-04-26 19:50:05.761529+02	\N	37	1	0	000J
100	0	de	BootstrapContainerPlugin	2020-04-26 19:50:05.607937+02	2020-04-26 19:50:05.777903+02	\N	38	1	1	000K
114	0	de	ShopLeftExtension	2020-04-26 19:50:05.953767+02	2020-04-26 19:50:05.959911+02	113	40	5	1	000N0001000100020001
109	0	de	BootstrapContainerPlugin	2020-04-26 19:50:05.894888+02	2020-04-26 19:50:05.896512+02	\N	40	1	1	000N
110	0	de	BootstrapRowPlugin	2020-04-26 19:50:05.902489+02	2020-04-26 19:50:05.914552+02	109	40	2	1	000N0001
111	0	de	BootstrapColumnPlugin	2020-04-26 19:50:05.919187+02	2020-04-26 19:50:05.9259+02	110	40	3	2	000N00010001
116	0	de	BootstrapCardHeaderPlugin	2020-04-26 19:50:05.97481+02	2020-04-26 19:50:05.981576+02	115	40	7	1	000N000100010002000100010001
115	0	de	BootstrapCardPlugin	2020-04-26 19:50:05.964379+02	2020-04-26 19:50:05.970557+02	114	40	6	2	000N00010001000200010001
117	0	de	HeadingPlugin	2020-04-26 19:50:05.986455+02	2020-04-26 19:50:05.993467+02	116	40	8	0	000N0001000100020001000100010001
119	0	de	TextPlugin	2020-04-26 19:50:06.010122+02	2020-04-26 19:50:06.020044+02	118	40	8	0	000N0001000100020001000100020001
118	1	de	BootstrapCardBodyPlugin	2020-04-26 19:50:05.997891+02	2020-04-26 19:50:06.00565+02	115	40	7	2	000N000100010002000100010002
120	1	de	BootstrapButtonPlugin	2020-04-26 19:50:06.026099+02	2020-04-26 19:50:06.033799+02	118	40	8	0	000N0001000100020001000100020002
113	1	de	ShopCartPlugin	2020-04-26 19:50:05.94154+02	2020-04-26 19:50:05.949286+02	111	40	4	2	000N000100010002
121	1	de	ShopRightExtension	2020-04-26 19:50:06.037879+02	2020-04-26 19:50:06.045939+02	113	40	5	1	000N0001000100020002
123	0	de	BreadcrumbPlugin	2020-04-26 19:50:06.061793+02	2020-04-26 19:50:06.063619+02	\N	39	1	0	000O
124	0	en	BreadcrumbPlugin	2020-04-26 19:50:06.061793+02	2020-04-26 19:50:06.077859+02	\N	39	1	0	000P
128	0	en	HeadingPlugin	2020-04-26 19:50:05.930673+02	2020-04-26 19:50:06.131117+02	127	40	4	0	000Q000100010001
125	0	en	BootstrapContainerPlugin	2020-04-26 19:50:05.894888+02	2020-04-26 19:50:06.099704+02	\N	40	1	1	000Q
126	0	en	BootstrapRowPlugin	2020-04-26 19:50:05.902489+02	2020-04-26 19:50:06.109812+02	125	40	2	1	000Q0001
127	0	en	BootstrapColumnPlugin	2020-04-26 19:50:05.919187+02	2020-04-26 19:50:06.120499+02	126	40	3	2	000Q00010001
130	0	en	ShopLeftExtension	2020-04-26 19:50:05.953767+02	2020-04-26 19:50:06.154387+02	129	40	5	1	000Q0001000100020001
917	1	de	TextPlugin	2020-04-30 19:44:46.114402+02	2020-04-30 19:46:09.399544+02	916	16	4	0	004C000100010001
132	0	en	BootstrapCardHeaderPlugin	2020-04-26 19:50:05.97481+02	2020-04-26 19:50:06.176815+02	131	40	7	1	000Q000100010002000100010001
133	0	en	HeadingPlugin	2020-04-26 19:50:05.986455+02	2020-04-26 19:50:06.187638+02	132	40	8	0	000Q0001000100020001000100010001
131	0	en	BootstrapCardPlugin	2020-04-26 19:50:05.964379+02	2020-04-26 19:50:06.165051+02	130	40	6	2	000Q00010001000200010001
988	0	de	TextLinkPlugin	2020-04-30 19:50:08.453315+02	2020-04-30 19:50:08.465423+02	987	80	8	0	002V0001000100010001000100050001
134	1	en	BootstrapCardBodyPlugin	2020-04-26 19:50:05.997891+02	2020-04-26 19:50:06.199664+02	131	40	7	2	000Q000100010002000100010002
136	1	en	BootstrapButtonPlugin	2020-04-26 19:50:06.026099+02	2020-04-26 19:50:06.223698+02	134	40	8	0	000Q0001000100020001000100020002
129	1	en	ShopCartPlugin	2020-04-26 19:50:05.94154+02	2020-04-26 19:50:06.142721+02	127	40	4	2	000Q000100010002
137	1	en	ShopRightExtension	2020-04-26 19:50:06.037879+02	2020-04-26 19:50:06.236818+02	129	40	5	1	000Q0001000100020002
138	0	en	BootstrapButtonPlugin	2020-04-26 19:50:06.050428+02	2020-04-26 19:50:06.247395+02	137	40	6	0	000Q00010001000200020001
135	0	en	TextPlugin	2020-04-26 19:50:06.010122+02	2020-04-26 19:50:06.265847+02	134	40	8	0	000Q0001000100020001000100020001
1091	0	de	SegmentPlugin	2020-04-26 19:50:09.931213+02	2020-04-30 19:52:43.536454+02	1090	82	2	1	004G0001
1092	0	de	BootstrapRowPlugin	2020-04-26 19:50:09.947377+02	2020-04-30 19:52:43.543202+02	1091	82	3	1	004G00010001
1093	0	de	BootstrapColumnPlugin	2020-04-26 19:50:09.960732+02	2020-04-30 19:52:43.549943+02	1092	82	4	1	004G000100010001
1097	0	de	CustomerFormPlugin	2020-04-26 19:50:10.006888+02	2020-04-30 19:52:43.575528+02	1096	82	8	0	004G0001000100010001000100010001
1096	0	de	SegmentPlugin	2020-04-26 19:50:09.994566+02	2020-04-30 19:52:43.569425+02	1095	82	7	1	004G000100010001000100010001
1099	0	de	GuestFormPlugin	2020-04-26 19:50:10.030531+02	2020-04-30 19:52:43.591385+02	1098	82	8	0	004G0001000100010001000100020001
1098	1	de	SegmentPlugin	2020-04-26 19:50:10.017807+02	2020-04-30 19:52:43.584854+02	1095	82	7	1	004G000100010001000100010002
169	0	de	BootstrapContainerPlugin	2020-04-26 19:50:06.561762+02	2020-04-26 19:50:06.563533+02	\N	44	1	1	000V
171	0	de	BootstrapColumnPlugin	2020-04-26 19:50:06.586812+02	2020-04-26 19:50:06.594108+02	170	44	3	2	000V00010001
170	0	de	BootstrapRowPlugin	2020-04-26 19:50:06.569573+02	2020-04-26 19:50:06.581144+02	169	44	2	1	000V0001
173	1	de	ShopCartPlugin	2020-04-26 19:50:06.609808+02	2020-04-26 19:50:06.618344+02	171	44	4	0	000V000100010002
177	0	en	BootstrapRowPlugin	2020-04-26 19:50:06.569573+02	2020-04-26 19:50:06.671922+02	176	44	2	1	000Y0001
174	0	de	BreadcrumbPlugin	2020-04-26 19:50:06.623418+02	2020-04-26 19:50:06.625505+02	\N	43	1	0	000W
172	0	de	HeadingPlugin	2020-04-26 19:50:06.598873+02	2020-04-26 19:50:06.60546+02	171	44	4	0	000V000100010001
175	0	en	BreadcrumbPlugin	2020-04-26 19:50:06.623418+02	2020-04-26 19:50:06.641483+02	\N	43	1	0	000X
178	0	en	BootstrapColumnPlugin	2020-04-26 19:50:06.586812+02	2020-04-26 19:50:06.684538+02	177	44	3	2	000Y00010001
176	0	en	BootstrapContainerPlugin	2020-04-26 19:50:06.561762+02	2020-04-26 19:50:06.660346+02	\N	44	1	1	000Y
180	1	en	ShopCartPlugin	2020-04-26 19:50:06.609808+02	2020-04-26 19:50:06.722737+02	178	44	4	0	000Y000100010002
181	0	de	BreadcrumbPlugin	2020-04-26 19:50:06.623418+02	2020-04-26 19:50:06.751785+02	\N	45	1	0	000Z
183	0	de	BootstrapRowPlugin	2020-04-26 19:50:06.569573+02	2020-04-26 19:50:06.773749+02	182	46	2	1	00100001
179	0	en	HeadingPlugin	2020-04-26 19:50:06.598873+02	2020-04-26 19:50:06.702369+02	178	44	4	0	000Y000100010001
182	0	de	BootstrapContainerPlugin	2020-04-26 19:50:06.561762+02	2020-04-26 19:50:06.770306+02	\N	46	1	1	0010
185	0	de	HeadingPlugin	2020-04-26 19:50:06.598873+02	2020-04-26 19:50:06.782735+02	184	46	4	0	0010000100010001
186	1	de	ShopCartPlugin	2020-04-26 19:50:06.609808+02	2020-04-26 19:50:06.788052+02	184	46	4	0	0010000100010002
184	0	de	BootstrapColumnPlugin	2020-04-26 19:50:06.586812+02	2020-04-26 19:50:06.778202+02	183	46	3	2	001000010001
198	1	de	ShopOrderViewsPlugin	2020-04-26 19:50:06.963639+02	2020-04-26 19:50:06.972665+02	195	48	4	2	0013000100010002
1100	3	de	RequiredFormFieldsPlugin	2020-04-26 19:50:10.041552+02	2020-04-30 19:52:43.600863+02	1095	82	7	0	004G000100010001000100010003
193	0	de	BootstrapContainerPlugin	2020-04-26 19:50:06.904016+02	2020-04-26 19:50:06.906785+02	\N	48	1	1	0013
218	0	en	BootstrapCardHeaderPlugin	2020-04-26 19:50:06.999243+02	2020-04-26 19:50:07.218102+02	217	48	7	1	0016000100010002000100010001
219	0	en	HeadingPlugin	2020-04-26 19:50:07.010388+02	2020-04-26 19:50:07.229272+02	218	48	8	0	00160001000100020001000100010001
918	0	de	HeadingPlugin	2020-04-30 19:46:33.753287+02	2020-04-30 19:46:33.768515+02	916	16	4	0	004C000100010002
194	0	de	BootstrapRowPlugin	2020-04-26 19:50:06.911441+02	2020-04-26 19:50:06.918501+02	193	48	2	1	00130001
1101	4	de	ShopProceedButton	2020-04-26 19:50:10.054018+02	2020-04-30 19:52:43.609983+02	1095	82	7	0	004G000100010001000100010004
217	0	en	BootstrapCardPlugin	2020-04-26 19:50:06.988462+02	2020-04-26 19:50:07.2074+02	216	48	6	2	001600010001000200010001
207	1	de	ShopCancelOrderButtonPlugin	2020-04-26 19:50:07.071192+02	2020-04-30 19:54:36.618099+02	205	48	6	0	001300010001000200020002
197	0	de	HeadingPlugin	2020-04-26 19:50:06.952693+02	2020-04-30 19:53:25.696664+02	196	48	5	0	00130001000100010001
196	0	de	SegmentPlugin	2020-04-26 19:50:06.940534+02	2020-04-26 19:50:06.948024+02	195	48	4	1	0013000100010001
202	0	de	HeadingPlugin	2020-04-26 19:50:07.010388+02	2020-04-30 19:53:50.614544+02	201	48	8	0	00130001000100020001000100010001
1095	0	de	ProcessStepPlugin	2020-04-26 19:50:09.983463+02	2020-04-30 19:52:43.562998+02	1094	82	6	5	004G00010001000100010001
195	0	de	BootstrapColumnPlugin	2020-04-26 19:50:06.924874+02	2020-04-26 19:50:06.935796+02	194	48	3	2	001300010001
205	1	de	ShopRightExtension	2020-04-26 19:50:07.047415+02	2020-04-26 19:50:07.055393+02	198	48	5	2	00130001000100020002
1103	0	de	TextLinkPlugin	2020-04-30 19:50:08.453315+02	2020-04-30 19:52:43.624873+02	1102	82	8	0	004G0001000100010001000100050001
206	0	de	ShopReorderButtonPlugin	2020-04-26 19:50:07.060308+02	2020-04-30 19:54:18.712998+02	205	48	6	0	001300010001000200020001
199	0	de	ShopLeftExtension	2020-04-26 19:50:06.977494+02	2020-04-26 19:50:06.98382+02	198	48	5	1	00130001000100020001
208	0	de	BreadcrumbPlugin	2020-04-26 19:50:07.085316+02	2020-04-26 19:50:07.087043+02	\N	47	1	0	0014
209	0	en	BreadcrumbPlugin	2020-04-26 19:50:07.085316+02	2020-04-26 19:50:07.102913+02	\N	47	1	0	0015
201	0	de	BootstrapCardHeaderPlugin	2020-04-26 19:50:06.999243+02	2020-04-26 19:50:07.005763+02	200	48	7	1	0013000100010002000100010001
220	1	en	BootstrapCardBodyPlugin	2020-04-26 19:50:07.022292+02	2020-04-26 19:50:07.24124+02	217	48	7	1	0016000100010002000100010002
200	0	de	BootstrapCardPlugin	2020-04-26 19:50:06.988462+02	2020-04-26 19:50:06.994882+02	199	48	6	2	001300010001000200010001
210	0	en	BootstrapContainerPlugin	2020-04-26 19:50:06.904016+02	2020-04-26 19:50:07.128207+02	\N	48	1	1	0016
203	1	de	BootstrapCardBodyPlugin	2020-04-26 19:50:07.022292+02	2020-04-26 19:50:07.030738+02	200	48	7	1	0013000100010002000100010002
221	0	en	ShopOrderAddendumFormPlugin	2020-04-26 19:50:07.0352+02	2020-04-26 19:50:07.252064+02	220	48	8	0	00160001000100020001000100020001
204	0	de	ShopOrderAddendumFormPlugin	2020-04-26 19:50:07.0352+02	2020-04-26 19:50:07.04294+02	203	48	8	0	00130001000100020001000100020001
902	0	en	BootstrapColumnPlugin	2020-04-26 19:50:05.919187+02	2020-04-29 21:18:57.373955+02	901	42	3	2	004B00010001
211	0	en	BootstrapRowPlugin	2020-04-26 19:50:06.911441+02	2020-04-26 19:50:07.139174+02	210	48	2	1	00160001
215	1	en	ShopOrderViewsPlugin	2020-04-26 19:50:06.963639+02	2020-04-26 19:50:07.184473+02	212	48	4	2	0016000100010002
213	0	en	SegmentPlugin	2020-04-26 19:50:06.940534+02	2020-04-26 19:50:07.161551+02	212	48	4	1	0016000100010001
214	0	en	HeadingPlugin	2020-04-26 19:50:06.952693+02	2020-04-26 19:50:07.172414+02	213	48	5	0	00160001000100010001
212	0	en	BootstrapColumnPlugin	2020-04-26 19:50:06.924874+02	2020-04-26 19:50:07.150408+02	211	48	3	2	001600010001
899	0	en	BreadcrumbPlugin	2020-04-26 19:50:06.061793+02	2020-04-29 21:18:57.31067+02	\N	41	1	0	004A
216	0	en	ShopLeftExtension	2020-04-26 19:50:06.977494+02	2020-04-26 19:50:07.196205+02	215	48	5	1	00160001000100020001
223	0	en	ShopReorderButtonPlugin	2020-04-26 19:50:07.060308+02	2020-04-26 19:50:07.275864+02	222	48	6	0	001600010001000200020001
241	0	en	BreadcrumbPlugin	2020-04-26 19:50:07.085316+02	2020-04-26 19:50:07.452848+02	\N	49	1	0	0019
222	1	en	ShopRightExtension	2020-04-26 19:50:07.047415+02	2020-04-26 19:50:07.264766+02	215	48	5	2	00160001000100020002
224	1	en	ShopCancelOrderButtonPlugin	2020-04-26 19:50:07.071192+02	2020-04-26 19:50:07.288312+02	222	48	6	0	001600010001000200020002
900	0	en	BootstrapContainerPlugin	2020-04-26 19:50:05.894888+02	2020-04-29 21:18:57.357891+02	\N	42	1	1	004B
901	0	en	BootstrapRowPlugin	2020-04-26 19:50:05.902489+02	2020-04-29 21:18:57.364404+02	900	42	2	1	004B0001
903	0	en	HeadingPlugin	2020-04-26 19:50:05.930673+02	2020-04-29 21:18:57.380219+02	902	42	4	0	004B000100010001
905	0	en	ShopLeftExtension	2020-04-26 19:50:05.953767+02	2020-04-29 21:18:57.395838+02	904	42	5	1	004B0001000100020001
908	0	en	HeadingPlugin	2020-04-26 19:50:05.986455+02	2020-04-29 21:18:57.417383+02	907	42	8	0	004B0001000100020001000100010001
907	0	en	BootstrapCardHeaderPlugin	2020-04-26 19:50:05.97481+02	2020-04-29 21:18:57.409942+02	906	42	7	1	004B000100010002000100010001
242	0	en	BootstrapContainerPlugin	2020-04-26 19:50:06.904016+02	2020-04-26 19:50:07.482921+02	\N	50	1	1	001A
243	0	en	BootstrapRowPlugin	2020-04-26 19:50:06.911441+02	2020-04-26 19:50:07.486215+02	242	50	2	1	001A0001
246	0	en	HeadingPlugin	2020-04-26 19:50:06.952693+02	2020-04-26 19:50:07.500072+02	245	50	5	0	001A0001000100010001
245	0	en	SegmentPlugin	2020-04-26 19:50:06.940534+02	2020-04-26 19:50:07.495435+02	244	50	4	1	001A000100010001
244	0	en	BootstrapColumnPlugin	2020-04-26 19:50:06.924874+02	2020-04-26 19:50:07.490832+02	243	50	3	2	001A00010001
248	0	en	ShopLeftExtension	2020-04-26 19:50:06.977494+02	2020-04-26 19:50:07.510341+02	247	50	5	1	001A0001000100020001
252	1	en	BootstrapCardBodyPlugin	2020-04-26 19:50:07.022292+02	2020-04-26 19:50:07.529479+02	249	50	7	1	001A000100010002000100010002
251	0	en	HeadingPlugin	2020-04-26 19:50:07.010388+02	2020-04-26 19:50:07.524017+02	250	50	8	0	001A0001000100020001000100010001
250	0	en	BootstrapCardHeaderPlugin	2020-04-26 19:50:06.999243+02	2020-04-26 19:50:07.51973+02	249	50	7	1	001A000100010002000100010001
249	0	en	BootstrapCardPlugin	2020-04-26 19:50:06.988462+02	2020-04-26 19:50:07.514971+02	248	50	6	2	001A00010001000200010001
247	1	en	ShopOrderViewsPlugin	2020-04-26 19:50:06.963639+02	2020-04-26 19:50:07.505775+02	244	50	4	2	001A000100010002
253	0	en	ShopOrderAddendumFormPlugin	2020-04-26 19:50:07.0352+02	2020-04-26 19:50:07.534145+02	252	50	8	0	001A0001000100020001000100020001
255	0	en	ShopReorderButtonPlugin	2020-04-26 19:50:07.060308+02	2020-04-26 19:50:07.544967+02	254	50	6	0	001A00010001000200020001
256	1	en	ShopCancelOrderButtonPlugin	2020-04-26 19:50:07.071192+02	2020-04-26 19:50:07.551058+02	254	50	6	0	001A00010001000200020002
254	1	en	ShopRightExtension	2020-04-26 19:50:07.047415+02	2020-04-26 19:50:07.5402+02	247	50	5	2	001A0001000100020002
257	0	de	BootstrapContainerPlugin	2020-04-26 19:50:07.610484+02	2020-04-26 19:50:07.612787+02	\N	52	1	1	001B
270	0	en	BootstrapContainerPlugin	2020-04-26 19:50:07.610484+02	2020-04-26 19:50:07.786851+02	\N	52	1	1	001E
919	0	de	BootstrapContainerPlugin	2020-04-30 19:44:29.263691+02	2020-04-30 19:46:41.195162+02	\N	18	1	1	004D
258	0	de	BootstrapRowPlugin	2020-04-26 19:50:07.618451+02	2020-04-26 19:50:07.627985+02	257	52	2	1	001B0001
920	0	de	BootstrapRowPlugin	2020-04-30 19:44:38.524892+02	2020-04-30 19:46:41.202248+02	919	18	2	1	004D0001
259	0	de	BootstrapColumnPlugin	2020-04-26 19:50:07.635077+02	2020-04-26 19:50:07.641449+02	258	52	3	1	001B00010001
271	0	en	BootstrapRowPlugin	2020-04-26 19:50:07.618451+02	2020-04-26 19:50:07.797588+02	270	52	2	1	001E0001
300	1	en	SegmentPlugin	2020-04-26 19:50:07.682323+02	2020-04-26 19:50:08.075607+02	297	54	5	1	001I0001000100010002
272	0	en	BootstrapColumnPlugin	2020-04-26 19:50:07.635077+02	2020-04-26 19:50:07.807852+02	271	52	3	1	001E00010001
923	0	de	HeadingPlugin	2020-04-30 19:46:33.753287+02	2020-04-30 19:46:41.252399+02	921	18	4	0	004D000100010002
261	0	de	SegmentPlugin	2020-04-26 19:50:07.660053+02	2020-04-26 19:50:07.666693+02	260	52	5	1	001B0001000100010001
262	0	de	CustomerFormPlugin	2020-04-26 19:50:07.670796+02	2020-04-26 19:50:07.677512+02	261	52	6	0	001B00010001000100010001
921	0	de	BootstrapColumnPlugin	2020-04-30 19:44:38.550182+02	2020-04-30 19:46:41.209111+02	920	18	3	2	004D00010001
922	1	de	TextPlugin	2020-04-30 19:44:46.114402+02	2020-04-30 19:46:41.260116+02	921	18	4	0	004D000100010001
1105	0	de	CheckoutAddressPlugin	2020-04-26 19:50:10.080205+02	2020-04-30 19:52:43.641224+02	1104	82	7	0	004G000100010001000100020001
263	1	de	SegmentPlugin	2020-04-26 19:50:07.682323+02	2020-04-26 19:50:07.690041+02	260	52	5	1	001B0001000100010002
274	0	en	SegmentPlugin	2020-04-26 19:50:07.660053+02	2020-04-26 19:50:07.828798+02	273	52	5	1	001E0001000100010001
264	0	de	GuestFormPlugin	2020-04-26 19:50:07.694656+02	2020-04-26 19:50:07.702907+02	263	52	6	0	001B00010001000100020001
1106	1	de	CheckoutAddressPlugin	2020-04-26 19:50:10.091528+02	2020-04-30 19:52:43.65083+02	1104	82	7	0	004G000100010001000100020002
275	0	en	CustomerFormPlugin	2020-04-26 19:50:07.670796+02	2020-04-26 19:50:07.839999+02	274	52	6	0	001E00010001000100010001
265	2	de	SegmentPlugin	2020-04-26 19:50:07.714652+02	2020-04-26 19:50:07.723632+02	260	52	5	1	001B0001000100010003
1107	2	de	RequiredFormFieldsPlugin	2020-04-26 19:50:10.105647+02	2020-04-30 19:52:43.660381+02	1104	82	7	0	004G000100010001000100020003
266	0	de	HeadingPlugin	2020-04-26 19:50:07.728517+02	2020-04-26 19:50:07.734791+02	265	52	6	0	001B00010001000100030001
260	0	de	ValidateSetOfFormsPlugin	2020-04-26 19:50:07.647005+02	2020-04-26 19:50:07.655195+02	259	52	4	4	001B000100010001
267	3	de	ShopProceedButton	2020-04-26 19:50:07.739005+02	2020-04-26 19:50:07.747186+02	260	52	5	0	001B0001000100010004
268	0	de	BreadcrumbPlugin	2020-04-26 19:50:07.751725+02	2020-04-26 19:50:07.753303+02	\N	51	1	0	001C
269	0	en	BreadcrumbPlugin	2020-04-26 19:50:07.751725+02	2020-04-26 19:50:07.767443+02	\N	51	1	0	001D
276	1	en	SegmentPlugin	2020-04-26 19:50:07.682323+02	2020-04-26 19:50:07.852239+02	273	52	5	1	001E0001000100010002
277	0	en	GuestFormPlugin	2020-04-26 19:50:07.694656+02	2020-04-26 19:50:07.86196+02	276	52	6	0	001E00010001000100020001
1108	3	de	ShopProceedButton	2020-04-26 19:50:10.118929+02	2020-04-30 19:52:43.669155+02	1104	82	7	0	004G000100010001000100020004
1104	1	de	ProcessStepPlugin	2020-04-26 19:50:10.066481+02	2020-04-30 19:52:43.634731+02	1094	82	6	4	004G00010001000100010002
278	2	en	SegmentPlugin	2020-04-26 19:50:07.714652+02	2020-04-26 19:50:07.873379+02	273	52	5	1	001E0001000100010003
279	0	en	HeadingPlugin	2020-04-26 19:50:07.728517+02	2020-04-26 19:50:07.883816+02	278	52	6	0	001E00010001000100030001
273	0	en	ValidateSetOfFormsPlugin	2020-04-26 19:50:07.647005+02	2020-04-26 19:50:07.818466+02	272	52	4	4	001E000100010001
280	3	en	ShopProceedButton	2020-04-26 19:50:07.739005+02	2020-04-26 19:50:07.89525+02	273	52	5	0	001E0001000100010004
293	0	en	BreadcrumbPlugin	2020-04-26 19:50:07.751725+02	2020-04-26 19:50:08.026126+02	\N	53	1	0	001H
294	0	en	BootstrapContainerPlugin	2020-04-26 19:50:07.610484+02	2020-04-26 19:50:08.047983+02	\N	54	1	1	001I
295	0	en	BootstrapRowPlugin	2020-04-26 19:50:07.618451+02	2020-04-26 19:50:08.051692+02	294	54	2	1	001I0001
296	0	en	BootstrapColumnPlugin	2020-04-26 19:50:07.635077+02	2020-04-26 19:50:08.056241+02	295	54	3	1	001I00010001
303	0	en	HeadingPlugin	2020-04-26 19:50:07.728517+02	2020-04-26 19:50:08.090732+02	302	54	6	0	001I00010001000100030001
299	0	en	CustomerFormPlugin	2020-04-26 19:50:07.670796+02	2020-04-26 19:50:08.069878+02	298	54	6	0	001I00010001000100010001
298	0	en	SegmentPlugin	2020-04-26 19:50:07.660053+02	2020-04-26 19:50:08.065598+02	297	54	5	1	001I0001000100010001
305	0	de	BootstrapContainerPlugin	2020-04-26 19:50:08.156484+02	2020-04-26 19:50:08.158825+02	\N	56	1	1	001J
301	0	en	GuestFormPlugin	2020-04-26 19:50:07.694656+02	2020-04-26 19:50:08.080271+02	300	54	6	0	001I00010001000100020001
302	2	en	SegmentPlugin	2020-04-26 19:50:07.714652+02	2020-04-26 19:50:08.086028+02	297	54	5	1	001I0001000100010003
304	3	en	ShopProceedButton	2020-04-26 19:50:07.739005+02	2020-04-26 19:50:08.096898+02	297	54	5	0	001I0001000100010004
297	0	en	ValidateSetOfFormsPlugin	2020-04-26 19:50:07.647005+02	2020-04-26 19:50:08.060814+02	296	54	4	4	001I000100010001
306	0	de	BootstrapRowPlugin	2020-04-26 19:50:08.164473+02	2020-04-26 19:50:08.171226+02	305	56	2	1	001J0001
307	0	de	BootstrapColumnPlugin	2020-04-26 19:50:08.179359+02	2020-04-26 19:50:08.188522+02	306	56	3	1	001J00010001
309	0	de	BreadcrumbPlugin	2020-04-26 19:50:08.205134+02	2020-04-26 19:50:08.206947+02	\N	55	1	0	001K
308	0	de	ShopAuthenticationPlugin	2020-04-26 19:50:08.193283+02	2020-04-26 19:50:08.20057+02	307	56	4	0	001J000100010001
310	0	en	BreadcrumbPlugin	2020-04-26 19:50:08.205134+02	2020-04-26 19:50:08.221764+02	\N	55	1	0	001L
314	0	en	ShopAuthenticationPlugin	2020-04-26 19:50:08.193283+02	2020-04-26 19:50:08.272432+02	313	56	4	0	001M000100010001
311	0	en	BootstrapContainerPlugin	2020-04-26 19:50:08.156484+02	2020-04-26 19:50:08.237641+02	\N	56	1	1	001M
312	0	en	BootstrapRowPlugin	2020-04-26 19:50:08.164473+02	2020-04-26 19:50:08.249281+02	311	56	2	1	001M0001
313	0	en	BootstrapColumnPlugin	2020-04-26 19:50:08.179359+02	2020-04-26 19:50:08.261335+02	312	56	3	1	001M00010001
823	0	de	BootstrapContainerPlugin	2020-04-28 20:27:09.959027+02	2020-04-28 20:27:09.966386+02	\N	99	1	1	003V
924	0	de	BreadcrumbPlugin	2020-04-26 19:50:06.061793+02	2020-04-30 19:47:34.60031+02	\N	41	1	0	004E
320	0	en	BreadcrumbPlugin	2020-04-26 19:50:08.205134+02	2020-04-26 19:50:08.353604+02	\N	57	1	0	001P
321	0	en	BootstrapContainerPlugin	2020-04-26 19:50:08.156484+02	2020-04-26 19:50:08.365755+02	\N	58	1	1	001Q
322	0	en	BootstrapRowPlugin	2020-04-26 19:50:08.164473+02	2020-04-26 19:50:08.369136+02	321	58	2	1	001Q0001
324	0	en	ShopAuthenticationPlugin	2020-04-26 19:50:08.193283+02	2020-04-26 19:50:08.377763+02	323	58	4	0	001Q000100010001
323	0	en	BootstrapColumnPlugin	2020-04-26 19:50:08.179359+02	2020-04-26 19:50:08.373446+02	322	58	3	1	001Q00010001
325	0	de	BootstrapContainerPlugin	2020-04-26 19:50:08.435715+02	2020-04-26 19:50:08.438117+02	\N	60	1	1	001R
345	0	de	BootstrapContainerPlugin	2020-04-26 19:50:08.716078+02	2020-04-26 19:50:08.718767+02	\N	64	1	1	001Z
326	0	de	BootstrapRowPlugin	2020-04-26 19:50:08.443643+02	2020-04-26 19:50:08.450036+02	325	60	2	1	001R0001
925	0	de	BootstrapContainerPlugin	2020-04-26 19:50:05.894888+02	2020-04-30 19:47:34.656028+02	\N	42	1	1	004F
926	0	de	BootstrapRowPlugin	2020-04-26 19:50:05.902489+02	2020-04-30 19:47:34.662496+02	925	42	2	1	004F0001
327	0	de	BootstrapColumnPlugin	2020-04-26 19:50:08.454646+02	2020-04-26 19:50:08.467201+02	326	60	3	1	001R00010001
328	0	de	ShopAuthenticationPlugin	2020-04-26 19:50:08.471858+02	2020-04-26 19:50:08.478474+02	327	60	4	0	001R000100010001
329	0	de	BreadcrumbPlugin	2020-04-26 19:50:08.482738+02	2020-04-26 19:50:08.484479+02	\N	59	1	0	001S
330	0	en	BreadcrumbPlugin	2020-04-26 19:50:08.482738+02	2020-04-26 19:50:08.499516+02	\N	59	1	0	001T
346	0	de	BootstrapRowPlugin	2020-04-26 19:50:08.723701+02	2020-04-26 19:50:08.733385+02	345	64	2	1	001Z0001
331	0	en	BootstrapContainerPlugin	2020-04-26 19:50:08.435715+02	2020-04-26 19:50:08.515422+02	\N	60	1	1	001U
928	0	de	HeadingPlugin	2020-04-26 19:50:05.930673+02	2020-04-30 19:47:34.676694+02	927	42	4	0	004F000100010001
332	0	en	BootstrapRowPlugin	2020-04-26 19:50:08.443643+02	2020-04-26 19:50:08.527259+02	331	60	2	1	001U0001
333	0	en	BootstrapColumnPlugin	2020-04-26 19:50:08.454646+02	2020-04-26 19:50:08.538019+02	332	60	3	1	001U00010001
334	0	en	ShopAuthenticationPlugin	2020-04-26 19:50:08.471858+02	2020-04-26 19:50:08.54809+02	333	60	4	0	001U000100010001
335	0	de	BreadcrumbPlugin	2020-04-26 19:50:08.482738+02	2020-04-26 19:50:08.575331+02	\N	61	1	0	001V
336	0	de	BootstrapContainerPlugin	2020-04-26 19:50:08.435715+02	2020-04-26 19:50:08.591765+02	\N	62	1	1	001W
337	0	de	BootstrapRowPlugin	2020-04-26 19:50:08.443643+02	2020-04-26 19:50:08.595211+02	336	62	2	1	001W0001
339	0	de	ShopAuthenticationPlugin	2020-04-26 19:50:08.471858+02	2020-04-26 19:50:08.604184+02	338	62	4	0	001W000100010001
338	0	de	BootstrapColumnPlugin	2020-04-26 19:50:08.454646+02	2020-04-26 19:50:08.599669+02	337	62	3	1	001W00010001
340	0	en	BreadcrumbPlugin	2020-04-26 19:50:08.482738+02	2020-04-26 19:50:08.62574+02	\N	61	1	0	001X
341	0	en	BootstrapContainerPlugin	2020-04-26 19:50:08.435715+02	2020-04-26 19:50:08.639459+02	\N	62	1	1	001Y
342	0	en	BootstrapRowPlugin	2020-04-26 19:50:08.443643+02	2020-04-26 19:50:08.643253+02	341	62	2	1	001Y0001
344	0	en	ShopAuthenticationPlugin	2020-04-26 19:50:08.471858+02	2020-04-26 19:50:08.654525+02	343	62	4	0	001Y000100010001
343	0	en	BootstrapColumnPlugin	2020-04-26 19:50:08.454646+02	2020-04-26 19:50:08.649752+02	342	62	3	1	001Y00010001
927	0	de	BootstrapColumnPlugin	2020-04-26 19:50:05.919187+02	2020-04-30 19:47:34.670258+02	926	42	3	2	004F00010001
1110	0	de	HeadingPlugin	2020-04-26 19:50:10.144411+02	2020-04-30 19:52:43.685679+02	1109	82	7	0	004G000100010001000100030001
347	0	de	BootstrapColumnPlugin	2020-04-26 19:50:08.738389+02	2020-04-26 19:50:08.745497+02	346	64	3	1	001Z00010001
360	0	en	BreadcrumbPlugin	2020-04-26 19:50:08.760351+02	2020-04-26 19:50:08.899509+02	\N	65	1	0	0025
348	0	de	ShopAuthenticationPlugin	2020-04-26 19:50:08.749922+02	2020-04-26 19:50:08.756117+02	347	64	4	0	001Z000100010001
349	0	de	BreadcrumbPlugin	2020-04-26 19:50:08.760351+02	2020-04-26 19:50:08.761962+02	\N	63	1	0	0020
350	0	en	BreadcrumbPlugin	2020-04-26 19:50:08.760351+02	2020-04-26 19:50:08.776282+02	\N	63	1	0	0021
351	0	en	BootstrapContainerPlugin	2020-04-26 19:50:08.716078+02	2020-04-26 19:50:08.792187+02	\N	64	1	1	0022
352	0	en	BootstrapRowPlugin	2020-04-26 19:50:08.723701+02	2020-04-26 19:50:08.803103+02	351	64	2	1	00220001
361	0	en	BootstrapContainerPlugin	2020-04-26 19:50:08.716078+02	2020-04-26 19:50:08.91185+02	\N	66	1	1	0026
353	0	en	BootstrapColumnPlugin	2020-04-26 19:50:08.738389+02	2020-04-26 19:50:08.814319+02	352	64	3	1	002200010001
354	0	en	ShopAuthenticationPlugin	2020-04-26 19:50:08.749922+02	2020-04-26 19:50:08.824848+02	353	64	4	0	0022000100010001
837	0	de	BootstrapContainerPlugin	2020-04-26 19:50:03.777868+02	2020-04-29 20:54:15.732995+02	\N	2	1	3	003X
1111	1	de	ShopCartPlugin	2020-04-26 19:50:10.156506+02	2020-04-30 19:52:43.694848+02	1109	82	7	0	004G000100010001000100030002
362	0	en	BootstrapRowPlugin	2020-04-26 19:50:08.723701+02	2020-04-26 19:50:08.91526+02	361	66	2	1	00260001
364	0	en	ShopAuthenticationPlugin	2020-04-26 19:50:08.749922+02	2020-04-26 19:50:08.924719+02	363	66	4	0	0026000100010001
363	0	en	BootstrapColumnPlugin	2020-04-26 19:50:08.738389+02	2020-04-26 19:50:08.919859+02	362	66	3	1	002600010001
365	0	de	BootstrapContainerPlugin	2020-04-26 19:50:08.983528+02	2020-04-26 19:50:08.985794+02	\N	68	1	1	0027
366	0	de	BootstrapRowPlugin	2020-04-26 19:50:08.991668+02	2020-04-26 19:50:08.998056+02	365	68	2	1	00270001
369	0	de	BreadcrumbPlugin	2020-04-26 19:50:09.029822+02	2020-04-26 19:50:09.031582+02	\N	67	1	0	0028
370	0	en	BreadcrumbPlugin	2020-04-26 19:50:09.029822+02	2020-04-26 19:50:09.045981+02	\N	67	1	0	0029
367	0	de	BootstrapColumnPlugin	2020-04-26 19:50:09.00267+02	2020-04-26 19:50:09.013048+02	366	68	3	1	002700010001
368	0	de	ShopAuthenticationPlugin	2020-04-26 19:50:09.018795+02	2020-04-26 19:50:09.025484+02	367	68	4	0	0027000100010001
372	0	en	BootstrapRowPlugin	2020-04-26 19:50:08.991668+02	2020-04-26 19:50:09.072148+02	371	68	2	1	002A0001
371	0	en	BootstrapContainerPlugin	2020-04-26 19:50:08.983528+02	2020-04-26 19:50:09.061522+02	\N	68	1	1	002A
374	0	en	ShopAuthenticationPlugin	2020-04-26 19:50:09.018795+02	2020-04-26 19:50:09.09304+02	373	68	4	0	002A000100010001
373	0	en	BootstrapColumnPlugin	2020-04-26 19:50:09.00267+02	2020-04-26 19:50:09.08231+02	372	68	3	1	002A00010001
380	0	en	BreadcrumbPlugin	2020-04-26 19:50:09.029822+02	2020-04-26 19:50:09.171941+02	\N	69	1	0	002D
381	0	en	BootstrapContainerPlugin	2020-04-26 19:50:08.983528+02	2020-04-26 19:50:09.185499+02	\N	70	1	1	002E
382	0	en	BootstrapRowPlugin	2020-04-26 19:50:08.991668+02	2020-04-26 19:50:09.189184+02	381	70	2	1	002E0001
384	0	en	ShopAuthenticationPlugin	2020-04-26 19:50:09.018795+02	2020-04-26 19:50:09.19896+02	383	70	4	0	002E000100010001
383	0	en	BootstrapColumnPlugin	2020-04-26 19:50:09.00267+02	2020-04-26 19:50:09.193996+02	382	70	3	1	002E00010001
1112	2	de	PaymentMethodFormPlugin	2020-04-26 19:50:10.170224+02	2020-04-30 19:52:43.703195+02	1109	82	7	0	004G000100010001000100030003
385	0	de	BootstrapContainerPlugin	2020-04-26 19:50:09.260438+02	2020-04-26 19:50:09.2633+02	\N	72	1	1	002F
930	0	de	ShopLeftExtension	2020-04-26 19:50:05.953767+02	2020-04-30 19:47:34.692926+02	929	42	5	1	004F0001000100020001
386	0	de	BootstrapRowPlugin	2020-04-26 19:50:09.268365+02	2020-04-26 19:50:09.278059+02	385	72	2	1	002F0001
415	0	en	BootstrapColumnPlugin	2020-04-26 19:50:09.547726+02	2020-04-26 19:50:09.658091+02	414	76	3	3	002Q00010001
408	0	de	HeadingPlugin	2020-04-26 19:50:09.560461+02	2020-04-26 19:50:09.567214+02	407	76	4	0	002N000100010001
824	0	de	BootstrapRowPlugin	2020-04-28 20:27:17.932956+02	2020-04-28 20:27:17.940191+02	823	99	2	1	003V0001
387	0	de	BootstrapColumnPlugin	2020-04-26 19:50:09.285294+02	2020-04-26 19:50:09.291767+02	386	72	3	1	002F00010001
388	0	de	ShopAuthenticationPlugin	2020-04-26 19:50:09.296448+02	2020-04-26 19:50:09.303712+02	387	72	4	0	002F000100010001
389	0	de	BreadcrumbPlugin	2020-04-26 19:50:09.308525+02	2020-04-26 19:50:09.310154+02	\N	71	1	0	002G
390	0	en	BreadcrumbPlugin	2020-04-26 19:50:09.308525+02	2020-04-26 19:50:09.323945+02	\N	71	1	0	002H
391	0	en	BootstrapContainerPlugin	2020-04-26 19:50:09.260438+02	2020-04-26 19:50:09.33821+02	\N	72	1	1	002I
418	2	en	BootstrapButtonPlugin	2020-04-26 19:50:09.590044+02	2020-04-26 19:50:09.709156+02	415	76	4	0	002Q000100010003
392	0	en	BootstrapRowPlugin	2020-04-26 19:50:09.268365+02	2020-04-26 19:50:09.348692+02	391	72	2	1	002I0001
417	1	en	TextPlugin	2020-04-26 19:50:09.571623+02	2020-04-26 19:50:09.72175+02	415	76	4	0	002Q000100010002
393	0	en	BootstrapColumnPlugin	2020-04-26 19:50:09.285294+02	2020-04-26 19:50:09.358773+02	392	72	3	1	002I00010001
394	0	en	ShopAuthenticationPlugin	2020-04-26 19:50:09.296448+02	2020-04-26 19:50:09.370066+02	393	72	4	0	002I000100010001
395	0	de	BreadcrumbPlugin	2020-04-26 19:50:09.308525+02	2020-04-26 19:50:09.396425+02	\N	73	1	0	002J
396	0	de	BootstrapContainerPlugin	2020-04-26 19:50:09.260438+02	2020-04-26 19:50:09.411998+02	\N	74	1	1	002K
397	0	de	BootstrapRowPlugin	2020-04-26 19:50:09.268365+02	2020-04-26 19:50:09.415137+02	396	74	2	1	002K0001
399	0	de	ShopAuthenticationPlugin	2020-04-26 19:50:09.296448+02	2020-04-26 19:50:09.423412+02	398	74	4	0	002K000100010001
398	0	de	BootstrapColumnPlugin	2020-04-26 19:50:09.285294+02	2020-04-26 19:50:09.419105+02	397	74	3	1	002K00010001
439	0	de	SegmentPlugin	2020-04-26 19:50:09.994566+02	2020-04-26 19:50:10.001942+02	438	80	7	1	002V000100010001000100010001
933	0	de	HeadingPlugin	2020-04-26 19:50:05.986455+02	2020-04-30 19:47:34.713551+02	932	42	8	0	004F0001000100020001000100010001
932	0	de	BootstrapCardHeaderPlugin	2020-04-26 19:50:05.97481+02	2020-04-30 19:47:34.706847+02	931	42	7	1	004F000100010002000100010001
1113	3	de	ShippingMethodFormPlugin	2020-04-26 19:50:10.183504+02	2020-04-30 19:52:43.71225+02	1109	82	7	0	004G000100010001000100030004
438	0	de	ProcessStepPlugin	2020-04-26 19:50:09.983463+02	2020-04-30 19:48:00.833197+02	437	80	6	5	002V00010001000100010001
441	1	de	SegmentPlugin	2020-04-26 19:50:10.017807+02	2020-04-26 19:50:10.025745+02	438	80	7	1	002V000100010001000100010002
443	3	de	RequiredFormFieldsPlugin	2020-04-26 19:50:10.041552+02	2020-04-26 19:50:10.04948+02	438	80	7	0	002V000100010001000100010003
419	0	de	BreadcrumbPlugin	2020-04-26 19:50:09.603716+02	2020-04-26 19:50:09.744867+02	\N	77	1	0	002R
444	4	de	ShopProceedButton	2020-04-26 19:50:10.054018+02	2020-04-30 19:48:57.840519+02	438	80	7	0	002V000100010001000100010004
405	0	de	BootstrapContainerPlugin	2020-04-26 19:50:09.524452+02	2020-04-26 19:50:09.526359+02	\N	76	1	1	002N
409	1	de	TextPlugin	2020-04-26 19:50:09.571623+02	2020-04-26 19:50:09.584217+02	407	76	4	0	002N000100010002
1114	4	de	ExtraAnnotationFormPlugin	2020-04-26 19:50:10.196102+02	2020-04-30 19:52:43.720972+02	1109	82	7	0	004G000100010001000100030005
406	0	de	BootstrapRowPlugin	2020-04-26 19:50:09.530962+02	2020-04-26 19:50:09.539297+02	405	76	2	1	002N0001
420	0	de	BootstrapContainerPlugin	2020-04-26 19:50:09.524452+02	2020-04-26 19:50:09.763755+02	\N	78	1	1	002S
407	0	de	BootstrapColumnPlugin	2020-04-26 19:50:09.547726+02	2020-04-26 19:50:09.555614+02	406	76	3	3	002N00010001
410	2	de	BootstrapButtonPlugin	2020-04-26 19:50:09.590044+02	2020-04-26 19:50:09.598885+02	407	76	4	0	002N000100010003
411	0	de	BreadcrumbPlugin	2020-04-26 19:50:09.603716+02	2020-04-26 19:50:09.605577+02	\N	75	1	0	002O
412	0	en	BreadcrumbPlugin	2020-04-26 19:50:09.603716+02	2020-04-26 19:50:09.620375+02	\N	75	1	0	002P
421	0	de	BootstrapRowPlugin	2020-04-26 19:50:09.530962+02	2020-04-26 19:50:09.767434+02	420	78	2	1	002S0001
413	0	en	BootstrapContainerPlugin	2020-04-26 19:50:09.524452+02	2020-04-26 19:50:09.635941+02	\N	76	1	1	002Q
423	0	de	HeadingPlugin	2020-04-26 19:50:09.560461+02	2020-04-26 19:50:09.777388+02	422	78	4	0	002S000100010001
414	0	en	BootstrapRowPlugin	2020-04-26 19:50:09.530962+02	2020-04-26 19:50:09.646885+02	413	76	2	1	002Q0001
434	0	de	SegmentPlugin	2020-04-26 19:50:09.931213+02	2020-04-26 19:50:09.938631+02	433	80	2	1	002V0001
416	0	en	HeadingPlugin	2020-04-26 19:50:09.560461+02	2020-04-26 19:50:09.668273+02	415	76	4	0	002Q000100010001
432	2	en	BootstrapButtonPlugin	2020-04-26 19:50:09.590044+02	2020-04-26 19:50:09.861871+02	429	78	4	0	002U000100010003
429	0	en	BootstrapColumnPlugin	2020-04-26 19:50:09.547726+02	2020-04-26 19:50:09.844384+02	428	78	3	3	002U00010001
431	1	en	TextPlugin	2020-04-26 19:50:09.571623+02	2020-04-26 19:50:09.867317+02	429	78	4	0	002U000100010002
425	2	de	BootstrapButtonPlugin	2020-04-26 19:50:09.590044+02	2020-04-26 19:50:09.789438+02	422	78	4	0	002S000100010003
422	0	de	BootstrapColumnPlugin	2020-04-26 19:50:09.547726+02	2020-04-26 19:50:09.772264+02	421	78	3	3	002S00010001
424	1	de	TextPlugin	2020-04-26 19:50:09.571623+02	2020-04-26 19:50:09.795679+02	422	78	4	0	002S000100010002
426	0	en	BreadcrumbPlugin	2020-04-26 19:50:09.603716+02	2020-04-26 19:50:09.81849+02	\N	77	1	0	002T
427	0	en	BootstrapContainerPlugin	2020-04-26 19:50:09.524452+02	2020-04-26 19:50:09.835822+02	\N	78	1	1	002U
428	0	en	BootstrapRowPlugin	2020-04-26 19:50:09.530962+02	2020-04-26 19:50:09.839533+02	427	78	2	1	002U0001
430	0	en	HeadingPlugin	2020-04-26 19:50:09.560461+02	2020-04-26 19:50:09.849118+02	429	78	4	0	002U000100010001
433	0	de	BootstrapContainerPlugin	2020-04-26 19:50:09.923533+02	2020-04-26 19:50:09.925183+02	\N	80	1	2	002V
435	0	de	BootstrapRowPlugin	2020-04-26 19:50:09.947377+02	2020-04-26 19:50:09.955618+02	434	80	3	1	002V00010001
436	0	de	BootstrapColumnPlugin	2020-04-26 19:50:09.960732+02	2020-04-26 19:50:09.967649+02	435	80	4	1	002V000100010001
440	0	de	CustomerFormPlugin	2020-04-26 19:50:10.006888+02	2020-04-26 19:50:10.013472+02	439	80	8	0	002V0001000100010001000100010001
442	0	de	GuestFormPlugin	2020-04-26 19:50:10.030531+02	2020-04-26 19:50:10.036909+02	441	80	8	0	002V0001000100010001000100020001
437	0	de	ProcessBarPlugin	2020-04-26 19:50:09.972176+02	2020-04-26 19:50:09.978933+02	436	80	5	4	002V0001000100010001
931	0	de	BootstrapCardPlugin	2020-04-26 19:50:05.964379+02	2020-04-30 19:47:34.699966+02	930	42	6	2	004F00010001000200010001
472	10	de	ShopProceedButton	2020-04-26 19:50:10.420764+02	2020-04-30 19:51:05.544298+02	458	80	7	0	002V00010001000100010004000B
446	0	de	CheckoutAddressPlugin	2020-04-26 19:50:10.080205+02	2020-04-26 19:50:10.087026+02	445	80	7	0	002V000100010001000100020001
450	2	de	ProcessStepPlugin	2020-04-26 19:50:10.131762+02	2020-04-30 19:48:18.816748+02	437	80	6	7	002V00010001000100010003
458	3	de	ProcessStepPlugin	2020-04-26 19:50:10.236423+02	2020-04-30 19:48:26.442235+02	437	80	6	11	002V00010001000100010004
447	1	de	CheckoutAddressPlugin	2020-04-26 19:50:10.091528+02	2020-04-26 19:50:10.100516+02	445	80	7	0	002V000100010001000100020002
449	3	de	ShopProceedButton	2020-04-26 19:50:10.118929+02	2020-04-30 19:50:45.273468+02	445	80	7	0	002V000100010001000100020004
459	0	de	HeadingPlugin	2020-04-26 19:50:10.249167+02	2020-04-30 19:51:47.882199+02	458	80	7	0	002V000100010001000100040001
466	5	de	PaymentMethodFormPlugin	2020-04-26 19:50:10.33484+02	2020-04-26 19:50:10.343368+02	458	80	7	0	002V000100010001000100040006
448	2	de	RequiredFormFieldsPlugin	2020-04-26 19:50:10.105647+02	2020-04-26 19:50:10.114301+02	445	80	7	0	002V000100010001000100020003
457	6	de	ShopProceedButton	2020-04-26 19:50:10.223865+02	2020-04-30 19:50:54.120318+02	450	80	7	0	002V000100010001000100030007
1115	5	de	RequiredFormFieldsPlugin	2020-04-26 19:50:10.210065+02	2020-04-30 19:52:43.730011+02	1109	82	7	0	004G000100010001000100030006
451	0	de	HeadingPlugin	2020-04-26 19:50:10.144411+02	2020-04-26 19:50:10.151278+02	450	80	7	0	002V000100010001000100030001
452	1	de	ShopCartPlugin	2020-04-26 19:50:10.156506+02	2020-04-26 19:50:10.165291+02	450	80	7	0	002V000100010001000100030002
453	2	de	PaymentMethodFormPlugin	2020-04-26 19:50:10.170224+02	2020-04-26 19:50:10.179046+02	450	80	7	0	002V000100010001000100030003
460	1	de	ShopCartPlugin	2020-04-26 19:50:10.261366+02	2020-04-26 19:50:10.270166+02	458	80	7	0	002V000100010001000100040002
454	3	de	ShippingMethodFormPlugin	2020-04-26 19:50:10.183504+02	2020-04-26 19:50:10.191497+02	450	80	7	0	002V000100010001000100030004
467	6	de	ShippingMethodFormPlugin	2020-04-26 19:50:10.348022+02	2020-04-26 19:50:10.355957+02	458	80	7	0	002V000100010001000100040007
455	4	de	ExtraAnnotationFormPlugin	2020-04-26 19:50:10.196102+02	2020-04-26 19:50:10.204914+02	450	80	7	0	002V000100010001000100030005
456	5	de	RequiredFormFieldsPlugin	2020-04-26 19:50:10.210065+02	2020-04-26 19:50:10.219118+02	450	80	7	0	002V000100010001000100030006
477	1	de	BootstrapColumnPlugin	2020-04-26 19:50:10.483103+02	2020-04-26 19:50:10.491019+02	474	80	4	1	002V000200010002
461	2	de	SegmentPlugin	2020-04-26 19:50:10.274702+02	2020-04-26 19:50:10.282934+02	458	80	7	1	002V000100010001000100040003
462	0	de	CustomerFormPlugin	2020-04-26 19:50:10.287547+02	2020-04-26 19:50:10.293983+02	461	80	8	0	002V0001000100010001000400030001
468	7	de	ExtraAnnotationFormPlugin	2020-04-26 19:50:10.360534+02	2020-04-26 19:50:10.368753+02	458	80	7	0	002V000100010001000100040008
463	3	de	SegmentPlugin	2020-04-26 19:50:10.298616+02	2020-04-26 19:50:10.306657+02	458	80	7	1	002V000100010001000100040004
464	0	de	GuestFormPlugin	2020-04-26 19:50:10.311135+02	2020-04-26 19:50:10.317548+02	463	80	8	0	002V0001000100010001000400040001
473	1	de	SegmentPlugin	2020-04-26 19:50:10.434577+02	2020-04-26 19:50:10.443454+02	433	80	2	1	002V0002
465	4	de	CheckoutAddressPlugin	2020-04-26 19:50:10.322061+02	2020-04-26 19:50:10.330221+02	458	80	7	0	002V000100010001000100040005
478	0	de	ShopAuthenticationPlugin	2020-04-26 19:50:10.49554+02	2020-04-26 19:50:10.502122+02	477	80	5	0	002V0002000100020001
471	9	de	RequiredFormFieldsPlugin	2020-04-26 19:50:10.406919+02	2020-04-26 19:50:10.415878+02	458	80	7	0	002V00010001000100010004000A
474	0	de	BootstrapRowPlugin	2020-04-26 19:50:10.448387+02	2020-04-26 19:50:10.455683+02	473	80	3	3	002V00020001
483	0	en	BootstrapRowPlugin	2020-04-26 19:50:09.947377+02	2020-04-26 19:50:10.605663+02	482	80	3	1	002W00010001
475	0	de	BootstrapColumnPlugin	2020-04-26 19:50:10.460463+02	2020-04-26 19:50:10.467377+02	474	80	4	1	002V000200010001
476	0	de	ShopAuthenticationPlugin	2020-04-26 19:50:10.47212+02	2020-04-26 19:50:10.478552+02	475	80	5	0	002V0002000100010001
484	0	en	BootstrapColumnPlugin	2020-04-26 19:50:09.960732+02	2020-04-26 19:50:10.618025+02	483	80	4	1	002W000100010001
479	2	de	BootstrapColumnPlugin	2020-04-26 19:50:10.506823+02	2020-04-26 19:50:10.515977+02	474	80	4	1	002V000200010003
480	0	de	ShopAuthenticationPlugin	2020-04-26 19:50:10.521116+02	2020-04-26 19:50:10.528186+02	479	80	5	0	002V0002000100030001
482	0	en	SegmentPlugin	2020-04-26 19:50:09.931213+02	2020-04-26 19:50:10.595006+02	481	80	2	1	002W0001
486	0	en	ProcessStepPlugin	2020-04-26 19:50:09.983463+02	2020-04-26 19:50:10.640185+02	485	80	6	4	002W00010001000100010001
492	3	en	ShopProceedButton	2020-04-26 19:50:10.054018+02	2020-04-26 19:50:10.736291+02	486	80	7	0	002W000100010001000100010004
489	1	en	SegmentPlugin	2020-04-26 19:50:10.017807+02	2020-04-26 19:50:10.676571+02	486	80	7	1	002W000100010001000100010002
487	0	en	SegmentPlugin	2020-04-26 19:50:09.994566+02	2020-04-26 19:50:10.652816+02	486	80	7	1	002W000100010001000100010001
488	0	en	CustomerFormPlugin	2020-04-26 19:50:10.006888+02	2020-04-26 19:50:10.664198+02	487	80	8	0	002W0001000100010001000100010001
490	0	en	GuestFormPlugin	2020-04-26 19:50:10.030531+02	2020-04-26 19:50:10.703531+02	489	80	8	0	002W0001000100010001000100020001
497	3	en	ShopProceedButton	2020-04-26 19:50:10.118929+02	2020-04-26 19:50:10.795618+02	493	80	7	0	002W000100010001000100020004
491	2	en	RequiredFormFieldsPlugin	2020-04-26 19:50:10.041552+02	2020-04-26 19:50:10.723489+02	486	80	7	0	002W000100010001000100010003
499	0	en	HeadingPlugin	2020-04-26 19:50:10.144411+02	2020-04-26 19:50:10.818366+02	498	80	7	0	002W000100010001000100030001
494	0	en	CheckoutAddressPlugin	2020-04-26 19:50:10.080205+02	2020-04-26 19:50:10.759192+02	493	80	7	0	002W000100010001000100020001
495	1	en	CheckoutAddressPlugin	2020-04-26 19:50:10.091528+02	2020-04-26 19:50:10.770842+02	493	80	7	0	002W000100010001000100020002
496	2	en	RequiredFormFieldsPlugin	2020-04-26 19:50:10.105647+02	2020-04-26 19:50:10.782713+02	493	80	7	0	002W000100010001000100020003
493	1	en	ProcessStepPlugin	2020-04-26 19:50:10.066481+02	2020-04-26 19:50:10.748604+02	485	80	6	4	002W00010001000100010002
481	0	en	BootstrapContainerPlugin	2020-04-26 19:50:09.923533+02	2020-04-26 19:50:10.583566+02	\N	80	1	2	002W
500	1	en	ShopCartPlugin	2020-04-26 19:50:10.156506+02	2020-04-26 19:50:10.831223+02	498	80	7	0	002W000100010001000100030002
501	2	en	PaymentMethodFormPlugin	2020-04-26 19:50:10.170224+02	2020-04-26 19:50:10.844273+02	498	80	7	0	002W000100010001000100030003
502	3	en	ShippingMethodFormPlugin	2020-04-26 19:50:10.183504+02	2020-04-26 19:50:10.856081+02	498	80	7	0	002W000100010001000100030004
503	4	en	ExtraAnnotationFormPlugin	2020-04-26 19:50:10.196102+02	2020-04-26 19:50:10.86764+02	498	80	7	0	002W000100010001000100030005
485	0	en	ProcessBarPlugin	2020-04-26 19:50:09.972176+02	2020-04-26 19:50:10.628667+02	484	80	5	4	002W0001000100010001
1116	6	de	ShopProceedButton	2020-04-26 19:50:10.223865+02	2020-04-30 19:52:43.738667+02	1109	82	7	0	004G000100010001000100030007
504	5	en	RequiredFormFieldsPlugin	2020-04-26 19:50:10.210065+02	2020-04-26 19:50:10.880264+02	498	80	7	0	002W000100010001000100030006
498	2	en	ProcessStepPlugin	2020-04-26 19:50:10.131762+02	2020-04-26 19:50:10.808118+02	485	80	6	7	002W00010001000100010003
505	6	en	ShopProceedButton	2020-04-26 19:50:10.223865+02	2020-04-26 19:50:10.8929+02	498	80	7	0	002W000100010001000100030007
1109	2	de	ProcessStepPlugin	2020-04-26 19:50:10.131762+02	2020-04-30 19:52:43.678167+02	1094	82	6	7	004G00010001000100010003
507	0	en	HeadingPlugin	2020-04-26 19:50:10.249167+02	2020-04-26 19:50:10.916364+02	506	80	7	0	002W000100010001000100040001
523	0	en	BootstrapColumnPlugin	2020-04-26 19:50:10.460463+02	2020-04-26 19:50:11.105399+02	522	80	4	1	002W000200010001
508	1	en	ShopCartPlugin	2020-04-26 19:50:10.261366+02	2020-04-26 19:50:10.929119+02	506	80	7	0	002W000100010001000100040002
524	0	en	ShopAuthenticationPlugin	2020-04-26 19:50:10.47212+02	2020-04-26 19:50:11.116495+02	523	80	5	0	002W0002000100010001
509	2	en	SegmentPlugin	2020-04-26 19:50:10.274702+02	2020-04-26 19:50:10.941925+02	506	80	7	1	002W000100010001000100040003
510	0	en	CustomerFormPlugin	2020-04-26 19:50:10.287547+02	2020-04-26 19:50:10.953719+02	509	80	8	0	002W0001000100010001000400030001
1094	0	de	ProcessBarPlugin	2020-04-26 19:50:09.972176+02	2020-04-30 19:52:43.556227+02	1093	82	5	4	004G0001000100010001
511	3	en	SegmentPlugin	2020-04-26 19:50:10.298616+02	2020-04-26 19:50:10.966147+02	506	80	7	1	002W000100010001000100040004
512	0	en	GuestFormPlugin	2020-04-26 19:50:10.311135+02	2020-04-26 19:50:10.977096+02	511	80	8	0	002W0001000100010001000400040001
513	4	en	CheckoutAddressPlugin	2020-04-26 19:50:10.322061+02	2020-04-26 19:50:10.988338+02	506	80	7	0	002W000100010001000100040005
525	1	en	BootstrapColumnPlugin	2020-04-26 19:50:10.483103+02	2020-04-26 19:50:11.129275+02	522	80	4	1	002W000200010002
514	5	en	PaymentMethodFormPlugin	2020-04-26 19:50:10.33484+02	2020-04-26 19:50:10.999758+02	506	80	7	0	002W000100010001000100040006
526	0	en	ShopAuthenticationPlugin	2020-04-26 19:50:10.49554+02	2020-04-26 19:50:11.140487+02	525	80	5	0	002W0002000100020001
515	6	en	ShippingMethodFormPlugin	2020-04-26 19:50:10.348022+02	2020-04-26 19:50:11.011443+02	506	80	7	0	002W000100010001000100040007
516	7	en	ExtraAnnotationFormPlugin	2020-04-26 19:50:10.360534+02	2020-04-26 19:50:11.023037+02	506	80	7	0	002W000100010001000100040008
522	0	en	BootstrapRowPlugin	2020-04-26 19:50:10.448387+02	2020-04-26 19:50:11.094942+02	521	80	3	3	002W00020001
1118	0	de	HeadingPlugin	2020-04-26 19:50:10.249167+02	2020-04-30 19:52:43.755044+02	1117	82	7	0	004G000100010001000100040001
518	0	en	TextLinkPlugin	2020-04-26 19:50:10.388199+02	2020-04-26 19:50:11.04788+02	517	80	8	0	002W0001000100010001000400090001
519	9	en	RequiredFormFieldsPlugin	2020-04-26 19:50:10.406919+02	2020-04-26 19:50:11.059894+02	506	80	7	0	002W00010001000100010004000A
506	3	en	ProcessStepPlugin	2020-04-26 19:50:10.236423+02	2020-04-26 19:50:10.905378+02	485	80	6	11	002W00010001000100010004
520	10	en	ShopProceedButton	2020-04-26 19:50:10.420764+02	2020-04-26 19:50:11.072012+02	506	80	7	0	002W00010001000100010004000B
527	2	en	BootstrapColumnPlugin	2020-04-26 19:50:10.506823+02	2020-04-26 19:50:11.15297+02	522	80	4	1	002W000200010003
521	1	en	SegmentPlugin	2020-04-26 19:50:10.434577+02	2020-04-26 19:50:11.083553+02	481	80	2	1	002W0002
1119	1	de	ShopCartPlugin	2020-04-26 19:50:10.261366+02	2020-04-30 19:52:43.763904+02	1117	82	7	0	004G000100010001000100040002
528	0	en	ShopAuthenticationPlugin	2020-04-26 19:50:10.521116+02	2020-04-26 19:50:11.164219+02	527	80	5	0	002W0002000100030001
517	8	en	AcceptConditionPlugin	2020-04-26 19:50:10.373352+02	2020-04-26 19:50:11.21299+02	506	80	7	1	002W000100010001000100040009
1121	0	de	CustomerFormPlugin	2020-04-26 19:50:10.287547+02	2020-04-30 19:52:43.779522+02	1120	82	8	0	004G0001000100010001000400030001
1120	2	de	SegmentPlugin	2020-04-26 19:50:10.274702+02	2020-04-30 19:52:43.772439+02	1117	82	7	1	004G000100010001000100040003
1123	0	de	GuestFormPlugin	2020-04-26 19:50:10.311135+02	2020-04-30 19:52:43.796059+02	1122	82	8	0	004G0001000100010001000400040001
1122	3	de	SegmentPlugin	2020-04-26 19:50:10.298616+02	2020-04-30 19:52:43.788481+02	1117	82	7	1	004G000100010001000100040004
1124	4	de	CheckoutAddressPlugin	2020-04-26 19:50:10.322061+02	2020-04-30 19:52:43.805055+02	1117	82	7	0	004G000100010001000100040005
1125	5	de	PaymentMethodFormPlugin	2020-04-26 19:50:10.33484+02	2020-04-30 19:52:43.814018+02	1117	82	7	0	004G000100010001000100040006
1126	6	de	ShippingMethodFormPlugin	2020-04-26 19:50:10.348022+02	2020-04-30 19:52:43.822239+02	1117	82	7	0	004G000100010001000100040007
1127	7	de	ExtraAnnotationFormPlugin	2020-04-26 19:50:10.360534+02	2020-04-30 19:52:43.831253+02	1117	82	7	0	004G000100010001000100040008
1129	1	de	TextLinkPlugin	2020-04-30 19:52:32.545099+02	2020-04-30 19:52:43.845859+02	1128	82	8	0	004G0001000100010001000400090001
1130	9	de	RequiredFormFieldsPlugin	2020-04-26 19:50:10.406919+02	2020-04-30 19:52:43.85492+02	1117	82	7	0	004G00010001000100010004000A
1131	10	de	ShopProceedButton	2020-04-26 19:50:10.420764+02	2020-04-30 19:52:43.864408+02	1117	82	7	0	004G00010001000100010004000B
1117	3	de	ProcessStepPlugin	2020-04-26 19:50:10.236423+02	2020-04-30 19:52:43.74836+02	1094	82	6	11	004G00010001000100010004
1090	0	de	BootstrapContainerPlugin	2020-04-26 19:50:09.923533+02	2020-04-30 19:52:43.530197+02	\N	82	1	2	004G
1132	1	de	SegmentPlugin	2020-04-26 19:50:10.434577+02	2020-04-30 19:52:43.873621+02	1090	82	2	1	004G0002
593	3	en	ShopProceedButton	2020-04-26 19:50:10.118929+02	2020-04-26 19:50:11.72885+02	589	82	7	0	002Y000100010001000100020004
589	1	en	ProcessStepPlugin	2020-04-26 19:50:10.066481+02	2020-04-26 19:50:11.684239+02	581	82	6	4	002Y00010001000100010002
1135	0	de	ShopAuthenticationPlugin	2020-04-26 19:50:10.47212+02	2020-04-30 19:52:43.897796+02	1134	82	5	0	004G0002000100010001
1134	0	de	BootstrapColumnPlugin	2020-04-26 19:50:10.460463+02	2020-04-30 19:52:43.890009+02	1133	82	4	1	004G000200010001
605	2	en	SegmentPlugin	2020-04-26 19:50:10.274702+02	2020-04-26 19:50:11.800065+02	602	82	7	1	002Y000100010001000100040003
1137	0	de	ShopAuthenticationPlugin	2020-04-26 19:50:10.49554+02	2020-04-30 19:52:43.915243+02	1136	82	5	0	004G0002000100020001
1136	1	de	BootstrapColumnPlugin	2020-04-26 19:50:10.483103+02	2020-04-30 19:52:43.907362+02	1133	82	4	1	004G000200010002
595	0	en	HeadingPlugin	2020-04-26 19:50:10.144411+02	2020-04-26 19:50:11.739738+02	594	82	7	0	002Y000100010001000100030001
617	1	en	SegmentPlugin	2020-04-26 19:50:10.434577+02	2020-04-26 19:50:11.871629+02	577	82	2	1	002Y0002
578	0	en	SegmentPlugin	2020-04-26 19:50:09.931213+02	2020-04-26 19:50:11.62542+02	577	82	2	1	002Y0001
579	0	en	BootstrapRowPlugin	2020-04-26 19:50:09.947377+02	2020-04-26 19:50:11.629989+02	578	82	3	1	002Y00010001
580	0	en	BootstrapColumnPlugin	2020-04-26 19:50:09.960732+02	2020-04-26 19:50:11.634724+02	579	82	4	1	002Y000100010001
596	1	en	ShopCartPlugin	2020-04-26 19:50:10.156506+02	2020-04-26 19:50:11.746166+02	594	82	7	0	002Y000100010001000100030002
584	0	en	CustomerFormPlugin	2020-04-26 19:50:10.006888+02	2020-04-26 19:50:11.654614+02	583	82	8	0	002Y0001000100010001000100010001
583	0	en	SegmentPlugin	2020-04-26 19:50:09.994566+02	2020-04-26 19:50:11.650291+02	582	82	7	1	002Y000100010001000100010001
597	2	en	PaymentMethodFormPlugin	2020-04-26 19:50:10.170224+02	2020-04-26 19:50:11.75234+02	594	82	7	0	002Y000100010001000100030003
586	0	en	GuestFormPlugin	2020-04-26 19:50:10.030531+02	2020-04-26 19:50:11.665187+02	585	82	8	0	002Y0001000100010001000100020001
585	1	en	SegmentPlugin	2020-04-26 19:50:10.017807+02	2020-04-26 19:50:11.66037+02	582	82	7	1	002Y000100010001000100010002
587	2	en	RequiredFormFieldsPlugin	2020-04-26 19:50:10.041552+02	2020-04-26 19:50:11.670927+02	582	82	7	0	002Y000100010001000100010003
608	0	en	GuestFormPlugin	2020-04-26 19:50:10.311135+02	2020-04-26 19:50:11.816253+02	607	82	8	0	002Y0001000100010001000400040001
588	3	en	ShopProceedButton	2020-04-26 19:50:10.054018+02	2020-04-26 19:50:11.677293+02	582	82	7	0	002Y000100010001000100010004
582	0	en	ProcessStepPlugin	2020-04-26 19:50:09.983463+02	2020-04-26 19:50:11.644287+02	581	82	6	4	002Y00010001000100010001
607	3	en	SegmentPlugin	2020-04-26 19:50:10.298616+02	2020-04-26 19:50:11.811254+02	602	82	7	1	002Y000100010001000100040004
590	0	en	CheckoutAddressPlugin	2020-04-26 19:50:10.080205+02	2020-04-26 19:50:11.704207+02	589	82	7	0	002Y000100010001000100020001
598	3	en	ShippingMethodFormPlugin	2020-04-26 19:50:10.183504+02	2020-04-26 19:50:11.758123+02	594	82	7	0	002Y000100010001000100030004
591	1	en	CheckoutAddressPlugin	2020-04-26 19:50:10.091528+02	2020-04-26 19:50:11.716287+02	589	82	7	0	002Y000100010001000100020002
609	4	en	CheckoutAddressPlugin	2020-04-26 19:50:10.322061+02	2020-04-26 19:50:11.822797+02	602	82	7	0	002Y000100010001000100040005
592	2	en	RequiredFormFieldsPlugin	2020-04-26 19:50:10.105647+02	2020-04-26 19:50:11.722474+02	589	82	7	0	002Y000100010001000100020003
599	4	en	ExtraAnnotationFormPlugin	2020-04-26 19:50:10.196102+02	2020-04-26 19:50:11.764099+02	594	82	7	0	002Y000100010001000100030005
610	5	en	PaymentMethodFormPlugin	2020-04-26 19:50:10.33484+02	2020-04-26 19:50:11.828461+02	602	82	7	0	002Y000100010001000100040006
600	5	en	RequiredFormFieldsPlugin	2020-04-26 19:50:10.210065+02	2020-04-26 19:50:11.770172+02	594	82	7	0	002Y000100010001000100030006
577	0	en	BootstrapContainerPlugin	2020-04-26 19:50:09.923533+02	2020-04-26 19:50:11.620032+02	\N	82	1	2	002Y
601	6	en	ShopProceedButton	2020-04-26 19:50:10.223865+02	2020-04-26 19:50:11.776591+02	594	82	7	0	002Y000100010001000100030007
594	2	en	ProcessStepPlugin	2020-04-26 19:50:10.131762+02	2020-04-26 19:50:11.734481+02	581	82	6	7	002Y00010001000100010003
581	0	en	ProcessBarPlugin	2020-04-26 19:50:09.972176+02	2020-04-26 19:50:11.639818+02	580	82	5	4	002Y0001000100010001
603	0	en	HeadingPlugin	2020-04-26 19:50:10.249167+02	2020-04-26 19:50:11.787859+02	602	82	7	0	002Y000100010001000100040001
611	6	en	ShippingMethodFormPlugin	2020-04-26 19:50:10.348022+02	2020-04-26 19:50:11.83479+02	602	82	7	0	002Y000100010001000100040007
604	1	en	ShopCartPlugin	2020-04-26 19:50:10.261366+02	2020-04-26 19:50:11.793885+02	602	82	7	0	002Y000100010001000100040002
616	10	en	ShopProceedButton	2020-04-26 19:50:10.420764+02	2020-04-26 19:50:11.865184+02	602	82	7	0	002Y00010001000100010004000B
614	0	en	TextLinkPlugin	2020-04-26 19:50:10.388199+02	2020-04-26 19:50:11.852516+02	613	82	8	0	002Y0001000100010001000400090001
606	0	en	CustomerFormPlugin	2020-04-26 19:50:10.287547+02	2020-04-26 19:50:11.804959+02	605	82	8	0	002Y0001000100010001000400030001
612	7	en	ExtraAnnotationFormPlugin	2020-04-26 19:50:10.360534+02	2020-04-26 19:50:11.840993+02	602	82	7	0	002Y000100010001000100040008
615	9	en	RequiredFormFieldsPlugin	2020-04-26 19:50:10.406919+02	2020-04-26 19:50:11.859116+02	602	82	7	0	002Y00010001000100010004000A
602	3	en	ProcessStepPlugin	2020-04-26 19:50:10.236423+02	2020-04-26 19:50:11.782315+02	581	82	6	11	002Y00010001000100010004
621	1	en	BootstrapColumnPlugin	2020-04-26 19:50:10.483103+02	2020-04-26 19:50:11.892397+02	618	82	4	1	002Y000200010002
620	0	en	ShopAuthenticationPlugin	2020-04-26 19:50:10.47212+02	2020-04-26 19:50:11.886343+02	619	82	5	0	002Y0002000100010001
619	0	en	BootstrapColumnPlugin	2020-04-26 19:50:10.460463+02	2020-04-26 19:50:11.881671+02	618	82	4	1	002Y000200010001
623	2	en	BootstrapColumnPlugin	2020-04-26 19:50:10.506823+02	2020-04-26 19:50:11.903415+02	618	82	4	1	002Y000200010003
622	0	en	ShopAuthenticationPlugin	2020-04-26 19:50:10.49554+02	2020-04-26 19:50:11.897477+02	621	82	5	0	002Y0002000100020001
618	0	en	BootstrapRowPlugin	2020-04-26 19:50:10.448387+02	2020-04-26 19:50:11.876451+02	617	82	3	3	002Y00020001
613	8	en	AcceptConditionPlugin	2020-04-26 19:50:10.373352+02	2020-04-26 19:50:11.916855+02	602	82	7	1	002Y000100010001000100040009
624	0	en	ShopAuthenticationPlugin	2020-04-26 19:50:10.521116+02	2020-04-26 19:50:11.908745+02	623	82	5	0	002Y0002000100030001
826	0	de	ContactUsPlugin	2020-04-28 20:27:29.652117+02	2020-04-28 20:27:29.65596+02	825	99	4	0	003V000100010001
825	0	de	BootstrapColumnPlugin	2020-04-28 20:27:17.954588+02	2020-04-28 20:27:17.970461+02	824	99	3	1	003V00010001
936	1	de	BootstrapButtonPlugin	2020-04-26 19:50:06.026099+02	2020-04-30 19:47:34.735432+02	934	42	8	0	004F0001000100020001000100020002
934	1	de	BootstrapCardBodyPlugin	2020-04-26 19:50:05.997891+02	2020-04-30 19:47:34.721578+02	931	42	7	2	004F000100010002000100010002
929	1	de	ShopCartPlugin	2020-04-26 19:50:05.94154+02	2020-04-30 19:47:34.686464+02	927	42	4	2	004F000100010002
938	0	de	BootstrapButtonPlugin	2020-04-26 19:50:06.050428+02	2020-04-30 19:47:34.750316+02	937	42	6	0	004F00010001000200020001
937	1	de	ShopRightExtension	2020-04-26 19:50:06.037879+02	2020-04-30 19:47:34.743993+02	929	42	5	1	004F0001000100020002
935	0	de	TextPlugin	2020-04-26 19:50:06.010122+02	2020-04-30 19:47:34.758668+02	934	42	8	0	004F0001000100020001000100020001
1133	0	de	BootstrapRowPlugin	2020-04-26 19:50:10.448387+02	2020-04-30 19:52:43.88229+02	1132	82	3	3	004G00020001
1139	0	de	ShopAuthenticationPlugin	2020-04-26 19:50:10.521116+02	2020-04-30 19:52:43.932363+02	1138	82	5	0	004G0002000100030001
1138	2	de	BootstrapColumnPlugin	2020-04-26 19:50:10.506823+02	2020-04-30 19:52:43.924926+02	1133	82	4	1	004G000200010003
1102	2	de	AcceptConditionPlugin	2020-04-30 19:49:20.202133+02	2020-04-30 19:52:43.944762+02	1095	82	7	1	004G000100010001000100010005
1128	8	de	AcceptConditionPlugin	2020-04-26 19:50:10.373352+02	2020-04-30 19:52:43.956726+02	1117	82	7	1	004G000100010001000100040009
906	0	en	BootstrapCardPlugin	2020-04-26 19:50:05.964379+02	2020-04-29 21:18:57.403135+02	905	42	6	2	004B00010001000200010001
911	1	en	BootstrapButtonPlugin	2020-04-26 19:50:06.026099+02	2020-04-29 21:18:57.445323+02	909	42	8	0	004B0001000100020001000100020002
909	1	en	BootstrapCardBodyPlugin	2020-04-26 19:50:05.997891+02	2020-04-29 21:18:57.426611+02	906	42	7	2	004B000100010002000100010002
904	1	en	ShopCartPlugin	2020-04-26 19:50:05.94154+02	2020-04-29 21:18:57.389409+02	902	42	4	2	004B000100010002
913	0	en	BootstrapButtonPlugin	2020-04-26 19:50:06.050428+02	2020-04-29 21:18:57.460978+02	912	42	6	0	004B00010001000200020001
912	1	en	ShopRightExtension	2020-04-26 19:50:06.037879+02	2020-04-29 21:18:57.454177+02	904	42	5	1	004B0001000100020002
910	0	en	TextPlugin	2020-04-26 19:50:06.010122+02	2020-04-29 21:18:57.469633+02	909	42	8	0	004B0001000100020001000100020001
845	0	de	BootstrapColumnPlugin	2020-04-29 20:03:02.036325+02	2020-04-29 20:03:02.053797+02	844	2	3	1	003X00020001
882	0	de	TextPlugin	2020-04-29 21:00:10.104613+02	2020-04-29 21:00:33.208063+02	845	2	4	0	003X000200010001
844	0	de	BootstrapRowPlugin	2020-04-29 20:03:02.014463+02	2020-04-29 20:03:02.028189+02	837	2	2	1	003X0002
632	0	de	SimpleIconPlugin	2020-04-26 19:50:12.025628+02	2020-04-26 22:12:57.231681+02	\N	83	1	0	0036
646	0	de	SimpleIconPlugin	2020-04-26 19:50:12.025628+02	2020-04-26 22:13:55.414863+02	\N	84	1	0	0038
827	0	de	BootstrapContainerPlugin	2020-04-28 20:27:09.959027+02	2020-04-28 20:37:22.12664+02	\N	101	1	1	003W
681	0	de	BreadcrumbPlugin	2020-04-26 19:50:08.760351+02	2020-04-27 21:15:49.749764+02	\N	65	1	0	003C
682	0	de	BootstrapContainerPlugin	2020-04-26 19:50:08.716078+02	2020-04-27 21:15:49.763527+02	\N	66	1	1	003D
683	0	de	BootstrapRowPlugin	2020-04-26 19:50:08.723701+02	2020-04-27 21:15:49.766563+02	682	66	2	1	003D0001
685	0	de	ShopAuthenticationPlugin	2020-04-26 19:50:08.749922+02	2020-04-27 21:15:49.774718+02	684	66	4	0	003D000100010001
684	0	de	BootstrapColumnPlugin	2020-04-26 19:50:08.738389+02	2020-04-27 21:15:49.77084+02	683	66	3	1	003D00010001
686	0	de	BreadcrumbPlugin	2020-04-26 19:50:09.029822+02	2020-04-27 21:15:59.181038+02	\N	69	1	0	003E
687	0	de	BootstrapContainerPlugin	2020-04-26 19:50:08.983528+02	2020-04-27 21:15:59.194993+02	\N	70	1	1	003F
688	0	de	BootstrapRowPlugin	2020-04-26 19:50:08.991668+02	2020-04-27 21:15:59.198708+02	687	70	2	1	003F0001
690	0	de	ShopAuthenticationPlugin	2020-04-26 19:50:09.018795+02	2020-04-27 21:15:59.207141+02	689	70	4	0	003F000100010001
689	0	de	BootstrapColumnPlugin	2020-04-26 19:50:09.00267+02	2020-04-27 21:15:59.202738+02	688	70	3	1	003F00010001
724	0	de	BootstrapContainerPlugin	2020-04-27 21:21:13.158221+02	2020-04-27 21:21:13.163137+02	\N	20	1	1	003M
715	0	de	GuestFormPlugin	2020-04-26 19:50:07.694656+02	2020-04-27 21:17:22.091482+02	714	54	6	0	003J00010001000100020001
714	1	de	SegmentPlugin	2020-04-26 19:50:07.682323+02	2020-04-27 21:17:22.087768+02	711	54	5	1	003J0001000100010002
707	0	de	BreadcrumbPlugin	2020-04-26 19:50:07.751725+02	2020-04-27 21:17:22.030579+02	\N	53	1	0	003I
708	0	de	BootstrapContainerPlugin	2020-04-26 19:50:07.610484+02	2020-04-27 21:17:22.059852+02	\N	54	1	1	003J
709	0	de	BootstrapRowPlugin	2020-04-26 19:50:07.618451+02	2020-04-27 21:17:22.063907+02	708	54	2	1	003J0001
710	0	de	BootstrapColumnPlugin	2020-04-26 19:50:07.635077+02	2020-04-27 21:17:22.069009+02	709	54	3	1	003J00010001
713	0	de	CustomerFormPlugin	2020-04-26 19:50:07.670796+02	2020-04-27 21:17:22.082839+02	712	54	6	0	003J00010001000100010001
712	0	de	SegmentPlugin	2020-04-26 19:50:07.660053+02	2020-04-27 21:17:22.078466+02	711	54	5	1	003J0001000100010001
717	0	de	HeadingPlugin	2020-04-26 19:50:07.728517+02	2020-04-27 21:17:22.100417+02	716	54	6	0	003J00010001000100030001
716	2	de	SegmentPlugin	2020-04-26 19:50:07.714652+02	2020-04-27 21:17:22.096152+02	711	54	5	1	003J0001000100010003
718	3	de	ShopProceedButton	2020-04-26 19:50:07.739005+02	2020-04-27 21:17:22.105341+02	711	54	5	0	003J0001000100010004
711	0	de	ValidateSetOfFormsPlugin	2020-04-26 19:50:07.647005+02	2020-04-27 21:17:22.074469+02	710	54	4	4	003J000100010001
719	0	de	BreadcrumbPlugin	2020-04-26 19:50:08.205134+02	2020-04-27 21:17:26.293297+02	\N	57	1	0	003K
720	0	de	BootstrapContainerPlugin	2020-04-26 19:50:08.156484+02	2020-04-27 21:17:26.306055+02	\N	58	1	1	003L
721	0	de	BootstrapRowPlugin	2020-04-26 19:50:08.164473+02	2020-04-27 21:17:26.308631+02	720	58	2	1	003L0001
723	0	de	ShopAuthenticationPlugin	2020-04-26 19:50:08.193283+02	2020-04-27 21:17:26.316078+02	722	58	4	0	003L000100010001
722	0	de	BootstrapColumnPlugin	2020-04-26 19:50:08.179359+02	2020-04-27 21:17:26.312097+02	721	58	3	1	003L00010001
725	0	de	BootstrapRowPlugin	2020-04-27 21:21:21.797975+02	2020-04-27 21:21:21.801549+02	724	20	2	1	003M0001
729	0	de	BootstrapContainerPlugin	2020-04-27 21:21:13.158221+02	2020-04-27 21:22:18.703276+02	\N	22	1	1	003N
730	0	de	BootstrapRowPlugin	2020-04-27 21:21:21.797975+02	2020-04-27 21:22:18.706973+02	729	22	2	1	003N0001
732	0	de	HeadingPlugin	2020-04-27 21:21:44.692977+02	2020-04-27 21:22:18.713462+02	731	22	4	0	003N000100010001
726	0	de	BootstrapColumnPlugin	2020-04-27 21:21:21.813572+02	2020-04-27 21:21:21.827762+02	725	20	3	2	003M00010001
728	1	de	TextPlugin	2020-04-27 21:21:51.013421+02	2020-04-27 21:22:07.261143+02	726	20	4	0	003M000100010002
727	0	de	HeadingPlugin	2020-04-27 21:21:44.692977+02	2020-04-27 21:22:16.392883+02	726	20	4	0	003M000100010001
731	0	de	BootstrapColumnPlugin	2020-04-27 21:21:21.813572+02	2020-04-27 21:22:18.71031+02	730	22	3	2	003N00010001
733	1	de	TextPlugin	2020-04-27 21:21:51.013421+02	2020-04-27 21:22:18.736827+02	731	22	4	0	003N000100010002
734	0	de	BootstrapContainerPlugin	2020-04-27 21:29:07.546362+02	2020-04-27 21:29:07.549348+02	\N	12	1	1	003O
828	0	de	BootstrapRowPlugin	2020-04-28 20:27:17.932956+02	2020-04-28 20:37:22.135407+02	827	101	2	1	003W0001
735	0	de	BootstrapRowPlugin	2020-04-27 21:29:13.780944+02	2020-04-27 21:29:13.784308+02	734	12	2	1	003O0001
737	0	de	HeadingPlugin	2020-04-27 21:29:22.770801+02	2020-04-27 21:29:22.774436+02	736	12	4	0	003O000100010001
830	0	de	ContactUsPlugin	2020-04-28 20:27:29.652117+02	2020-04-28 20:37:22.148339+02	829	101	4	0	003W000100010001
736	0	de	BootstrapColumnPlugin	2020-04-27 21:29:13.789115+02	2020-04-27 21:29:13.798059+02	735	12	3	2	003O00010001
829	0	de	BootstrapColumnPlugin	2020-04-28 20:27:17.954588+02	2020-04-28 20:37:22.14227+02	828	101	3	1	003W00010001
445	1	de	ProcessStepPlugin	2020-04-26 19:50:10.066481+02	2020-04-30 19:48:10.922742+02	437	80	6	4	002V00010001000100010002
865	0	de	BreadcrumbPlugin	2020-04-26 19:50:05.311082+02	2020-04-29 20:25:46.552326+02	\N	33	1	0	0041
1140	0	de	BreadcrumbPlugin	2020-04-26 19:50:07.085316+02	2020-04-30 19:54:39.985272+02	\N	49	1	0	004H
738	1	de	TextPlugin	2020-04-27 21:29:27.970935+02	2020-04-27 21:32:24.861272+02	736	12	4	0	003O000100010002
1141	0	de	BootstrapContainerPlugin	2020-04-26 19:50:06.904016+02	2020-04-30 19:54:40.046883+02	\N	50	1	1	004I
1142	0	de	BootstrapRowPlugin	2020-04-26 19:50:06.911441+02	2020-04-30 19:54:40.053343+02	1141	50	2	1	004I0001
744	0	de	BootstrapContainerPlugin	2020-04-27 21:29:07.546362+02	2020-04-27 21:32:28.12125+02	\N	14	1	1	003P
745	0	de	BootstrapRowPlugin	2020-04-27 21:29:13.780944+02	2020-04-27 21:32:28.12449+02	744	14	2	1	003P0001
747	0	de	HeadingPlugin	2020-04-27 21:29:22.770801+02	2020-04-27 21:32:28.13284+02	746	14	4	0	003P000100010001
746	0	de	BootstrapColumnPlugin	2020-04-27 21:29:13.789115+02	2020-04-27 21:32:28.129267+02	745	14	3	2	003P00010001
748	1	de	TextPlugin	2020-04-27 21:29:27.970935+02	2020-04-27 21:32:28.149736+02	746	14	4	0	003P000100010002
749	1	de	BootstrapSecondaryMenuPlugin	2020-04-27 21:39:33.491424+02	2020-04-27 21:39:40.720815+02	29	3	4	0	0003000100020002
1145	0	de	HeadingPlugin	2020-04-26 19:50:06.952693+02	2020-04-30 19:54:40.077645+02	1144	50	5	0	004I0001000100010001
1144	0	de	SegmentPlugin	2020-04-26 19:50:06.940534+02	2020-04-30 19:54:40.069604+02	1143	50	4	1	004I000100010001
791	1	de	TextPlugin	2020-04-27 21:56:02.713248+02	2020-04-27 21:57:54.826735+02	31	3	4	0	0003000100030002
1143	0	de	BootstrapColumnPlugin	2020-04-26 19:50:06.924874+02	2020-04-30 19:54:40.061767+02	1142	50	3	2	004I00010001
770	0	de	HeadingPlugin	2020-04-27 21:40:16.544974+02	2020-04-27 21:40:16.550479+02	769	87	4	0	003R000100010001
1147	0	de	ShopLeftExtension	2020-04-26 19:50:06.977494+02	2020-04-30 19:54:40.09487+02	1146	50	5	1	004I0001000100020001
866	0	de	BootstrapContainerPlugin	2020-04-26 19:50:05.238092+02	2020-04-29 20:25:46.575532+02	\N	34	1	1	0042
867	0	de	BootstrapRowPlugin	2020-04-26 19:50:05.244066+02	2020-04-29 20:25:46.581165+02	866	34	2	1	00420001
772	2	de	TextPlugin	2020-04-27 21:45:23.452806+02	2020-04-27 21:49:32.292311+02	769	87	4	0	003R000100010003
771	1	de	LeafletPlugin	2020-04-27 21:44:41.975959+02	2020-04-27 21:45:12.425404+02	769	87	4	0	003R000100010002
870	1	de	ShopCatalogPlugin	2020-04-26 19:50:05.299093+02	2020-04-29 20:25:46.600588+02	868	34	4	0	0042000100010002
868	0	de	BootstrapColumnPlugin	2020-04-26 19:50:05.255836+02	2020-04-29 20:25:46.587303+02	867	34	3	2	004200010001
869	0	de	TextPlugin	2020-04-26 19:50:05.269796+02	2020-04-29 20:25:46.608979+02	868	34	4	0	0042000100010001
769	0	de	BootstrapColumnPlugin	2020-04-27 21:40:03.18244+02	2020-04-27 21:40:03.192774+02	768	87	3	3	003R00010001
1150	0	de	HeadingPlugin	2020-04-26 19:50:07.010388+02	2020-04-30 19:54:40.115886+02	1149	50	8	0	004I0001000100020001000100010001
1149	0	de	BootstrapCardHeaderPlugin	2020-04-26 19:50:06.999243+02	2020-04-30 19:54:40.109259+02	1148	50	7	1	004I000100010002000100010001
1148	0	de	BootstrapCardPlugin	2020-04-26 19:50:06.988462+02	2020-04-30 19:54:40.102074+02	1147	50	6	2	004I00010001000200010001
1152	0	de	ShopOrderAddendumFormPlugin	2020-04-26 19:50:07.0352+02	2020-04-30 19:54:40.131785+02	1151	50	8	0	004I0001000100020001000100020001
1151	1	de	BootstrapCardBodyPlugin	2020-04-26 19:50:07.022292+02	2020-04-30 19:54:40.124845+02	1148	50	7	1	004I000100010002000100010002
1146	1	de	ShopOrderViewsPlugin	2020-04-26 19:50:06.963639+02	2020-04-30 19:54:40.087171+02	1143	50	4	2	004I000100010002
1154	0	de	ShopReorderButtonPlugin	2020-04-26 19:50:07.060308+02	2020-04-30 19:54:40.146898+02	1153	50	6	0	004I00010001000200020001
1155	1	de	ShopCancelOrderButtonPlugin	2020-04-26 19:50:07.071192+02	2020-04-30 19:54:40.155209+02	1153	50	6	0	004I00010001000200020002
1153	1	de	ShopRightExtension	2020-04-26 19:50:07.047415+02	2020-04-30 19:54:40.140065+02	1146	50	5	2	004I0001000100020002
767	0	de	BootstrapContainerPlugin	2020-04-27 21:39:53.684467+02	2020-04-27 21:39:53.688661+02	\N	87	1	1	003R
768	0	de	BootstrapRowPlugin	2020-04-27 21:40:03.174033+02	2020-04-27 21:40:03.17762+02	767	87	2	1	003R0001
785	0	de	BootstrapContainerPlugin	2020-04-27 21:39:53.684467+02	2020-04-27 21:49:35.115733+02	\N	89	1	1	003S
786	0	de	BootstrapRowPlugin	2020-04-27 21:40:03.174033+02	2020-04-27 21:49:35.120061+02	785	89	2	1	003S0001
788	0	de	HeadingPlugin	2020-04-27 21:40:16.544974+02	2020-04-27 21:49:35.130007+02	787	89	4	0	003S000100010001
789	1	de	LeafletPlugin	2020-04-27 21:44:41.975959+02	2020-04-27 21:49:35.136707+02	787	89	4	0	003S000100010002
787	0	de	BootstrapColumnPlugin	2020-04-27 21:40:03.18244+02	2020-04-27 21:49:35.125463+02	786	89	3	3	003S00010001
790	2	de	TextPlugin	2020-04-27 21:45:23.452806+02	2020-04-27 21:49:35.150088+02	787	89	4	0	003S000100010003
799	0	de	BootstrapContainerPlugin	2020-04-26 19:50:04.066196+02	2020-04-27 21:58:02.91178+02	\N	4	1	1	003U
802	0	de	HeadingPlugin	2020-04-26 19:50:04.095634+02	2020-04-27 21:58:02.940799+02	801	4	4	0	003U000100010001
801	0	de	BootstrapColumnPlugin	2020-04-26 19:50:04.083187+02	2020-04-27 21:58:02.931063+02	800	4	3	2	003U00010001
803	1	de	BootstrapSecondaryMenuPlugin	2020-04-26 19:50:04.107723+02	2020-04-27 21:58:02.95191+02	801	4	4	0	003U000100010002
805	0	de	HeadingPlugin	2020-04-26 19:50:04.132708+02	2020-04-27 21:58:02.971907+02	804	4	4	0	003U000100020001
804	1	de	BootstrapColumnPlugin	2020-04-26 19:50:04.119953+02	2020-04-27 21:58:02.961967+02	800	4	3	2	003U00010002
806	1	de	BootstrapSecondaryMenuPlugin	2020-04-27 21:39:33.491424+02	2020-04-27 21:58:02.982667+02	804	4	4	0	003U000100020002
808	0	de	HeadingPlugin	2020-04-26 19:50:04.15713+02	2020-04-27 21:58:03.002185+02	807	4	4	0	003U000100030001
807	2	de	BootstrapColumnPlugin	2020-04-26 19:50:04.14395+02	2020-04-27 21:58:02.992923+02	800	4	3	2	003U00010003
800	0	de	BootstrapRowPlugin	2020-04-26 19:50:04.072496+02	2020-04-27 21:58:02.921225+02	799	4	2	4	003U0001
1156	0	de	ShopProductGallery	2020-04-30 20:04:43.808419+02	2020-04-30 20:04:59.49419+02	1158	2	4	0	003X000400010001
812	0	de	HeadingPlugin	2020-04-26 19:50:04.193812+02	2020-04-27 21:58:03.040374+02	811	4	5	0	003U0001000400010001
811	0	de	SegmentPlugin	2020-04-26 19:50:04.182149+02	2020-04-27 21:58:03.031258+02	810	4	4	2	003U000100040001
813	1	de	BootstrapSecondaryMenuPlugin	2020-04-26 19:50:04.204742+02	2020-04-27 21:58:03.050882+02	811	4	5	0	003U0001000400010002
810	3	de	BootstrapColumnPlugin	2020-04-26 19:50:04.16802+02	2020-04-27 21:58:03.022111+02	800	4	3	2	003U00010004
815	0	de	HeadingPlugin	2020-04-26 19:50:04.230854+02	2020-04-27 21:58:03.071036+02	814	4	5	0	003U0001000400020001
814	1	de	SegmentPlugin	2020-04-26 19:50:04.217315+02	2020-04-27 21:58:03.061472+02	810	4	4	2	003U000100040002
816	1	de	BootstrapSecondaryMenuPlugin	2020-04-26 19:50:04.241751+02	2020-04-27 21:58:03.08161+02	814	4	5	0	003U0001000400020002
809	1	de	TextPlugin	2020-04-27 21:56:02.713248+02	2020-04-27 21:58:03.100338+02	807	4	4	0	003U000100030002
888	0	en	BreadcrumbPlugin	2020-04-26 19:50:09.308525+02	2020-04-29 21:18:47.050038+02	\N	73	1	0	0046
889	0	en	BootstrapContainerPlugin	2020-04-26 19:50:09.260438+02	2020-04-29 21:18:47.072585+02	\N	74	1	1	0047
890	0	en	BootstrapRowPlugin	2020-04-26 19:50:09.268365+02	2020-04-29 21:18:47.078352+02	889	74	2	1	00470001
892	0	en	ShopAuthenticationPlugin	2020-04-26 19:50:09.296448+02	2020-04-29 21:18:47.092158+02	891	74	4	0	0047000100010001
891	0	en	BootstrapColumnPlugin	2020-04-26 19:50:09.285294+02	2020-04-29 21:18:47.084787+02	890	74	3	1	004700010001
1158	0	de	BootstrapColumnPlugin	2020-04-30 20:05:19.288586+02	2020-04-30 20:05:19.313399+02	1157	2	3	1	003X00040001
1157	1	de	BootstrapRowPlugin	2020-04-30 20:05:19.26675+02	2020-04-30 20:05:19.278349+02	837	2	2	1	003X0004
\.


--
-- Data for Name: cms_globalpagepermission; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cms_globalpagepermission (id, can_change, can_add, can_delete, can_change_advanced_settings, can_publish, can_change_permissions, can_move_page, can_view, can_recover_page, group_id, user_id) FROM stdin;
\.


--
-- Data for Name: cms_globalpagepermission_sites; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cms_globalpagepermission_sites (id, globalpagepermission_id, site_id) FROM stdin;
\.


--
-- Data for Name: cms_page; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cms_page (id, created_by, changed_by, creation_date, changed_date, publication_date, publication_end_date, in_navigation, soft_root, reverse_id, navigation_extenders, template, login_required, limit_visibility_in_menu, is_home, application_urls, application_namespace, publisher_is_draft, languages, xframe_options, publisher_public_id, is_page_type, node_id) FROM stdin;
2	script	markus	2020-04-26 19:50:04.386148+02	2020-04-30 20:05:39.226546+02	2020-04-26 19:50:04.385884+02	\N	t	f	\N	\N	weltladen/pages/default.html	f	\N	t	\N	\N	f	de,en	0	1	f	1
26	script	markus	2020-04-26 19:50:07.913946+02	2020-04-27 21:17:21.94351+02	2020-04-26 19:50:07.913757+02	\N	t	f	shop-customer-details	\N	weltladen/pages/default.html	f	\N	f	\N	\N	f	de,en	0	25	f	13
4	script	script	2020-04-26 19:50:04.609836+02	2020-04-26 19:50:04.638179+02	2020-04-26 19:50:04.60963+02	\N	f	t	shop-legal-pages	\N	weltladen/pages/default.html	f	\N	f	\N	\N	f	de,en	0	3	f	2
3	script	script	2020-04-26 19:50:04.56443+02	2020-04-26 19:50:04.564449+02	2020-04-26 19:50:04.60963+02	\N	f	t	shop-legal-pages	\N	weltladen/pages/default.html	f	\N	f	\N	\N	t	de,en	0	4	f	2
6	script	markus	2020-04-26 19:50:04.791754+02	2020-04-27 21:32:28.062336+02	2020-04-26 19:50:04.791572+02	\N	t	f	\N	\N	weltladen/pages/default.html	f	\N	f	\N	\N	f	de,en	0	5	f	3
25	script	markus	2020-04-26 19:50:07.569442+02	2020-04-27 21:17:00.322131+02	2020-04-26 19:50:07.913757+02	\N	t	f	shop-customer-details	\N	weltladen/pages/default.html	f	\N	f	\N	\N	t	de,en	0	26	f	13
27	script	markus	2020-04-26 19:50:08.11542+02	2020-04-27 21:17:12.890692+02	2020-04-26 19:50:08.28475+02	\N	t	f	shop-password-change	\N	weltladen/pages/default.html	f	\N	f	\N	\N	t	de,en	0	28	f	14
32	script	markus	2020-04-26 19:50:08.836002+02	2020-04-27 21:15:49.694676+02	2020-04-26 19:50:08.835814+02	\N	t	f	shop-register-customer	\N	weltladen/pages/default.html	f	\N	f	\N	\N	f	de,en	0	31	f	16
10	script	markus	2020-04-26 19:50:04.974882+02	2020-04-27 21:22:18.679145+02	2020-04-26 19:50:04.974687+02	\N	t	f	\N	\N	weltladen/pages/default.html	f	\N	f	\N	\N	f	de,en	0	9	f	5
31	script	markus	2020-04-26 19:50:08.673566+02	2020-04-27 21:15:20.731127+02	2020-04-26 19:50:08.835814+02	\N	t	f	shop-register-customer	\N	weltladen/pages/default.html	f	\N	f	\N	\N	t	de,en	0	32	f	16
18	script	script	2020-04-26 19:50:05.745354+02	2020-04-26 19:50:05.799914+02	2020-04-26 19:50:05.745109+02	\N	f	f	shop-search-product	\N	weltladen/pages/default.html	f	\N	f	CatalogSearchApp	\N	f	de,en	0	17	f	9
12	script	script	2020-04-26 19:50:05.064196+02	2020-04-26 19:50:05.088509+02	2020-04-26 19:50:05.064006+02	\N	f	t	shop-personal-pages	\N	weltladen/pages/default.html	f	\N	f	\N	\N	f	de,en	0	11	f	6
11	script	script	2020-04-26 19:50:05.020748+02	2020-04-26 19:50:05.020767+02	2020-04-26 19:50:05.064006+02	\N	f	t	shop-personal-pages	\N	weltladen/pages/default.html	f	\N	f	\N	\N	t	de,en	0	12	f	6
17	script	script	2020-04-26 19:50:05.569346+02	2020-04-26 19:50:05.569365+02	2020-04-26 19:50:05.745109+02	\N	f	f	shop-search-product	\N	weltladen/pages/default.html	f	\N	f	CatalogSearchApp	\N	t	de,en	0	18	f	9
14	script	script	2020-04-26 19:50:05.153819+02	2020-04-26 19:50:05.17724+02	2020-04-26 19:50:05.15363+02	\N	f	t	shop-impersonal-pages	\N	weltladen/pages/default.html	f	\N	f	\N	\N	f	de,en	0	13	f	7
13	script	script	2020-04-26 19:50:05.110366+02	2020-04-26 19:50:05.110385+02	2020-04-26 19:50:05.15363+02	\N	f	t	shop-impersonal-pages	\N	weltladen/pages/default.html	f	\N	f	\N	\N	t	de,en	0	14	f	7
8	script	markus	2020-04-26 19:50:04.88181+02	2020-04-30 19:46:41.152695+02	2020-04-26 19:50:04.881589+02	\N	t	f	\N	\N	weltladen/pages/default.html	f	\N	f	\N	\N	f	de,en	0	7	f	4
7	script	markus	2020-04-26 19:50:04.83357+02	2020-04-27 21:14:42.676801+02	2020-04-26 19:50:04.881589+02	\N	t	f	\N	\N	weltladen/pages/default.html	f	\N	f	\N	\N	t	de,en	0	8	f	4
9	script	markus	2020-04-26 19:50:04.926342+02	2020-04-27 21:16:19.15907+02	2020-04-26 19:50:04.974687+02	\N	t	f	\N	\N	weltladen/pages/default.html	f	\N	f	\N	\N	t	de,en	0	10	f	5
28	script	markus	2020-04-26 19:50:08.284991+02	2020-04-27 21:17:26.249198+02	2020-04-26 19:50:08.28475+02	\N	t	f	shop-password-change	\N	weltladen/pages/default.html	f	\N	f	\N	\N	f	de,en	0	27	f	14
24	script	markus	2020-04-26 19:50:07.313229+02	2020-04-30 19:54:39.816714+02	2020-04-26 19:50:07.312987+02	\N	t	f	shop-order	\N	weltladen/pages/default.html	f	\N	f	OrderApp	\N	f	de,en	0	23	f	12
23	script	markus	2020-04-26 19:50:06.863302+02	2020-04-27 21:16:41.079314+02	2020-04-26 19:50:07.312987+02	\N	t	f	shop-order	\N	weltladen/pages/default.html	f	\N	f	OrderApp	\N	t	de,en	0	24	f	12
5	script	markus	2020-04-26 19:50:04.658277+02	2020-04-27 21:14:20.309057+02	2020-04-26 19:50:04.791572+02	\N	t	f	\N	\N	weltladen/pages/default.html	f	\N	f	\N	\N	t	de,en	0	6	f	3
43	markus	markus	2020-04-27 21:37:23.203367+02	2020-04-27 21:37:23.242871+02	2020-04-27 21:37:29.655846+02	\N	t	f	\N	\N	INHERIT	f	\N	f	\N	\N	t	de	0	44	f	22
34	script	markus	2020-04-26 19:50:09.104841+02	2020-04-27 21:15:59.131545+02	2020-04-26 19:50:09.104628+02	\N	t	f	password-reset-request	\N	weltladen/pages/default.html	f	\N	f	\N	\N	f	de,en	0	33	f	17
30	script	script	2020-04-26 19:50:08.559358+02	2020-04-26 19:50:08.612353+02	2020-04-26 19:50:08.559172+02	\N	t	f	shop-login	\N	weltladen/pages/default.html	f	\N	f	\N	\N	f	de,en	0	29	f	15
29	script	script	2020-04-26 19:50:08.392969+02	2020-04-26 19:50:08.392988+02	2020-04-26 19:50:08.559172+02	\N	t	f	shop-login	\N	weltladen/pages/default.html	f	\N	f	\N	\N	t	de,en	0	30	f	15
22	script	markus	2020-04-26 19:50:06.73424+02	2020-04-29 21:18:51.987821+02	2020-04-26 19:50:06.733991+02	\N	f	f	shop-watch-list	\N	weltladen/pages/default.html	f	\N	f	\N	\N	f	de,en	0	21	f	11
38	script	script	2020-04-26 19:50:09.727764+02	2020-04-26 19:50:09.803931+02	2020-04-26 19:50:09.727525+02	\N	f	f	shop-cancel-payment	\N	weltladen/pages/default.html	f	\N	f	\N	\N	f	de,en	0	37	f	19
21	script	markus	2020-04-26 19:50:06.521505+02	2020-04-26 19:50:06.521526+02	2020-04-26 19:50:06.733991+02	\N	f	f	shop-watch-list	\N	weltladen/pages/default.html	f	\N	f	\N	\N	t	de,en	0	22	f	11
37	script	script	2020-04-26 19:50:09.486888+02	2020-04-26 19:50:09.486906+02	2020-04-26 19:50:09.727525+02	\N	f	f	shop-cancel-payment	\N	weltladen/pages/default.html	f	\N	f	\N	\N	t	de,en	0	38	f	19
40	script	markus	2020-04-26 19:50:11.232886+02	2020-04-30 19:52:43.106566+02	2020-04-26 19:50:11.232634+02	\N	f	f	\N	\N	weltladen/pages/default.html	f	\N	f	\N	\N	f	de,en	0	39	f	20
39	script	markus	2020-04-26 19:50:09.884524+02	2020-04-26 19:50:09.884545+02	2020-04-26 19:50:11.232634+02	\N	f	f	\N	\N	weltladen/pages/default.html	f	\N	f	\N	\N	t	de,en	0	40	f	20
33	script	markus	2020-04-26 19:50:08.94356+02	2020-04-27 21:15:44.2218+02	2020-04-26 19:50:09.104628+02	\N	t	f	password-reset-request	\N	weltladen/pages/default.html	f	\N	f	\N	\N	t	de,en	0	34	f	17
20	script	markus	2020-04-26 19:50:06.274059+02	2020-04-30 19:47:34.441316+02	2020-04-26 19:50:06.273844+02	\N	f	f	shop-cart	\N	weltladen/pages/default.html	f	\N	f	\N	\N	f	de,en	0	19	f	10
1	script	markus	2020-04-26 19:50:03.722639+02	2020-04-29 20:02:43.506516+02	2020-04-26 19:50:04.385884+02	\N	t	f	\N	\N	weltladen/pages/default.html	f	\N	t	\N	\N	t	de,en	0	2	f	1
19	script	markus	2020-04-26 19:50:05.855046+02	2020-04-26 19:50:05.855067+02	2020-04-26 19:50:06.273844+02	\N	f	f	shop-cart	\N	weltladen/pages/default.html	f	\N	f	\N	\N	t	de,en	0	20	f	10
44	markus	markus	2020-04-27 21:37:29.656057+02	2020-04-27 21:37:29.656073+02	2020-04-27 21:37:29.655846+02	\N	t	f	\N	\N	INHERIT	f	\N	f	\N	\N	f	de	0	43	f	22
42	markus	markus	2020-04-27 21:37:07.016402+02	2020-04-27 21:49:35.043752+02	2020-04-27 21:37:07.016193+02	\N	t	t	id-contact	\N	weltladen/pages/default.html	f	\N	f		\N	f	de	0	41	f	21
41	markus	markus	2020-04-27 21:36:39.515616+02	2020-04-27 21:39:01.16847+02	2020-04-27 21:37:07.016193+02	\N	t	t	id-contact	\N	weltladen/pages/default.html	f	\N	f		\N	t	de	0	42	f	21
16	script	markus	2020-04-26 19:50:05.419778+02	2020-04-29 20:33:15.041114+02	2020-04-26 19:50:05.41956+02	\N	t	f	\N	\N	weltladen/pages/default.html	f	\N	f	CatalogListApp	\N	f	de,en	0	15	f	8
15	script	markus	2020-04-26 19:50:05.202321+02	2020-04-29 20:25:37.815794+02	2020-04-26 19:50:05.41956+02	\N	t	f	\N	\N	weltladen/pages/default.html	f	\N	f	CatalogListApp	\N	t	de,en	0	16	f	8
48	markus	markus	2020-04-27 21:58:50.255009+02	2020-04-28 20:37:22.082836+02	2020-04-27 21:58:50.254775+02	\N	t	f	\N	\N	INHERIT	f	\N	f	\N	\N	f	de	0	47	f	24
36	script	markus	2020-04-26 19:50:09.380301+02	2020-04-29 21:18:47.023887+02	2020-04-26 19:50:09.380083+02	\N	f	f	password-reset-confirm	\N	weltladen/pages/default.html	f	\N	f	PasswordResetApp	\N	f	de,en	0	35	f	18
47	markus	markus	2020-04-27 21:58:46.314331+02	2020-04-27 21:59:45.019561+02	2020-04-27 21:58:50.254775+02	\N	t	f	\N	\N	INHERIT	f	\N	f	\N	\N	t	de	0	48	f	24
35	script	markus	2020-04-26 19:50:09.22055+02	2020-04-26 19:50:09.220573+02	2020-04-26 19:50:09.380083+02	\N	f	f	password-reset-confirm	\N	weltladen/pages/default.html	f	\N	f	PasswordResetApp	\N	t	de,en	0	36	f	18
\.


--
-- Data for Name: cms_page_placeholders; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cms_page_placeholders (id, page_id, placeholder_id) FROM stdin;
1	1	1
2	1	2
3	2	5
4	2	6
5	3	7
6	3	8
7	4	9
8	4	10
9	5	11
10	5	12
11	6	13
12	6	14
13	7	15
14	7	16
15	8	17
16	8	18
17	9	19
18	9	20
19	10	21
20	10	22
21	11	23
22	11	24
23	12	25
24	12	26
25	13	27
26	13	28
27	14	29
28	14	30
29	15	31
30	15	32
31	16	33
32	16	34
33	17	35
34	17	36
35	18	37
36	18	38
37	19	39
38	19	40
39	20	41
40	20	42
41	21	43
42	21	44
43	22	45
44	22	46
45	23	47
46	23	48
47	24	49
48	24	50
49	25	51
50	25	52
51	26	53
52	26	54
53	27	55
54	27	56
55	28	57
56	28	58
57	29	59
58	29	60
59	30	61
60	30	62
61	31	63
62	31	64
63	32	65
64	32	66
65	33	67
66	33	68
67	34	69
68	34	70
69	35	71
70	35	72
71	36	73
72	36	74
73	37	75
74	37	76
75	38	77
76	38	78
77	39	79
78	39	80
79	40	81
80	40	82
81	41	86
82	41	87
83	42	88
84	42	89
85	43	90
86	43	91
87	44	92
88	44	93
93	47	98
94	47	99
95	48	100
96	48	101
\.


--
-- Data for Name: cms_pagepermission; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cms_pagepermission (id, can_change, can_add, can_delete, can_change_advanced_settings, can_publish, can_change_permissions, can_move_page, can_view, grant_on, group_id, page_id, user_id) FROM stdin;
\.


--
-- Data for Name: cms_pageuser; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cms_pageuser (user_ptr_id, created_by_id) FROM stdin;
\.


--
-- Data for Name: cms_pageusergroup; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cms_pageusergroup (group_ptr_id, created_by_id) FROM stdin;
\.


--
-- Data for Name: cms_placeholder; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cms_placeholder (id, slot, default_width) FROM stdin;
1	Breadcrumb	\N
2	Main Content	\N
3	Static Footer	\N
4	Static Footer	\N
5	Breadcrumb	\N
6	Main Content	\N
7	Breadcrumb	\N
8	Main Content	\N
9	Breadcrumb	\N
10	Main Content	\N
11	Breadcrumb	\N
12	Main Content	\N
13	Breadcrumb	\N
14	Main Content	\N
15	Breadcrumb	\N
16	Main Content	\N
17	Breadcrumb	\N
18	Main Content	\N
19	Breadcrumb	\N
20	Main Content	\N
21	Breadcrumb	\N
22	Main Content	\N
23	Breadcrumb	\N
24	Main Content	\N
25	Breadcrumb	\N
26	Main Content	\N
27	Breadcrumb	\N
28	Main Content	\N
29	Breadcrumb	\N
30	Main Content	\N
31	Breadcrumb	\N
32	Main Content	\N
33	Breadcrumb	\N
34	Main Content	\N
35	Breadcrumb	\N
36	Main Content	\N
37	Breadcrumb	\N
38	Main Content	\N
39	Breadcrumb	\N
40	Main Content	\N
41	Breadcrumb	\N
42	Main Content	\N
43	Breadcrumb	\N
44	Main Content	\N
45	Breadcrumb	\N
46	Main Content	\N
47	Breadcrumb	\N
48	Main Content	\N
49	Breadcrumb	\N
50	Main Content	\N
51	Breadcrumb	\N
52	Main Content	\N
53	Breadcrumb	\N
54	Main Content	\N
55	Breadcrumb	\N
56	Main Content	\N
57	Breadcrumb	\N
58	Main Content	\N
59	Breadcrumb	\N
60	Main Content	\N
61	Breadcrumb	\N
62	Main Content	\N
63	Breadcrumb	\N
64	Main Content	\N
65	Breadcrumb	\N
66	Main Content	\N
67	Breadcrumb	\N
68	Main Content	\N
69	Breadcrumb	\N
70	Main Content	\N
71	Breadcrumb	\N
72	Main Content	\N
73	Breadcrumb	\N
74	Main Content	\N
75	Breadcrumb	\N
76	Main Content	\N
77	Breadcrumb	\N
78	Main Content	\N
79	Breadcrumb	\N
80	Main Content	\N
81	Breadcrumb	\N
82	Main Content	\N
83	Social Icons	\N
84	Social Icons	\N
85	clipboard	\N
86	Breadcrumb	\N
87	Main Content	\N
88	Breadcrumb	\N
89	Main Content	\N
90	Breadcrumb	\N
91	Main Content	\N
92	Breadcrumb	\N
93	Main Content	\N
98	Breadcrumb	\N
99	Main Content	\N
100	Breadcrumb	\N
101	Main Content	\N
\.


--
-- Data for Name: cms_placeholderreference; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cms_placeholderreference (cmsplugin_ptr_id, name, placeholder_ref_id) FROM stdin;
\.


--
-- Data for Name: cms_staticplaceholder; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cms_staticplaceholder (id, name, code, dirty, creation_method, draft_id, public_id, site_id) FROM stdin;
2		Social Icons	f	code	83	84	\N
1		Static Footer	f	code	3	4	\N
\.


--
-- Data for Name: cms_title; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cms_title (id, language, title, page_title, menu_title, meta_description, slug, path, has_url_overwrite, redirect, creation_date, published, publisher_is_draft, publisher_state, page_id, publisher_public_id) FROM stdin;
34	en	Search	\N	\N	\N	search	search	f	\N	2020-04-26 19:50:05.662872+02	f	t	1	17	36
19	de	Datenschutzvereinbarung				datenschutz	legal/datenschutz	f	\N	2020-04-26 19:50:04.957671+02	t	f	0	10	17
36	en	Search	\N	\N	\N	search	search	f	\N	2020-04-26 19:50:05.662872+02	f	f	0	18	34
12	en	Imprint	\N	\N	\N	imprint	legal/imprint	f	\N	2020-04-26 19:50:04.783035+02	f	f	0	6	10
7	de	Legal	\N	\N	\N	legal	legal	f	\N	2020-04-26 19:50:04.592965+02	t	f	0	4	5
5	de	Legal	\N	\N	\N	legal	legal	f	\N	2020-04-26 19:50:04.592965+02	t	t	0	3	7
40	en	Cart	\N	\N	\N	cart	cart	f	\N	2020-04-26 19:50:06.068966+02	t	f	0	20	38
44	en	Watch-List	\N	\N	\N	watch-list	watch-list	f	\N	2020-04-26 19:50:06.631208+02	t	f	0	22	42
11	de	Impressum				impressum	legal/impressum	f	\N	2020-04-26 19:50:04.774727+02	t	f	0	6	9
9	de	Impressum				impressum	legal/impressum	f	\N	2020-04-26 19:50:04.774727+02	t	t	0	5	11
42	en	Watch-List	\N	\N	\N	watch-list	watch-list	f	\N	2020-04-26 19:50:06.631208+02	t	t	0	21	44
10	en	Imprint	\N	\N	\N	imprint	legal/imprint	f	\N	2020-04-26 19:50:04.783035+02	f	t	1	5	12
15	de	AGBs				agbs	legal/agbs	f	\N	2020-04-26 19:50:04.864833+02	t	f	0	8	13
13	de	AGBs				agbs	legal/agbs	f	\N	2020-04-26 19:50:04.864833+02	t	t	0	7	15
14	en	Terms and Conditions	\N	\N	\N	terms-and-conditions	legal/terms-and-conditions	f	\N	2020-04-26 19:50:04.872651+02	t	t	1	7	16
38	en	Cart	\N	\N	\N	cart	cart	f	\N	2020-04-26 19:50:06.068966+02	t	t	1	19	40
37	de	Cart	\N	\N	\N	cart	cart	f	\N	2020-04-26 19:50:05.886282+02	t	t	0	19	39
31	de	Onlineshop				onlineshop	onlineshop	f	\N	2020-04-26 19:50:05.231449+02	t	f	0	16	29
29	de	Onlineshop				onlineshop	onlineshop	f	\N	2020-04-26 19:50:05.231449+02	t	t	0	15	31
23	de	Personal Pages	\N	\N	\N	personal-pages	personal-pages	f	\N	2020-04-26 19:50:05.049653+02	t	f	0	12	21
21	de	Personal Pages	\N	\N	\N	personal-pages	personal-pages	f	\N	2020-04-26 19:50:05.049653+02	t	t	0	11	23
39	de	Cart	\N	\N	\N	cart	cart	f	\N	2020-04-26 19:50:05.886282+02	t	f	0	20	37
45	de	Bestellungen				your-orders	personal-pages/your-orders	f	\N	2020-04-26 19:50:06.89738+02	t	t	0	23	47
27	de	Join Us	\N	\N	\N	join-us	join-us	f	\N	2020-04-26 19:50:05.139079+02	t	f	0	14	25
25	de	Join Us	\N	\N	\N	join-us	join-us	f	\N	2020-04-26 19:50:05.139079+02	t	t	0	13	27
47	de	Bestellungen				your-orders	personal-pages/your-orders	f	\N	2020-04-26 19:50:06.89738+02	t	f	0	24	45
46	en	Your Orders	\N	\N	\N	your-orders	personal-pages/your-orders	f	\N	2020-04-26 19:50:07.092639+02	t	t	1	23	48
2	en	Home	\N	\N	\N			f	\N	2020-04-26 19:50:04.263972+02	f	t	1	1	4
1	de	Home	\N	\N	\N	home		f	\N	2020-04-26 19:50:03.767495+02	t	t	0	1	3
4	en	Home	\N	\N	\N			f	\N	2020-04-26 19:50:04.263972+02	f	f	0	2	2
3	de	Home	\N	\N	\N	home		f	\N	2020-04-26 19:50:03.767495+02	t	f	0	2	1
35	de	Search	\N	\N	\N	search	search	f	\N	2020-04-26 19:50:05.600035+02	t	f	0	18	33
33	de	Search	\N	\N	\N	search	search	f	\N	2020-04-26 19:50:05.600035+02	t	t	0	17	35
6	en	Legal	\N	\N	\N	legal	legal	f	\N	2020-04-26 19:50:04.602636+02	f	t	1	3	8
8	en	Legal	\N	\N	\N	legal	legal	f	\N	2020-04-26 19:50:04.602636+02	f	f	0	4	6
43	de	Watch-List	\N	\N	\N	watch-list	watch-list	f	\N	2020-04-26 19:50:06.553468+02	t	f	0	22	41
41	de	Watch-List	\N	\N	\N	watch-list	watch-list	f	\N	2020-04-26 19:50:06.553468+02	t	t	0	21	43
22	en	Personal Pages	\N	\N	\N	personal-pages	personal-pages	f	\N	2020-04-26 19:50:05.057688+02	f	t	1	11	24
24	en	Personal Pages	\N	\N	\N	personal-pages	personal-pages	f	\N	2020-04-26 19:50:05.057688+02	f	f	0	12	22
50	en	Personal Details	\N	\N	\N	personal-details	personal-pages/personal-details	f	\N	2020-04-26 19:50:07.758389+02	t	t	4	25	52
54	en	Change Password	\N	\N	\N	change-password	personal-pages/change-password	f	\N	2020-04-26 19:50:08.212518+02	t	t	4	27	56
48	en	Your Orders	\N	\N	\N	your-orders	personal-pages/your-orders	f	\N	2020-04-26 19:50:07.092639+02	f	f	0	24	46
26	en	Join Us	\N	\N	\N	join-us	join-us	f	\N	2020-04-26 19:50:05.14736+02	f	t	1	13	28
28	en	Join Us	\N	\N	\N	join-us	join-us	f	\N	2020-04-26 19:50:05.14736+02	f	f	0	14	26
66	en	Request Password Reset	\N	\N	\N	request-password-reset	join-us/request-password-reset	f	\N	2020-04-26 19:50:09.037009+02	t	t	4	33	68
59	de	Login	\N	\N	\N	login	join-us/login	f	\N	2020-04-26 19:50:08.425403+02	t	f	0	30	57
57	de	Login	\N	\N	\N	login	join-us/login	f	\N	2020-04-26 19:50:08.425403+02	t	t	0	29	59
58	en	Login	\N	\N	\N	login	join-us/login	f	\N	2020-04-26 19:50:08.490359+02	t	t	4	29	60
62	en	Register Customer	\N	\N	\N	register-customer	join-us/register-customer	f	\N	2020-04-26 19:50:08.76727+02	t	t	4	31	64
64	en	Register Customer	\N	\N	\N	register-customer	join-us/register-customer	f	\N	2020-04-26 19:50:08.76727+02	f	f	0	32	62
60	en	Login	\N	\N	\N	login	join-us/login	f	\N	2020-04-26 19:50:08.490359+02	f	f	0	30	58
68	en	Request Password Reset	\N	\N	\N	request-password-reset	join-us/request-password-reset	f	\N	2020-04-26 19:50:09.037009+02	f	f	0	34	66
30	en	Catalog	\N	\N	\N	catalog	catalog	f	\N	2020-04-26 19:50:05.319543+02	f	t	1	15	32
32	en	Catalog	\N	\N	\N	catalog	catalog	f	\N	2020-04-26 19:50:05.319543+02	f	f	0	16	30
71	de	Confirm Password Reset	\N	\N	\N	confirm-password-reset	confirm-password-reset	f	\N	2020-04-26 19:50:09.252227+02	t	f	0	36	69
63	de	Registrieren				registrieren	join-us/registrieren	f	\N	2020-04-26 19:50:08.709257+02	t	f	0	32	61
61	de	Registrieren				registrieren	join-us/registrieren	f	\N	2020-04-26 19:50:08.709257+02	t	t	0	31	63
67	de	Passwort zurücksetzen				password-reset	join-us/password-reset	f	\N	2020-04-26 19:50:08.977304+02	t	f	0	34	65
65	de	Passwort zurücksetzen				password-reset	join-us/password-reset	f	\N	2020-04-26 19:50:08.977304+02	t	t	0	33	67
51	de	Über mich				personal-details	personal-pages/personal-details	f	\N	2020-04-26 19:50:07.602416+02	t	f	0	26	49
49	de	Über mich				personal-details	personal-pages/personal-details	f	\N	2020-04-26 19:50:07.602416+02	t	t	0	25	51
55	de	Passwort ändern				change-password	personal-pages/change-password	f	\N	2020-04-26 19:50:08.148382+02	t	f	0	28	53
53	de	Passwort ändern				change-password	personal-pages/change-password	f	\N	2020-04-26 19:50:08.148382+02	t	t	0	27	55
69	de	Confirm Password Reset	\N	\N	\N	confirm-password-reset	confirm-password-reset	f	\N	2020-04-26 19:50:09.252227+02	t	t	0	35	71
75	de	Payment Canceled	\N	\N	\N	payment-canceled	payment-canceled	f	\N	2020-04-26 19:50:09.515596+02	t	f	0	38	73
73	de	Payment Canceled	\N	\N	\N	payment-canceled	payment-canceled	f	\N	2020-04-26 19:50:09.515596+02	t	t	0	37	75
76	en	Payment Canceled	\N	\N	\N	payment-canceled	payment-canceled	f	\N	2020-04-26 19:50:09.611311+02	t	f	0	38	74
74	en	Payment Canceled	\N	\N	\N	payment-canceled	payment-canceled	f	\N	2020-04-26 19:50:09.611311+02	t	t	0	37	76
72	en	Confirm Password Reset	\N	\N	\N	confirm-password-reset	confirm-password-reset	f	\N	2020-04-26 19:50:09.315409+02	t	f	0	36	70
80	en	Checkout	\N	\N	\N	checkout	checkout	f	\N	2020-04-26 19:50:10.534483+02	t	f	0	40	78
18	en	Privacy Protection	\N	\N	\N	privacy-protection	legal/privacy-protection	f	\N	2020-04-26 19:50:04.965549+02	t	t	1	9	20
70	en	Confirm Password Reset	\N	\N	\N	confirm-password-reset	confirm-password-reset	f	\N	2020-04-26 19:50:09.315409+02	t	t	0	35	72
17	de	Datenschutzvereinbarung				datenschutz	legal/datenschutz	f	\N	2020-04-26 19:50:04.957671+02	t	t	0	9	19
83	de	Kontakt				kontakt	kontakt/kontakt	f	\N	2020-04-27 21:37:23.204577+02	t	t	0	43	84
88	de	Nachricht an uns				nachricht-uns	kontakt/nachricht-uns	f	\N	2020-04-27 21:58:46.315361+02	t	f	0	48	87
87	de	Nachricht an uns				nachricht-uns	kontakt/nachricht-uns	f	\N	2020-04-27 21:58:46.315361+02	t	t	0	47	88
16	en	Terms and Conditions	\N	\N	\N	terms-and-conditions	legal/terms-and-conditions	f	\N	2020-04-26 19:50:04.872651+02	f	f	0	8	14
20	en	Privacy Protection	\N	\N	\N	privacy-protection	legal/privacy-protection	f	\N	2020-04-26 19:50:04.965549+02	f	f	0	10	18
52	en	Personal Details	\N	\N	\N	personal-details	personal-pages/personal-details	f	\N	2020-04-26 19:50:07.758389+02	f	f	0	26	50
56	en	Change Password	\N	\N	\N	change-password	personal-pages/change-password	f	\N	2020-04-26 19:50:08.212518+02	f	f	0	28	54
78	en	Checkout	\N	\N	\N	checkout	checkout	f	\N	2020-04-26 19:50:10.534483+02	t	t	1	39	80
82	de	Kontakt				kontakt	kontakt	f	\N	2020-04-27 21:36:39.523948+02	t	f	0	42	81
81	de	Kontakt				kontakt	kontakt	f	\N	2020-04-27 21:36:39.523948+02	t	t	0	41	82
84	de	Kontakt				kontakt	kontakt/kontakt	f	\N	2020-04-27 21:37:23.204577+02	t	f	0	44	83
79	de	Checkout	\N	\N	\N	checkout	checkout	f	\N	2020-04-26 19:50:09.916396+02	t	f	0	40	77
77	de	Checkout	\N	\N	\N	checkout	checkout	f	\N	2020-04-26 19:50:09.916396+02	t	t	0	39	79
\.


--
-- Data for Name: cms_treenode; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cms_treenode (id, path, depth, numchild, parent_id, site_id) FROM stdin;
1	0001	1	0	\N	1
3	00020001	2	0	2	1
4	00020002	2	0	2	1
5	00020003	2	0	2	1
2	0002	1	3	\N	1
22	00030001	2	0	21	1
20	000D	1	0	\N	1
19	000C	1	0	\N	1
18	000B	1	0	\N	1
11	000A	1	0	\N	1
10	0009	1	0	\N	1
9	0008	1	0	\N	1
8	0007	1	0	\N	1
7	0006	1	3	\N	1
15	00060001	2	0	7	1
16	00060002	2	0	7	1
17	00060003	2	0	7	1
6	0005	1	3	\N	1
12	00050001	2	0	6	1
13	00050002	2	0	6	1
14	00050003	2	0	6	1
24	00030002	2	0	21	1
21	0003	1	2	\N	1
\.


--
-- Data for Name: cms_urlconfrevision; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cms_urlconfrevision (id, revision) FROM stdin;
1	902e8789-5418-4f8f-876e-4c138297b913
\.


--
-- Data for Name: cms_usersettings; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cms_usersettings (id, language, clipboard_id, user_id) FROM stdin;
1	de	85	4
\.


--
-- Data for Name: cmsplugin_cascade_cascadeclipboard; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cmsplugin_cascade_cascadeclipboard (id, identifier, data) FROM stdin;
25	splendid-villa	{"plugins": [["BootstrapContainerPlugin", {"glossary": {"breakpoints": ["xs", "sm", "md", "lg", "xl"], "fluid": "", "background_and_color": "", "hide_plugin": "", "container_max_widths": {"xs": 750, "lg": 1170, "sm": 750, "md": 970}, "media_queries": {"xs": ["(max-width: 768px)"], "lg": ["(min-width: 1200px)"], "sm": ["(min-width: 768px)", "(max-width: 992px)"], "md": ["(min-width: 992px)", "(max-width: 1200px)"]}}, "pk": 686}, [["BootstrapRowPlugin", {"glossary": {}, "pk": 687}, [["BootstrapColumnPlugin", {"glossary": {"xs-column-width": "col", "sm-column-width": "", "md-column-width": "", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720.0, "lg": 1140.0, "sm": 720.0, "md": 940.0}}, "pk": 688}, [["HeadingPlugin", {"glossary": {"content": "Splendid Villa near Park Lake", "element_id": "", "tag_type": "h1", "hide_plugin": "", "extra_inline_styles:Margins": {"margin-right": "", "margin-top": "", "margin-left": "", "margin-bottom": ""}}, "pk": 689}, []]]]]], ["BootstrapRowPlugin", {"glossary": {}, "pk": 690}, [["BootstrapColumnPlugin", {"glossary": {"xs-column-width": "col-12", "sm-column-width": "", "md-column-width": "col-md-5", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720.0, "lg": 457.5, "sm": 720.0, "md": 374.17}}, "pk": 691}, [["TextPlugin", {"body": "<p>This luxury home in the desirable neighborhood of Springfield has been the residency of an influential local family.</p>\\n\\n<p>It features 5 bedrooms, 3 bathrooms, a\\u00a0luxury living room with adjoing kitchen and a tea room on the first floor. The villa has\\u00a0a\\u00a0swimming\\u00a0pool,\\u00a0a\\u00a0large garden\\u00a0with\\u00a0lawn and an outdoor covered\\u00a0grill with a large table to accomodate at least 12 persons.</p>\\n\\n<p>The home is equipped with a separate garage for 3 cars. It's close to downtown Springfield and in\\u00a0walk or bike distance to the beach. Elementary School and High School are in reachable distance.\\u00a0Many children in this\\u00a0neighborhood choose to walk to school, making it ideal for attending school. A must see property!</p>\\n\\n<ul>\\n\\t<li>Main Living Room: 83 m<sup>2</sup>.</li>\\n\\t<li>Kitchen: 44 m<sup>2</sup>.</li>\\n\\t<li>Parents bedroom: 28 m<sup>2</sup>.</li>\\n\\t<li>Child 1 bedroom: 18 m<sup>2</sup>.</li>\\n\\t<li>Child 2 bedroom: 16 m<sup>2</sup>.</li>\\n\\t<li>Guest\\u00a0bedroom: 15 m<sup>2</sup>.</li>\\n\\t<li>Chamber for attendant:\\u00a012 m<sup>2</sup>.</li>\\n\\t<li>Tea room:\\u00a0\\u00a038 m<sup>2</sup>.</li>\\n\\t<li>Parents bathroom with shower and tub:\\u00a017\\u00a0m<sup>2</sup>.</li>\\n\\t<li>Childrens bathroom with shower only: 11\\u00a0m<sup>2</sup>.</li>\\n\\t<li>Guest bathroom: 9\\u00a0m<sup>2</sup>.</li>\\n\\t<li>Basement: 122 m<sup>2</sup>.</li>\\n</ul>", "pk": 692}, []]]], ["BootstrapColumnPlugin", {"glossary": {"xs-column-width": "col-12", "sm-column-width": "", "md-column-width": "col-md-7", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720.0, "lg": 652.5, "sm": 720.0, "md": 535.83}}, "pk": 693}, [["BootstrapImagePlugin", {"glossary": {"hide_plugin": false, "product": null, "link_type": "", "cms_page": null, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "image_shapes": ["img-fluid"], "image_width_responsive": "100%", "image_width_fixed": "", "image_height": "", "resize_options": ["subject_location", "high_resolution"], "image_alignment": "", "image_file": {"model": "filer.image", "pk": 189}, "image_title": "", "alt_tag": "", "_image_properties": {"width": 1920, "height": 1280, "exif_orientation": 1}, "column_bounds": {"min": 320.0, "max": 665.0}, "media_queries": {"xs": "(max-width: 575.98px) 572.00px", "sm": "(min-width: 576px) and (max-width: 767.98px) 540.00px", "md": "(min-width: 768px) and (max-width: 991.98px) 420.00px", "lg": "(min-width: 992px) and (max-width: 1199.98px) 560.00px", "xl": "(min-width: 1200px) 665.00px"}}, "pk": 694}, []], ["ShopAddToCartPlugin", {"glossary": {"margins_xs": "m-5", "margins_sm": "", "margins_md": "", "margins_lg": "", "use_modal_dialog": "on", "render_template": "weltladen/catalog/commodity-add2cart.html", "hide_plugin": ""}, "pk": 695}, []]]]]], ["BootstrapRowPlugin", {"glossary": {"hide_plugin": "", "extra_inline_styles:Margins": {"margin-top": "", "margin-bottom": "20px"}}, "pk": 696}, [["BootstrapColumnPlugin", {"glossary": {"xs-column-width": "col-12", "sm-column-width": "", "md-column-width": "col-md-10", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "offset-md-1", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720.0, "lg": 652.5, "sm": 720.0, "md": 535.83}}, "pk": 697}, [["BootstrapCarouselPlugin", {"glossary": {"hide_plugin": false, "margins_xs": "", "margins_sm": "", "margins_md": "", "margins_lg": "", "margins_xl": "", "interval": 5, "options": ["slide", "pause", "wrap"], "container_max_heights": {"xs": "250px", "sm": "300px", "md": "350px", "lg": "400px", "xl": "400px"}, "resize_options": ["upscale", "crop", "subject_location", "high_resolution"]}, "pk": 698}, [["BootstrapCarouselSlidePlugin", {"glossary": {"hide_plugin": false, "image_file": {"model": "filer.image", "pk": 197}, "image_title": "", "alt_tag": "", "_image_properties": {"width": 1920, "height": 1280, "exif_orientation": 1}, "resize_options": ["upscale", "crop", "subject_location", "high_resolution"], "media_queries": {"xs": {"width": 572, "media": "(max-width: 575.98px)"}, "sm": {"width": 540, "media": "(min-width: 576px) and (max-width: 767.98px)"}, "md": {"width": 600, "media": "(min-width: 768px) and (max-width: 991.98px)"}, "lg": {"width": 800, "media": "(min-width: 992px) and (max-width: 1199.98px)"}, "xl": {"width": 950, "media": "(min-width: 1200px)"}}}, "pk": 699}, []], ["BootstrapCarouselSlidePlugin", {"glossary": {"hide_plugin": false, "image_file": {"model": "filer.image", "pk": 198}, "image_title": "", "alt_tag": "", "_image_properties": {"width": 1920, "height": 1280, "exif_orientation": 1}, "resize_options": ["upscale", "crop", "subject_location", "high_resolution"], "media_queries": {"xs": {"width": 572, "media": "(max-width: 575.98px)"}, "sm": {"width": 540, "media": "(min-width: 576px) and (max-width: 767.98px)"}, "md": {"width": 600, "media": "(min-width: 768px) and (max-width: 991.98px)"}, "lg": {"width": 800, "media": "(min-width: 992px) and (max-width: 1199.98px)"}, "xl": {"width": 950, "media": "(min-width: 1200px)"}}}, "pk": 700}, []], ["BootstrapCarouselSlidePlugin", {"glossary": {"hide_plugin": false, "image_file": {"model": "filer.image", "pk": 190}, "image_title": "", "alt_tag": "", "_image_properties": {"width": 1920, "height": 1080, "exif_orientation": 1}, "resize_options": ["upscale", "crop", "subject_location", "high_resolution"], "media_queries": {"xs": {"width": 572, "media": "(max-width: 575.98px)"}, "sm": {"width": 540, "media": "(min-width: 576px) and (max-width: 767.98px)"}, "md": {"width": 600, "media": "(min-width: 768px) and (max-width: 991.98px)"}, "lg": {"width": 800, "media": "(min-width: 992px) and (max-width: 1199.98px)"}, "xl": {"width": 950, "media": "(min-width: 1200px)"}}}, "pk": 701}, []], ["BootstrapCarouselSlidePlugin", {"glossary": {"hide_plugin": false, "image_file": {"model": "filer.image", "pk": 191}, "image_title": "", "alt_tag": "", "_image_properties": {"width": 1920, "height": 1080, "exif_orientation": 1}, "resize_options": ["upscale", "crop", "subject_location", "high_resolution"], "media_queries": {"xs": {"width": 572, "media": "(max-width: 575.98px)"}, "sm": {"width": 540, "media": "(min-width: 576px) and (max-width: 767.98px)"}, "md": {"width": 600, "media": "(min-width: 768px) and (max-width: 991.98px)"}, "lg": {"width": 800, "media": "(min-width: 992px) and (max-width: 1199.98px)"}, "xl": {"width": 950, "media": "(min-width: 1200px)"}}}, "pk": 702}, []], ["BootstrapCarouselSlidePlugin", {"glossary": {"hide_plugin": false, "image_file": {"model": "filer.image", "pk": 192}, "image_title": "", "alt_tag": "", "_image_properties": {"width": 1920, "height": 1080, "exif_orientation": 1}, "resize_options": ["upscale", "crop", "subject_location", "high_resolution"], "media_queries": {"xs": {"width": 572, "media": "(max-width: 575.98px)"}, "sm": {"width": 540, "media": "(min-width: 576px) and (max-width: 767.98px)"}, "md": {"width": 600, "media": "(min-width: 768px) and (max-width: 991.98px)"}, "lg": {"width": 800, "media": "(min-width: 992px) and (max-width: 1199.98px)"}, "xl": {"width": 950, "media": "(min-width: 1200px)"}}}, "pk": 703}, []], ["BootstrapCarouselSlidePlugin", {"glossary": {"hide_plugin": false, "image_file": {"model": "filer.image", "pk": 193}, "image_title": "", "alt_tag": "", "_image_properties": {"width": 1920, "height": 1080, "exif_orientation": 1}, "resize_options": ["upscale", "crop", "subject_location", "high_resolution"], "media_queries": {"xs": {"width": 572, "media": "(max-width: 575.98px)"}, "sm": {"width": 540, "media": "(min-width: 576px) and (max-width: 767.98px)"}, "md": {"width": 600, "media": "(min-width: 768px) and (max-width: 991.98px)"}, "lg": {"width": 800, "media": "(min-width: 992px) and (max-width: 1199.98px)"}, "xl": {"width": 950, "media": "(min-width: 1200px)"}}}, "pk": 704}, []], ["BootstrapCarouselSlidePlugin", {"glossary": {"hide_plugin": false, "image_file": {"model": "filer.image", "pk": 194}, "image_title": "", "alt_tag": "", "_image_properties": {"width": 1920, "height": 1280, "exif_orientation": 1}, "resize_options": ["upscale", "crop", "subject_location", "high_resolution"], "media_queries": {"xs": {"width": 572, "media": "(max-width: 575.98px)"}, "sm": {"width": 540, "media": "(min-width: 576px) and (max-width: 767.98px)"}, "md": {"width": 600, "media": "(min-width: 768px) and (max-width: 991.98px)"}, "lg": {"width": 800, "media": "(min-width: 992px) and (max-width: 1199.98px)"}, "xl": {"width": 950, "media": "(min-width: 1200px)"}}}, "pk": 705}, [["HeadingPlugin", {"glossary": {"tag_type": "h4", "content": "Living Room", "margins_xs": "m-auto", "margins_sm": "", "margins_md": "", "margins_lg": "", "element_id": "", "hide_plugin": ""}, "pk": 706}, []]]], ["BootstrapCarouselSlidePlugin", {"glossary": {"hide_plugin": false, "image_file": {"model": "filer.image", "pk": 195}, "image_title": "", "alt_tag": "", "_image_properties": {"width": 1280, "height": 1920, "exif_orientation": 1}, "resize_options": ["upscale", "crop", "subject_location", "high_resolution"], "media_queries": {"xs": {"width": 572, "media": "(max-width: 575.98px)"}, "sm": {"width": 540, "media": "(min-width: 576px) and (max-width: 767.98px)"}, "md": {"width": 600, "media": "(min-width: 768px) and (max-width: 991.98px)"}, "lg": {"width": 800, "media": "(min-width: 992px) and (max-width: 1199.98px)"}, "xl": {"width": 950, "media": "(min-width: 1200px)"}}}, "pk": 707}, []], ["BootstrapCarouselSlidePlugin", {"glossary": {"hide_plugin": false, "image_file": {"model": "filer.image", "pk": 196}, "image_title": "", "alt_tag": "", "_image_properties": {"width": 1920, "height": 1280, "exif_orientation": 1}, "resize_options": ["upscale", "crop", "subject_location", "high_resolution"], "media_queries": {"xs": {"width": 572, "media": "(max-width: 575.98px)"}, "sm": {"width": 540, "media": "(min-width: 576px) and (max-width: 767.98px)"}, "md": {"width": 600, "media": "(min-width: 768px) and (max-width: 991.98px)"}, "lg": {"width": 800, "media": "(min-width: 992px) and (max-width: 1199.98px)"}, "xl": {"width": 950, "media": "(min-width: 1200px)"}}}, "pk": 708}, []]]]]]]]]]]}
26	super-darts	{"plugins": [["BootstrapContainerPlugin", {"glossary": {"breakpoints": ["xs", "sm", "md", "lg", "xl"], "fluid": "", "background_and_color": "", "hide_plugin": ""}, "pk": 377}, [["BootstrapRowPlugin", {"glossary": {"extra_css_classes": [], "extra_inline_styles:Margins": {"margin-top": "", "margin-bottom": ""}, "extra_inline_styles:background-color": ["disabled", "#ffffff"], "extra_inline_styles:Paddings": {"padding-right": "", "padding-left": ""}}, "pk": 378}, [["BootstrapColumnPlugin", {"glossary": {"xs-column-width": "col-12", "sm-column-width": "", "md-column-width": "", "lg-column-width": "col-lg-6", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 407.5, "md": 535.83, "sm": 407.5, "lg": 652.5}}, "pk": 379}, [["CustomSnippetPlugin", {"glossary": {"render_template": "shop/catalog/product-heading.html"}, "pk": 380}, []], ["BootstrapCarouselPlugin", {"glossary": {"margins_xs": "", "margins_sm": "", "margins_md": "", "margins_lg": "", "interval": "5", "options": ["slide", "pause", "wrap"], "container_max_heights": {"xs": "150px", "sm": "200px", "md": "250px", "lg": "300px", "xl": "350px"}, "resize_options": ["upscale", "crop", "subject_location", "high_resolution"], "hide_plugin": ""}, "pk": 381}, [["BootstrapCarouselSlidePlugin", {"glossary": {"hide_plugin": false, "image_file": {"model": "filer.image", "pk": 108}, "image_title": "", "alt_tag": "", "_image_properties": {"width": 970, "height": 545, "exif_orientation": 1}, "resize_options": ["upscale", "crop", "subject_location", "high_resolution"], "media_queries": {"xs": {"width": 572, "media": "(max-width: 575.98px)"}, "sm": {"width": 540, "media": "(min-width: 576px) and (max-width: 767.98px)"}, "md": {"width": 720, "media": "(min-width: 768px) and (max-width: 991.98px)"}, "lg": {"width": 480, "media": "(min-width: 992px) and (max-width: 1199.98px)"}, "xl": {"width": 570, "media": "(min-width: 1200px)"}}}, "pk": 382}, []], ["BootstrapCarouselSlidePlugin", {"glossary": {"hide_plugin": false, "image_file": {"model": "filer.image", "pk": 111}, "image_title": "", "alt_tag": "", "_image_properties": {"width": 600, "height": 400, "exif_orientation": 1}, "resize_options": ["upscale", "crop", "subject_location", "high_resolution"], "media_queries": {"xs": {"width": 572, "media": "(max-width: 575.98px)"}, "sm": {"width": 540, "media": "(min-width: 576px) and (max-width: 767.98px)"}, "md": {"width": 720, "media": "(min-width: 768px) and (max-width: 991.98px)"}, "lg": {"width": 480, "media": "(min-width: 992px) and (max-width: 1199.98px)"}, "xl": {"width": 570, "media": "(min-width: 1200px)"}}}, "pk": 383}, []], ["BootstrapCarouselSlidePlugin", {"glossary": {"hide_plugin": false, "image_file": {"model": "filer.image", "pk": 112}, "image_title": "", "alt_tag": "", "_image_properties": {"width": 600, "height": 400, "exif_orientation": 1}, "resize_options": ["upscale", "crop", "subject_location", "high_resolution"], "media_queries": {"xs": {"width": 572, "media": "(max-width: 575.98px)"}, "sm": {"width": 540, "media": "(min-width: 576px) and (max-width: 767.98px)"}, "md": {"width": 720, "media": "(min-width: 768px) and (max-width: 991.98px)"}, "lg": {"width": 480, "media": "(min-width: 992px) and (max-width: 1199.98px)"}, "xl": {"width": 570, "media": "(min-width: 1200px)"}}}, "pk": 384}, []], ["BootstrapCarouselSlidePlugin", {"glossary": {"hide_plugin": false, "image_file": {"model": "filer.image", "pk": 114}, "image_title": "", "alt_tag": "", "_image_properties": {"width": 600, "height": 400, "exif_orientation": 1}, "resize_options": ["upscale", "crop", "subject_location", "high_resolution"], "media_queries": {"xs": {"width": 572, "media": "(max-width: 575.98px)"}, "sm": {"width": 540, "media": "(min-width: 576px) and (max-width: 767.98px)"}, "md": {"width": 720, "media": "(min-width: 768px) and (max-width: 991.98px)"}, "lg": {"width": 480, "media": "(min-width: 992px) and (max-width: 1199.98px)"}, "xl": {"width": 570, "media": "(min-width: 1200px)"}}}, "pk": 385}, []]]], ["TextPlugin", {"body": "<h3>Superchared Sound</h3>\\n\\n<p>Call them what you want - in-ears, in-ear-monitors or inter aurals - these tiny earbuds are among the most common gadgets around. The most obvious upgrade for anyone with a smartphone whose bundled in-ears are about as dynamic as George Osborne, a good pair of earbuds can take tunes to a higher level for relatively low spend.</p>\\n\\n<p>We've included models from across the range of current selling prices, of course, though there are obvious differences. Pricier pairs generally offer more detail, range and bass, and better noise isolation (handy on trains and possibly even planes).</p>\\n\\n<p>Almost all now include an in-line remote for tweaking volume, changing tracks and hands-free calling, though most are primed for iOS devices. The remote button sometimes works with Android phones, but the volume keys don't. Almost all models come with a choice of tips, where which one you choose is crucial for sound quality, noise isolation and comfort, so don't be afraid to ditch those default tips.</p>", "pk": 386}, []]]], ["BootstrapColumnPlugin", {"glossary": {"xs-column-width": "col-12", "sm-column-width": "", "md-column-width": "", "lg-column-width": "col-lg-6", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 282.5, "md": 374.17, "sm": 282.5, "lg": 457.5}}, "pk": 387}, [["ShopAddToCartPlugin", {"glossary": {"use_modal_dialog": "", "hide_plugin": ""}, "pk": 388}, []]]]]]]]]}
27	sennheiser-hd630vb	{"plugins": [["BootstrapContainerPlugin", {"glossary": {"breakpoints": ["xs", "sm", "md", "lg", "xl"], "fluid": "", "hide_plugin": ""}, "pk": 457}, [["BootstrapRowPlugin", {"glossary": {"extra_css_classes": [], "extra_inline_styles:Margins": {"margin-top": "", "margin-bottom": ""}, "extra_inline_styles:background-color": ["disabled", "#ffffff"], "extra_inline_styles:Paddings": {"padding-right": "", "padding-left": ""}}, "pk": 458}, [["BootstrapColumnPlugin", {"glossary": {"xs-column-width": "col-12", "sm-column-width": "", "md-column-width": "", "lg-column-width": "col-lg-6", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 345.0, "md": 455.0, "sm": 345.0, "lg": 555.0}}, "pk": 459}, [["CustomSnippetPlugin", {"glossary": {"render_template": "shop/catalog/product-heading.html"}, "pk": 460}, []], ["TextPlugin", {"body": "<h3>Closed Back Headphones with Smartphone Mic &amp; Controls</h3>\\n\\n<p>Sennheiser HD630VB with variable bass deliver amazing performance and a host of features not normally found on audiophile headphones in portable form. The cutting-edge transducers provide clear, powerful sound reproduction, allowing you to hear the subtle nuances of your favourite music recordings. Its innovative rotary bass dial integrated in the ear cup lets you decide how powerful the deep end of sound shall be. With a very wide frequency response the headphones are ideal for listening to high resolution files allowing the HD630VB to redefine audiophile listening for years to come.</p>\\n\\n<p>Sennheiser's HD630VB offers an audiophile listening experience, with the bass sound and control that listeners demand. Bass can be adjusted through a rotary dial on the earcup, and with the touch of a button you can adjust the volume, select a track or make and take calls via the inline microphone on most smartphones. A switch on the controls optimises Apple/Android compatibility with the HD630VB. Crafted from premium materials including strong, lightweight aluminium ear cups, yokes and sliders. The adjustable headband makes it easy to achieve the perfect fit, while soft earpads make even longer periods of listening comfortable. Redefining audiophile listening.</p>\\n\\n<p>Sennheiser HD630VB Portable Audiophile Sound High-definition stereo sound is no longer confined only to home listening, Sennheiser HD630VB embodies audiophile characteristics sonically and technically but with collapsible design made of sturdy, high-quality materials. Take your sound with you wherever you go or connect to your audiophile home stereo equipment. Rotary Bass Adjustment Sennheiser HD630VB gives you perfect bass control. Its innovative rotary bass dial integrated in the ear cup lets you decide how powerful the deep end of sound shall be. Whatever your taste in bass is, with the Sennheiser HD630VB you get what you want.</p>\\n\\n<p>Mobile Device Control A wide range of control functions on the ear cup make it is easy to get the most out of mobile devices. With the touch of a button you can adjust the volume, select a track or make and take calls via the inline microphone. The controls on the right ear cup include music/call controls, and an iOS / Android switch to optimise its control compatibility with most popular mobile phones.</p>\\n\\n<p>Durable Material Crafted from premium materials including strong, lightweight aluminum ear cups, yokes, and sliders the Sennheiser HD630VB is made for a lifetime of use. Its well-cushioned removable and exchangeable earpads and the adjustable headband provide great wearing comfort even on your longest of audiophile journeys.</p>", "pk": 461}, []]]], ["BootstrapColumnPlugin", {"glossary": {"xs-column-width": "col-12", "sm-column-width": "", "md-column-width": "", "lg-column-width": "col-lg-6", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 345.0, "md": 455.0, "sm": 345.0, "lg": 555.0}}, "pk": 462}, [["BootstrapImagePlugin", {"glossary": {"hide_plugin": false, "product": null, "link_type": "", "cms_page": null, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "image_shapes": ["img-fluid"], "image_width_responsive": "100%", "image_width_fixed": "", "image_height": "", "resize_options": ["subject_location", "high_resolution"], "image_alignment": "", "image_file": {"model": "filer.image", "pk": 110}, "image_title": "", "alt_tag": "", "_image_properties": {"width": 800, "height": 800, "exif_orientation": 1}, "column_bounds": {"min": 320.0, "max": 720.0}, "media_queries": {"xs": "(max-width: 575.98px) 572.00px", "sm": "(min-width: 576px) and (max-width: 767.98px) 540.00px", "md": "(min-width: 768px) and (max-width: 991.98px) 720.00px", "lg": "(min-width: 992px) and (max-width: 1199.98px) 480.00px", "xl": "(min-width: 1200px) 570.00px"}}, "pk": 463}, []], ["ShopAddToCartPlugin", {"glossary": {"use_modal_dialog": "on", "hide_plugin": ""}, "pk": 464}, []]]]]]]]]}
28	backbeat-fit	{"plugins": [["BootstrapContainerPlugin", {"glossary": {"breakpoints": ["xs", "sm", "md", "lg", "xl"], "fluid": "", "hide_plugin": ""}, "pk": 466}, [["BootstrapRowPlugin", {"glossary": {"extra_css_classes": [], "extra_inline_styles:Paddings": {"padding-right": "", "padding-left": ""}, "extra_inline_styles:Margins": {"margin-top": "", "margin-bottom": ""}}, "pk": 467}, [["BootstrapColumnPlugin", {"glossary": {"xs-column-width": "col", "sm-column-width": "", "md-column-width": "", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720.0, "md": 940.0, "sm": 720.0, "lg": 1140.0}}, "pk": 468}, [["CustomSnippetPlugin", {"glossary": {"render_template": "shop/catalog/product-heading.html"}, "pk": 469}, []], ["BootstrapAccordionPlugin", {"glossary": {"margins_xs": "", "margins_sm": "", "margins_md": "", "margins_lg": "", "close_others": "on", "first_is_open": "on", "hide_plugin": ""}, "pk": 470}, [["BootstrapAccordionGroupPlugin", {"glossary": {"heading": "Description", "body_padding": "on", "background_and_color": "", "margins_xs": "", "margins_sm": "", "margins_md": "", "margins_lg": "", "hide_plugin": ""}, "pk": 471}, [["BootstrapRowPlugin", {"glossary": {"padding_xs": "", "padding_sm": "", "padding_md": "", "padding_lg": "", "hide_plugin": ""}, "pk": 472}, [["BootstrapColumnPlugin", {"glossary": {"xs-column-width": "col-12", "sm-column-width": "", "md-column-width": "col-md-6", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": ""}, "pk": 473}, [["BootstrapImagePlugin", {"glossary": {"hide_plugin": false, "product": null, "link_type": "", "cms_page": null, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "image_shapes": ["img-fluid"], "image_width_responsive": "100%", "image_width_fixed": "", "image_height": "", "resize_options": ["subject_location", "high_resolution"], "image_alignment": "", "image_file": {"model": "filer.image", "pk": 109}, "image_title": "", "alt_tag": "", "_image_properties": {"width": 1262, "height": 848, "exif_orientation": 1}, "column_bounds": {"min": 320.0, "max": 572.0}, "media_queries": {"xs": "(max-width: 575.98px) 572.00px", "sm": "(min-width: 576px) and (max-width: 767.98px) 540.00px", "md": "(min-width: 768px) and (max-width: 991.98px) 360.00px", "lg": "(min-width: 992px) and (max-width: 1199.98px) 480.00px", "xl": "(min-width: 1200px) 570.00px"}}, "pk": 474}, []]]], ["BootstrapColumnPlugin", {"glossary": {"xs-column-width": "col-12", "sm-column-width": "", "md-column-width": "col-md-6", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": ""}, "pk": 475}, [["TextPlugin", {"body": "<h3>Plantronics Wireless Headphones plus Microphone</h3>\\n\\n<p>The stable, comfortable Plantronics\\u00ae BackBeat FIT wireless stereo headphones provide all the power, safety features, and premium audio you need to stay motivated and moving, indoors or out.</p>", "pk": 476}, []]]]]]]], ["BootstrapAccordionGroupPlugin", {"glossary": {"heading": "Purchase", "body_padding": "", "background_and_color": "", "margins_xs": "", "margins_sm": "", "margins_md": "", "margins_lg": "", "hide_plugin": ""}, "pk": 477}, [["ShopAddToCartPlugin", {"glossary": {"hide_plugin": false, "margins_xs": "m-5", "margins_sm": "", "margins_md": "", "margins_lg": "", "margins_xl": "", "render_template": "", "use_modal_dialog": true}, "pk": 478}, []]]]]]]]]]]]]}
29	shop-list	{"plugins": [["BootstrapContainerPlugin", {"glossary": {"breakpoints": ["xs", "sm", "md", "lg", "xl"], "fluid": "", "background_and_color": "", "hide_plugin": "", "container_max_widths": {"xs": 750, "md": 970, "sm": 750, "lg": 1170}, "media_queries": {"xs": ["(max-width: 768px)"], "md": ["(min-width: 992px)", "(max-width: 1200px)"], "sm": ["(min-width: 768px)", "(max-width: 992px)"], "lg": ["(min-width: 1200px)"]}}, "pk": 21684}, [["BootstrapRowPlugin", {"glossary": {}, "pk": 21685}, [["BootstrapColumnPlugin", {"glossary": {"xs-column-width": "col", "sm-column-width": "", "md-column-width": "", "lg-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "", "lg-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720, "md": 940, "sm": 720, "lg": 1140}}, "pk": 21686}, [["TextPlugin", {"body": "<h2>Our Catalog List View</h2>\\n", "pk": 21688}, []], ["CustomSnippetPlugin", {"glossary": {"render_template": "weltladen/catalog/manufacturer-filter.html"}, "pk": 21689}, []], ["ShopCatalogPlugin", {"glossary": {"pagination": "auto", "hide_plugin": ""}, "pk": 21687}, []]]]]]]]]}
31	checkout	{"plugins": [["BootstrapContainerPlugin", {"glossary": {"breakpoints": ["xs", "sm", "md", "lg", "xl"], "fluid": "", "padding_xs": "py-3", "padding_sm": "", "padding_md": "", "padding_lg": "", "hide_plugin": "", "container_max_widths": {"xs": 750, "md": 970, "sm": 750, "lg": 1170}, "media_queries": {"xs": ["(max-width: 768px)"], "md": ["(min-width: 992px)", "(max-width: 1200px)"], "sm": ["(min-width: 768px)", "(max-width: 992px)"], "lg": ["(min-width: 1200px)"]}}, "pk": 748}, [["SegmentPlugin", {"glossary": {"open_tag": "if", "condition": "customer.is_recognized"}, "pk": 749}, [["BootstrapRowPlugin", {"glossary": {"hide_plugin": false, "padding_xs": "py-4", "padding_sm": "", "padding_md": "", "padding_lg": "", "padding_xl": ""}, "pk": 750}, [["BootstrapColumnPlugin", {"glossary": {"xs-column-width": "col", "sm-column-width": "", "md-column-width": "col-md-10", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "offset-md-1", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720.0, "md": 778.33, "sm": 595.0, "lg": 750.0}}, "pk": 751}, [["ProcessBarPlugin", {"glossary": {}, "pk": 752}, [["ProcessStepPlugin", {"glossary": {"step_title": "Customer"}, "pk": 753}, [["SegmentPlugin", {"glossary": {"open_tag": "if", "condition": "customer.is_registered"}, "pk": 754}, [["CustomerFormPlugin", {"glossary": {"render_type": "form"}, "pk": 755}, []]]], ["SegmentPlugin", {"glossary": {"open_tag": "else", "condition": ""}, "pk": 756}, [["GuestFormPlugin", {"glossary": {"render_type": "form"}, "pk": 757}, []]]], ["RequiredFormFieldsPlugin", {"glossary": {}, "pk": 758}, []], ["ShopProceedButton", {"glossary": {"hide_plugin": false, "margins_xs": "", "margins_sm": "", "margins_md": "", "margins_lg": "", "margins_xl": "", "float_xs": "float-right", "float_sm": "", "float_md": "", "float_lg": "", "float_xl": "", "disable_invalid": false, "product": null, "link_type": "NEXT_STEP", "cms_page": null, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "icon_font": {"model": "cmsplugin_cascade.iconfont", "pk": 1}, "symbol": "right-open", "link_content": "Next", "button_type": "btn-success", "button_size": "", "button_options": [], "icon_align": "icon-right", "stretched_link": false}, "pk": 759}, []]]], ["ProcessStepPlugin", {"glossary": {"hide_plugin": "", "step_title": "Addresses"}, "pk": 760}, [["CheckoutAddressPlugin", {"glossary": {"address_form": "shipping", "render_type": "form", "allow_multiple": "on", "allow_use_primary": "", "headline_legend": "on", "hide_plugin": ""}, "pk": 761}, []], ["CheckoutAddressPlugin", {"glossary": {"allow_use_primary": "on", "allow_multiple": "on", "address_form": "billing", "render_type": "form", "hide_plugin": "", "headline_legend": "on"}, "pk": 762}, []], ["RequiredFormFieldsPlugin", {"glossary": {}, "pk": 763}, []], ["ShopProceedButton", {"glossary": {"hide_plugin": false, "margins_xs": "", "margins_sm": "", "margins_md": "", "margins_lg": "", "margins_xl": "", "float_xs": "float-right", "float_sm": "", "float_md": "", "float_lg": "", "float_xl": "", "disable_invalid": false, "product": null, "link_type": "NEXT_STEP", "cms_page": null, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "icon_font": {"model": "cmsplugin_cascade.iconfont", "pk": 1}, "symbol": "right-open", "link_content": "Next", "button_type": "btn-success", "button_size": "", "button_options": [], "icon_align": "icon-right", "stretched_link": false}, "pk": 764}, []]]], ["ProcessStepPlugin", {"glossary": {"hide_plugin": "", "step_title": "Payment"}, "pk": 765}, [["HeadingPlugin", {"glossary": {"content": "Bezahlen und Versenden", "element_id": "", "tag_type": "h3"}, "pk": 766}, []], ["ShopCartPlugin", {"glossary": {"render_type": "summary"}, "pk": 767}, []], ["PaymentMethodFormPlugin", {"glossary": {"render_type": "form", "headline_legend": "on", "show_additional_charge": "on", "hide_plugin": ""}, "pk": 768}, []], ["ShippingMethodFormPlugin", {"glossary": {"render_type": "form", "headline_legend": "on", "show_additional_charge": "on", "hide_plugin": ""}, "pk": 769}, []], ["ExtraAnnotationFormPlugin", {"glossary": {"render_type": "form"}, "pk": 770}, []], ["RequiredFormFieldsPlugin", {"glossary": {}, "pk": 771}, []], ["ShopProceedButton", {"glossary": {"hide_plugin": false, "margins_xs": "", "margins_sm": "", "margins_md": "", "margins_lg": "", "margins_xl": "", "float_xs": "float-right", "float_sm": "", "float_md": "", "float_lg": "", "float_xl": "", "disable_invalid": false, "product": null, "link_type": "NEXT_STEP", "cms_page": null, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "icon_font": {"model": "cmsplugin_cascade.iconfont", "pk": 1}, "symbol": "right-open", "link_content": "Next", "button_type": "btn-success", "button_size": "", "button_options": [], "icon_align": "icon-right", "stretched_link": false}, "pk": 772}, []]]], ["ProcessStepPlugin", {"glossary": {"hide_plugin": "", "step_title": "Summary"}, "pk": 773}, [["HeadingPlugin", {"glossary": {"content": "Summary of your Order", "element_id": "", "tag_type": "h3", "hide_plugin": "", "extra_inline_styles:Margins": {"margin-right": "", "margin-top": "", "margin-left": "", "margin-bottom": ""}}, "pk": 774}, []], ["ShopCartPlugin", {"glossary": {"render_type": "static", "hide_plugin": ""}, "pk": 775}, []], ["SegmentPlugin", {"glossary": {"open_tag": "if", "condition": "customer.is_registered"}, "pk": 776}, [["CustomerFormPlugin", {"glossary": {"render_type": "summary"}, "pk": 777}, []]]], ["SegmentPlugin", {"glossary": {"open_tag": "else", "condition": ""}, "pk": 778}, [["GuestFormPlugin", {"glossary": {"render_type": "summary"}, "pk": 779}, []]]], ["CheckoutAddressPlugin", {"glossary": {"address_form": "shipping", "render_type": "summary", "allow_multiple": "", "allow_use_primary": "", "headline_legend": "on", "hide_plugin": ""}, "pk": 780}, []], ["PaymentMethodFormPlugin", {"glossary": {"render_type": "summary"}, "pk": 781}, []], ["ShippingMethodFormPlugin", {"glossary": {"render_type": "summary"}, "pk": 782}, []], ["ExtraAnnotationFormPlugin", {"glossary": {"render_type": "summary"}, "pk": 783}, []], ["AcceptConditionPlugin", {"body": "<p>I have read the <cms-plugin alt=\\"Link - terms and conditions \\" title=\\"Link - terms and conditions\\" id=\\"785\\"></cms-plugin> and agree with them.</p>", "pk": 784}, [["TextLinkPlugin", {"glossary": {"link_content": "terms and conditions", "link": {"pk": 15, "model": "cms.Page", "type": "cmspage", "section": ""}, "target": "", "title": ""}, "pk": 785}, []]]], ["RequiredFormFieldsPlugin", {"glossary": {}, "pk": 786}, []], ["ShopProceedButton", {"glossary": {"hide_plugin": false, "margins_xs": "", "margins_sm": "", "margins_md": "", "margins_lg": "", "margins_xl": "", "float_xs": "float-right", "float_sm": "", "float_md": "", "float_lg": "", "float_xl": "", "disable_invalid": false, "product": null, "link_type": "PURCHASE_NOW", "cms_page": null, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "icon_font": {"model": "cmsplugin_cascade.iconfont", "pk": 1}, "symbol": "handshake-o", "link_content": "Purchase Now", "button_type": "btn-success", "button_size": "btn-lg", "button_options": [], "icon_align": "icon-right", "stretched_link": false}, "pk": 787}, []]]]]]]]]]]], ["SegmentPlugin", {"glossary": {"open_tag": "else", "condition": ""}, "pk": 788}, [["BootstrapRowPlugin", {"glossary": {"padding_xs": "py-3", "padding_sm": "", "padding_md": "", "padding_lg": "", "hide_plugin": ""}, "pk": 789}, [["BootstrapColumnPlugin", {"glossary": {"xs-column-width": "col-12", "sm-column-width": "col-sm-4", "md-column-width": "", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720.0, "md": 293.33, "sm": 220.0, "lg": 360.0}}, "pk": 790}, [["ShopAuthenticationPlugin", {"glossary": {"hide_plugin": false, "link_type": "RELOAD_PAGE", "cms_page": null, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "form_type": "login"}, "pk": 791}, []]]], ["BootstrapColumnPlugin", {"glossary": {"xs-column-width": "col-12", "sm-column-width": "col-sm-4", "md-column-width": "", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720.0, "md": 293.33, "sm": 220.0, "lg": 360.0}}, "pk": 792}, [["ShopAuthenticationPlugin", {"glossary": {"hide_plugin": false, "link_type": "RELOAD_PAGE", "cms_page": null, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "form_type": "register-user"}, "pk": 793}, []]]], ["BootstrapColumnPlugin", {"glossary": {"xs-column-width": "col-12", "sm-column-width": "col-sm-4", "md-column-width": "", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720.0, "md": 293.33, "sm": 220.0, "lg": 360.0}}, "pk": 794}, [["ShopAuthenticationPlugin", {"glossary": {"hide_plugin": false, "link_type": "RELOAD_PAGE", "cms_page": null, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "form_type": "continue-as-guest"}, "pk": 795}, []]]]]]]]]]]}
32	your-orders	{"plugins": [["BootstrapContainerPlugin", {"glossary": {"breakpoints": ["xs", "sm", "md", "lg", "xl"], "fluid": "", "hide_plugin": "", "container_max_widths": {"xs": 750, "md": 970, "sm": 750, "lg": 1170}, "media_queries": {"xs": ["(max-width: 768px)"], "md": ["(min-width: 992px)", "(max-width: 1200px)"], "sm": ["(min-width: 768px)", "(max-width: 992px)"], "lg": ["(min-width: 1200px)"]}}, "pk": 811}, [["BootstrapRowPlugin", {"glossary": {"extra_css_classes": [], "extra_inline_styles:Margins": {"margin-top": "", "margin-bottom": ""}, "hide_plugin": ""}, "pk": 812}, [["BootstrapColumnPlugin", {"glossary": {"xs-column-width": "col", "sm-column-width": "", "md-column-width": "col-md-10", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "offset-md-1", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720, "md": 940, "sm": 720, "lg": 1140}}, "pk": 813}, [["SegmentPlugin", {"glossary": {"open_tag": "if", "condition": "is_last_order"}, "pk": 814}, [["HeadingPlugin", {"glossary": {"tag_type": "h2", "content": "Thanks for your order", "margins_xs": "", "margins_sm": "", "margins_md": "", "margins_lg": "", "element_id": "", "hide_plugin": ""}, "pk": 815}, []]]], ["ShopOrderViewsPlugin", {"glossary": {"hide_plugin": ""}, "pk": 816}, [["ShopLeftExtension", {"glossary": {"padding_xs": "", "padding_sm": "", "padding_md": "", "padding_lg": "", "hide_plugin": ""}, "pk": 817}, [["BootstrapCardPlugin", {"glossary": {"header": "", "body_padding": "on", "footer": "", "background_and_color": "", "margins_xs": "", "margins_sm": "", "margins_md": "", "margins_lg": "", "hide_plugin": ""}, "pk": 818}, [["BootstrapCardHeaderPlugin", {"glossary": {"hide_plugin": ""}, "pk": 819}, [["HeadingPlugin", {"glossary": {"tag_type": "h5", "content": "Annotations to this Order", "margins_xs": "", "margins_sm": "", "margins_md": "", "margins_lg": "", "element_id": "", "hide_plugin": ""}, "pk": 820}, []]]], ["BootstrapCardBodyPlugin", {"glossary": {"hide_plugin": ""}, "pk": 821}, [["ShopOrderAddendumFormPlugin", {"glossary": {"hide_plugin": false, "show_history": true, "icon_font": {"model": "cmsplugin_cascade.iconfont", "pk": 1}, "symbol": "plus-squared-alt", "link_content": "Add annotation", "button_type": "btn-primary", "button_size": "btn-sm", "button_options": [], "icon_align": "icon-right", "stretched_link": false}, "pk": 822}, []]]]]]]], ["ShopRightExtension", {"glossary": {"padding_xs": "", "padding_sm": "", "padding_md": "", "padding_lg": "", "hide_plugin": ""}, "pk": 823}, [["ShopReorderButtonPlugin", {"glossary": {"hide_plugin": false, "margins_xs": "", "margins_sm": "", "margins_md": "", "margins_lg": "", "margins_xl": "", "float_xs": "float-left", "float_sm": "", "float_md": "", "float_lg": "", "float_xl": "", "icon_font": {"model": "cmsplugin_cascade.iconfont", "pk": 1}, "symbol": "cart-arrow-down", "link_content": "Re-Add to Cart", "button_type": "btn-success", "button_size": "", "button_options": [], "icon_align": "icon-right", "stretched_link": false}, "pk": 824}, []], ["ShopCancelOrderButtonPlugin", {"glossary": {"hide_plugin": false, "margins_xs": "", "margins_sm": "", "margins_md": "", "margins_lg": "", "margins_xl": "", "float_xs": "float-right", "float_sm": "", "float_md": "", "float_lg": "", "float_xl": "", "icon_font": {"model": "cmsplugin_cascade.iconfont", "pk": 1}, "symbol": "cancel-circled", "link_content": "Cancel", "button_type": "btn-outline-warning", "button_size": "", "button_options": [], "icon_align": "icon-right", "stretched_link": false}, "pk": 825}, []]]]]]]]]]]]]}
33	watch-list	{"plugins": [["BootstrapContainerPlugin", {"glossary": {"breakpoints": ["xs", "sm", "md", "lg", "xl"], "fluid": "", "margins_xs": "", "margins_sm": "", "margins_md": "", "margins_lg": "", "hide_plugin": "", "container_max_widths": {"xs": 750, "md": 970, "sm": 750, "lg": 1170}, "media_queries": {"xs": ["(max-width: 768px)"], "md": ["(min-width: 992px)", "(max-width: 1200px)"], "sm": ["(min-width: 768px)", "(max-width: 992px)"], "lg": ["(min-width: 1200px)"]}}, "pk": 21769}, [["BootstrapRowPlugin", {"glossary": {"extra_css_classes": [], "extra_inline_styles:Margins": {"margin-top": "", "margin-bottom": ""}, "extra_inline_styles:background-color": ["disabled", "#ffffff"], "extra_inline_styles:Paddings": {"padding-right": "", "padding-left": ""}}, "pk": 21770}, [["BootstrapColumnPlugin", {"glossary": {"xs-column-width": "col", "sm-column-width": "", "md-column-width": "col-md-10", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "offset-md-1", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720.0, "md": 940.0, "sm": 720.0, "lg": 1140.0}}, "pk": 21771}, [["HeadingPlugin", {"glossary": {"content": "Your Wishes", "element_id": "", "tag_type": "h2"}, "pk": 21773}, []], ["ShopCartPlugin", {"glossary": {"render_type": "watch"}, "pk": 21772}, []]]]]]]]]}
34	search	{"plugins": [["BootstrapContainerPlugin", {"glossary": {"breakpoints": ["xs", "sm", "md", "lg", "xl"], "fluid": "", "background_and_color": "", "hide_plugin": "", "container_max_widths": {"xs": 750, "md": 970, "sm": 750, "lg": 1170}, "media_queries": {"xs": ["(max-width: 768px)"], "md": ["(min-width: 992px)", "(max-width: 1200px)"], "sm": ["(min-width: 768px)", "(max-width: 992px)"], "lg": ["(min-width: 1200px)"]}}, "pk": 21775}, [["BootstrapRowPlugin", {"glossary": {"extra_inline_styles:Paddings": {"padding-right": "", "padding-left": ""}, "extra_inline_styles:Margins": {"margin-top": "", "margin-bottom": ""}}, "pk": 21776}, [["BootstrapColumnPlugin", {"glossary": {"xs-column-width": "col", "sm-column-width": "", "md-column-width": "col-md-10", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "offset-md-1", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720.0, "md": 940.0, "sm": 720.0, "lg": 1140.0}}, "pk": 21777}, [["ShopSearchResultsPlugin", {"glossary": {"pagination": "auto", "hide_plugin": ""}, "pk": 21778}, []]]]]]]]]}
35	personal-details	{"plugins": [["BootstrapContainerPlugin", {"glossary": {"breakpoints": ["xs", "sm", "md", "lg", "xl"], "fluid": "", "hide_plugin": "", "container_max_widths": {"xs": 750, "md": 970, "sm": 750, "lg": 1170}, "media_queries": {"xs": ["(max-width: 768px)"], "md": ["(min-width: 992px)", "(max-width: 1200px)"], "sm": ["(min-width: 768px)", "(max-width: 992px)"], "lg": ["(min-width: 1200px)"]}}, "pk": 393}, [["BootstrapRowPlugin", {"glossary": {"extra_css_classes": [], "extra_inline_styles:Paddings": {"padding-right": "", "padding-left": ""}, "extra_inline_styles:Margins": {"margin-top": "", "margin-bottom": ""}}, "pk": 394}, [["BootstrapColumnPlugin", {"glossary": {"xs-column-width": "col-12", "sm-column-width": "col-sm-10", "md-column-width": "col-md-8", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "offset-sm-1", "md-column-offset": "offset-md-2", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720.0, "md": 616.67, "sm": 595.0, "lg": 750.0}}, "pk": 395}, [["ValidateSetOfFormsPlugin", {"glossary": {}, "pk": 396}, [["SegmentPlugin", {"glossary": {"open_tag": "if", "condition": "customer.is_registered"}, "pk": 397}, [["CustomerFormPlugin", {"glossary": {"render_type": "form"}, "pk": 398}, []]]], ["SegmentPlugin", {"glossary": {"open_tag": "elif", "condition": "customer.is_guest"}, "pk": 399}, [["GuestFormPlugin", {"glossary": {"render_type": "form"}, "pk": 400}, []]]], ["SegmentPlugin", {"glossary": {"open_tag": "else", "condition": ""}, "pk": 401}, [["HeadingPlugin", {"glossary": {"content": "Sie m\\u00fcssen angemeldet sein, um Ihre Details \\u00e4ndern zu k\\u00f6nnen", "element_id": "", "tag_type": "h3"}, "pk": 402}, []]]], ["ShopProceedButton", {"glossary": {"hide_plugin": false, "margins_xs": "", "margins_sm": "", "margins_md": "", "margins_lg": "", "margins_xl": "", "float_xs": "", "float_sm": "", "float_md": "", "float_lg": "", "float_xl": "", "disable_invalid": false, "product": null, "link_type": "cmspage", "cms_page": {"model": "cms.page", "pk": 2}, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "icon_font": null, "symbol": "right-open", "link_content": "Change Your Details", "button_type": "btn-success", "button_size": "", "button_options": [], "icon_align": "icon-right", "stretched_link": false}, "pk": 403}, []]]]]]]]]]]}
36	login	{"plugins": [["BootstrapContainerPlugin", {"glossary": {"media_queries": {"xs": ["(max-width: 768px)"], "md": ["(min-width: 992px)", "(max-width: 1200px)"], "sm": ["(min-width: 768px)", "(max-width: 992px)"], "lg": ["(min-width: 1200px)"]}, "container_max_widths": {"xs": 750, "md": 970, "sm": 750, "lg": 1170}, "hide_plugin": "", "fluid": "", "breakpoints": ["xs", "sm", "md", "lg"]}, "pk": 832}, [["BootstrapRowPlugin", {"glossary": {"extra_css_classes": [], "hide_plugin": "", "extra_inline_styles:Margins": {"margin-top": "", "margin-bottom": ""}}, "pk": 833}, [["BootstrapColumnPlugin", {"glossary": {"xs-column-width": "col-12", "sm-column-width": "col-sm-10", "md-column-width": "col-md-8", "lg-column-width": "", "xs-column-offset": "", "sm-column-offset": "offset-sm-1", "md-column-offset": "offset-md-2", "lg-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720.0, "md": 616.67, "sm": 595.0, "lg": 750.0}}, "pk": 834}, [["ShopAuthenticationPlugin", {"glossary": {"hide_plugin": false, "link_type": "RELOAD_PAGE", "cms_page": null, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "form_type": "login"}, "pk": 835}, []]]]]]]]]}
37	register-customer	{"plugins": [["BootstrapContainerPlugin", {"glossary": {"media_queries": {"xs": ["(max-width: 768px)"], "md": ["(min-width: 992px)", "(max-width: 1200px)"], "sm": ["(min-width: 768px)", "(max-width: 992px)"], "lg": ["(min-width: 1200px)"]}, "container_max_widths": {"xs": 750, "md": 970, "sm": 750, "lg": 1170}, "breakpoints": ["xs", "sm", "md", "lg"], "hide_plugin": "", "fluid": ""}, "pk": 415}, [["BootstrapRowPlugin", {"glossary": {"extra_css_classes": [], "hide_plugin": "", "extra_inline_styles:Margins": {"margin-top": "", "margin-bottom": ""}}, "pk": 416}, [["BootstrapColumnPlugin", {"glossary": {"xs-column-width": "col", "sm-column-width": "col-sm-10", "md-column-width": "col-md-8", "lg-column-width": "", "xs-column-offset": "", "sm-column-offset": "offset-sm-1", "md-column-offset": "offset-md-2", "lg-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720.0, "md": 616.67, "sm": 595.0, "lg": 750.0}}, "pk": 417}, [["ShopAuthenticationPlugin", {"glossary": {"hide_plugin": false, "link_type": "cmspage", "cms_page": {"model": "cms.page", "pk": 26}, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "form_type": "register-user"}, "pk": 418}, []]]]]]]]]}
38	change-password	{"plugins": [["BootstrapContainerPlugin", {"glossary": {"breakpoints": ["xs", "sm", "md", "lg", "xl"], "fluid": null}, "pk": 405}, [["BootstrapRowPlugin", {"glossary": {}, "pk": 406}, [["BootstrapColumnPlugin", {"glossary": {"xs-column-width": "col-12", "sm-column-width": "", "md-column-width": "col-md-10", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "offset-md-1", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": ""}, "pk": 407}, [["ShopAuthenticationPlugin", {"glossary": {"hide_plugin": false, "link_type": "RELOAD_PAGE", "cms_page": null, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "form_type": "password-change"}, "pk": 408}, []]]]]]]]]}
39	request-password-reset	{"plugins": [["BootstrapContainerPlugin", {"glossary": {"media_queries": {"xs": ["(max-width: 768px)"], "md": ["(min-width: 992px)", "(max-width: 1200px)"], "sm": ["(min-width: 768px)", "(max-width: 992px)"], "lg": ["(min-width: 1200px)"]}, "container_max_widths": {"xs": 750, "md": 970, "sm": 750, "lg": 1170}, "breakpoints": ["xs", "sm", "md", "lg"], "hide_plugin": "", "fluid": ""}, "pk": 376}, [["BootstrapRowPlugin", {"glossary": {"extra_css_classes": [], "hide_plugin": "", "extra_inline_styles:Margins": {"margin-top": "", "margin-bottom": ""}}, "pk": 377}, [["BootstrapColumnPlugin", {"glossary": {"xs-column-width": "col", "sm-column-width": "col-sm-10", "md-column-width": "col-md-8", "lg-column-width": "", "xs-column-offset": "", "sm-column-offset": "offset-sm-1", "md-column-offset": "offset-md-2", "lg-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720.0, "md": 616.67, "sm": 595.0, "lg": 750.0}}, "pk": 378}, [["ShopAuthenticationPlugin", {"glossary": {"hide_plugin": false, "link_type": "DO_NOTHING", "cms_page": null, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "form_type": "password-reset-request"}, "pk": 379}, []]]]]]]]]}
40	confirm-password-reset	{"plugins": [["BootstrapContainerPlugin", {"glossary": {"breakpoints": ["xs", "sm", "md", "lg", "xl"], "fluid": null}, "pk": 425}, [["BootstrapRowPlugin", {"glossary": {}, "pk": 426}, [["BootstrapColumnPlugin", {"glossary": {"xs-column-width": "col-12", "sm-column-width": "", "md-column-width": "col-md-10", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "offset-md-1", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": ""}, "pk": 427}, [["ShopAuthenticationPlugin", {"glossary": {"hide_plugin": false, "link_type": "cmspage", "cms_page": {"model": "cms.page", "pk": 2}, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "form_type": "password-reset-confirm"}, "pk": 428}, []]]]]]]]]}
42	cart	{"plugins": [["BootstrapContainerPlugin", {"glossary": {"breakpoints": ["xs", "sm", "md", "lg", "xl"], "fluid": "", "hide_plugin": "", "container_max_widths": {"xs": 750, "md": 970, "sm": 750, "lg": 1170}, "media_queries": {"xs": ["(max-width: 768px)"], "md": ["(min-width: 992px)", "(max-width: 1200px)"], "sm": ["(min-width: 768px)", "(max-width: 992px)"], "lg": ["(min-width: 1200px)"]}}, "pk": 392}, [["BootstrapRowPlugin", {"glossary": {}, "pk": 393}, [["BootstrapColumnPlugin", {"glossary": {"xs-column-width": "col", "sm-column-width": "", "md-column-width": "", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720.0, "md": 778.33, "sm": 720.0, "lg": 945.0}}, "pk": 394}, [["HeadingPlugin", {"glossary": {"content": "Your Shopping Cart", "element_id": "", "tag_type": "h2"}, "pk": 395}, []], ["ShopCartPlugin", {"glossary": {"render_type": "editable", "hide_plugin": ""}, "pk": 396}, [["ShopLeftExtension", {"glossary": {"padding_xs": "pt-3", "padding_sm": "", "padding_md": "pt-md-0", "padding_lg": "", "hide_plugin": ""}, "pk": 397}, [["BootstrapCardPlugin", {"glossary": {"heading_size": "", "panel_type": "panel-success", "heading": "Suggested Articles", "hide_plugin": "", "footer": ""}, "pk": 398}, [["BootstrapCardHeaderPlugin", {"glossary": {"hide_plugin": ""}, "pk": 399}, [["HeadingPlugin", {"glossary": {"tag_type": "h4", "content": "This could be interesting for you", "margins_xs": "", "margins_sm": "", "margins_md": "", "margins_lg": "", "element_id": "", "hide_plugin": ""}, "pk": 400}, []]]], ["BootstrapCardBodyPlugin", {"glossary": {"hide_plugin": ""}, "pk": 401}, [["TextPlugin", {"body": "<p>Vestibulum id ligula porta felis euismod semper. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>", "pk": 402}, []], ["BootstrapButtonPlugin", {"glossary": {"hide_plugin": false, "float_xs": "", "float_sm": "", "float_md": "", "float_lg": "", "float_xl": "", "render_template": "shop/button.html", "product": null, "link_type": "cmspage", "cms_page": {"model": "cms.page", "pk": 16}, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "icon_font": {"model": "cmsplugin_cascade.iconfont", "pk": 1}, "symbol": "shopping-bag", "link_content": "Continue Shopping", "button_type": "btn-primary", "button_size": "", "button_options": [], "icon_align": "icon-right", "stretched_link": false}, "pk": 403}, []]]]]]]], ["ShopRightExtension", {"glossary": {"padding_xs": "pt-3", "padding_sm": "", "padding_md": "", "padding_lg": "", "hide_plugin": ""}, "pk": 404}, [["BootstrapButtonPlugin", {"glossary": {"hide_plugin": false, "float_xs": "", "float_sm": "", "float_md": "", "float_lg": "", "float_xl": "", "render_template": "shop/button.html", "product": null, "link_type": "cmspage", "cms_page": {"model": "cms.page", "pk": 40}, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "icon_font": {"model": "cmsplugin_cascade.iconfont", "pk": 1}, "symbol": "logout", "link_content": "Proceed to Checkout", "button_type": "btn-success", "button_size": "btn-lg", "button_options": ["btn-block"], "icon_align": "icon-right", "stretched_link": false}, "pk": 405}, []]]]]]]]]]]]]}
43	footer	{"plugins": [["BootstrapContainerPlugin", {"glossary": {"breakpoints": ["xs", "sm", "md", "lg", "xl"], "fluid": "", "background_and_color": "", "hide_plugin": "", "container_max_widths": {"xs": 750, "md": 970, "sm": 750, "lg": 1170}, "media_queries": {"xs": ["(max-width: 768px)"], "md": ["(min-width: 992px)", "(max-width: 1200px)"], "sm": ["(min-width: 768px)", "(max-width: 992px)"], "lg": ["(min-width: 1200px)"]}}, "pk": 716}, [["BootstrapRowPlugin", {"glossary": {"margins_xs": "", "margins_sm": "", "margins_md": "", "margins_lg": "", "hide_plugin": ""}, "pk": 717}, [["BootstrapColumnPlugin", {"glossary": {"xs-column-width": "col-12", "sm-column-width": "", "md-column-width": "col-md", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 157.5, "md": 212.5, "sm": 157.5, "lg": 262.5}}, "pk": 718}, [["HeadingPlugin", {"glossary": {"tag_type": "h4", "content": "Legal", "margins_xs": "", "margins_sm": "", "margins_md": "", "margins_lg": "", "element_id": "", "hide_plugin": ""}, "pk": 719}, []], ["BootstrapSecondaryMenuPlugin", {"glossary": {"page_id": "shop-legal-pages", "offset": "0", "limit": "3", "render_template": "cascade/bootstrap4/secmenu-unstyled-list.html", "hide_plugin": ""}, "pk": 720}, []]]], ["BootstrapColumnPlugin", {"glossary": {"xs-column-width": "col-12", "sm-column-width": "", "md-column-width": "col-md", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 157.5, "md": 212.5, "sm": 157.5, "lg": 262.5}}, "pk": 721}, [["HeadingPlugin", {"glossary": {"tag_type": "h4", "content": "Help &amp; Contact", "margins_xs": "", "margins_sm": "", "margins_md": "", "margins_lg": "", "element_id": "", "hide_plugin": ""}, "pk": 722}, []]]], ["BootstrapColumnPlugin", {"glossary": {"xs-column-width": "col-12", "sm-column-width": "", "md-column-width": "col-md", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 157.5, "md": 212.5, "sm": 157.5, "lg": 262.5}}, "pk": 723}, [["HeadingPlugin", {"glossary": {"tag_type": "h4", "content": "Community", "margins_xs": "", "margins_sm": "", "margins_md": "", "margins_lg": "", "element_id": "", "hide_plugin": ""}, "pk": 724}, []]]], ["BootstrapColumnPlugin", {"glossary": {"xs-column-width": "col-12", "sm-column-width": "", "md-column-width": "col-md", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 157.5, "md": 212.5, "sm": 157.5, "lg": 262.5}}, "pk": 725}, [["SegmentPlugin", {"glossary": {"open_tag": "if", "condition": "user.is_anonymous"}, "pk": 726}, [["HeadingPlugin", {"glossary": {"content": "Join Us", "element_id": "", "tag_type": "h4", "hide_plugin": "", "extra_inline_styles:Margins": {"margin-right": "", "margin-top": "", "margin-bottom": "", "margin-left": ""}}, "pk": 727}, []], ["BootstrapSecondaryMenuPlugin", {"glossary": {"page_id": "shop-impersonal-pages", "offset": "0", "limit": "100", "render_template": "cascade/bootstrap4/secmenu-unstyled-list.html", "hide_plugin": ""}, "pk": 728}, []]]], ["SegmentPlugin", {"glossary": {"open_tag": "else", "condition": ""}, "pk": 729}, [["HeadingPlugin", {"glossary": {"tag_type": "h4", "content": "Personal Pages", "margins_xs": "", "margins_sm": "", "margins_md": "", "margins_lg": "", "element_id": "", "hide_plugin": ""}, "pk": 730}, []], ["BootstrapSecondaryMenuPlugin", {"glossary": {"page_id": "shop-personal-pages", "offset": "0", "limit": "3", "render_template": "cascade/bootstrap4/secmenu-unstyled-list.html", "hide_plugin": ""}, "pk": 731}, []]]]]]]]]]]}
44	home	{"plugins": [["BootstrapContainerPlugin", {"glossary": {"breakpoints": ["xs", "sm", "md", "lg", "xl"], "fluid": "", "background_and_color": "", "hide_plugin": ""}, "pk": 371}, [["BootstrapRowPlugin", {"glossary": {"padding_xs": "", "padding_sm": "", "padding_md": "", "padding_lg": "", "hide_plugin": ""}, "pk": 372}, [["BootstrapColumnPlugin", {"glossary": {"xs-column-width": "col-12", "sm-column-width": "", "md-column-width": "col-md-4", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": ""}, "pk": 373}, [["BootstrapImagePlugin", {"glossary": {"hide_plugin": false, "product": null, "link_type": "", "cms_page": null, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "image_shapes": ["img-fluid"], "image_width_responsive": "100%", "image_width_fixed": "", "image_height": "", "resize_options": ["upscale", "subject_location"], "image_alignment": "", "image_file": {"model": "filer.image", "pk": 1}, "image_title": "", "alt_tag": "", "_image_properties": {"width": 485, "height": 500, "exif_orientation": 1}, "column_bounds": {"min": 240.0, "max": 572.0}, "media_queries": {"xs": "(max-width: 575.98px) 572.00px", "sm": "(min-width: 576px) and (max-width: 767.98px) 540.00px", "md": "(min-width: 768px) and (max-width: 991.98px) 240.00px", "lg": "(min-width: 992px) and (max-width: 1199.98px) 320.00px", "xl": "(min-width: 1200px) 380.00px"}}, "pk": 374}, []]]], ["BootstrapColumnPlugin", {"glossary": {"xs-column-width": "col-12", "sm-column-width": "", "md-column-width": "col-md-6", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": ""}, "pk": 375}, [["HeadingPlugin", {"glossary": {"tag_type": "h3", "content": "Welcome to My SHOP", "margins_xs": "", "margins_sm": "", "margins_md": "", "margins_lg": "", "element_id": "", "hide_plugin": ""}, "pk": 376}, []], ["TextPlugin", {"body": "<p>Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Aenean lacinia bibendum nulla sed consectetur. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Nullam id dolor id nibh ultricies vehicula ut id elit. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Maecenas faucibus mollis interdum. Donec id elit non mi porta gravida at eget metus. Donec sed odio dui. Nulla vitae elit libero, a pharetra augue. Cras mattis consectetur purus sit amet fermentum.</p>\\n\\n<p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum id ligula porta felis euismod semper. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Aenean lacinia bibendum nulla sed consectetur. Donec ullamcorper nulla non metus auctor fringilla. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Maecenas faucibus mollis interdum. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Sed posuere consectetur est at lobortis. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>", "pk": 377}, []]]]]]]]]}
45	payment-canceled	{"plugins": [["BootstrapContainerPlugin", {"glossary": {"breakpoints": ["xs", "sm", "md", "lg", "xl"], "fluid": "", "hide_plugin": "", "container_max_widths": {"xs": 750, "md": 970, "sm": 750, "lg": 1170}, "media_queries": {"xs": ["(max-width: 768px)"], "md": ["(min-width: 992px)", "(max-width: 1200px)"], "sm": ["(min-width: 768px)", "(max-width: 992px)"], "lg": ["(min-width: 1200px)"]}}, "pk": 804}, [["BootstrapRowPlugin", {"glossary": {}, "pk": 805}, [["BootstrapColumnPlugin", {"glossary": {"xs-column-width": "col-12", "sm-column-width": "", "md-column-width": "col-md-8", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720.0, "md": 778.33, "sm": 720.0, "lg": 945.0}}, "pk": 806}, [["HeadingPlugin", {"glossary": {"tag_type": "h2", "content": "Your payment has been canceled", "margins_xs": "", "margins_sm": "", "margins_md": "", "margins_lg": "", "element_id": "", "hide_plugin": ""}, "pk": 807}, []], ["TextPlugin", {"body": "<p>The Payment Service Provider rejected your payment. Please visit the checkout page again and try with another payment method.\\u00a0</p>", "pk": 808}, []], ["BootstrapButtonPlugin", {"glossary": {"hide_plugin": false, "float_xs": "", "float_sm": "", "float_md": "", "float_lg": "", "float_xl": "", "render_template": "shop/button.html", "product": null, "link_type": "cmspage", "cms_page": {"model": "cms.page", "pk": 40}, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "icon_font": {"model": "cmsplugin_cascade.iconfont", "pk": 1}, "symbol": "logout", "link_content": "Retry to Checkout", "button_type": "btn-success", "button_size": "", "button_options": [], "icon_align": "icon-right", "stretched_link": false}, "pk": 809}, []]]]]]]]]}
46	social-icons	{"plugins": [["SimpleIconPlugin", {"glossary": {"hide_plugin": false, "extra_css_classes": "nav-link", "product": null, "link_type": "", "cms_page": null, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "icon_font": {"model": "cmsplugin_cascade.iconfont", "pk": 1}, "symbol": "mail"}, "pk": 393}, []], ["SimpleIconPlugin", {"glossary": {"hide_plugin": false, "extra_css_classes": "nav-link", "product": null, "link_type": "", "cms_page": null, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "icon_font": {"model": "cmsplugin_cascade.iconfont", "pk": 1}, "symbol": "phone"}, "pk": 394}, []], ["SimpleIconPlugin", {"glossary": {"hide_plugin": false, "extra_css_classes": "nav-link", "product": null, "link_type": "", "cms_page": null, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "icon_font": {"model": "cmsplugin_cascade.iconfont", "pk": 1}, "symbol": "link"}, "pk": 395}, []], ["SimpleIconPlugin", {"glossary": {"hide_plugin": false, "extra_css_classes": "nav-link", "product": null, "link_type": "", "cms_page": null, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "icon_font": {"model": "cmsplugin_cascade.iconfont", "pk": 1}, "symbol": "linkedin"}, "pk": 396}, []], ["SimpleIconPlugin", {"glossary": {"hide_plugin": false, "extra_css_classes": "nav-link", "product": null, "link_type": "", "cms_page": null, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "icon_font": {"model": "cmsplugin_cascade.iconfont", "pk": 1}, "symbol": "twitter"}, "pk": 397}, []], ["SimpleIconPlugin", {"glossary": {"hide_plugin": false, "extra_css_classes": "nav-link", "product": null, "link_type": "", "cms_page": null, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "icon_font": {"model": "cmsplugin_cascade.iconfont", "pk": 1}, "symbol": "github"}, "pk": 398}, []], ["SimpleIconPlugin", {"glossary": {"hide_plugin": false, "extra_css_classes": "nav-link", "product": null, "link_type": "", "cms_page": null, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "icon_font": {"model": "cmsplugin_cascade.iconfont", "pk": 1}, "symbol": "book"}, "pk": 399}, []]]}
\.


--
-- Data for Name: cmsplugin_cascade_element; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cmsplugin_cascade_element (cmsplugin_ptr_id, glossary, shared_glossary_id) FROM stdin;
865	{\n    "render_type": "catalog"\n}	\N
866	{\n    "breakpoints": [\n        "xs",\n        "sm",\n        "md",\n        "lg",\n        "xl"\n    ],\n    "fluid": "",\n    "background_and_color": "",\n    "hide_plugin": "",\n    "container_max_widths": {\n        "xs": 750,\n        "md": 970,\n        "sm": 750,\n        "lg": 1170\n    },\n    "media_queries": {\n        "xs": [\n            "(max-width: 768px)"\n        ],\n        "md": [\n            "(min-width: 992px)",\n            "(max-width: 1200px)"\n        ],\n        "sm": [\n            "(min-width: 768px)",\n            "(max-width: 992px)"\n        ],\n        "lg": [\n            "(min-width: 1200px)"\n        ]\n    }\n}	\N
867	{}	\N
868	{\n    "xs-column-width": "col",\n    "sm-column-width": "",\n    "md-column-width": "",\n    "lg-column-width": "",\n    "xs-column-offset": "",\n    "sm-column-offset": "",\n    "md-column-offset": "",\n    "lg-column-offset": "",\n    "xs-column-ordering": "",\n    "sm-column-ordering": "",\n    "md-column-ordering": "",\n    "lg-column-ordering": "",\n    "xs-responsive-utils": "",\n    "sm-responsive-utils": "",\n    "md-responsive-utils": "",\n    "lg-responsive-utils": "",\n    "hide_plugin": "",\n    "container_max_widths": {\n        "xs": 720,\n        "md": 940,\n        "sm": 720,\n        "lg": 1140\n    }\n}	\N
870	{\n    "pagination": "auto",\n    "hide_plugin": ""\n}	\N
924	{\n    "render_type": "soft-root"\n}	\N
925	{\n    "breakpoints": [\n        "xs",\n        "sm",\n        "md",\n        "lg",\n        "xl"\n    ],\n    "fluid": "",\n    "hide_plugin": "",\n    "container_max_widths": {\n        "xs": 750,\n        "md": 970,\n        "sm": 750,\n        "lg": 1170\n    },\n    "media_queries": {\n        "xs": [\n            "(max-width: 768px)"\n        ],\n        "md": [\n            "(min-width: 992px)",\n            "(max-width: 1200px)"\n        ],\n        "sm": [\n            "(min-width: 768px)",\n            "(max-width: 992px)"\n        ],\n        "lg": [\n            "(min-width: 1200px)"\n        ]\n    }\n}	\N
926	{}	\N
927	{\n    "xs-column-width": "col",\n    "sm-column-width": "",\n    "md-column-width": "",\n    "lg-column-width": "",\n    "xl-column-width": "",\n    "xs-column-offset": "",\n    "sm-column-offset": "",\n    "md-column-offset": "",\n    "lg-column-offset": "",\n    "xl-column-offset": "",\n    "xs-column-ordering": "",\n    "sm-column-ordering": "",\n    "md-column-ordering": "",\n    "lg-column-ordering": "",\n    "xl-column-ordering": "",\n    "xs-responsive-utils": "",\n    "sm-responsive-utils": "",\n    "md-responsive-utils": "",\n    "lg-responsive-utils": "",\n    "xl-responsive-utils": "",\n    "hide_plugin": "",\n    "container_max_widths": {\n        "xs": 720.0,\n        "md": 778.33,\n        "sm": 720.0,\n        "lg": 945.0\n    }\n}	\N
928	{\n    "hide_plugin": false,\n    "margins_xs": "",\n    "margins_sm": "",\n    "margins_md": "",\n    "margins_lg": "",\n    "margins_xl": "",\n    "element_id": "",\n    "tag_type": "h2",\n    "content": "Ihr Warenkorb"\n}	\N
929	{\n    "render_type": "editable",\n    "hide_plugin": ""\n}	\N
930	{\n    "padding_xs": "pt-3",\n    "padding_sm": "",\n    "padding_md": "pt-md-0",\n    "padding_lg": "",\n    "hide_plugin": ""\n}	\N
931	{\n    "heading_size": "",\n    "panel_type": "panel-success",\n    "heading": "Suggested Articles",\n    "hide_plugin": "",\n    "footer": ""\n}	\N
932	{\n    "hide_plugin": ""\n}	\N
933	{\n    "tag_type": "h4",\n    "content": "This could be interesting for you",\n    "margins_xs": "",\n    "margins_sm": "",\n    "margins_md": "",\n    "margins_lg": "",\n    "element_id": "",\n    "hide_plugin": ""\n}	\N
934	{\n    "hide_plugin": ""\n}	\N
936	{\n    "hide_plugin": false,\n    "float_xs": "",\n    "float_sm": "",\n    "float_md": "",\n    "float_lg": "",\n    "float_xl": "",\n    "render_template": "shop/button.html",\n    "product": null,\n    "link_type": "cmspage",\n    "cms_page": {\n        "model": "cms.page",\n        "pk": 16\n    },\n    "section": "",\n    "download_file": null,\n    "ext_url": "",\n    "mail_to": "",\n    "link_target": "",\n    "link_title": "",\n    "icon_font": {\n        "model": "cmsplugin_cascade.iconfont",\n        "pk": 1\n    },\n    "symbol": "shopping-bag",\n    "link_content": "Continue Shopping",\n    "button_type": "btn-primary",\n    "button_size": "",\n    "button_options": [],\n    "icon_align": "icon-right",\n    "stretched_link": false\n}	\N
937	{\n    "padding_xs": "pt-3",\n    "padding_sm": "",\n    "padding_md": "",\n    "padding_lg": "",\n    "hide_plugin": ""\n}	\N
938	{\n    "hide_plugin": false,\n    "float_xs": "",\n    "float_sm": "",\n    "float_md": "",\n    "float_lg": "",\n    "float_xl": "",\n    "render_template": "shop/button.html",\n    "product": null,\n    "link_type": "cmspage",\n    "cms_page": {\n        "model": "cms.page",\n        "pk": 40\n    },\n    "section": "",\n    "download_file": null,\n    "ext_url": "",\n    "mail_to": "",\n    "link_target": "",\n    "link_title": "",\n    "icon_font": {\n        "model": "cmsplugin_cascade.iconfont",\n        "pk": 1\n    },\n    "symbol": "logout",\n    "link_content": "Weiter zur Kasse",\n    "button_type": "btn-success",\n    "button_size": "btn-lg",\n    "button_options": [\n        "btn-block"\n    ],\n    "icon_align": "icon-right",\n    "stretched_link": false\n}	\N
24	{"breakpoints": ["xs", "sm", "md", "lg", "xl"], "fluid": "", "background_and_color": "", "hide_plugin": "", "container_max_widths": {"xs": 750, "md": 970, "sm": 750, "lg": 1170}, "media_queries": {"xs": ["(max-width: 768px)"], "md": ["(min-width: 992px)", "(max-width: 1200px)"], "sm": ["(min-width: 768px)", "(max-width: 992px)"], "lg": ["(min-width: 1200px)"]}}	\N
25	{"margins_xs": "", "margins_sm": "", "margins_md": "", "margins_lg": "", "hide_plugin": ""}	\N
330	{"render_type": "default"}	\N
26	{"xs-column-width": "col-12", "sm-column-width": "", "md-column-width": "col-md", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 157.5, "md": 212.5, "sm": 157.5, "lg": 262.5}}	\N
28	{"page_id": "shop-legal-pages", "offset": "0", "limit": "3", "render_template": "cascade/bootstrap4/secmenu-unstyled-list.html", "hide_plugin": ""}	\N
29	{"xs-column-width": "col-12", "sm-column-width": "", "md-column-width": "col-md", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 157.5, "md": 212.5, "sm": 157.5, "lg": 262.5}}	\N
31	{"xs-column-width": "col-12", "sm-column-width": "", "md-column-width": "col-md", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 157.5, "md": 212.5, "sm": 157.5, "lg": 262.5}}	\N
33	{"xs-column-width": "col-12", "sm-column-width": "", "md-column-width": "col-md", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 157.5, "md": 212.5, "sm": 157.5, "lg": 262.5}}	\N
34	{"open_tag": "if", "condition": "user.is_anonymous"}	\N
36	{"page_id": "shop-impersonal-pages", "offset": "0", "limit": "100", "render_template": "cascade/bootstrap4/secmenu-unstyled-list.html", "hide_plugin": ""}	\N
37	{"open_tag": "else", "condition": ""}	\N
39	{"page_id": "shop-personal-pages", "offset": "0", "limit": "3", "render_template": "cascade/bootstrap4/secmenu-unstyled-list.html", "hide_plugin": ""}	\N
40	{"breakpoints": ["xs", "sm", "md", "lg", "xl"], "fluid": "", "background_and_color": "", "hide_plugin": ""}	\N
41	{"padding_xs": "", "padding_sm": "", "padding_md": "", "padding_lg": "", "hide_plugin": ""}	\N
42	{"xs-column-width": "col-12", "sm-column-width": "", "md-column-width": "col-md-4", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": ""}	\N
43	{"hide_plugin": false, "product": null, "link_type": "", "cms_page": null, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "image_shapes": ["img-fluid"], "image_width_responsive": "100%", "image_width_fixed": "", "image_height": "", "resize_options": ["upscale", "subject_location"], "image_alignment": "", "image_file": {"model": "filer.image", "pk": 1}, "image_title": "", "alt_tag": "", "_image_properties": {"width": 485, "height": 500, "exif_orientation": 1}, "column_bounds": {"min": 240.0, "max": 572.0}, "media_queries": {"xs": "(max-width: 575.98px) 572.00px", "sm": "(min-width: 576px) and (max-width: 767.98px) 540.00px", "md": "(min-width: 768px) and (max-width: 991.98px) 240.00px", "lg": "(min-width: 992px) and (max-width: 1199.98px) 320.00px", "xl": "(min-width: 1200px) 380.00px"}}	\N
44	{"xs-column-width": "col-12", "sm-column-width": "", "md-column-width": "col-md-6", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": ""}	\N
45	{"tag_type": "h3", "content": "Welcome to My SHOP", "margins_xs": "", "margins_sm": "", "margins_md": "", "margins_lg": "", "element_id": "", "hide_plugin": ""}	\N
27	{\n    "hide_plugin": false,\n    "margins_xs": "",\n    "margins_sm": "",\n    "margins_md": "",\n    "margins_lg": "",\n    "margins_xl": "",\n    "element_id": "",\n    "tag_type": "h4",\n    "content": "Über uns"\n}	\N
30	{\n    "hide_plugin": false,\n    "margins_xs": "",\n    "margins_sm": "",\n    "margins_md": "",\n    "margins_lg": "",\n    "margins_xl": "",\n    "element_id": "",\n    "tag_type": "h4",\n    "content": "Kontakt"\n}	\N
32	{\n    "hide_plugin": false,\n    "margins_xs": "",\n    "margins_sm": "",\n    "margins_md": "",\n    "margins_lg": "",\n    "margins_xl": "",\n    "element_id": "",\n    "tag_type": "h4",\n    "content": "Social Media"\n}	\N
35	{\n    "hide_plugin": false,\n    "margins_xs": "",\n    "margins_sm": "",\n    "margins_md": "",\n    "margins_lg": "",\n    "margins_xl": "",\n    "element_id": "",\n    "tag_type": "h4",\n    "content": "Mitmachen"\n}	\N
38	{\n    "hide_plugin": false,\n    "margins_xs": "",\n    "margins_sm": "",\n    "margins_md": "",\n    "margins_lg": "",\n    "margins_xl": "",\n    "element_id": "",\n    "tag_type": "h4",\n    "content": "Über mich"\n}	\N
445	{\n    "hide_plugin": false,\n    "step_title": "Adressen"\n}	\N
458	{\n    "hide_plugin": false,\n    "step_title": "Zusammenfassung"\n}	\N
61	{"breakpoints": ["xs", "sm", "md", "lg", "xl"], "fluid": "", "background_and_color": "", "hide_plugin": "", "container_max_widths": {"xs": 750, "md": 970, "sm": 750, "lg": 1170}, "media_queries": {"xs": ["(max-width: 768px)"], "md": ["(min-width: 992px)", "(max-width: 1200px)"], "sm": ["(min-width: 768px)", "(max-width: 992px)"], "lg": ["(min-width: 1200px)"]}}	\N
62	{}	\N
63	{"xs-column-width": "col", "sm-column-width": "", "md-column-width": "", "lg-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "", "lg-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720, "md": 940, "sm": 720, "lg": 1140}}	\N
66	{"pagination": "auto", "hide_plugin": ""}	\N
67	{"render_type": "catalog"}	\N
68	{"render_type": "catalog"}	\N
69	{"breakpoints": ["xs", "sm", "md", "lg", "xl"], "fluid": "", "background_and_color": "", "hide_plugin": "", "container_max_widths": {"xs": 750, "md": 970, "sm": 750, "lg": 1170}, "media_queries": {"xs": ["(max-width: 768px)"], "md": ["(min-width: 992px)", "(max-width: 1200px)"], "sm": ["(min-width: 768px)", "(max-width: 992px)"], "lg": ["(min-width: 1200px)"]}}	\N
70	{}	\N
71	{"xs-column-width": "col", "sm-column-width": "", "md-column-width": "", "lg-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "", "lg-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720, "md": 940, "sm": 720, "lg": 1140}}	\N
74	{"pagination": "auto", "hide_plugin": ""}	\N
89	{"breakpoints": ["xs", "sm", "md", "lg", "xl"], "fluid": "", "background_and_color": "", "hide_plugin": "", "container_max_widths": {"xs": 750, "md": 970, "sm": 750, "lg": 1170}, "media_queries": {"xs": ["(max-width: 768px)"], "md": ["(min-width: 992px)", "(max-width: 1200px)"], "sm": ["(min-width: 768px)", "(max-width: 992px)"], "lg": ["(min-width: 1200px)"]}}	\N
90	{"extra_inline_styles:Paddings": {"padding-right": "", "padding-left": ""}, "extra_inline_styles:Margins": {"margin-top": "", "margin-bottom": ""}}	\N
91	{"xs-column-width": "col", "sm-column-width": "", "md-column-width": "col-md-10", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "offset-md-1", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720.0, "md": 940.0, "sm": 720.0, "lg": 1140.0}}	\N
92	{"pagination": "auto", "hide_plugin": ""}	\N
93	{"render_type": "catalog"}	\N
94	{"render_type": "catalog"}	\N
95	{"breakpoints": ["xs", "sm", "md", "lg", "xl"], "fluid": "", "background_and_color": "", "hide_plugin": "", "container_max_widths": {"xs": 750, "md": 970, "sm": 750, "lg": 1170}, "media_queries": {"xs": ["(max-width: 768px)"], "md": ["(min-width: 992px)", "(max-width: 1200px)"], "sm": ["(min-width: 768px)", "(max-width: 992px)"], "lg": ["(min-width: 1200px)"]}}	\N
96	{"extra_inline_styles:Paddings": {"padding-right": "", "padding-left": ""}, "extra_inline_styles:Margins": {"margin-top": "", "margin-bottom": ""}}	\N
97	{"xs-column-width": "col", "sm-column-width": "", "md-column-width": "col-md-10", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "offset-md-1", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720.0, "md": 940.0, "sm": 720.0, "lg": 1140.0}}	\N
98	{"pagination": "auto", "hide_plugin": ""}	\N
99	{"render_type": "catalog"}	\N
100	{"breakpoints": ["xs", "sm", "md", "lg", "xl"], "fluid": "", "background_and_color": "", "hide_plugin": "", "container_max_widths": {"xs": 750, "md": 970, "sm": 750, "lg": 1170}, "media_queries": {"xs": ["(max-width: 768px)"], "md": ["(min-width: 992px)", "(max-width: 1200px)"], "sm": ["(min-width: 768px)", "(max-width: 992px)"], "lg": ["(min-width: 1200px)"]}}	\N
101	{"extra_inline_styles:Paddings": {"padding-right": "", "padding-left": ""}, "extra_inline_styles:Margins": {"margin-top": "", "margin-bottom": ""}}	\N
102	{"xs-column-width": "col", "sm-column-width": "", "md-column-width": "col-md-10", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "offset-md-1", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720.0, "md": 940.0, "sm": 720.0, "lg": 1140.0}}	\N
103	{"pagination": "auto", "hide_plugin": ""}	\N
109	{"breakpoints": ["xs", "sm", "md", "lg", "xl"], "fluid": "", "hide_plugin": "", "container_max_widths": {"xs": 750, "md": 970, "sm": 750, "lg": 1170}, "media_queries": {"xs": ["(max-width: 768px)"], "md": ["(min-width: 992px)", "(max-width: 1200px)"], "sm": ["(min-width: 768px)", "(max-width: 992px)"], "lg": ["(min-width: 1200px)"]}}	\N
110	{}	\N
111	{"xs-column-width": "col", "sm-column-width": "", "md-column-width": "", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720.0, "md": 778.33, "sm": 720.0, "lg": 945.0}}	\N
113	{"render_type": "editable", "hide_plugin": ""}	\N
114	{"padding_xs": "pt-3", "padding_sm": "", "padding_md": "pt-md-0", "padding_lg": "", "hide_plugin": ""}	\N
115	{"heading_size": "", "panel_type": "panel-success", "heading": "Suggested Articles", "hide_plugin": "", "footer": ""}	\N
116	{"hide_plugin": ""}	\N
117	{"tag_type": "h4", "content": "This could be interesting for you", "margins_xs": "", "margins_sm": "", "margins_md": "", "margins_lg": "", "element_id": "", "hide_plugin": ""}	\N
118	{"hide_plugin": ""}	\N
112	{\n    "hide_plugin": false,\n    "margins_xs": "",\n    "margins_sm": "",\n    "margins_md": "",\n    "margins_lg": "",\n    "margins_xl": "",\n    "element_id": "",\n    "tag_type": "h2",\n    "content": "Ihr Warenkorb"\n}	\N
120	{"hide_plugin": false, "float_xs": "", "float_sm": "", "float_md": "", "float_lg": "", "float_xl": "", "render_template": "shop/button.html", "product": null, "link_type": "cmspage", "cms_page": {"model": "cms.page", "pk": 16}, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "icon_font": {"model": "cmsplugin_cascade.iconfont", "pk": 1}, "symbol": "shopping-bag", "link_content": "Continue Shopping", "button_type": "btn-primary", "button_size": "", "button_options": [], "icon_align": "icon-right", "stretched_link": false}	\N
121	{"padding_xs": "pt-3", "padding_sm": "", "padding_md": "", "padding_lg": "", "hide_plugin": ""}	\N
123	{"render_type": "soft-root"}	\N
124	{"render_type": "soft-root"}	\N
125	{"breakpoints": ["xs", "sm", "md", "lg", "xl"], "fluid": "", "hide_plugin": "", "container_max_widths": {"xs": 750, "md": 970, "sm": 750, "lg": 1170}, "media_queries": {"xs": ["(max-width: 768px)"], "md": ["(min-width: 992px)", "(max-width: 1200px)"], "sm": ["(min-width: 768px)", "(max-width: 992px)"], "lg": ["(min-width: 1200px)"]}}	\N
126	{}	\N
127	{"xs-column-width": "col", "sm-column-width": "", "md-column-width": "", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720.0, "md": 778.33, "sm": 720.0, "lg": 945.0}}	\N
128	{"content": "Your Shopping Cart", "element_id": "", "tag_type": "h2"}	\N
129	{"render_type": "editable", "hide_plugin": ""}	\N
130	{"padding_xs": "pt-3", "padding_sm": "", "padding_md": "pt-md-0", "padding_lg": "", "hide_plugin": ""}	\N
131	{"heading_size": "", "panel_type": "panel-success", "heading": "Suggested Articles", "hide_plugin": "", "footer": ""}	\N
132	{"hide_plugin": ""}	\N
133	{"tag_type": "h4", "content": "This could be interesting for you", "margins_xs": "", "margins_sm": "", "margins_md": "", "margins_lg": "", "element_id": "", "hide_plugin": ""}	\N
134	{"hide_plugin": ""}	\N
136	{"hide_plugin": false, "float_xs": "", "float_sm": "", "float_md": "", "float_lg": "", "float_xl": "", "render_template": "shop/button.html", "product": null, "link_type": "cmspage", "cms_page": {"model": "cms.page", "pk": 16}, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "icon_font": {"model": "cmsplugin_cascade.iconfont", "pk": 1}, "symbol": "shopping-bag", "link_content": "Continue Shopping", "button_type": "btn-primary", "button_size": "", "button_options": [], "icon_align": "icon-right", "stretched_link": false}	\N
137	{"padding_xs": "pt-3", "padding_sm": "", "padding_md": "", "padding_lg": "", "hide_plugin": ""}	\N
138	{"hide_plugin": false, "float_xs": "", "float_sm": "", "float_md": "", "float_lg": "", "float_xl": "", "render_template": "shop/button.html", "product": null, "link_type": "cmspage", "cms_page": {"model": "cms.page", "pk": 40}, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "icon_font": {"model": "cmsplugin_cascade.iconfont", "pk": 1}, "symbol": "logout", "link_content": "Proceed to Checkout", "button_type": "btn-success", "button_size": "btn-lg", "button_options": ["btn-block"], "icon_align": "icon-right", "stretched_link": false}	\N
169	{"breakpoints": ["xs", "sm", "md", "lg", "xl"], "fluid": "", "margins_xs": "", "margins_sm": "", "margins_md": "", "margins_lg": "", "hide_plugin": "", "container_max_widths": {"xs": 750, "md": 970, "sm": 750, "lg": 1170}, "media_queries": {"xs": ["(max-width: 768px)"], "md": ["(min-width: 992px)", "(max-width: 1200px)"], "sm": ["(min-width: 768px)", "(max-width: 992px)"], "lg": ["(min-width: 1200px)"]}}	\N
170	{"extra_css_classes": [], "extra_inline_styles:Margins": {"margin-top": "", "margin-bottom": ""}, "extra_inline_styles:background-color": ["disabled", "#ffffff"], "extra_inline_styles:Paddings": {"padding-right": "", "padding-left": ""}}	\N
171	{"xs-column-width": "col", "sm-column-width": "", "md-column-width": "col-md-10", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "offset-md-1", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720.0, "md": 940.0, "sm": 720.0, "lg": 1140.0}}	\N
172	{"content": "Your Wishes", "element_id": "", "tag_type": "h2"}	\N
173	{"render_type": "watch"}	\N
174	{"render_type": "soft-root"}	\N
175	{"render_type": "soft-root"}	\N
176	{"breakpoints": ["xs", "sm", "md", "lg", "xl"], "fluid": "", "margins_xs": "", "margins_sm": "", "margins_md": "", "margins_lg": "", "hide_plugin": "", "container_max_widths": {"xs": 750, "md": 970, "sm": 750, "lg": 1170}, "media_queries": {"xs": ["(max-width: 768px)"], "md": ["(min-width: 992px)", "(max-width: 1200px)"], "sm": ["(min-width: 768px)", "(max-width: 992px)"], "lg": ["(min-width: 1200px)"]}}	\N
177	{"extra_css_classes": [], "extra_inline_styles:Margins": {"margin-top": "", "margin-bottom": ""}, "extra_inline_styles:background-color": ["disabled", "#ffffff"], "extra_inline_styles:Paddings": {"padding-right": "", "padding-left": ""}}	\N
178	{"xs-column-width": "col", "sm-column-width": "", "md-column-width": "col-md-10", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "offset-md-1", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720.0, "md": 940.0, "sm": 720.0, "lg": 1140.0}}	\N
179	{"content": "Your Wishes", "element_id": "", "tag_type": "h2"}	\N
180	{"render_type": "watch"}	\N
181	{"render_type": "soft-root"}	\N
182	{"breakpoints": ["xs", "sm", "md", "lg", "xl"], "fluid": "", "margins_xs": "", "margins_sm": "", "margins_md": "", "margins_lg": "", "hide_plugin": "", "container_max_widths": {"xs": 750, "md": 970, "sm": 750, "lg": 1170}, "media_queries": {"xs": ["(max-width: 768px)"], "md": ["(min-width: 992px)", "(max-width: 1200px)"], "sm": ["(min-width: 768px)", "(max-width: 992px)"], "lg": ["(min-width: 1200px)"]}}	\N
183	{"extra_css_classes": [], "extra_inline_styles:Margins": {"margin-top": "", "margin-bottom": ""}, "extra_inline_styles:background-color": ["disabled", "#ffffff"], "extra_inline_styles:Paddings": {"padding-right": "", "padding-left": ""}}	\N
184	{"xs-column-width": "col", "sm-column-width": "", "md-column-width": "col-md-10", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "offset-md-1", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720.0, "md": 940.0, "sm": 720.0, "lg": 1140.0}}	\N
185	{"content": "Your Wishes", "element_id": "", "tag_type": "h2"}	\N
186	{"render_type": "watch"}	\N
1089	{\n    "render_template": "cascade/link/text-link.html",\n    "product": null,\n    "link_type": "cmspage",\n    "cms_page": {\n        "model": "cms.page",\n        "pk": 8\n    },\n    "section": "",\n    "download_file": null,\n    "ext_url": "",\n    "mail_to": "",\n    "link_target": "",\n    "link_title": "",\n    "link_content": "AGBs"\n}	\N
197	{\n    "hide_plugin": false,\n    "margins_xs": "",\n    "margins_sm": "",\n    "margins_md": "",\n    "margins_lg": "",\n    "margins_xl": "",\n    "element_id": "",\n    "tag_type": "h2",\n    "content": "Danke für Ihre Bestellung"\n}	\N
202	{\n    "hide_plugin": false,\n    "margins_xs": "",\n    "margins_sm": "",\n    "margins_md": "",\n    "margins_lg": "",\n    "margins_xl": "",\n    "element_id": "",\n    "tag_type": "h5",\n    "content": "Anmerkungen zu Bestellung"\n}	\N
206	{\n    "hide_plugin": false,\n    "margins_xs": "",\n    "margins_sm": "",\n    "margins_md": "",\n    "margins_lg": "",\n    "margins_xl": "",\n    "float_xs": "float-left",\n    "float_sm": "",\n    "float_md": "",\n    "float_lg": "",\n    "float_xl": "",\n    "icon_font": {\n        "model": "cmsplugin_cascade.iconfont",\n        "pk": 1\n    },\n    "symbol": "cart-arrow-down",\n    "link_content": "Erneut bestellen",\n    "button_type": "btn-success",\n    "button_size": "",\n    "button_options": [],\n    "icon_align": "icon-right",\n    "stretched_link": false\n}	\N
207	{\n    "hide_plugin": false,\n    "margins_xs": "",\n    "margins_sm": "",\n    "margins_md": "",\n    "margins_lg": "",\n    "margins_xl": "",\n    "float_xs": "float-right",\n    "float_sm": "",\n    "float_md": "",\n    "float_lg": "",\n    "float_xl": "",\n    "icon_font": {\n        "model": "cmsplugin_cascade.iconfont",\n        "pk": 1\n    },\n    "symbol": "cancel-circled",\n    "link_content": "Bestellung abbrechen",\n    "button_type": "btn-outline-warning",\n    "button_size": "",\n    "button_options": [],\n    "icon_align": "icon-right",\n    "stretched_link": false\n}	\N
193	{"breakpoints": ["xs", "sm", "md", "lg", "xl"], "fluid": "", "hide_plugin": "", "container_max_widths": {"xs": 750, "md": 970, "sm": 750, "lg": 1170}, "media_queries": {"xs": ["(max-width: 768px)"], "md": ["(min-width: 992px)", "(max-width: 1200px)"], "sm": ["(min-width: 768px)", "(max-width: 992px)"], "lg": ["(min-width: 1200px)"]}}	\N
194	{"extra_css_classes": [], "extra_inline_styles:Margins": {"margin-top": "", "margin-bottom": ""}, "hide_plugin": ""}	\N
195	{"xs-column-width": "col", "sm-column-width": "", "md-column-width": "col-md-10", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "offset-md-1", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720, "md": 940, "sm": 720, "lg": 1140}}	\N
196	{"open_tag": "if", "condition": "is_last_order"}	\N
198	{"hide_plugin": ""}	\N
199	{"padding_xs": "", "padding_sm": "", "padding_md": "", "padding_lg": "", "hide_plugin": ""}	\N
200	{"header": "", "body_padding": "on", "footer": "", "background_and_color": "", "margins_xs": "", "margins_sm": "", "margins_md": "", "margins_lg": "", "hide_plugin": ""}	\N
201	{"hide_plugin": ""}	\N
203	{"hide_plugin": ""}	\N
204	{"hide_plugin": false, "show_history": true, "icon_font": {"model": "cmsplugin_cascade.iconfont", "pk": 1}, "symbol": "plus-squared-alt", "link_content": "Add annotation", "button_type": "btn-primary", "button_size": "btn-sm", "button_options": [], "icon_align": "icon-right", "stretched_link": false}	\N
205	{"padding_xs": "", "padding_sm": "", "padding_md": "", "padding_lg": "", "hide_plugin": ""}	\N
208	{"render_type": "default"}	\N
209	{"render_type": "default"}	\N
210	{"breakpoints": ["xs", "sm", "md", "lg", "xl"], "fluid": "", "hide_plugin": "", "container_max_widths": {"xs": 750, "md": 970, "sm": 750, "lg": 1170}, "media_queries": {"xs": ["(max-width: 768px)"], "md": ["(min-width: 992px)", "(max-width: 1200px)"], "sm": ["(min-width: 768px)", "(max-width: 992px)"], "lg": ["(min-width: 1200px)"]}}	\N
211	{"extra_css_classes": [], "extra_inline_styles:Margins": {"margin-top": "", "margin-bottom": ""}, "hide_plugin": ""}	\N
212	{"xs-column-width": "col", "sm-column-width": "", "md-column-width": "col-md-10", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "offset-md-1", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720, "md": 940, "sm": 720, "lg": 1140}}	\N
213	{"open_tag": "if", "condition": "is_last_order"}	\N
214	{"tag_type": "h2", "content": "Thanks for your order", "margins_xs": "", "margins_sm": "", "margins_md": "", "margins_lg": "", "element_id": "", "hide_plugin": ""}	\N
215	{"hide_plugin": ""}	\N
216	{"padding_xs": "", "padding_sm": "", "padding_md": "", "padding_lg": "", "hide_plugin": ""}	\N
217	{"header": "", "body_padding": "on", "footer": "", "background_and_color": "", "margins_xs": "", "margins_sm": "", "margins_md": "", "margins_lg": "", "hide_plugin": ""}	\N
218	{"hide_plugin": ""}	\N
219	{"tag_type": "h5", "content": "Annotations to this Order", "margins_xs": "", "margins_sm": "", "margins_md": "", "margins_lg": "", "element_id": "", "hide_plugin": ""}	\N
220	{"hide_plugin": ""}	\N
221	{"hide_plugin": false, "show_history": true, "icon_font": {"model": "cmsplugin_cascade.iconfont", "pk": 1}, "symbol": "plus-squared-alt", "link_content": "Add annotation", "button_type": "btn-primary", "button_size": "btn-sm", "button_options": [], "icon_align": "icon-right", "stretched_link": false}	\N
222	{"padding_xs": "", "padding_sm": "", "padding_md": "", "padding_lg": "", "hide_plugin": ""}	\N
223	{"hide_plugin": false, "margins_xs": "", "margins_sm": "", "margins_md": "", "margins_lg": "", "margins_xl": "", "float_xs": "float-left", "float_sm": "", "float_md": "", "float_lg": "", "float_xl": "", "icon_font": {"model": "cmsplugin_cascade.iconfont", "pk": 1}, "symbol": "cart-arrow-down", "link_content": "Re-Add to Cart", "button_type": "btn-success", "button_size": "", "button_options": [], "icon_align": "icon-right", "stretched_link": false}	\N
224	{"hide_plugin": false, "margins_xs": "", "margins_sm": "", "margins_md": "", "margins_lg": "", "margins_xl": "", "float_xs": "float-right", "float_sm": "", "float_md": "", "float_lg": "", "float_xl": "", "icon_font": {"model": "cmsplugin_cascade.iconfont", "pk": 1}, "symbol": "cancel-circled", "link_content": "Cancel", "button_type": "btn-outline-warning", "button_size": "", "button_options": [], "icon_align": "icon-right", "stretched_link": false}	\N
1090	{\n    "breakpoints": [\n        "xs",\n        "sm",\n        "md",\n        "lg",\n        "xl"\n    ],\n    "fluid": "",\n    "padding_xs": "py-3",\n    "padding_sm": "",\n    "padding_md": "",\n    "padding_lg": "",\n    "hide_plugin": "",\n    "container_max_widths": {\n        "xs": 750,\n        "md": 970,\n        "sm": 750,\n        "lg": 1170\n    },\n    "media_queries": {\n        "xs": [\n            "(max-width: 768px)"\n        ],\n        "md": [\n            "(min-width: 992px)",\n            "(max-width: 1200px)"\n        ],\n        "sm": [\n            "(min-width: 768px)",\n            "(max-width: 992px)"\n        ],\n        "lg": [\n            "(min-width: 1200px)"\n        ]\n    }\n}	\N
1091	{\n    "open_tag": "if",\n    "condition": "customer.is_recognized"\n}	\N
877	{\n    "hide_plugin": false,\n    "fluid": true,\n    "background_color": [\n        "#fdfcff",\n        false\n    ],\n    "element_heights": {\n        "xs": "300px",\n        "sm": "300px",\n        "md": "300px",\n        "lg": "300px",\n        "xl": "300px"\n    },\n    "image_file": {\n        "model": "filer.image",\n        "pk": 201\n    },\n    "background_repeat": "no-repeat",\n    "background_attachment": "local",\n    "background_vertical_position": "center",\n    "background_horizontal_position": "40%",\n    "background_size": "auto",\n    "background_width_height": {},\n    "media_queries": {\n        "xs": {\n            "width": 576,\n            "media": "(max-width: 575.98px)"\n        },\n        "sm": {\n            "width": 768,\n            "media": "(min-width: 576px) and (max-width: 767.98px)"\n        },\n        "md": {\n            "width": 992,\n            "media": "(min-width: 768px) and (max-width: 991.98px)"\n        },\n        "lg": {\n            "width": 1200,\n            "media": "(min-width: 992px) and (max-width: 1199.98px)"\n        },\n        "xl": {\n            "width": 1980,\n            "media": "(min-width: 1200px)"\n        }\n    }\n}	\N
1092	{\n    "hide_plugin": false,\n    "padding_xs": "py-4",\n    "padding_sm": "",\n    "padding_md": "",\n    "padding_lg": "",\n    "padding_xl": ""\n}	\N
1093	{\n    "xs-column-width": "col",\n    "sm-column-width": "",\n    "md-column-width": "col-md-10",\n    "lg-column-width": "",\n    "xl-column-width": "",\n    "xs-column-offset": "",\n    "sm-column-offset": "",\n    "md-column-offset": "offset-md-1",\n    "lg-column-offset": "",\n    "xl-column-offset": "",\n    "xs-column-ordering": "",\n    "sm-column-ordering": "",\n    "md-column-ordering": "",\n    "lg-column-ordering": "",\n    "xl-column-ordering": "",\n    "xs-responsive-utils": "",\n    "sm-responsive-utils": "",\n    "md-responsive-utils": "",\n    "lg-responsive-utils": "",\n    "xl-responsive-utils": "",\n    "hide_plugin": "",\n    "container_max_widths": {\n        "xs": 720.0,\n        "md": 778.33,\n        "sm": 595.0,\n        "lg": 750.0\n    }\n}	\N
1094	{}	\N
1095	{\n    "hide_plugin": false,\n    "step_title": "Kundeninfos"\n}	\N
1096	{\n    "open_tag": "if",\n    "condition": "customer.is_registered"\n}	\N
1097	{\n    "render_type": "form"\n}	\N
1098	{\n    "open_tag": "else",\n    "condition": ""\n}	\N
1099	{\n    "render_type": "form"\n}	\N
1100	{}	\N
241	{"render_type": "default"}	\N
242	{"breakpoints": ["xs", "sm", "md", "lg", "xl"], "fluid": "", "hide_plugin": "", "container_max_widths": {"xs": 750, "md": 970, "sm": 750, "lg": 1170}, "media_queries": {"xs": ["(max-width: 768px)"], "md": ["(min-width: 992px)", "(max-width: 1200px)"], "sm": ["(min-width: 768px)", "(max-width: 992px)"], "lg": ["(min-width: 1200px)"]}}	\N
243	{"extra_css_classes": [], "extra_inline_styles:Margins": {"margin-top": "", "margin-bottom": ""}, "hide_plugin": ""}	\N
244	{"xs-column-width": "col", "sm-column-width": "", "md-column-width": "col-md-10", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "offset-md-1", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720, "md": 940, "sm": 720, "lg": 1140}}	\N
245	{"open_tag": "if", "condition": "is_last_order"}	\N
246	{"tag_type": "h2", "content": "Thanks for your order", "margins_xs": "", "margins_sm": "", "margins_md": "", "margins_lg": "", "element_id": "", "hide_plugin": ""}	\N
247	{"hide_plugin": ""}	\N
248	{"padding_xs": "", "padding_sm": "", "padding_md": "", "padding_lg": "", "hide_plugin": ""}	\N
249	{"header": "", "body_padding": "on", "footer": "", "background_and_color": "", "margins_xs": "", "margins_sm": "", "margins_md": "", "margins_lg": "", "hide_plugin": ""}	\N
250	{"hide_plugin": ""}	\N
251	{"tag_type": "h5", "content": "Annotations to this Order", "margins_xs": "", "margins_sm": "", "margins_md": "", "margins_lg": "", "element_id": "", "hide_plugin": ""}	\N
252	{"hide_plugin": ""}	\N
253	{"hide_plugin": false, "show_history": true, "icon_font": {"model": "cmsplugin_cascade.iconfont", "pk": 1}, "symbol": "plus-squared-alt", "link_content": "Add annotation", "button_type": "btn-primary", "button_size": "btn-sm", "button_options": [], "icon_align": "icon-right", "stretched_link": false}	\N
254	{"padding_xs": "", "padding_sm": "", "padding_md": "", "padding_lg": "", "hide_plugin": ""}	\N
255	{"hide_plugin": false, "margins_xs": "", "margins_sm": "", "margins_md": "", "margins_lg": "", "margins_xl": "", "float_xs": "float-left", "float_sm": "", "float_md": "", "float_lg": "", "float_xl": "", "icon_font": {"model": "cmsplugin_cascade.iconfont", "pk": 1}, "symbol": "cart-arrow-down", "link_content": "Re-Add to Cart", "button_type": "btn-success", "button_size": "", "button_options": [], "icon_align": "icon-right", "stretched_link": false}	\N
256	{"hide_plugin": false, "margins_xs": "", "margins_sm": "", "margins_md": "", "margins_lg": "", "margins_xl": "", "float_xs": "float-right", "float_sm": "", "float_md": "", "float_lg": "", "float_xl": "", "icon_font": {"model": "cmsplugin_cascade.iconfont", "pk": 1}, "symbol": "cancel-circled", "link_content": "Cancel", "button_type": "btn-outline-warning", "button_size": "", "button_options": [], "icon_align": "icon-right", "stretched_link": false}	\N
257	{"breakpoints": ["xs", "sm", "md", "lg", "xl"], "fluid": "", "hide_plugin": "", "container_max_widths": {"xs": 750, "md": 970, "sm": 750, "lg": 1170}, "media_queries": {"xs": ["(max-width: 768px)"], "md": ["(min-width: 992px)", "(max-width: 1200px)"], "sm": ["(min-width: 768px)", "(max-width: 992px)"], "lg": ["(min-width: 1200px)"]}}	\N
258	{"extra_css_classes": [], "extra_inline_styles:Paddings": {"padding-right": "", "padding-left": ""}, "extra_inline_styles:Margins": {"margin-top": "", "margin-bottom": ""}}	\N
259	{"xs-column-width": "col-12", "sm-column-width": "col-sm-10", "md-column-width": "col-md-8", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "offset-sm-1", "md-column-offset": "offset-md-2", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720.0, "md": 616.67, "sm": 595.0, "lg": 750.0}}	\N
260	{}	\N
261	{"open_tag": "if", "condition": "customer.is_registered"}	\N
262	{"render_type": "form"}	\N
263	{"open_tag": "elif", "condition": "customer.is_guest"}	\N
264	{"render_type": "form"}	\N
265	{"open_tag": "else", "condition": ""}	\N
266	{"content": "Sie m\\u00fcssen angemeldet sein, um Ihre Details \\u00e4ndern zu k\\u00f6nnen", "element_id": "", "tag_type": "h3"}	\N
267	{"hide_plugin": false, "margins_xs": "", "margins_sm": "", "margins_md": "", "margins_lg": "", "margins_xl": "", "float_xs": "", "float_sm": "", "float_md": "", "float_lg": "", "float_xl": "", "disable_invalid": false, "product": null, "link_type": "cmspage", "cms_page": {"model": "cms.page", "pk": 2}, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "icon_font": null, "symbol": "right-open", "link_content": "Change Your Details", "button_type": "btn-success", "button_size": "", "button_options": [], "icon_align": "icon-right", "stretched_link": false}	\N
268	{"render_type": "default"}	\N
269	{"render_type": "default"}	\N
270	{"breakpoints": ["xs", "sm", "md", "lg", "xl"], "fluid": "", "hide_plugin": "", "container_max_widths": {"xs": 750, "md": 970, "sm": 750, "lg": 1170}, "media_queries": {"xs": ["(max-width: 768px)"], "md": ["(min-width: 992px)", "(max-width: 1200px)"], "sm": ["(min-width: 768px)", "(max-width: 992px)"], "lg": ["(min-width: 1200px)"]}}	\N
271	{"extra_css_classes": [], "extra_inline_styles:Paddings": {"padding-right": "", "padding-left": ""}, "extra_inline_styles:Margins": {"margin-top": "", "margin-bottom": ""}}	\N
272	{"xs-column-width": "col-12", "sm-column-width": "col-sm-10", "md-column-width": "col-md-8", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "offset-sm-1", "md-column-offset": "offset-md-2", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720.0, "md": 616.67, "sm": 595.0, "lg": 750.0}}	\N
273	{}	\N
274	{"open_tag": "if", "condition": "customer.is_registered"}	\N
275	{"render_type": "form"}	\N
276	{"open_tag": "elif", "condition": "customer.is_guest"}	\N
277	{"render_type": "form"}	\N
278	{"open_tag": "else", "condition": ""}	\N
279	{"content": "Sie m\\u00fcssen angemeldet sein, um Ihre Details \\u00e4ndern zu k\\u00f6nnen", "element_id": "", "tag_type": "h3"}	\N
280	{"hide_plugin": false, "margins_xs": "", "margins_sm": "", "margins_md": "", "margins_lg": "", "margins_xl": "", "float_xs": "", "float_sm": "", "float_md": "", "float_lg": "", "float_xl": "", "disable_invalid": false, "product": null, "link_type": "cmspage", "cms_page": {"model": "cms.page", "pk": 2}, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "icon_font": null, "symbol": "right-open", "link_content": "Change Your Details", "button_type": "btn-success", "button_size": "", "button_options": [], "icon_align": "icon-right", "stretched_link": false}	\N
1101	{\n    "hide_plugin": false,\n    "margins_xs": "",\n    "margins_sm": "",\n    "margins_md": "",\n    "margins_lg": "",\n    "margins_xl": "",\n    "float_xs": "float-right",\n    "float_sm": "",\n    "float_md": "",\n    "float_lg": "",\n    "float_xl": "",\n    "disable_invalid": false,\n    "product": null,\n    "link_type": "NEXT_STEP",\n    "cms_page": null,\n    "section": "",\n    "download_file": null,\n    "ext_url": "",\n    "mail_to": "",\n    "link_target": "",\n    "link_title": "",\n    "icon_font": {\n        "model": "cmsplugin_cascade.iconfont",\n        "pk": 1\n    },\n    "symbol": "right-open",\n    "link_content": "Weiter",\n    "button_type": "btn-success",\n    "button_size": "",\n    "button_options": [],\n    "icon_align": "icon-right",\n    "stretched_link": false\n}	\N
1103	{\n    "render_template": "cascade/link/text-link.html",\n    "product": null,\n    "link_type": "cmspage",\n    "cms_page": {\n        "model": "cms.page",\n        "pk": 10\n    },\n    "section": "",\n    "download_file": null,\n    "ext_url": "",\n    "mail_to": "",\n    "link_target": "",\n    "link_title": "",\n    "link_content": "Datenschutzvereinbarung"\n}	\N
1104	{\n    "hide_plugin": false,\n    "step_title": "Adressen"\n}	\N
1105	{\n    "address_form": "shipping",\n    "render_type": "form",\n    "allow_multiple": "on",\n    "allow_use_primary": "",\n    "headline_legend": "on",\n    "hide_plugin": ""\n}	\N
1106	{\n    "allow_use_primary": "on",\n    "allow_multiple": "on",\n    "address_form": "billing",\n    "render_type": "form",\n    "hide_plugin": "",\n    "headline_legend": "on"\n}	\N
1107	{}	\N
327	{"xs-column-width": "col-12", "sm-column-width": "col-sm-10", "md-column-width": "col-md-8", "lg-column-width": "", "xs-column-offset": "", "sm-column-offset": "offset-sm-1", "md-column-offset": "offset-md-2", "lg-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720.0, "md": 616.67, "sm": 595.0, "lg": 750.0}}	\N
293	{"render_type": "default"}	\N
294	{"breakpoints": ["xs", "sm", "md", "lg", "xl"], "fluid": "", "hide_plugin": "", "container_max_widths": {"xs": 750, "md": 970, "sm": 750, "lg": 1170}, "media_queries": {"xs": ["(max-width: 768px)"], "md": ["(min-width: 992px)", "(max-width: 1200px)"], "sm": ["(min-width: 768px)", "(max-width: 992px)"], "lg": ["(min-width: 1200px)"]}}	\N
295	{"extra_css_classes": [], "extra_inline_styles:Paddings": {"padding-right": "", "padding-left": ""}, "extra_inline_styles:Margins": {"margin-top": "", "margin-bottom": ""}}	\N
296	{"xs-column-width": "col-12", "sm-column-width": "col-sm-10", "md-column-width": "col-md-8", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "offset-sm-1", "md-column-offset": "offset-md-2", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720.0, "md": 616.67, "sm": 595.0, "lg": 750.0}}	\N
297	{}	\N
298	{"open_tag": "if", "condition": "customer.is_registered"}	\N
299	{"render_type": "form"}	\N
300	{"open_tag": "elif", "condition": "customer.is_guest"}	\N
301	{"render_type": "form"}	\N
302	{"open_tag": "else", "condition": ""}	\N
303	{"content": "Sie m\\u00fcssen angemeldet sein, um Ihre Details \\u00e4ndern zu k\\u00f6nnen", "element_id": "", "tag_type": "h3"}	\N
304	{"hide_plugin": false, "margins_xs": "", "margins_sm": "", "margins_md": "", "margins_lg": "", "margins_xl": "", "float_xs": "", "float_sm": "", "float_md": "", "float_lg": "", "float_xl": "", "disable_invalid": false, "product": null, "link_type": "cmspage", "cms_page": {"model": "cms.page", "pk": 2}, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "icon_font": null, "symbol": "right-open", "link_content": "Change Your Details", "button_type": "btn-success", "button_size": "", "button_options": [], "icon_align": "icon-right", "stretched_link": false}	\N
305	{"breakpoints": ["xs", "sm", "md", "lg", "xl"], "fluid": null}	\N
306	{}	\N
307	{"xs-column-width": "col-12", "sm-column-width": "", "md-column-width": "col-md-10", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "offset-md-1", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": ""}	\N
308	{"hide_plugin": false, "link_type": "RELOAD_PAGE", "cms_page": null, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "form_type": "password-change"}	\N
309	{"render_type": "default"}	\N
310	{"render_type": "default"}	\N
311	{"breakpoints": ["xs", "sm", "md", "lg", "xl"], "fluid": null}	\N
312	{}	\N
313	{"xs-column-width": "col-12", "sm-column-width": "", "md-column-width": "col-md-10", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "offset-md-1", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": ""}	\N
314	{"hide_plugin": false, "link_type": "RELOAD_PAGE", "cms_page": null, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "form_type": "password-change"}	\N
320	{"render_type": "default"}	\N
321	{"breakpoints": ["xs", "sm", "md", "lg", "xl"], "fluid": null}	\N
322	{}	\N
323	{"xs-column-width": "col-12", "sm-column-width": "", "md-column-width": "col-md-10", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "offset-md-1", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": ""}	\N
324	{"hide_plugin": false, "link_type": "RELOAD_PAGE", "cms_page": null, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "form_type": "password-change"}	\N
325	{"media_queries": {"xs": ["(max-width: 768px)"], "md": ["(min-width: 992px)", "(max-width: 1200px)"], "sm": ["(min-width: 768px)", "(max-width: 992px)"], "lg": ["(min-width: 1200px)"]}, "container_max_widths": {"xs": 750, "md": 970, "sm": 750, "lg": 1170}, "hide_plugin": "", "fluid": "", "breakpoints": ["xs", "sm", "md", "lg"]}	\N
326	{"extra_css_classes": [], "hide_plugin": "", "extra_inline_styles:Margins": {"margin-top": "", "margin-bottom": ""}}	\N
328	{"hide_plugin": false, "link_type": "RELOAD_PAGE", "cms_page": null, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "form_type": "login"}	\N
329	{"render_type": "default"}	\N
331	{"media_queries": {"xs": ["(max-width: 768px)"], "md": ["(min-width: 992px)", "(max-width: 1200px)"], "sm": ["(min-width: 768px)", "(max-width: 992px)"], "lg": ["(min-width: 1200px)"]}, "container_max_widths": {"xs": 750, "md": 970, "sm": 750, "lg": 1170}, "hide_plugin": "", "fluid": "", "breakpoints": ["xs", "sm", "md", "lg"]}	\N
332	{"extra_css_classes": [], "hide_plugin": "", "extra_inline_styles:Margins": {"margin-top": "", "margin-bottom": ""}}	\N
333	{"xs-column-width": "col-12", "sm-column-width": "col-sm-10", "md-column-width": "col-md-8", "lg-column-width": "", "xs-column-offset": "", "sm-column-offset": "offset-sm-1", "md-column-offset": "offset-md-2", "lg-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720.0, "md": 616.67, "sm": 595.0, "lg": 750.0}}	\N
334	{"hide_plugin": false, "link_type": "RELOAD_PAGE", "cms_page": null, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "form_type": "login"}	\N
335	{"render_type": "default"}	\N
336	{"media_queries": {"xs": ["(max-width: 768px)"], "md": ["(min-width: 992px)", "(max-width: 1200px)"], "sm": ["(min-width: 768px)", "(max-width: 992px)"], "lg": ["(min-width: 1200px)"]}, "container_max_widths": {"xs": 750, "md": 970, "sm": 750, "lg": 1170}, "hide_plugin": "", "fluid": "", "breakpoints": ["xs", "sm", "md", "lg"]}	\N
337	{"extra_css_classes": [], "hide_plugin": "", "extra_inline_styles:Margins": {"margin-top": "", "margin-bottom": ""}}	\N
338	{"xs-column-width": "col-12", "sm-column-width": "col-sm-10", "md-column-width": "col-md-8", "lg-column-width": "", "xs-column-offset": "", "sm-column-offset": "offset-sm-1", "md-column-offset": "offset-md-2", "lg-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720.0, "md": 616.67, "sm": 595.0, "lg": 750.0}}	\N
339	{"hide_plugin": false, "link_type": "RELOAD_PAGE", "cms_page": null, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "form_type": "login"}	\N
340	{"render_type": "default"}	\N
341	{"media_queries": {"xs": ["(max-width: 768px)"], "md": ["(min-width: 992px)", "(max-width: 1200px)"], "sm": ["(min-width: 768px)", "(max-width: 992px)"], "lg": ["(min-width: 1200px)"]}, "container_max_widths": {"xs": 750, "md": 970, "sm": 750, "lg": 1170}, "hide_plugin": "", "fluid": "", "breakpoints": ["xs", "sm", "md", "lg"]}	\N
342	{"extra_css_classes": [], "hide_plugin": "", "extra_inline_styles:Margins": {"margin-top": "", "margin-bottom": ""}}	\N
343	{"xs-column-width": "col-12", "sm-column-width": "col-sm-10", "md-column-width": "col-md-8", "lg-column-width": "", "xs-column-offset": "", "sm-column-offset": "offset-sm-1", "md-column-offset": "offset-md-2", "lg-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720.0, "md": 616.67, "sm": 595.0, "lg": 750.0}}	\N
344	{"hide_plugin": false, "link_type": "RELOAD_PAGE", "cms_page": null, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "form_type": "login"}	\N
345	{"media_queries": {"xs": ["(max-width: 768px)"], "md": ["(min-width: 992px)", "(max-width: 1200px)"], "sm": ["(min-width: 768px)", "(max-width: 992px)"], "lg": ["(min-width: 1200px)"]}, "container_max_widths": {"xs": 750, "md": 970, "sm": 750, "lg": 1170}, "breakpoints": ["xs", "sm", "md", "lg"], "hide_plugin": "", "fluid": ""}	\N
346	{"extra_css_classes": [], "hide_plugin": "", "extra_inline_styles:Margins": {"margin-top": "", "margin-bottom": ""}}	\N
347	{"xs-column-width": "col", "sm-column-width": "col-sm-10", "md-column-width": "col-md-8", "lg-column-width": "", "xs-column-offset": "", "sm-column-offset": "offset-sm-1", "md-column-offset": "offset-md-2", "lg-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720.0, "md": 616.67, "sm": 595.0, "lg": 750.0}}	\N
348	{"hide_plugin": false, "link_type": "cmspage", "cms_page": {"model": "cms.page", "pk": 26}, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "form_type": "register-user"}	\N
349	{"render_type": "default"}	\N
350	{"render_type": "default"}	\N
351	{"media_queries": {"xs": ["(max-width: 768px)"], "md": ["(min-width: 992px)", "(max-width: 1200px)"], "sm": ["(min-width: 768px)", "(max-width: 992px)"], "lg": ["(min-width: 1200px)"]}, "container_max_widths": {"xs": 750, "md": 970, "sm": 750, "lg": 1170}, "breakpoints": ["xs", "sm", "md", "lg"], "hide_plugin": "", "fluid": ""}	\N
352	{"extra_css_classes": [], "hide_plugin": "", "extra_inline_styles:Margins": {"margin-top": "", "margin-bottom": ""}}	\N
353	{"xs-column-width": "col", "sm-column-width": "col-sm-10", "md-column-width": "col-md-8", "lg-column-width": "", "xs-column-offset": "", "sm-column-offset": "offset-sm-1", "md-column-offset": "offset-md-2", "lg-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720.0, "md": 616.67, "sm": 595.0, "lg": 750.0}}	\N
354	{"hide_plugin": false, "link_type": "cmspage", "cms_page": {"model": "cms.page", "pk": 26}, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "form_type": "register-user"}	\N
888	{"render_type": "default"}	\N
889	{"breakpoints": ["xs", "sm", "md", "lg", "xl"], "fluid": null}	\N
890	{}	\N
420	{"breakpoints": ["xs", "sm", "md", "lg", "xl"], "fluid": "", "hide_plugin": "", "container_max_widths": {"xs": 750, "md": 970, "sm": 750, "lg": 1170}, "media_queries": {"xs": ["(max-width: 768px)"], "md": ["(min-width: 992px)", "(max-width: 1200px)"], "sm": ["(min-width: 768px)", "(max-width: 992px)"], "lg": ["(min-width: 1200px)"]}}	\N
421	{}	\N
891	{"xs-column-width": "col-12", "sm-column-width": "", "md-column-width": "col-md-10", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "offset-md-1", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": ""}	\N
892	{"hide_plugin": false, "link_type": "cmspage", "cms_page": {"model": "cms.page", "pk": 2}, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "form_type": "password-reset-confirm"}	\N
360	{"render_type": "default"}	\N
361	{"media_queries": {"xs": ["(max-width: 768px)"], "md": ["(min-width: 992px)", "(max-width: 1200px)"], "sm": ["(min-width: 768px)", "(max-width: 992px)"], "lg": ["(min-width: 1200px)"]}, "container_max_widths": {"xs": 750, "md": 970, "sm": 750, "lg": 1170}, "breakpoints": ["xs", "sm", "md", "lg"], "hide_plugin": "", "fluid": ""}	\N
362	{"extra_css_classes": [], "hide_plugin": "", "extra_inline_styles:Margins": {"margin-top": "", "margin-bottom": ""}}	\N
363	{"xs-column-width": "col", "sm-column-width": "col-sm-10", "md-column-width": "col-md-8", "lg-column-width": "", "xs-column-offset": "", "sm-column-offset": "offset-sm-1", "md-column-offset": "offset-md-2", "lg-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720.0, "md": 616.67, "sm": 595.0, "lg": 750.0}}	\N
364	{"hide_plugin": false, "link_type": "cmspage", "cms_page": {"model": "cms.page", "pk": 26}, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "form_type": "register-user"}	\N
365	{"media_queries": {"xs": ["(max-width: 768px)"], "md": ["(min-width: 992px)", "(max-width: 1200px)"], "sm": ["(min-width: 768px)", "(max-width: 992px)"], "lg": ["(min-width: 1200px)"]}, "container_max_widths": {"xs": 750, "md": 970, "sm": 750, "lg": 1170}, "breakpoints": ["xs", "sm", "md", "lg"], "hide_plugin": "", "fluid": ""}	\N
366	{"extra_css_classes": [], "hide_plugin": "", "extra_inline_styles:Margins": {"margin-top": "", "margin-bottom": ""}}	\N
367	{"xs-column-width": "col", "sm-column-width": "col-sm-10", "md-column-width": "col-md-8", "lg-column-width": "", "xs-column-offset": "", "sm-column-offset": "offset-sm-1", "md-column-offset": "offset-md-2", "lg-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720.0, "md": 616.67, "sm": 595.0, "lg": 750.0}}	\N
368	{"hide_plugin": false, "link_type": "DO_NOTHING", "cms_page": null, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "form_type": "password-reset-request"}	\N
369	{"render_type": "default"}	\N
370	{"render_type": "default"}	\N
371	{"media_queries": {"xs": ["(max-width: 768px)"], "md": ["(min-width: 992px)", "(max-width: 1200px)"], "sm": ["(min-width: 768px)", "(max-width: 992px)"], "lg": ["(min-width: 1200px)"]}, "container_max_widths": {"xs": 750, "md": 970, "sm": 750, "lg": 1170}, "breakpoints": ["xs", "sm", "md", "lg"], "hide_plugin": "", "fluid": ""}	\N
372	{"extra_css_classes": [], "hide_plugin": "", "extra_inline_styles:Margins": {"margin-top": "", "margin-bottom": ""}}	\N
373	{"xs-column-width": "col", "sm-column-width": "col-sm-10", "md-column-width": "col-md-8", "lg-column-width": "", "xs-column-offset": "", "sm-column-offset": "offset-sm-1", "md-column-offset": "offset-md-2", "lg-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720.0, "md": 616.67, "sm": 595.0, "lg": 750.0}}	\N
374	{"hide_plugin": false, "link_type": "DO_NOTHING", "cms_page": null, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "form_type": "password-reset-request"}	\N
1108	{\n    "hide_plugin": false,\n    "margins_xs": "",\n    "margins_sm": "",\n    "margins_md": "",\n    "margins_lg": "",\n    "margins_xl": "",\n    "float_xs": "float-right",\n    "float_sm": "",\n    "float_md": "",\n    "float_lg": "",\n    "float_xl": "",\n    "disable_invalid": false,\n    "product": null,\n    "link_type": "NEXT_STEP",\n    "cms_page": null,\n    "section": "",\n    "download_file": null,\n    "ext_url": "",\n    "mail_to": "",\n    "link_target": "",\n    "link_title": "",\n    "icon_font": {\n        "model": "cmsplugin_cascade.iconfont",\n        "pk": 1\n    },\n    "symbol": "right-open",\n    "link_content": "Weiter",\n    "button_type": "btn-success",\n    "button_size": "",\n    "button_options": [],\n    "icon_align": "icon-right",\n    "stretched_link": false\n}	\N
1109	{\n    "hide_plugin": false,\n    "step_title": "Bezahlmethoden"\n}	\N
1110	{\n    "content": "Bezahlen und Versenden",\n    "element_id": "",\n    "tag_type": "h3"\n}	\N
1111	{\n    "render_type": "summary"\n}	\N
1112	{\n    "render_type": "form",\n    "headline_legend": "on",\n    "show_additional_charge": "on",\n    "hide_plugin": ""\n}	\N
380	{"render_type": "default"}	\N
381	{"media_queries": {"xs": ["(max-width: 768px)"], "md": ["(min-width: 992px)", "(max-width: 1200px)"], "sm": ["(min-width: 768px)", "(max-width: 992px)"], "lg": ["(min-width: 1200px)"]}, "container_max_widths": {"xs": 750, "md": 970, "sm": 750, "lg": 1170}, "breakpoints": ["xs", "sm", "md", "lg"], "hide_plugin": "", "fluid": ""}	\N
382	{"extra_css_classes": [], "hide_plugin": "", "extra_inline_styles:Margins": {"margin-top": "", "margin-bottom": ""}}	\N
383	{"xs-column-width": "col", "sm-column-width": "col-sm-10", "md-column-width": "col-md-8", "lg-column-width": "", "xs-column-offset": "", "sm-column-offset": "offset-sm-1", "md-column-offset": "offset-md-2", "lg-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720.0, "md": 616.67, "sm": 595.0, "lg": 750.0}}	\N
384	{"hide_plugin": false, "link_type": "DO_NOTHING", "cms_page": null, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "form_type": "password-reset-request"}	\N
385	{"breakpoints": ["xs", "sm", "md", "lg", "xl"], "fluid": null}	\N
386	{}	\N
1113	{\n    "render_type": "form",\n    "headline_legend": "on",\n    "show_additional_charge": "on",\n    "hide_plugin": ""\n}	\N
387	{"xs-column-width": "col-12", "sm-column-width": "", "md-column-width": "col-md-10", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "offset-md-1", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": ""}	\N
388	{"hide_plugin": false, "link_type": "cmspage", "cms_page": {"model": "cms.page", "pk": 2}, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "form_type": "password-reset-confirm"}	\N
389	{"render_type": "default"}	\N
390	{"render_type": "default"}	\N
391	{"breakpoints": ["xs", "sm", "md", "lg", "xl"], "fluid": null}	\N
392	{}	\N
393	{"xs-column-width": "col-12", "sm-column-width": "", "md-column-width": "col-md-10", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "offset-md-1", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": ""}	\N
394	{"hide_plugin": false, "link_type": "cmspage", "cms_page": {"model": "cms.page", "pk": 2}, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "form_type": "password-reset-confirm"}	\N
395	{"render_type": "default"}	\N
396	{"breakpoints": ["xs", "sm", "md", "lg", "xl"], "fluid": null}	\N
397	{}	\N
398	{"xs-column-width": "col-12", "sm-column-width": "", "md-column-width": "col-md-10", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "offset-md-1", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": ""}	\N
399	{"hide_plugin": false, "link_type": "cmspage", "cms_page": {"model": "cms.page", "pk": 2}, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "form_type": "password-reset-confirm"}	\N
1114	{\n    "render_type": "form"\n}	\N
1115	{}	\N
405	{"breakpoints": ["xs", "sm", "md", "lg", "xl"], "fluid": "", "hide_plugin": "", "container_max_widths": {"xs": 750, "md": 970, "sm": 750, "lg": 1170}, "media_queries": {"xs": ["(max-width: 768px)"], "md": ["(min-width: 992px)", "(max-width: 1200px)"], "sm": ["(min-width: 768px)", "(max-width: 992px)"], "lg": ["(min-width: 1200px)"]}}	\N
406	{}	\N
407	{"xs-column-width": "col-12", "sm-column-width": "", "md-column-width": "col-md-8", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720.0, "md": 778.33, "sm": 720.0, "lg": 945.0}}	\N
408	{"tag_type": "h2", "content": "Your payment has been canceled", "margins_xs": "", "margins_sm": "", "margins_md": "", "margins_lg": "", "element_id": "", "hide_plugin": ""}	\N
410	{"hide_plugin": false, "float_xs": "", "float_sm": "", "float_md": "", "float_lg": "", "float_xl": "", "render_template": "shop/button.html", "product": null, "link_type": "cmspage", "cms_page": {"model": "cms.page", "pk": 40}, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "icon_font": {"model": "cmsplugin_cascade.iconfont", "pk": 1}, "symbol": "logout", "link_content": "Retry to Checkout", "button_type": "btn-success", "button_size": "", "button_options": [], "icon_align": "icon-right", "stretched_link": false}	\N
411	{"render_type": "default"}	\N
412	{"render_type": "default"}	\N
413	{"breakpoints": ["xs", "sm", "md", "lg", "xl"], "fluid": "", "hide_plugin": "", "container_max_widths": {"xs": 750, "md": 970, "sm": 750, "lg": 1170}, "media_queries": {"xs": ["(max-width: 768px)"], "md": ["(min-width: 992px)", "(max-width: 1200px)"], "sm": ["(min-width: 768px)", "(max-width: 992px)"], "lg": ["(min-width: 1200px)"]}}	\N
414	{}	\N
415	{"xs-column-width": "col-12", "sm-column-width": "", "md-column-width": "col-md-8", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720.0, "md": 778.33, "sm": 720.0, "lg": 945.0}}	\N
416	{"tag_type": "h2", "content": "Your payment has been canceled", "margins_xs": "", "margins_sm": "", "margins_md": "", "margins_lg": "", "element_id": "", "hide_plugin": ""}	\N
418	{"hide_plugin": false, "float_xs": "", "float_sm": "", "float_md": "", "float_lg": "", "float_xl": "", "render_template": "shop/button.html", "product": null, "link_type": "cmspage", "cms_page": {"model": "cms.page", "pk": 40}, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "icon_font": {"model": "cmsplugin_cascade.iconfont", "pk": 1}, "symbol": "logout", "link_content": "Retry to Checkout", "button_type": "btn-success", "button_size": "", "button_options": [], "icon_align": "icon-right", "stretched_link": false}	\N
419	{"render_type": "default"}	\N
893	{"render_type": "soft-root"}	\N
894	{"breakpoints": ["xs", "sm", "md", "lg", "xl"], "fluid": "", "margins_xs": "", "margins_sm": "", "margins_md": "", "margins_lg": "", "hide_plugin": "", "container_max_widths": {"xs": 750, "md": 970, "sm": 750, "lg": 1170}, "media_queries": {"xs": ["(max-width: 768px)"], "md": ["(min-width: 992px)", "(max-width: 1200px)"], "sm": ["(min-width: 768px)", "(max-width: 992px)"], "lg": ["(min-width: 1200px)"]}}	\N
895	{"extra_css_classes": [], "extra_inline_styles:Margins": {"margin-top": "", "margin-bottom": ""}, "extra_inline_styles:background-color": ["disabled", "#ffffff"], "extra_inline_styles:Paddings": {"padding-right": "", "padding-left": ""}}	\N
422	{"xs-column-width": "col-12", "sm-column-width": "", "md-column-width": "col-md-8", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720.0, "md": 778.33, "sm": 720.0, "lg": 945.0}}	\N
423	{"tag_type": "h2", "content": "Your payment has been canceled", "margins_xs": "", "margins_sm": "", "margins_md": "", "margins_lg": "", "element_id": "", "hide_plugin": ""}	\N
425	{"hide_plugin": false, "float_xs": "", "float_sm": "", "float_md": "", "float_lg": "", "float_xl": "", "render_template": "shop/button.html", "product": null, "link_type": "cmspage", "cms_page": {"model": "cms.page", "pk": 40}, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "icon_font": {"model": "cmsplugin_cascade.iconfont", "pk": 1}, "symbol": "logout", "link_content": "Retry to Checkout", "button_type": "btn-success", "button_size": "", "button_options": [], "icon_align": "icon-right", "stretched_link": false}	\N
426	{"render_type": "default"}	\N
427	{"breakpoints": ["xs", "sm", "md", "lg", "xl"], "fluid": "", "hide_plugin": "", "container_max_widths": {"xs": 750, "md": 970, "sm": 750, "lg": 1170}, "media_queries": {"xs": ["(max-width: 768px)"], "md": ["(min-width: 992px)", "(max-width: 1200px)"], "sm": ["(min-width: 768px)", "(max-width: 992px)"], "lg": ["(min-width: 1200px)"]}}	\N
428	{}	\N
429	{"xs-column-width": "col-12", "sm-column-width": "", "md-column-width": "col-md-8", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720.0, "md": 778.33, "sm": 720.0, "lg": 945.0}}	\N
430	{"tag_type": "h2", "content": "Your payment has been canceled", "margins_xs": "", "margins_sm": "", "margins_md": "", "margins_lg": "", "element_id": "", "hide_plugin": ""}	\N
432	{"hide_plugin": false, "float_xs": "", "float_sm": "", "float_md": "", "float_lg": "", "float_xl": "", "render_template": "shop/button.html", "product": null, "link_type": "cmspage", "cms_page": {"model": "cms.page", "pk": 40}, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "icon_font": {"model": "cmsplugin_cascade.iconfont", "pk": 1}, "symbol": "logout", "link_content": "Retry to Checkout", "button_type": "btn-success", "button_size": "", "button_options": [], "icon_align": "icon-right", "stretched_link": false}	\N
433	{"breakpoints": ["xs", "sm", "md", "lg", "xl"], "fluid": "", "padding_xs": "py-3", "padding_sm": "", "padding_md": "", "padding_lg": "", "hide_plugin": "", "container_max_widths": {"xs": 750, "md": 970, "sm": 750, "lg": 1170}, "media_queries": {"xs": ["(max-width: 768px)"], "md": ["(min-width: 992px)", "(max-width: 1200px)"], "sm": ["(min-width: 768px)", "(max-width: 992px)"], "lg": ["(min-width: 1200px)"]}}	\N
434	{"open_tag": "if", "condition": "customer.is_recognized"}	\N
435	{"hide_plugin": false, "padding_xs": "py-4", "padding_sm": "", "padding_md": "", "padding_lg": "", "padding_xl": ""}	\N
436	{"xs-column-width": "col", "sm-column-width": "", "md-column-width": "col-md-10", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "offset-md-1", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720.0, "md": 778.33, "sm": 595.0, "lg": 750.0}}	\N
437	{}	\N
439	{"open_tag": "if", "condition": "customer.is_registered"}	\N
440	{"render_type": "form"}	\N
441	{"open_tag": "else", "condition": ""}	\N
442	{"render_type": "form"}	\N
443	{}	\N
1116	{\n    "hide_plugin": false,\n    "margins_xs": "",\n    "margins_sm": "",\n    "margins_md": "",\n    "margins_lg": "",\n    "margins_xl": "",\n    "float_xs": "float-right",\n    "float_sm": "",\n    "float_md": "",\n    "float_lg": "",\n    "float_xl": "",\n    "disable_invalid": false,\n    "product": null,\n    "link_type": "NEXT_STEP",\n    "cms_page": null,\n    "section": "",\n    "download_file": null,\n    "ext_url": "",\n    "mail_to": "",\n    "link_target": "",\n    "link_title": "",\n    "icon_font": {\n        "model": "cmsplugin_cascade.iconfont",\n        "pk": 1\n    },\n    "symbol": "right-open",\n    "link_content": "Weiter",\n    "button_type": "btn-success",\n    "button_size": "",\n    "button_options": [],\n    "icon_align": "icon-right",\n    "stretched_link": false\n}	\N
1117	{\n    "hide_plugin": false,\n    "step_title": "Zusammenfassung"\n}	\N
446	{"address_form": "shipping", "render_type": "form", "allow_multiple": "on", "allow_use_primary": "", "headline_legend": "on", "hide_plugin": ""}	\N
447	{"allow_use_primary": "on", "allow_multiple": "on", "address_form": "billing", "render_type": "form", "hide_plugin": "", "headline_legend": "on"}	\N
448	{}	\N
1118	{\n    "hide_plugin": false,\n    "margins_xs": "",\n    "margins_sm": "",\n    "margins_md": "",\n    "margins_lg": "",\n    "margins_xl": "",\n    "element_id": "",\n    "tag_type": "h3",\n    "content": "Zusammenfassung der Bestellung"\n}	\N
451	{"content": "Bezahlen und Versenden", "element_id": "", "tag_type": "h3"}	\N
452	{"render_type": "summary"}	\N
453	{"render_type": "form", "headline_legend": "on", "show_additional_charge": "on", "hide_plugin": ""}	\N
454	{"render_type": "form", "headline_legend": "on", "show_additional_charge": "on", "hide_plugin": ""}	\N
455	{"render_type": "form"}	\N
456	{}	\N
494	{"address_form": "shipping", "render_type": "form", "allow_multiple": "on", "allow_use_primary": "", "headline_legend": "on", "hide_plugin": ""}	\N
495	{"allow_use_primary": "on", "allow_multiple": "on", "address_form": "billing", "render_type": "form", "hide_plugin": "", "headline_legend": "on"}	\N
496	{}	\N
438	{\n    "hide_plugin": false,\n    "step_title": "Kundeninfos"\n}	\N
450	{\n    "hide_plugin": false,\n    "step_title": "Bezahlmethoden"\n}	\N
1119	{\n    "render_type": "static",\n    "hide_plugin": ""\n}	\N
1120	{\n    "open_tag": "if",\n    "condition": "customer.is_registered"\n}	\N
1121	{\n    "render_type": "summary"\n}	\N
472	{\n    "hide_plugin": false,\n    "margins_xs": "",\n    "margins_sm": "",\n    "margins_md": "",\n    "margins_lg": "",\n    "margins_xl": "",\n    "float_xs": "float-right",\n    "float_sm": "",\n    "float_md": "",\n    "float_lg": "",\n    "float_xl": "",\n    "disable_invalid": false,\n    "product": null,\n    "link_type": "PURCHASE_NOW",\n    "cms_page": null,\n    "section": "",\n    "download_file": null,\n    "ext_url": "",\n    "mail_to": "",\n    "link_target": "",\n    "link_title": "",\n    "icon_font": {\n        "model": "cmsplugin_cascade.iconfont",\n        "pk": 1\n    },\n    "symbol": "handshake-o",\n    "link_content": "Jetzt bestellen!",\n    "button_type": "btn-success",\n    "button_size": "btn-lg",\n    "button_options": [],\n    "icon_align": "icon-right",\n    "stretched_link": false\n}	\N
459	{\n    "hide_plugin": false,\n    "margins_xs": "",\n    "margins_sm": "",\n    "margins_md": "",\n    "margins_lg": "",\n    "margins_xl": "",\n    "element_id": "",\n    "tag_type": "h3",\n    "content": "Zusammenfassung der Bestellung"\n}	\N
460	{"render_type": "static", "hide_plugin": ""}	\N
461	{"open_tag": "if", "condition": "customer.is_registered"}	\N
462	{"render_type": "summary"}	\N
463	{"open_tag": "else", "condition": ""}	\N
464	{"render_type": "summary"}	\N
465	{"address_form": "shipping", "render_type": "summary", "allow_multiple": "", "allow_use_primary": "", "headline_legend": "on", "hide_plugin": ""}	\N
466	{"render_type": "summary"}	\N
467	{"render_type": "summary"}	\N
468	{"render_type": "summary"}	\N
471	{}	\N
473	{"open_tag": "else", "condition": ""}	\N
474	{"padding_xs": "py-3", "padding_sm": "", "padding_md": "", "padding_lg": "", "hide_plugin": ""}	\N
475	{"xs-column-width": "col-12", "sm-column-width": "col-sm-4", "md-column-width": "", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720.0, "md": 293.33, "sm": 220.0, "lg": 360.0}}	\N
476	{"hide_plugin": false, "link_type": "RELOAD_PAGE", "cms_page": null, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "form_type": "login"}	\N
477	{"xs-column-width": "col-12", "sm-column-width": "col-sm-4", "md-column-width": "", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720.0, "md": 293.33, "sm": 220.0, "lg": 360.0}}	\N
478	{"hide_plugin": false, "link_type": "RELOAD_PAGE", "cms_page": null, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "form_type": "register-user"}	\N
479	{"xs-column-width": "col-12", "sm-column-width": "col-sm-4", "md-column-width": "", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720.0, "md": 293.33, "sm": 220.0, "lg": 360.0}}	\N
480	{"hide_plugin": false, "link_type": "RELOAD_PAGE", "cms_page": null, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "form_type": "continue-as-guest"}	\N
481	{"breakpoints": ["xs", "sm", "md", "lg", "xl"], "fluid": "", "padding_xs": "py-3", "padding_sm": "", "padding_md": "", "padding_lg": "", "hide_plugin": "", "container_max_widths": {"xs": 750, "md": 970, "sm": 750, "lg": 1170}, "media_queries": {"xs": ["(max-width: 768px)"], "md": ["(min-width: 992px)", "(max-width: 1200px)"], "sm": ["(min-width: 768px)", "(max-width: 992px)"], "lg": ["(min-width: 1200px)"]}}	\N
482	{"open_tag": "if", "condition": "customer.is_recognized"}	\N
483	{"hide_plugin": false, "padding_xs": "py-4", "padding_sm": "", "padding_md": "", "padding_lg": "", "padding_xl": ""}	\N
484	{"xs-column-width": "col", "sm-column-width": "", "md-column-width": "col-md-10", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "offset-md-1", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720.0, "md": 778.33, "sm": 595.0, "lg": 750.0}}	\N
485	{}	\N
486	{"step_title": "Customer"}	\N
487	{"open_tag": "if", "condition": "customer.is_registered"}	\N
488	{"render_type": "form"}	\N
489	{"open_tag": "else", "condition": ""}	\N
490	{"render_type": "form"}	\N
491	{}	\N
492	{"hide_plugin": false, "margins_xs": "", "margins_sm": "", "margins_md": "", "margins_lg": "", "margins_xl": "", "float_xs": "float-right", "float_sm": "", "float_md": "", "float_lg": "", "float_xl": "", "disable_invalid": false, "product": null, "link_type": "NEXT_STEP", "cms_page": null, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "icon_font": {"model": "cmsplugin_cascade.iconfont", "pk": 1}, "symbol": "right-open", "link_content": "Next", "button_type": "btn-success", "button_size": "", "button_options": [], "icon_align": "icon-right", "stretched_link": false}	\N
493	{"hide_plugin": "", "step_title": "Addresses"}	\N
1122	{\n    "open_tag": "else",\n    "condition": ""\n}	\N
1123	{\n    "render_type": "summary"\n}	\N
1124	{\n    "address_form": "shipping",\n    "render_type": "summary",\n    "allow_multiple": "",\n    "allow_use_primary": "",\n    "headline_legend": "on",\n    "hide_plugin": ""\n}	\N
1125	{\n    "render_type": "summary"\n}	\N
1126	{\n    "render_type": "summary"\n}	\N
1127	{\n    "render_type": "summary"\n}	\N
497	{"hide_plugin": false, "margins_xs": "", "margins_sm": "", "margins_md": "", "margins_lg": "", "margins_xl": "", "float_xs": "float-right", "float_sm": "", "float_md": "", "float_lg": "", "float_xl": "", "disable_invalid": false, "product": null, "link_type": "NEXT_STEP", "cms_page": null, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "icon_font": {"model": "cmsplugin_cascade.iconfont", "pk": 1}, "symbol": "right-open", "link_content": "Next", "button_type": "btn-success", "button_size": "", "button_options": [], "icon_align": "icon-right", "stretched_link": false}	\N
498	{"hide_plugin": "", "step_title": "Payment"}	\N
499	{"content": "Bezahlen und Versenden", "element_id": "", "tag_type": "h3"}	\N
500	{"render_type": "summary"}	\N
501	{"render_type": "form", "headline_legend": "on", "show_additional_charge": "on", "hide_plugin": ""}	\N
502	{"render_type": "form", "headline_legend": "on", "show_additional_charge": "on", "hide_plugin": ""}	\N
503	{"render_type": "form"}	\N
504	{}	\N
505	{"hide_plugin": false, "margins_xs": "", "margins_sm": "", "margins_md": "", "margins_lg": "", "margins_xl": "", "float_xs": "float-right", "float_sm": "", "float_md": "", "float_lg": "", "float_xl": "", "disable_invalid": false, "product": null, "link_type": "NEXT_STEP", "cms_page": null, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "icon_font": {"model": "cmsplugin_cascade.iconfont", "pk": 1}, "symbol": "right-open", "link_content": "Next", "button_type": "btn-success", "button_size": "", "button_options": [], "icon_align": "icon-right", "stretched_link": false}	\N
506	{"hide_plugin": "", "step_title": "Summary"}	\N
507	{"content": "Summary of your Order", "element_id": "", "tag_type": "h3", "hide_plugin": "", "extra_inline_styles:Margins": {"margin-right": "", "margin-top": "", "margin-left": "", "margin-bottom": ""}}	\N
508	{"render_type": "static", "hide_plugin": ""}	\N
509	{"open_tag": "if", "condition": "customer.is_registered"}	\N
510	{"render_type": "summary"}	\N
511	{"open_tag": "else", "condition": ""}	\N
512	{"render_type": "summary"}	\N
513	{"address_form": "shipping", "render_type": "summary", "allow_multiple": "", "allow_use_primary": "", "headline_legend": "on", "hide_plugin": ""}	\N
514	{"render_type": "summary"}	\N
515	{"render_type": "summary"}	\N
516	{"render_type": "summary"}	\N
518	{"link_content": "terms and conditions", "link": {"pk": 15, "model": "cms.Page", "type": "cmspage", "section": ""}, "target": "", "title": ""}	\N
519	{}	\N
520	{"hide_plugin": false, "margins_xs": "", "margins_sm": "", "margins_md": "", "margins_lg": "", "margins_xl": "", "float_xs": "float-right", "float_sm": "", "float_md": "", "float_lg": "", "float_xl": "", "disable_invalid": false, "product": null, "link_type": "PURCHASE_NOW", "cms_page": null, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "icon_font": {"model": "cmsplugin_cascade.iconfont", "pk": 1}, "symbol": "handshake-o", "link_content": "Purchase Now", "button_type": "btn-success", "button_size": "btn-lg", "button_options": [], "icon_align": "icon-right", "stretched_link": false}	\N
521	{"open_tag": "else", "condition": ""}	\N
522	{"padding_xs": "py-3", "padding_sm": "", "padding_md": "", "padding_lg": "", "hide_plugin": ""}	\N
523	{"xs-column-width": "col-12", "sm-column-width": "col-sm-4", "md-column-width": "", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720.0, "md": 293.33, "sm": 220.0, "lg": 360.0}}	\N
524	{"hide_plugin": false, "link_type": "RELOAD_PAGE", "cms_page": null, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "form_type": "login"}	\N
525	{"xs-column-width": "col-12", "sm-column-width": "col-sm-4", "md-column-width": "", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720.0, "md": 293.33, "sm": 220.0, "lg": 360.0}}	\N
526	{"hide_plugin": false, "link_type": "RELOAD_PAGE", "cms_page": null, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "form_type": "register-user"}	\N
527	{"xs-column-width": "col-12", "sm-column-width": "col-sm-4", "md-column-width": "", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720.0, "md": 293.33, "sm": 220.0, "lg": 360.0}}	\N
528	{"hide_plugin": false, "link_type": "RELOAD_PAGE", "cms_page": null, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "form_type": "continue-as-guest"}	\N
1129	{\n    "render_template": "cascade/link/text-link.html",\n    "product": null,\n    "link_type": "cmspage",\n    "cms_page": {\n        "model": "cms.page",\n        "pk": 8\n    },\n    "section": "",\n    "download_file": null,\n    "ext_url": "",\n    "mail_to": "",\n    "link_target": "",\n    "link_title": "",\n    "link_content": "AGBs"\n}	\N
1130	{}	\N
1131	{\n    "hide_plugin": false,\n    "margins_xs": "",\n    "margins_sm": "",\n    "margins_md": "",\n    "margins_lg": "",\n    "margins_xl": "",\n    "float_xs": "float-right",\n    "float_sm": "",\n    "float_md": "",\n    "float_lg": "",\n    "float_xl": "",\n    "disable_invalid": false,\n    "product": null,\n    "link_type": "PURCHASE_NOW",\n    "cms_page": null,\n    "section": "",\n    "download_file": null,\n    "ext_url": "",\n    "mail_to": "",\n    "link_target": "",\n    "link_title": "",\n    "icon_font": {\n        "model": "cmsplugin_cascade.iconfont",\n        "pk": 1\n    },\n    "symbol": "handshake-o",\n    "link_content": "Jetzt bestellen!",\n    "button_type": "btn-success",\n    "button_size": "btn-lg",\n    "button_options": [],\n    "icon_align": "icon-right",\n    "stretched_link": false\n}	\N
1132	{\n    "open_tag": "else",\n    "condition": ""\n}	\N
1133	{\n    "padding_xs": "py-3",\n    "padding_sm": "",\n    "padding_md": "",\n    "padding_lg": "",\n    "hide_plugin": ""\n}	\N
1134	{\n    "xs-column-width": "col-12",\n    "sm-column-width": "col-sm-4",\n    "md-column-width": "",\n    "lg-column-width": "",\n    "xl-column-width": "",\n    "xs-column-offset": "",\n    "sm-column-offset": "",\n    "md-column-offset": "",\n    "lg-column-offset": "",\n    "xl-column-offset": "",\n    "xs-column-ordering": "",\n    "sm-column-ordering": "",\n    "md-column-ordering": "",\n    "lg-column-ordering": "",\n    "xl-column-ordering": "",\n    "xs-responsive-utils": "",\n    "sm-responsive-utils": "",\n    "md-responsive-utils": "",\n    "lg-responsive-utils": "",\n    "xl-responsive-utils": "",\n    "hide_plugin": "",\n    "container_max_widths": {\n        "xs": 720.0,\n        "md": 293.33,\n        "sm": 220.0,\n        "lg": 360.0\n    }\n}	\N
1135	{\n    "hide_plugin": false,\n    "link_type": "RELOAD_PAGE",\n    "cms_page": null,\n    "section": "",\n    "download_file": null,\n    "ext_url": "",\n    "mail_to": "",\n    "link_target": "",\n    "link_title": "",\n    "form_type": "login"\n}	\N
1136	{\n    "xs-column-width": "col-12",\n    "sm-column-width": "col-sm-4",\n    "md-column-width": "",\n    "lg-column-width": "",\n    "xl-column-width": "",\n    "xs-column-offset": "",\n    "sm-column-offset": "",\n    "md-column-offset": "",\n    "lg-column-offset": "",\n    "xl-column-offset": "",\n    "xs-column-ordering": "",\n    "sm-column-ordering": "",\n    "md-column-ordering": "",\n    "lg-column-ordering": "",\n    "xl-column-ordering": "",\n    "xs-responsive-utils": "",\n    "sm-responsive-utils": "",\n    "md-responsive-utils": "",\n    "lg-responsive-utils": "",\n    "xl-responsive-utils": "",\n    "hide_plugin": "",\n    "container_max_widths": {\n        "xs": 720.0,\n        "md": 293.33,\n        "sm": 220.0,\n        "lg": 360.0\n    }\n}	\N
1137	{\n    "hide_plugin": false,\n    "link_type": "RELOAD_PAGE",\n    "cms_page": null,\n    "section": "",\n    "download_file": null,\n    "ext_url": "",\n    "mail_to": "",\n    "link_target": "",\n    "link_title": "",\n    "form_type": "register-user"\n}	\N
1138	{\n    "xs-column-width": "col-12",\n    "sm-column-width": "col-sm-4",\n    "md-column-width": "",\n    "lg-column-width": "",\n    "xl-column-width": "",\n    "xs-column-offset": "",\n    "sm-column-offset": "",\n    "md-column-offset": "",\n    "lg-column-offset": "",\n    "xl-column-offset": "",\n    "xs-column-ordering": "",\n    "sm-column-ordering": "",\n    "md-column-ordering": "",\n    "lg-column-ordering": "",\n    "xl-column-ordering": "",\n    "xs-responsive-utils": "",\n    "sm-responsive-utils": "",\n    "md-responsive-utils": "",\n    "lg-responsive-utils": "",\n    "xl-responsive-utils": "",\n    "hide_plugin": "",\n    "container_max_widths": {\n        "xs": 720.0,\n        "md": 293.33,\n        "sm": 220.0,\n        "lg": 360.0\n    }\n}	\N
1139	{\n    "hide_plugin": false,\n    "link_type": "RELOAD_PAGE",\n    "cms_page": null,\n    "section": "",\n    "download_file": null,\n    "ext_url": "",\n    "mail_to": "",\n    "link_target": "",\n    "link_title": "",\n    "form_type": "continue-as-guest"\n}	\N
577	{"breakpoints": ["xs", "sm", "md", "lg", "xl"], "fluid": "", "padding_xs": "py-3", "padding_sm": "", "padding_md": "", "padding_lg": "", "hide_plugin": "", "container_max_widths": {"xs": 750, "md": 970, "sm": 750, "lg": 1170}, "media_queries": {"xs": ["(max-width: 768px)"], "md": ["(min-width: 992px)", "(max-width: 1200px)"], "sm": ["(min-width: 768px)", "(max-width: 992px)"], "lg": ["(min-width: 1200px)"]}}	\N
578	{"open_tag": "if", "condition": "customer.is_recognized"}	\N
579	{"hide_plugin": false, "padding_xs": "py-4", "padding_sm": "", "padding_md": "", "padding_lg": "", "padding_xl": ""}	\N
580	{"xs-column-width": "col", "sm-column-width": "", "md-column-width": "col-md-10", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "offset-md-1", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720.0, "md": 778.33, "sm": 595.0, "lg": 750.0}}	\N
581	{}	\N
582	{"step_title": "Customer"}	\N
583	{"open_tag": "if", "condition": "customer.is_registered"}	\N
584	{"render_type": "form"}	\N
585	{"open_tag": "else", "condition": ""}	\N
586	{"render_type": "form"}	\N
587	{}	\N
588	{"hide_plugin": false, "margins_xs": "", "margins_sm": "", "margins_md": "", "margins_lg": "", "margins_xl": "", "float_xs": "float-right", "float_sm": "", "float_md": "", "float_lg": "", "float_xl": "", "disable_invalid": false, "product": null, "link_type": "NEXT_STEP", "cms_page": null, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "icon_font": {"model": "cmsplugin_cascade.iconfont", "pk": 1}, "symbol": "right-open", "link_content": "Next", "button_type": "btn-success", "button_size": "", "button_options": [], "icon_align": "icon-right", "stretched_link": false}	\N
589	{"hide_plugin": "", "step_title": "Addresses"}	\N
590	{"address_form": "shipping", "render_type": "form", "allow_multiple": "on", "allow_use_primary": "", "headline_legend": "on", "hide_plugin": ""}	\N
591	{"allow_use_primary": "on", "allow_multiple": "on", "address_form": "billing", "render_type": "form", "hide_plugin": "", "headline_legend": "on"}	\N
592	{}	\N
593	{"hide_plugin": false, "margins_xs": "", "margins_sm": "", "margins_md": "", "margins_lg": "", "margins_xl": "", "float_xs": "float-right", "float_sm": "", "float_md": "", "float_lg": "", "float_xl": "", "disable_invalid": false, "product": null, "link_type": "NEXT_STEP", "cms_page": null, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "icon_font": {"model": "cmsplugin_cascade.iconfont", "pk": 1}, "symbol": "right-open", "link_content": "Next", "button_type": "btn-success", "button_size": "", "button_options": [], "icon_align": "icon-right", "stretched_link": false}	\N
594	{"hide_plugin": "", "step_title": "Payment"}	\N
595	{"content": "Bezahlen und Versenden", "element_id": "", "tag_type": "h3"}	\N
596	{"render_type": "summary"}	\N
597	{"render_type": "form", "headline_legend": "on", "show_additional_charge": "on", "hide_plugin": ""}	\N
598	{"render_type": "form", "headline_legend": "on", "show_additional_charge": "on", "hide_plugin": ""}	\N
599	{"render_type": "form"}	\N
600	{}	\N
601	{"hide_plugin": false, "margins_xs": "", "margins_sm": "", "margins_md": "", "margins_lg": "", "margins_xl": "", "float_xs": "float-right", "float_sm": "", "float_md": "", "float_lg": "", "float_xl": "", "disable_invalid": false, "product": null, "link_type": "NEXT_STEP", "cms_page": null, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "icon_font": {"model": "cmsplugin_cascade.iconfont", "pk": 1}, "symbol": "right-open", "link_content": "Next", "button_type": "btn-success", "button_size": "", "button_options": [], "icon_align": "icon-right", "stretched_link": false}	\N
602	{"hide_plugin": "", "step_title": "Summary"}	\N
603	{"content": "Summary of your Order", "element_id": "", "tag_type": "h3", "hide_plugin": "", "extra_inline_styles:Margins": {"margin-right": "", "margin-top": "", "margin-left": "", "margin-bottom": ""}}	\N
604	{"render_type": "static", "hide_plugin": ""}	\N
605	{"open_tag": "if", "condition": "customer.is_registered"}	\N
606	{"render_type": "summary"}	\N
607	{"open_tag": "else", "condition": ""}	\N
608	{"render_type": "summary"}	\N
609	{"address_form": "shipping", "render_type": "summary", "allow_multiple": "", "allow_use_primary": "", "headline_legend": "on", "hide_plugin": ""}	\N
610	{"render_type": "summary"}	\N
611	{"render_type": "summary"}	\N
612	{"render_type": "summary"}	\N
614	{"link_content": "terms and conditions", "link": {"pk": 15, "model": "cms.Page", "type": "cmspage", "section": ""}, "target": "", "title": ""}	\N
615	{}	\N
616	{"hide_plugin": false, "margins_xs": "", "margins_sm": "", "margins_md": "", "margins_lg": "", "margins_xl": "", "float_xs": "float-right", "float_sm": "", "float_md": "", "float_lg": "", "float_xl": "", "disable_invalid": false, "product": null, "link_type": "PURCHASE_NOW", "cms_page": null, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "icon_font": {"model": "cmsplugin_cascade.iconfont", "pk": 1}, "symbol": "handshake-o", "link_content": "Purchase Now", "button_type": "btn-success", "button_size": "btn-lg", "button_options": [], "icon_align": "icon-right", "stretched_link": false}	\N
617	{"open_tag": "else", "condition": ""}	\N
618	{"padding_xs": "py-3", "padding_sm": "", "padding_md": "", "padding_lg": "", "hide_plugin": ""}	\N
619	{"xs-column-width": "col-12", "sm-column-width": "col-sm-4", "md-column-width": "", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720.0, "md": 293.33, "sm": 220.0, "lg": 360.0}}	\N
620	{"hide_plugin": false, "link_type": "RELOAD_PAGE", "cms_page": null, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "form_type": "login"}	\N
1140	{\n    "render_type": "default"\n}	\N
621	{"xs-column-width": "col-12", "sm-column-width": "col-sm-4", "md-column-width": "", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720.0, "md": 293.33, "sm": 220.0, "lg": 360.0}}	\N
622	{"hide_plugin": false, "link_type": "RELOAD_PAGE", "cms_page": null, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "form_type": "register-user"}	\N
623	{"xs-column-width": "col-12", "sm-column-width": "col-sm-4", "md-column-width": "", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720.0, "md": 293.33, "sm": 220.0, "lg": 360.0}}	\N
624	{"hide_plugin": false, "link_type": "RELOAD_PAGE", "cms_page": null, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "form_type": "continue-as-guest"}	\N
896	{"xs-column-width": "col", "sm-column-width": "", "md-column-width": "col-md-10", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "offset-md-1", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720.0, "md": 940.0, "sm": 720.0, "lg": 1140.0}}	\N
897	{"content": "Your Wishes", "element_id": "", "tag_type": "h2"}	\N
898	{"render_type": "watch"}	\N
1141	{\n    "breakpoints": [\n        "xs",\n        "sm",\n        "md",\n        "lg",\n        "xl"\n    ],\n    "fluid": "",\n    "hide_plugin": "",\n    "container_max_widths": {\n        "xs": 750,\n        "md": 970,\n        "sm": 750,\n        "lg": 1170\n    },\n    "media_queries": {\n        "xs": [\n            "(max-width: 768px)"\n        ],\n        "md": [\n            "(min-width: 992px)",\n            "(max-width: 1200px)"\n        ],\n        "sm": [\n            "(min-width: 768px)",\n            "(max-width: 992px)"\n        ],\n        "lg": [\n            "(min-width: 1200px)"\n        ]\n    }\n}	\N
1142	{\n    "extra_css_classes": [],\n    "extra_inline_styles:Margins": {\n        "margin-top": "",\n        "margin-bottom": ""\n    },\n    "hide_plugin": ""\n}	\N
1143	{\n    "xs-column-width": "col",\n    "sm-column-width": "",\n    "md-column-width": "col-md-10",\n    "lg-column-width": "",\n    "xl-column-width": "",\n    "xs-column-offset": "",\n    "sm-column-offset": "",\n    "md-column-offset": "offset-md-1",\n    "lg-column-offset": "",\n    "xl-column-offset": "",\n    "xs-column-ordering": "",\n    "sm-column-ordering": "",\n    "md-column-ordering": "",\n    "lg-column-ordering": "",\n    "xl-column-ordering": "",\n    "xs-responsive-utils": "",\n    "sm-responsive-utils": "",\n    "md-responsive-utils": "",\n    "lg-responsive-utils": "",\n    "xl-responsive-utils": "",\n    "hide_plugin": "",\n    "container_max_widths": {\n        "xs": 720,\n        "md": 940,\n        "sm": 720,\n        "lg": 1140\n    }\n}	\N
1144	{\n    "open_tag": "if",\n    "condition": "is_last_order"\n}	\N
1145	{\n    "hide_plugin": false,\n    "margins_xs": "",\n    "margins_sm": "",\n    "margins_md": "",\n    "margins_lg": "",\n    "margins_xl": "",\n    "element_id": "",\n    "tag_type": "h2",\n    "content": "Danke für Ihre Bestellung"\n}	\N
1146	{\n    "hide_plugin": ""\n}	\N
1147	{\n    "padding_xs": "",\n    "padding_sm": "",\n    "padding_md": "",\n    "padding_lg": "",\n    "hide_plugin": ""\n}	\N
1148	{\n    "header": "",\n    "body_padding": "on",\n    "footer": "",\n    "background_and_color": "",\n    "margins_xs": "",\n    "margins_sm": "",\n    "margins_md": "",\n    "margins_lg": "",\n    "hide_plugin": ""\n}	\N
1149	{\n    "hide_plugin": ""\n}	\N
1150	{\n    "hide_plugin": false,\n    "margins_xs": "",\n    "margins_sm": "",\n    "margins_md": "",\n    "margins_lg": "",\n    "margins_xl": "",\n    "element_id": "",\n    "tag_type": "h5",\n    "content": "Anmerkungen zu Bestellung"\n}	\N
632	{\n    "hide_plugin": false,\n    "extra_css_classes": "nav-link",\n    "product": null,\n    "link_type": "email",\n    "cms_page": null,\n    "section": "",\n    "download_file": null,\n    "ext_url": "",\n    "mail_to": "info@weltladen-baden.at",\n    "link_target": "",\n    "link_title": "",\n    "icon_font": {\n        "model": "cmsplugin_cascade.iconfont",\n        "pk": 1\n    },\n    "symbol": "mail"\n}	\N
1151	{\n    "hide_plugin": ""\n}	\N
1152	{\n    "hide_plugin": false,\n    "show_history": true,\n    "icon_font": {\n        "model": "cmsplugin_cascade.iconfont",\n        "pk": 1\n    },\n    "symbol": "plus-squared-alt",\n    "link_content": "Add annotation",\n    "button_type": "btn-primary",\n    "button_size": "btn-sm",\n    "button_options": [],\n    "icon_align": "icon-right",\n    "stretched_link": false\n}	\N
1153	{\n    "padding_xs": "",\n    "padding_sm": "",\n    "padding_md": "",\n    "padding_lg": "",\n    "hide_plugin": ""\n}	\N
1154	{\n    "hide_plugin": false,\n    "margins_xs": "",\n    "margins_sm": "",\n    "margins_md": "",\n    "margins_lg": "",\n    "margins_xl": "",\n    "float_xs": "float-left",\n    "float_sm": "",\n    "float_md": "",\n    "float_lg": "",\n    "float_xl": "",\n    "icon_font": {\n        "model": "cmsplugin_cascade.iconfont",\n        "pk": 1\n    },\n    "symbol": "cart-arrow-down",\n    "link_content": "Erneut bestellen",\n    "button_type": "btn-success",\n    "button_size": "",\n    "button_options": [],\n    "icon_align": "icon-right",\n    "stretched_link": false\n}	\N
1155	{\n    "hide_plugin": false,\n    "margins_xs": "",\n    "margins_sm": "",\n    "margins_md": "",\n    "margins_lg": "",\n    "margins_xl": "",\n    "float_xs": "float-right",\n    "float_sm": "",\n    "float_md": "",\n    "float_lg": "",\n    "float_xl": "",\n    "icon_font": {\n        "model": "cmsplugin_cascade.iconfont",\n        "pk": 1\n    },\n    "symbol": "cancel-circled",\n    "link_content": "Bestellung abbrechen",\n    "button_type": "btn-outline-warning",\n    "button_size": "",\n    "button_options": [],\n    "icon_align": "icon-right",\n    "stretched_link": false\n}	\N
646	{\n    "hide_plugin": false,\n    "extra_css_classes": "nav-link",\n    "product": null,\n    "link_type": "email",\n    "cms_page": null,\n    "section": "",\n    "download_file": null,\n    "ext_url": "",\n    "mail_to": "info@weltladen-baden.at",\n    "link_target": "",\n    "link_title": "",\n    "icon_font": {\n        "model": "cmsplugin_cascade.iconfont",\n        "pk": 1\n    },\n    "symbol": "mail"\n}	\N
899	{"render_type": "soft-root"}	\N
900	{"breakpoints": ["xs", "sm", "md", "lg", "xl"], "fluid": "", "hide_plugin": "", "container_max_widths": {"xs": 750, "md": 970, "sm": 750, "lg": 1170}, "media_queries": {"xs": ["(max-width: 768px)"], "md": ["(min-width: 992px)", "(max-width: 1200px)"], "sm": ["(min-width: 768px)", "(max-width: 992px)"], "lg": ["(min-width: 1200px)"]}}	\N
901	{}	\N
902	{"xs-column-width": "col", "sm-column-width": "", "md-column-width": "", "lg-column-width": "", "xl-column-width": "", "xs-column-offset": "", "sm-column-offset": "", "md-column-offset": "", "lg-column-offset": "", "xl-column-offset": "", "xs-column-ordering": "", "sm-column-ordering": "", "md-column-ordering": "", "lg-column-ordering": "", "xl-column-ordering": "", "xs-responsive-utils": "", "sm-responsive-utils": "", "md-responsive-utils": "", "lg-responsive-utils": "", "xl-responsive-utils": "", "hide_plugin": "", "container_max_widths": {"xs": 720.0, "md": 778.33, "sm": 720.0, "lg": 945.0}}	\N
903	{"content": "Your Shopping Cart", "element_id": "", "tag_type": "h2"}	\N
904	{"render_type": "editable", "hide_plugin": ""}	\N
905	{"padding_xs": "pt-3", "padding_sm": "", "padding_md": "pt-md-0", "padding_lg": "", "hide_plugin": ""}	\N
906	{"heading_size": "", "panel_type": "panel-success", "heading": "Suggested Articles", "hide_plugin": "", "footer": ""}	\N
907	{"hide_plugin": ""}	\N
908	{"tag_type": "h4", "content": "This could be interesting for you", "margins_xs": "", "margins_sm": "", "margins_md": "", "margins_lg": "", "element_id": "", "hide_plugin": ""}	\N
909	{"hide_plugin": ""}	\N
911	{"hide_plugin": false, "float_xs": "", "float_sm": "", "float_md": "", "float_lg": "", "float_xl": "", "render_template": "shop/button.html", "product": null, "link_type": "cmspage", "cms_page": {"model": "cms.page", "pk": 16}, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "icon_font": {"model": "cmsplugin_cascade.iconfont", "pk": 1}, "symbol": "shopping-bag", "link_content": "Continue Shopping", "button_type": "btn-primary", "button_size": "", "button_options": [], "icon_align": "icon-right", "stretched_link": false}	\N
912	{"padding_xs": "pt-3", "padding_sm": "", "padding_md": "", "padding_lg": "", "hide_plugin": ""}	\N
913	{"hide_plugin": false, "float_xs": "", "float_sm": "", "float_md": "", "float_lg": "", "float_xl": "", "render_template": "shop/button.html", "product": null, "link_type": "cmspage", "cms_page": {"model": "cms.page", "pk": 40}, "section": "", "download_file": null, "ext_url": "", "mail_to": "", "link_target": "", "link_title": "", "icon_font": {"model": "cmsplugin_cascade.iconfont", "pk": 1}, "symbol": "logout", "link_content": "Proceed to Checkout", "button_type": "btn-success", "button_size": "btn-lg", "button_options": ["btn-block"], "icon_align": "icon-right", "stretched_link": false}	\N
1156	{\n    "hide_plugin": false\n}	\N
914	{\n    "hide_plugin": false,\n    "breakpoints": [\n        "xs",\n        "sm",\n        "md",\n        "lg",\n        "xl"\n    ],\n    "fluid": false\n}	\N
1157	{\n    "hide_plugin": false,\n    "padding_xs": "",\n    "padding_sm": "",\n    "padding_md": "",\n    "padding_lg": "",\n    "padding_xl": ""\n}	\N
1158	{\n    "xs-column-width": "col"\n}	\N
681	{\n    "render_type": "default"\n}	\N
682	{\n    "media_queries": {\n        "xs": [\n            "(max-width: 768px)"\n        ],\n        "md": [\n            "(min-width: 992px)",\n            "(max-width: 1200px)"\n        ],\n        "sm": [\n            "(min-width: 768px)",\n            "(max-width: 992px)"\n        ],\n        "lg": [\n            "(min-width: 1200px)"\n        ]\n    },\n    "container_max_widths": {\n        "xs": 750,\n        "md": 970,\n        "sm": 750,\n        "lg": 1170\n    },\n    "breakpoints": [\n        "xs",\n        "sm",\n        "md",\n        "lg"\n    ],\n    "hide_plugin": "",\n    "fluid": ""\n}	\N
683	{\n    "extra_css_classes": [],\n    "hide_plugin": "",\n    "extra_inline_styles:Margins": {\n        "margin-top": "",\n        "margin-bottom": ""\n    }\n}	\N
684	{\n    "xs-column-width": "col",\n    "sm-column-width": "col-sm-10",\n    "md-column-width": "col-md-8",\n    "lg-column-width": "",\n    "xs-column-offset": "",\n    "sm-column-offset": "offset-sm-1",\n    "md-column-offset": "offset-md-2",\n    "lg-column-offset": "",\n    "xs-column-ordering": "",\n    "sm-column-ordering": "",\n    "md-column-ordering": "",\n    "lg-column-ordering": "",\n    "xs-responsive-utils": "",\n    "sm-responsive-utils": "",\n    "md-responsive-utils": "",\n    "lg-responsive-utils": "",\n    "hide_plugin": "",\n    "container_max_widths": {\n        "xs": 720.0,\n        "md": 616.67,\n        "sm": 595.0,\n        "lg": 750.0\n    }\n}	\N
685	{\n    "hide_plugin": false,\n    "link_type": "cmspage",\n    "cms_page": {\n        "model": "cms.page",\n        "pk": 26\n    },\n    "section": "",\n    "download_file": null,\n    "ext_url": "",\n    "mail_to": "",\n    "link_target": "",\n    "link_title": "",\n    "form_type": "register-user"\n}	\N
686	{\n    "render_type": "default"\n}	\N
687	{\n    "media_queries": {\n        "xs": [\n            "(max-width: 768px)"\n        ],\n        "md": [\n            "(min-width: 992px)",\n            "(max-width: 1200px)"\n        ],\n        "sm": [\n            "(min-width: 768px)",\n            "(max-width: 992px)"\n        ],\n        "lg": [\n            "(min-width: 1200px)"\n        ]\n    },\n    "container_max_widths": {\n        "xs": 750,\n        "md": 970,\n        "sm": 750,\n        "lg": 1170\n    },\n    "breakpoints": [\n        "xs",\n        "sm",\n        "md",\n        "lg"\n    ],\n    "hide_plugin": "",\n    "fluid": ""\n}	\N
688	{\n    "extra_css_classes": [],\n    "hide_plugin": "",\n    "extra_inline_styles:Margins": {\n        "margin-top": "",\n        "margin-bottom": ""\n    }\n}	\N
689	{\n    "xs-column-width": "col",\n    "sm-column-width": "col-sm-10",\n    "md-column-width": "col-md-8",\n    "lg-column-width": "",\n    "xs-column-offset": "",\n    "sm-column-offset": "offset-sm-1",\n    "md-column-offset": "offset-md-2",\n    "lg-column-offset": "",\n    "xs-column-ordering": "",\n    "sm-column-ordering": "",\n    "md-column-ordering": "",\n    "lg-column-ordering": "",\n    "xs-responsive-utils": "",\n    "sm-responsive-utils": "",\n    "md-responsive-utils": "",\n    "lg-responsive-utils": "",\n    "hide_plugin": "",\n    "container_max_widths": {\n        "xs": 720.0,\n        "md": 616.67,\n        "sm": 595.0,\n        "lg": 750.0\n    }\n}	\N
690	{\n    "hide_plugin": false,\n    "link_type": "DO_NOTHING",\n    "cms_page": null,\n    "section": "",\n    "download_file": null,\n    "ext_url": "",\n    "mail_to": "",\n    "link_target": "",\n    "link_title": "",\n    "form_type": "password-reset-request"\n}	\N
707	{\n    "render_type": "default"\n}	\N
708	{\n    "breakpoints": [\n        "xs",\n        "sm",\n        "md",\n        "lg",\n        "xl"\n    ],\n    "fluid": "",\n    "hide_plugin": "",\n    "container_max_widths": {\n        "xs": 750,\n        "md": 970,\n        "sm": 750,\n        "lg": 1170\n    },\n    "media_queries": {\n        "xs": [\n            "(max-width: 768px)"\n        ],\n        "md": [\n            "(min-width: 992px)",\n            "(max-width: 1200px)"\n        ],\n        "sm": [\n            "(min-width: 768px)",\n            "(max-width: 992px)"\n        ],\n        "lg": [\n            "(min-width: 1200px)"\n        ]\n    }\n}	\N
709	{\n    "extra_css_classes": [],\n    "extra_inline_styles:Paddings": {\n        "padding-right": "",\n        "padding-left": ""\n    },\n    "extra_inline_styles:Margins": {\n        "margin-top": "",\n        "margin-bottom": ""\n    }\n}	\N
710	{\n    "xs-column-width": "col-12",\n    "sm-column-width": "col-sm-10",\n    "md-column-width": "col-md-8",\n    "lg-column-width": "",\n    "xl-column-width": "",\n    "xs-column-offset": "",\n    "sm-column-offset": "offset-sm-1",\n    "md-column-offset": "offset-md-2",\n    "lg-column-offset": "",\n    "xl-column-offset": "",\n    "xs-column-ordering": "",\n    "sm-column-ordering": "",\n    "md-column-ordering": "",\n    "lg-column-ordering": "",\n    "xl-column-ordering": "",\n    "xs-responsive-utils": "",\n    "sm-responsive-utils": "",\n    "md-responsive-utils": "",\n    "lg-responsive-utils": "",\n    "xl-responsive-utils": "",\n    "hide_plugin": "",\n    "container_max_widths": {\n        "xs": 720.0,\n        "md": 616.67,\n        "sm": 595.0,\n        "lg": 750.0\n    }\n}	\N
711	{}	\N
712	{\n    "open_tag": "if",\n    "condition": "customer.is_registered"\n}	\N
713	{\n    "render_type": "form"\n}	\N
714	{\n    "open_tag": "elif",\n    "condition": "customer.is_guest"\n}	\N
715	{\n    "render_type": "form"\n}	\N
716	{\n    "open_tag": "else",\n    "condition": ""\n}	\N
717	{\n    "content": "Sie müssen angemeldet sein, um Ihre Details ändern zu können",\n    "element_id": "",\n    "tag_type": "h3"\n}	\N
718	{\n    "hide_plugin": false,\n    "margins_xs": "",\n    "margins_sm": "",\n    "margins_md": "",\n    "margins_lg": "",\n    "margins_xl": "",\n    "float_xs": "",\n    "float_sm": "",\n    "float_md": "",\n    "float_lg": "",\n    "float_xl": "",\n    "disable_invalid": false,\n    "product": null,\n    "link_type": "cmspage",\n    "cms_page": {\n        "model": "cms.page",\n        "pk": 2\n    },\n    "section": "",\n    "download_file": null,\n    "ext_url": "",\n    "mail_to": "",\n    "link_target": "",\n    "link_title": "",\n    "icon_font": null,\n    "symbol": "right-open",\n    "link_content": "Change Your Details",\n    "button_type": "btn-success",\n    "button_size": "",\n    "button_options": [],\n    "icon_align": "icon-right",\n    "stretched_link": false\n}	\N
719	{\n    "render_type": "default"\n}	\N
720	{\n    "breakpoints": [\n        "xs",\n        "sm",\n        "md",\n        "lg",\n        "xl"\n    ],\n    "fluid": null\n}	\N
721	{}	\N
722	{\n    "xs-column-width": "col-12",\n    "sm-column-width": "",\n    "md-column-width": "col-md-10",\n    "lg-column-width": "",\n    "xl-column-width": "",\n    "xs-column-offset": "",\n    "sm-column-offset": "",\n    "md-column-offset": "offset-md-1",\n    "lg-column-offset": "",\n    "xl-column-offset": "",\n    "xs-column-ordering": "",\n    "sm-column-ordering": "",\n    "md-column-ordering": "",\n    "lg-column-ordering": "",\n    "xl-column-ordering": "",\n    "xs-responsive-utils": "",\n    "sm-responsive-utils": "",\n    "md-responsive-utils": "",\n    "lg-responsive-utils": "",\n    "xl-responsive-utils": "",\n    "hide_plugin": ""\n}	\N
723	{\n    "hide_plugin": false,\n    "link_type": "RELOAD_PAGE",\n    "cms_page": null,\n    "section": "",\n    "download_file": null,\n    "ext_url": "",\n    "mail_to": "",\n    "link_target": "",\n    "link_title": "",\n    "form_type": "password-change"\n}	\N
724	{\n    "hide_plugin": false,\n    "breakpoints": [\n        "xs",\n        "sm",\n        "md",\n        "lg",\n        "xl"\n    ],\n    "fluid": false\n}	\N
725	{\n    "hide_plugin": false,\n    "padding_xs": "",\n    "padding_sm": "",\n    "padding_md": "",\n    "padding_lg": "",\n    "padding_xl": ""\n}	\N
726	{\n    "xs-column-width": "col"\n}	\N
727	{\n    "hide_plugin": false,\n    "margins_xs": "",\n    "margins_sm": "",\n    "margins_md": "",\n    "margins_lg": "",\n    "margins_xl": "",\n    "element_id": "",\n    "tag_type": "h1",\n    "content": "Datenschutzerklärung"\n}	\N
729	{\n    "hide_plugin": false,\n    "breakpoints": [\n        "xs",\n        "sm",\n        "md",\n        "lg",\n        "xl"\n    ],\n    "fluid": false\n}	\N
730	{\n    "hide_plugin": false,\n    "padding_xs": "",\n    "padding_sm": "",\n    "padding_md": "",\n    "padding_lg": "",\n    "padding_xl": ""\n}	\N
731	{\n    "xs-column-width": "col"\n}	\N
732	{\n    "hide_plugin": false,\n    "margins_xs": "",\n    "margins_sm": "",\n    "margins_md": "",\n    "margins_lg": "",\n    "margins_xl": "",\n    "element_id": "",\n    "tag_type": "h1",\n    "content": "Datenschutzerklärung"\n}	\N
734	{\n    "hide_plugin": false,\n    "breakpoints": [\n        "xs",\n        "sm",\n        "md",\n        "lg",\n        "xl"\n    ],\n    "fluid": false\n}	\N
735	{\n    "hide_plugin": false,\n    "padding_xs": "",\n    "padding_sm": "",\n    "padding_md": "",\n    "padding_lg": "",\n    "padding_xl": ""\n}	\N
736	{\n    "xs-column-width": "col"\n}	\N
915	{\n    "hide_plugin": false,\n    "padding_xs": "",\n    "padding_sm": "",\n    "padding_md": "",\n    "padding_lg": "",\n    "padding_xl": ""\n}	\N
737	{\n    "hide_plugin": false,\n    "margins_xs": "",\n    "margins_sm": "",\n    "margins_md": "",\n    "margins_lg": "",\n    "margins_xl": "",\n    "element_id": "",\n    "tag_type": "h1",\n    "content": "Impressum"\n}	\N
916	{\n    "xs-column-width": "col"\n}	\N
444	{\n    "hide_plugin": false,\n    "margins_xs": "",\n    "margins_sm": "",\n    "margins_md": "",\n    "margins_lg": "",\n    "margins_xl": "",\n    "float_xs": "float-right",\n    "float_sm": "",\n    "float_md": "",\n    "float_lg": "",\n    "float_xl": "",\n    "disable_invalid": false,\n    "product": null,\n    "link_type": "NEXT_STEP",\n    "cms_page": null,\n    "section": "",\n    "download_file": null,\n    "ext_url": "",\n    "mail_to": "",\n    "link_target": "",\n    "link_title": "",\n    "icon_font": {\n        "model": "cmsplugin_cascade.iconfont",\n        "pk": 1\n    },\n    "symbol": "right-open",\n    "link_content": "Weiter",\n    "button_type": "btn-success",\n    "button_size": "",\n    "button_options": [],\n    "icon_align": "icon-right",\n    "stretched_link": false\n}	\N
744	{\n    "hide_plugin": false,\n    "breakpoints": [\n        "xs",\n        "sm",\n        "md",\n        "lg",\n        "xl"\n    ],\n    "fluid": false\n}	\N
745	{\n    "hide_plugin": false,\n    "padding_xs": "",\n    "padding_sm": "",\n    "padding_md": "",\n    "padding_lg": "",\n    "padding_xl": ""\n}	\N
746	{\n    "xs-column-width": "col"\n}	\N
747	{\n    "hide_plugin": false,\n    "margins_xs": "",\n    "margins_sm": "",\n    "margins_md": "",\n    "margins_lg": "",\n    "margins_xl": "",\n    "element_id": "",\n    "tag_type": "h1",\n    "content": "Impressum"\n}	\N
749	{\n    "hide_plugin": false,\n    "render_template": "cascade/bootstrap4/secmenu-unstyled-list.html",\n    "page_id": "id-contact",\n    "offset": 0,\n    "limit": 100\n}	\N
457	{\n    "hide_plugin": false,\n    "margins_xs": "",\n    "margins_sm": "",\n    "margins_md": "",\n    "margins_lg": "",\n    "margins_xl": "",\n    "float_xs": "float-right",\n    "float_sm": "",\n    "float_md": "",\n    "float_lg": "",\n    "float_xl": "",\n    "disable_invalid": false,\n    "product": null,\n    "link_type": "NEXT_STEP",\n    "cms_page": null,\n    "section": "",\n    "download_file": null,\n    "ext_url": "",\n    "mail_to": "",\n    "link_target": "",\n    "link_title": "",\n    "icon_font": {\n        "model": "cmsplugin_cascade.iconfont",\n        "pk": 1\n    },\n    "symbol": "right-open",\n    "link_content": "Weiter",\n    "button_type": "btn-success",\n    "button_size": "",\n    "button_options": [],\n    "icon_align": "icon-right",\n    "stretched_link": false\n}	\N
1159	{\n    "breakpoints": [\n        "xs",\n        "sm",\n        "md",\n        "lg",\n        "xl"\n    ],\n    "fluid": "",\n    "background_and_color": "",\n    "hide_plugin": ""\n}	\N
1160	{\n    "hide_plugin": false,\n    "padding_xs": "",\n    "padding_sm": "",\n    "padding_md": "",\n    "padding_lg": "",\n    "padding_xl": ""\n}	\N
1161	{\n    "xs-column-width": "col"\n}	\N
1163	{\n    "hide_plugin": false,\n    "fluid": true,\n    "background_color": [\n        "#fdfcff",\n        false\n    ],\n    "element_heights": {\n        "xs": "300px",\n        "sm": "300px",\n        "md": "300px",\n        "lg": "300px",\n        "xl": "300px"\n    },\n    "image_file": {\n        "model": "filer.image",\n        "pk": 201\n    },\n    "background_repeat": "no-repeat",\n    "background_attachment": "local",\n    "background_vertical_position": "center",\n    "background_horizontal_position": "40%",\n    "background_size": "auto",\n    "background_width_height": {},\n    "media_queries": {\n        "xs": {\n            "width": 576,\n            "media": "(max-width: 575.98px)"\n        },\n        "sm": {\n            "width": 768,\n            "media": "(min-width: 576px) and (max-width: 767.98px)"\n        },\n        "md": {\n            "width": 992,\n            "media": "(min-width: 768px) and (max-width: 991.98px)"\n        },\n        "lg": {\n            "width": 1200,\n            "media": "(min-width: 992px) and (max-width: 1199.98px)"\n        },\n        "xl": {\n            "width": 1980,\n            "media": "(min-width: 1200px)"\n        }\n    }\n}	\N
1164	{\n    "hide_plugin": false,\n    "padding_xs": "",\n    "padding_sm": "",\n    "padding_md": "",\n    "padding_lg": "",\n    "padding_xl": ""\n}	\N
1165	{\n    "xs-column-width": "col"\n}	\N
1166	{\n    "hide_plugin": false\n}	\N
918	{\n    "hide_plugin": false,\n    "margins_xs": "",\n    "margins_sm": "",\n    "margins_md": "",\n    "margins_lg": "",\n    "margins_xl": "",\n    "element_id": "",\n    "tag_type": "h1",\n    "content": "AGBs"\n}	\N
767	{\n    "hide_plugin": false,\n    "breakpoints": [\n        "xs",\n        "sm",\n        "md",\n        "lg",\n        "xl"\n    ],\n    "fluid": false\n}	\N
768	{\n    "hide_plugin": false,\n    "padding_xs": "",\n    "padding_sm": "",\n    "padding_md": "",\n    "padding_lg": "",\n    "padding_xl": ""\n}	\N
769	{\n    "xs-column-width": "col"\n}	\N
770	{\n    "hide_plugin": false,\n    "margins_xs": "",\n    "margins_sm": "",\n    "margins_md": "",\n    "margins_lg": "",\n    "margins_xl": "",\n    "element_id": "",\n    "tag_type": "h1",\n    "content": "Kontakt"\n}	\N
771	{\n    "hide_plugin": false,\n    "render_template": "cascade/plugins/leaflet.html",\n    "map_width": "100%",\n    "map_height": "400px",\n    "map_position": {\n        "lat": 48.007733152581444,\n        "lng": 16.235046386718754,\n        "zoom": 17\n    },\n    "map_min_height": "",\n    "scroll_wheel_zoom": true\n}	\N
988	{\n    "render_template": "cascade/link/text-link.html",\n    "product": null,\n    "link_type": "cmspage",\n    "cms_page": {\n        "model": "cms.page",\n        "pk": 10\n    },\n    "section": "",\n    "download_file": null,\n    "ext_url": "",\n    "mail_to": "",\n    "link_target": "",\n    "link_title": "",\n    "link_content": "Datenschutzvereinbarung"\n}	\N
449	{\n    "hide_plugin": false,\n    "margins_xs": "",\n    "margins_sm": "",\n    "margins_md": "",\n    "margins_lg": "",\n    "margins_xl": "",\n    "float_xs": "float-right",\n    "float_sm": "",\n    "float_md": "",\n    "float_lg": "",\n    "float_xl": "",\n    "disable_invalid": false,\n    "product": null,\n    "link_type": "NEXT_STEP",\n    "cms_page": null,\n    "section": "",\n    "download_file": null,\n    "ext_url": "",\n    "mail_to": "",\n    "link_target": "",\n    "link_title": "",\n    "icon_font": {\n        "model": "cmsplugin_cascade.iconfont",\n        "pk": 1\n    },\n    "symbol": "right-open",\n    "link_content": "Weiter",\n    "button_type": "btn-success",\n    "button_size": "",\n    "button_options": [],\n    "icon_align": "icon-right",\n    "stretched_link": false\n}	\N
785	{\n    "hide_plugin": false,\n    "breakpoints": [\n        "xs",\n        "sm",\n        "md",\n        "lg",\n        "xl"\n    ],\n    "fluid": false\n}	\N
786	{\n    "hide_plugin": false,\n    "padding_xs": "",\n    "padding_sm": "",\n    "padding_md": "",\n    "padding_lg": "",\n    "padding_xl": ""\n}	\N
787	{\n    "xs-column-width": "col"\n}	\N
788	{\n    "hide_plugin": false,\n    "margins_xs": "",\n    "margins_sm": "",\n    "margins_md": "",\n    "margins_lg": "",\n    "margins_xl": "",\n    "element_id": "",\n    "tag_type": "h1",\n    "content": "Kontakt"\n}	\N
789	{\n    "hide_plugin": false,\n    "render_template": "cascade/plugins/leaflet.html",\n    "map_width": "100%",\n    "map_height": "400px",\n    "map_position": {\n        "lat": 48.007733152581444,\n        "lng": 16.235046386718754,\n        "zoom": 17\n    },\n    "map_min_height": "",\n    "scroll_wheel_zoom": true\n}	\N
799	{\n    "breakpoints": [\n        "xs",\n        "sm",\n        "md",\n        "lg",\n        "xl"\n    ],\n    "fluid": "",\n    "background_and_color": "",\n    "hide_plugin": "",\n    "container_max_widths": {\n        "xs": 750,\n        "md": 970,\n        "sm": 750,\n        "lg": 1170\n    },\n    "media_queries": {\n        "xs": [\n            "(max-width: 768px)"\n        ],\n        "md": [\n            "(min-width: 992px)",\n            "(max-width: 1200px)"\n        ],\n        "sm": [\n            "(min-width: 768px)",\n            "(max-width: 992px)"\n        ],\n        "lg": [\n            "(min-width: 1200px)"\n        ]\n    }\n}	\N
800	{\n    "margins_xs": "",\n    "margins_sm": "",\n    "margins_md": "",\n    "margins_lg": "",\n    "hide_plugin": ""\n}	\N
801	{\n    "xs-column-width": "col-12",\n    "sm-column-width": "",\n    "md-column-width": "col-md",\n    "lg-column-width": "",\n    "xl-column-width": "",\n    "xs-column-offset": "",\n    "sm-column-offset": "",\n    "md-column-offset": "",\n    "lg-column-offset": "",\n    "xl-column-offset": "",\n    "xs-column-ordering": "",\n    "sm-column-ordering": "",\n    "md-column-ordering": "",\n    "lg-column-ordering": "",\n    "xl-column-ordering": "",\n    "xs-responsive-utils": "",\n    "sm-responsive-utils": "",\n    "md-responsive-utils": "",\n    "lg-responsive-utils": "",\n    "xl-responsive-utils": "",\n    "hide_plugin": "",\n    "container_max_widths": {\n        "xs": 157.5,\n        "md": 212.5,\n        "sm": 157.5,\n        "lg": 262.5\n    }\n}	\N
802	{\n    "hide_plugin": false,\n    "margins_xs": "",\n    "margins_sm": "",\n    "margins_md": "",\n    "margins_lg": "",\n    "margins_xl": "",\n    "element_id": "",\n    "tag_type": "h4",\n    "content": "Über uns"\n}	\N
803	{\n    "page_id": "shop-legal-pages",\n    "offset": "0",\n    "limit": "3",\n    "render_template": "cascade/bootstrap4/secmenu-unstyled-list.html",\n    "hide_plugin": ""\n}	\N
804	{\n    "xs-column-width": "col-12",\n    "sm-column-width": "",\n    "md-column-width": "col-md",\n    "lg-column-width": "",\n    "xl-column-width": "",\n    "xs-column-offset": "",\n    "sm-column-offset": "",\n    "md-column-offset": "",\n    "lg-column-offset": "",\n    "xl-column-offset": "",\n    "xs-column-ordering": "",\n    "sm-column-ordering": "",\n    "md-column-ordering": "",\n    "lg-column-ordering": "",\n    "xl-column-ordering": "",\n    "xs-responsive-utils": "",\n    "sm-responsive-utils": "",\n    "md-responsive-utils": "",\n    "lg-responsive-utils": "",\n    "xl-responsive-utils": "",\n    "hide_plugin": "",\n    "container_max_widths": {\n        "xs": 157.5,\n        "md": 212.5,\n        "sm": 157.5,\n        "lg": 262.5\n    }\n}	\N
805	{\n    "hide_plugin": false,\n    "margins_xs": "",\n    "margins_sm": "",\n    "margins_md": "",\n    "margins_lg": "",\n    "margins_xl": "",\n    "element_id": "",\n    "tag_type": "h4",\n    "content": "Kontakt"\n}	\N
806	{\n    "hide_plugin": false,\n    "render_template": "cascade/bootstrap4/secmenu-unstyled-list.html",\n    "page_id": "id-contact",\n    "offset": 0,\n    "limit": 100\n}	\N
807	{\n    "xs-column-width": "col-12",\n    "sm-column-width": "",\n    "md-column-width": "col-md",\n    "lg-column-width": "",\n    "xl-column-width": "",\n    "xs-column-offset": "",\n    "sm-column-offset": "",\n    "md-column-offset": "",\n    "lg-column-offset": "",\n    "xl-column-offset": "",\n    "xs-column-ordering": "",\n    "sm-column-ordering": "",\n    "md-column-ordering": "",\n    "lg-column-ordering": "",\n    "xl-column-ordering": "",\n    "xs-responsive-utils": "",\n    "sm-responsive-utils": "",\n    "md-responsive-utils": "",\n    "lg-responsive-utils": "",\n    "xl-responsive-utils": "",\n    "hide_plugin": "",\n    "container_max_widths": {\n        "xs": 157.5,\n        "md": 212.5,\n        "sm": 157.5,\n        "lg": 262.5\n    }\n}	\N
808	{\n    "hide_plugin": false,\n    "margins_xs": "",\n    "margins_sm": "",\n    "margins_md": "",\n    "margins_lg": "",\n    "margins_xl": "",\n    "element_id": "",\n    "tag_type": "h4",\n    "content": "Social Media"\n}	\N
810	{\n    "xs-column-width": "col-12",\n    "sm-column-width": "",\n    "md-column-width": "col-md",\n    "lg-column-width": "",\n    "xl-column-width": "",\n    "xs-column-offset": "",\n    "sm-column-offset": "",\n    "md-column-offset": "",\n    "lg-column-offset": "",\n    "xl-column-offset": "",\n    "xs-column-ordering": "",\n    "sm-column-ordering": "",\n    "md-column-ordering": "",\n    "lg-column-ordering": "",\n    "xl-column-ordering": "",\n    "xs-responsive-utils": "",\n    "sm-responsive-utils": "",\n    "md-responsive-utils": "",\n    "lg-responsive-utils": "",\n    "xl-responsive-utils": "",\n    "hide_plugin": "",\n    "container_max_widths": {\n        "xs": 157.5,\n        "md": 212.5,\n        "sm": 157.5,\n        "lg": 262.5\n    }\n}	\N
811	{\n    "open_tag": "if",\n    "condition": "user.is_anonymous"\n}	\N
812	{\n    "hide_plugin": false,\n    "margins_xs": "",\n    "margins_sm": "",\n    "margins_md": "",\n    "margins_lg": "",\n    "margins_xl": "",\n    "element_id": "",\n    "tag_type": "h4",\n    "content": "Mitmachen"\n}	\N
813	{\n    "page_id": "shop-impersonal-pages",\n    "offset": "0",\n    "limit": "100",\n    "render_template": "cascade/bootstrap4/secmenu-unstyled-list.html",\n    "hide_plugin": ""\n}	\N
814	{\n    "open_tag": "else",\n    "condition": ""\n}	\N
815	{\n    "hide_plugin": false,\n    "margins_xs": "",\n    "margins_sm": "",\n    "margins_md": "",\n    "margins_lg": "",\n    "margins_xl": "",\n    "element_id": "",\n    "tag_type": "h4",\n    "content": "Über mich"\n}	\N
816	{\n    "page_id": "shop-personal-pages",\n    "offset": "0",\n    "limit": "3",\n    "render_template": "cascade/bootstrap4/secmenu-unstyled-list.html",\n    "hide_plugin": ""\n}	\N
919	{\n    "hide_plugin": false,\n    "breakpoints": [\n        "xs",\n        "sm",\n        "md",\n        "lg",\n        "xl"\n    ],\n    "fluid": false\n}	\N
920	{\n    "hide_plugin": false,\n    "padding_xs": "",\n    "padding_sm": "",\n    "padding_md": "",\n    "padding_lg": "",\n    "padding_xl": ""\n}	\N
921	{\n    "xs-column-width": "col"\n}	\N
923	{\n    "hide_plugin": false,\n    "margins_xs": "",\n    "margins_sm": "",\n    "margins_md": "",\n    "margins_lg": "",\n    "margins_xl": "",\n    "element_id": "",\n    "tag_type": "h1",\n    "content": "AGBs"\n}	\N
823	{\n    "hide_plugin": false,\n    "breakpoints": [\n        "xs",\n        "sm",\n        "md",\n        "lg",\n        "xl"\n    ],\n    "fluid": false\n}	\N
824	{\n    "hide_plugin": false,\n    "padding_xs": "",\n    "padding_sm": "",\n    "padding_md": "",\n    "padding_lg": "",\n    "padding_xl": ""\n}	\N
825	{\n    "xs-column-width": "col"\n}	\N
826	{\n    "hide_plugin": false\n}	\N
827	{"hide_plugin": false, "breakpoints": ["xs", "sm", "md", "lg", "xl"], "fluid": false}	\N
828	{"hide_plugin": false, "padding_xs": "", "padding_sm": "", "padding_md": "", "padding_lg": "", "padding_xl": ""}	\N
829	{"xs-column-width": "col"}	\N
830	{"hide_plugin": false}	\N
844	{\n    "hide_plugin": false,\n    "padding_xs": "",\n    "padding_sm": "",\n    "padding_md": "",\n    "padding_lg": "",\n    "padding_xl": ""\n}	\N
837	{"breakpoints": ["xs", "sm", "md", "lg", "xl"], "fluid": "", "background_and_color": "", "hide_plugin": ""}	\N
845	{\n    "xs-column-width": "col"\n}	\N
122	{\n    "hide_plugin": false,\n    "float_xs": "",\n    "float_sm": "",\n    "float_md": "",\n    "float_lg": "",\n    "float_xl": "",\n    "render_template": "shop/button.html",\n    "product": null,\n    "link_type": "cmspage",\n    "cms_page": {\n        "model": "cms.page",\n        "pk": 40\n    },\n    "section": "",\n    "download_file": null,\n    "ext_url": "",\n    "mail_to": "",\n    "link_target": "",\n    "link_title": "",\n    "icon_font": {\n        "model": "cmsplugin_cascade.iconfont",\n        "pk": 1\n    },\n    "symbol": "logout",\n    "link_content": "Weiter zur Kasse",\n    "button_type": "btn-success",\n    "button_size": "btn-lg",\n    "button_options": [\n        "btn-block"\n    ],\n    "icon_align": "icon-right",\n    "stretched_link": false\n}	\N
\.


--
-- Data for Name: cmsplugin_cascade_iconfont; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cmsplugin_cascade_iconfont (id, identifier, config_data, font_folder, zip_file_id, is_default) FROM stdin;
1	fontawesome	{"name": "fontawesome", "css_prefix_text": "fontaws-", "css_use_suffix": false, "hinting": true, "units_per_em": 1000, "ascent": 850, "glyphs": [{"uid": "cfaa8fbbdcc7bb8d636cb974aad1f9b9", "css": "glass", "code": 59552, "src": "fontawesome"}, {"uid": "9ea0a737ccc45d6c510dcbae56058849", "css": "music", "code": 59392, "src": "fontawesome"}, {"uid": "9dd9e835aebe1060ba7190ad2b2ed951", "css": "search", "code": 59393, "src": "fontawesome"}, {"uid": "bf882b30900da12fca090d9796bc3030", "css": "mail", "code": 59394, "src": "fontawesome"}, {"uid": "ccc2329632396dc096bb638d4b46fb98", "css": "mail-alt", "code": 61664, "src": "fontawesome"}, {"uid": "17c21cd98db80e521e573eba247bd69b", "css": "mail-squared", "code": 61849, "src": "fontawesome"}, {"uid": "d73eceadda1f594cec0536087539afbf", "css": "heart", "code": 59395, "src": "fontawesome"}, {"uid": "f3dc2d6d8fe9cf9ebff84dc260888cdf", "css": "heart-empty", "code": 59396, "src": "fontawesome"}, {"uid": "474656633f79ea2f1dad59ff63f6bf07", "css": "star", "code": 59397, "src": "fontawesome"}, {"uid": "d17030afaecc1e1c22349b99f3c4992a", "css": "star-empty", "code": 59398, "src": "fontawesome"}, {"uid": "8f8278fbe5a2a0ea836be3c408b005d2", "css": "star-half", "code": 59399, "src": "fontawesome"}, {"uid": "84cf1fcc3fec556e7eaeb19679ca2dc9", "css": "star-half-alt", "code": 61731, "src": "fontawesome"}, {"uid": "8b80d36d4ef43889db10bc1f0dc9a862", "css": "user", "code": 59400, "src": "fontawesome"}, {"uid": "1bafeeb1808a5fe24484c7890096901a", "css": "user-plus", "code": 62004, "src": "fontawesome"}, {"uid": "fb1c59faa93eb6e2248c2456625b08a2", "css": "user-times", "code": 62005, "src": "fontawesome"}, {"uid": "31972e4e9d080eaa796290349ae6c1fd", "css": "users", "code": 59401, "src": "fontawesome"}, {"uid": "ca2d64f8a3ea7cbf6af45898b2dcf35e", "css": "male", "code": 61827, "src": "fontawesome"}, {"uid": "9bf7e14698cccdca37a6f1a02cf7d79e", "css": "female", "code": 61826, "src": "fontawesome"}, {"uid": "c2314ed1d2314b89f9285c53bcbf2548", "css": "child", "code": 61870, "src": "fontawesome"}, {"uid": "f9c8ea86275ca16128235c6452b67b8e", "css": "user-secret", "code": 61979, "src": "fontawesome"}, {"uid": "872d9516df93eb6b776cc4d94bd97dac", "css": "video", "code": 59402, "src": "fontawesome"}, {"uid": "0f99ab40ab0b4d64a74f2d0deeb03e42", "css": "videocam", "code": 59403, "src": "fontawesome"}, {"uid": "381da2c2f7fd51f8de877c044d7f439d", "css": "picture", "code": 59404, "src": "fontawesome"}, {"uid": "dc3f1d5b1d006f7f7b3b6295eccab9da", "css": "camera", "code": 59405, "src": "fontawesome"}, {"uid": "9d3d9d6ce1ec63eaa26281e6162853c9", "css": "camera-alt", "code": 59406, "src": "fontawesome"}, {"uid": "dd492243d64e21dfe16a92452f7861cb", "css": "th-large", "code": 59407, "src": "fontawesome"}, {"uid": "b1887b423d2fd15c345e090320c91ca0", "css": "th", "code": 59408, "src": "fontawesome"}, {"uid": "f805bb95d40c7ef2bc51b3d50d4f2e5c", "css": "th-list", "code": 59409, "src": "fontawesome"}, {"uid": "12f4ece88e46abd864e40b35e05b11cd", "css": "ok", "code": 59410, "src": "fontawesome"}, {"uid": "43ab845088317bd348dee1d975700c48", "css": "ok-circled", "code": 59411, "src": "fontawesome"}, {"uid": "ad33e708f4d2e25c5056c931da1528d6", "css": "ok-circled2", "code": 59412, "src": "fontawesome"}, {"uid": "1400d5103edd2fa6d2d61688fee79a5a", "css": "ok-squared", "code": 61770, "src": "fontawesome"}, {"uid": "5211af474d3a9848f67f945e2ccaf143", "css": "cancel", "code": 59413, "src": "fontawesome"}, {"uid": "0f4cae16f34ae243a6144c18a003f2d8", "css": "cancel-circled", "code": 59414, "src": "fontawesome"}, {"uid": "2e2dba0307a502a8507c1729084c7ab5", "css": "cancel-circled2", "code": 59415, "src": "fontawesome"}, {"uid": "44e04715aecbca7f266a17d5a7863c68", "css": "plus", "code": 59416, "src": "fontawesome"}, {"uid": "4ba33d2607902cf690dd45df09774cb0", "css": "plus-circled", "code": 59417, "src": "fontawesome"}, {"uid": "1a5cfa186647e8c929c2b17b9fc4dac1", "css": "plus-squared", "code": 61694, "src": "fontawesome"}, {"uid": "2d3be3e856fc1e4ac067590d2ded1b07", "css": "plus-squared-alt", "code": 61846, "src": "fontawesome"}, {"uid": "861ab06e455e2de3232ebef67d60d708", "css": "minus", "code": 59418, "src": "fontawesome"}, {"uid": "eeadb020bb75d089b25d8424aabe19e0", "css": "minus-circled", "code": 59419, "src": "fontawesome"}, {"uid": "f755a58fb985eeb70bd47d9b31892a34", "css": "minus-squared", "code": 61766, "src": "fontawesome"}, {"uid": "18ef25350258541e8e54148ed79845c0", "css": "minus-squared-alt", "code": 61767, "src": "fontawesome"}, {"uid": "ce3cf091d6ebd004dd0b52d24074e6e3", "css": "help", "code": 61736, "src": "fontawesome"}, {"uid": "17ebadd1e3f274ff0205601eef7b9cc4", "css": "help-circled", "code": 59420, "src": "fontawesome"}, {"uid": "e82cedfa1d5f15b00c5a81c9bd731ea2", "css": "info-circled", "code": 59421, "src": "fontawesome"}, {"uid": "3d4ea8a78dc34efe891f3a0f3d961274", "css": "info", "code": 61737, "src": "fontawesome"}, {"uid": "d7271d490b71df4311e32cdacae8b331", "css": "home", "code": 59422, "src": "fontawesome"}, {"uid": "0ddd3e8201ccc7d41f7b7c9d27eca6c1", "css": "link", "code": 59423, "src": "fontawesome"}, {"uid": "1dcd2b2148b7f086a4eb47f6a746bdee", "css": "unlink", "code": 61735, "src": "fontawesome"}, {"uid": "e15f0d620a7897e2035c18c80142f6d9", "css": "link-ext", "code": 61582, "src": "fontawesome"}, {"uid": "e35de5ea31cd56970498e33efbcb8e36", "css": "link-ext-alt", "code": 61772, "src": "fontawesome"}, {"uid": "0d6ab6194c0eddda2b8c9cedf2ab248e", "css": "attach", "code": 59424, "src": "fontawesome"}, {"uid": "c1f1975c885aa9f3dad7810c53b82074", "css": "lock", "code": 59425, "src": "fontawesome"}, {"uid": "657ab647f6248a6b57a5b893beaf35a9", "css": "lock-open", "code": 59426, "src": "fontawesome"}, {"uid": "05376be04a27d5a46e855a233d6e8508", "css": "lock-open-alt", "code": 61758, "src": "fontawesome"}, {"uid": "5b0772e9484a1a11646793a82edd622a", "css": "pin", "code": 59427, "src": "fontawesome"}, {"uid": "c5fd349cbd3d23e4ade333789c29c729", "css": "eye", "code": 59428, "src": "fontawesome"}, {"uid": "7fd683b2c518ceb9e5fa6757f2276faa", "css": "eye-off", "code": 59429, "src": "fontawesome"}, {"uid": "3db5347bd219f3bce6025780f5d9ef45", "css": "tag", "code": 59430, "src": "fontawesome"}, {"uid": "a3f89e106175a5c5c4e9738870b12e55", "css": "tags", "code": 59431, "src": "fontawesome"}, {"uid": "f04a5d24e9e659145b966739c4fde82a", "css": "bookmark", "code": 59432, "src": "fontawesome"}, {"uid": "2f5ef6f6b7aaebc56458ab4e865beff5", "css": "bookmark-empty", "code": 61591, "src": "fontawesome"}, {"uid": "57a0ac800df728aad61a7cf9e12f5fef", "css": "flag", "code": 59433, "src": "fontawesome"}, {"uid": "6c83092421441296f5c4e8074b0cf32c", "css": "flag-empty", "code": 61725, "src": "fontawesome"}, {"uid": "d7a614bd701f6712e8e3b2be124899e1", "css": "flag-checkered", "code": 61726, "src": "fontawesome"}, {"uid": "acf41aa4018e58d49525665469e35665", "css": "thumbs-up", "code": 59434, "src": "fontawesome"}, {"uid": "7533e68038fc6d520ede7a7ffa0a2f64", "css": "thumbs-down", "code": 59435, "src": "fontawesome"}, {"uid": "5e2ab018e3044337bcef5f7e94098ea1", "css": "thumbs-up-alt", "code": 61796, "src": "fontawesome"}, {"uid": "ddcd918b502642705838815d40aea9e3", "css": "thumbs-down-alt", "code": 61797, "src": "fontawesome"}, {"uid": "9a76bc135eac17d2c8b8ad4a5774fc87", "css": "download", "code": 59436, "src": "fontawesome"}, {"uid": "eeec3208c90b7b48e804919d0d2d4a41", "css": "upload", "code": 59437, "src": "fontawesome"}, {"uid": "f5999a012fc3752386635ec02a858447", "css": "download-cloud", "code": 61677, "src": "fontawesome"}, {"uid": "de2fc7a5c986ab8c622f63455d7cf814", "css": "upload-cloud", "code": 61678, "src": "fontawesome"}, {"uid": "c6be5a58ee4e63a5ec399c2b0d15cf2c", "css": "reply", "code": 61714, "src": "fontawesome"}, {"uid": "1b5597a3bacaeca6600e88ae36d02e0a", "css": "reply-all", "code": 61730, "src": "fontawesome"}, {"uid": "3d39c828009c04ddb6764c0b04cd2439", "css": "forward", "code": 59438, "src": "fontawesome"}, {"uid": "ab95e1351ebaec5850101097cbf7097f", "css": "quote-left", "code": 61709, "src": "fontawesome"}, {"uid": "d745d7c05b94e609decabade2cae12cb", "css": "quote-right", "code": 61710, "src": "fontawesome"}, {"uid": "7034e4d22866af82bef811f52fb1ba46", "css": "code", "code": 61729, "src": "fontawesome"}, {"uid": "895405dfac8a3b7b2f23b183c6608ee6", "css": "export", "code": 59439, "src": "fontawesome"}, {"uid": "13b9eebfea581ad8e756ee7a18a7cba8", "css": "export-alt", "code": 61773, "src": "fontawesome"}, {"uid": "4aad6bb50b02c18508aae9cbe14e784e", "css": "share", "code": 61920, "src": "fontawesome"}, {"uid": "4c1f3c0b331d5f72c6a38d7bb7632675", "css": "share-squared", "code": 61921, "src": "fontawesome"}, {"uid": "d35a1d35efeb784d1dc9ac18b9b6c2b6", "css": "pencil", "code": 59440, "src": "fontawesome"}, {"uid": "44fae3bfdd54754dc68ec50d37efea37", "css": "pencil-squared", "code": 61771, "src": "fontawesome"}, {"uid": "41087bc74d4b20b55059c60a33bf4008", "css": "edit", "code": 59441, "src": "fontawesome"}, {"uid": "7277ded7695b2a307a5f9d50097bb64c", "css": "print", "code": 59442, "src": "fontawesome"}, {"uid": "09feb4465d9bd1364f4e301c9ddbaa92", "css": "retweet", "code": 59443, "src": "fontawesome"}, {"uid": "ecb97add13804c190456025e43ec003b", "css": "keyboard", "code": 61724, "src": "fontawesome"}, {"uid": "0133387f2069a1b3168942b84d81dd3a", "css": "gamepad", "code": 61723, "src": "fontawesome"}, {"uid": "85528017f1e6053b2253785c31047f44", "css": "comment", "code": 59444, "src": "fontawesome"}, {"uid": "dcedf50ab1ede3283d7a6c70e2fe32f3", "css": "chat", "code": 59445, "src": "fontawesome"}, {"uid": "9c1376672bb4f1ed616fdd78a23667e9", "css": "comment-empty", "code": 61669, "src": "fontawesome"}, {"uid": "31951fbb9820ed0690f675b3d495c8da", "css": "chat-empty", "code": 61670, "src": "fontawesome"}, {"uid": "cd21cbfb28ad4d903cede582157f65dc", "css": "bell", "code": 59446, "src": "fontawesome"}, {"uid": "671f29fa10dda08074a4c6a341bb4f39", "css": "bell-alt", "code": 61683, "src": "fontawesome"}, {"uid": "563683020e0bf9f22f3f055a69b5c57a", "css": "bell-off", "code": 61942, "src": "fontawesome"}, {"uid": "8a074400a056c59d389f2d0517281bd5", "css": "bell-off-empty", "code": 61943, "src": "fontawesome"}, {"uid": "00391fac5d419345ffcccd95b6f76263", "css": "attention-alt", "code": 61738, "src": "fontawesome"}, {"uid": "c76b7947c957c9b78b11741173c8349b", "css": "attention", "code": 59447, "src": "fontawesome"}, {"uid": "b035c28eba2b35c6ffe92aee8b0df507", "css": "attention-circled", "code": 59448, "src": "fontawesome"}, {"uid": "0d08dbb1dd648a43bdea81b7e6c9e036", "css": "location", "code": 59449, "src": "fontawesome"}, {"uid": "921e3974e54ff9e8b7cd906a3dc74636", "css": "direction", "code": 61732, "src": "fontawesome"}, {"uid": "e5d624264734620fa9f98d59e6dc941f", "css": "compass", "code": 61774, "src": "fontawesome"}, {"uid": "bbfb51903f40597f0b70fd75bc7b5cac", "css": "trash", "code": 61944, "src": "fontawesome"}, {"uid": "f48ae54adfb27d8ada53d0fd9e34ee10", "css": "trash-empty", "code": 59450, "src": "fontawesome"}, {"uid": "1b5a5d7b7e3c71437f5a26befdd045ed", "css": "doc", "code": 59451, "src": "fontawesome"}, {"uid": "c8585e1e5b0467f28b70bce765d5840c", "css": "docs", "code": 61637, "src": "fontawesome"}, {"uid": "5408be43f7c42bccee419c6be53fdef5", "css": "doc-text", "code": 61686, "src": "fontawesome"}, {"uid": "178053298e3e5b03551d754d4b9acd8b", "css": "doc-inv", "code": 61787, "src": "fontawesome"}, {"uid": "c08a1cde48d96cba21d8c05fa7d7feb1", "css": "doc-text-inv", "code": 61788, "src": "fontawesome"}, {"uid": "9daa1fdf0838118518a7e22715e83abc", "css": "file-pdf", "code": 61889, "src": "fontawesome"}, {"uid": "310ffd629da85142bc8669f010556f2d", "css": "file-word", "code": 61890, "src": "fontawesome"}, {"uid": "f761c3bbe16ba2d332914ecb28e7a042", "css": "file-excel", "code": 61891, "src": "fontawesome"}, {"uid": "edcd4022de8d8df266ef7c42d2658ca5", "css": "file-powerpoint", "code": 61892, "src": "fontawesome"}, {"uid": "3c961c1a8d874815856fc6637dc5a13c", "css": "file-image", "code": 61893, "src": "fontawesome"}, {"uid": "e80ae555c1413a4ec18b33fb348b4049", "css": "file-archive", "code": 61894, "src": "fontawesome"}, {"uid": "81db033e704eb7c586a365559d7c0f36", "css": "file-audio", "code": 61895, "src": "fontawesome"}, {"uid": "dd69d9aa589ea7bc0a82a3fe67039f4b", "css": "file-video", "code": 61896, "src": "fontawesome"}, {"uid": "26613a2e6bc41593c54bead46f8c8ee3", "css": "file-code", "code": 61897, "src": "fontawesome"}, {"uid": "f8aa663c489bcbd6e68ec8147dca841e", "css": "folder", "code": 59452, "src": "fontawesome"}, {"uid": "c95735c17a10af81448c7fed98a04546", "css": "folder-open", "code": 59453, "src": "fontawesome"}, {"uid": "b091a8bd0fdade174951f17d936f51e4", "css": "folder-empty", "code": 61716, "src": "fontawesome"}, {"uid": "6533bdc16ab201eb3f3b27ce989cab33", "css": "folder-open-empty", "code": 61717, "src": "fontawesome"}, {"uid": "04ff8d6592fe548b332b27ed87ce397a", "css": "box", "code": 61831, "src": "fontawesome"}, {"uid": "72b1277834cba5b7944b0a6cac7ddb0d", "css": "rss", "code": 61598, "src": "fontawesome"}, {"uid": "de5f0a564ccf8816325330e292e11533", "css": "rss-squared", "code": 61763, "src": "fontawesome"}, {"uid": "9f7e588c66cfd6891f6f507cf6f6596b", "css": "phone", "code": 59454, "src": "fontawesome"}, {"uid": "ec488dfd1f548948c09671ca5a60ec92", "css": "phone-squared", "code": 61592, "src": "fontawesome"}, {"uid": "5cbe092278ff71fc27c920298b0f3ca3", "css": "fax", "code": 61868, "src": "fontawesome"}, {"uid": "559647a6f430b3aeadbecd67194451dd", "css": "menu", "code": 61641, "src": "fontawesome"}, {"uid": "e99461abfef3923546da8d745372c995", "css": "cog", "code": 59455, "src": "fontawesome"}, {"uid": "98687378abd1faf8f6af97c254eb6cd6", "css": "cog-alt", "code": 59456, "src": "fontawesome"}, {"uid": "5bb103cd29de77e0e06a52638527b575", "css": "wrench", "code": 59457, "src": "fontawesome"}, {"uid": "21b42d3c3e6be44c3cc3d73042faa216", "css": "sliders", "code": 61918, "src": "fontawesome"}, {"uid": "9affc98d652b86628d650ee58dbf0357", "css": "basket", "code": 59458, "src": "fontawesome"}, {"uid": "cddbeffea9d90c5db93d5d3e77b8893e", "css": "cart-plus", "code": 61975, "src": "fontawesome"}, {"uid": "93c35534e6b079466c4676cdedcdb7c1", "css": "cart-arrow-down", "code": 61976, "src": "fontawesome"}, {"uid": "531bc468eecbb8867d822f1c11f1e039", "css": "calendar", "code": 59459, "src": "fontawesome"}, {"uid": "ead4c82d04d7758db0f076584893a8c1", "css": "calendar-empty", "code": 61747, "src": "fontawesome"}, {"uid": "3a00327e61b997b58518bd43ed83c3df", "css": "login", "code": 59460, "src": "fontawesome"}, {"uid": "0d20938846444af8deb1920dc85a29fb", "css": "logout", "code": 59461, "src": "fontawesome"}, {"uid": "19c50c52858a81de58f9db488aba77bc", "css": "mic", "code": 61744, "src": "fontawesome"}, {"uid": "43c629249e2cca7e73cd4ef410c9551f", "css": "mute", "code": 61745, "src": "fontawesome"}, {"uid": "e44601720c64e6bb6a2d5cba6b0c588c", "css": "volume-off", "code": 59462, "src": "fontawesome"}, {"uid": "fee6e00f36e8ca8ef3e4a62caa213bf6", "css": "volume-down", "code": 59463, "src": "fontawesome"}, {"uid": "76857a03fbaa6857fe063b6c25aa98ed", "css": "volume-up", "code": 59464, "src": "fontawesome"}, {"uid": "f27bba41a700af51a4dd23cf4edea61d", "css": "headphones", "code": 59465, "src": "fontawesome"}, {"uid": "598a5f2bcf3521d1615de8e1881ccd17", "css": "clock", "code": 59466, "src": "fontawesome"}, {"uid": "5278ef7773e948d56c4d442c8c8c98cf", "css": "lightbulb", "code": 61675, "src": "fontawesome"}, {"uid": "98d9c83c1ee7c2c25af784b518c522c5", "css": "block", "code": 59467, "src": "fontawesome"}, {"uid": "e594fc6e5870b4ab7e49f52571d52577", "css": "resize-full", "code": 59468, "src": "fontawesome"}, {"uid": "b013f6403e5ab0326614e68d1850fd6b", "css": "resize-full-alt", "code": 61618, "src": "fontawesome"}, {"uid": "3c24ee33c9487bbf18796ca6dffa1905", "css": "resize-small", "code": 59469, "src": "fontawesome"}, {"uid": "d3b3f17bc3eb7cd809a07bbd4d178bee", "css": "resize-vertical", "code": 59470, "src": "fontawesome"}, {"uid": "3c73d058e4589b65a8d959c0fc8f153d", "css": "resize-horizontal", "code": 59471, "src": "fontawesome"}, {"uid": "6605ee6441bf499ffa3c63d3c7409471", "css": "move", "code": 61511, "src": "fontawesome"}, {"uid": "0b2b66e526028a6972d51a6f10281b4b", "css": "zoom-in", "code": 59472, "src": "fontawesome"}, {"uid": "d25d10efa900f529ad1d275657cfd30e", "css": "zoom-out", "code": 59473, "src": "fontawesome"}, {"uid": "c53068fe21c8410b0a098b4c52c3d37e", "css": "down-circled2", "code": 59474, "src": "fontawesome"}, {"uid": "128d63150a41800e0beff55235269542", "css": "up-circled2", "code": 59475, "src": "fontawesome"}, {"uid": "a65ca48f3fe7d6e5c60edbd943f4fdb6", "css": "left-circled2", "code": 61840, "src": "fontawesome"}, {"uid": "d0673ef38e1c458a6de52aad2a2f800d", "css": "right-circled2", "code": 61838, "src": "fontawesome"}, {"uid": "2d6150442079cbda7df64522dc24f482", "css": "down-dir", "code": 59476, "src": "fontawesome"}, {"uid": "80cd1022bd9ea151d554bec1fa05f2de", "css": "up-dir", "code": 59477, "src": "fontawesome"}, {"uid": "9dc654095085167524602c9acc0c5570", "css": "left-dir", "code": 59478, "src": "fontawesome"}, {"uid": "fb1c799ffe5bf8fb7f8bcb647c8fe9e6", "css": "right-dir", "code": 59479, "src": "fontawesome"}, {"uid": "ccddff8e8670dcd130e3cb55fdfc2fd0", "css": "down-open", "code": 59480, "src": "fontawesome"}, {"uid": "d870630ff8f81e6de3958ecaeac532f2", "css": "left-open", "code": 59481, "src": "fontawesome"}, {"uid": "399ef63b1e23ab1b761dfbb5591fa4da", "css": "right-open", "code": 59482, "src": "fontawesome"}, {"uid": "fe6697b391355dec12f3d86d6d490397", "css": "up-open", "code": 59483, "src": "fontawesome"}, {"uid": "f3f90c8c89795da30f7444634476ea4f", "css": "angle-left", "code": 61700, "src": "fontawesome"}, {"uid": "7bf14281af5633a597f85b061ef1cfb9", "css": "angle-right", "code": 61701, "src": "fontawesome"}, {"uid": "5de9370846a26947e03f63142a3f1c07", "css": "angle-up", "code": 61702, "src": "fontawesome"}, {"uid": "e4dde1992f787163e2e2b534b8c8067d", "css": "angle-down", "code": 61703, "src": "fontawesome"}, {"uid": "8933c2579166c2ee56ae40dc6a0b4dc6", "css": "angle-circled-left", "code": 61751, "src": "fontawesome"}, {"uid": "94089b37297572e936b0943bcfa041d3", "css": "angle-circled-right", "code": 61752, "src": "fontawesome"}, {"uid": "8cbd5bcfb00043b8094fd7ac21ae5e06", "css": "angle-circled-up", "code": 61753, "src": "fontawesome"}, {"uid": "c35e0796f6f806945a44b1655ce7bbe7", "css": "angle-circled-down", "code": 61754, "src": "fontawesome"}, {"uid": "745f12abe1472d14f8f658de7e5aba66", "css": "angle-double-left", "code": 61696, "src": "fontawesome"}, {"uid": "fdfbd1fcbd4cb229716a810801a5f207", "css": "angle-double-right", "code": 61697, "src": "fontawesome"}, {"uid": "63b3012c8cbe3654ba5bea598235aa3a", "css": "angle-double-up", "code": 61698, "src": "fontawesome"}, {"uid": "dfec4ffa849d8594c2e4b86f6320b8a6", "css": "angle-double-down", "code": 61699, "src": "fontawesome"}, {"uid": "f06941dfcb90dc24b987d810898c4310", "css": "down", "code": 61813, "src": "fontawesome"}, {"uid": "f6d72aa5ef8e8f0e553012af9a29a87e", "css": "left", "code": 61815, "src": "fontawesome"}, {"uid": "fb94e23ae1e7660aa63cc5f351ec7560", "css": "right", "code": 61816, "src": "fontawesome"}, {"uid": "720f98e7580b7987c8dc542513d1d440", "css": "up", "code": 61814, "src": "fontawesome"}, {"uid": "1c4068ed75209e21af36017df8871802", "css": "down-big", "code": 59484, "src": "fontawesome"}, {"uid": "555ef8c86832e686fef85f7af2eb7cde", "css": "left-big", "code": 59485, "src": "fontawesome"}, {"uid": "ad6b3fbb5324abe71a9c0b6609cbb9f1", "css": "right-big", "code": 59486, "src": "fontawesome"}, {"uid": "95376bf082bfec6ce06ea1cda7bd7ead", "css": "up-big", "code": 59487, "src": "fontawesome"}, {"uid": "aa0d9175a3919a260a4012d560e9f01e", "css": "right-hand", "code": 59488, "src": "fontawesome"}, {"uid": "3d99d345645f43e31e9e0fd48be37e9c", "css": "left-hand", "code": 59489, "src": "fontawesome"}, {"uid": "034e645aa3bad56ce68389a816547c87", "css": "up-hand", "code": 59490, "src": "fontawesome"}, {"uid": "beb43b8df442eac4b8d35f528d5ed5af", "css": "down-hand", "code": 59491, "src": "fontawesome"}, {"uid": "6855131631509e8795730ce062045ea1", "css": "left-circled", "code": 61608, "src": "fontawesome"}, {"uid": "19b04848ae7332d2c0ea2a9e19064037", "css": "right-circled", "code": 61609, "src": "fontawesome"}, {"uid": "2b8e9b027181aafd210bf29c5486d4a0", "css": "up-circled", "code": 61610, "src": "fontawesome"}, {"uid": "55ae6ea25cd707fe34af5b52b2001cdc", "css": "down-circled", "code": 61611, "src": "fontawesome"}, {"uid": "bc71f4c6e53394d5ba46b063040014f1", "css": "cw", "code": 59492, "src": "fontawesome"}, {"uid": "f9c3205df26e7778abac86183aefdc99", "css": "ccw", "code": 59493, "src": "fontawesome"}, {"uid": "a73c5deb486c8d66249811642e5d719a", "css": "arrows-cw", "code": 59494, "src": "fontawesome"}, {"uid": "dea706a9bd3144316ce37406ec10f469", "css": "level-up", "code": 61768, "src": "fontawesome"}, {"uid": "4684e690bad65fb618329dfe52017475", "css": "level-down", "code": 61769, "src": "fontawesome"}, {"uid": "37c5ab63f10d7ad0b84d0978dcd0c7a8", "css": "shuffle", "code": 59495, "src": "fontawesome"}, {"uid": "6020aff067fc3c119cdd75daa5249220", "css": "exchange", "code": 61676, "src": "fontawesome"}, {"uid": "d4816c0845aa43767213d45574b3b145", "css": "history", "code": 61914, "src": "fontawesome"}, {"uid": "84bb9695b8662fa4783242f84c9e4682", "css": "expand", "code": 61776, "src": "fontawesome"}, {"uid": "7960517a504e42aea0641f15bc55fbed", "css": "collapse", "code": 61777, "src": "fontawesome"}, {"uid": "ed5a38704f0329e610ee1c92bec3ad3d", "css": "expand-right", "code": 61778, "src": "fontawesome"}, {"uid": "ea2ec99fbce03864e593bbf4f302a79d", "css": "collapse-left", "code": 61841, "src": "fontawesome"}, {"uid": "ce06b5805120d0c2f8d60cd3f1a4fdb5", "css": "play", "code": 59496, "src": "fontawesome"}, {"uid": "5717236f6134afe2d2a278a5c9b3927a", "css": "play-circled", "code": 61764, "src": "fontawesome"}, {"uid": "e835d9d0f2ee39ae01b01cc6a6fa24ab", "css": "play-circled2", "code": 59497, "src": "fontawesome"}, {"uid": "b624a1e512819d410ddbee84e6918b9d", "css": "stop", "code": 59498, "src": "fontawesome"}, {"uid": "0b28050bac9d3facf2f0226db643ece0", "css": "pause", "code": 59499, "src": "fontawesome"}, {"uid": "c47efa0e3e74f6ba4c2562c1258fff1f", "css": "to-end", "code": 59500, "src": "fontawesome"}, {"uid": "7ea35a8fc7e676c78e99cab2d4bc8653", "css": "to-end-alt", "code": 59501, "src": "fontawesome"}, {"uid": "12052b30d23a1a70d6b32962d5464cae", "css": "to-start", "code": 59502, "src": "fontawesome"}, {"uid": "6b5450145d620234f07ffcbfbb671074", "css": "to-start-alt", "code": 59503, "src": "fontawesome"}, {"uid": "4e511190b60f329d08301eb6869c5130", "css": "fast-fw", "code": 59504, "src": "fontawesome"}, {"uid": "b3d902fcead809e3a64c7ddcda497a6c", "css": "fast-bw", "code": 59505, "src": "fontawesome"}, {"uid": "91b141af48402743aa3503d0a7007132", "css": "eject", "code": 59506, "src": "fontawesome"}, {"uid": "e75c54c282c0bf22186c5c7ec4b03eac", "css": "target", "code": 59507, "src": "fontawesome"}, {"uid": "d407a4707f719b042ed2ad28d2619d7e", "css": "signal", "code": 59508, "src": "fontawesome"}, {"uid": "cd4bfdae4dc89b175ff49330ce29611a", "css": "wifi", "code": 61931, "src": "fontawesome"}, {"uid": "ab656e280958018a7859eba9a1eabbc7", "css": "award", "code": 59509, "src": "fontawesome"}, {"uid": "757afacc32d82967975cbb3b45cfb41b", "css": "desktop", "code": 61704, "src": "fontawesome"}, {"uid": "500fc1f109021e4b1de4deda2f7ed399", "css": "laptop", "code": 61705, "src": "fontawesome"}, {"uid": "f001fc3d4daa7da078e8c971e4f36977", "css": "tablet", "code": 61706, "src": "fontawesome"}, {"uid": "0357f7abbc0babf43509669f332e41e6", "css": "mobile", "code": 61707, "src": "fontawesome"}, {"uid": "c7a75a25880928fe76981a53eca4f926", "css": "inbox", "code": 59510, "src": "fontawesome"}, {"uid": "197375a3cea8cb90b02d06e4ddf1433d", "css": "globe", "code": 59511, "src": "fontawesome"}, {"uid": "aa035df0908c4665c269b7b09a5596f3", "css": "sun", "code": 61829, "src": "fontawesome"}, {"uid": "2c413e78faf1d6631fd7b094d14c2253", "css": "cloud", "code": 59512, "src": "fontawesome"}, {"uid": "3212f42c65d41ed91cb435d0490e29ed", "css": "flash", "code": 59513, "src": "fontawesome"}, {"uid": "567e3e257f2cc8fba2c12bf691c9f2d8", "css": "moon", "code": 61830, "src": "fontawesome"}, {"uid": "24ca41ab002c09de6e89b28f9d599508", "css": "umbrella", "code": 59514, "src": "fontawesome"}, {"uid": "297fe6c2ef08198b03d706ba52f51b7f", "css": "flight", "code": 59515, "src": "fontawesome"}, {"uid": "cb36cbe4e2dac9545e32c3d80a7c6e03", "css": "fighter-jet", "code": 61691, "src": "fontawesome"}, {"uid": "38575a803c4da31ce20d77e1e1236bcb", "css": "paper-plane", "code": 61912, "src": "fontawesome"}, {"uid": "4b2321afcbe0505a70b80abd5c25e09b", "css": "paper-plane-empty", "code": 61913, "src": "fontawesome"}, {"uid": "d650df2fd7c4e27d9185d90a1c12a881", "css": "space-shuttle", "code": 61847, "src": "fontawesome"}, {"uid": "19e7b342a5e6bd0cd86de6d6208486a4", "css": "leaf", "code": 59516, "src": "fontawesome"}, {"uid": "f9cbf7508cd04145ade2800169959eef", "css": "font", "code": 59517, "src": "fontawesome"}, {"uid": "02cca871bb69da75e8ee286b7055832c", "css": "bold", "code": 59518, "src": "fontawesome"}, {"uid": "bf09b1c6561dc0ced707476e2cd83d29", "css": "medium", "code": 62010, "src": "fontawesome"}, {"uid": "a8cb1c217f02b073db3670c061cc54d2", "css": "italic", "code": 59519, "src": "fontawesome"}, {"uid": "0c708edd8fae2376b3370aa56d40cf9e", "css": "header", "code": 61916, "src": "fontawesome"}, {"uid": "c5845105a87df2ee1999826d90622f6a", "css": "paragraph", "code": 61917, "src": "fontawesome"}, {"uid": "c009d417f87d6a27bb5a1cefd30b6cbd", "css": "text-height", "code": 59520, "src": "fontawesome"}, {"uid": "13a971bcccd2dda26d4d4eccd8593f8a", "css": "text-width", "code": 59521, "src": "fontawesome"}, {"uid": "f4f0e849b805be1f6d76b65581cb3b8b", "css": "align-left", "code": 59522, "src": "fontawesome"}, {"uid": "ae6336c46d73af999fe7460c089abb4d", "css": "align-center", "code": 59523, "src": "fontawesome"}, {"uid": "e1e7306b47c3c5e6faecce9d32571381", "css": "align-right", "code": 59524, "src": "fontawesome"}, {"uid": "25a81737628d1e654a30ad412d7d6dd7", "css": "align-justify", "code": 59525, "src": "fontawesome"}, {"uid": "48b87105bd38c20315f1b705b8c7b38c", "css": "list", "code": 59526, "src": "fontawesome"}, {"uid": "594e9271c08ff732c04b3bf3117b9040", "css": "indent-left", "code": 59527, "src": "fontawesome"}, {"uid": "4d2dfc45d8176b1f26aed973fa84a91e", "css": "indent-right", "code": 59528, "src": "fontawesome"}, {"uid": "a2a74f5e7b7d9ba054897d8c795a326a", "css": "list-bullet", "code": 61642, "src": "fontawesome"}, {"uid": "f6766a8b042c2453a4e153af03294383", "css": "list-numbered", "code": 61643, "src": "fontawesome"}, {"uid": "61c242c9e2134d5864d7fdd57b3c9289", "css": "strike", "code": 61644, "src": "fontawesome"}, {"uid": "d4a4a38a40b728f46dad1de4ac950231", "css": "underline", "code": 61645, "src": "fontawesome"}, {"uid": "4e88371fb8857dacc1f66afe6314e426", "css": "superscript", "code": 61739, "src": "fontawesome"}, {"uid": "3d1c929dbc966992185ce749548c1b2c", "css": "subscript", "code": 61740, "src": "fontawesome"}, {"uid": "8fb55fd696d9a0f58f3b27c1d8633750", "css": "table", "code": 61646, "src": "fontawesome"}, {"uid": "53dd31a6cc6438192b2d7b09b1c1dd45", "css": "columns", "code": 61659, "src": "fontawesome"}, {"uid": "09bdae120f85e79f2db16145a9e1f6d8", "css": "crop", "code": 61733, "src": "fontawesome"}, {"uid": "8772331a9fec983cdb5d72902a6f9e0e", "css": "scissors", "code": 59529, "src": "fontawesome"}, {"uid": "b429436ec5a518c78479d44ef18dbd60", "css": "paste", "code": 61674, "src": "fontawesome"}, {"uid": "053b757d97042e1c94276200c7b64b91", "css": "briefcase", "code": 59530, "src": "fontawesome"}, {"uid": "5ccf1ed249fd9d723ec1ce8629a9f507", "css": "suitcase", "code": 61682, "src": "fontawesome"}, {"uid": "107ce08c7231097c7447d8f4d059b55f", "css": "ellipsis", "code": 61761, "src": "fontawesome"}, {"uid": "750058837a91edae64b03d60fc7e81a7", "css": "ellipsis-vert", "code": 61762, "src": "fontawesome"}, {"uid": "8b9e6a8dd8f67f7c003ed8e7e5ee0857", "css": "off", "code": 59531, "src": "fontawesome"}, {"uid": "ecede48deb16179e5ef9a3f8ffae62f4", "css": "road", "code": 59532, "src": "fontawesome"}, {"uid": "c819c6225685bae2eed1b8da13e629fa", "css": "list-alt", "code": 59533, "src": "fontawesome"}, {"uid": "fd45bb961d08f9f2092f0df3fba29fe9", "css": "qrcode", "code": 59534, "src": "fontawesome"}, {"uid": "aa991e8e66ac54b33f0a4b0555597b08", "css": "barcode", "code": 59535, "src": "fontawesome"}, {"uid": "9755f76110ae4d12ac5f9466c9152031", "css": "book", "code": 59536, "src": "fontawesome"}, {"uid": "ca90da02d2c6a3183f2458e4dc416285", "css": "adjust", "code": 59537, "src": "fontawesome"}, {"uid": "83458acd9f38d03ec0226ce82a83c0f4", "css": "tint", "code": 59538, "src": "fontawesome"}, {"uid": "2a4e6c99b732a57da40e32fa2a7800a4", "css": "toggle-off", "code": 61956, "src": "fontawesome"}, {"uid": "3256ef03b16e7ab51235bc7378b53bb5", "css": "toggle-on", "code": 61957, "src": "fontawesome"}, {"uid": "dd6c6b221a1088ff8a9b9cd32d0b3dd5", "css": "check", "code": 59539, "src": "fontawesome"}, {"uid": "4b900d04e8ab8c82f080c1cfbac5772c", "css": "check-empty", "code": 61590, "src": "fontawesome"}, {"uid": "130380e481a7defc690dfb24123a1f0c", "css": "circle", "code": 61713, "src": "fontawesome"}, {"uid": "422e07e5afb80258a9c4ed1706498f8a", "css": "circle-empty", "code": 61708, "src": "fontawesome"}, {"uid": "5774d0a0e50f6eefc8be01bd761e5dd3", "css": "circle-thin", "code": 61915, "src": "fontawesome"}, {"uid": "4ffd8122933b9ee0183b925e1554969f", "css": "circle-notch", "code": 61902, "src": "fontawesome"}, {"uid": "81bb68665e8e595505272a746db07c7a", "css": "dot-circled", "code": 61842, "src": "fontawesome"}, {"uid": "823a9e02e643318116fea40a00190e4e", "css": "asterisk", "code": 59540, "src": "fontawesome"}, {"uid": "28f308aa0a07a67433f54c089c400d82", "css": "gift", "code": 59541, "src": "fontawesome"}, {"uid": "254077e7c0a9e6d303b32f9c35b96a40", "css": "fire", "code": 59542, "src": "fontawesome"}, {"uid": "d20912c814d0ff9a7fd27ed1f54813cc", "css": "magnet", "code": 59543, "src": "fontawesome"}, {"uid": "266d5d9adf15a61800477a5acf9a4462", "css": "chart-bar", "code": 59544, "src": "fontawesome"}, {"uid": "7d1ca956f4181a023de4b9efbed92524", "css": "chart-area", "code": 61950, "src": "fontawesome"}, {"uid": "554ee96588a6c9ee632624cd051fe6fc", "css": "chart-pie", "code": 61952, "src": "fontawesome"}, {"uid": "ea2d9a8c51ca42b38ef0d2a07f16d9a7", "css": "chart-line", "code": 61953, "src": "fontawesome"}, {"uid": "d6fcb9886485b0bdb41b94521e7a3311", "css": "ticket", "code": 61765, "src": "fontawesome"}, {"uid": "3d8cc269fdad8a4cda55a20542a84e5c", "css": "credit-card", "code": 59545, "src": "fontawesome"}, {"uid": "f4445feb55521283572ee88bc304f928", "css": "floppy", "code": 59546, "src": "fontawesome"}, {"uid": "3e674995cacc2b09692c096ea7eb6165", "css": "megaphone", "code": 59547, "src": "fontawesome"}, {"uid": "795efd07cd5205b589c883916a76cff0", "css": "hdd", "code": 61600, "src": "fontawesome"}, {"uid": "f2aa28a2548ed3d2be718d087b65ee21", "css": "key", "code": 59548, "src": "fontawesome"}, {"uid": "bc4b94dd7a9a1dd2e02f9e4648062596", "css": "fork", "code": 61734, "src": "fontawesome"}, {"uid": "8aa99bc60f3553bb3e31b73dd6e744c8", "css": "rocket", "code": 61749, "src": "fontawesome"}, {"uid": "7432077e6a2d6aa19984ca821bb6bbda", "css": "bug", "code": 61832, "src": "fontawesome"}, {"uid": "d61be837c725a299b432dcbee2ecdae6", "css": "certificate", "code": 61603, "src": "fontawesome"}, {"uid": "9396b2d8849e0213a0f11c5fd7fcc522", "css": "tasks", "code": 61614, "src": "fontawesome"}, {"uid": "4109c474ff99cad28fd5a2c38af2ec6f", "css": "filter", "code": 61616, "src": "fontawesome"}, {"uid": "0f444c61b0d2c9966016d7ddb12f5837", "css": "beaker", "code": 61635, "src": "fontawesome"}, {"uid": "ff70f7b3228702e0d590e60ed3b90bea", "css": "magic", "code": 61648, "src": "fontawesome"}, {"uid": "9937d762aee170b7350b15dd02dd34a3", "css": "cab", "code": 61881, "src": "fontawesome"}, {"uid": "5eacf9f8805e2c0bc306dcd1e709db16", "css": "taxi", "code": 61882, "src": "fontawesome"}, {"uid": "7f3d8ff1d5f6ee019f0c00ed7a86caec", "css": "truck", "code": 59549, "src": "fontawesome"}, {"uid": "5b17c7263caa553039655f2fef81ecaf", "css": "bus", "code": 61959, "src": "fontawesome"}, {"uid": "891d861cffd152a6474f01e77716d44e", "css": "bicycle", "code": 61958, "src": "fontawesome"}, {"uid": "326dd5dc5899787161184614d04a50b9", "css": "motorcycle", "code": 61980, "src": "fontawesome"}, {"uid": "4df54de7f9081aefcc1476068d4464e9", "css": "train", "code": 62008, "src": "fontawesome"}, {"uid": "26667777684de4808cedd3783834356f", "css": "subway", "code": 62009, "src": "fontawesome"}, {"uid": "3bf0956ae356f79d805fb17f4a523f24", "css": "ship", "code": 61978, "src": "fontawesome"}, {"uid": "f279f25007794fa6837ff78fe94b216e", "css": "money", "code": 61654, "src": "fontawesome"}, {"uid": "486b835e9eebf54eee78ed12b4291b86", "css": "euro", "code": 61779, "src": "fontawesome"}, {"uid": "9854f7f091bd4fdf9b8735ed66667b9d", "css": "pound", "code": 61780, "src": "fontawesome"}, {"uid": "026007bd17bfc67f3fe013199676f620", "css": "dollar", "code": 61781, "src": "fontawesome"}, {"uid": "62e4fa2c664818d20ce4740cadbf9aeb", "css": "rupee", "code": 61782, "src": "fontawesome"}, {"uid": "5f61f8a682b77d2529296a8061bf9597", "css": "yen", "code": 61783, "src": "fontawesome"}, {"uid": "243424d56528e83e4fe9ef6e6347a2ef", "css": "rouble", "code": 61784, "src": "fontawesome"}, {"uid": "589ae2cbc6d95cc74eb2dbd3fa9c9bcd", "css": "shekel", "code": 61963, "src": "fontawesome"}, {"uid": "7f5801d1e299b445ad0090b0a9e94bcb", "css": "try", "code": 61845, "src": "fontawesome"}, {"uid": "82f0dc5149d842219e45000bebd683fb", "css": "won", "code": 61785, "src": "fontawesome"}, {"uid": "2cb15eb2b295ee3c33fab1530e18a924", "css": "bitcoin", "code": 61786, "src": "fontawesome"}, {"uid": "77b6b5ad1966970971c43e40e8d10772", "css": "viacoin", "code": 62007, "src": "fontawesome"}, {"uid": "56a21935a5d4d79b2e91ec00f760b369", "css": "sort", "code": 61660, "src": "fontawesome"}, {"uid": "94103e1b3f1e8cf514178ec5912b4469", "css": "sort-down", "code": 61661, "src": "fontawesome"}, {"uid": "65b3ce930627cabfb6ac81ac60ec5ae4", "css": "sort-up", "code": 61662, "src": "fontawesome"}, {"uid": "0cd2582b8c93719d066ee0affd02ac78", "css": "sort-alt-up", "code": 61792, "src": "fontawesome"}, {"uid": "27b13eff5eb0ca15e01a6e65ffe6eeec", "css": "sort-alt-down", "code": 61793, "src": "fontawesome"}, {"uid": "3ed68ae14e9cde775121954242a412b2", "css": "sort-name-up", "code": 61789, "src": "fontawesome"}, {"uid": "6586267200a42008a9fc0a1bf7ac06c7", "css": "sort-name-down", "code": 61790, "src": "fontawesome"}, {"uid": "3a7b6876c1817ce3b801b86c04a9d0af", "css": "sort-number-up", "code": 61794, "src": "fontawesome"}, {"uid": "b04fc30546f597a7e0a14715e6fc81ff", "css": "sort-number-down", "code": 61795, "src": "fontawesome"}, {"uid": "dec0ce0476433f7e49e096526cf89465", "css": "hammer", "code": 59550, "src": "fontawesome"}, {"uid": "0bda4bc779d4c32623dec2e43bd67ee8", "css": "gauge", "code": 61668, "src": "fontawesome"}, {"uid": "6fe95ffc3c807e62647d4f814a96e0d7", "css": "sitemap", "code": 61672, "src": "fontawesome"}, {"uid": "cda0cdcfd38f5f1d9255e722dad42012", "css": "spinner", "code": 61712, "src": "fontawesome"}, {"uid": "3a26448b711645ba1abfc86c1a6e2f30", "css": "coffee", "code": 61684, "src": "fontawesome"}, {"uid": "30b79160618d99ce798e4bd11cafe3fe", "css": "food", "code": 61685, "src": "fontawesome"}, {"uid": "890bcc8897cce868f6ee65cadadde036", "css": "beer", "code": 61692, "src": "fontawesome"}, {"uid": "9e8430ce95f56720ae8e7afba291df88", "css": "user-md", "code": 61680, "src": "fontawesome"}, {"uid": "5590d2f643b64d2d0757ae660f9c24cb", "css": "stethoscope", "code": 61681, "src": "fontawesome"}, {"uid": "d84a06c5ce6da9ebdc9b0a5cb94db4c4", "css": "heartbeat", "code": 61982, "src": "fontawesome"}, {"uid": "6dbf07228006788a96eb6244b3591970", "css": "ambulance", "code": 61689, "src": "fontawesome"}, {"uid": "46120eb259799eab0dac0691137e5706", "css": "medkit", "code": 61690, "src": "fontawesome"}, {"uid": "6f41d9b99564a01f1fde503b7f03bf1a", "css": "h-sigh", "code": 61693, "src": "fontawesome"}, {"uid": "df9d9b2fb366c10427ffb727943db912", "css": "bed", "code": 62006, "src": "fontawesome"}, {"uid": "c4adaacece4c6341a9ae1816f5ea500c", "css": "hospital", "code": 61688, "src": "fontawesome"}, {"uid": "3d1e04316a48ace4e2b81be58343a41c", "css": "building", "code": 61687, "src": "fontawesome"}, {"uid": "ede2ea0a583f662b79fbb181b428c20d", "css": "building-filled", "code": 61869, "src": "fontawesome"}, {"uid": "8c0ffa714cecbf5144e022d9c3df4a1f", "css": "bank", "code": 61852, "src": "fontawesome"}, {"uid": "d862a10e1448589215be19702f98f2c1", "css": "smile", "code": 61720, "src": "fontawesome"}, {"uid": "06ddc67d609c477cd5524a7238d7850d", "css": "frown", "code": 61721, "src": "fontawesome"}, {"uid": "2c5055a9c9723725f49f0593a08535af", "css": "meh", "code": 61722, "src": "fontawesome"}, {"uid": "7a9d73c640892d4b917c706ad95d6fec", "css": "anchor", "code": 61757, "src": "fontawesome"}, {"uid": "fa10777b2d88cc64cd6e4f26ef0e5264", "css": "terminal", "code": 61728, "src": "fontawesome"}, {"uid": "ebc57fa8400e4ede049ac5dc665210e1", "css": "eraser", "code": 61741, "src": "fontawesome"}, {"uid": "5f0f183e241d15cbe486bff88b188dff", "css": "puzzle", "code": 61742, "src": "fontawesome"}, {"uid": "44a0e2660ac966cdfaa04deb6aac51df", "css": "shield", "code": 61746, "src": "fontawesome"}, {"uid": "1e7648f03fbdc28114a00b33b059b499", "css": "extinguisher", "code": 61748, "src": "fontawesome"}, {"uid": "c92ad3028acce9d51bae0ac82f5de8a2", "css": "bullseye", "code": 61760, "src": "fontawesome"}, {"uid": "8a67014b864fb93503348593979ddce3", "css": "wheelchair", "code": 61843, "src": "fontawesome"}, {"uid": "4fc9b8c122d1b5ca3df42a104a655e8b", "css": "language", "code": 61867, "src": "fontawesome"}, {"uid": "20fc52f9a88bb7bda023ef209acac095", "css": "graduation-cap", "code": 61853, "src": "fontawesome"}, {"uid": "55605ca79a65def1a9c300037ff1d0d5", "css": "paw", "code": 61872, "src": "fontawesome"}, {"uid": "3964e28e6bdf85b3b70df3533db69867", "css": "spoon", "code": 61873, "src": "fontawesome"}, {"uid": "fbede3c5584282a0e9b131926dff71da", "css": "cube", "code": 61874, "src": "fontawesome"}, {"uid": "af95ef0ddda80a78828c62d386506433", "css": "cubes", "code": 61875, "src": "fontawesome"}, {"uid": "288f930b765216bc04e475740331bdf5", "css": "recycle", "code": 61880, "src": "fontawesome"}, {"uid": "88da60b3a17e5744695682833a178e73", "css": "tree", "code": 61883, "src": "fontawesome"}, {"uid": "347c38a8b96a509270fdcabc951e7571", "css": "database", "code": 61888, "src": "fontawesome"}, {"uid": "d59ff824282fc6edaeca991deab522aa", "css": "server", "code": 62003, "src": "fontawesome"}, {"uid": "ebffa4e734c8379ffee4fbfe49264d94", "css": "lifebuoy", "code": 61901, "src": "fontawesome"}, {"uid": "c53415fbd2695033bd7180d7a9ed4934", "css": "rebel", "code": 61904, "src": "fontawesome"}, {"uid": "6632ce1019f9115842335622cb55f4e7", "css": "empire", "code": 61905, "src": "fontawesome"}, {"uid": "49ef53dc31aa9442d77f6ba4f559b528", "css": "bomb", "code": 61922, "src": "fontawesome"}, {"uid": "cf62866c0cfe3dd14455b381c724f8e1", "css": "soccer-ball", "code": 61923, "src": "fontawesome"}, {"uid": "3e1c9aac91dc062dc1af383d43f58ac5", "css": "tty", "code": 61924, "src": "fontawesome"}, {"uid": "73ffeb70554099177620847206c12457", "css": "binoculars", "code": 61925, "src": "fontawesome"}, {"uid": "a14be0c7e0689076e2bdde97f8e309f9", "css": "plug", "code": 61926, "src": "fontawesome"}, {"uid": "032bd8bbd70adf90ead98b6813bfe446", "css": "newspaper", "code": 61930, "src": "fontawesome"}, {"uid": "1ee2aeb352153a403df4b441a8bc9bda", "css": "calc", "code": 61932, "src": "fontawesome"}, {"uid": "4a74a0f87d4089efe7aba1825bff4193", "css": "copyright", "code": 61945, "src": "fontawesome"}, {"uid": "33194d4a025fbf12baca54579afe4c8e", "css": "at", "code": 61946, "src": "fontawesome"}, {"uid": "88e6faa0f633ee23667f815689e82af3", "css": "eyedropper", "code": 61947, "src": "fontawesome"}, {"uid": "fa9a0b7e788c2d78e24cef1de6b70e80", "css": "brush", "code": 61948, "src": "fontawesome"}, {"uid": "bc61ebcf2f5d8d08b1e9e62167df7617", "css": "birthday", "code": 61949, "src": "fontawesome"}, {"uid": "f85affb51c357be83d187344c8c6e35c", "css": "diamond", "code": 61977, "src": "fontawesome"}, {"uid": "3c7eb0c1678e6fa93cc4264bad3150d6", "css": "street-view", "code": 61981, "src": "fontawesome"}, {"uid": "95501182783a570088194c41bc63543b", "css": "venus", "code": 61985, "src": "fontawesome"}, {"uid": "5d5d8995aa777cb59c88671e89ab5ced", "css": "mars", "code": 61986, "src": "fontawesome"}, {"uid": "c3c269bbbf641affca7e52beb39f7909", "css": "mercury", "code": 61987, "src": "fontawesome"}, {"uid": "d589e468da8556b0701206cfdfcfc567", "css": "transgender", "code": 61988, "src": "fontawesome"}, {"uid": "5a77a57792f5bfd20fb80827af089d17", "css": "transgender-alt", "code": 61989, "src": "fontawesome"}, {"uid": "6c6165b9b97c471cc4c6366f9cf84537", "css": "venus-double", "code": 61990, "src": "fontawesome"}, {"uid": "3bc42da674bdbebcb6471ceb42966d33", "css": "mars-double", "code": 61991, "src": "fontawesome"}, {"uid": "4ced65e721620e2b3e77b02d54af4100", "css": "venus-mars", "code": 61992, "src": "fontawesome"}, {"uid": "6d4f6e98584c8b8ec08bd47a96ed86c4", "css": "mars-stroke", "code": 61993, "src": "fontawesome"}, {"uid": "4162b5adba555571ca1be76baa365b9c", "css": "mars-stroke-v", "code": 61994, "src": "fontawesome"}, {"uid": "10bd8ed7a393f773e81d145ad5523beb", "css": "mars-stroke-h", "code": 61995, "src": "fontawesome"}, {"uid": "14896a85fab311b3a5a9b614fe8c6874", "css": "neuter", "code": 61996, "src": "fontawesome"}, {"uid": "e3ed188ab8569b45cf41e74ce81aa86e", "css": "cc-visa", "code": 61936, "src": "fontawesome"}, {"uid": "4b1bfce8593a2c1c7d60b9145ada2adf", "css": "cc-mastercard", "code": 61937, "src": "fontawesome"}, {"uid": "6413682e05e1c65d13cb76fbca6d67e1", "css": "cc-discover", "code": 61938, "src": "fontawesome"}, {"uid": "4e7a8235533632f4df7ba7a2c68cd39d", "css": "cc-amex", "code": 61939, "src": "fontawesome"}, {"uid": "b83f99fd47bff831e25255c9bbbbabe7", "css": "cc-paypal", "code": 61940, "src": "fontawesome"}, {"uid": "9698d35be5c118ec7521a98130fddc67", "css": "cc-stripe", "code": 61941, "src": "fontawesome"}, {"uid": "ef98b489bfb943225e6761cfa9999e9b", "css": "adn", "code": 61808, "src": "fontawesome"}, {"uid": "809f2374b759f5b9278ac6307e690ba4", "css": "android", "code": 61819, "src": "fontawesome"}, {"uid": "3fb64dab2b2e0a6cefa161387250c620", "css": "angellist", "code": 61961, "src": "fontawesome"}, {"uid": "e9fa538fd5913046497ac148e27cd8ea", "css": "apple", "code": 61817, "src": "fontawesome"}, {"uid": "aa58e30c7196b1378a6ca78c025cc3b5", "css": "behance", "code": 61876, "src": "fontawesome"}, {"uid": "b501bc7737850366e98043c585163eec", "css": "behance-squared", "code": 61877, "src": "fontawesome"}, {"uid": "169f51b7e405de8c03cf85a6e8c740ab", "css": "bitbucket", "code": 61809, "src": "fontawesome"}, {"uid": "4ae56c66a1f93e28b8d4f866db2b018a", "css": "bitbucket-squared", "code": 61810, "src": "fontawesome"}, {"uid": "18d3287c351d9799fedb221e4923b2d2", "css": "buysellads", "code": 61965, "src": "fontawesome"}, {"uid": "66faf6c4e3b0e4e33f06171e30253e26", "css": "cc", "code": 61962, "src": "fontawesome"}, {"uid": "76675011e906d50af404186b489fc76f", "css": "codeopen", "code": 61899, "src": "fontawesome"}, {"uid": "aa4ded7a2d22e21c3cfe775efe267120", "css": "connectdevelop", "code": 61966, "src": "fontawesome"}, {"uid": "01c946ce2ed5500e0a918f2b3a7d1923", "css": "css3", "code": 61756, "src": "fontawesome"}, {"uid": "71e046578954f177921bcf5b241d0d95", "css": "dashcube", "code": 61968, "src": "fontawesome"}, {"uid": "6975c4c656d41a0283d9c52516bf38ed", "css": "delicious", "code": 61861, "src": "fontawesome"}, {"uid": "54fad985c676a007c79c346ebaec29d6", "css": "deviantart", "code": 61885, "src": "fontawesome"}, {"uid": "ef0e69c3275e8c845aca69a79900092d", "css": "digg", "code": 61862, "src": "fontawesome"}, {"uid": "199c44bca402ec5a6351f75ba5228375", "css": "dribbble", "code": 61821, "src": "fontawesome"}, {"uid": "9e34a047fee949eae9b6e613d790d6cf", "css": "dropbox", "code": 61803, "src": "fontawesome"}, {"uid": "d16ba9078d51e79b5ad6af0235adbd54", "css": "drupal", "code": 61865, "src": "fontawesome"}, {"uid": "8e04c98c8f5ca0a035776e3001ad2638", "css": "facebook", "code": 61594, "src": "fontawesome"}, {"uid": "4743b088aa95d6f3b6b990e770d3b647", "css": "facebook-squared", "code": 62216, "src": "fontawesome"}, {"uid": "6cc7af3e5b55720bcb6ef68372ce24be", "css": "facebook-official", "code": 62000, "src": "fontawesome"}, {"uid": "649004fb1ed50395a33c3780236ba8aa", "css": "flickr", "code": 61806, "src": "fontawesome"}, {"uid": "7b7116fa67e5e3f4c98e5928ebe3f6ae", "css": "forumbee", "code": 61969, "src": "fontawesome"}, {"uid": "a32d12927584e3c8a3dff23eb816d360", "css": "foursquare", "code": 61824, "src": "fontawesome"}, {"uid": "c75b7d61b0bce6aeb54292e3952a1568", "css": "git-squared", "code": 61906, "src": "fontawesome"}, {"uid": "e7cb72a17f3b21e3576f35c3f0a7639b", "css": "git", "code": 61907, "src": "fontawesome"}, {"uid": "5e0a374728ffa8d0ae1f331a8f648231", "css": "github", "code": 61715, "src": "fontawesome"}, {"uid": "0ece9a12de796b8411f868d582bee678", "css": "github-squared", "code": 62208, "src": "fontawesome"}, {"uid": "0f6a2573a7b6df911ed199bb63717e27", "css": "github-circled", "code": 61595, "src": "fontawesome"}, {"uid": "5b4b48418155c35459f12171f97c82ff", "css": "gittip", "code": 61828, "src": "fontawesome"}, {"uid": "f06fe7ff18d1c591bc1183cb3ab105e9", "css": "google", "code": 61856, "src": "fontawesome"}, {"uid": "b8d0c7d76e87b94882329a88e8e43d3d", "css": "gplus", "code": 61653, "src": "fontawesome"}, {"uid": "f0cf7db1b03cb65adc450aa3bdaf8c4d", "css": "gplus-squared", "code": 61652, "src": "fontawesome"}, {"uid": "50fbbd926b2a64fcaf384788056c0e43", "css": "gwallet", "code": 61934, "src": "fontawesome"}, {"uid": "237ee28b7e826b75a5b6f51ee3e2bfc1", "css": "hacker-news", "code": 61908, "src": "fontawesome"}, {"uid": "ff44f01f60948555026580eedf1e39bb", "css": "html5", "code": 61755, "src": "fontawesome"}, {"uid": "4c1ef492f1d2c39a2250ae457cee2a6e", "css": "instagram", "code": 61805, "src": "fontawesome"}, {"uid": "9b9e5f3ee9e3525808ed2afc83e8bb0b", "css": "ioxhost", "code": 61960, "src": "fontawesome"}, {"uid": "8cd1b9899389237def726c08587a649f", "css": "joomla", "code": 61866, "src": "fontawesome"}, {"uid": "486f6d0a05aef9e65eeb07be26793bd3", "css": "jsfiddle", "code": 61900, "src": "fontawesome"}, {"uid": "5dcf6620378353c5b0089b12d961fedf", "css": "lastfm", "code": 61954, "src": "fontawesome"}, {"uid": "32e335f0cd5c4fcc692af6fa742f6b7e", "css": "lastfm-squared", "code": 61955, "src": "fontawesome"}, {"uid": "f78244d4753a3aa2be87d56b858d148d", "css": "leanpub", "code": 61970, "src": "fontawesome"}, {"uid": "1145676a91138011729fa2909997af66", "css": "linkedin-squared", "code": 62220, "src": "fontawesome"}, {"uid": "47a35af762c8e06f3d152750134c8750", "css": "linux", "code": 61820, "src": "fontawesome"}, {"uid": "e9107949dd6c9e8ab2b29ae07156e38c", "css": "linkedin", "code": 61665, "src": "fontawesome"}, {"uid": "fcdc6d7a89771d2dbd38eb719aafb2ff", "css": "maxcdn", "code": 61750, "src": "fontawesome"}, {"uid": "9b2e17ef8fc33eb2a1c8b5953d51c595", "css": "meanpath", "code": 61964, "src": "fontawesome"}, {"uid": "da8a58b1deff73d1ba89ba1172ca4bcc", "css": "openid", "code": 61851, "src": "fontawesome"}, {"uid": "bbf50a560f95a4cce5209d47e71cbc30", "css": "pagelines", "code": 61836, "src": "fontawesome"}, {"uid": "1d2b426ab6db81a58547ba13d8701ad8", "css": "paypal", "code": 61933, "src": "fontawesome"}, {"uid": "92a4d74aa4e0549812301299020915a5", "css": "pied-piper-squared", "code": 61863, "src": "fontawesome"}, {"uid": "604733d6d4f7ae269a2ea97f4dc7c346", "css": "pied-piper-alt", "code": 61864, "src": "fontawesome"}, {"uid": "cc399e4597f157dcbf016be0b7407fea", "css": "pinterest", "code": 62001, "src": "fontawesome"}, {"uid": "da851b7c1f84ee83f93b29ae613558dc", "css": "pinterest-circled", "code": 61650, "src": "fontawesome"}, {"uid": "79689c4c425b7cdaa2746f510e81e27a", "css": "pinterest-squared", "code": 61651, "src": "fontawesome"}, {"uid": "657ff9fe5df74f1993937aa4b19cf909", "css": "qq", "code": 61910, "src": "fontawesome"}, {"uid": "9121e3eb89863f67c8bda378eea01a93", "css": "reddit", "code": 61857, "src": "fontawesome"}, {"uid": "4fc515c6a083b42e628273ab06cb2a90", "css": "reddit-squared", "code": 61858, "src": "fontawesome"}, {"uid": "cfa8a2588cab42a6ff7ba81eb4fec21b", "css": "renren", "code": 61835, "src": "fontawesome"}, {"uid": "281020881dd80ef01d0369bf4b80ebef", "css": "sellsy", "code": 61971, "src": "fontawesome"}, {"uid": "770fafc9392963133bb03b4ad4ed3a28", "css": "shirtsinbulk", "code": 61972, "src": "fontawesome"}, {"uid": "12b38aeedfa5b6672936432bc7d3082c", "css": "simplybuilt", "code": 61973, "src": "fontawesome"}, {"uid": "a0afa21fe64100c16eac19f4e1615c2a", "css": "skyatlas", "code": 61974, "src": "fontawesome"}, {"uid": "58a16628dcbd6456c61218f3d27591be", "css": "skype", "code": 61822, "src": "fontawesome"}, {"uid": "87276033a77d0b9b890125c3639e4f87", "css": "slack", "code": 61848, "src": "fontawesome"}, {"uid": "be13b8c668eb18839d5d53107725f1de", "css": "slideshare", "code": 61927, "src": "fontawesome"}, {"uid": "dff942d95eb1b3f1be140e622d0a7c74", "css": "soundcloud", "code": 61886, "src": "fontawesome"}, {"uid": "fb4794d89b77ab712ad56c0dc4c76c6b", "css": "spotify", "code": 61884, "src": "fontawesome"}, {"uid": "b6d6b3561d705330c7ad2155e8ee94ba", "css": "stackexchange", "code": 61837, "src": "fontawesome"}, {"uid": "e1597911f34fea0a188ae51fe4a2d9a9", "css": "stackoverflow", "code": 61804, "src": "fontawesome"}, {"uid": "2ec1790207a8ba67a7192c6af1eafec4", "css": "steam", "code": 61878, "src": "fontawesome"}, {"uid": "727544621cb891115c99b4a4cfed01df", "css": "steam-squared", "code": 61879, "src": "fontawesome"}, {"uid": "3958d12510001a1a172f088893506c27", "css": "stumbleupon", "code": 61860, "src": "fontawesome"}, {"uid": "7377e22d1e1d2dd079f87b05fb6a11a3", "css": "stumbleupon-circled", "code": 61859, "src": "fontawesome"}, {"uid": "d9b33592f56a02af69a36aa64ed452fc", "css": "tencent-weibo", "code": 61909, "src": "fontawesome"}, {"uid": "b846892636bd74112998bb159bdddf27", "css": "trello", "code": 61825, "src": "fontawesome"}, {"uid": "43fcf807461234935e65261328e1dff6", "css": "tumblr", "code": 61811, "src": "fontawesome"}, {"uid": "5b79895d979c408282b4e92fa7db8e82", "css": "tumblr-squared", "code": 61812, "src": "fontawesome"}, {"uid": "e70df9acbabaebfbbf9c1dbc3e52ab13", "css": "twitch", "code": 61928, "src": "fontawesome"}, {"uid": "906348dc798a0d42715cc97c875e3ac6", "css": "twitter-squared", "code": 62212, "src": "fontawesome"}, {"uid": "627abcdb627cb1789e009c08e2678ef9", "css": "twitter", "code": 61593, "src": "fontawesome"}, {"uid": "1f66490bf24c99e2c56b866d8fbd0372", "css": "vimeo-squared", "code": 61844, "src": "fontawesome"}, {"uid": "676cf66256441f09e4934ae6378b3e2d", "css": "vine", "code": 61898, "src": "fontawesome"}, {"uid": "f3d95e13eb43f3f6b8efe1eb424a1e3b", "css": "vkontakte", "code": 61833, "src": "fontawesome"}, {"uid": "9d3e9faf68fd4e12def853f0d4e1173b", "css": "whatsapp", "code": 62002, "src": "fontawesome"}, {"uid": "34cb6ce62bf3f1efd59e2f5eb0d79f82", "css": "wechat", "code": 61911, "src": "fontawesome"}, {"uid": "9854b94688e31450fc76aae4c2a45dff", "css": "weibo", "code": 61834, "src": "fontawesome"}, {"uid": "8aff323697468c4a63993cde00386ec6", "css": "windows", "code": 61818, "src": "fontawesome"}, {"uid": "39f52f80e1864df5e5022d7f0f5ff86f", "css": "wordpress", "code": 61850, "src": "fontawesome"}, {"uid": "11ebb30e17efcd988a228ade5d3e8c74", "css": "xing", "code": 61800, "src": "fontawesome"}, {"uid": "f7dff44258aa565cbe35565be350b58d", "css": "xing-squared", "code": 61801, "src": "fontawesome"}, {"uid": "7a48de2ac7ca47c78d6c279996ee6250", "css": "yelp", "code": 61929, "src": "fontawesome"}, {"uid": "a9862b9d5197886c1ad693ecd7120b31", "css": "youtube", "code": 61799, "src": "fontawesome"}, {"uid": "ba071f2b01f1fed40d8e2366434b6f42", "css": "yahoo", "code": 61854, "src": "fontawesome"}, {"uid": "e331ff486a299c6bdf0056426c8fac53", "css": "youtube-squared", "code": 61798, "src": "fontawesome"}, {"uid": "47a1f80457068fbeab69fdb83d7d0817", "css": "youtube-play", "code": 61802, "src": "fontawesome"}, {"uid": "2c2ca8a96b31781c9c8056d05c0a8980", "css": "blank", "code": 61640, "src": "fontawesome"}, {"uid": "5e0191587645a9f5d514ed4b0a0e008a", "css": "lemon", "code": 59551, "src": "fontawesome"}, {"uid": "6052fa7e25643f06a46dc7eedb5f596b", "css": "genderless", "code": 61997, "src": "fontawesome"}, {"uid": "cee894776000256eed076cb6bf06599e", "css": "y-combinator", "code": 62011, "src": "fontawesome"}, {"uid": "41cdd46ab935131f6dfea37a5b9e7add", "css": "optin-monster", "code": 62012, "src": "fontawesome"}, {"uid": "10e444e650c211fbcb6ae5e73671d94b", "css": "opencart", "code": 62013, "src": "fontawesome"}, {"uid": "653f72ed4ded6e41c93fd571970efe6f", "css": "expeditedssl", "code": 62014, "src": "fontawesome"}, {"uid": "69bd9dfe950d07d910f39c6988364e49", "css": "battery-4", "code": 62016, "src": "fontawesome"}, {"uid": "7ab4ec24078133effbc4e923b65ef835", "css": "battery-3", "code": 62017, "src": "fontawesome"}, {"uid": "e430a168b45ba40aa988ca1a5034a553", "css": "battery-2", "code": 62018, "src": "fontawesome"}, {"uid": "99f4ea74adc24022106932d84a49b055", "css": "battery-1", "code": 62019, "src": "fontawesome"}, {"uid": "9983d2489e028d659d196915a25ef3ca", "css": "battery-0", "code": 62020, "src": "fontawesome"}, {"uid": "12a80769cc7ac08e986deeafbe553054", "css": "mouse-pointer", "code": 62021, "src": "fontawesome"}, {"uid": "c4c41817bb8c088a8ec6d08784b33da7", "css": "i-cursor", "code": 62022, "src": "fontawesome"}, {"uid": "7aa8cc552d9d6d19815750fc339cf090", "css": "object-group", "code": 62023, "src": "fontawesome"}, {"uid": "d4edf8563d5cb3b5f654808aa4fe438a", "css": "object-ungroup", "code": 62024, "src": "fontawesome"}, {"uid": "c116c18983825a9b32a23a62fd18e1e6", "css": "sticky-note", "code": 62025, "src": "fontawesome"}, {"uid": "b9ca73befd583b2197a56a68045c9c0c", "css": "sticky-note-o", "code": 62026, "src": "fontawesome"}, {"uid": "69529d146afd305c4e34b7e3b9be7012", "css": "cc-jcb", "code": 62027, "src": "fontawesome"}, {"uid": "956f4ffb9483306d20278f271ad9da1e", "css": "cc-diners-club", "code": 62028, "src": "fontawesome"}, {"uid": "6846d155ad5bda456569df81f3057faa", "css": "clone", "code": 62029, "src": "fontawesome"}, {"uid": "ff1710a605b3fc98346903db89034558", "css": "balance-scale", "code": 62030, "src": "fontawesome"}, {"uid": "9dfee680431bb2f9cc4485bfa4d982ac", "css": "hourglass-o", "code": 62032, "src": "fontawesome"}, {"uid": "8bc4e828380b962c8b5a04ee982f1d71", "css": "hourglass-1", "code": 62033, "src": "fontawesome"}, {"uid": "f70af5dd0ecd154b007d980cd011a7f7", "css": "hourglass-2", "code": 62034, "src": "fontawesome"}, {"uid": "423dee39096bacea6b9e3b00919b983c", "css": "hourglass-3", "code": 62035, "src": "fontawesome"}, {"uid": "bc9b0a766409e4ddeb2e9745c3e8130c", "css": "hourglass", "code": 62036, "src": "fontawesome"}, {"uid": "c82f1ec71a2c9e5af8b00fe5fe27f57e", "css": "hand-grab-o", "code": 62037, "src": "fontawesome"}, {"uid": "abf08be829659c02d1f9a711daefa8ce", "css": "hand-paper-o", "code": 62038, "src": "fontawesome"}, {"uid": "dd0acda8a6217fd10e94d4feadccd90f", "css": "hand-scissors-o", "code": 62039, "src": "fontawesome"}, {"uid": "0eb9a32706e05e4f9f2561aa1bfbb7e9", "css": "hand-lizard-o", "code": 62040, "src": "fontawesome"}, {"uid": "7a8becfd21312643b7be5463583e7425", "css": "hand-spock-o", "code": 62041, "src": "fontawesome"}, {"uid": "18e30ad120ce4b15d7e5c797e4bf0ee8", "css": "hand-pointer-o", "code": 62042, "src": "fontawesome"}, {"uid": "31562b831ad0016b89ddf9693214041f", "css": "hand-peace-o", "code": 62043, "src": "fontawesome"}, {"uid": "c3ec0e8d143190ee85d404bd064bf8f4", "css": "trademark", "code": 62044, "src": "fontawesome"}, {"uid": "c3371cca5561d470f45ae0a9c485b7ec", "css": "registered", "code": 62045, "src": "fontawesome"}, {"uid": "e9b178b4a02c08399ca5ea10ba522528", "css": "creative-commons", "code": 62046, "src": "fontawesome"}, {"uid": "b37d0b43098feda6ef73a24dcf4fc58f", "css": "gg", "code": 62048, "src": "fontawesome"}, {"uid": "994cebef2d88a25f775b1b2b318f71c7", "css": "gg-circle", "code": 62049, "src": "fontawesome"}, {"uid": "fbc6facd27f744438410cbcad545bf52", "css": "tripadvisor", "code": 62050, "src": "fontawesome"}, {"uid": "2f87e74e6eb8d985044bf7f3c47cb50b", "css": "odnoklassniki", "code": 62051, "src": "fontawesome"}, {"uid": "b3ccbe22f1b25b3f3ecfd7096a7c9187", "css": "odnoklassniki-square", "code": 62052, "src": "fontawesome"}, {"uid": "685e1db17ba5c233b6ab38aed4084a24", "css": "get-pocket", "code": 62053, "src": "fontawesome"}, {"uid": "0b5f5c9abb1b4f21e75ff572955aa1de", "css": "wikipedia-w", "code": 62054, "src": "fontawesome"}, {"uid": "c5af9b4626c0f2fa6dc259f9f035b055", "css": "safari", "code": 62055, "src": "fontawesome"}, {"uid": "bd7fd67bed189448225cad0fe4ef3d7c", "css": "chrome", "code": 62056, "src": "fontawesome"}, {"uid": "c97bfbcfb31e74be0653d8551c89a40f", "css": "firefox", "code": 62057, "src": "fontawesome"}, {"uid": "52f734427edaded2af2fc050ac5d3554", "css": "opera", "code": 62058, "src": "fontawesome"}, {"uid": "c0a33f22eaeba6c843457bc23a7ab2a8", "css": "internet-explorer", "code": 62059, "src": "fontawesome"}, {"uid": "cfb6e143c0650c485536374f2a2f88fb", "css": "television", "code": 62060, "src": "fontawesome"}, {"uid": "a5c942b3315f858cd0fc1a34a1b0d1bb", "css": "contao", "code": 62061, "src": "fontawesome"}, {"uid": "baec122d16d314a0e0e66d5fb6b55a4b", "css": "500px", "code": 62062, "src": "fontawesome"}, {"uid": "efb5a384af4a5450b7c9acff76a85b8b", "css": "amazon", "code": 62064, "src": "fontawesome"}, {"uid": "e7eecc3cc44f3f4cad6229b202588308", "css": "calendar-plus-o", "code": 62065, "src": "fontawesome"}, {"uid": "e66ec405e2e1f3bec6546b4e776924d3", "css": "calendar-minus-o", "code": 62066, "src": "fontawesome"}, {"uid": "a027a2ce420dfd6b660212d5ac6a7cc9", "css": "calendar-times-o", "code": 62067, "src": "fontawesome"}, {"uid": "9de4ac1aec6b1cca1929e1407eecf3db", "css": "calendar-check-o", "code": 62068, "src": "fontawesome"}, {"uid": "31efa81b26fa5a380119c95d6b831d6d", "css": "industry", "code": 62069, "src": "fontawesome"}, {"uid": "8b4584b43f9858f2d38b3741ecdfe15c", "css": "map-pin", "code": 62070, "src": "fontawesome"}, {"uid": "94aa5db477515f1da4ce43b239badb9e", "css": "map-signs", "code": 62071, "src": "fontawesome"}, {"uid": "c62cbc7fa604e32cc19731a3bb29be79", "css": "map-o", "code": 62072, "src": "fontawesome"}, {"uid": "79beb8c7fcd56e1985b70e9a120cbcbf", "css": "map", "code": 62073, "src": "fontawesome"}, {"uid": "53c28626072159c49f33b71d67138ad9", "css": "commenting", "code": 62074, "src": "fontawesome"}, {"uid": "9cc990bbcac7aa8504078b3f49df79b1", "css": "commenting-o", "code": 62075, "src": "fontawesome"}, {"uid": "52ee4b2769437c85066253217b23c265", "css": "houzz", "code": 62076, "src": "fontawesome"}, {"uid": "6b44ce2430177c5b05a1d1575ccaaf5c", "css": "vimeo", "code": 62077, "src": "fontawesome"}, {"uid": "7b610e9b9c75f602f9006ce645986c8c", "css": "black-tie", "code": 62078, "src": "fontawesome"}, {"uid": "dab8d5c8dbacfa8b2c310a7aa97a28da", "css": "fonticons", "code": 62080, "src": "fontawesome"}, {"uid": "f08ba9f0e8f9b426a92efcaa59c1e932", "css": "reddit-alien", "code": 62081, "src": "fontawesome"}, {"uid": "03957a1f03b5ae5dfac6e5027d893157", "css": "edge", "code": 62082, "src": "fontawesome"}, {"uid": "7ea4150d9eb2d2ade9491d5ad905718c", "css": "credit-card-alt", "code": 62083, "src": "fontawesome"}, {"uid": "b649f3c065f335b126ec3eb3ac78759b", "css": "codiepie", "code": 62084, "src": "fontawesome"}, {"uid": "e3a73480599b09c84f6657ef2e081abd", "css": "modx", "code": 62085, "src": "fontawesome"}, {"uid": "fc649ed0a69a0a1916ac6d5125234183", "css": "fort-awesome", "code": 62086, "src": "fontawesome"}, {"uid": "21e7025c85a7eeae71fd3539855afe2b", "css": "usb", "code": 62087, "src": "fontawesome"}, {"uid": "26eb5e234f87bad251fdd8e285b6fae7", "css": "product-hunt", "code": 62088, "src": "fontawesome"}, {"uid": "e6eeb1a403c52c3f981eb19646021691", "css": "mixcloud", "code": 62089, "src": "fontawesome"}, {"uid": "5c6ee0240a4b7b2b8674ec1f0ca8886d", "css": "scribd", "code": 62090, "src": "fontawesome"}, {"uid": "9c0fabd22e5b65b3ef7ed847eb864bcb", "css": "pause-circle", "code": 62091, "src": "fontawesome"}, {"uid": "4ae8cbc2c1329cb5dbe6e6995d8c68be", "css": "pause-circle-o", "code": 62092, "src": "fontawesome"}, {"uid": "3363990fa5a224d75ed1740e1ec50bb6", "css": "stop-circle", "code": 62093, "src": "fontawesome"}, {"uid": "5434b2bf3a3a6c4c260a11a386e3f5d1", "css": "stop-circle-o", "code": 62094, "src": "fontawesome"}, {"uid": "d531ea7e8c094b73df941ed0bac921f3", "css": "shopping-bag", "code": 62096, "src": "fontawesome"}, {"uid": "90e0aff5c929e444038355746a952aaf", "css": "shopping-basket", "code": 62097, "src": "fontawesome"}, {"uid": "090c79ed8971e478a27fae8a3eb3eb11", "css": "hashtag", "code": 62098, "src": "fontawesome"}, {"uid": "fb15371451b9110f93afcaa70d6ea98d", "css": "bluetooth", "code": 62099, "src": "fontawesome"}, {"uid": "9a0873ae5167deefbf38061b7cddbe34", "css": "bluetooth-b", "code": 62100, "src": "fontawesome"}, {"uid": "2c452255d4fed51ef0a6ef86436a7d08", "css": "percent", "code": 62101, "src": "fontawesome"}, {"uid": "7cca4643f1e938c673e91c0c78058ddf", "css": "gitlab", "code": 62102, "src": "fontawesome"}, {"uid": "4be3f9da1280527c2a1f41fbf34ad4c4", "css": "wpbeginner", "code": 62103, "src": "fontawesome"}, {"uid": "a41cabcd11152063a37f2407048c5494", "css": "wpforms", "code": 62104, "src": "fontawesome"}, {"uid": "40177cc6c35597ea3422673689409152", "css": "envira", "code": 62105, "src": "fontawesome"}, {"uid": "caeb3b38733e4cf2702a50d3c7c4ee6f", "css": "universal-access", "code": 62106, "src": "fontawesome"}, {"uid": "9729f562bc9df27c93250f66c1a1b2f3", "css": "wheelchair-alt", "code": 62107, "src": "fontawesome"}, {"uid": "9c9f0a69d4abbeb5ff9d779df7679356", "css": "question-circle-o", "code": 62108, "src": "fontawesome"}, {"uid": "cce5e05853d0798a4d10077ef613387c", "css": "blind", "code": 62109, "src": "fontawesome"}, {"uid": "472c1b83f2e156e20280a4854e1cfa69", "css": "audio-description", "code": 62110, "src": "fontawesome"}, {"uid": "ed42a2d393650165b737216b5fe85c40", "css": "volume-control-phone", "code": 62112, "src": "fontawesome"}, {"uid": "a0e6549c693b73d4fe92b1db1824b919", "css": "braille", "code": 62113, "src": "fontawesome"}, {"uid": "2e0a6d93466b3f1b0fc90c15b2aff13f", "css": "assistive-listening-systems", "code": 62114, "src": "fontawesome"}, {"uid": "ecc56ff0652abe04c23b4f5d736ed506", "css": "american-sign-language-interpreting", "code": 62115, "src": "fontawesome"}, {"uid": "0e393c5fb8776a60df0d71b5ee46ca44", "css": "asl-interpreting", "code": 62116, "src": "fontawesome"}, {"uid": "dc6cb47e30d3ca4fd06c8cbf9248692f", "css": "glide", "code": 62117, "src": "fontawesome"}, {"uid": "2a3fc031662edd118ba3c2e2f8564aef", "css": "glide-g", "code": 62118, "src": "fontawesome"}, {"uid": "67b150662a25d2c6d556d23d721b9569", "css": "sign-language", "code": 62119, "src": "fontawesome"}, {"uid": "440e5cbb0f604b4be0c0183e63a0cde3", "css": "low-vision", "code": 62120, "src": "fontawesome"}, {"uid": "7eed62ae3352efe006c173a890f44d45", "css": "viadeo", "code": 62121, "src": "fontawesome"}, {"uid": "52328217db1b956669bc214cd7c64dcc", "css": "viadeo-square", "code": 62122, "src": "fontawesome"}, {"uid": "cab8b1ea47d71c77413157c592db2293", "css": "snapchat", "code": 62123, "src": "fontawesome"}, {"uid": "1b1a592d33fa26c37926cbe840eb60b8", "css": "snapchat-ghost", "code": 62124, "src": "fontawesome"}, {"uid": "d20b5fb608f848b0e14aef1325c9e23c", "css": "snapchat-square", "code": 62125, "src": "fontawesome"}, {"uid": "caa1c8d19cb3f0b7641eb59828bd50bb", "css": "pied-piper", "code": 62126, "src": "fontawesome"}, {"uid": "80b02191b84eb4ea4516adc83330d7b3", "css": "first-order", "code": 62128, "src": "fontawesome"}, {"uid": "cc0c348dee522c0f93e3287dccaf2b8f", "css": "yoast", "code": 62129, "src": "fontawesome"}, {"uid": "67c726a4267687f5061ebaa1bbdf1c79", "css": "themeisle", "code": 62130, "src": "fontawesome"}, {"uid": "2342c9255e31850fcf5f89799cb8420f", "css": "google-plus-circle", "code": 62131, "src": "fontawesome"}, {"uid": "3c8e3fe48360de90a1ff1267411aae88", "css": "font-awesome", "code": 62132, "src": "fontawesome"}, {"uid": "9fecfcfe680a469caedeeb40641a479f", "css": "handshake-o", "code": 62133, "src": "fontawesome"}, {"uid": "f89739d9df5c9e70ece9be9cdf66abb6", "css": "envelope-open", "code": 62134, "src": "fontawesome"}, {"uid": "57ae6bdecc7044555daa84354a8dfe49", "css": "envelope-open-o", "code": 62135, "src": "fontawesome"}, {"uid": "0259fec71de1f22e70877ca024b634fd", "css": "linode", "code": 62136, "src": "fontawesome"}, {"uid": "15899c11210bc9f45fc15a507789f6be", "css": "address-book", "code": 62137, "src": "fontawesome"}, {"uid": "693e13611b84512c92e6115e0c31934d", "css": "address-book-o", "code": 62138, "src": "fontawesome"}, {"uid": "79d27b578931fd441a6dc885c9dd88a6", "css": "address-card", "code": 62139, "src": "fontawesome"}, {"uid": "68eb56470b836f19335231578515153e", "css": "address-card-o", "code": 62140, "src": "fontawesome"}, {"uid": "818981e2ad316f18ae61cfa805d41309", "css": "user-circle", "code": 62141, "src": "fontawesome"}, {"uid": "3fce1eca43f917c8f23e532749abae5d", "css": "user-circle-o", "code": 62142, "src": "fontawesome"}, {"uid": "b86df50a2d898bfcd371fa86c0b8b2fb", "css": "user-o", "code": 62144, "src": "fontawesome"}, {"uid": "b2cc036e1ba44934896c345436ac44d1", "css": "id-badge", "code": 62145, "src": "fontawesome"}, {"uid": "37b41cdae5ec9dab40e0c5bfff8a0ec8", "css": "id-card", "code": 62146, "src": "fontawesome"}, {"uid": "2e6301ac94d0d51566727b9199259451", "css": "id-card-o", "code": 62147, "src": "fontawesome"}, {"uid": "2726ee8140faa11aba6a4183a8a8b903", "css": "quora", "code": 62148, "src": "fontawesome"}, {"uid": "8dc7142e4848751b5d2b0200ba77b991", "css": "free-code-camp", "code": 62149, "src": "fontawesome"}, {"uid": "531359183f9fedb14b23666f1308591f", "css": "telegram", "code": 62150, "src": "fontawesome"}, {"uid": "07c8bfac1a39b6c62bc83e23a3c4b706", "css": "thermometer", "code": 62151, "src": "fontawesome"}, {"uid": "d7ef51ac5d8223e1c4e6551b833a6b44", "css": "thermometer-3", "code": 62152, "src": "fontawesome"}, {"uid": "c22930d29b554d41c0ef882aafd3f8c9", "css": "thermometer-2", "code": 62153, "src": "fontawesome"}, {"uid": "f50506878717cd58f94b689daa79bfae", "css": "thermometer-quarter", "code": 62154, "src": "fontawesome"}, {"uid": "bc89c320cf57f6c88f1ae7248e12a28f", "css": "thermometer-0", "code": 62155, "src": "fontawesome"}, {"uid": "71abe0fa648a63c00b5222c37345b38c", "css": "shower", "code": 62156, "src": "fontawesome"}, {"uid": "5d24e595104bfd7117db134253fc9ca1", "css": "bath", "code": 62157, "src": "fontawesome"}, {"uid": "af4312b5501867fa089ec3afeece5630", "css": "podcast", "code": 62158, "src": "fontawesome"}, {"uid": "07f0832c07f3d9713fffb06c8bffa027", "css": "window-maximize", "code": 62160, "src": "fontawesome"}, {"uid": "04f022b8bd044d4ccfffd3887ff72088", "css": "window-minimize", "code": 62161, "src": "fontawesome"}, {"uid": "d0e62145dbf40f30e47b3819b8b43a8f", "css": "window-restore", "code": 62162, "src": "fontawesome"}, {"uid": "7394501fc0b17cb7bda99538f92e26d6", "css": "window-close", "code": 62163, "src": "fontawesome"}, {"uid": "316d3c537e21cb6b56c466bb615b32e6", "css": "window-close-o", "code": 62164, "src": "fontawesome"}, {"uid": "50eb1aca5fe19bd9eaa1257117cb0419", "css": "bandcamp", "code": 62165, "src": "fontawesome"}, {"uid": "527f48749d1d339c73a09fd5f12f77c0", "css": "grav", "code": 62166, "src": "fontawesome"}, {"uid": "0abcdfbaa2ece1cbd5a7896e8cfc4668", "css": "etsy", "code": 62167, "src": "fontawesome"}, {"uid": "eea8064584ca4397576380d9de87bfc3", "css": "imdb", "code": 62168, "src": "fontawesome"}, {"uid": "aa34496baad01bf631deaf33a2acbf85", "css": "ravelry", "code": 62169, "src": "fontawesome"}, {"uid": "4f0e633d65949512c49f9a95c959b5a0", "css": "eercast", "code": 62170, "src": "fontawesome"}, {"uid": "1cb3652ffb3492344fa3a675c3ff3290", "css": "microchip", "code": 62171, "src": "fontawesome"}, {"uid": "56f2eac13d2b397ff4a54dc38f783b95", "css": "snowflake-o", "code": 62172, "src": "fontawesome"}, {"uid": "d38d01d4665f7aaaaddd789800ef7669", "css": "superpowers", "code": 62173, "src": "fontawesome"}, {"uid": "74195f8d61ee77a2ba6df97c9ace11e8", "css": "wpexplorer", "code": 62174, "src": "fontawesome"}, {"uid": "322a3317bf081dd6a78d5d6a620e1dd5", "css": "meetup", "code": 62176, "src": "fontawesome"}]}	qqh_sjxt/fontello-319b939c	2	f
\.


--
-- Data for Name: cmsplugin_cascade_inline; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cmsplugin_cascade_inline (id, glossary, cascade_element_id) FROM stdin;
1	{\n    "title": "Weltladen Baden",\n    "use_icon": false,\n    "marker_image": null,\n    "marker_width": "",\n    "marker_anchor": {},\n    "popup_text": "<address>2500 Baden, Hauptplatz 9-13</address>",\n    "position": {\n        "lat": 48.007639839583916,\n        "lng": 16.23490691184998\n    }\n}	771
4	{\n    "title": "Weltladen Baden",\n    "use_icon": false,\n    "marker_image": null,\n    "marker_width": "",\n    "marker_anchor": {},\n    "popup_text": "<address>2500 Baden, Hauptplatz 9-13</address>",\n    "position": {\n        "lat": 48.007639839583916,\n        "lng": 16.23490691184998\n    }\n}	789
\.


--
-- Data for Name: cmsplugin_cascade_page; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cmsplugin_cascade_page (id, settings, glossary, extended_object_id, public_extension_id, icon_font_id, menu_symbol) FROM stdin;
1	{}	{\n    "element_ids": {\n        "727": ""\n    }\n}	9	2	\N	\N
2	{}	{\n    "element_ids": {\n        "727": ""\n    }\n}	10	\N	\N	\N
3	{}	{\n    "element_ids": {\n        "737": ""\n    }\n}	5	4	\N	\N
4	{}	{\n    "element_ids": {\n        "737": ""\n    }\n}	6	\N	\N	\N
5	{}	{\n    "element_ids": {\n        "770": ""\n    }\n}	41	6	\N	\N
6	{}	{\n    "element_ids": {\n        "770": ""\n    }\n}	42	\N	\N	\N
7	{}	{\n    "element_ids": {\n        "918": ""\n    }\n}	7	8	\N	\N
8	{}	{\n    "element_ids": {\n        "918": ""\n    }\n}	8	\N	\N	\N
9	{}	{\n    "element_ids": {\n        "112": ""\n    }\n}	19	10	\N	\N
10	{}	{\n    "element_ids": {\n        "112": ""\n    }\n}	20	\N	\N	\N
11	{}	{\n    "element_ids": {\n        "459": ""\n    }\n}	39	12	\N	\N
12	{}	{\n    "element_ids": {\n        "459": ""\n    }\n}	40	\N	\N	\N
13	{}	{\n    "element_ids": {\n        "197": "",\n        "202": ""\n    }\n}	23	14	\N	\N
14	{}	{\n    "element_ids": {\n        "197": "",\n        "202": ""\n    }\n}	24	\N	\N	\N
\.


--
-- Data for Name: cmsplugin_cascade_pluginextrafields; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cmsplugin_cascade_pluginextrafields (id, plugin_type, allow_id_tag, css_classes, inline_styles, site_id) FROM stdin;
1	SimpleIconPlugin	f	{"class_names": "nav-link", "multiple": ""}	{"extra_fields:Margins": [], "extra_units:Margins": "px,em,rem,%", "extra_fields:Paddings": [], "extra_units:Paddings": "px,em,rem,%", "extra_fields:Widths": [], "extra_units:Widths": "px,em,rem,%", "extra_fields:Heights": [], "extra_units:Heights": "px,em,rem,%", "extra_fields:Text Alignement": [], "extra_fields:Font Size": [], "extra_units:Font Size": "px,em,rem,%", "extra_fields:Line Height": [], "extra_fields:Colors": [], "extra_fields:Overflow": []}	1
\.


--
-- Data for Name: cmsplugin_cascade_sharedglossary; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cmsplugin_cascade_sharedglossary (id, plugin_type, identifier, glossary) FROM stdin;
\.


--
-- Data for Name: cmsplugin_cascade_sortinline; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cmsplugin_cascade_sortinline (id, glossary, "order", cascade_element_id) FROM stdin;
1	{\n    "product": {\n        "model": "weltladen.weltladenproduct",\n        "pk": 2\n    }\n}	1	1156
2	{\n    "product": {\n        "model": "weltladen.weltladenproduct",\n        "pk": 6\n    }\n}	2	1156
3	{\n    "product": {\n        "model": "weltladen.weltladenproduct",\n        "pk": 5\n    }\n}	3	1156
4	{\n    "product": {\n        "model": "weltladen.weltladenproduct",\n        "pk": 4\n    }\n}	4	1156
5	{\n    "product": {\n        "model": "weltladen.weltladenproduct",\n        "pk": 3\n    }\n}	5	1156
6	{\n    "product": {\n        "model": "weltladen.weltladenproduct",\n        "pk": 2\n    }\n}	1	1166
7	{\n    "product": {\n        "model": "weltladen.weltladenproduct",\n        "pk": 6\n    }\n}	2	1166
8	{\n    "product": {\n        "model": "weltladen.weltladenproduct",\n        "pk": 5\n    }\n}	3	1166
9	{\n    "product": {\n        "model": "weltladen.weltladenproduct",\n        "pk": 4\n    }\n}	4	1166
10	{\n    "product": {\n        "model": "weltladen.weltladenproduct",\n        "pk": 3\n    }\n}	5	1166
\.


--
-- Data for Name: cmsplugin_cascade_texteditorconfigfields; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cmsplugin_cascade_texteditorconfigfields (id, name, element_type, css_classes) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2020-04-26 20:36:51.71715+02	4	markus	2	[{"changed": {"fields": ["first_name", "last_name"]}}, {"changed": {"name": "weltladen customer", "object": "+markus.mohanty@gmail.com", "fields": ["salutation"]}}]	117	4
2	2020-04-26 20:38:51.411216+02	1	EZA	1	[{"added": {}}]	122	4
3	2020-04-26 20:38:56.036575+02	1	EZA	1	[{"added": {}}]	133	4
4	2020-04-26 20:39:56.601134+02	2	Schokoeier	1	[{"added": {}}]	135	4
5	2020-04-26 21:09:06.445014+02	2	Schokoeier	2	[{"changed": {"fields": ["short_description", "description"]}}, {"added": {"name": "Product Image", "object": "ProductImage object (1)"}}, {"added": {"name": "Product Image", "object": "ProductImage object (2)"}}]	135	4
6	2020-04-26 22:13:03.981765+02	633		3		79	4
7	2020-04-26 22:13:08.385158+02	634		3		79	4
8	2020-04-26 22:13:12.218197+02	635		3		79	4
9	2020-04-26 22:13:15.798414+02	636		3		79	4
10	2020-04-26 22:13:19.933504+02	637		3		79	4
11	2020-04-26 22:13:51.202748+02	638		3		79	4
12	2020-04-26 22:13:55.435625+02	1	Home	2		2	4
13	2020-04-26 22:21:24.617269+02	3	2020-00003	2	[{"added": {"name": "Order payment", "object": "Payment ID: 1"}}]	123	4
14	2020-04-26 22:21:30.24051+02	3	2020-00003	2	[{"changed": {"fields": ["status"]}}]	123	4
15	2020-04-26 22:21:33.949184+02	3	2020-00003	2	[{"changed": {"fields": ["status"]}}]	123	4
16	2020-04-26 22:21:38.462231+02	3	2020-00003	2	[]	123	4
17	2020-04-26 22:21:42.669435+02	3	2020-00003	2	[]	123	4
18	2020-04-26 22:22:24.730748+02	3	2020-00003	2	[{"changed": {"fields": ["status"]}}, {"changed": {"name": "Order payment", "object": "Payment ID: 1", "fields": ["amount"]}}]	123	4
19	2020-04-26 22:22:27.694462+02	3	2020-00003	2	[]	123	4
20	2020-04-26 22:22:32.002713+02	3	2020-00003	2	[{"changed": {"fields": ["status"]}}]	123	4
21	2020-04-26 22:22:37.837163+02	3	2020-00003	2	[{"changed": {"fields": ["status"]}}]	123	4
22	2020-04-26 22:22:40.281028+02	3	2020-00003	2	[{"changed": {"fields": ["status"]}}]	123	4
23	2020-04-26 22:23:02.483335+02	3	2020-00003	2	[{"changed": {"name": "Delivery", "object": "Delivery ID: 1", "fields": ["shipping_id"]}}]	123	4
24	2020-04-26 22:23:06.899224+02	3	2020-00003	2	[{"changed": {"fields": ["status"]}}, {"changed": {"name": "Delivery", "object": "Delivery ID: 1", "fields": []}}]	123	4
25	2020-04-26 22:23:10.178151+02	3	2020-00003	2	[{"changed": {"name": "Delivery", "object": "Delivery ID: 1", "fields": []}}]	123	4
26	2020-04-27 21:13:47.883376+02	1	Home	2		2	4
27	2020-04-27 21:14:20.310872+02	5	Imprint	2	[{"changed": {"fields": ["title", "slug"]}}]	2	4
28	2020-04-27 21:14:42.67843+02	7	Terms and Conditions	2	[{"changed": {"fields": ["title", "slug"]}}]	2	4
29	2020-04-27 21:14:57.146334+02	9	Privacy Protection	2	[{"changed": {"fields": ["title", "slug"]}}]	2	4
30	2020-04-27 21:15:20.732453+02	31	Register Customer	2	[{"changed": {"fields": ["title", "slug"]}}]	2	4
31	2020-04-27 21:15:44.223296+02	33	Request Password Reset	2	[{"changed": {"fields": ["title", "slug"]}}]	2	4
32	2020-04-27 21:15:49.786889+02	31	Registrieren	2		2	4
33	2020-04-27 21:15:59.217842+02	33	Passwort zurücksetzen	2		2	4
34	2020-04-27 21:16:04.556201+02	5	Impressum	2		2	4
35	2020-04-27 21:16:09.575499+02	7	AGBs	2		2	4
36	2020-04-27 21:16:12.988626+02	9	Datenschutzvereinbarung+	2		2	4
37	2020-04-27 21:16:19.160528+02	9	Privacy Protection	2	[{"changed": {"fields": ["title"]}}]	2	4
38	2020-04-27 21:16:22.625071+02	9	Datenschutzvereinbarung	2		2	4
39	2020-04-27 21:16:41.081077+02	23	Your Orders	2	[{"changed": {"fields": ["title"]}}]	2	4
40	2020-04-27 21:17:00.323412+02	25	Personal Details	2	[{"changed": {"fields": ["title"]}}]	2	4
41	2020-04-27 21:17:12.892117+02	27	Change Password	2	[{"changed": {"fields": ["title"]}}]	2	4
42	2020-04-27 21:17:18.555232+02	23	Bestellungen	2		2	4
43	2020-04-27 21:17:22.116552+02	25	Über mich	2		2	4
44	2020-04-27 21:17:26.32563+02	27	Passwort ändern	2		2	4
45	2020-04-27 21:22:18.762713+02	9	Datenschutzvereinbarung	2		2	4
46	2020-04-27 21:29:41.383328+02	5	Impressum	2		2	4
47	2020-04-27 21:32:28.17041+02	5	Impressum	2		2	4
48	2020-04-27 21:36:39.563204+02	41	Kontakt	1	[{"added": {}}]	2	4
49	2020-04-27 21:36:53.519096+02	41	Kontakt	2	[{"changed": {"fields": ["soft_root", "xframe_options"]}}]	2	4
50	2020-04-27 21:37:07.040042+02	41	Kontakt	2		2	4
51	2020-04-27 21:37:23.244962+02	43	Kontakt	1	[{"added": {}}]	2	4
52	2020-04-27 21:37:29.680501+02	43	Kontakt	2		2	4
53	2020-04-27 21:39:01.169648+02	41	Kontakt	2	[{"changed": {"fields": ["reverse_id", "xframe_options"]}}]	2	4
54	2020-04-27 21:39:05.384858+02	41	Kontakt	2		2	4
55	2020-04-27 21:39:44.48008+02	41	Kontakt	2		2	4
56	2020-04-27 21:47:46.508683+02	41	Kontakt	2		2	4
57	2020-04-27 21:48:13.534842+02	41	Kontakt	2		2	4
58	2020-04-27 21:49:35.187196+02	41	Kontakt	2		2	4
59	2020-04-27 21:54:12.358574+02	45	Social Media	1	[{"added": {}}]	2	4
60	2020-04-27 21:54:27.480311+02	45	Social Media	2	[{"changed": {"fields": ["reverse_id", "soft_root", "xframe_options"]}}]	2	4
61	2020-04-27 21:54:58.514496+02	45	Social Media	2		2	4
62	2020-04-27 21:55:39.029466+02	45	Social Media	3		2	4
63	2020-04-27 21:58:03.114003+02	1	Home	2		2	4
64	2020-04-27 21:58:46.354802+02	47	Nachricht an uns	1	[{"added": {}}]	2	4
65	2020-04-27 21:58:50.283945+02	47	Nachricht an uns	2		2	4
66	2020-04-27 21:59:38.688288+02	47	Nachricht an uns	2	[]	2	4
67	2020-04-27 21:59:45.022702+02	47	Nachricht an uns	2	[]	2	4
68	2020-04-27 22:00:52.50492+02	47	Nachricht an uns	2		2	4
69	2020-04-28 20:03:00.678909+02	99	Main Content	3		1	4
70	2020-04-28 20:03:03.693582+02	47	Nachricht an uns	2		2	4
71	2020-04-28 20:37:22.167+02	47	Nachricht an uns	2		2	4
72	2020-04-29 19:42:10.647485+02	3	Tee	1	[{"added": {}}]	135	4
73	2020-04-29 19:42:52.35982+02	4	Reis	1	[{"added": {}}]	135	4
74	2020-04-29 19:43:35.973566+02	5	Seife	1	[{"added": {}}]	135	4
75	2020-04-29 19:44:34.72253+02	6	Honig	1	[{"added": {}}]	135	4
76	2020-04-29 20:24:52.402977+02	65	None	3		46	4
77	2020-04-29 20:24:54.825982+02	15	Catalog	2		2	4
78	2020-04-29 20:25:16.751291+02	1	Home	2		2	4
79	2020-04-29 20:25:37.819005+02	15	Catalog	2	[{"changed": {"fields": ["title", "slug"]}}]	2	4
80	2020-04-29 20:25:46.62427+02	15	Onlineshop	2		2	4
81	2020-04-29 20:33:11.545728+02	73	None	3		46	4
82	2020-04-29 20:33:15.221452+02	15	Catalog	2		2	4
83	2020-04-29 20:36:53.375009+02	4	markus	2	[]	117	4
84	2020-04-29 20:37:07.978684+02	3	<anonymous>	3		117	4
85	2020-04-29 20:37:07.9862+02	5	<anonymous>	3		117	4
86	2020-04-29 20:37:07.988734+02	6	<anonymous>	3		117	4
87	2020-04-29 20:37:07.990673+02	7	<anonymous>	3		117	4
88	2020-04-29 20:37:07.992396+02	8	<anonymous>	3		117	4
89	2020-04-29 20:45:34.157472+02	4	markus	2	[]	117	4
90	2020-04-29 20:54:15.840382+02	838	with 2 columns	3		36	4
91	2020-04-29 20:59:54.165938+02	1	Home	2		2	4
92	2020-04-29 21:00:38.171727+02	1	Home	2		2	4
93	2020-04-29 21:18:00.140232+02	1	Home	2	Die En Seite "Home" wurde erfolgreich auf nicht öffentlich gesetzt	2	4
94	2020-04-29 21:18:04.77412+02	3	Legal	2	Die En Seite "Legal" wurde erfolgreich auf nicht öffentlich gesetzt	2	4
95	2020-04-29 21:18:09.326872+02	11	Personal Pages	2	Die En Seite "Personal Pages" wurde erfolgreich auf nicht öffentlich gesetzt	2	4
96	2020-04-29 21:18:13.946152+02	13	Join Us	2	Die En Seite "Join Us" wurde erfolgreich auf nicht öffentlich gesetzt	2	4
97	2020-04-29 21:18:18.526363+02	15	Onlineshop	2	Die En Seite "Onlineshop" wurde erfolgreich auf nicht öffentlich gesetzt	2	4
98	2020-04-29 21:18:24.027029+02	17	Search	2	Die En Seite "Search" wurde erfolgreich auf nicht öffentlich gesetzt	2	4
99	2020-04-29 21:18:31.12343+02	19	Cart	2	Die En Seite "Cart" wurde erfolgreich auf nicht öffentlich gesetzt	2	4
100	2020-04-29 21:18:36.187588+02	21	Watch-List	2	Die En Seite "Watch-List" wurde erfolgreich auf nicht öffentlich gesetzt	2	4
101	2020-04-29 21:18:40.741451+02	35	Confirm Password Reset	2	Die En Seite "Confirm Password Reset" wurde erfolgreich auf nicht öffentlich gesetzt	2	4
102	2020-04-29 21:18:47.109205+02	35	Confirm Password Reset	2		2	4
103	2020-04-29 21:18:52.082953+02	21	Watch-List	2		2	4
104	2020-04-29 21:18:57.486708+02	19	Cart	2		2	4
105	2020-04-29 21:44:48.270204+02	5	Impressum	2	Die En Seite "Impressum" wurde erfolgreich auf nicht öffentlich gesetzt	2	4
106	2020-04-30 19:46:41.302532+02	7	AGBs	2		2	4
107	2020-04-30 19:47:34.778965+02	19	Cart	2		2	4
108	2020-04-30 19:48:30.476366+02	39	Checkout	2		2	4
109	2020-04-30 19:50:18.300433+02	39	Checkout	2		2	4
110	2020-04-30 19:51:10.471596+02	39	Checkout	2		2	4
111	2020-04-30 19:52:43.979822+02	39	Checkout	2		2	4
112	2020-04-30 19:54:40.17814+02	23	Bestellungen	2		2	4
113	2020-04-30 19:57:32.282928+02	8	Blue_SDHC_Class4_Front_4GB.png	3		106	4
114	2020-04-30 19:57:32.305034+02	9	Blue_SDHC_Class4_Front_8GB.png	3		106	4
115	2020-04-30 19:57:32.332274+02	10	Blue_SDHC_Class4_Front_16GB-retina.png	3		106	4
116	2020-04-30 19:57:32.358374+02	11	Blue_SDHC_Class4_Front_32GB-retina.png	3		106	4
117	2020-04-30 19:57:32.372582+02	12	Blue_SDXC_Class4_Front_64GB-retina.png	3		106	4
118	2020-04-30 19:57:32.402368+02	13	ExtremePLUS_microSDHC_U3_16GB-retina.png	3		106	4
119	2020-04-30 19:57:32.433899+02	14	ExtremePLUS_microSDHC_U3_32GB-retina.png	3		106	4
120	2020-04-30 19:57:32.462789+02	15	ExtremePLUS_microSDHC_U3_64GB-retina.png	3		106	4
121	2020-04-30 19:57:32.479421+02	16	ExtremePLUS_SDHC_U3_Front_16GB-retina.png	3		106	4
122	2020-04-30 19:57:32.509877+02	17	ExtremePLUS_SDHC_U3_Front_32GB-retina.png	3		106	4
123	2020-04-30 19:57:32.526521+02	18	ExtremePLUS_SDXC_U3_Front_64GB-retina.png	3		106	4
124	2020-04-30 19:57:32.556478+02	19	ExtremePRO_microSDHC_U3_16GB-retina.png	3		106	4
125	2020-04-30 19:57:32.571187+02	20	ExtremePRO_microSDHC_U3_32GB-retina.png	3		106	4
126	2020-04-30 19:57:32.600846+02	21	ExtremePRO_microSDXC_U3_64GB-retina.png	3		106	4
127	2020-04-30 19:57:32.630828+02	22	ExtremePRO_SDHC_280MBs_NoClass_Front_16GB-retina.png	3		106	4
128	2020-04-30 19:57:32.661097+02	23	ExtremePRO_SDHC_280MBs_NoClass_Front_32GB-retina.png	3		106	4
129	2020-04-30 19:57:32.689975+02	24	ExtremePRO_SDHC_U3_Front_32GB-retina.png	3		106	4
130	2020-04-30 19:57:32.70723+02	25	ExtremePRO_SDXC_280MBs_NoClass_Front_64GB-retina.png	3		106	4
131	2020-04-30 19:57:32.720629+02	26	ExtremePRO_SDXC_U3_Front_64GB-retina.png	3		106	4
132	2020-04-30 19:57:32.736315+02	27	ExtremePRO_SDXC_U3_Front_128GB-retina.png	3		106	4
133	2020-04-30 19:57:32.752837+02	28	ExtremePRO_SDXC_U3_Front_256GB-retina.png	3		106	4
134	2020-04-30 19:57:32.781715+02	29	ExtremePRO_SDXC_U3_Front_512GB-retina.png	3		106	4
135	2020-04-30 19:57:32.796923+02	30	Ultra_SDHC_40MBs_Class10_Front_8GB-retina.png	3		106	4
136	2020-04-30 19:57:32.813524+02	31	Ultra_SDHC_40MBs_Class10_Front_16GB-retina.png	3		106	4
137	2020-04-30 19:57:32.828296+02	32	Ultra_SDHC_40MBs_Class10_Front_32GB-retina.png	3		106	4
138	2020-04-30 19:57:32.843337+02	33	Ultra_SDHC_UHS1_C10_30MBs_Front_16GB.png	3		106	4
139	2020-04-30 19:57:32.857207+02	34	Ultra_SDHC_UHS1_C10_30MBs_Front_32GB.png	3		106	4
140	2020-04-30 19:57:32.87412+02	35	Ultra_SDXC_40MBs_Class10_Front_64GB-retina.png	3		106	4
141	2020-04-30 19:57:32.887733+02	36	Ultra_SDXC_40MBs_Class10_Front_128GB-retina.png	3		106	4
142	2020-04-30 19:57:32.903509+02	37	Ultra_SDXC_UHS1_C10_30MBs_Front_64GB.png	3		106	4
143	2020-04-30 19:57:32.918913+02	38	UltraPLUS_microSDHC_UHS-I_U1_16GB.png	3		106	4
144	2020-04-30 19:57:32.93457+02	39	UltraPLUS_microSDHC_UHS-I_U1_32GB.png	3		106	4
145	2020-04-30 19:57:32.949291+02	40	UltraPLUS_microSDXC_UHS-I_U1_64GB.png	3		106	4
146	2020-04-30 19:57:32.964643+02	41	UltraPLUS_microSDXC_UHS-I_U1_128GB.png	3		106	4
147	2020-04-30 19:57:32.981816+02	42	UltraPLUS_SDHC_48MBs_Class10_Front_16GB.png	3		106	4
148	2020-04-30 19:57:32.99605+02	43	UltraPLUS_SDXC_48MBs_Class10_Front_64GB.png	3		106	4
149	2020-04-30 19:57:33.010488+02	44	ExtremePRO_SDHC_U3_Front_16GB.png	3		106	4
150	2020-04-30 19:57:33.028755+02	45	Ultra_SDXC_UHS1_C10_30MBs_Front_64GB.png	3		106	4
151	2020-04-30 19:57:33.060935+02	46	UltraPLUS_SDHC_48MBs_Class10_Front_32GB.png	3		106	4
152	2020-04-30 19:57:33.076974+02	47	UltraPLUS_SDXC_48MBs_Class10_Front_128GB.png	3		106	4
153	2020-04-30 19:57:33.093242+02	50	Kyocera-Hydro-Edge-front.png	3		106	4
154	2020-04-30 19:57:33.108903+02	51	Kyocera-Hydro-Edge-back.png	3		106	4
155	2020-04-30 19:57:33.124943+02	52	Nexus-4-front.png	3		106	4
156	2020-04-30 19:57:33.139491+02	53	Nexus-4-diagonal.png	3		106	4
157	2020-04-30 19:57:33.154975+02	54	Nexus-4-side.png	3		106	4
158	2020-04-30 19:57:33.169967+02	55	Nexus-4-back.png	3		106	4
159	2020-04-30 19:57:33.186444+02	58	Galaxy-S6-Active-1.jpg	3		106	4
160	2020-04-30 19:57:33.201135+02	59	Galaxy-S6-Active-2.jpg	3		106	4
161	2020-04-30 19:57:33.216699+02	60	Galaxy-S6-Active-3.jpg	3		106	4
162	2020-04-30 19:57:33.233067+02	61	Galaxy-S6-Active-4.jpg	3		106	4
163	2020-04-30 19:57:33.247622+02	62	Galaxy-S6-Active-5.jpg	3		106	4
164	2020-04-30 19:57:33.262773+02	63	Galaxy-S6-Active-6.jpg	3		106	4
165	2020-04-30 19:57:33.279667+02	64	Sony-xperia-tl.png	3		106	4
166	2020-04-30 19:57:33.295539+02	67	htc-evo-design-4g-front.png	3		106	4
167	2020-04-30 19:57:33.310282+02	68	htc-evo-design-4g-back.png	3		106	4
168	2020-04-30 19:57:33.326815+02	77	apple-iphone5-w1.jpg	3		106	4
169	2020-04-30 19:57:33.340439+02	78	apple-iphone5-w2.jpg	3		106	4
170	2020-04-30 19:57:33.35404+02	79	motorola-atrix-4g.0.jpg	3		106	4
171	2020-04-30 19:57:33.369818+02	80	motorola-atrix-4g.1.jpg	3		106	4
172	2020-04-30 19:57:33.38519+02	81	motorola-atrix-4g.2.jpg	3		106	4
173	2020-04-30 19:57:33.400305+02	82	motorola-atrix-4g.3.jpg	3		106	4
174	2020-04-30 19:57:33.415326+02	108	Atomic-Floyd-SuperDarts-970-80.jpg	3		106	4
175	2020-04-30 19:57:33.429503+02	109	plantronics-backbeat-fit-blue_coil.png	3		106	4
176	2020-04-30 19:57:33.443942+02	110	sennheiser-hd630vb.jpg	3		106	4
177	2020-04-30 19:57:33.457299+02	111	IMG-8722-1.jpg	3		106	4
178	2020-04-30 19:57:33.470946+02	112	IMG-8724-1.jpg	3		106	4
179	2020-04-30 19:57:33.48547+02	113	IMG-8726-1.jpg	3		106	4
180	2020-04-30 19:57:33.49967+02	114	IMG-8727-1.jpg	3		106	4
181	2020-04-30 19:57:33.514021+02	153	htc-evo-design-4g-side.png	3		106	4
182	2020-04-30 19:57:33.528525+02	154	htc-thunderbolt-1.png	3		106	4
183	2020-04-30 19:57:33.544879+02	155	htc-thunderbolt-2.png	3		106	4
184	2020-04-30 19:57:33.558743+02	156	htc-thunderbolt-3.png	3		106	4
185	2020-04-30 19:57:33.572782+02	157	lg-connect-4g-1.png	3		106	4
186	2020-04-30 19:57:33.587265+02	158	lg-connect-4g-2.png	3		106	4
187	2020-04-30 19:57:33.601928+02	159	motorola-droid3-1.png	3		106	4
188	2020-04-30 19:57:33.615785+02	160	motorola-droid3-2.png	3		106	4
189	2020-04-30 19:57:33.630088+02	161	motorola-droid3-3.png	3		106	4
190	2020-04-30 19:57:33.644551+02	162	motorola-droid3-4.png	3		106	4
191	2020-04-30 19:57:33.657816+02	163	Galaxy-S3.png	3		106	4
192	2020-04-30 19:57:33.671262+02	164	kyocera-milano-1.png	3		106	4
193	2020-04-30 19:57:33.687487+02	165	kyocera-milano-2.png	3		106	4
194	2020-04-30 19:57:33.701103+02	166	kyocera-milano-3.png	3		106	4
195	2020-04-30 19:57:33.714972+02	189	home-front.jpg	3		106	4
196	2020-04-30 19:57:33.730283+02	190	interior-17.jpg	3		106	4
197	2020-04-30 19:57:33.744516+02	191	interior-18.jpg	3		106	4
198	2020-04-30 19:57:33.759982+02	192	interior-21.jpg	3		106	4
199	2020-04-30 19:57:33.776158+02	193	interior-22.jpg	3		106	4
200	2020-04-30 19:57:33.791876+02	194	living-room.jpg	3		106	4
201	2020-04-30 19:57:33.806483+02	195	shower-389260.jpg	3		106	4
202	2020-04-30 19:57:33.820924+02	196	swimming-pool.jpg	3		106	4
203	2020-04-30 19:57:33.836438+02	197	bathroom.jpg	3		106	4
204	2020-04-30 19:57:33.85203+02	198	bedroom.jpg	3		106	4
205	2020-04-30 19:57:33.868884+02	4	Earphones	3		104	4
206	2020-04-30 19:57:33.88061+02	6	Real Estate	3		104	4
207	2020-04-30 19:57:33.892102+02	5	Smart Cards	3		104	4
208	2020-04-30 19:57:33.901789+02	3	Smart Phones	3		104	4
209	2020-04-30 19:58:16.592607+02	7	Shop	2	[{"changed": {"fields": ["name"]}}]	104	4
210	2020-04-30 19:59:32.723354+02	1	django-pony.png	3		106	4
211	2020-04-30 19:59:55.607787+02	7	['info@weltladen-baden.at']	3		112	4
212	2020-04-30 19:59:55.611856+02	6	['info@weltladen-baden.at']	3		112	4
213	2020-04-30 19:59:55.613189+02	5	['info@weltladen-baden.at']	3		112	4
214	2020-04-30 19:59:55.614395+02	4	['info@weltladen-baden.at']	3		112	4
215	2020-04-30 19:59:55.615587+02	3	['+markus.mohanty@gmail.com']	3		112	4
216	2020-04-30 19:59:55.616726+02	2	['+markus.mohanty@gmail.com']	3		112	4
217	2020-04-30 19:59:55.617996+02	1	['+markus.mohanty@gmail.com']	3		112	4
218	2020-04-30 20:01:13.219578+02	2	Bestellung versendet 	2	[{"changed": {"fields": ["name", "subject", "html_content"]}}]	113	4
219	2020-04-30 20:01:34.999584+02	9	2020-00006	2	[{"changed": {"fields": ["status"]}}]	123	4
220	2020-04-30 20:01:52.228887+02	9	2020-00006	2	[{"changed": {"fields": ["status"]}}, {"changed": {"name": "Delivery", "object": "Delivery ID: 2", "fields": ["shipping_id"]}}]	123	4
221	2020-04-30 20:05:39.40559+02	1	Home	2		2	4
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	cms	placeholder
2	cms	page
3	auth	permission
4	auth	group
5	email_auth	user
6	contenttypes	contenttype
7	sessions	session
8	sites	site
9	admin	logentry
10	djangocms_text_ckeditor	text
11	cmsplugin_cascade	cascadeelement
12	cmsplugin_cascade	pluginextrafields
13	cmsplugin_cascade	sharedglossary
14	cmsplugin_cascade	segmentation
15	cmsplugin_cascade	inlinecascadeelement
16	cmsplugin_cascade	cascadeclipboard
17	cmsplugin_cascade	sortableinlinecascadeelement
18	cmsplugin_cascade	cascadepage
19	cmsplugin_cascade	sharablecascadeelement
20	cmsplugin_cascade	iconfont
21	cmsplugin_cascade	bootstrapaccordiongrouppluginmodel
22	cmsplugin_cascade	bootstrapaccordionpluginmodel
23	cmsplugin_cascade	bootstrapbuttonpluginmodel
24	cmsplugin_cascade	bootstrapcardbodypluginmodel
25	cmsplugin_cascade	bootstrapcardfooterpluginmodel
26	cmsplugin_cascade	bootstrapcardheaderpluginmodel
27	cmsplugin_cascade	bootstrapcardpluginmodel
28	cmsplugin_cascade	bootstrapcarouselpluginmodel
29	cmsplugin_cascade	bootstrapcarouselslidepluginmodel
30	cmsplugin_cascade	bootstrapcolumnpluginmodel
31	cmsplugin_cascade	bootstrapcontainerpluginmodel
32	cmsplugin_cascade	bootstrapimagepluginmodel
33	cmsplugin_cascade	bootstrapjumbotronpluginmodel
34	cmsplugin_cascade	bootstrappicturepluginmodel
35	cmsplugin_cascade	bootstrappluginbasemodel
36	cmsplugin_cascade	bootstraprowpluginmodel
37	cmsplugin_cascade	bootstrapsecondarymenupluginmodel
38	cmsplugin_cascade	bootstraptabpanepluginmodel
39	cmsplugin_cascade	bootstraptabsetpluginmodel
40	cmsplugin_cascade	bootstrapyoutubepluginmodel
41	cmsplugin_cascade	breadcrumbpluginmodel
42	cmsplugin_cascade	cardchildbasemodel
43	cmsplugin_cascade	cascadepluginbasemodel
44	cmsplugin_cascade	cataloglinkpluginbasemodel
45	cmsplugin_cascade	checkoutaddresspluginmodel
46	cmsplugin_cascade	customsnippetpluginmodel
47	cmsplugin_cascade	customerformpluginbasemodel
48	cmsplugin_cascade	customerformpluginmodel
49	cmsplugin_cascade	defaultlinkpluginbasemodel
50	cmsplugin_cascade	dialogformpluginbasemodel
51	cmsplugin_cascade	extraannotationformpluginmodel
52	cmsplugin_cascade	framediconpluginmodel
53	cmsplugin_cascade	guestformpluginmodel
54	cmsplugin_cascade	headingpluginmodel
55	cmsplugin_cascade	horizontalrulepluginmodel
56	cmsplugin_cascade	leafletpluginmodel
57	cmsplugin_cascade	linkpluginbasemodel
58	cmsplugin_cascade	orderbuttonbasemodel
59	cmsplugin_cascade	paymentmethodformpluginmodel
60	cmsplugin_cascade	processbarpluginmodel
61	cmsplugin_cascade	processsteppluginmodel
62	cmsplugin_cascade	requiredformfieldspluginmodel
63	cmsplugin_cascade	segmentpluginmodel
64	cmsplugin_cascade	shippingmethodformpluginmodel
65	cmsplugin_cascade	shopaddtocartpluginmodel
66	cmsplugin_cascade	shopauthenticationpluginmodel
67	cmsplugin_cascade	shopcancelorderbuttonpluginmodel
68	cmsplugin_cascade	shopcartpluginmodel
69	cmsplugin_cascade	shopcatalogpluginmodel
70	cmsplugin_cascade	shopleftextensionmodel
71	cmsplugin_cascade	shoporderaddendumformpluginmodel
72	cmsplugin_cascade	shoporderviewspluginmodel
73	cmsplugin_cascade	shoppluginbasemodel
74	cmsplugin_cascade	shopproceedbuttonmodel
75	cmsplugin_cascade	shopproductgallerymodel
76	cmsplugin_cascade	shopreorderbuttonpluginmodel
77	cmsplugin_cascade	shoprightextensionmodel
78	cmsplugin_cascade	shopsearchresultspluginmodel
79	cmsplugin_cascade	simpleiconpluginmodel
80	cmsplugin_cascade	simplewrapperpluginmodel
81	cmsplugin_cascade	texticonpluginmodel
82	cmsplugin_cascade	textimagepluginmodel
83	cmsplugin_cascade	textlinkpluginmodel
84	cmsplugin_cascade	validatesetofformspluginmodel
85	cmsplugin_cascade	texteditorconfigfields
86	authtoken	token
87	cms	cmsplugin
88	cms	aliaspluginmodel
89	cms	globalpagepermission
90	cms	pagepermission
91	cms	pageuser
92	cms	pageusergroup
93	cms	placeholderreference
94	cms	staticplaceholder
95	cms	title
96	cms	usersettings
97	cms	urlconfrevision
98	cms	pagetype
99	cms	treenode
100	menus	cachekey
101	filer	clipboard
102	filer	clipboarditem
103	filer	file
104	filer	folder
105	filer	folderpermission
106	filer	image
107	filer	thumbnailoption
108	easy_thumbnails	source
109	easy_thumbnails	thumbnail
110	easy_thumbnails	thumbnaildimensions
111	post_office	attachment
112	post_office	email
113	post_office	emailtemplate
114	post_office	log
115	shop	notification
116	shop	notificationattachment
117	shop	customerproxy
118	weltladen	billingaddress
119	weltladen	cart
120	weltladen	customer
121	weltladen	delivery
122	weltladen	manufacturer
123	weltladen	order
124	weltladen	productimage
125	weltladen	productpage
126	weltladen	smartcard
127	weltladen	shippingaddress
128	weltladen	orderpayment
129	weltladen	orderitem
130	weltladen	deliveryitem
131	weltladen	cartitem
132	weltladen	smartcardtranslation
133	weltladen	supplier
134	weltladen	weltladencustomer
135	weltladen	weltladenproduct
136	weltladen	weltladenproducttranslation
137	weltladen	locations
138	cmsplugin_cascade	contactuspluginmodel
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-04-26 19:49:55.568075+02
2	auth	0001_initial	2020-04-26 19:49:55.591201+02
3	email_auth	0001_initial	2020-04-26 19:49:55.720747+02
4	admin	0001_initial	2020-04-26 19:49:55.749473+02
5	admin	0002_logentry_remove_auto_add	2020-04-26 19:49:55.765321+02
6	admin	0003_logentry_add_action_flag_choices	2020-04-26 19:49:55.77378+02
7	contenttypes	0002_remove_content_type_name	2020-04-26 19:49:55.79506+02
8	auth	0002_alter_permission_name_max_length	2020-04-26 19:49:55.800861+02
9	auth	0003_alter_user_email_max_length	2020-04-26 19:49:55.809342+02
10	auth	0004_alter_user_username_opts	2020-04-26 19:49:55.819331+02
11	auth	0005_alter_user_last_login_null	2020-04-26 19:49:55.82734+02
12	auth	0006_require_contenttypes_0002	2020-04-26 19:49:55.830403+02
13	auth	0007_alter_validators_add_error_messages	2020-04-26 19:49:55.841247+02
14	auth	0008_alter_user_username_max_length	2020-04-26 19:49:55.849913+02
15	auth	0009_alter_user_last_name_max_length	2020-04-26 19:49:55.858201+02
16	auth	0010_alter_group_name_max_length	2020-04-26 19:49:55.868806+02
17	auth	0011_update_proxy_permissions	2020-04-26 19:49:55.878097+02
18	authtoken	0001_initial	2020-04-26 19:49:55.889956+02
19	authtoken	0002_auto_20160226_1747	2020-04-26 19:49:55.922023+02
20	sites	0001_initial	2020-04-26 19:49:55.92794+02
21	cms	0001_initial	2020-04-26 19:49:55.996802+02
22	cms	0002_auto_20140816_1918	2020-04-26 19:49:56.260994+02
23	cms	0003_auto_20140926_2347	2020-04-26 19:49:56.341237+02
24	cms	0004_auto_20140924_1038	2020-04-26 19:49:56.413427+02
25	cms	0005_auto_20140924_1039	2020-04-26 19:49:56.444088+02
26	cms	0006_auto_20140924_1110	2020-04-26 19:49:56.616547+02
27	cms	0007_auto_20141028_1559	2020-04-26 19:49:56.635663+02
28	cms	0008_auto_20150208_2149	2020-04-26 19:49:56.64505+02
29	cms	0008_auto_20150121_0059	2020-04-26 19:49:56.659821+02
30	cms	0009_merge	2020-04-26 19:49:56.667825+02
31	cms	0010_migrate_use_structure	2020-04-26 19:49:56.718454+02
32	cms	0011_auto_20150419_1006	2020-04-26 19:49:56.733863+02
33	cms	0012_auto_20150607_2207	2020-04-26 19:49:56.786489+02
34	cms	0013_urlconfrevision	2020-04-26 19:49:56.794253+02
35	cms	0014_auto_20160404_1908	2020-04-26 19:49:56.822656+02
36	cms	0015_auto_20160421_0000	2020-04-26 19:49:56.835018+02
37	cms	0016_auto_20160608_1535	2020-04-26 19:49:56.88092+02
38	cms	0017_pagetype	2020-04-26 19:49:56.921699+02
39	cms	0018_pagenode	2020-04-26 19:49:57.040309+02
40	cms	0019_set_pagenode	2020-04-26 19:49:57.099939+02
41	cms	0020_old_tree_cleanup	2020-04-26 19:49:57.300498+02
42	cms	0021_auto_20180507_1432	2020-04-26 19:49:57.318668+02
43	cms	0022_auto_20180620_1551	2020-04-26 19:49:57.336039+02
44	filer	0001_initial	2020-04-26 19:49:57.588329+02
45	filer	0002_auto_20150606_2003	2020-04-26 19:49:57.652126+02
46	filer	0003_thumbnailoption	2020-04-26 19:49:57.660832+02
47	filer	0004_auto_20160328_1434	2020-04-26 19:49:57.67499+02
48	filer	0005_auto_20160623_1425	2020-04-26 19:49:57.769024+02
49	filer	0006_auto_20160623_1627	2020-04-26 19:49:57.80017+02
50	cmsplugin_cascade	0001_initial	2020-04-26 19:49:58.012714+02
51	cmsplugin_cascade	0002_auto_20150530_1018	2020-04-26 19:49:58.049417+02
52	cmsplugin_cascade	0003_inlinecascadeelement	2020-04-26 19:49:58.063155+02
53	cmsplugin_cascade	0004_auto_20151112_0147	2020-04-26 19:49:58.067156+02
54	cmsplugin_cascade	0005_tabset_and_clipboard	2020-04-26 19:49:58.076487+02
55	cmsplugin_cascade	0006_bootstrapgallerypluginmodel	2020-04-26 19:49:58.079213+02
56	cmsplugin_cascade	0007_add_proxy_models	2020-04-26 19:49:58.080715+02
57	cmsplugin_cascade	0008_sortableinlinecascadeelement	2020-04-26 19:49:58.097479+02
58	cmsplugin_cascade	0009_cascadepage	2020-04-26 19:49:58.137854+02
59	cmsplugin_cascade	0010_refactor_heading	2020-04-26 19:49:58.178911+02
60	cmsplugin_cascade	0011_merge_sharable_with_cascadeelement	2020-04-26 19:49:58.272719+02
61	cmsplugin_cascade	0012_auto_20160619_1854	2020-04-26 19:49:58.30725+02
62	cmsplugin_cascade	0013_iconfont	2020-04-26 19:49:58.339752+02
63	cmsplugin_cascade	0014_glossary_field	2020-04-26 19:49:58.380155+02
64	cmsplugin_cascade	0015_carousel_slide	2020-04-26 19:49:58.412937+02
65	cmsplugin_cascade	0016_shared_glossary_uneditable	2020-04-26 19:49:58.454717+02
66	cmsplugin_cascade	0017_fake_proxy_models	2020-04-26 19:49:58.614924+02
67	cmsplugin_cascade	0018_iconfont_color	2020-04-26 19:49:58.74003+02
68	cmsplugin_cascade	0019_verbose_table_names	2020-04-26 19:49:58.811562+02
69	cmsplugin_cascade	0020_page_icon_font	2020-04-26 19:49:58.897918+02
70	cmsplugin_cascade	0021_cascadepage_verbose_name	2020-04-26 19:49:58.915015+02
71	cmsplugin_cascade	0022_auto_20181202_1055	2020-04-26 19:49:58.943007+02
72	cmsplugin_cascade	0023_iconfont_is_default	2020-04-26 19:49:58.957278+02
73	cmsplugin_cascade	0024_page_icon_font	2020-04-26 19:49:59.041651+02
74	cmsplugin_cascade	0025_texteditorconfigfields	2020-04-26 19:49:59.053372+02
75	cmsplugin_cascade	0026_cascadepage_menu_symbol	2020-04-26 19:49:59.094627+02
76	cmsplugin_cascade	0027_version_1	2020-04-26 19:49:59.150471+02
77	djangocms_text_ckeditor	0001_initial	2020-04-26 19:49:59.184481+02
78	djangocms_text_ckeditor	0002_remove_related_name_for_cmsplugin_ptr	2020-04-26 19:49:59.221436+02
79	djangocms_text_ckeditor	0003_set_related_name_for_cmsplugin_ptr	2020-04-26 19:49:59.257045+02
80	djangocms_text_ckeditor	0004_auto_20160706_1339	2020-04-26 19:49:59.389718+02
81	easy_thumbnails	0001_initial	2020-04-26 19:49:59.429253+02
82	easy_thumbnails	0002_thumbnaildimensions	2020-04-26 19:49:59.451974+02
83	email_auth	0002_auto_20160327_1119	2020-04-26 19:49:59.473189+02
84	email_auth	0003_django110	2020-04-26 19:49:59.493386+02
85	email_auth	0004_auto_20170411_1733	2020-04-26 19:49:59.511957+02
86	email_auth	0005_auto_20191123_2051	2020-04-26 19:49:59.529261+02
87	filer	0007_auto_20161016_1055	2020-04-26 19:49:59.544284+02
88	filer	0008_auto_20171117_1313	2020-04-26 19:49:59.560358+02
89	filer	0009_auto_20171220_1635	2020-04-26 19:49:59.57886+02
90	filer	0010_auto_20180414_2058	2020-04-26 19:49:59.600022+02
91	filer	0011_auto_20190418_0137	2020-04-26 19:49:59.663302+02
92	menus	0001_initial	2020-04-26 19:49:59.673219+02
93	post_office	0001_initial	2020-04-26 19:49:59.746237+02
94	post_office	0002_add_i18n_and_backend_alias	2020-04-26 19:49:59.862289+02
95	post_office	0003_longer_subject	2020-04-26 19:49:59.878619+02
96	post_office	0004_auto_20160607_0901	2020-04-26 19:50:00.048918+02
97	post_office	0005_auto_20170515_0013	2020-04-26 19:50:00.062418+02
98	post_office	0006_attachment_mimetype	2020-04-26 19:50:00.073253+02
99	post_office	0007_auto_20170731_1342	2020-04-26 19:50:00.080643+02
100	post_office	0008_attachment_headers	2020-04-26 19:50:00.090367+02
101	sessions	0001_initial	2020-04-26 19:50:00.098324+02
102	shop	0001_initial	2020-04-26 19:50:00.144632+02
103	shop	0002_auto_20151016_1451	2020-04-26 19:50:00.162516+02
104	shop	0003_glossary_fields	2020-04-26 19:50:00.229773+02
105	shop	0004_ckeditor31	2020-04-26 19:50:00.372589+02
106	shop	0005_unify_address	2020-04-26 19:50:00.443031+02
107	shop	0006_rename_to_catalog	2020-04-26 19:50:00.510784+02
108	shop	0007_notification_recipient	2020-04-26 19:50:00.638912+02
109	shop	0008_notification_recipient	2020-04-26 19:50:00.676841+02
110	shop	0009_delete_email	2020-04-26 19:50:00.687813+02
111	shop	0010_auto_20191224_0727	2020-04-26 19:50:00.754872+02
112	sites	0002_alter_domain_unique	2020-04-26 19:50:00.771572+02
113	cms	0018_create_pagenode	2020-04-26 19:50:00.775994+02
114	weltladen	0001_initial	2020-04-26 19:50:02.94624+02
115	weltladen	0002_auto_20200426_2012	2020-04-26 20:12:16.722241+02
116	weltladen	0003_auto_20200426_2013	2020-04-26 20:13:16.273343+02
117	weltladen	0004_locations	2020-04-26 20:18:44.57986+02
118	weltladen	0005_auto_20200426_2039	2020-04-26 20:39:43.714239+02
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
ai1wquv3fyscven5ttvcoy0em6ak2rju	NjM0Yjc1NGRlOGQ1OWRlOGZhOTE5YmU1NmI2ZjAzMDM0MDNiOTlhYTp7ImNtc190b29sYmFyX2Rpc2FibGVkIjpmYWxzZSwiY21zX2VkaXQiOmZhbHNlLCJjbXNfcHJldmlldyI6dHJ1ZSwiX2F1dGhfdXNlcl9pZCI6IjQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjZiYjMwNjExZTI2N2RhYTQxOWNlYjlhMzYxNTdmZjE2NmU5ZmRiN2QiLCJlbXVsYXRlX3VzZXJfaWQiOjN9	2020-05-13 20:28:01.599754+02
n2oscw6np6fvbbk3cnu7wdaxu2yrsvkf	ODcwNmIyYjk3NmE4Y2MwYjI3MGMwYmYyYjRmMGUzNDVkMzc1MTQ3Yzp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YmIzMDYxMWUyNjdkYWE0MTljZWI5YTM2MTU3ZmYxNjZlOWZkYjdkIn0=	2020-05-13 20:35:48.978166+02
0ebrsxiixbcyjkabmjm50jsu7j6zpc9u	NjBjMzkxZGI0ZmFlMDM1ZTU3M2EyMTkyYjU5OGRlOGM3OWIzNjVhYjp7fQ==	2020-05-10 21:47:55.365977+02
89z73246m8fgbqmzbe568vcmjndvi736	YmIzNzQ0OTM3ZmFkNDZkYzViZDJkYjNkYzI1YWUyNDIxZmI3MDBmZDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YmIzMDYxMWUyNjdkYWE0MTljZWI5YTM2MTU3ZmYxNjZlOWZkYjdkIiwiY21zX3Rvb2xiYXJfZGlzYWJsZWQiOmZhbHNlLCJjbXNfZWRpdCI6ZmFsc2UsImNtc19wcmV2aWV3Ijp0cnVlLCJmaWxlcl9sYXN0X2ZvbGRlcl9pZCI6IjEifQ==	2020-05-14 20:07:56.139936+02
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Data for Name: djangocms_text_ckeditor_text; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.djangocms_text_ckeditor_text (cmsplugin_ptr_id, body) FROM stdin;
46	<p>Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Aenean lacinia bibendum nulla sed consectetur. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Nullam id dolor id nibh ultricies vehicula ut id elit. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Maecenas faucibus mollis interdum. Donec id elit non mi porta gravida at eget metus. Donec sed odio dui. Nulla vitae elit libero, a pharetra augue. Cras mattis consectetur purus sit amet fermentum.</p>\n\n<p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum id ligula porta felis euismod semper. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Aenean lacinia bibendum nulla sed consectetur. Donec ullamcorper nulla non metus auctor fringilla. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Maecenas faucibus mollis interdum. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Sed posuere consectetur est at lobortis. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
424	<p>The Payment Service Provider rejected your payment. Please visit the checkout page again and try with another payment method. </p>
64	<h2>Our Catalog List View</h2>\n
469	<p>Ich habe die <cms-plugin alt="Link - AGBs " title="Link - AGBs" id="1089"></cms-plugin> gelesen und verstanden.</p>
72	<h2>Our Catalog List View</h2>\n
431	<p>The Payment Service Provider rejected your payment. Please visit the checkout page again and try with another payment method. </p>
119	<p>Vestibulum id ligula porta felis euismod semper. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
135	<p>Vestibulum id ligula porta felis euismod semper. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
517	<p>I have read the <cms-plugin alt="Link - terms and conditions " title="Link - terms and conditions" id="518"></cms-plugin> and agree with them.</p>
409	<p>The Payment Service Provider rejected your payment. Please visit the checkout page again and try with another payment method. </p>
417	<p>The Payment Service Provider rejected your payment. Please visit the checkout page again and try with another payment method. </p>
613	<p>I have read the <cms-plugin alt="Link - terms and conditions " title="Link - terms and conditions" id="614"></cms-plugin> and agree with them.</p>
728	<h2 class="adsimple-211124080">Datenschutz</h2>\n\n<p>Wir haben diese Datenschutzerklärung (Fassung 27.04.2020-211124080) verfasst, um Ihnen gemäß der Vorgaben der <a class="adsimple-211124080" href="https://eur-lex.europa.eu/legal-content/DE/ALL/?uri=celex%3A32016R0679&amp;tid=211124080" rel="noopener nofollow" target="_blank">Datenschutz-Grundverordnung (EU) 2016/679</a> zu erklären, welche Informationen wir sammeln, wie wir Daten verwenden und welche Entscheidungsmöglichkeiten Sie als Besucher dieser Webseite haben.</p>\n\n<p>Leider liegt es in der Natur der Sache, dass diese Erklärungen sehr technisch klingen, wir haben uns bei der Erstellung jedoch bemüht die wichtigsten Dinge so einfach und klar wie möglich zu beschreiben.</p>\n\n<h2 class="adsimple-211124080">Automatische Datenspeicherung</h2>\n\n<p>Wenn Sie heutzutage Webseiten besuchen, werden gewisse Informationen automatisch erstellt und gespeichert, so auch auf dieser Webseite.</p>\n\n<p>Wenn Sie unsere Webseite so wie jetzt gerade besuchen, speichert unser Webserver (Computer auf dem diese Webseite gespeichert ist) automatisch Daten wie</p>\n\n<ul class="adsimple-211124080">\n\t<li class="adsimple-211124080">die Adresse (URL) der aufgerufenen Webseite</li>\n\t<li class="adsimple-211124080">Browser und Browserversion</li>\n\t<li class="adsimple-211124080">das verwendete Betriebssystem</li>\n\t<li class="adsimple-211124080">die Adresse (URL) der zuvor besuchten Seite (Referrer URL)</li>\n\t<li class="adsimple-211124080">den Hostname und die IP-Adresse des Geräts von welchem aus zugegriffen wird</li>\n\t<li class="adsimple-211124080">Datum und Uhrzeit</li>\n</ul>\n\n<p>in Dateien (Webserver-Logfiles).</p>\n\n<p>In der Regel werden Webserver-Logfiles zwei Wochen gespeichert und danach automatisch gelöscht. Wir geben diese Daten nicht weiter, können jedoch nicht ausschließen, dass diese Daten beim Vorliegen von rechtswidrigem Verhalten eingesehen werden.</p>\n\n<h2 class="adsimple-211124080">Cookies</h2>\n\n<p>Unsere Webseite verwendet HTTP-Cookies, um nutzerspezifische Daten zu speichern.<br>\nIm Folgenden erklären wir, was Cookies sind und warum Sie genutzt werden, damit Sie die folgende Datenschutzerklärung besser verstehen.</p>\n\n<h3 class="adsimple-211124080">Was genau sind Cookies?</h3>\n\n<p>Immer wenn Sie durch das Internet surfen, verwenden Sie einen Browser. Bekannte Browser sind beispielsweise Chrome, Safari, Firefox, Internet Explorer und Microsoft Edge. Die meisten Webseiten speichern kleine Text-Dateien in Ihrem Browser. Diese Dateien nennt man Cookies.</p>\n\n<p>Eines ist nicht von der Hand zu weisen: Cookies sind echt nützliche Helferlein. Fast alle Webseiten verwenden Cookies. Genauer gesprochen sind es HTTP-Cookies, da es auch noch andere Cookies für andere Anwendungsbereiche gibt. HTTP-Cookies sind kleine Dateien, die von unserer Webseite auf Ihrem Computer gespeichert werden. Diese Cookie-Dateien werden automatisch im Cookie-Ordner, quasi dem „Hirn“ Ihres Browsers, untergebracht. Ein Cookie besteht aus einem Namen und einem Wert. Bei der Definition eines Cookies müssen zusätzlich ein oder mehrere Attribute angegeben werden.</p>\n\n<p>Cookies speichern gewisse Nutzerdaten von Ihnen, wie beispielsweise Sprache oder persönliche Seiteneinstellungen. Wenn Sie unsere Seite wieder aufrufen, übermittelt Ihr Browser die „userbezogenen“ Informationen an unsere Seite zurück. Dank der Cookies weiß unsere Webseite, wer Sie sind und bietet Ihnen die Einstellung, die Sie gewohnt sind. In einigen Browsern hat jedes Cookie eine eigene Datei, in anderen wie beispielsweise Firefox sind alle Cookies in einer einzigen Datei gespeichert.</p>\n\n<p>Es gibt sowohl Erstanbieter Cookies als auch Drittanbieter-Cookies. Erstanbieter-Cookies werden direkt von unserer Seite erstellt, Drittanbieter-Cookies werden von Partner-Webseiten (z.B. Google Analytics) erstellt. Jedes Cookie ist individuell zu bewerten, da jedes Cookie andere Daten speichert. Auch die Ablaufzeit eines Cookies variiert von ein paar Minuten bis hin zu ein paar Jahren. Cookies sind keine Software-Programme und enthalten keine Viren, Trojaner oder andere „Schädlinge“. Cookies können auch nicht auf Informationen Ihres PCs zugreifen.</p>\n\n<p>So können zum Beispiel Cookie-Daten aussehen:</p>\n\n<p><strong class="adsimple-211124080">Name:</strong> _ga<br>\n<strong class="adsimple-211124080">Wert:</strong> GA1.2.1326744211.152211124080-6<br>\n<strong class="adsimple-211124080">Verwendungszweck:</strong> Unterscheidung der Webseitenbesucher<br>\n<strong class="adsimple-211124080">Ablaufdatum:</strong> nach 2 Jahren</p>\n\n<p>Diese Mindestgrößen sollte ein Browser unterstützen können:</p>\n\n<ul class="adsimple-211124080">\n\t<li class="adsimple-211124080">Mindestens 4096 Bytes pro Cookie</li>\n\t<li class="adsimple-211124080">Mindestens 50 Cookies pro Domain</li>\n\t<li class="adsimple-211124080">Mindestens 3000 Cookies insgesamt</li>\n</ul>\n\n<h3 class="adsimple-211124080">Welche Arten von Cookies gibt es?</h3>\n\n<p>Die Frage welche Cookies wir im Speziellen verwenden, hängt von den verwendeten Diensten ab und wird in den folgenden Abschnitten der Datenschutzerklärung geklärt. An dieser Stelle möchten wir kurz auf die verschiedenen Arten von HTTP-Cookies eingehen.</p>\n\n<p>Man kann 4 Arten von Cookies unterscheiden:</p>\n\n<p><strong class="adsimple-211124080">Unerlässliche Cookies</strong><br>\nDiese Cookies sind nötig, um grundlegende Funktionen der Webseite sicherzustellen. Zum Beispiel braucht es diese Cookies, wenn ein User ein Produkt in den Warenkorb legt, dann auf anderen Seiten weitersurft und später erst zur Kasse geht. Durch diese Cookies wird der Warenkorb nicht gelöscht, selbst wenn der User sein Browserfenster schließt.</p>\n\n<p><strong class="adsimple-211124080">Zweckmäßige Cookies</strong><br>\nDiese Cookies sammeln Infos über das Userverhalten und ob der User etwaige Fehlermeldungen bekommt. Zudem werden mithilfe dieser Cookies auch die Ladezeit und das Verhalten der Webseite bei verschiedenen Browsern gemessen.</p>\n\n<p><strong class="adsimple-211124080">Zielorientierte Cookies</strong><br>\nDiese Cookies sorgen für eine bessere Nutzerfreundlichkeit. Beispielsweise werden eingegebene Standorte, Schriftgrößen oder Formulardaten gespeichert.</p>\n\n<p><strong class="adsimple-211124080">Werbe-Cookies</strong><br>\nDiese Cookies werden auch Targeting-Cookies genannt. Sie dienen dazu dem User individuell angepasste Werbung zu liefern. Das kann sehr praktisch, aber auch sehr nervig sein.</p>\n\n<p>Üblicherweise werden Sie beim erstmaligen Besuch einer Webseite gefragt, welche dieser Cookiearten Sie zulassen möchten. Und natürlich wird diese Entscheidung auch in einem Cookie gespeichert.</p>\n\n<h3 class="adsimple-211124080">Wie kann ich Cookies löschen?</h3>\n\n<p>Wie und ob Sie Cookies verwenden wollen, entscheiden Sie selbst. Unabhängig von welchem Service oder welcher Webseite die Cookies stammen, haben Sie immer die Möglichkeit Cookies zu löschen, zu deaktivieren oder nur teilweise zuzulassen. Zum Beispiel können Sie Cookies von Drittanbietern blockieren, aber alle anderen Cookies zulassen.</p>\n\n<p>Wenn Sie feststellen möchten, welche Cookies in Ihrem Browser gespeichert wurden, wenn Sie Cookie-Einstellungen ändern oder löschen wollen, können Sie dies in Ihren Browser-Einstellungen finden:</p>\n\n<p><a class="adsimple-211124080" href="https://support.google.com/chrome/answer/95647?tid=211124080" rel="noopener nofollow" target="_blank">Chrome: Cookies in Chrome löschen, aktivieren und verwalten</a></p>\n\n<p><a class="adsimple-211124080" href="https://support.apple.com/de-at/guide/safari/sfri11471/mac?tid=211124080" rel="noopener nofollow" target="_blank">Safari: Verwalten von Cookies und Websitedaten mit Safari</a></p>\n\n<p><a class="adsimple-211124080" href="https://support.mozilla.org/de/kb/cookies-und-website-daten-in-firefox-loschen?tid=211124080" rel="noopener nofollow" target="_blank">Firefox: Cookies löschen, um Daten zu entfernen, die Websites auf Ihrem Computer abgelegt haben</a></p>\n\n<p><a class="adsimple-211124080" href="https://support.microsoft.com/de-at/help/17442/windows-internet-explorer-delete-manage-cookies?tid=211124080" rel="noopener nofollow" target="_blank">Internet Explorer: Löschen und Verwalten von Cookies</a></p>\n\n<p><a class="adsimple-211124080" href="https://support.microsoft.com/de-at/help/4027947/windows-delete-cookies?tid=211124080" rel="noopener nofollow" target="_blank">Microsoft Edge: Löschen und Verwalten von Cookies</a></p>\n\n<p>Falls Sie grundsätzlich keine Cookies haben wollen, können Sie Ihren Browser so einrichten, dass er Sie immer informiert, wenn ein Cookie gesetzt werden soll. So können Sie bei jedem einzelnen Cookie entscheiden, ob Sie das Cookie erlauben oder nicht. Die Vorgangsweise ist je nach Browser verschieden. Am besten Sie suchen die Anleitung in Google mit dem Suchbegriff “Cookies löschen Chrome” oder „Cookies deaktivieren Chrome“ im Falle eines Chrome Browsers.</p>\n\n<h3 class="adsimple-211124080">Wie sieht es mit meinem Datenschutz aus?</h3>\n\n<p>Seit 2009 gibt es die sogenannten „Cookie-Richtlinien“. Darin ist festgehalten, dass das Speichern von Cookies eine Einwilligung des von Ihnen verlangt. Innerhalb der EU-Länder gibt es allerdings noch sehr unterschiedliche Reaktionen auf diese Richtlinien. In Österreich erfolgte aber die Umsetzung dieser Richtlinie in § 96 Abs. 3 des Telekommunikationsgesetzes (TKG).</p>\n\n<p>Wenn Sie mehr über Cookies wissen möchten und vor technischen Dokumentationen nicht zurückscheuen, empfehlen wir <a class="adsimple-211124080" href="https://tools.ietf.org/html/rfc6265" rel="nofollow noopener" target="_blank">https://tools.ietf.org/html/rfc6265</a>, dem Request for Comments der Internet Engineering Task Force (IETF) namens „HTTP State Management Mechanism“.</p>\n\n<h2 class="adsimple-211124080">Speicherung persönlicher Daten</h2>\n\n<p>Persönliche Daten, die Sie uns auf dieser Website elektronisch übermitteln, wie zum Beispiel Name, E-Mail-Adresse, Adresse oder andere persönlichen Angaben im Rahmen der Übermittlung eines Formulars oder Kommentaren im Blog, werden von uns gemeinsam mit dem Zeitpunkt und der IP-Adresse nur zum jeweils angegebenen Zweck verwendet, sicher verwahrt und nicht an Dritte weitergegeben.</p>\n\n<p>Wir nutzen Ihre persönlichen Daten somit nur für die Kommunikation mit jenen Besuchern, die Kontakt ausdrücklich wünschen und für die Abwicklung der auf dieser Webseite angebotenen Dienstleistungen und Produkte. Wir geben Ihre persönlichen Daten ohne Zustimmung nicht weiter, können jedoch nicht ausschließen, dass diese Daten beim Vorliegen von rechtswidrigem Verhalten eingesehen werden.</p>\n\n<p>Wenn Sie uns persönliche Daten per E-Mail schicken – somit abseits dieser Webseite – können wir keine sichere Übertragung und den Schutz Ihrer Daten garantieren. Wir empfehlen Ihnen, vertrauliche Daten niemals unverschlüsselt per E-Mail zu übermitteln.</p>\n\n<h2 class="adsimple-211124080">Rechte laut Datenschutzgrundverordnung</h2>\n\n<p>Ihnen stehen laut den Bestimmungen der DSGVO und des österreichischen <a class="adsimple-211124080" href="https://www.ris.bka.gv.at/GeltendeFassung.wxe?Abfrage=Bundesnormen&amp;Gesetzesnummer=10001597&amp;tid=211124080" rel="noopener nofollow" target="_blank">Datenschutzgesetzes (DSG)</a> grundsätzlich die folgende Rechte zu:</p>\n\n<ul class="adsimple-211124080">\n\t<li class="adsimple-211124080">Recht auf Berichtigung (Artikel 16 DSGVO)</li>\n\t<li class="adsimple-211124080">Recht auf Löschung („Recht auf Vergessenwerden“) (Artikel 17 DSGVO)</li>\n\t<li class="adsimple-211124080">Recht auf Einschränkung der Verarbeitung (Artikel 18 DSGVO)</li>\n\t<li class="adsimple-211124080">Recht auf Benachrichtigung – Mitteilungspflicht im Zusammenhang mit der Berichtigung oder Löschung personenbezogener Daten oder der Einschränkung der Verarbeitung (Artikel 19 DSGVO)</li>\n\t<li class="adsimple-211124080">Recht auf Datenübertragbarkeit (Artikel 20 DSGVO)</li>\n\t<li class="adsimple-211124080">Widerspruchsrecht (Artikel 21 DSGVO)</li>\n\t<li class="adsimple-211124080">Recht, nicht einer ausschließlich auf einer automatisierten Verarbeitung — einschließlich Profiling — beruhenden Entscheidung unterworfen zu werden (Artikel 22 DSGVO)</li>\n</ul>\n\n<p>Wenn Sie glauben, dass die Verarbeitung Ihrer Daten gegen das Datenschutzrecht verstößt oder Ihre datenschutzrechtlichen Ansprüche sonst in einer Weise verletzt worden sind, können Sie sich bei der Aufsichtsbehörde beschweren, welche in Österreich die Datenschutzbehörde ist, deren Webseite Sie unter <a class="adsimple-211124080" href="https://www.dsb.gv.at/?tid=211124080" rel="nofollow">https://www.dsb.gv.at/</a> finden.</p>\n\n<h2 class="adsimple-211124080">TLS-Verschlüsselung mit https</h2>\n\n<p>Wir verwenden https um Daten abhörsicher im Internet zu übertragen (Datenschutz durch Technikgestaltung <a class="adsimple-211124080" href="https://eur-lex.europa.eu/legal-content/DE/TXT/HTML/?uri=CELEX:32016R0679&amp;from=DE&amp;tid=211124080" rel="noopener nofollow" target="_blank">Artikel 25 Absatz 1 DSGVO</a>). Durch den Einsatz von TLS (Transport Layer Security), einem Verschlüsselungsprotokoll zur sicheren Datenübertragung im Internet können wir den Schutz vertraulicher Daten sicherstellen. Sie erkennen die Benutzung dieser Absicherung der Datenübertragung am kleinen Schlosssymbol links oben im Browser und der Verwendung des Schemas https (anstatt http) als Teil unserer Internetadresse.</p>\n\n<p style="margin-top: 15px;">Quelle: Erstellt mit dem <a href="https://www.firmenwebseiten.at/datenschutz-generator/" rel="follow" style="text-decoration: none;" target="_blank" title="Datenschutz Generator von firmenwebseiten.at">Datenschutz Generator von firmenwebseiten.at</a> in Kooperation mit <a class="external" href="https://www.wallentin.cc" rel="follow" style="text-decoration: none;" target="_blank" title="ästhetische Operationen in Wien bei Dr. Doris Wallentin">wallentin.cc</a></p>
772	<h2>Adresse</h2>\n\n<div>Weltladen Baden</div>\n\n<div>Hauptplatz 9-13, 2500 Baden</div>\n\n<div>Tel: +43 2252 45236</div>\n\n<div>Mail: <a href="mailto:info@weltladen-baden.at">info@weltladen-baden.at</a></div>\n\n<div> </div>\n\n<h3>Konto-Verbindung:</h3>\n\n<div>IBAN: AT90 4300 0364 0778 0000<br>\nBIC: VB0EATWW</div>
733	<h2 class="adsimple-211124080">Datenschutz</h2>\n\n<p>Wir haben diese Datenschutzerklärung (Fassung 27.04.2020-211124080) verfasst, um Ihnen gemäß der Vorgaben der <a class="adsimple-211124080" href="https://eur-lex.europa.eu/legal-content/DE/ALL/?uri=celex%3A32016R0679&amp;tid=211124080" rel="noopener nofollow" target="_blank">Datenschutz-Grundverordnung (EU) 2016/679</a> zu erklären, welche Informationen wir sammeln, wie wir Daten verwenden und welche Entscheidungsmöglichkeiten Sie als Besucher dieser Webseite haben.</p>\n\n<p>Leider liegt es in der Natur der Sache, dass diese Erklärungen sehr technisch klingen, wir haben uns bei der Erstellung jedoch bemüht die wichtigsten Dinge so einfach und klar wie möglich zu beschreiben.</p>\n\n<h2 class="adsimple-211124080">Automatische Datenspeicherung</h2>\n\n<p>Wenn Sie heutzutage Webseiten besuchen, werden gewisse Informationen automatisch erstellt und gespeichert, so auch auf dieser Webseite.</p>\n\n<p>Wenn Sie unsere Webseite so wie jetzt gerade besuchen, speichert unser Webserver (Computer auf dem diese Webseite gespeichert ist) automatisch Daten wie</p>\n\n<ul class="adsimple-211124080">\n\t<li class="adsimple-211124080">die Adresse (URL) der aufgerufenen Webseite</li>\n\t<li class="adsimple-211124080">Browser und Browserversion</li>\n\t<li class="adsimple-211124080">das verwendete Betriebssystem</li>\n\t<li class="adsimple-211124080">die Adresse (URL) der zuvor besuchten Seite (Referrer URL)</li>\n\t<li class="adsimple-211124080">den Hostname und die IP-Adresse des Geräts von welchem aus zugegriffen wird</li>\n\t<li class="adsimple-211124080">Datum und Uhrzeit</li>\n</ul>\n\n<p>in Dateien (Webserver-Logfiles).</p>\n\n<p>In der Regel werden Webserver-Logfiles zwei Wochen gespeichert und danach automatisch gelöscht. Wir geben diese Daten nicht weiter, können jedoch nicht ausschließen, dass diese Daten beim Vorliegen von rechtswidrigem Verhalten eingesehen werden.</p>\n\n<h2 class="adsimple-211124080">Cookies</h2>\n\n<p>Unsere Webseite verwendet HTTP-Cookies, um nutzerspezifische Daten zu speichern.<br>\nIm Folgenden erklären wir, was Cookies sind und warum Sie genutzt werden, damit Sie die folgende Datenschutzerklärung besser verstehen.</p>\n\n<h3 class="adsimple-211124080">Was genau sind Cookies?</h3>\n\n<p>Immer wenn Sie durch das Internet surfen, verwenden Sie einen Browser. Bekannte Browser sind beispielsweise Chrome, Safari, Firefox, Internet Explorer und Microsoft Edge. Die meisten Webseiten speichern kleine Text-Dateien in Ihrem Browser. Diese Dateien nennt man Cookies.</p>\n\n<p>Eines ist nicht von der Hand zu weisen: Cookies sind echt nützliche Helferlein. Fast alle Webseiten verwenden Cookies. Genauer gesprochen sind es HTTP-Cookies, da es auch noch andere Cookies für andere Anwendungsbereiche gibt. HTTP-Cookies sind kleine Dateien, die von unserer Webseite auf Ihrem Computer gespeichert werden. Diese Cookie-Dateien werden automatisch im Cookie-Ordner, quasi dem „Hirn“ Ihres Browsers, untergebracht. Ein Cookie besteht aus einem Namen und einem Wert. Bei der Definition eines Cookies müssen zusätzlich ein oder mehrere Attribute angegeben werden.</p>\n\n<p>Cookies speichern gewisse Nutzerdaten von Ihnen, wie beispielsweise Sprache oder persönliche Seiteneinstellungen. Wenn Sie unsere Seite wieder aufrufen, übermittelt Ihr Browser die „userbezogenen“ Informationen an unsere Seite zurück. Dank der Cookies weiß unsere Webseite, wer Sie sind und bietet Ihnen die Einstellung, die Sie gewohnt sind. In einigen Browsern hat jedes Cookie eine eigene Datei, in anderen wie beispielsweise Firefox sind alle Cookies in einer einzigen Datei gespeichert.</p>\n\n<p>Es gibt sowohl Erstanbieter Cookies als auch Drittanbieter-Cookies. Erstanbieter-Cookies werden direkt von unserer Seite erstellt, Drittanbieter-Cookies werden von Partner-Webseiten (z.B. Google Analytics) erstellt. Jedes Cookie ist individuell zu bewerten, da jedes Cookie andere Daten speichert. Auch die Ablaufzeit eines Cookies variiert von ein paar Minuten bis hin zu ein paar Jahren. Cookies sind keine Software-Programme und enthalten keine Viren, Trojaner oder andere „Schädlinge“. Cookies können auch nicht auf Informationen Ihres PCs zugreifen.</p>\n\n<p>So können zum Beispiel Cookie-Daten aussehen:</p>\n\n<p><strong class="adsimple-211124080">Name:</strong> _ga<br>\n<strong class="adsimple-211124080">Wert:</strong> GA1.2.1326744211.152211124080-6<br>\n<strong class="adsimple-211124080">Verwendungszweck:</strong> Unterscheidung der Webseitenbesucher<br>\n<strong class="adsimple-211124080">Ablaufdatum:</strong> nach 2 Jahren</p>\n\n<p>Diese Mindestgrößen sollte ein Browser unterstützen können:</p>\n\n<ul class="adsimple-211124080">\n\t<li class="adsimple-211124080">Mindestens 4096 Bytes pro Cookie</li>\n\t<li class="adsimple-211124080">Mindestens 50 Cookies pro Domain</li>\n\t<li class="adsimple-211124080">Mindestens 3000 Cookies insgesamt</li>\n</ul>\n\n<h3 class="adsimple-211124080">Welche Arten von Cookies gibt es?</h3>\n\n<p>Die Frage welche Cookies wir im Speziellen verwenden, hängt von den verwendeten Diensten ab und wird in den folgenden Abschnitten der Datenschutzerklärung geklärt. An dieser Stelle möchten wir kurz auf die verschiedenen Arten von HTTP-Cookies eingehen.</p>\n\n<p>Man kann 4 Arten von Cookies unterscheiden:</p>\n\n<p><strong class="adsimple-211124080">Unerlässliche Cookies</strong><br>\nDiese Cookies sind nötig, um grundlegende Funktionen der Webseite sicherzustellen. Zum Beispiel braucht es diese Cookies, wenn ein User ein Produkt in den Warenkorb legt, dann auf anderen Seiten weitersurft und später erst zur Kasse geht. Durch diese Cookies wird der Warenkorb nicht gelöscht, selbst wenn der User sein Browserfenster schließt.</p>\n\n<p><strong class="adsimple-211124080">Zweckmäßige Cookies</strong><br>\nDiese Cookies sammeln Infos über das Userverhalten und ob der User etwaige Fehlermeldungen bekommt. Zudem werden mithilfe dieser Cookies auch die Ladezeit und das Verhalten der Webseite bei verschiedenen Browsern gemessen.</p>\n\n<p><strong class="adsimple-211124080">Zielorientierte Cookies</strong><br>\nDiese Cookies sorgen für eine bessere Nutzerfreundlichkeit. Beispielsweise werden eingegebene Standorte, Schriftgrößen oder Formulardaten gespeichert.</p>\n\n<p><strong class="adsimple-211124080">Werbe-Cookies</strong><br>\nDiese Cookies werden auch Targeting-Cookies genannt. Sie dienen dazu dem User individuell angepasste Werbung zu liefern. Das kann sehr praktisch, aber auch sehr nervig sein.</p>\n\n<p>Üblicherweise werden Sie beim erstmaligen Besuch einer Webseite gefragt, welche dieser Cookiearten Sie zulassen möchten. Und natürlich wird diese Entscheidung auch in einem Cookie gespeichert.</p>\n\n<h3 class="adsimple-211124080">Wie kann ich Cookies löschen?</h3>\n\n<p>Wie und ob Sie Cookies verwenden wollen, entscheiden Sie selbst. Unabhängig von welchem Service oder welcher Webseite die Cookies stammen, haben Sie immer die Möglichkeit Cookies zu löschen, zu deaktivieren oder nur teilweise zuzulassen. Zum Beispiel können Sie Cookies von Drittanbietern blockieren, aber alle anderen Cookies zulassen.</p>\n\n<p>Wenn Sie feststellen möchten, welche Cookies in Ihrem Browser gespeichert wurden, wenn Sie Cookie-Einstellungen ändern oder löschen wollen, können Sie dies in Ihren Browser-Einstellungen finden:</p>\n\n<p><a class="adsimple-211124080" href="https://support.google.com/chrome/answer/95647?tid=211124080" rel="noopener nofollow" target="_blank">Chrome: Cookies in Chrome löschen, aktivieren und verwalten</a></p>\n\n<p><a class="adsimple-211124080" href="https://support.apple.com/de-at/guide/safari/sfri11471/mac?tid=211124080" rel="noopener nofollow" target="_blank">Safari: Verwalten von Cookies und Websitedaten mit Safari</a></p>\n\n<p><a class="adsimple-211124080" href="https://support.mozilla.org/de/kb/cookies-und-website-daten-in-firefox-loschen?tid=211124080" rel="noopener nofollow" target="_blank">Firefox: Cookies löschen, um Daten zu entfernen, die Websites auf Ihrem Computer abgelegt haben</a></p>\n\n<p><a class="adsimple-211124080" href="https://support.microsoft.com/de-at/help/17442/windows-internet-explorer-delete-manage-cookies?tid=211124080" rel="noopener nofollow" target="_blank">Internet Explorer: Löschen und Verwalten von Cookies</a></p>\n\n<p><a class="adsimple-211124080" href="https://support.microsoft.com/de-at/help/4027947/windows-delete-cookies?tid=211124080" rel="noopener nofollow" target="_blank">Microsoft Edge: Löschen und Verwalten von Cookies</a></p>\n\n<p>Falls Sie grundsätzlich keine Cookies haben wollen, können Sie Ihren Browser so einrichten, dass er Sie immer informiert, wenn ein Cookie gesetzt werden soll. So können Sie bei jedem einzelnen Cookie entscheiden, ob Sie das Cookie erlauben oder nicht. Die Vorgangsweise ist je nach Browser verschieden. Am besten Sie suchen die Anleitung in Google mit dem Suchbegriff “Cookies löschen Chrome” oder „Cookies deaktivieren Chrome“ im Falle eines Chrome Browsers.</p>\n\n<h3 class="adsimple-211124080">Wie sieht es mit meinem Datenschutz aus?</h3>\n\n<p>Seit 2009 gibt es die sogenannten „Cookie-Richtlinien“. Darin ist festgehalten, dass das Speichern von Cookies eine Einwilligung des von Ihnen verlangt. Innerhalb der EU-Länder gibt es allerdings noch sehr unterschiedliche Reaktionen auf diese Richtlinien. In Österreich erfolgte aber die Umsetzung dieser Richtlinie in § 96 Abs. 3 des Telekommunikationsgesetzes (TKG).</p>\n\n<p>Wenn Sie mehr über Cookies wissen möchten und vor technischen Dokumentationen nicht zurückscheuen, empfehlen wir <a class="adsimple-211124080" href="https://tools.ietf.org/html/rfc6265" rel="nofollow noopener" target="_blank">https://tools.ietf.org/html/rfc6265</a>, dem Request for Comments der Internet Engineering Task Force (IETF) namens „HTTP State Management Mechanism“.</p>\n\n<h2 class="adsimple-211124080">Speicherung persönlicher Daten</h2>\n\n<p>Persönliche Daten, die Sie uns auf dieser Website elektronisch übermitteln, wie zum Beispiel Name, E-Mail-Adresse, Adresse oder andere persönlichen Angaben im Rahmen der Übermittlung eines Formulars oder Kommentaren im Blog, werden von uns gemeinsam mit dem Zeitpunkt und der IP-Adresse nur zum jeweils angegebenen Zweck verwendet, sicher verwahrt und nicht an Dritte weitergegeben.</p>\n\n<p>Wir nutzen Ihre persönlichen Daten somit nur für die Kommunikation mit jenen Besuchern, die Kontakt ausdrücklich wünschen und für die Abwicklung der auf dieser Webseite angebotenen Dienstleistungen und Produkte. Wir geben Ihre persönlichen Daten ohne Zustimmung nicht weiter, können jedoch nicht ausschließen, dass diese Daten beim Vorliegen von rechtswidrigem Verhalten eingesehen werden.</p>\n\n<p>Wenn Sie uns persönliche Daten per E-Mail schicken – somit abseits dieser Webseite – können wir keine sichere Übertragung und den Schutz Ihrer Daten garantieren. Wir empfehlen Ihnen, vertrauliche Daten niemals unverschlüsselt per E-Mail zu übermitteln.</p>\n\n<h2 class="adsimple-211124080">Rechte laut Datenschutzgrundverordnung</h2>\n\n<p>Ihnen stehen laut den Bestimmungen der DSGVO und des österreichischen <a class="adsimple-211124080" href="https://www.ris.bka.gv.at/GeltendeFassung.wxe?Abfrage=Bundesnormen&amp;Gesetzesnummer=10001597&amp;tid=211124080" rel="noopener nofollow" target="_blank">Datenschutzgesetzes (DSG)</a> grundsätzlich die folgende Rechte zu:</p>\n\n<ul class="adsimple-211124080">\n\t<li class="adsimple-211124080">Recht auf Berichtigung (Artikel 16 DSGVO)</li>\n\t<li class="adsimple-211124080">Recht auf Löschung („Recht auf Vergessenwerden“) (Artikel 17 DSGVO)</li>\n\t<li class="adsimple-211124080">Recht auf Einschränkung der Verarbeitung (Artikel 18 DSGVO)</li>\n\t<li class="adsimple-211124080">Recht auf Benachrichtigung – Mitteilungspflicht im Zusammenhang mit der Berichtigung oder Löschung personenbezogener Daten oder der Einschränkung der Verarbeitung (Artikel 19 DSGVO)</li>\n\t<li class="adsimple-211124080">Recht auf Datenübertragbarkeit (Artikel 20 DSGVO)</li>\n\t<li class="adsimple-211124080">Widerspruchsrecht (Artikel 21 DSGVO)</li>\n\t<li class="adsimple-211124080">Recht, nicht einer ausschließlich auf einer automatisierten Verarbeitung — einschließlich Profiling — beruhenden Entscheidung unterworfen zu werden (Artikel 22 DSGVO)</li>\n</ul>\n\n<p>Wenn Sie glauben, dass die Verarbeitung Ihrer Daten gegen das Datenschutzrecht verstößt oder Ihre datenschutzrechtlichen Ansprüche sonst in einer Weise verletzt worden sind, können Sie sich bei der Aufsichtsbehörde beschweren, welche in Österreich die Datenschutzbehörde ist, deren Webseite Sie unter <a class="adsimple-211124080" href="https://www.dsb.gv.at/?tid=211124080" rel="nofollow">https://www.dsb.gv.at/</a> finden.</p>\n\n<h2 class="adsimple-211124080">TLS-Verschlüsselung mit https</h2>\n\n<p>Wir verwenden https um Daten abhörsicher im Internet zu übertragen (Datenschutz durch Technikgestaltung <a class="adsimple-211124080" href="https://eur-lex.europa.eu/legal-content/DE/TXT/HTML/?uri=CELEX:32016R0679&amp;from=DE&amp;tid=211124080" rel="noopener nofollow" target="_blank">Artikel 25 Absatz 1 DSGVO</a>). Durch den Einsatz von TLS (Transport Layer Security), einem Verschlüsselungsprotokoll zur sicheren Datenübertragung im Internet können wir den Schutz vertraulicher Daten sicherstellen. Sie erkennen die Benutzung dieser Absicherung der Datenübertragung am kleinen Schlosssymbol links oben im Browser und der Verwendung des Schemas https (anstatt http) als Teil unserer Internetadresse.</p>\n\n<p style="margin-top: 15px;">Quelle: Erstellt mit dem <a href="https://www.firmenwebseiten.at/datenschutz-generator/" rel="follow" style="text-decoration: none;" target="_blank" title="Datenschutz Generator von firmenwebseiten.at">Datenschutz Generator von firmenwebseiten.at</a> in Kooperation mit <a class="external" href="https://www.wallentin.cc" rel="follow" style="text-decoration: none;" target="_blank" title="ästhetische Operationen in Wien bei Dr. Doris Wallentin">wallentin.cc</a></p>
790	<h2>Adresse</h2>\n\n<div>Weltladen Baden</div>\n\n<div>Hauptplatz 9-13, 2500 Baden</div>\n\n<div>Tel: +43 2252 45236</div>\n\n<div>Mail: <a href="mailto:info@weltladen-baden.at">info@weltladen-baden.at</a></div>\n\n<div> </div>\n\n<h3>Konto-Verbindung:</h3>\n\n<div>IBAN: AT90 4300 0364 0778 0000<br>\nBIC: VB0EATWW</div>
738	<p class="adsimple-221124081">Informationspflicht laut §5 E-Commerce Gesetz, §14 Unternehmensgesetzbuch, §63 Gewerbeordnung und Offenlegungspflicht laut §25 Mediengesetz.</p>\n\n<p class="adsimple-221124081">Balance Global<br>\n<strong>ZVR:</strong> <span class="blob-code-inner blob-code-marker" data-code-marker="-">819231948</span></p>\n\n<p class="adsimple-221124081">Hauptplatz 9-13,<br>\n2500 Baden,<br>\nÖsterreich</p>\n\n<p class="adsimple-221124081"><strong>Organschaftliche Vertreter</strong><br>\nObmann/Obfrau: Jutta Enzersdorfer<br>\nObmann/Obfrau Stellvertreter: Jasmine Bachmann</p>\n\n<p class="adsimple-221124081"><strong>Vereinssitz:</strong> 2500 Baden<br>\n<strong>Tel.:</strong> +43 2252 45236<br>\n<strong>E-Mail:</strong> <a href="mailto:info@weltladen-baden.at">info@weltladen-baden.at</a></p>\n\n<p class="adsimple-221124081"><strong>Vereinszweck:</strong><br>\nZweck des Vereines ist es, insbesondere durch Information, aber auch durch entsprechende Aktionen aufzuzeigen, dass zwei Drittel der Menschheit ihre Grundbedürfnisse nach Arbeit, Nahrung, Bildung, Kleidung und Wohnung nicht ausreichend befriedigen können. Andererseits soll durch konkrete Aktionen ideell, sozial, materiell und finanziell Benachteiligten in sogenannten Entwicklungsländern und bei uns geholfen werden, ihre Lebenssituation selbst zu verbessern und gleichzeitig mit uns ein Netz der internationalen Solidarität unter den Völkern der Welt aufzubauen. Der Verein ist nicht auf Gewinn ausgerichtet und verfolgt rein gemeinnützige Ziele. Jede parteipolitische Tätigkeit ist ausgeschlossen. Gleichbehandlung nach innen und nach außen ist uns wichtig, insbesondere zwischen Frauen und Männern, In- und Ausländern sowie alten und jungen Menschen.</p>\n\n<p style="margin-top: 15px;">Quelle: Erstellt mit dem <a href="https://www.firmenwebseiten.at/impressum-generator/" rel="follow" style="text-decoration: none;" target="_blank" title="Impressum Generator von firmenwebseiten.at">Impressum Generator von firmenwebseiten.at</a> in Kooperation mit <a class="external" href="https://www.wallentin.cc/behandlung/oberlidstraffung-obere-blepharoplastik-schlupflider-wien/" rel="follow" style="text-decoration: none;" target="_blank" title="Oberlidkorrektur (obere Blepharoplastik) Wien bei Dr. Wallentin">Dr. Wallentin</a></p>\n\n<h2 class="adsimple-221124081">EU-Streitschlichtung</h2>\n\n<p>Gemäß Verordnung über Online-Streitbeilegung in Verbraucherangelegenheiten (ODR-Verordnung) möchten wir Sie über die Online-Streitbeilegungsplattform (OS-Plattform) informieren.<br>\nVerbraucher haben die Möglichkeit, Beschwerden an die Online Streitbeilegungsplattform der Europäischen Kommission unter <a class="adsimple-221124081" href="https://ec.europa.eu/consumers/odr/main/index.cfm?event=main.home2.show&amp;lng=DE" rel="nofollow" target="_blank">http://ec.europa.eu/odr?tid=221124081</a> zu richten. Die dafür notwendigen Kontaktdaten finden Sie oberhalb in unserem Impressum.</p>\n\n<p>Wir möchten Sie jedoch darauf hinweisen, dass wir nicht bereit oder verpflichtet sind, an Streitbeilegungsverfahren vor einer Verbraucherschlichtungsstelle teilzunehmen.</p>\n\n<h2 class="adsimple-221124081">Haftung für Inhalte dieser Webseite</h2>\n\n<p>Wir entwickeln die Inhalte dieser Webseite ständig weiter und bemühen uns korrekte und aktuelle Informationen bereitzustellen. Leider können wir keine Haftung für die Korrektheit aller Inhalte auf dieser Webseite übernehmen, speziell für jene die seitens Dritter bereitgestellt wurden.</p>\n\n<p>Sollten Ihnen problematische oder rechtswidrige Inhalte auffallen, bitten wir Sie uns umgehend zu kontaktieren, Sie finden die Kontaktdaten im Impressum.</p>\n\n<h2 class="adsimple-221124081">Haftung für Links auf dieser Webseite</h2>\n\n<p>Unsere Webseite enthält Links zu anderen Webseiten für deren Inhalt wir nicht verantwortlich sind. Haftung für verlinkte Websites besteht laut <a class="adsimple-221124081" href="https://www.ris.bka.gv.at/Dokument.wxe?Abfrage=Bundesnormen&amp;Dokumentnummer=NOR40025813&amp;tid=221124081" rel="noopener nofollow" target="_blank">§ 17 ECG</a> für uns nicht, da wir keine Kenntnis rechtswidriger Tätigkeiten hatten und haben, uns solche Rechtswidrigkeiten auch bisher nicht aufgefallen sind und wir Links sofort entfernen würden, wenn uns Rechtswidrigkeiten bekannt werden.</p>\n\n<p>Wenn Ihnen rechtswidrige Links auf unserer Website auffallen, bitten wir Sie uns zu kontaktieren, Sie finden die Kontaktdaten im Impressum.</p>\n\n<h2 class="adsimple-221124081">Urheberrechtshinweis</h2>\n\n<p>Alle Inhalte dieser Webseite (Bilder, Fotos, Texte, Videos) unterliegen dem Urheberrecht. Falls notwendig, werden wir die unerlaubte Nutzung von Teilen der Inhalte unserer Seite rechtlich verfolgen.</p>\n\n<h2 class="adsimple-221124081">Bildernachweis</h2>\n\n<p>Die Bilder, Fotos und Grafiken auf dieser Webseite sind urheberrechtlich geschützt.</p>\n\n<p>Die Bilderrechte liegen bei den folgenden Fotografen und Unternehmen:</p>\n\n<ul class="adsimple-221124081">\n\t<li class="adsimple-221124081">TODO</li>\n</ul>\n\n<p style="margin-top: 15px;">Quelle: Erstellt mit dem <a href="https://www.firmenwebseiten.at/datenschutz-generator/" rel="follow" style="text-decoration: none;" target="_blank" title="Datenschutz Generator von firmenwebseiten.at">Datenschutz Generator von firmenwebseiten.at</a> in Kooperation mit <a class="external" href="https://www.aboutbusiness.at" rel="follow" style="text-decoration: none;" target="_blank" title="">aboutbusiness.at</a></p>
791	<div><a href="https://www.instagram.com/weltladenbaden/" target="_blank">Instagram</a><br>\n<a href="https://www.facebook.com/Weltladen-Baden-1618306061749181/" target="_blank">Facebook</a></div>
748	<p class="adsimple-221124081">Informationspflicht laut §5 E-Commerce Gesetz, §14 Unternehmensgesetzbuch, §63 Gewerbeordnung und Offenlegungspflicht laut §25 Mediengesetz.</p>\n\n<p class="adsimple-221124081">Balance Global<br>\n<strong>ZVR:</strong> <span class="blob-code-inner blob-code-marker" data-code-marker="-">819231948</span></p>\n\n<p class="adsimple-221124081">Hauptplatz 9-13,<br>\n2500 Baden,<br>\nÖsterreich</p>\n\n<p class="adsimple-221124081"><strong>Organschaftliche Vertreter</strong><br>\nObmann/Obfrau: Jutta Enzersdorfer<br>\nObmann/Obfrau Stellvertreter: Jasmine Bachmann</p>\n\n<p class="adsimple-221124081"><strong>Vereinssitz:</strong> 2500 Baden<br>\n<strong>Tel.:</strong> +43 2252 45236<br>\n<strong>E-Mail:</strong> <a href="mailto:info@weltladen-baden.at">info@weltladen-baden.at</a></p>\n\n<p class="adsimple-221124081"><strong>Vereinszweck:</strong><br>\nZweck des Vereines ist es, insbesondere durch Information, aber auch durch entsprechende Aktionen aufzuzeigen, dass zwei Drittel der Menschheit ihre Grundbedürfnisse nach Arbeit, Nahrung, Bildung, Kleidung und Wohnung nicht ausreichend befriedigen können. Andererseits soll durch konkrete Aktionen ideell, sozial, materiell und finanziell Benachteiligten in sogenannten Entwicklungsländern und bei uns geholfen werden, ihre Lebenssituation selbst zu verbessern und gleichzeitig mit uns ein Netz der internationalen Solidarität unter den Völkern der Welt aufzubauen. Der Verein ist nicht auf Gewinn ausgerichtet und verfolgt rein gemeinnützige Ziele. Jede parteipolitische Tätigkeit ist ausgeschlossen. Gleichbehandlung nach innen und nach außen ist uns wichtig, insbesondere zwischen Frauen und Männern, In- und Ausländern sowie alten und jungen Menschen.</p>\n\n<p style="margin-top: 15px;">Quelle: Erstellt mit dem <a href="https://www.firmenwebseiten.at/impressum-generator/" rel="follow" style="text-decoration: none;" target="_blank" title="Impressum Generator von firmenwebseiten.at">Impressum Generator von firmenwebseiten.at</a> in Kooperation mit <a class="external" href="https://www.wallentin.cc/behandlung/oberlidstraffung-obere-blepharoplastik-schlupflider-wien/" rel="follow" style="text-decoration: none;" target="_blank" title="Oberlidkorrektur (obere Blepharoplastik) Wien bei Dr. Wallentin">Dr. Wallentin</a></p>\n\n<h2 class="adsimple-221124081">EU-Streitschlichtung</h2>\n\n<p>Gemäß Verordnung über Online-Streitbeilegung in Verbraucherangelegenheiten (ODR-Verordnung) möchten wir Sie über die Online-Streitbeilegungsplattform (OS-Plattform) informieren.<br>\nVerbraucher haben die Möglichkeit, Beschwerden an die Online Streitbeilegungsplattform der Europäischen Kommission unter <a class="adsimple-221124081" href="https://ec.europa.eu/consumers/odr/main/index.cfm?event=main.home2.show&amp;lng=DE" rel="nofollow" target="_blank">http://ec.europa.eu/odr?tid=221124081</a> zu richten. Die dafür notwendigen Kontaktdaten finden Sie oberhalb in unserem Impressum.</p>\n\n<p>Wir möchten Sie jedoch darauf hinweisen, dass wir nicht bereit oder verpflichtet sind, an Streitbeilegungsverfahren vor einer Verbraucherschlichtungsstelle teilzunehmen.</p>\n\n<h2 class="adsimple-221124081">Haftung für Inhalte dieser Webseite</h2>\n\n<p>Wir entwickeln die Inhalte dieser Webseite ständig weiter und bemühen uns korrekte und aktuelle Informationen bereitzustellen. Leider können wir keine Haftung für die Korrektheit aller Inhalte auf dieser Webseite übernehmen, speziell für jene die seitens Dritter bereitgestellt wurden.</p>\n\n<p>Sollten Ihnen problematische oder rechtswidrige Inhalte auffallen, bitten wir Sie uns umgehend zu kontaktieren, Sie finden die Kontaktdaten im Impressum.</p>\n\n<h2 class="adsimple-221124081">Haftung für Links auf dieser Webseite</h2>\n\n<p>Unsere Webseite enthält Links zu anderen Webseiten für deren Inhalt wir nicht verantwortlich sind. Haftung für verlinkte Websites besteht laut <a class="adsimple-221124081" href="https://www.ris.bka.gv.at/Dokument.wxe?Abfrage=Bundesnormen&amp;Dokumentnummer=NOR40025813&amp;tid=221124081" rel="noopener nofollow" target="_blank">§ 17 ECG</a> für uns nicht, da wir keine Kenntnis rechtswidriger Tätigkeiten hatten und haben, uns solche Rechtswidrigkeiten auch bisher nicht aufgefallen sind und wir Links sofort entfernen würden, wenn uns Rechtswidrigkeiten bekannt werden.</p>\n\n<p>Wenn Ihnen rechtswidrige Links auf unserer Website auffallen, bitten wir Sie uns zu kontaktieren, Sie finden die Kontaktdaten im Impressum.</p>\n\n<h2 class="adsimple-221124081">Urheberrechtshinweis</h2>\n\n<p>Alle Inhalte dieser Webseite (Bilder, Fotos, Texte, Videos) unterliegen dem Urheberrecht. Falls notwendig, werden wir die unerlaubte Nutzung von Teilen der Inhalte unserer Seite rechtlich verfolgen.</p>\n\n<h2 class="adsimple-221124081">Bildernachweis</h2>\n\n<p>Die Bilder, Fotos und Grafiken auf dieser Webseite sind urheberrechtlich geschützt.</p>\n\n<p>Die Bilderrechte liegen bei den folgenden Fotografen und Unternehmen:</p>\n\n<ul class="adsimple-221124081">\n\t<li class="adsimple-221124081">TODO</li>\n</ul>\n\n<p style="margin-top: 15px;">Quelle: Erstellt mit dem <a href="https://www.firmenwebseiten.at/datenschutz-generator/" rel="follow" style="text-decoration: none;" target="_blank" title="Datenschutz Generator von firmenwebseiten.at">Datenschutz Generator von firmenwebseiten.at</a> in Kooperation mit <a class="external" href="https://www.aboutbusiness.at" rel="follow" style="text-decoration: none;" target="_blank" title="">aboutbusiness.at</a></p>
809	<div><a href="https://www.instagram.com/weltladenbaden/" target="_blank">Instagram</a><br>\n<a href="https://www.facebook.com/Weltladen-Baden-1618306061749181/" target="_blank">Facebook</a></div>
869	<h2>Our Catalog List View</h2>\n
882	<h1 style="text-align: center;">Willkommen auf unserer Homepage</h1>
910	<p>Vestibulum id ligula porta felis euismod semper. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
917	<h2><strong>§ 1 Grundlegende Bestimmungen</strong></h2>\n\n<div>1) Die nachstehenden Geschäftsbedingungen gelten für Verträge die über https://www.weltladen-baden.at geschlossen werden. Soweit nicht anders vereinbart, wird eigens von Ihnen verwendeten Bedingungen widersprochen.</div>\n\n<div>2) Verbraucher im Sinne dieser Regelung ist jede natürliche Person, die ein Rechtsgeschäft mit privaten Anliegen abschließt. Unternehmer ist jede natürliche oder juristische Person, die bei Abschluss des Rechtsgeschäfts im Sinne ihrer beruflichen oder gewerblichen Interessen handelt.</div>\n\n<h2><strong>§ 2 Zustandekommen des Vertrages</strong></h2>\n\n<div>1) Vertragsgegenstand ist der Verkauf von Waren.</div>\n\n<div>2) Mit der Bereitstellung eines Produktes in unserem Shop unterbreiten wir unseren Kunden ein verbindliches Angebot zum Abschluss eines Kaufvertrages.</div>\n\n<div>3) Alle zum Kauf beabsichtigten Produkte werden vom Kunden im „Warenkorb“ abgelegt. Nach Eingabe der persönlichen Daten und Zahlungsinformationen hat der Kunde die Möglichkeit alle eingegebenen Informationen zu überprüfen. Mit dem Absenden der Bestellung durch Klick auf die dafür vorgesehene Schaltfläche erklärt der Kunde rechtsverbindlich die Annahme des Angebotes. Damit ist der Kaufvertrag zustande gekommen.</div>\n\n<div>4) Die Übermittlung aller Informationen im Zusammenhang mit dem Vertragsschluss erfolgt automatisiert per E-Mail. Der Kunde hat daher sicherzustellen, dass die bei uns hinterlegte E-Mail-Adresse erreichbar ist.</div>\n\n<h2><strong>§ 3 Eigentumsvorbehalt un</strong><strong>d </strong><strong>Zurückbehaltungsrecht</strong></h2>\n\n<div>1) Ein Zurückbehaltungsrecht kann vom Kunden nur dann ausgeübt werden, sofern es nicht Forderungen aus selbigem Vertragsverhältnis sind.</div>\n\n<div>2) Bis zur vollständigen Zahlung des Kaufpreises bleibt die Ware Eigentum des Shop-Betreibers.</div>\n\n<h2><strong>§ 4 Bestimmungen zur Haftung</strong></h2>\n\n<div>1) Für Schäden an Körper oder der Gesundheit haften wir uneingeschränkt, sowie in Fällen des Vorsatzes und grober Fahrlässigkeit. Weiterhin bei arglistigem Verschweigen eines Mangels und in allen anderen gesetzlich geregelten Fällen. Die Haftung für Mängel im Rahmen der gesetzlichen Gewährleistung ist der entsprechenden Regelung in unseren Kundeninformationen zu entnehmen.</div>\n\n<div>2) Sofern wesentliche Vertragspflichten nicht erfüllt werden, ist die Haftung des Onlineshops bei leichter Fahrlässigkeit auf den vorhersehbaren, vertragstypischen Schaden beschränkt.</div>\n\n<div>3) Bei der Verletzung unwesentlicher Pflichten die aus dem Vertrag hervorgehen, ist die Haftung bei leicht fahrlässigen Pflichtverletzungen ausgeschlossen.</div>\n\n<div>4) Es erfolgt keine Haftung für die stetige Verfügbarkeit dieser Website und der darauf angebotenen Waren.</div>\n\n<h2><strong>§ 5 Rechtswahl</strong></h2>\n\n<div>1) Es gilt österreichisches Recht. Die Bestimmungen des UN-Kaufrechts finden ausdrücklich keine Anwendung.</div>\n\n<h2><strong>§ 6 Streitbeilegung</strong></h2>\n\n<div>1) Die Europäische Kommission stellt für die außergerichtliche Online-Streitbeilegung eine Plattform bereit (OS-Plattform), die unter <a href="http://ec.europa.eu/odr">http://ec.europa.eu/odr</a> abrufbar ist.</div>\n\n<h2><strong>§ 7 Vertragssprache, Vertragstextspeicherung</strong></h2>\n\n<div>1) Vertragssprache ist deutsch.</div>\n\n<div>2) Der vollständige Vertragstext wird von uns nicht gespeichert. Kunden können dies vor Absenden der Bestellung über die Druckfunktion des Browsers elektronisch sichern.</div>\n\n<h2><strong>§ 8 Preise und Zahlungsmodalitäten Merkmale der Waren</strong></h2>\n\n<div>1) Die ausgewiesenen Preise sowie die Versandkosten stellen Brutto-Preise dar.</div>\n\n<div>2) Versandkosten sind nicht im Kaufpreis enthalten. Sie sind explizit gekennzeichnet oder werden im Laufe des Bestellvorganges gesondert ausgewiesen und sind vom Kunden zusätzlich zu tragen, soweit nicht eine kostenfreie Lieferung zugesagt ist.</div>\n\n<div>3) Die zur Verfügung stehenden Zahlungsmethoden sind auf unserer Webseite oder in der jeweiligen Artikelbeschreibung ausgewiesen, spätestens aber im abschließenden Bestellprozess an der „Bezahlmethoden“ genannt. Soweit nicht anders angegeben, sind die Zahlungsansprüche aus dem Vertrag unmittelbar zur Zahlung fällig.</div>\n\n<div>4) Die wesentlichen Merkmale der Ware und/oder Dienstleistung finden sich in der Artikelbeschreibung und den ergänzenden Angaben auf unserer Internetseite.</div>\n\n<h2><strong>§ 9 Lieferbedingungen</strong></h2>\n\n<div>1) Lieferbedingungen, Lieferzeit sowie ggf. bestehende Beschränkungen zur Lieferung finden sich unter dem entsprechend bezeichneten Link in unserem Onlineshop oder in der jeweiligen Artikelbeschreibung.</div>\n\n<div>2) Für Verbraucher gilt, dass die Gefahr des zufälligen Untergangs oder der Verschlechterung der verkauften Ware während der Versendung erst mit der Übergabe der Ware an den Kunden übergeht. Die Regelung gilt unabhängig davon, ob die Versendung versichert oder unversichert erfolgt.</div>\n\n<h2><strong>§ 10 Gesetzliches Mängelhaftungsrecht</strong></h2>\n\n<div>1) Die gesetzlichen Mängelhaftungsrechte haben bestand.</div>\n\n<div>2) Verbraucher werden gebeten, die Ware bei Lieferung auf Vollständigkeit, offensichtliche Mängel und Transportschäden zu überprüfen und dem Shop-Betreiber schnellstmöglich mitzuteilen. Wird dem nicht vom Kunden nachgekommen hat dies keine Auswirkung auf seine gesetzlichen Gewährleistungsansprüche.</div>\n\n<address> </address>\n\n<address><b>Quelle:</b> Diese AGB und Kundeninformationen für Onlineshops wurden mit der Vorlage von <a href="https://website-tutor.com/agb-muster/" target="_blank">Website-Tutor.com</a> erstellt.</address>\n\n<div><br>\n </div>
922	<h2><strong>§ 1 Grundlegende Bestimmungen</strong></h2>\n\n<div>1) Die nachstehenden Geschäftsbedingungen gelten für Verträge die über https://www.weltladen-baden.at geschlossen werden. Soweit nicht anders vereinbart, wird eigens von Ihnen verwendeten Bedingungen widersprochen.</div>\n\n<div>2) Verbraucher im Sinne dieser Regelung ist jede natürliche Person, die ein Rechtsgeschäft mit privaten Anliegen abschließt. Unternehmer ist jede natürliche oder juristische Person, die bei Abschluss des Rechtsgeschäfts im Sinne ihrer beruflichen oder gewerblichen Interessen handelt.</div>\n\n<h2><strong>§ 2 Zustandekommen des Vertrages</strong></h2>\n\n<div>1) Vertragsgegenstand ist der Verkauf von Waren.</div>\n\n<div>2) Mit der Bereitstellung eines Produktes in unserem Shop unterbreiten wir unseren Kunden ein verbindliches Angebot zum Abschluss eines Kaufvertrages.</div>\n\n<div>3) Alle zum Kauf beabsichtigten Produkte werden vom Kunden im „Warenkorb“ abgelegt. Nach Eingabe der persönlichen Daten und Zahlungsinformationen hat der Kunde die Möglichkeit alle eingegebenen Informationen zu überprüfen. Mit dem Absenden der Bestellung durch Klick auf die dafür vorgesehene Schaltfläche erklärt der Kunde rechtsverbindlich die Annahme des Angebotes. Damit ist der Kaufvertrag zustande gekommen.</div>\n\n<div>4) Die Übermittlung aller Informationen im Zusammenhang mit dem Vertragsschluss erfolgt automatisiert per E-Mail. Der Kunde hat daher sicherzustellen, dass die bei uns hinterlegte E-Mail-Adresse erreichbar ist.</div>\n\n<h2><strong>§ 3 Eigentumsvorbehalt un</strong><strong>d </strong><strong>Zurückbehaltungsrecht</strong></h2>\n\n<div>1) Ein Zurückbehaltungsrecht kann vom Kunden nur dann ausgeübt werden, sofern es nicht Forderungen aus selbigem Vertragsverhältnis sind.</div>\n\n<div>2) Bis zur vollständigen Zahlung des Kaufpreises bleibt die Ware Eigentum des Shop-Betreibers.</div>\n\n<h2><strong>§ 4 Bestimmungen zur Haftung</strong></h2>\n\n<div>1) Für Schäden an Körper oder der Gesundheit haften wir uneingeschränkt, sowie in Fällen des Vorsatzes und grober Fahrlässigkeit. Weiterhin bei arglistigem Verschweigen eines Mangels und in allen anderen gesetzlich geregelten Fällen. Die Haftung für Mängel im Rahmen der gesetzlichen Gewährleistung ist der entsprechenden Regelung in unseren Kundeninformationen zu entnehmen.</div>\n\n<div>2) Sofern wesentliche Vertragspflichten nicht erfüllt werden, ist die Haftung des Onlineshops bei leichter Fahrlässigkeit auf den vorhersehbaren, vertragstypischen Schaden beschränkt.</div>\n\n<div>3) Bei der Verletzung unwesentlicher Pflichten die aus dem Vertrag hervorgehen, ist die Haftung bei leicht fahrlässigen Pflichtverletzungen ausgeschlossen.</div>\n\n<div>4) Es erfolgt keine Haftung für die stetige Verfügbarkeit dieser Website und der darauf angebotenen Waren.</div>\n\n<h2><strong>§ 5 Rechtswahl</strong></h2>\n\n<div>1) Es gilt österreichisches Recht. Die Bestimmungen des UN-Kaufrechts finden ausdrücklich keine Anwendung.</div>\n\n<h2><strong>§ 6 Streitbeilegung</strong></h2>\n\n<div>1) Die Europäische Kommission stellt für die außergerichtliche Online-Streitbeilegung eine Plattform bereit (OS-Plattform), die unter <a href="http://ec.europa.eu/odr">http://ec.europa.eu/odr</a> abrufbar ist.</div>\n\n<h2><strong>§ 7 Vertragssprache, Vertragstextspeicherung</strong></h2>\n\n<div>1) Vertragssprache ist deutsch.</div>\n\n<div>2) Der vollständige Vertragstext wird von uns nicht gespeichert. Kunden können dies vor Absenden der Bestellung über die Druckfunktion des Browsers elektronisch sichern.</div>\n\n<h2><strong>§ 8 Preise und Zahlungsmodalitäten Merkmale der Waren</strong></h2>\n\n<div>1) Die ausgewiesenen Preise sowie die Versandkosten stellen Brutto-Preise dar.</div>\n\n<div>2) Versandkosten sind nicht im Kaufpreis enthalten. Sie sind explizit gekennzeichnet oder werden im Laufe des Bestellvorganges gesondert ausgewiesen und sind vom Kunden zusätzlich zu tragen, soweit nicht eine kostenfreie Lieferung zugesagt ist.</div>\n\n<div>3) Die zur Verfügung stehenden Zahlungsmethoden sind auf unserer Webseite oder in der jeweiligen Artikelbeschreibung ausgewiesen, spätestens aber im abschließenden Bestellprozess an der „Bezahlmethoden“ genannt. Soweit nicht anders angegeben, sind die Zahlungsansprüche aus dem Vertrag unmittelbar zur Zahlung fällig.</div>\n\n<div>4) Die wesentlichen Merkmale der Ware und/oder Dienstleistung finden sich in der Artikelbeschreibung und den ergänzenden Angaben auf unserer Internetseite.</div>\n\n<h2><strong>§ 9 Lieferbedingungen</strong></h2>\n\n<div>1) Lieferbedingungen, Lieferzeit sowie ggf. bestehende Beschränkungen zur Lieferung finden sich unter dem entsprechend bezeichneten Link in unserem Onlineshop oder in der jeweiligen Artikelbeschreibung.</div>\n\n<div>2) Für Verbraucher gilt, dass die Gefahr des zufälligen Untergangs oder der Verschlechterung der verkauften Ware während der Versendung erst mit der Übergabe der Ware an den Kunden übergeht. Die Regelung gilt unabhängig davon, ob die Versendung versichert oder unversichert erfolgt.</div>\n\n<h2><strong>§ 10 Gesetzliches Mängelhaftungsrecht</strong></h2>\n\n<div>1) Die gesetzlichen Mängelhaftungsrechte haben bestand.</div>\n\n<div>2) Verbraucher werden gebeten, die Ware bei Lieferung auf Vollständigkeit, offensichtliche Mängel und Transportschäden zu überprüfen und dem Shop-Betreiber schnellstmöglich mitzuteilen. Wird dem nicht vom Kunden nachgekommen hat dies keine Auswirkung auf seine gesetzlichen Gewährleistungsansprüche.</div>\n\n<address> </address>\n\n<address><b>Quelle:</b> Diese AGB und Kundeninformationen für Onlineshops wurden mit der Vorlage von <a href="https://website-tutor.com/agb-muster/" target="_blank">Website-Tutor.com</a> erstellt.</address>\n\n<div><br>\n </div>
935	<p>Vestibulum id ligula porta felis euismod semper. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
1102	<p>Ich habe die <cms-plugin alt="Link - Datenschutzvereinbarung " title="Link - Datenschutzvereinbarung" id="1103"></cms-plugin> gelesen.</p>
987	<p>Ich habe die <cms-plugin alt="Link - Datenschutzvereinbarung " title="Link - Datenschutzvereinbarung" id="988"></cms-plugin> gelesen.</p>
1128	<p>Ich habe die <cms-plugin alt="Link - AGBs " title="Link - AGBs" id="1129"></cms-plugin> gelesen und verstanden.</p>
1162	<h1 style="text-align: center;">Willkommen auf unserer Homepage</h1>
\.


--
-- Data for Name: easy_thumbnails_source; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.easy_thumbnails_source (id, storage_hash, name, modified) FROM stdin;
3	f9bde26a1556cd667f742bd34ec7c55e	filer_public/db/d2/dbd28a47-4275-4193-a25b-ced01748349e/98000.jpg	2020-04-26 21:08:53.529163+02
2	f9bde26a1556cd667f742bd34ec7c55e	filer_public/fb/07/fb076063-cb6d-4d4b-9181-79c9e6ec16a9/97975.jpg	2020-04-29 20:24:30.124909+02
4	f9bde26a1556cd667f742bd34ec7c55e	filer_public/21/35/213591e4-1574-481b-9985-c5f9a3f6ba49/banner.png	2020-04-29 20:58:33.85023+02
5	f9bde26a1556cd667f742bd34ec7c55e	filer_public/8b/c6/8bc65fc9-4034-4a1f-8071-a778d5dc99da/weltladen.png	2020-04-30 19:59:27.380429+02
\.


--
-- Data for Name: easy_thumbnails_thumbnail; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.easy_thumbnails_thumbnail (id, storage_hash, name, modified, source_id) FROM stdin;
8	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/fb/07/fb076063-cb6d-4d4b-9181-79c9e6ec16a9/97975.jpg__16x16_q85_crop_subsampling-2_upscale.jpg	2020-04-26 21:08:49.555844+02	2
9	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/fb/07/fb076063-cb6d-4d4b-9181-79c9e6ec16a9/97975.jpg__32x32_q85_crop_subsampling-2_upscale.jpg	2020-04-26 21:08:49.599602+02	2
10	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/fb/07/fb076063-cb6d-4d4b-9181-79c9e6ec16a9/97975.jpg__48x48_q85_crop_subsampling-2_upscale.jpg	2020-04-26 21:08:49.640327+02	2
11	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/fb/07/fb076063-cb6d-4d4b-9181-79c9e6ec16a9/97975.jpg__80x80_q85_crop_subsampling-2_upscale.jpg	2020-04-26 21:08:49.680172+02	2
12	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/fb/07/fb076063-cb6d-4d4b-9181-79c9e6ec16a9/97975.jpg__128x128_q85_crop_subsampling-2_upscale.jpg	2020-04-26 21:08:49.721917+02	2
13	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/fb/07/fb076063-cb6d-4d4b-9181-79c9e6ec16a9/97975.jpg__180x180_q85_crop_subsampling-2_upscale.jpg	2020-04-26 21:08:49.766429+02	2
14	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/db/d2/dbd28a47-4275-4193-a25b-ced01748349e/98000.jpg__16x16_q85_crop_subsampling-2_upscale.jpg	2020-04-26 21:08:53.537337+02	3
15	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/db/d2/dbd28a47-4275-4193-a25b-ced01748349e/98000.jpg__32x32_q85_crop_subsampling-2_upscale.jpg	2020-04-26 21:08:53.583039+02	3
16	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/db/d2/dbd28a47-4275-4193-a25b-ced01748349e/98000.jpg__48x48_q85_crop_subsampling-2_upscale.jpg	2020-04-26 21:08:53.626062+02	3
17	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/db/d2/dbd28a47-4275-4193-a25b-ced01748349e/98000.jpg__80x80_q85_crop_subsampling-2_upscale.jpg	2020-04-26 21:08:53.66914+02	3
18	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/db/d2/dbd28a47-4275-4193-a25b-ced01748349e/98000.jpg__128x128_q85_crop_subsampling-2_upscale.jpg	2020-04-26 21:08:53.715431+02	3
19	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/db/d2/dbd28a47-4275-4193-a25b-ced01748349e/98000.jpg__180x180_q85_crop_subsampling-2_upscale.jpg	2020-04-26 21:08:53.760621+02	3
20	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/fb/07/fb076063-cb6d-4d4b-9181-79c9e6ec16a9/97975.jpg__250x250_q85_crop_subsampling-2.jpg	2020-04-26 21:09:12.952125+02	2
21	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/fb/07/fb076063-cb6d-4d4b-9181-79c9e6ec16a9/97975.jpg__80x80_q85_crop_subsampling-2.jpg	2020-04-26 21:10:30.902635+02	2
22	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/fb/07/fb076063-cb6d-4d4b-9181-79c9e6ec16a9/97975.jpg__160x160_q85_crop_subsampling-2.jpg	2020-04-26 21:10:30.983466+02	2
23	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/fb/07/fb076063-cb6d-4d4b-9181-79c9e6ec16a9/97975.jpg__50x50_q85_crop_subsampling-2.jpg	2020-04-26 21:10:31.383788+02	2
24	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/fb/07/fb076063-cb6d-4d4b-9181-79c9e6ec16a9/97975.jpg__100x100_q85_crop_subsampling-2.jpg	2020-04-26 21:10:31.440511+02	2
25	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/fb/07/fb076063-cb6d-4d4b-9181-79c9e6ec16a9/97975.jpg__320x320_q85_crop_subsampling-2.jpg	2020-04-26 22:22:45.497884+02	2
26	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/fb/07/fb076063-cb6d-4d4b-9181-79c9e6ec16a9/97975.jpg__244x244_q85_crop_subsampling-2.jpg	2020-04-29 20:24:30.052588+02	2
27	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/fb/07/fb076063-cb6d-4d4b-9181-79c9e6ec16a9/97975.jpg__488x488_q85_crop_subsampling-2.jpg	2020-04-29 20:24:30.133984+02	2
28	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/21/35/213591e4-1574-481b-9985-c5f9a3f6ba49/banner.png__16x16_q85_crop_subsampling-2_upscale.png	2020-04-29 20:58:20.316872+02	4
29	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/21/35/213591e4-1574-481b-9985-c5f9a3f6ba49/banner.png__32x32_q85_crop_subsampling-2_upscale.png	2020-04-29 20:58:20.36778+02	4
30	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/21/35/213591e4-1574-481b-9985-c5f9a3f6ba49/banner.png__48x48_q85_crop_subsampling-2_upscale.png	2020-04-29 20:58:20.414358+02	4
31	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/21/35/213591e4-1574-481b-9985-c5f9a3f6ba49/banner.png__80x80_q85_crop_subsampling-2_upscale.png	2020-04-29 20:58:20.462054+02	4
32	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/21/35/213591e4-1574-481b-9985-c5f9a3f6ba49/banner.png__128x128_q85_crop_subsampling-2_upscale.png	2020-04-29 20:58:20.521311+02	4
33	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/21/35/213591e4-1574-481b-9985-c5f9a3f6ba49/banner.png__180x180_q85_crop_subsampling-2_upscale.png	2020-04-29 20:58:20.603159+02	4
34	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/21/35/213591e4-1574-481b-9985-c5f9a3f6ba49/banner.png__576x385_q85_subsampling-2.png	2020-04-29 20:58:32.289467+02	4
35	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/21/35/213591e4-1574-481b-9985-c5f9a3f6ba49/banner.png__768x513_q85_subsampling-2.png	2020-04-29 20:58:32.668268+02	4
36	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/21/35/213591e4-1574-481b-9985-c5f9a3f6ba49/banner.png__992x663_q85_subsampling-2.png	2020-04-29 20:58:33.215995+02	4
37	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/21/35/213591e4-1574-481b-9985-c5f9a3f6ba49/banner.png__1200x802_q85_subsampling-2.png	2020-04-29 20:58:33.538309+02	4
38	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/21/35/213591e4-1574-481b-9985-c5f9a3f6ba49/banner.png__1980x1323_q85_subsampling-2.png	2020-04-29 20:58:33.859224+02	4
44	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/8b/c6/8bc65fc9-4034-4a1f-8071-a778d5dc99da/weltladen.png__16x16_q85_crop_subsampling-2_upscale.png	2020-04-30 19:59:27.390444+02	5
45	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/8b/c6/8bc65fc9-4034-4a1f-8071-a778d5dc99da/weltladen.png__32x32_q85_crop_subsampling-2_upscale.png	2020-04-30 19:59:27.418938+02	5
46	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/8b/c6/8bc65fc9-4034-4a1f-8071-a778d5dc99da/weltladen.png__48x48_q85_crop_subsampling-2_upscale.png	2020-04-30 19:59:27.451074+02	5
47	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/8b/c6/8bc65fc9-4034-4a1f-8071-a778d5dc99da/weltladen.png__80x80_q85_crop_subsampling-2_upscale.png	2020-04-30 19:59:27.484639+02	5
48	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/8b/c6/8bc65fc9-4034-4a1f-8071-a778d5dc99da/weltladen.png__128x128_q85_crop_subsampling-2_upscale.png	2020-04-30 19:59:27.521778+02	5
49	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/8b/c6/8bc65fc9-4034-4a1f-8071-a778d5dc99da/weltladen.png__180x180_q85_crop_subsampling-2_upscale.png	2020-04-30 19:59:27.565105+02	5
\.


--
-- Data for Name: easy_thumbnails_thumbnaildimensions; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.easy_thumbnails_thumbnaildimensions (id, thumbnail_id, width, height) FROM stdin;
\.


--
-- Data for Name: filer_clipboard; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.filer_clipboard (id, user_id) FROM stdin;
1	4
\.


--
-- Data for Name: filer_clipboarditem; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.filer_clipboarditem (id, clipboard_id, file_id) FROM stdin;
\.


--
-- Data for Name: filer_file; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.filer_file (id, file, _file_size, sha1, has_all_mandatory_data, original_filename, name, description, uploaded_at, modified_at, is_public, folder_id, owner_id, polymorphic_ctype_id) FROM stdin;
2	filer_public/63/15/631543b5-f68e-487a-a06b-67c23f590fde/fontello-319b939c.zip	1137483	3f75a1a6f0a813266a9ba688d6c370a0dd643921	f	fontello-319b939c.zip	Font Awesome	\N	2017-01-10 17:52:21.194+01	2017-03-06 12:59:00.807+01	t	2	1	103
202	filer_public/8b/c6/8bc65fc9-4034-4a1f-8071-a778d5dc99da/weltladen.png	39527	95590fe3765d082cf46517f733552302b90212a3	f	weltladen.png		\N	2020-04-30 19:59:27.365167+02	2020-04-30 19:59:27.365195+02	t	1	4	106
56	filer_public/fb/b2/fbb280d7-a8c8-4a4e-b80c-49ed886a4369/highendurance_microsdhc_c10_32gb-retina.png	114459	4a2b030d753d717e566ccc8150f04465adbd0477	f	HighEndurance_microSDHC_C10_32GB-retina.png		\N	2015-12-03 12:16:26.324+01	2018-09-20 18:10:25.245+02	t	2	1	106
57	filer_public/e6/7c/e67c6c43-4ed3-4389-a99e-526ef2054e5a/highendurance_microsdxc_c10_64gb-retina.png	116994	77d4cab457bef125957ddd866ca3cd788c177e64	f	HighEndurance_microSDXC_C10_64GB-retina.png		\N	2015-12-03 12:16:31.457+01	2018-09-20 18:10:25.252+02	t	2	1	106
199	filer_public/fb/07/fb076063-cb6d-4d4b-9181-79c9e6ec16a9/97975.jpg	292460	4186c084d54f5df65b45b921a23635bcf9b9d0da	f	97975.jpg		\N	2020-04-26 21:08:49.447484+02	2020-04-26 21:08:49.447513+02	t	8	4	106
200	filer_public/db/d2/dbd28a47-4275-4193-a25b-ced01748349e/98000.jpg	293018	7aceacb99f70fedd4a6387b12d95609947da3869	f	98000.jpg		\N	2020-04-26 21:08:53.49932+02	2020-04-26 21:08:53.499353+02	t	8	4	106
201	filer_public/21/35/213591e4-1574-481b-9985-c5f9a3f6ba49/banner.png	353391	55ea8d234ad26c544a3ec85a6f48d87f844e7914	f	banner.png		\N	2020-04-29 20:58:20.216931+02	2020-04-29 20:58:20.216996+02	t	9	4	106
\.


--
-- Data for Name: filer_folder; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.filer_folder (id, name, uploaded_at, created_at, modified_at, lft, rght, tree_id, level, owner_id, parent_id) FROM stdin;
1	Logos	2015-11-25 18:32:52.806+01	2015-11-25 18:32:52.806+01	2015-11-25 18:32:52.806+01	1	2	1	0	1	\N
2	Fonts	2017-03-06 12:58:24.184+01	2017-03-06 12:58:24.184+01	2017-03-06 12:58:24.184+01	1	2	5	0	1	\N
10	Website	2020-04-30 19:58:57.877327+02	2020-04-30 19:58:57.87736+02	2020-04-30 19:58:57.877379+02	1	4	8	0	4	\N
7	Shop	2020-04-26 21:08:34.382838+02	2020-04-26 21:08:34.382871+02	2020-04-30 19:58:16.590839+02	1	4	7	0	4	\N
8	Produkte	2020-04-26 21:08:40.143532+02	2020-04-26 21:08:40.143575+02	2020-04-26 21:08:40.143602+02	2	3	7	1	4	7
9	fotos	2020-04-29 20:58:12.209216+02	2020-04-29 20:58:12.209249+02	2020-04-30 19:59:07.912471+02	2	3	8	1	4	10
\.


--
-- Data for Name: filer_folderpermission; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.filer_folderpermission (id, type, everybody, can_edit, can_read, can_add_children, folder_id, group_id, user_id) FROM stdin;
\.


--
-- Data for Name: filer_image; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.filer_image (file_ptr_id, _height, _width, date_taken, default_alt_text, default_caption, author, must_always_publish_author_credit, must_always_publish_copyright, subject_location) FROM stdin;
202	210	340	2020-04-30 19:59:27.359602+02	\N	\N	\N	f	f	
56	1000	1000	2015-12-03 12:16:26.311+01	\N	\N	\N	f	f	
57	1000	1000	2015-12-03 12:16:31.439+01	\N	\N	\N	f	f	
199	752	662	2020-04-26 21:08:49.441254+02	\N	\N	\N	f	f	
200	752	662	2020-04-26 21:08:53.493127+02	\N	\N	\N	f	f	
201	668	1000	2020-04-29 20:58:20.190052+02	\N	\N	\N	f	f	
\.


--
-- Data for Name: filer_thumbnailoption; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.filer_thumbnailoption (id, name, width, height, crop, upscale) FROM stdin;
\.


--
-- Data for Name: menus_cachekey; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.menus_cachekey (id, language, site, key) FROM stdin;
80	de	1	cms_3.7.2_menu_nodes_de_1_4_user:public
\.


--
-- Data for Name: post_office_attachment; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.post_office_attachment (id, file, name, mimetype, headers) FROM stdin;
\.


--
-- Data for Name: post_office_attachment_emails; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.post_office_attachment_emails (id, attachment_id, email_id) FROM stdin;
\.


--
-- Data for Name: post_office_email; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.post_office_email (id, from_email, "to", cc, bcc, subject, message, html_message, status, priority, created, last_updated, scheduled_time, headers, context, template_id, backend_alias) FROM stdin;
8	no-reply@localhost	markus.mohanty@gmail.com						2	1	2020-04-30 20:01:52.337216+02	2020-04-30 20:01:52.33725+02	\N	\N	{\n    "customer": {\n        "number": "1",\n        "first_name": "Markus",\n        "last_name": "Mohanty",\n        "email": "markus.mohanty@gmail.com",\n        "salutation": "Herr"\n    },\n    "order": {\n        "number": "2020-00006",\n        "url": "/de/personal-pages/your-orders/2020-00006/18acc2e40eea7622c59b041bfe11bca0496fe4df",\n        "status": "Bereit zur Auslieferung",\n        "subtotal": "€ 5,99",\n        "total": "€ 10,99",\n        "items": [\n            {\n                "line_total": "€ 5,99",\n                "unit_price": "€ 5,99",\n                "product_code": "12314121",\n                "quantity": 1,\n                "summary": {\n                    "id": 2,\n                    "product_name": "Schokoeier",\n                    "product_url": "/de/onlineshop/schokoeier",\n                    "product_model": "weltladenproduct",\n                    "price": "€ 5,99",\n                    "media": "/Users/mohi/Programming/weltladen-shop/workdir/media/filer_public_thumbnails/filer_public/fb/07/fb076063-cb6d-4d4b-9181-79c9e6ec16a9/97975.jpg__80x80_q85_crop_subsampling-2.jpg",\n                    "caption": "<p>Das sind Schokoeier</p>"\n                },\n                "extra": {\n                    "rows": [\n                        [\n                            "taxes",\n                            {\n                                "label": "inkl. 20% MWSt.",\n                                "amount": "€ 1,00"\n                            }\n                        ]\n                    ]\n                }\n            }\n        ],\n        "extra": {\n            "rows": [\n                [\n                    "taxes10",\n                    {\n                        "label": "inkl. 10% MWSt.",\n                        "amount": "€ 0,00"\n                    }\n                ],\n                [\n                    "taxes20",\n                    {\n                        "label": "inkl. 20% MWSt.",\n                        "amount": "€ 1,00"\n                    }\n                ],\n                [\n                    "postal-shipping",\n                    {\n                        "label": "Shipping costs",\n                        "amount": "€ 5,00"\n                    }\n                ]\n            ],\n            "annotation": "",\n            "payment_modifier": "delivery-note-payment",\n            "shipping_modifier": "postal-shipping",\n            "payment_extra_data": {}\n        },\n        "amount_paid": "€ –",\n        "outstanding_amount": "€ 10,99",\n        "cancelable": true,\n        "is_partially_paid": false,\n        "active_payment_method": {\n            "value": "delivery-note-payment",\n            "label": "Payment by delivery note"\n        },\n        "active_shipping_method": {\n            "value": "postal-shipping",\n            "label": "Postal shipping"\n        },\n        "currency": "EUR",\n        "created_at": "2020-04-26T23:35:26.648034+02:00",\n        "updated_at": "2020-04-30T20:01:52.225337+02:00",\n        "shipping_address_text": "Markus Mohanty\\nHintschiggasse 3/3/17\\n1100 Wien\\nAustria\\n",\n        "billing_address_text": "Markus Mohanty\\nHintschiggasse 3/3/17\\n1100 Wien\\nAustria\\n",\n        "token": "18acc2e40eea7622c59b041bfe11bca0496fe4df"\n    },\n    "ABSOLUTE_BASE_URI": "http://localhost:8000",\n    "render_language": "de",\n    "latest_delivery": {\n        "items": [\n            {\n                "line_total": "€ 5,99",\n                "unit_price": "€ 5,99",\n                "product_code": "12314121",\n                "summary": {\n                    "id": 2,\n                    "product_name": "Schokoeier",\n                    "product_url": "/de/onlineshop/schokoeier",\n                    "product_model": "weltladenproduct",\n                    "price": "€ 5,99",\n                    "media": "/Users/mohi/Programming/weltladen-shop/workdir/media/filer_public_thumbnails/filer_public/fb/07/fb076063-cb6d-4d4b-9181-79c9e6ec16a9/97975.jpg__80x80_q85_crop_subsampling-2.jpg",\n                    "caption": "<p>Das sind Schokoeier</p>"\n                },\n                "extra": {\n                    "rows": [\n                        [\n                            "taxes",\n                            {\n                                "label": "inkl. 20% MWSt.",\n                                "amount": "€ 1,00"\n                            }\n                        ]\n                    ]\n                },\n                "ordered_quantity": 1,\n                "quantity": 1\n            }\n        ],\n        "number": "2020-00006",\n        "shipping_method": {\n            "value": "postal-shipping",\n            "label": "Postal shipping"\n        },\n        "shipping_id": "Bereit zur Abholung",\n        "fulfilled_at": "2020-04-30T20:01:34.983796+02:00",\n        "shipped_at": "2020-04-30T20:01:52.222427+02:00"\n    }\n}	2	
\.


--
-- Data for Name: post_office_emailtemplate; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.post_office_emailtemplate (id, name, description, subject, content, html_content, created, last_updated, default_template_id, language) FROM stdin;
1	Order confirmation awaiting forward fund		Order confirmation at Weltladen {{ order.number }}		{% extends "weltladen/email/base.html" %}\r\n\r\n{% block email-title %}Thanks for purchasing at Weltladen{% endblock %}\r\n\r\n{% block email-head %}\r\n  {{ block.super }}\r\n  <p>To proceed with your order, please transfer {{ order.total }} onto our bank account:</p>\r\n  <pre>\r\nWeltladen\r\nIBAN: DE1234567890\r\n  </pre>\r\n  <p>As payment reference, please use {{ order.number }}.</p>\r\n{% endblock %}\r\n\r\n{% block email-body %}\r\n  {% include "shop/email/order-detail.html" %}\r\n  {% include "shop/email/customer-information.html" %}\r\n{% endblock %}	2019-03-20 13:10:19.821+01	2019-03-21 08:44:18.675+01	\N	
2	Bestellung versendet		Ihre Bestellung {{ order.number }} bei Weltladen Baden wurde versandt		{% extends "weltladen/email/base.html" %}\r\n\r\n{% block email-title %}Ihre Bestellung {{ order.number }} bei Weltladen Baden wurde versandt.{% endblock %}\r\n\r\n{% block email-head %}\r\n  {{ block.super }}\r\n  {% if latest_delivery %}\r\n    <p>Versandmethode: {{ latest_delivery.shipping_method.label }}</p>\r\n    <p>Versand-Nummer: {{ latest_delivery.shipping_id }}</p>\r\n  {% endif %}\r\n{% endblock %}\r\n\r\n{% block email-body %}\r\n  {% include "shop/email/order-detail.html" %}\r\n  {% include "shop/email/customer-information.html" %}\r\n{% endblock %}	2019-03-21 08:42:31.166+01	2020-04-30 20:01:13.216111+02	\N	
\.


--
-- Data for Name: post_office_log; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.post_office_log (id, date, status, exception_type, message, email_id) FROM stdin;
\.


--
-- Data for Name: shop_notification; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.shop_notification (id, name, transition_target, recipient_id, mail_template_id, notify) FROM stdin;
1	Order confirmation awaiting forward fund	awaiting_payment	\N	1	2
2	Order (partially) delivered	ready_for_delivery	\N	2	2
\.


--
-- Data for Name: shop_notificationattachment; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.shop_notificationattachment (id, attachment_id, notification_id) FROM stdin;
\.


--
-- Data for Name: weltladen_billingaddress; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.weltladen_billingaddress (id, priority, name, address1, address2, zip_code, city, country, customer_id) FROM stdin;
\.


--
-- Data for Name: weltladen_cart; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.weltladen_cart (id, created_at, updated_at, extra, billing_address_id, customer_id, shipping_address_id) FROM stdin;
1	2020-04-26 20:36:28.808627+02	2020-04-30 19:52:59.589927+02	{"annotation": "", "payment_modifier": "delivery-note-payment", "shipping_modifier": "postal-shipping", "payment_extra_data": {}}	\N	4	1
\.


--
-- Data for Name: weltladen_cartitem; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.weltladen_cartitem (id, product_code, updated_at, extra, quantity, cart_id, product_id) FROM stdin;
\.


--
-- Data for Name: weltladen_delivery; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.weltladen_delivery (id, shipping_id, fulfilled_at, shipped_at, shipping_method, order_id) FROM stdin;
2	Bereit zur Abholung	2020-04-30 20:01:34.983796+02	2020-04-30 20:01:52.222427+02	postal-shipping	9
\.


--
-- Data for Name: weltladen_deliveryitem; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.weltladen_deliveryitem (id, quantity, delivery_id, item_id) FROM stdin;
2	1	2	5
\.


--
-- Data for Name: weltladen_locations; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.weltladen_locations (id, zip_code, city, country, distance) FROM stdin;
1	1100	Wien	AT	25
\.


--
-- Data for Name: weltladen_manufacturer; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.weltladen_manufacturer (id, name) FROM stdin;
1	EZA
\.


--
-- Data for Name: weltladen_order; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.weltladen_order (id, status, currency, _subtotal, _total, created_at, updated_at, extra, stored_request, number, shipping_address_text, billing_address_text, token, customer_id) FROM stdin;
4	new	EUR	5.99	10.99	2020-04-26 23:23:05.935171+02	2020-04-26 23:23:05.961864+02	{"rows": [["taxes10", {"label": "inkl. 10% MWSt.", "amount": "€ 0,00"}], ["taxes20", {"label": "inkl. 20% MWSt.", "amount": "€ 1,00"}], ["postal-shipping", {"label": "Shipping costs", "amount": "€ 5,00"}]], "annotation": "", "payment_modifier": "delivery-note-payment", "shipping_modifier": "postal-shipping", "payment_extra_data": {}}	{"language": "de", "remote_ip": "127.0.0.1", "user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:76.0) Gecko/20100101 Firefox/76.0", "absolute_base_uri": "http://localhost:8000/"}	202000001	Markus Mohanty\nHintschiggasse 3/3/17\n1100 Wien\nAustria\n	Markus Mohanty\nHintschiggasse 3/3/17\n1100 Wien\nAustria\n	91511af5c2b003436e17ee2f2803fa3e4afe1969	4
5	new	EUR	0.00	5.00	2020-04-26 23:25:57.248069+02	2020-04-26 23:25:57.276695+02	{"rows": [["taxes10", {"label": "inkl. 10% MWSt.", "amount": "€ 0,00"}], ["taxes20", {"label": "inkl. 20% MWSt.", "amount": "€ 0,00"}], ["postal-shipping", {"label": "Shipping costs", "amount": "€ 5,00"}]], "annotation": "", "payment_modifier": "delivery-note-payment", "shipping_modifier": "postal-shipping", "payment_extra_data": {}}	{"language": "de", "remote_ip": "127.0.0.1", "user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:76.0) Gecko/20100101 Firefox/76.0", "absolute_base_uri": "http://localhost:8000/"}	202000002	Markus Mohanty\nHintschiggasse 3/3/17\n1100 Wien\nAustria\n	Markus Mohanty\nHintschiggasse 3/3/17\n1100 Wien\nAustria\n	2c39e4ae0c0ada27f3d370bf65507d6221c0c743	4
6	new	EUR	0.00	5.00	2020-04-26 23:26:23.390791+02	2020-04-26 23:26:23.404364+02	{"rows": [["taxes10", {"label": "inkl. 10% MWSt.", "amount": "€ 0,00"}], ["taxes20", {"label": "inkl. 20% MWSt.", "amount": "€ 0,00"}], ["postal-shipping", {"label": "Shipping costs", "amount": "€ 5,00"}]], "annotation": "", "payment_modifier": "delivery-note-payment", "shipping_modifier": "postal-shipping", "payment_extra_data": {}}	{"language": "de", "remote_ip": "127.0.0.1", "user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:76.0) Gecko/20100101 Firefox/76.0", "absolute_base_uri": "http://localhost:8000/"}	202000003	Markus Mohanty\nHintschiggasse 3/3/17\n1100 Wien\nAustria\n	Markus Mohanty\nHintschiggasse 3/3/17\n1100 Wien\nAustria\n	ffc24a83775bb7343cd0843c5812985e768cc0dd	4
8	payment_confirmed	EUR	0.00	5.00	2020-04-26 23:31:47.868236+02	2020-04-26 23:31:47.898697+02	{"rows": [["taxes10", {"label": "inkl. 10% MWSt.", "amount": "€ 0,00"}], ["taxes20", {"label": "inkl. 20% MWSt.", "amount": "€ 0,00"}], ["postal-shipping", {"label": "Shipping costs", "amount": "€ 5,00"}]], "annotation": "", "payment_modifier": "delivery-note-payment", "shipping_modifier": "postal-shipping", "payment_extra_data": {}}	{"language": "de", "remote_ip": "127.0.0.1", "user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:76.0) Gecko/20100101 Firefox/76.0", "absolute_base_uri": "http://localhost:8000/"}	202000005	Markus Mohanty\nHintschiggasse 3/3/17\n1100 Wien\nAustria\n	Markus Mohanty\nHintschiggasse 3/3/17\n1100 Wien\nAustria\n	7626d23137ee45c5d9a8113a822755c8db87c652	4
10	pick_goods	EUR	5.99	10.99	2020-04-30 19:52:59.608996+02	2020-04-30 19:52:59.639659+02	{"rows": [["taxes10", {"label": "inkl. 10% MWSt.", "amount": "€ 0,00"}], ["taxes20", {"label": "inkl. 20% MWSt.", "amount": "€ 1,00"}], ["postal-shipping", {"label": "Shipping costs", "amount": "€ 5,00"}]], "annotation": "", "payment_modifier": "delivery-note-payment", "shipping_modifier": "postal-shipping", "payment_extra_data": {}}	{"language": "de", "remote_ip": "127.0.0.1", "user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:76.0) Gecko/20100101 Firefox/76.0", "absolute_base_uri": "http://localhost:8000/"}	202000007	Markus Mohanty\nHintschiggasse 3/3/17\n1100 Wien\nAustria\n	Markus Mohanty\nHintschiggasse 3/3/17\n1100 Wien\nAustria\n	50fb2849d0d87170b67bd43d81547b854d0c0993	4
9	ready_for_delivery	EUR	5.99	10.99	2020-04-26 23:35:26.648034+02	2020-04-30 20:01:52.225337+02	{"rows": [["taxes10", {"label": "inkl. 10% MWSt.", "amount": "€ 0,00"}], ["taxes20", {"label": "inkl. 20% MWSt.", "amount": "€ 1,00"}], ["postal-shipping", {"label": "Shipping costs", "amount": "€ 5,00"}]], "annotation": "", "payment_modifier": "delivery-note-payment", "shipping_modifier": "postal-shipping", "payment_extra_data": {}}	{"language": "de", "remote_ip": "127.0.0.1", "user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:76.0) Gecko/20100101 Firefox/76.0", "absolute_base_uri": "http://localhost:8000/"}	202000006	Markus Mohanty\nHintschiggasse 3/3/17\n1100 Wien\nAustria\n	Markus Mohanty\nHintschiggasse 3/3/17\n1100 Wien\nAustria\n	18acc2e40eea7622c59b041bfe11bca0496fe4df	4
7	order_canceled	EUR	0.00	5.00	2020-04-26 23:26:54.864607+02	2020-04-30 19:55:05.218086+02	{"rows": [["taxes10", {"label": "inkl. 10% MWSt.", "amount": "€ 0,00"}], ["taxes20", {"label": "inkl. 20% MWSt.", "amount": "€ 0,00"}], ["postal-shipping", {"label": "Shipping costs", "amount": "€ 5,00"}]], "addendum": [], "annotation": "", "payment_modifier": "delivery-note-payment", "shipping_modifier": "postal-shipping", "payment_extra_data": {}}	{"language": "de", "remote_ip": "127.0.0.1", "user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:76.0) Gecko/20100101 Firefox/76.0", "absolute_base_uri": "http://localhost:8000/"}	202000004	Markus Mohanty\nHintschiggasse 3/3/17\n1100 Wien\nAustria\n	Markus Mohanty\nHintschiggasse 3/3/17\n1100 Wien\nAustria\n	9fe6ef18b6294f1c84c4ed38227bca1204b13f20	4
\.


--
-- Data for Name: weltladen_orderitem; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.weltladen_orderitem (id, product_name, product_code, _unit_price, _line_total, extra, quantity, canceled, order_id, product_id) FROM stdin;
4	Schokoeier	12314121	5.99	5.99	{"rows": [["taxes", {"label": "inkl. 20% MWSt.", "amount": "€ 1,00"}]]}	1	f	4	2
5	Schokoeier	12314121	5.99	5.99	{"rows": [["taxes", {"label": "inkl. 20% MWSt.", "amount": "€ 1,00"}]]}	1	f	9	2
6	Schokoeier	12314121	5.99	5.99	{"rows": [["taxes", {"label": "inkl. 20% MWSt.", "amount": "€ 1,00"}]]}	1	f	10	2
\.


--
-- Data for Name: weltladen_orderpayment; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.weltladen_orderpayment (id, amount, transaction_id, created_at, payment_method, order_id) FROM stdin;
\.


--
-- Data for Name: weltladen_productimage; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.weltladen_productimage (id, "order", image_id, product_id) FROM stdin;
1	1	199	2
2	2	200	2
\.


--
-- Data for Name: weltladen_productpage; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.weltladen_productpage (id, page_id, product_id) FROM stdin;
1	16	2
2	16	3
3	16	4
4	16	5
5	16	6
\.


--
-- Data for Name: weltladen_shippingaddress; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.weltladen_shippingaddress (id, priority, name, address1, address2, zip_code, city, country, customer_id) FROM stdin;
1	1	Markus Mohanty	Hintschiggasse 3/3/17	\N	1100	Wien	AT	4
\.


--
-- Data for Name: weltladen_supplier; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.weltladen_supplier (id, name) FROM stdin;
1	EZA
\.


--
-- Data for Name: weltladen_weltladencustomer; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.weltladen_weltladencustomer (user_id, recognized, last_access, extra, number, phonenumber, salutation) FROM stdin;
4	2	2020-04-30 20:07:56.075211+02	{}	1	+43 676 3239108	mr
\.


--
-- Data for Name: weltladen_weltladenproduct; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.weltladen_weltladenproduct (id, created_at, updated_at, active, product_name, slug, country_of_origin, "order", unit_price, product_code, manufacturer_id, polymorphic_ctype_id, supplier_id, tax_switch, vegan) FROM stdin;
2	2020-04-26 20:39:56.587783+02	2020-04-26 21:09:06.424516+02	t	Schokoeier	schokoeier	AT	1	5.990	12314121	1	135	1	t	t
3	2020-04-29 19:42:10.632829+02	2020-04-29 19:42:10.632864+02	t	Tee	tee	AT	2	5.990	36372319230	1	135	1	t	t
4	2020-04-29 19:42:52.353977+02	2020-04-29 19:42:52.35401+02	t	Reis	reis	BD	3	15.990	73625238393	1	135	1	t	t
5	2020-04-29 19:43:35.968116+02	2020-04-29 19:43:35.968149+02	t	Seife	seife	AT	4	2.990	6383929474	1	135	1	t	t
6	2020-04-29 19:44:34.716483+02	2020-04-29 19:44:34.71652+02	t	Honig	honig	AT	5	7.990	17373940436	1	135	1	t	f
\.


--
-- Data for Name: weltladen_weltladenproducttranslation; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.weltladen_weltladenproducttranslation (id, language_code, caption, short_description, description, master_id) FROM stdin;
1	de	<p>Das sind Schokoeier</p>	<p>Braune Eier. Braune Hühner. Super Geschmack.</p>	<p>faeff</p>\n\n<p>f</p>\n\n<p>fdaf</p>\n\n<p>af</p>\n\n<p>das</p>\n\n<p>fdsf</p>	2
2	de	<p>Das ist Tee.</p>	<p>Das ist ein Tee.</p>	<p>Das ist ein Tee.</p>\n\n<p>Und eine Beschreibung</p>	3
3	de	<p>Das ist Reis.</p>	<p>Das ist ein Reis.</p>	<p>Das ist ein Reis.</p>\n\n<p>Und das ist eine Beschreibung</p>	4
4	de	<p>Das ist Seife.</p>	<p>Das ist eine Seife.</p>	<p>Und das ist eine Beschreibung für diese Seife</p>	5
5	de	<p>Das ist Honig.</p>	<p>Das ist ein Honig.</p>	<p>Das ist eine Beschreibung für diesen Honig.</p>	6
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 544, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 9, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: cms_cmsplugin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cms_cmsplugin_id_seq', 1166, true);


--
-- Name: cms_globalpagepermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cms_globalpagepermission_id_seq', 1, false);


--
-- Name: cms_globalpagepermission_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cms_globalpagepermission_sites_id_seq', 1, false);


--
-- Name: cms_page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cms_page_id_seq', 48, true);


--
-- Name: cms_page_placeholders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cms_page_placeholders_id_seq', 96, true);


--
-- Name: cms_pagepermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cms_pagepermission_id_seq', 1, false);


--
-- Name: cms_placeholder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cms_placeholder_id_seq', 101, true);


--
-- Name: cms_staticplaceholder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cms_staticplaceholder_id_seq', 2, true);


--
-- Name: cms_title_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cms_title_id_seq', 88, true);


--
-- Name: cms_treenode_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cms_treenode_id_seq', 24, true);


--
-- Name: cms_urlconfrevision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cms_urlconfrevision_id_seq', 1, false);


--
-- Name: cms_usersettings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cms_usersettings_id_seq', 1, true);


--
-- Name: cmsplugin_cascade_cascadeclipboard_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cmsplugin_cascade_cascadeclipboard_id_seq', 46, true);


--
-- Name: cmsplugin_cascade_iconfont_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cmsplugin_cascade_iconfont_id_seq', 1, true);


--
-- Name: cmsplugin_cascade_inline_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cmsplugin_cascade_inline_id_seq', 4, true);


--
-- Name: cmsplugin_cascade_page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cmsplugin_cascade_page_id_seq', 14, true);


--
-- Name: cmsplugin_cascade_pluginextrafields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cmsplugin_cascade_pluginextrafields_id_seq', 1, true);


--
-- Name: cmsplugin_cascade_sharedglossary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cmsplugin_cascade_sharedglossary_id_seq', 1, false);


--
-- Name: cmsplugin_cascade_sortinline_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cmsplugin_cascade_sortinline_id_seq', 10, true);


--
-- Name: cmsplugin_cascade_texteditorconfigfields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cmsplugin_cascade_texteditorconfigfields_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 221, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 138, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 118, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.easy_thumbnails_source_id_seq', 5, true);


--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.easy_thumbnails_thumbnail_id_seq', 49, true);


--
-- Name: easy_thumbnails_thumbnaildimensions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.easy_thumbnails_thumbnaildimensions_id_seq', 1, false);


--
-- Name: filer_clipboard_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.filer_clipboard_id_seq', 1, true);


--
-- Name: filer_clipboarditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.filer_clipboarditem_id_seq', 1, false);


--
-- Name: filer_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.filer_file_id_seq', 202, true);


--
-- Name: filer_folder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.filer_folder_id_seq', 10, true);


--
-- Name: filer_folderpermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.filer_folderpermission_id_seq', 1, false);


--
-- Name: filer_thumbnailoption_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.filer_thumbnailoption_id_seq', 1, false);


--
-- Name: menus_cachekey_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.menus_cachekey_id_seq', 80, true);


--
-- Name: post_office_attachment_emails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.post_office_attachment_emails_id_seq', 1, false);


--
-- Name: post_office_attachment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.post_office_attachment_id_seq', 1, false);


--
-- Name: post_office_email_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.post_office_email_id_seq', 8, true);


--
-- Name: post_office_emailtemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.post_office_emailtemplate_id_seq', 2, true);


--
-- Name: post_office_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.post_office_log_id_seq', 1, false);


--
-- Name: shop_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.shop_notification_id_seq', 2, true);


--
-- Name: shop_notificationattachment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.shop_notificationattachment_id_seq', 1, false);


--
-- Name: weltladen_billingaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.weltladen_billingaddress_id_seq', 1, false);


--
-- Name: weltladen_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.weltladen_cart_id_seq', 5, true);


--
-- Name: weltladen_cartitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.weltladen_cartitem_id_seq', 12, true);


--
-- Name: weltladen_delivery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.weltladen_delivery_id_seq', 2, true);


--
-- Name: weltladen_deliveryitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.weltladen_deliveryitem_id_seq', 2, true);


--
-- Name: weltladen_locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.weltladen_locations_id_seq', 1, true);


--
-- Name: weltladen_manufacturer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.weltladen_manufacturer_id_seq', 1, true);


--
-- Name: weltladen_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.weltladen_order_id_seq', 10, true);


--
-- Name: weltladen_orderitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.weltladen_orderitem_id_seq', 6, true);


--
-- Name: weltladen_orderpayment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.weltladen_orderpayment_id_seq', 1, true);


--
-- Name: weltladen_productimage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.weltladen_productimage_id_seq', 2, true);


--
-- Name: weltladen_productpage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.weltladen_productpage_id_seq', 5, true);


--
-- Name: weltladen_shippingaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.weltladen_shippingaddress_id_seq', 1, true);


--
-- Name: weltladen_supplier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.weltladen_supplier_id_seq', 1, true);


--
-- Name: weltladen_weltladenproduct_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.weltladen_weltladenproduct_id_seq', 6, true);


--
-- Name: weltladen_weltladenproducttranslation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.weltladen_weltladenproducttranslation_id_seq', 5, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: cms_aliaspluginmodel cms_aliaspluginmodel_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_aliaspluginmodel
    ADD CONSTRAINT cms_aliaspluginmodel_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cms_cmsplugin cms_cmsplugin_path_4917bb44_uniq; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_cmsplugin
    ADD CONSTRAINT cms_cmsplugin_path_4917bb44_uniq UNIQUE (path);


--
-- Name: cms_cmsplugin cms_cmsplugin_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_cmsplugin
    ADD CONSTRAINT cms_cmsplugin_pkey PRIMARY KEY (id);


--
-- Name: cms_globalpagepermission_sites cms_globalpagepermission_globalpagepermission_id__db684f41_uniq; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_globalpagepermission_sites
    ADD CONSTRAINT cms_globalpagepermission_globalpagepermission_id__db684f41_uniq UNIQUE (globalpagepermission_id, site_id);


--
-- Name: cms_globalpagepermission cms_globalpagepermission_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_globalpagepermission
    ADD CONSTRAINT cms_globalpagepermission_pkey PRIMARY KEY (id);


--
-- Name: cms_globalpagepermission_sites cms_globalpagepermission_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_globalpagepermission_sites
    ADD CONSTRAINT cms_globalpagepermission_sites_pkey PRIMARY KEY (id);


--
-- Name: cms_page cms_page_node_id_publisher_is_draft_c1293d6a_uniq; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_page
    ADD CONSTRAINT cms_page_node_id_publisher_is_draft_c1293d6a_uniq UNIQUE (node_id, publisher_is_draft);


--
-- Name: cms_page cms_page_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_page
    ADD CONSTRAINT cms_page_pkey PRIMARY KEY (id);


--
-- Name: cms_page_placeholders cms_page_placeholders_page_id_placeholder_id_ab7fbfb8_uniq; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_page_placeholders
    ADD CONSTRAINT cms_page_placeholders_page_id_placeholder_id_ab7fbfb8_uniq UNIQUE (page_id, placeholder_id);


--
-- Name: cms_page_placeholders cms_page_placeholders_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_page_placeholders
    ADD CONSTRAINT cms_page_placeholders_pkey PRIMARY KEY (id);


--
-- Name: cms_page cms_page_publisher_public_id_key; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_page
    ADD CONSTRAINT cms_page_publisher_public_id_key UNIQUE (publisher_public_id);


--
-- Name: cms_pagepermission cms_pagepermission_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_pagepermission
    ADD CONSTRAINT cms_pagepermission_pkey PRIMARY KEY (id);


--
-- Name: cms_pageuser cms_pageuser_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_pageuser
    ADD CONSTRAINT cms_pageuser_pkey PRIMARY KEY (user_ptr_id);


--
-- Name: cms_pageusergroup cms_pageusergroup_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_pageusergroup
    ADD CONSTRAINT cms_pageusergroup_pkey PRIMARY KEY (group_ptr_id);


--
-- Name: cms_placeholder cms_placeholder_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_placeholder
    ADD CONSTRAINT cms_placeholder_pkey PRIMARY KEY (id);


--
-- Name: cms_placeholderreference cms_placeholderreference_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_placeholderreference
    ADD CONSTRAINT cms_placeholderreference_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cms_staticplaceholder cms_staticplaceholder_code_site_id_21ba079c_uniq; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_staticplaceholder
    ADD CONSTRAINT cms_staticplaceholder_code_site_id_21ba079c_uniq UNIQUE (code, site_id);


--
-- Name: cms_staticplaceholder cms_staticplaceholder_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_staticplaceholder
    ADD CONSTRAINT cms_staticplaceholder_pkey PRIMARY KEY (id);


--
-- Name: cms_title cms_title_language_page_id_61aaf084_uniq; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_title
    ADD CONSTRAINT cms_title_language_page_id_61aaf084_uniq UNIQUE (language, page_id);


--
-- Name: cms_title cms_title_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_title
    ADD CONSTRAINT cms_title_pkey PRIMARY KEY (id);


--
-- Name: cms_title cms_title_publisher_public_id_key; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_title
    ADD CONSTRAINT cms_title_publisher_public_id_key UNIQUE (publisher_public_id);


--
-- Name: cms_treenode cms_treenode_path_key; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_treenode
    ADD CONSTRAINT cms_treenode_path_key UNIQUE (path);


--
-- Name: cms_treenode cms_treenode_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_treenode
    ADD CONSTRAINT cms_treenode_pkey PRIMARY KEY (id);


--
-- Name: cms_urlconfrevision cms_urlconfrevision_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_urlconfrevision
    ADD CONSTRAINT cms_urlconfrevision_pkey PRIMARY KEY (id);


--
-- Name: cms_usersettings cms_usersettings_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_usersettings
    ADD CONSTRAINT cms_usersettings_pkey PRIMARY KEY (id);


--
-- Name: cms_usersettings cms_usersettings_user_id_key; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_usersettings
    ADD CONSTRAINT cms_usersettings_user_id_key UNIQUE (user_id);


--
-- Name: cmsplugin_cascade_cascadeclipboard cmsplugin_cascade_cascadeclipboard_identifier_key; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cmsplugin_cascade_cascadeclipboard
    ADD CONSTRAINT cmsplugin_cascade_cascadeclipboard_identifier_key UNIQUE (identifier);


--
-- Name: cmsplugin_cascade_cascadeclipboard cmsplugin_cascade_cascadeclipboard_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cmsplugin_cascade_cascadeclipboard
    ADD CONSTRAINT cmsplugin_cascade_cascadeclipboard_pkey PRIMARY KEY (id);


--
-- Name: cmsplugin_cascade_element cmsplugin_cascade_element_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cmsplugin_cascade_element
    ADD CONSTRAINT cmsplugin_cascade_element_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cmsplugin_cascade_iconfont cmsplugin_cascade_iconfont_identifier_key; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cmsplugin_cascade_iconfont
    ADD CONSTRAINT cmsplugin_cascade_iconfont_identifier_key UNIQUE (identifier);


--
-- Name: cmsplugin_cascade_iconfont cmsplugin_cascade_iconfont_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cmsplugin_cascade_iconfont
    ADD CONSTRAINT cmsplugin_cascade_iconfont_pkey PRIMARY KEY (id);


--
-- Name: cmsplugin_cascade_inline cmsplugin_cascade_inline_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cmsplugin_cascade_inline
    ADD CONSTRAINT cmsplugin_cascade_inline_pkey PRIMARY KEY (id);


--
-- Name: cmsplugin_cascade_page cmsplugin_cascade_page_extended_object_id_key; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cmsplugin_cascade_page
    ADD CONSTRAINT cmsplugin_cascade_page_extended_object_id_key UNIQUE (extended_object_id);


--
-- Name: cmsplugin_cascade_page cmsplugin_cascade_page_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cmsplugin_cascade_page
    ADD CONSTRAINT cmsplugin_cascade_page_pkey PRIMARY KEY (id);


--
-- Name: cmsplugin_cascade_page cmsplugin_cascade_page_public_extension_id_key; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cmsplugin_cascade_page
    ADD CONSTRAINT cmsplugin_cascade_page_public_extension_id_key UNIQUE (public_extension_id);


--
-- Name: cmsplugin_cascade_pluginextrafields cmsplugin_cascade_plugin_plugin_type_site_id_b5146694_uniq; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cmsplugin_cascade_pluginextrafields
    ADD CONSTRAINT cmsplugin_cascade_plugin_plugin_type_site_id_b5146694_uniq UNIQUE (plugin_type, site_id);


--
-- Name: cmsplugin_cascade_pluginextrafields cmsplugin_cascade_pluginextrafields_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cmsplugin_cascade_pluginextrafields
    ADD CONSTRAINT cmsplugin_cascade_pluginextrafields_pkey PRIMARY KEY (id);


--
-- Name: cmsplugin_cascade_sharedglossary cmsplugin_cascade_shared_plugin_type_identifier_997f0236_uniq; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cmsplugin_cascade_sharedglossary
    ADD CONSTRAINT cmsplugin_cascade_shared_plugin_type_identifier_997f0236_uniq UNIQUE (plugin_type, identifier);


--
-- Name: cmsplugin_cascade_sharedglossary cmsplugin_cascade_sharedglossary_identifier_key; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cmsplugin_cascade_sharedglossary
    ADD CONSTRAINT cmsplugin_cascade_sharedglossary_identifier_key UNIQUE (identifier);


--
-- Name: cmsplugin_cascade_sharedglossary cmsplugin_cascade_sharedglossary_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cmsplugin_cascade_sharedglossary
    ADD CONSTRAINT cmsplugin_cascade_sharedglossary_pkey PRIMARY KEY (id);


--
-- Name: cmsplugin_cascade_sortinline cmsplugin_cascade_sortinline_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cmsplugin_cascade_sortinline
    ADD CONSTRAINT cmsplugin_cascade_sortinline_pkey PRIMARY KEY (id);


--
-- Name: cmsplugin_cascade_texteditorconfigfields cmsplugin_cascade_texteditorconfigfields_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cmsplugin_cascade_texteditorconfigfields
    ADD CONSTRAINT cmsplugin_cascade_texteditorconfigfields_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: djangocms_text_ckeditor_text djangocms_text_ckeditor_text_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.djangocms_text_ckeditor_text
    ADD CONSTRAINT djangocms_text_ckeditor_text_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: easy_thumbnails_source easy_thumbnails_source_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.easy_thumbnails_source
    ADD CONSTRAINT easy_thumbnails_source_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_source easy_thumbnails_source_storage_hash_name_481ce32d_uniq; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.easy_thumbnails_source
    ADD CONSTRAINT easy_thumbnails_source_storage_hash_name_481ce32d_uniq UNIQUE (storage_hash, name);


--
-- Name: easy_thumbnails_thumbnail easy_thumbnails_thumbnai_storage_hash_name_source_fb375270_uniq; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_thumbnails_thumbnai_storage_hash_name_source_fb375270_uniq UNIQUE (storage_hash, name, source_id);


--
-- Name: easy_thumbnails_thumbnail easy_thumbnails_thumbnail_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_thumbnails_thumbnail_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_thumbnaildimensions easy_thumbnails_thumbnaildimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.easy_thumbnails_thumbnaildimensions
    ADD CONSTRAINT easy_thumbnails_thumbnaildimensions_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_thumbnaildimensions easy_thumbnails_thumbnaildimensions_thumbnail_id_key; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.easy_thumbnails_thumbnaildimensions
    ADD CONSTRAINT easy_thumbnails_thumbnaildimensions_thumbnail_id_key UNIQUE (thumbnail_id);


--
-- Name: filer_clipboard filer_clipboard_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.filer_clipboard
    ADD CONSTRAINT filer_clipboard_pkey PRIMARY KEY (id);


--
-- Name: filer_clipboarditem filer_clipboarditem_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.filer_clipboarditem
    ADD CONSTRAINT filer_clipboarditem_pkey PRIMARY KEY (id);


--
-- Name: filer_file filer_file_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.filer_file
    ADD CONSTRAINT filer_file_pkey PRIMARY KEY (id);


--
-- Name: filer_folder filer_folder_parent_id_name_bc773258_uniq; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.filer_folder
    ADD CONSTRAINT filer_folder_parent_id_name_bc773258_uniq UNIQUE (parent_id, name);


--
-- Name: filer_folder filer_folder_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.filer_folder
    ADD CONSTRAINT filer_folder_pkey PRIMARY KEY (id);


--
-- Name: filer_folderpermission filer_folderpermission_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.filer_folderpermission
    ADD CONSTRAINT filer_folderpermission_pkey PRIMARY KEY (id);


--
-- Name: filer_image filer_image_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.filer_image
    ADD CONSTRAINT filer_image_pkey PRIMARY KEY (file_ptr_id);


--
-- Name: filer_thumbnailoption filer_thumbnailoption_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.filer_thumbnailoption
    ADD CONSTRAINT filer_thumbnailoption_pkey PRIMARY KEY (id);


--
-- Name: menus_cachekey menus_cachekey_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.menus_cachekey
    ADD CONSTRAINT menus_cachekey_pkey PRIMARY KEY (id);


--
-- Name: post_office_attachment_emails post_office_attachment_e_attachment_id_email_id_8e046917_uniq; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.post_office_attachment_emails
    ADD CONSTRAINT post_office_attachment_e_attachment_id_email_id_8e046917_uniq UNIQUE (attachment_id, email_id);


--
-- Name: post_office_attachment_emails post_office_attachment_emails_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.post_office_attachment_emails
    ADD CONSTRAINT post_office_attachment_emails_pkey PRIMARY KEY (id);


--
-- Name: post_office_attachment post_office_attachment_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.post_office_attachment
    ADD CONSTRAINT post_office_attachment_pkey PRIMARY KEY (id);


--
-- Name: post_office_email post_office_email_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.post_office_email
    ADD CONSTRAINT post_office_email_pkey PRIMARY KEY (id);


--
-- Name: post_office_emailtemplate post_office_emailtemplat_name_language_default_te_4023e3e4_uniq; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.post_office_emailtemplate
    ADD CONSTRAINT post_office_emailtemplat_name_language_default_te_4023e3e4_uniq UNIQUE (name, language, default_template_id);


--
-- Name: post_office_emailtemplate post_office_emailtemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.post_office_emailtemplate
    ADD CONSTRAINT post_office_emailtemplate_pkey PRIMARY KEY (id);


--
-- Name: post_office_log post_office_log_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.post_office_log
    ADD CONSTRAINT post_office_log_pkey PRIMARY KEY (id);


--
-- Name: shop_notification shop_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.shop_notification
    ADD CONSTRAINT shop_notification_pkey PRIMARY KEY (id);


--
-- Name: shop_notificationattachment shop_notificationattachment_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.shop_notificationattachment
    ADD CONSTRAINT shop_notificationattachment_pkey PRIMARY KEY (id);


--
-- Name: weltladen_billingaddress weltladen_billingaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_billingaddress
    ADD CONSTRAINT weltladen_billingaddress_pkey PRIMARY KEY (id);


--
-- Name: weltladen_cart weltladen_cart_customer_id_key; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_cart
    ADD CONSTRAINT weltladen_cart_customer_id_key UNIQUE (customer_id);


--
-- Name: weltladen_cart weltladen_cart_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_cart
    ADD CONSTRAINT weltladen_cart_pkey PRIMARY KEY (id);


--
-- Name: weltladen_cartitem weltladen_cartitem_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_cartitem
    ADD CONSTRAINT weltladen_cartitem_pkey PRIMARY KEY (id);


--
-- Name: weltladen_delivery weltladen_delivery_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_delivery
    ADD CONSTRAINT weltladen_delivery_pkey PRIMARY KEY (id);


--
-- Name: weltladen_delivery weltladen_delivery_shipping_method_shipping_id_a6554a63_uniq; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_delivery
    ADD CONSTRAINT weltladen_delivery_shipping_method_shipping_id_a6554a63_uniq UNIQUE (shipping_method, shipping_id);


--
-- Name: weltladen_deliveryitem weltladen_deliveryitem_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_deliveryitem
    ADD CONSTRAINT weltladen_deliveryitem_pkey PRIMARY KEY (id);


--
-- Name: weltladen_locations weltladen_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_locations
    ADD CONSTRAINT weltladen_locations_pkey PRIMARY KEY (id);


--
-- Name: weltladen_manufacturer weltladen_manufacturer_name_key; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_manufacturer
    ADD CONSTRAINT weltladen_manufacturer_name_key UNIQUE (name);


--
-- Name: weltladen_manufacturer weltladen_manufacturer_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_manufacturer
    ADD CONSTRAINT weltladen_manufacturer_pkey PRIMARY KEY (id);


--
-- Name: weltladen_order weltladen_order_number_key; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_order
    ADD CONSTRAINT weltladen_order_number_key UNIQUE (number);


--
-- Name: weltladen_order weltladen_order_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_order
    ADD CONSTRAINT weltladen_order_pkey PRIMARY KEY (id);


--
-- Name: weltladen_orderitem weltladen_orderitem_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_orderitem
    ADD CONSTRAINT weltladen_orderitem_pkey PRIMARY KEY (id);


--
-- Name: weltladen_orderpayment weltladen_orderpayment_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_orderpayment
    ADD CONSTRAINT weltladen_orderpayment_pkey PRIMARY KEY (id);


--
-- Name: weltladen_productimage weltladen_productimage_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_productimage
    ADD CONSTRAINT weltladen_productimage_pkey PRIMARY KEY (id);


--
-- Name: weltladen_productpage weltladen_productpage_page_id_product_id_e421b1ef_uniq; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_productpage
    ADD CONSTRAINT weltladen_productpage_page_id_product_id_e421b1ef_uniq UNIQUE (page_id, product_id);


--
-- Name: weltladen_productpage weltladen_productpage_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_productpage
    ADD CONSTRAINT weltladen_productpage_pkey PRIMARY KEY (id);


--
-- Name: weltladen_shippingaddress weltladen_shippingaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_shippingaddress
    ADD CONSTRAINT weltladen_shippingaddress_pkey PRIMARY KEY (id);


--
-- Name: weltladen_supplier weltladen_supplier_name_key; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_supplier
    ADD CONSTRAINT weltladen_supplier_name_key UNIQUE (name);


--
-- Name: weltladen_supplier weltladen_supplier_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_supplier
    ADD CONSTRAINT weltladen_supplier_pkey PRIMARY KEY (id);


--
-- Name: weltladen_weltladencustomer weltladen_weltladencustomer_number_key; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_weltladencustomer
    ADD CONSTRAINT weltladen_weltladencustomer_number_key UNIQUE (number);


--
-- Name: weltladen_weltladencustomer weltladen_weltladencustomer_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_weltladencustomer
    ADD CONSTRAINT weltladen_weltladencustomer_pkey PRIMARY KEY (user_id);


--
-- Name: weltladen_weltladenproducttranslation weltladen_weltladenprodu_language_code_master_id_d93a0576_uniq; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_weltladenproducttranslation
    ADD CONSTRAINT weltladen_weltladenprodu_language_code_master_id_d93a0576_uniq UNIQUE (language_code, master_id);


--
-- Name: weltladen_weltladenproduct weltladen_weltladenproduct_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_weltladenproduct
    ADD CONSTRAINT weltladen_weltladenproduct_pkey PRIMARY KEY (id);


--
-- Name: weltladen_weltladenproduct weltladen_weltladenproduct_product_code_key; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_weltladenproduct
    ADD CONSTRAINT weltladen_weltladenproduct_product_code_key UNIQUE (product_code);


--
-- Name: weltladen_weltladenproducttranslation weltladen_weltladenproducttranslation_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_weltladenproducttranslation
    ADD CONSTRAINT weltladen_weltladenproducttranslation_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: cms_aliaspluginmodel_alias_placeholder_id_6d6e0c8a; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cms_aliaspluginmodel_alias_placeholder_id_6d6e0c8a ON public.cms_aliaspluginmodel USING btree (alias_placeholder_id);


--
-- Name: cms_aliaspluginmodel_plugin_id_9867676e; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cms_aliaspluginmodel_plugin_id_9867676e ON public.cms_aliaspluginmodel USING btree (plugin_id);


--
-- Name: cms_cmsplugin_language_bbea8a48; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cms_cmsplugin_language_bbea8a48 ON public.cms_cmsplugin USING btree (language);


--
-- Name: cms_cmsplugin_language_bbea8a48_like; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cms_cmsplugin_language_bbea8a48_like ON public.cms_cmsplugin USING btree (language varchar_pattern_ops);


--
-- Name: cms_cmsplugin_parent_id_fd3bd9dd; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cms_cmsplugin_parent_id_fd3bd9dd ON public.cms_cmsplugin USING btree (parent_id);


--
-- Name: cms_cmsplugin_path_4917bb44_like; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cms_cmsplugin_path_4917bb44_like ON public.cms_cmsplugin USING btree (path varchar_pattern_ops);


--
-- Name: cms_cmsplugin_placeholder_id_0bfa3b26; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cms_cmsplugin_placeholder_id_0bfa3b26 ON public.cms_cmsplugin USING btree (placeholder_id);


--
-- Name: cms_cmsplugin_plugin_type_94e96ebf; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cms_cmsplugin_plugin_type_94e96ebf ON public.cms_cmsplugin USING btree (plugin_type);


--
-- Name: cms_cmsplugin_plugin_type_94e96ebf_like; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cms_cmsplugin_plugin_type_94e96ebf_like ON public.cms_cmsplugin USING btree (plugin_type varchar_pattern_ops);


--
-- Name: cms_globalpagepermission_group_id_991b4733; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cms_globalpagepermission_group_id_991b4733 ON public.cms_globalpagepermission USING btree (group_id);


--
-- Name: cms_globalpagepermission_sites_globalpagepermission_id_46bd2681; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cms_globalpagepermission_sites_globalpagepermission_id_46bd2681 ON public.cms_globalpagepermission_sites USING btree (globalpagepermission_id);


--
-- Name: cms_globalpagepermission_sites_site_id_00460b53; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cms_globalpagepermission_sites_site_id_00460b53 ON public.cms_globalpagepermission_sites USING btree (site_id);


--
-- Name: cms_globalpagepermission_user_id_a227cee1; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cms_globalpagepermission_user_id_a227cee1 ON public.cms_globalpagepermission USING btree (user_id);


--
-- Name: cms_page_application_urls_9ef47497; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cms_page_application_urls_9ef47497 ON public.cms_page USING btree (application_urls);


--
-- Name: cms_page_application_urls_9ef47497_like; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cms_page_application_urls_9ef47497_like ON public.cms_page USING btree (application_urls varchar_pattern_ops);


--
-- Name: cms_page_in_navigation_01c24279; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cms_page_in_navigation_01c24279 ON public.cms_page USING btree (in_navigation);


--
-- Name: cms_page_is_home_edadca07; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cms_page_is_home_edadca07 ON public.cms_page USING btree (is_home);


--
-- Name: cms_page_limit_visibility_in_menu_30db6aa6; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cms_page_limit_visibility_in_menu_30db6aa6 ON public.cms_page USING btree (limit_visibility_in_menu);


--
-- Name: cms_page_navigation_extenders_c24af8dd; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cms_page_navigation_extenders_c24af8dd ON public.cms_page USING btree (navigation_extenders);


--
-- Name: cms_page_navigation_extenders_c24af8dd_like; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cms_page_navigation_extenders_c24af8dd_like ON public.cms_page USING btree (navigation_extenders varchar_pattern_ops);


--
-- Name: cms_page_node_id_c87b85a9; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cms_page_node_id_c87b85a9 ON public.cms_page USING btree (node_id);


--
-- Name: cms_page_placeholders_page_id_f2ce8dec; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cms_page_placeholders_page_id_f2ce8dec ON public.cms_page_placeholders USING btree (page_id);


--
-- Name: cms_page_placeholders_placeholder_id_6b120886; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cms_page_placeholders_placeholder_id_6b120886 ON public.cms_page_placeholders USING btree (placeholder_id);


--
-- Name: cms_page_publication_date_684fabf7; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cms_page_publication_date_684fabf7 ON public.cms_page USING btree (publication_date);


--
-- Name: cms_page_publication_end_date_12a0c46a; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cms_page_publication_end_date_12a0c46a ON public.cms_page USING btree (publication_end_date);


--
-- Name: cms_page_publisher_is_draft_141cba60; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cms_page_publisher_is_draft_141cba60 ON public.cms_page USING btree (publisher_is_draft);


--
-- Name: cms_page_reverse_id_ffc9ede2; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cms_page_reverse_id_ffc9ede2 ON public.cms_page USING btree (reverse_id);


--
-- Name: cms_page_reverse_id_ffc9ede2_like; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cms_page_reverse_id_ffc9ede2_like ON public.cms_page USING btree (reverse_id varchar_pattern_ops);


--
-- Name: cms_page_soft_root_51efccbe; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cms_page_soft_root_51efccbe ON public.cms_page USING btree (soft_root);


--
-- Name: cms_pagepermission_group_id_af5af193; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cms_pagepermission_group_id_af5af193 ON public.cms_pagepermission USING btree (group_id);


--
-- Name: cms_pagepermission_page_id_0ae9a163; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cms_pagepermission_page_id_0ae9a163 ON public.cms_pagepermission USING btree (page_id);


--
-- Name: cms_pagepermission_user_id_0c7d2b3c; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cms_pagepermission_user_id_0c7d2b3c ON public.cms_pagepermission USING btree (user_id);


--
-- Name: cms_pageuser_created_by_id_8e9fbf83; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cms_pageuser_created_by_id_8e9fbf83 ON public.cms_pageuser USING btree (created_by_id);


--
-- Name: cms_pageusergroup_created_by_id_7d57fa39; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cms_pageusergroup_created_by_id_7d57fa39 ON public.cms_pageusergroup USING btree (created_by_id);


--
-- Name: cms_placeholder_slot_0bc04d21; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cms_placeholder_slot_0bc04d21 ON public.cms_placeholder USING btree (slot);


--
-- Name: cms_placeholder_slot_0bc04d21_like; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cms_placeholder_slot_0bc04d21_like ON public.cms_placeholder USING btree (slot varchar_pattern_ops);


--
-- Name: cms_placeholderreference_placeholder_ref_id_244759b1; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cms_placeholderreference_placeholder_ref_id_244759b1 ON public.cms_placeholderreference USING btree (placeholder_ref_id);


--
-- Name: cms_staticplaceholder_draft_id_5aee407b; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cms_staticplaceholder_draft_id_5aee407b ON public.cms_staticplaceholder USING btree (draft_id);


--
-- Name: cms_staticplaceholder_public_id_876aaa66; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cms_staticplaceholder_public_id_876aaa66 ON public.cms_staticplaceholder USING btree (public_id);


--
-- Name: cms_staticplaceholder_site_id_dc6a85b6; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cms_staticplaceholder_site_id_dc6a85b6 ON public.cms_staticplaceholder USING btree (site_id);


--
-- Name: cms_title_has_url_overwrite_ecf27bb9; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cms_title_has_url_overwrite_ecf27bb9 ON public.cms_title USING btree (has_url_overwrite);


--
-- Name: cms_title_language_50a0dfa1; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cms_title_language_50a0dfa1 ON public.cms_title USING btree (language);


--
-- Name: cms_title_language_50a0dfa1_like; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cms_title_language_50a0dfa1_like ON public.cms_title USING btree (language varchar_pattern_ops);


--
-- Name: cms_title_page_id_5fade2a3; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cms_title_page_id_5fade2a3 ON public.cms_title USING btree (page_id);


--
-- Name: cms_title_path_c484314c; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cms_title_path_c484314c ON public.cms_title USING btree (path);


--
-- Name: cms_title_path_c484314c_like; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cms_title_path_c484314c_like ON public.cms_title USING btree (path varchar_pattern_ops);


--
-- Name: cms_title_publisher_is_draft_95874c88; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cms_title_publisher_is_draft_95874c88 ON public.cms_title USING btree (publisher_is_draft);


--
-- Name: cms_title_publisher_state_9a952b0f; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cms_title_publisher_state_9a952b0f ON public.cms_title USING btree (publisher_state);


--
-- Name: cms_title_slug_4947d146; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cms_title_slug_4947d146 ON public.cms_title USING btree (slug);


--
-- Name: cms_title_slug_4947d146_like; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cms_title_slug_4947d146_like ON public.cms_title USING btree (slug varchar_pattern_ops);


--
-- Name: cms_treenode_parent_id_59bb02c4; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cms_treenode_parent_id_59bb02c4 ON public.cms_treenode USING btree (parent_id);


--
-- Name: cms_treenode_path_6eb22885_like; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cms_treenode_path_6eb22885_like ON public.cms_treenode USING btree (path varchar_pattern_ops);


--
-- Name: cms_treenode_site_id_d3f46985; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cms_treenode_site_id_d3f46985 ON public.cms_treenode USING btree (site_id);


--
-- Name: cms_usersettings_clipboard_id_3ae17c19; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cms_usersettings_clipboard_id_3ae17c19 ON public.cms_usersettings USING btree (clipboard_id);


--
-- Name: cmsplugin_cascade_cascadeclipboard_identifier_6621d067_like; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cmsplugin_cascade_cascadeclipboard_identifier_6621d067_like ON public.cmsplugin_cascade_cascadeclipboard USING btree (identifier varchar_pattern_ops);


--
-- Name: cmsplugin_cascade_element_shared_glossary_id_607dc805; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cmsplugin_cascade_element_shared_glossary_id_607dc805 ON public.cmsplugin_cascade_element USING btree (shared_glossary_id);


--
-- Name: cmsplugin_cascade_iconfont_identifier_2c2df4a9_like; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cmsplugin_cascade_iconfont_identifier_2c2df4a9_like ON public.cmsplugin_cascade_iconfont USING btree (identifier varchar_pattern_ops);


--
-- Name: cmsplugin_cascade_iconfont_zip_file_id_7da0a199; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cmsplugin_cascade_iconfont_zip_file_id_7da0a199 ON public.cmsplugin_cascade_iconfont USING btree (zip_file_id);


--
-- Name: cmsplugin_cascade_inline_cascade_element_id_bef4d1d2; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cmsplugin_cascade_inline_cascade_element_id_bef4d1d2 ON public.cmsplugin_cascade_inline USING btree (cascade_element_id);


--
-- Name: cmsplugin_cascade_page_icon_font_id_8624d66d; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cmsplugin_cascade_page_icon_font_id_8624d66d ON public.cmsplugin_cascade_page USING btree (icon_font_id);


--
-- Name: cmsplugin_cascade_pluginextrafields_plugin_type_05dc46f5; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cmsplugin_cascade_pluginextrafields_plugin_type_05dc46f5 ON public.cmsplugin_cascade_pluginextrafields USING btree (plugin_type);


--
-- Name: cmsplugin_cascade_pluginextrafields_plugin_type_05dc46f5_like; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cmsplugin_cascade_pluginextrafields_plugin_type_05dc46f5_like ON public.cmsplugin_cascade_pluginextrafields USING btree (plugin_type varchar_pattern_ops);


--
-- Name: cmsplugin_cascade_pluginextrafields_site_id_0afc685b; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cmsplugin_cascade_pluginextrafields_site_id_0afc685b ON public.cmsplugin_cascade_pluginextrafields USING btree (site_id);


--
-- Name: cmsplugin_cascade_sharedglossary_identifier_3dbbc4d6_like; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cmsplugin_cascade_sharedglossary_identifier_3dbbc4d6_like ON public.cmsplugin_cascade_sharedglossary USING btree (identifier varchar_pattern_ops);


--
-- Name: cmsplugin_cascade_sharedglossary_plugin_type_98408398; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cmsplugin_cascade_sharedglossary_plugin_type_98408398 ON public.cmsplugin_cascade_sharedglossary USING btree (plugin_type);


--
-- Name: cmsplugin_cascade_sharedglossary_plugin_type_98408398_like; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cmsplugin_cascade_sharedglossary_plugin_type_98408398_like ON public.cmsplugin_cascade_sharedglossary USING btree (plugin_type varchar_pattern_ops);


--
-- Name: cmsplugin_cascade_sortinline_cascade_element_id_15bf5242; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cmsplugin_cascade_sortinline_cascade_element_id_15bf5242 ON public.cmsplugin_cascade_sortinline USING btree (cascade_element_id);


--
-- Name: cmsplugin_cascade_sortinline_order_77dc03a6; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cmsplugin_cascade_sortinline_order_77dc03a6 ON public.cmsplugin_cascade_sortinline USING btree ("order");


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: easy_thumbnails_source_name_5fe0edc6; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX easy_thumbnails_source_name_5fe0edc6 ON public.easy_thumbnails_source USING btree (name);


--
-- Name: easy_thumbnails_source_name_5fe0edc6_like; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX easy_thumbnails_source_name_5fe0edc6_like ON public.easy_thumbnails_source USING btree (name varchar_pattern_ops);


--
-- Name: easy_thumbnails_source_storage_hash_946cbcc9; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX easy_thumbnails_source_storage_hash_946cbcc9 ON public.easy_thumbnails_source USING btree (storage_hash);


--
-- Name: easy_thumbnails_source_storage_hash_946cbcc9_like; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX easy_thumbnails_source_storage_hash_946cbcc9_like ON public.easy_thumbnails_source USING btree (storage_hash varchar_pattern_ops);


--
-- Name: easy_thumbnails_thumbnail_name_b5882c31; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX easy_thumbnails_thumbnail_name_b5882c31 ON public.easy_thumbnails_thumbnail USING btree (name);


--
-- Name: easy_thumbnails_thumbnail_name_b5882c31_like; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX easy_thumbnails_thumbnail_name_b5882c31_like ON public.easy_thumbnails_thumbnail USING btree (name varchar_pattern_ops);


--
-- Name: easy_thumbnails_thumbnail_source_id_5b57bc77; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX easy_thumbnails_thumbnail_source_id_5b57bc77 ON public.easy_thumbnails_thumbnail USING btree (source_id);


--
-- Name: easy_thumbnails_thumbnail_storage_hash_f1435f49; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX easy_thumbnails_thumbnail_storage_hash_f1435f49 ON public.easy_thumbnails_thumbnail USING btree (storage_hash);


--
-- Name: easy_thumbnails_thumbnail_storage_hash_f1435f49_like; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX easy_thumbnails_thumbnail_storage_hash_f1435f49_like ON public.easy_thumbnails_thumbnail USING btree (storage_hash varchar_pattern_ops);


--
-- Name: filer_clipboard_user_id_b52ff0bc; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX filer_clipboard_user_id_b52ff0bc ON public.filer_clipboard USING btree (user_id);


--
-- Name: filer_clipboarditem_clipboard_id_7a76518b; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX filer_clipboarditem_clipboard_id_7a76518b ON public.filer_clipboarditem USING btree (clipboard_id);


--
-- Name: filer_clipboarditem_file_id_06196f80; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX filer_clipboarditem_file_id_06196f80 ON public.filer_clipboarditem USING btree (file_id);


--
-- Name: filer_file_folder_id_af803bbb; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX filer_file_folder_id_af803bbb ON public.filer_file USING btree (folder_id);


--
-- Name: filer_file_owner_id_b9e32671; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX filer_file_owner_id_b9e32671 ON public.filer_file USING btree (owner_id);


--
-- Name: filer_file_polymorphic_ctype_id_f44903c1; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX filer_file_polymorphic_ctype_id_f44903c1 ON public.filer_file USING btree (polymorphic_ctype_id);


--
-- Name: filer_folder_owner_id_be530fb4; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX filer_folder_owner_id_be530fb4 ON public.filer_folder USING btree (owner_id);


--
-- Name: filer_folder_parent_id_308aecda; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX filer_folder_parent_id_308aecda ON public.filer_folder USING btree (parent_id);


--
-- Name: filer_folder_tree_id_b016223c; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX filer_folder_tree_id_b016223c ON public.filer_folder USING btree (tree_id);


--
-- Name: filer_folder_tree_id_lft_088ce52b_idx; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX filer_folder_tree_id_lft_088ce52b_idx ON public.filer_folder USING btree (tree_id, lft);


--
-- Name: filer_folderpermission_folder_id_5d02f1da; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX filer_folderpermission_folder_id_5d02f1da ON public.filer_folderpermission USING btree (folder_id);


--
-- Name: filer_folderpermission_group_id_8901bafa; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX filer_folderpermission_group_id_8901bafa ON public.filer_folderpermission USING btree (group_id);


--
-- Name: filer_folderpermission_user_id_7673d4b6; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX filer_folderpermission_user_id_7673d4b6 ON public.filer_folderpermission USING btree (user_id);


--
-- Name: post_office_attachment_emails_attachment_id_6136fd9a; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX post_office_attachment_emails_attachment_id_6136fd9a ON public.post_office_attachment_emails USING btree (attachment_id);


--
-- Name: post_office_attachment_emails_email_id_96875fd9; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX post_office_attachment_emails_email_id_96875fd9 ON public.post_office_attachment_emails USING btree (email_id);


--
-- Name: post_office_email_created_1306952f; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX post_office_email_created_1306952f ON public.post_office_email USING btree (created);


--
-- Name: post_office_email_last_updated_0ffcec35; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX post_office_email_last_updated_0ffcec35 ON public.post_office_email USING btree (last_updated);


--
-- Name: post_office_email_scheduled_time_3869ebec; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX post_office_email_scheduled_time_3869ebec ON public.post_office_email USING btree (scheduled_time);


--
-- Name: post_office_email_status_013a896c; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX post_office_email_status_013a896c ON public.post_office_email USING btree (status);


--
-- Name: post_office_email_template_id_417da7da; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX post_office_email_template_id_417da7da ON public.post_office_email USING btree (template_id);


--
-- Name: post_office_emailtemplate_default_template_id_2ac2f889; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX post_office_emailtemplate_default_template_id_2ac2f889 ON public.post_office_emailtemplate USING btree (default_template_id);


--
-- Name: post_office_log_email_id_d42c8808; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX post_office_log_email_id_d42c8808 ON public.post_office_log USING btree (email_id);


--
-- Name: shop_notification_mail_template_id_bb050f73; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX shop_notification_mail_template_id_bb050f73 ON public.shop_notification USING btree (mail_template_id);


--
-- Name: shop_notification_recipient_id_81184845; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX shop_notification_recipient_id_81184845 ON public.shop_notification USING btree (recipient_id);


--
-- Name: shop_notificationattachment_attachment_id_da92621b; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX shop_notificationattachment_attachment_id_da92621b ON public.shop_notificationattachment USING btree (attachment_id);


--
-- Name: shop_notificationattachment_notification_id_d30cc951; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX shop_notificationattachment_notification_id_d30cc951 ON public.shop_notificationattachment USING btree (notification_id);


--
-- Name: weltladen_billingaddress_customer_id_c631e62a; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX weltladen_billingaddress_customer_id_c631e62a ON public.weltladen_billingaddress USING btree (customer_id);


--
-- Name: weltladen_billingaddress_priority_ceefcb31; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX weltladen_billingaddress_priority_ceefcb31 ON public.weltladen_billingaddress USING btree (priority);


--
-- Name: weltladen_cart_billing_address_id_a83d8ead; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX weltladen_cart_billing_address_id_a83d8ead ON public.weltladen_cart USING btree (billing_address_id);


--
-- Name: weltladen_cart_shipping_address_id_f20d6b1a; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX weltladen_cart_shipping_address_id_f20d6b1a ON public.weltladen_cart USING btree (shipping_address_id);


--
-- Name: weltladen_cartitem_cart_id_be5208a3; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX weltladen_cartitem_cart_id_be5208a3 ON public.weltladen_cartitem USING btree (cart_id);


--
-- Name: weltladen_cartitem_product_id_ed8a5508; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX weltladen_cartitem_product_id_ed8a5508 ON public.weltladen_cartitem USING btree (product_id);


--
-- Name: weltladen_delivery_order_id_61f10e9e; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX weltladen_delivery_order_id_61f10e9e ON public.weltladen_delivery USING btree (order_id);


--
-- Name: weltladen_deliveryitem_delivery_id_20e70d57; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX weltladen_deliveryitem_delivery_id_20e70d57 ON public.weltladen_deliveryitem USING btree (delivery_id);


--
-- Name: weltladen_deliveryitem_item_id_3cc974c9; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX weltladen_deliveryitem_item_id_3cc974c9 ON public.weltladen_deliveryitem USING btree (item_id);


--
-- Name: weltladen_manufacturer_name_f25ea32b_like; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX weltladen_manufacturer_name_f25ea32b_like ON public.weltladen_manufacturer USING btree (name varchar_pattern_ops);


--
-- Name: weltladen_order_customer_id_f2c4defa; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX weltladen_order_customer_id_f2c4defa ON public.weltladen_order USING btree (customer_id);


--
-- Name: weltladen_orderitem_order_id_2166a288; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX weltladen_orderitem_order_id_2166a288 ON public.weltladen_orderitem USING btree (order_id);


--
-- Name: weltladen_orderitem_product_id_b269c0fb; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX weltladen_orderitem_product_id_b269c0fb ON public.weltladen_orderitem USING btree (product_id);


--
-- Name: weltladen_orderpayment_order_id_1c0dac8e; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX weltladen_orderpayment_order_id_1c0dac8e ON public.weltladen_orderpayment USING btree (order_id);


--
-- Name: weltladen_productimage_image_id_71c912b7; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX weltladen_productimage_image_id_71c912b7 ON public.weltladen_productimage USING btree (image_id);


--
-- Name: weltladen_productimage_product_id_8b9db791; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX weltladen_productimage_product_id_8b9db791 ON public.weltladen_productimage USING btree (product_id);


--
-- Name: weltladen_productpage_page_id_7c876d83; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX weltladen_productpage_page_id_7c876d83 ON public.weltladen_productpage USING btree (page_id);


--
-- Name: weltladen_productpage_product_id_557364f0; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX weltladen_productpage_product_id_557364f0 ON public.weltladen_productpage USING btree (product_id);


--
-- Name: weltladen_shippingaddress_customer_id_64bac2e8; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX weltladen_shippingaddress_customer_id_64bac2e8 ON public.weltladen_shippingaddress USING btree (customer_id);


--
-- Name: weltladen_shippingaddress_priority_05752c9f; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX weltladen_shippingaddress_priority_05752c9f ON public.weltladen_shippingaddress USING btree (priority);


--
-- Name: weltladen_supplier_name_c596291e_like; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX weltladen_supplier_name_c596291e_like ON public.weltladen_supplier USING btree (name varchar_pattern_ops);


--
-- Name: weltladen_weltladenprodu_language_code_f772ccfc_like; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX weltladen_weltladenprodu_language_code_f772ccfc_like ON public.weltladen_weltladenproducttranslation USING btree (language_code varchar_pattern_ops);


--
-- Name: weltladen_weltladenproduct_manufacturer_id_7c6206bd; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX weltladen_weltladenproduct_manufacturer_id_7c6206bd ON public.weltladen_weltladenproduct USING btree (manufacturer_id);


--
-- Name: weltladen_weltladenproduct_order_933bc4da; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX weltladen_weltladenproduct_order_933bc4da ON public.weltladen_weltladenproduct USING btree ("order");


--
-- Name: weltladen_weltladenproduct_polymorphic_ctype_id_7f41faef; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX weltladen_weltladenproduct_polymorphic_ctype_id_7f41faef ON public.weltladen_weltladenproduct USING btree (polymorphic_ctype_id);


--
-- Name: weltladen_weltladenproduct_product_code_dff25414_like; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX weltladen_weltladenproduct_product_code_dff25414_like ON public.weltladen_weltladenproduct USING btree (product_code varchar_pattern_ops);


--
-- Name: weltladen_weltladenproduct_slug_549c895b; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX weltladen_weltladenproduct_slug_549c895b ON public.weltladen_weltladenproduct USING btree (slug);


--
-- Name: weltladen_weltladenproduct_slug_549c895b_like; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX weltladen_weltladenproduct_slug_549c895b_like ON public.weltladen_weltladenproduct USING btree (slug varchar_pattern_ops);


--
-- Name: weltladen_weltladenproduct_supplier_id_2029c477; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX weltladen_weltladenproduct_supplier_id_2029c477 ON public.weltladen_weltladenproduct USING btree (supplier_id);


--
-- Name: weltladen_weltladenproducttranslation_language_code_f772ccfc; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX weltladen_weltladenproducttranslation_language_code_f772ccfc ON public.weltladen_weltladenproducttranslation USING btree (language_code);


--
-- Name: weltladen_weltladenproducttranslation_master_id_132b3fd0; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX weltladen_weltladenproducttranslation_master_id_132b3fd0 ON public.weltladen_weltladenproducttranslation USING btree (master_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_aliaspluginmodel cms_aliaspluginmodel_alias_placeholder_id_6d6e0c8a_fk_cms_place; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_aliaspluginmodel
    ADD CONSTRAINT cms_aliaspluginmodel_alias_placeholder_id_6d6e0c8a_fk_cms_place FOREIGN KEY (alias_placeholder_id) REFERENCES public.cms_placeholder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_aliaspluginmodel cms_aliaspluginmodel_cmsplugin_ptr_id_f71dfd31_fk_cms_cmspl; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_aliaspluginmodel
    ADD CONSTRAINT cms_aliaspluginmodel_cmsplugin_ptr_id_f71dfd31_fk_cms_cmspl FOREIGN KEY (cmsplugin_ptr_id) REFERENCES public.cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_aliaspluginmodel cms_aliaspluginmodel_plugin_id_9867676e_fk_cms_cmsplugin_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_aliaspluginmodel
    ADD CONSTRAINT cms_aliaspluginmodel_plugin_id_9867676e_fk_cms_cmsplugin_id FOREIGN KEY (plugin_id) REFERENCES public.cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_cmsplugin cms_cmsplugin_parent_id_fd3bd9dd_fk_cms_cmsplugin_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_cmsplugin
    ADD CONSTRAINT cms_cmsplugin_parent_id_fd3bd9dd_fk_cms_cmsplugin_id FOREIGN KEY (parent_id) REFERENCES public.cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_cmsplugin cms_cmsplugin_placeholder_id_0bfa3b26_fk_cms_placeholder_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_cmsplugin
    ADD CONSTRAINT cms_cmsplugin_placeholder_id_0bfa3b26_fk_cms_placeholder_id FOREIGN KEY (placeholder_id) REFERENCES public.cms_placeholder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_globalpagepermission_sites cms_globalpagepermis_globalpagepermission_46bd2681_fk_cms_globa; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_globalpagepermission_sites
    ADD CONSTRAINT cms_globalpagepermis_globalpagepermission_46bd2681_fk_cms_globa FOREIGN KEY (globalpagepermission_id) REFERENCES public.cms_globalpagepermission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_globalpagepermission_sites cms_globalpagepermis_site_id_00460b53_fk_django_si; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_globalpagepermission_sites
    ADD CONSTRAINT cms_globalpagepermis_site_id_00460b53_fk_django_si FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_globalpagepermission cms_globalpagepermission_group_id_991b4733_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_globalpagepermission
    ADD CONSTRAINT cms_globalpagepermission_group_id_991b4733_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_globalpagepermission cms_globalpagepermission_user_id_a227cee1_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_globalpagepermission
    ADD CONSTRAINT cms_globalpagepermission_user_id_a227cee1_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_page cms_page_node_id_c87b85a9_fk_cms_treenode_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_page
    ADD CONSTRAINT cms_page_node_id_c87b85a9_fk_cms_treenode_id FOREIGN KEY (node_id) REFERENCES public.cms_treenode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_page_placeholders cms_page_placeholder_placeholder_id_6b120886_fk_cms_place; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_page_placeholders
    ADD CONSTRAINT cms_page_placeholder_placeholder_id_6b120886_fk_cms_place FOREIGN KEY (placeholder_id) REFERENCES public.cms_placeholder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_page_placeholders cms_page_placeholders_page_id_f2ce8dec_fk_cms_page_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_page_placeholders
    ADD CONSTRAINT cms_page_placeholders_page_id_f2ce8dec_fk_cms_page_id FOREIGN KEY (page_id) REFERENCES public.cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_page cms_page_publisher_public_id_d619fca0_fk_cms_page_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_page
    ADD CONSTRAINT cms_page_publisher_public_id_d619fca0_fk_cms_page_id FOREIGN KEY (publisher_public_id) REFERENCES public.cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_pagepermission cms_pagepermission_group_id_af5af193_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_pagepermission
    ADD CONSTRAINT cms_pagepermission_group_id_af5af193_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_pagepermission cms_pagepermission_page_id_0ae9a163_fk_cms_page_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_pagepermission
    ADD CONSTRAINT cms_pagepermission_page_id_0ae9a163_fk_cms_page_id FOREIGN KEY (page_id) REFERENCES public.cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_pagepermission cms_pagepermission_user_id_0c7d2b3c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_pagepermission
    ADD CONSTRAINT cms_pagepermission_user_id_0c7d2b3c_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_pageuser cms_pageuser_created_by_id_8e9fbf83_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_pageuser
    ADD CONSTRAINT cms_pageuser_created_by_id_8e9fbf83_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_pageuser cms_pageuser_user_ptr_id_b3d65592_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_pageuser
    ADD CONSTRAINT cms_pageuser_user_ptr_id_b3d65592_fk_auth_user_id FOREIGN KEY (user_ptr_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_pageusergroup cms_pageusergroup_created_by_id_7d57fa39_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_pageusergroup
    ADD CONSTRAINT cms_pageusergroup_created_by_id_7d57fa39_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_pageusergroup cms_pageusergroup_group_ptr_id_34578d93_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_pageusergroup
    ADD CONSTRAINT cms_pageusergroup_group_ptr_id_34578d93_fk_auth_group_id FOREIGN KEY (group_ptr_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_placeholderreference cms_placeholderrefer_cmsplugin_ptr_id_6977ec85_fk_cms_cmspl; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_placeholderreference
    ADD CONSTRAINT cms_placeholderrefer_cmsplugin_ptr_id_6977ec85_fk_cms_cmspl FOREIGN KEY (cmsplugin_ptr_id) REFERENCES public.cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_placeholderreference cms_placeholderrefer_placeholder_ref_id_244759b1_fk_cms_place; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_placeholderreference
    ADD CONSTRAINT cms_placeholderrefer_placeholder_ref_id_244759b1_fk_cms_place FOREIGN KEY (placeholder_ref_id) REFERENCES public.cms_placeholder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_staticplaceholder cms_staticplaceholder_draft_id_5aee407b_fk_cms_placeholder_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_staticplaceholder
    ADD CONSTRAINT cms_staticplaceholder_draft_id_5aee407b_fk_cms_placeholder_id FOREIGN KEY (draft_id) REFERENCES public.cms_placeholder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_staticplaceholder cms_staticplaceholder_public_id_876aaa66_fk_cms_placeholder_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_staticplaceholder
    ADD CONSTRAINT cms_staticplaceholder_public_id_876aaa66_fk_cms_placeholder_id FOREIGN KEY (public_id) REFERENCES public.cms_placeholder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_staticplaceholder cms_staticplaceholder_site_id_dc6a85b6_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_staticplaceholder
    ADD CONSTRAINT cms_staticplaceholder_site_id_dc6a85b6_fk_django_site_id FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_title cms_title_page_id_5fade2a3_fk_cms_page_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_title
    ADD CONSTRAINT cms_title_page_id_5fade2a3_fk_cms_page_id FOREIGN KEY (page_id) REFERENCES public.cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_title cms_title_publisher_public_id_003a2702_fk_cms_title_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_title
    ADD CONSTRAINT cms_title_publisher_public_id_003a2702_fk_cms_title_id FOREIGN KEY (publisher_public_id) REFERENCES public.cms_title(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_treenode cms_treenode_parent_id_59bb02c4_fk_cms_treenode_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_treenode
    ADD CONSTRAINT cms_treenode_parent_id_59bb02c4_fk_cms_treenode_id FOREIGN KEY (parent_id) REFERENCES public.cms_treenode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_treenode cms_treenode_site_id_d3f46985_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_treenode
    ADD CONSTRAINT cms_treenode_site_id_d3f46985_fk_django_site_id FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_usersettings cms_usersettings_clipboard_id_3ae17c19_fk_cms_placeholder_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_usersettings
    ADD CONSTRAINT cms_usersettings_clipboard_id_3ae17c19_fk_cms_placeholder_id FOREIGN KEY (clipboard_id) REFERENCES public.cms_placeholder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_usersettings cms_usersettings_user_id_09633b2d_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cms_usersettings
    ADD CONSTRAINT cms_usersettings_user_id_09633b2d_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_cascade_element cmsplugin_cascade_el_cmsplugin_ptr_id_aaa25230_fk_cms_cmspl; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cmsplugin_cascade_element
    ADD CONSTRAINT cmsplugin_cascade_el_cmsplugin_ptr_id_aaa25230_fk_cms_cmspl FOREIGN KEY (cmsplugin_ptr_id) REFERENCES public.cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_cascade_element cmsplugin_cascade_el_shared_glossary_id_607dc805_fk_cmsplugin; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cmsplugin_cascade_element
    ADD CONSTRAINT cmsplugin_cascade_el_shared_glossary_id_607dc805_fk_cmsplugin FOREIGN KEY (shared_glossary_id) REFERENCES public.cmsplugin_cascade_sharedglossary(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_cascade_iconfont cmsplugin_cascade_ic_zip_file_id_7da0a199_fk_filer_fil; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cmsplugin_cascade_iconfont
    ADD CONSTRAINT cmsplugin_cascade_ic_zip_file_id_7da0a199_fk_filer_fil FOREIGN KEY (zip_file_id) REFERENCES public.filer_file(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_cascade_inline cmsplugin_cascade_in_cascade_element_id_bef4d1d2_fk_cmsplugin; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cmsplugin_cascade_inline
    ADD CONSTRAINT cmsplugin_cascade_in_cascade_element_id_bef4d1d2_fk_cmsplugin FOREIGN KEY (cascade_element_id) REFERENCES public.cmsplugin_cascade_element(cmsplugin_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_cascade_page cmsplugin_cascade_pa_extended_object_id_cd17c9f0_fk_cms_page_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cmsplugin_cascade_page
    ADD CONSTRAINT cmsplugin_cascade_pa_extended_object_id_cd17c9f0_fk_cms_page_ FOREIGN KEY (extended_object_id) REFERENCES public.cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_cascade_page cmsplugin_cascade_pa_icon_font_id_8624d66d_fk_cmsplugin; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cmsplugin_cascade_page
    ADD CONSTRAINT cmsplugin_cascade_pa_icon_font_id_8624d66d_fk_cmsplugin FOREIGN KEY (icon_font_id) REFERENCES public.cmsplugin_cascade_iconfont(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_cascade_page cmsplugin_cascade_pa_public_extension_id_32f16696_fk_cmsplugin; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cmsplugin_cascade_page
    ADD CONSTRAINT cmsplugin_cascade_pa_public_extension_id_32f16696_fk_cmsplugin FOREIGN KEY (public_extension_id) REFERENCES public.cmsplugin_cascade_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_cascade_pluginextrafields cmsplugin_cascade_pl_site_id_0afc685b_fk_django_si; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cmsplugin_cascade_pluginextrafields
    ADD CONSTRAINT cmsplugin_cascade_pl_site_id_0afc685b_fk_django_si FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_cascade_sortinline cmsplugin_cascade_so_cascade_element_id_15bf5242_fk_cmsplugin; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cmsplugin_cascade_sortinline
    ADD CONSTRAINT cmsplugin_cascade_so_cascade_element_id_15bf5242_fk_cmsplugin FOREIGN KEY (cascade_element_id) REFERENCES public.cmsplugin_cascade_element(cmsplugin_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: djangocms_text_ckeditor_text djangocms_text_ckedi_cmsplugin_ptr_id_946882c1_fk_cms_cmspl; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.djangocms_text_ckeditor_text
    ADD CONSTRAINT djangocms_text_ckedi_cmsplugin_ptr_id_946882c1_fk_cms_cmspl FOREIGN KEY (cmsplugin_ptr_id) REFERENCES public.cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: easy_thumbnails_thumbnail easy_thumbnails_thum_source_id_5b57bc77_fk_easy_thum; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_thumbnails_thum_source_id_5b57bc77_fk_easy_thum FOREIGN KEY (source_id) REFERENCES public.easy_thumbnails_source(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: easy_thumbnails_thumbnaildimensions easy_thumbnails_thum_thumbnail_id_c3a0c549_fk_easy_thum; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.easy_thumbnails_thumbnaildimensions
    ADD CONSTRAINT easy_thumbnails_thum_thumbnail_id_c3a0c549_fk_easy_thum FOREIGN KEY (thumbnail_id) REFERENCES public.easy_thumbnails_thumbnail(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: filer_clipboard filer_clipboard_user_id_b52ff0bc_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.filer_clipboard
    ADD CONSTRAINT filer_clipboard_user_id_b52ff0bc_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: filer_clipboarditem filer_clipboarditem_clipboard_id_7a76518b_fk_filer_clipboard_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.filer_clipboarditem
    ADD CONSTRAINT filer_clipboarditem_clipboard_id_7a76518b_fk_filer_clipboard_id FOREIGN KEY (clipboard_id) REFERENCES public.filer_clipboard(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: filer_clipboarditem filer_clipboarditem_file_id_06196f80_fk_filer_file_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.filer_clipboarditem
    ADD CONSTRAINT filer_clipboarditem_file_id_06196f80_fk_filer_file_id FOREIGN KEY (file_id) REFERENCES public.filer_file(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: filer_file filer_file_folder_id_af803bbb_fk_filer_folder_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.filer_file
    ADD CONSTRAINT filer_file_folder_id_af803bbb_fk_filer_folder_id FOREIGN KEY (folder_id) REFERENCES public.filer_folder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: filer_file filer_file_owner_id_b9e32671_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.filer_file
    ADD CONSTRAINT filer_file_owner_id_b9e32671_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: filer_file filer_file_polymorphic_ctype_id_f44903c1_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.filer_file
    ADD CONSTRAINT filer_file_polymorphic_ctype_id_f44903c1_fk_django_co FOREIGN KEY (polymorphic_ctype_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: filer_folder filer_folder_owner_id_be530fb4_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.filer_folder
    ADD CONSTRAINT filer_folder_owner_id_be530fb4_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: filer_folder filer_folder_parent_id_308aecda_fk_filer_folder_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.filer_folder
    ADD CONSTRAINT filer_folder_parent_id_308aecda_fk_filer_folder_id FOREIGN KEY (parent_id) REFERENCES public.filer_folder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: filer_folderpermission filer_folderpermission_folder_id_5d02f1da_fk_filer_folder_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.filer_folderpermission
    ADD CONSTRAINT filer_folderpermission_folder_id_5d02f1da_fk_filer_folder_id FOREIGN KEY (folder_id) REFERENCES public.filer_folder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: filer_folderpermission filer_folderpermission_group_id_8901bafa_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.filer_folderpermission
    ADD CONSTRAINT filer_folderpermission_group_id_8901bafa_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: filer_folderpermission filer_folderpermission_user_id_7673d4b6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.filer_folderpermission
    ADD CONSTRAINT filer_folderpermission_user_id_7673d4b6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: filer_image filer_image_file_ptr_id_3e21d4f0_fk_filer_file_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.filer_image
    ADD CONSTRAINT filer_image_file_ptr_id_3e21d4f0_fk_filer_file_id FOREIGN KEY (file_ptr_id) REFERENCES public.filer_file(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: post_office_attachment_emails post_office_attachme_attachment_id_6136fd9a_fk_post_offi; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.post_office_attachment_emails
    ADD CONSTRAINT post_office_attachme_attachment_id_6136fd9a_fk_post_offi FOREIGN KEY (attachment_id) REFERENCES public.post_office_attachment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: post_office_attachment_emails post_office_attachme_email_id_96875fd9_fk_post_offi; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.post_office_attachment_emails
    ADD CONSTRAINT post_office_attachme_email_id_96875fd9_fk_post_offi FOREIGN KEY (email_id) REFERENCES public.post_office_email(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: post_office_email post_office_email_template_id_417da7da_fk_post_offi; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.post_office_email
    ADD CONSTRAINT post_office_email_template_id_417da7da_fk_post_offi FOREIGN KEY (template_id) REFERENCES public.post_office_emailtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: post_office_emailtemplate post_office_emailtem_default_template_id_2ac2f889_fk_post_offi; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.post_office_emailtemplate
    ADD CONSTRAINT post_office_emailtem_default_template_id_2ac2f889_fk_post_offi FOREIGN KEY (default_template_id) REFERENCES public.post_office_emailtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: post_office_log post_office_log_email_id_d42c8808_fk_post_office_email_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.post_office_log
    ADD CONSTRAINT post_office_log_email_id_d42c8808_fk_post_office_email_id FOREIGN KEY (email_id) REFERENCES public.post_office_email(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_notification shop_notification_mail_template_id_bb050f73_fk_post_offi; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.shop_notification
    ADD CONSTRAINT shop_notification_mail_template_id_bb050f73_fk_post_offi FOREIGN KEY (mail_template_id) REFERENCES public.post_office_emailtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_notification shop_notification_recipient_id_81184845_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.shop_notification
    ADD CONSTRAINT shop_notification_recipient_id_81184845_fk_auth_user_id FOREIGN KEY (recipient_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_notificationattachment shop_notificationatt_attachment_id_da92621b_fk_filer_fil; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.shop_notificationattachment
    ADD CONSTRAINT shop_notificationatt_attachment_id_da92621b_fk_filer_fil FOREIGN KEY (attachment_id) REFERENCES public.filer_file(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_notificationattachment shop_notificationatt_notification_id_d30cc951_fk_shop_noti; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.shop_notificationattachment
    ADD CONSTRAINT shop_notificationatt_notification_id_d30cc951_fk_shop_noti FOREIGN KEY (notification_id) REFERENCES public.shop_notification(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: weltladen_billingaddress weltladen_billingadd_customer_id_c631e62a_fk_weltladen; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_billingaddress
    ADD CONSTRAINT weltladen_billingadd_customer_id_c631e62a_fk_weltladen FOREIGN KEY (customer_id) REFERENCES public.weltladen_weltladencustomer(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: weltladen_cart weltladen_cart_billing_address_id_a83d8ead_fk_weltladen; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_cart
    ADD CONSTRAINT weltladen_cart_billing_address_id_a83d8ead_fk_weltladen FOREIGN KEY (billing_address_id) REFERENCES public.weltladen_billingaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: weltladen_cart weltladen_cart_customer_id_693d123a_fk_weltladen; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_cart
    ADD CONSTRAINT weltladen_cart_customer_id_693d123a_fk_weltladen FOREIGN KEY (customer_id) REFERENCES public.weltladen_weltladencustomer(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: weltladen_cart weltladen_cart_shipping_address_id_f20d6b1a_fk_weltladen; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_cart
    ADD CONSTRAINT weltladen_cart_shipping_address_id_f20d6b1a_fk_weltladen FOREIGN KEY (shipping_address_id) REFERENCES public.weltladen_shippingaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: weltladen_cartitem weltladen_cartitem_cart_id_be5208a3_fk_weltladen_cart_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_cartitem
    ADD CONSTRAINT weltladen_cartitem_cart_id_be5208a3_fk_weltladen_cart_id FOREIGN KEY (cart_id) REFERENCES public.weltladen_cart(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: weltladen_cartitem weltladen_cartitem_product_id_ed8a5508_fk_weltladen; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_cartitem
    ADD CONSTRAINT weltladen_cartitem_product_id_ed8a5508_fk_weltladen FOREIGN KEY (product_id) REFERENCES public.weltladen_weltladenproduct(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: weltladen_delivery weltladen_delivery_order_id_61f10e9e_fk_weltladen_order_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_delivery
    ADD CONSTRAINT weltladen_delivery_order_id_61f10e9e_fk_weltladen_order_id FOREIGN KEY (order_id) REFERENCES public.weltladen_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: weltladen_deliveryitem weltladen_deliveryit_delivery_id_20e70d57_fk_weltladen; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_deliveryitem
    ADD CONSTRAINT weltladen_deliveryit_delivery_id_20e70d57_fk_weltladen FOREIGN KEY (delivery_id) REFERENCES public.weltladen_delivery(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: weltladen_deliveryitem weltladen_deliveryit_item_id_3cc974c9_fk_weltladen; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_deliveryitem
    ADD CONSTRAINT weltladen_deliveryit_item_id_3cc974c9_fk_weltladen FOREIGN KEY (item_id) REFERENCES public.weltladen_orderitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: weltladen_order weltladen_order_customer_id_f2c4defa_fk_weltladen; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_order
    ADD CONSTRAINT weltladen_order_customer_id_f2c4defa_fk_weltladen FOREIGN KEY (customer_id) REFERENCES public.weltladen_weltladencustomer(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: weltladen_orderitem weltladen_orderitem_order_id_2166a288_fk_weltladen_order_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_orderitem
    ADD CONSTRAINT weltladen_orderitem_order_id_2166a288_fk_weltladen_order_id FOREIGN KEY (order_id) REFERENCES public.weltladen_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: weltladen_orderitem weltladen_orderitem_product_id_b269c0fb_fk_weltladen; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_orderitem
    ADD CONSTRAINT weltladen_orderitem_product_id_b269c0fb_fk_weltladen FOREIGN KEY (product_id) REFERENCES public.weltladen_weltladenproduct(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: weltladen_orderpayment weltladen_orderpayment_order_id_1c0dac8e_fk_weltladen_order_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_orderpayment
    ADD CONSTRAINT weltladen_orderpayment_order_id_1c0dac8e_fk_weltladen_order_id FOREIGN KEY (order_id) REFERENCES public.weltladen_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: weltladen_productimage weltladen_productima_image_id_71c912b7_fk_filer_ima; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_productimage
    ADD CONSTRAINT weltladen_productima_image_id_71c912b7_fk_filer_ima FOREIGN KEY (image_id) REFERENCES public.filer_image(file_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: weltladen_productimage weltladen_productima_product_id_8b9db791_fk_weltladen; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_productimage
    ADD CONSTRAINT weltladen_productima_product_id_8b9db791_fk_weltladen FOREIGN KEY (product_id) REFERENCES public.weltladen_weltladenproduct(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: weltladen_productpage weltladen_productpag_product_id_557364f0_fk_weltladen; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_productpage
    ADD CONSTRAINT weltladen_productpag_product_id_557364f0_fk_weltladen FOREIGN KEY (product_id) REFERENCES public.weltladen_weltladenproduct(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: weltladen_productpage weltladen_productpage_page_id_7c876d83_fk_cms_page_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_productpage
    ADD CONSTRAINT weltladen_productpage_page_id_7c876d83_fk_cms_page_id FOREIGN KEY (page_id) REFERENCES public.cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: weltladen_shippingaddress weltladen_shippingad_customer_id_64bac2e8_fk_weltladen; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_shippingaddress
    ADD CONSTRAINT weltladen_shippingad_customer_id_64bac2e8_fk_weltladen FOREIGN KEY (customer_id) REFERENCES public.weltladen_weltladencustomer(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: weltladen_weltladencustomer weltladen_weltladencustomer_user_id_14eec5f3_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_weltladencustomer
    ADD CONSTRAINT weltladen_weltladencustomer_user_id_14eec5f3_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: weltladen_weltladenproduct weltladen_weltladenp_manufacturer_id_7c6206bd_fk_weltladen; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_weltladenproduct
    ADD CONSTRAINT weltladen_weltladenp_manufacturer_id_7c6206bd_fk_weltladen FOREIGN KEY (manufacturer_id) REFERENCES public.weltladen_manufacturer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: weltladen_weltladenproducttranslation weltladen_weltladenp_master_id_132b3fd0_fk_weltladen; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_weltladenproducttranslation
    ADD CONSTRAINT weltladen_weltladenp_master_id_132b3fd0_fk_weltladen FOREIGN KEY (master_id) REFERENCES public.weltladen_weltladenproduct(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: weltladen_weltladenproduct weltladen_weltladenp_polymorphic_ctype_id_7f41faef_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_weltladenproduct
    ADD CONSTRAINT weltladen_weltladenp_polymorphic_ctype_id_7f41faef_fk_django_co FOREIGN KEY (polymorphic_ctype_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: weltladen_weltladenproduct weltladen_weltladenp_supplier_id_2029c477_fk_weltladen; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.weltladen_weltladenproduct
    ADD CONSTRAINT weltladen_weltladenp_supplier_id_2029c477_fk_weltladen FOREIGN KEY (supplier_id) REFERENCES public.weltladen_supplier(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

