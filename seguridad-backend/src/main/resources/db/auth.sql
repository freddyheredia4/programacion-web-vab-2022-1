
CREATE SCHEMA IF NOT EXISTS auth
    AUTHORIZATION postgres;


CREATE TABLE auth.authorities (
    authority_id integer NOT NULL,
    name character varying
);


ALTER TABLE auth.authorities OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16514)
-- Name: authorities_authority_id_seq; Type: SEQUENCE; Schema: auth; Owner: postgres
--

CREATE SEQUENCE auth.authorities_authority_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth.authorities_authority_id_seq OWNER TO postgres;

--
-- TOC entry 3361 (class 0 OID 0)
-- Dependencies: 210
-- Name: authorities_authority_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: postgres
--

ALTER SEQUENCE auth.authorities_authority_id_seq OWNED BY auth.authorities.authority_id;


--
-- TOC entry 213 (class 1259 OID 16524)
-- Name: roles; Type: TABLE; Schema: auth; Owner: postgres
--

CREATE TABLE auth.roles (
    role_id integer NOT NULL,
    name character varying
);


ALTER TABLE auth.roles OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16533)
-- Name: roles_authorities; Type: TABLE; Schema: auth; Owner: postgres
--

CREATE TABLE auth.roles_authorities (
    role_authority_id integer NOT NULL,
    role_id integer,
    authority_id integer
);


ALTER TABLE auth.roles_authorities OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16532)
-- Name: roles_authorities_role_authority_id_seq; Type: SEQUENCE; Schema: auth; Owner: postgres
--

CREATE SEQUENCE auth.roles_authorities_role_authority_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth.roles_authorities_role_authority_id_seq OWNER TO postgres;

--
-- TOC entry 3362 (class 0 OID 0)
-- Dependencies: 214
-- Name: roles_authorities_role_authority_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: postgres
--

ALTER SEQUENCE auth.roles_authorities_role_authority_id_seq OWNED BY auth.roles_authorities.role_authority_id;


--
-- TOC entry 212 (class 1259 OID 16523)
-- Name: roles_role_id_seq; Type: SEQUENCE; Schema: auth; Owner: postgres
--

CREATE SEQUENCE auth.roles_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth.roles_role_id_seq OWNER TO postgres;

--
-- TOC entry 3363 (class 0 OID 0)
-- Dependencies: 212
-- Name: roles_role_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: postgres
--

ALTER SEQUENCE auth.roles_role_id_seq OWNED BY auth.roles.role_id;


--
-- TOC entry 217 (class 1259 OID 16550)
-- Name: users; Type: TABLE; Schema: auth; Owner: postgres
--

CREATE TABLE auth.users (
    user_id integer NOT NULL,
    password character varying,
    name character varying,
    username character varying,
    looked boolean,
    expired boolean,
    enabled boolean
);


ALTER TABLE auth.users OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16559)
-- Name: users_roles; Type: TABLE; Schema: auth; Owner: postgres
--

CREATE TABLE auth.users_roles (
    user_role_id integer NOT NULL,
    user_id integer,
    role_id integer
);


ALTER TABLE auth.users_roles OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16558)
-- Name: users_roles_user_role_id_seq; Type: SEQUENCE; Schema: auth; Owner: postgres
--

CREATE SEQUENCE auth.users_roles_user_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth.users_roles_user_role_id_seq OWNER TO postgres;

--
-- TOC entry 3364 (class 0 OID 0)
-- Dependencies: 218
-- Name: users_roles_user_role_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: postgres
--

ALTER SEQUENCE auth.users_roles_user_role_id_seq OWNED BY auth.users_roles.user_role_id;


--
-- TOC entry 216 (class 1259 OID 16549)
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: auth; Owner: postgres
--

CREATE SEQUENCE auth.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth.users_user_id_seq OWNER TO postgres;

--
-- TOC entry 3365 (class 0 OID 0)
-- Dependencies: 216
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: postgres
--

ALTER SEQUENCE auth.users_user_id_seq OWNED BY auth.users.user_id;


--
-- TOC entry 3188 (class 2604 OID 16518)
-- Name: authorities authority_id; Type: DEFAULT; Schema: auth; Owner: postgres
--

ALTER TABLE ONLY auth.authorities ALTER COLUMN authority_id SET DEFAULT nextval('auth.authorities_authority_id_seq'::regclass);


--
-- TOC entry 3189 (class 2604 OID 16527)
-- Name: roles role_id; Type: DEFAULT; Schema: auth; Owner: postgres
--

ALTER TABLE ONLY auth.roles ALTER COLUMN role_id SET DEFAULT nextval('auth.roles_role_id_seq'::regclass);


--
-- TOC entry 3190 (class 2604 OID 16536)
-- Name: roles_authorities role_authority_id; Type: DEFAULT; Schema: auth; Owner: postgres
--

ALTER TABLE ONLY auth.roles_authorities ALTER COLUMN role_authority_id SET DEFAULT nextval('auth.roles_authorities_role_authority_id_seq'::regclass);


--
-- TOC entry 3191 (class 2604 OID 16553)
-- Name: users user_id; Type: DEFAULT; Schema: auth; Owner: postgres
--

ALTER TABLE ONLY auth.users ALTER COLUMN user_id SET DEFAULT nextval('auth.users_user_id_seq'::regclass);


--
-- TOC entry 3192 (class 2604 OID 16562)
-- Name: users_roles user_role_id; Type: DEFAULT; Schema: auth; Owner: postgres
--

ALTER TABLE ONLY auth.users_roles ALTER COLUMN user_role_id SET DEFAULT nextval('auth.users_roles_user_role_id_seq'::regclass);


--
-- TOC entry 3366 (class 0 OID 0)
-- Dependencies: 210
-- Name: authorities_authority_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: postgres
--

SELECT pg_catalog.setval('auth.authorities_authority_id_seq', 1, false);


--
-- TOC entry 3367 (class 0 OID 0)
-- Dependencies: 214
-- Name: roles_authorities_role_authority_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: postgres
--

SELECT pg_catalog.setval('auth.roles_authorities_role_authority_id_seq', 1, false);


--
-- TOC entry 3368 (class 0 OID 0)
-- Dependencies: 212
-- Name: roles_role_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: postgres
--

SELECT pg_catalog.setval('auth.roles_role_id_seq', 1, false);


--
-- TOC entry 3369 (class 0 OID 0)
-- Dependencies: 218
-- Name: users_roles_user_role_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: postgres
--

SELECT pg_catalog.setval('auth.users_roles_user_role_id_seq', 1, false);


--
-- TOC entry 3370 (class 0 OID 0)
-- Dependencies: 216
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: postgres
--

SELECT pg_catalog.setval('auth.users_user_id_seq', 1, false);


--
-- TOC entry 3194 (class 2606 OID 16522)
-- Name: authorities authorities_pkey; Type: CONSTRAINT; Schema: auth; Owner: postgres
--

ALTER TABLE ONLY auth.authorities
    ADD CONSTRAINT authorities_pkey PRIMARY KEY (authority_id);


--
-- TOC entry 3198 (class 2606 OID 16538)
-- Name: roles_authorities roles_authorities_pkey; Type: CONSTRAINT; Schema: auth; Owner: postgres
--

ALTER TABLE ONLY auth.roles_authorities
    ADD CONSTRAINT roles_authorities_pkey PRIMARY KEY (role_authority_id);


--
-- TOC entry 3196 (class 2606 OID 16531)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: auth; Owner: postgres
--

ALTER TABLE ONLY auth.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (role_id);


--
-- TOC entry 3200 (class 2606 OID 16557)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: auth; Owner: postgres
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- TOC entry 3202 (class 2606 OID 16564)
-- Name: users_roles users_roles_pkey; Type: CONSTRAINT; Schema: auth; Owner: postgres
--

ALTER TABLE ONLY auth.users_roles
    ADD CONSTRAINT users_roles_pkey PRIMARY KEY (user_role_id);


--
-- TOC entry 3203 (class 2606 OID 16539)
-- Name: roles_authorities fk_auth; Type: FK CONSTRAINT; Schema: auth; Owner: postgres
--

ALTER TABLE ONLY auth.roles_authorities
    ADD CONSTRAINT fk_auth FOREIGN KEY (authority_id) REFERENCES auth.authorities(authority_id);


--
-- TOC entry 3204 (class 2606 OID 16544)
-- Name: roles_authorities fk_role; Type: FK CONSTRAINT; Schema: auth; Owner: postgres
--

ALTER TABLE ONLY auth.roles_authorities
    ADD CONSTRAINT fk_role FOREIGN KEY (role_id) REFERENCES auth.roles(role_id);


--
-- TOC entry 3206 (class 2606 OID 16570)
-- Name: users_roles fk_role; Type: FK CONSTRAINT; Schema: auth; Owner: postgres
--

ALTER TABLE ONLY auth.users_roles
    ADD CONSTRAINT fk_role FOREIGN KEY (user_role_id) REFERENCES auth.roles(role_id);


--
-- TOC entry 3205 (class 2606 OID 16565)
-- Name: users_roles fk_user; Type: FK CONSTRAINT; Schema: auth; Owner: postgres
--

ALTER TABLE ONLY auth.users_roles
    ADD CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES auth.users(user_id);



INSERT INTO auth.authorities (name) values ('USUARIO_CREAR');
INSERT INTO auth.authorities (name) values ('USUARIO_LEER');
INSERT INTO auth.authorities (name) values ('USUARIO_ACTUALIZAR');
INSERT INTO auth.authorities (name) values ('USUARIO_ELIMINAR');

INSERT INTO auth.authorities (name) values ('ROL_CREAR');
INSERT INTO auth.authorities (name) values ('ROL_LEER');
INSERT INTO auth.authorities (name) values ('ROL_ACTUALIZAR');
INSERT INTO auth.authorities (name) values ('ROL_ELIMINAR');

INSERT INTO auth.authorities (name) values ('PERMISO_CREAR');
INSERT INTO auth.authorities (name) values ('PERMISO_LEER');
INSERT INTO auth.authorities (name) values ('PERMISO_ACTUALIZAR');
INSERT INTO auth.authorities (name) values ('PERMISO_ELIMINAR');

INSERT INTO auth.roles (name) values ('ROLE_ADMIN');
INSERT INTO auth.roles (name) values ('ROLE_ASESOR');
INSERT INTO auth.roles (name) values ('ROLE_FACTURADOR');

INSERT INTO auth.roles_authorities (role_id, authority_id) VALUES ((SELECT role_id FROM auth.roles where name = 'ROLE_ADMIN'), (SELECT authority_id FROM auth.authorities WHERE name = 'USUARIO_CREAR'));
INSERT INTO auth.roles_authorities (role_id, authority_id) VALUES ((SELECT role_id FROM auth.roles where name = 'ROLE_ADMIN'), (SELECT authority_id FROM auth.authorities WHERE name = 'USUARIO_LEER'));
INSERT INTO auth.roles_authorities (role_id, authority_id) VALUES ((SELECT role_id FROM auth.roles where name = 'ROLE_ADMIN'), (SELECT authority_id FROM auth.authorities WHERE name = 'USUARIO_ACTUALIZAR'));
INSERT INTO auth.roles_authorities (role_id, authority_id) VALUES ((SELECT role_id FROM auth.roles where name = 'ROLE_ADMIN'), (SELECT authority_id FROM auth.authorities WHERE name = 'USUARIO_ELIMINAR'));

INSERT INTO auth.users (name, username, password, looked, expired, enabled) VALUES ('Admin', 'admin', '$2a$10$TwROhi2MZsOTt8igkE7Yyec0WfjK7NlgdX9apOu0b6cY4SxzHLvCq', false, false, true);

INSERT INTO auth.users_roles (user_id, role_id) VALUES ((SELECT user_id FROM auth.users where username = 'admin'), (SELECT role_id FROM auth.roles where name = 'ROLE_ADMIN'));