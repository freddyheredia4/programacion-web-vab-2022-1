-- Table: public.persons

-- DROP TABLE IF EXISTS public.persons;

CREATE SEQUENCE IF NOT EXISTS public.persons_person_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

CREATE TABLE IF NOT EXISTS public.persons
(
    person_id integer NOT NULL DEFAULT nextval('persons_person_id_seq'::regclass),
    name character varying COLLATE pg_catalog."default",
    dni character varying COLLATE pg_catalog."default",
    created timestamp without time zone,
    enabled boolean,
    updated timestamp without time zone,
    city_id integer,
    CONSTRAINT persons_pkey PRIMARY KEY (person_id),
    CONSTRAINT fk_city FOREIGN KEY (city_id)
        REFERENCES public.city (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)
