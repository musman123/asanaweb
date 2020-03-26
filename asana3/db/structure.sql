--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2 (Ubuntu 12.2-2.pgdg18.04+1)
-- Dumped by pg_dump version 12.2 (Ubuntu 12.2-2.pgdg18.04+1)

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
-- Name: comments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.comments (
    id integer NOT NULL,
    commenter character varying,
    body text,
    task_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: employee_projects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.employee_projects (
    id integer NOT NULL,
    title character varying,
    description text,
    department character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: employee_projects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.employee_projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: employee_projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.employee_projects_id_seq OWNED BY public.employee_projects.id;


--
-- Name: employee_tasks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.employee_tasks (
    id integer NOT NULL,
    name character varying,
    task_description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: employee_tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.employee_tasks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: employee_tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.employee_tasks_id_seq OWNED BY public.employee_tasks.id;


--
-- Name: functions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.functions (
    id integer NOT NULL,
    name character varying,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: functions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.functions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: functions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.functions_id_seq OWNED BY public.functions.id;


--
-- Name: functions_usr_projects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.functions_usr_projects (
    usr_project_id integer NOT NULL,
    function_id integer NOT NULL
);


--
-- Name: pictures; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pictures (
    id integer NOT NULL,
    name character varying,
    pictureable_id integer,
    pictureable_type character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    photo_file_name character varying,
    photo_content_type character varying,
    photo_file_size bigint,
    photo_updated_at timestamp without time zone
);


--
-- Name: pictures_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pictures_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pictures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pictures_id_seq OWNED BY public.pictures.id;


--
-- Name: projecthws; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.projecthws (
    id integer NOT NULL,
    title character varying,
    description text,
    department character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: projecthws_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.projecthws_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projecthws_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.projecthws_id_seq OWNED BY public.projecthws.id;


--
-- Name: projecthws_taskhws; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.projecthws_taskhws (
    projecthw_id integer NOT NULL,
    taskhw_id integer NOT NULL
);


--
-- Name: projects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.projects (
    id integer NOT NULL,
    title character varying,
    description text,
    department character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- Name: projects_tasks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.projects_tasks (
    project_id integer NOT NULL,
    task_id integer NOT NULL
);


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: taskhws; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.taskhws (
    id integer NOT NULL,
    name character varying,
    task_description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: taskhws_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.taskhws_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: taskhws_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.taskhws_id_seq OWNED BY public.taskhws.id;


--
-- Name: tasks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tasks (
    id integer NOT NULL,
    name character varying,
    task_description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    assigner character varying,
    assign_to character varying,
    start_date date,
    submission_date date,
    user_id integer,
    project_name character varying,
    comments character varying,
    opinion character varying,
    all_project character varying,
    all_comments character varying
);


--
-- Name: tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tasks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tasks_id_seq OWNED BY public.tasks.id;


--
-- Name: tasks_usr_projects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tasks_usr_projects (
    usr_project_id integer NOT NULL,
    task_id integer NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying,
    email character varying,
    password character varying,
    password_conformation character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    password_digest character varying
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: usr_projs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.usr_projs (
    id integer NOT NULL,
    title character varying,
    description text,
    department character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: usr_projs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.usr_projs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: usr_projs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.usr_projs_id_seq OWNED BY public.usr_projs.id;


--
-- Name: usr_tasks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.usr_tasks (
    id integer NOT NULL,
    name character varying,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: usr_tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.usr_tasks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: usr_tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.usr_tasks_id_seq OWNED BY public.usr_tasks.id;


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: employee_projects id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.employee_projects ALTER COLUMN id SET DEFAULT nextval('public.employee_projects_id_seq'::regclass);


--
-- Name: employee_tasks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.employee_tasks ALTER COLUMN id SET DEFAULT nextval('public.employee_tasks_id_seq'::regclass);


--
-- Name: functions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.functions ALTER COLUMN id SET DEFAULT nextval('public.functions_id_seq'::regclass);


--
-- Name: pictures id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pictures ALTER COLUMN id SET DEFAULT nextval('public.pictures_id_seq'::regclass);


--
-- Name: projecthws id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projecthws ALTER COLUMN id SET DEFAULT nextval('public.projecthws_id_seq'::regclass);


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- Name: taskhws id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.taskhws ALTER COLUMN id SET DEFAULT nextval('public.taskhws_id_seq'::regclass);


--
-- Name: tasks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tasks ALTER COLUMN id SET DEFAULT nextval('public.tasks_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: usr_projs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usr_projs ALTER COLUMN id SET DEFAULT nextval('public.usr_projs_id_seq'::regclass);


--
-- Name: usr_tasks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usr_tasks ALTER COLUMN id SET DEFAULT nextval('public.usr_tasks_id_seq'::regclass);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: employee_projects employee_projects_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.employee_projects
    ADD CONSTRAINT employee_projects_pkey PRIMARY KEY (id);


--
-- Name: employee_tasks employee_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.employee_tasks
    ADD CONSTRAINT employee_tasks_pkey PRIMARY KEY (id);


--
-- Name: functions functions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.functions
    ADD CONSTRAINT functions_pkey PRIMARY KEY (id);


--
-- Name: pictures pictures_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pictures
    ADD CONSTRAINT pictures_pkey PRIMARY KEY (id);


--
-- Name: projecthws projecthws_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projecthws
    ADD CONSTRAINT projecthws_pkey PRIMARY KEY (id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: taskhws taskhws_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.taskhws
    ADD CONSTRAINT taskhws_pkey PRIMARY KEY (id);


--
-- Name: tasks tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: usr_projs usr_projs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usr_projs
    ADD CONSTRAINT usr_projs_pkey PRIMARY KEY (id);


--
-- Name: usr_tasks usr_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usr_tasks
    ADD CONSTRAINT usr_tasks_pkey PRIMARY KEY (id);


--
-- Name: index_comments_on_task_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_comments_on_task_id ON public.comments USING btree (task_id);


--
-- Name: index_pictures_on_pictureable_type_and_pictureable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_pictures_on_pictureable_type_and_pictureable_id ON public.pictures USING btree (pictureable_type, pictureable_id);


--
-- Name: index_projects_tasks_on_project_id_and_task_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_projects_tasks_on_project_id_and_task_id ON public.projects_tasks USING btree (project_id, task_id);


--
-- Name: index_projects_tasks_on_task_id_and_project_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_projects_tasks_on_task_id_and_project_id ON public.projects_tasks USING btree (task_id, project_id);


--
-- Name: index_tasks_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tasks_on_user_id ON public.tasks USING btree (user_id);


--
-- Name: index_tasks_usr_projects_on_task_id_and_usr_project_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tasks_usr_projects_on_task_id_and_usr_project_id ON public.tasks_usr_projects USING btree (task_id, usr_project_id);


--
-- Name: index_tasks_usr_projects_on_usr_project_id_and_task_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tasks_usr_projects_on_usr_project_id_and_task_id ON public.tasks_usr_projects USING btree (usr_project_id, task_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX unique_schema_migrations ON public.schema_migrations USING btree (version);


--
-- Name: tasks fk_rails_4d2a9e4d7e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT fk_rails_4d2a9e4d7e FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: comments fk_rails_6bd05453df; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk_rails_6bd05453df FOREIGN KEY (task_id) REFERENCES public.tasks(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO schema_migrations (version) VALUES ('20200312110014');

INSERT INTO schema_migrations (version) VALUES ('20200313112806');

INSERT INTO schema_migrations (version) VALUES ('20200313113350');

INSERT INTO schema_migrations (version) VALUES ('20200314101933');

INSERT INTO schema_migrations (version) VALUES ('20200314102042');

INSERT INTO schema_migrations (version) VALUES ('20200314103506');

INSERT INTO schema_migrations (version) VALUES ('20200314103604');

INSERT INTO schema_migrations (version) VALUES ('20200314110852');

INSERT INTO schema_migrations (version) VALUES ('20200314110913');

INSERT INTO schema_migrations (version) VALUES ('20200314112239');

INSERT INTO schema_migrations (version) VALUES ('20200314112347');

INSERT INTO schema_migrations (version) VALUES ('20200314114814');

INSERT INTO schema_migrations (version) VALUES ('20200314115920');

INSERT INTO schema_migrations (version) VALUES ('20200314115954');

INSERT INTO schema_migrations (version) VALUES ('20200314122849');

INSERT INTO schema_migrations (version) VALUES ('20200314122911');

INSERT INTO schema_migrations (version) VALUES ('20200314123014');

INSERT INTO schema_migrations (version) VALUES ('20200314123554');

INSERT INTO schema_migrations (version) VALUES ('20200314123837');

INSERT INTO schema_migrations (version) VALUES ('20200314124133');

INSERT INTO schema_migrations (version) VALUES ('20200314124427');

INSERT INTO schema_migrations (version) VALUES ('20200314124514');

INSERT INTO schema_migrations (version) VALUES ('20200314124558');

INSERT INTO schema_migrations (version) VALUES ('20200315143110');

INSERT INTO schema_migrations (version) VALUES ('20200316105043');

INSERT INTO schema_migrations (version) VALUES ('20200317134951');

INSERT INTO schema_migrations (version) VALUES ('20200317135521');

INSERT INTO schema_migrations (version) VALUES ('20200317165322');

INSERT INTO schema_migrations (version) VALUES ('20200318051324');

INSERT INTO schema_migrations (version) VALUES ('20200319171340');

INSERT INTO schema_migrations (version) VALUES ('20200320062907');

INSERT INTO schema_migrations (version) VALUES ('20200320063331');

INSERT INTO schema_migrations (version) VALUES ('20200320091704');

INSERT INTO schema_migrations (version) VALUES ('20200321163635');

INSERT INTO schema_migrations (version) VALUES ('20200324115357');

INSERT INTO schema_migrations (version) VALUES ('20200324172622');

INSERT INTO schema_migrations (version) VALUES ('20200324172657');

INSERT INTO schema_migrations (version) VALUES ('20200325034236');

INSERT INTO schema_migrations (version) VALUES ('20200325034650');

