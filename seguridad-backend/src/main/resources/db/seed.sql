-- Table: public.persons

-- DROP TABLE IF EXISTS public.persons;

CREATE TABLE IF NOT EXISTS public.persons
(
    person_id integer NOT NULL DEFAULT nextval('persons_person_id_seq'::regclass),
    name character varying COLLATE pg_catalog."default",
    dni character varying COLLATE pg_catalog."default",
    created timestamp without time zone,
    enabled boolean,
    updated timestamp without time zone,
    CONSTRAINT persons_pkey PRIMARY KEY (person_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.persons
    OWNER to postgres;