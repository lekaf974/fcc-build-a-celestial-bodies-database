--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    distance_from_earth integer,
    age_in_millions_of_years integer,
    size_in_thousand_km numeric(11,1),
    description text,
    name character varying(30) NOT NULL,
    is_spherical boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(30),
    moon_id integer DEFAULT nextval('public.moon_moon_id_seq'::regclass) NOT NULL,
    planet_id integer NOT NULL,
    description text,
    type character varying(30)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    distance_from_earth integer,
    age_in_millions_of_years integer,
    size_in_thousand_km numeric(11,1),
    description text,
    name character varying(30) NOT NULL,
    is_spherical boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    distance_from_earth integer,
    age_in_millions_of_years integer,
    size_in_thousand_km numeric(11,1),
    description text,
    name character varying(30) NOT NULL,
    is_spherical boolean,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', NULL);
INSERT INTO public.asteroid VALUES (2, 'Vesta', NULL);
INSERT INTO public.asteroid VALUES (3, 'Pallas', NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/Andromeda_Galaxy', 'Andromeda', NULL);
INSERT INTO public.galaxy VALUES (2, NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/Butterfly_Galaxies', 'Butterfly', NULL);
INSERT INTO public.galaxy VALUES (3, NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/NGC_4622', 'Backward', NULL);
INSERT INTO public.galaxy VALUES (6, NULL, NULL, NULL, NULL, 'Milky Way', NULL);
INSERT INTO public.galaxy VALUES (7, NULL, NULL, NULL, NULL, 'Black Eye', NULL);
INSERT INTO public.galaxy VALUES (8, NULL, NULL, NULL, NULL, 'Condor', NULL);
INSERT INTO public.galaxy VALUES (9, NULL, NULL, NULL, NULL, 'Eye of Sauron', NULL);
INSERT INTO public.galaxy VALUES (10, NULL, NULL, NULL, NULL, 'Sunflower', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Moon', 1, 2, NULL, NULL);
INSERT INTO public.moon VALUES ('Phobos', 2, 3, NULL, NULL);
INSERT INTO public.moon VALUES ('Deimos', 3, 3, NULL, NULL);
INSERT INTO public.moon VALUES ('Naiad', 4, 12, NULL, NULL);
INSERT INTO public.moon VALUES ('Triton', 5, 12, NULL, NULL);
INSERT INTO public.moon VALUES ('Nereid', 6, 12, NULL, NULL);
INSERT INTO public.moon VALUES ('Thalassa', 7, 12, NULL, NULL);
INSERT INTO public.moon VALUES ('Sao', 8, 12, NULL, NULL);
INSERT INTO public.moon VALUES ('Neso', 9, 12, NULL, NULL);
INSERT INTO public.moon VALUES ('Proteus', 10, 12, NULL, NULL);
INSERT INTO public.moon VALUES ('Charon', 11, 10, NULL, NULL);
INSERT INTO public.moon VALUES ('Styx', 12, 10, NULL, NULL);
INSERT INTO public.moon VALUES ('Nix', 13, 10, NULL, NULL);
INSERT INTO public.moon VALUES ('Io', 16, 4, NULL, NULL);
INSERT INTO public.moon VALUES ('Europa', 17, 4, NULL, NULL);
INSERT INTO public.moon VALUES ('callisto', 18, 4, NULL, NULL);
INSERT INTO public.moon VALUES ('Rhea', 19, 6, NULL, NULL);
INSERT INTO public.moon VALUES ('Titan', 20, 6, NULL, NULL);
INSERT INTO public.moon VALUES ('Kerberos', 14, 10, NULL, NULL);
INSERT INTO public.moon VALUES ('Hydra', 15, 10, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, NULL, NULL, NULL, NULL, 'Earth', NULL, 2);
INSERT INTO public.planet VALUES (3, NULL, NULL, NULL, NULL, 'Mars', NULL, 2);
INSERT INTO public.planet VALUES (4, NULL, NULL, NULL, NULL, 'Jupiter', NULL, 2);
INSERT INTO public.planet VALUES (5, NULL, NULL, NULL, NULL, 'Venus', NULL, 2);
INSERT INTO public.planet VALUES (6, NULL, NULL, NULL, NULL, 'Mercury', NULL, 2);
INSERT INTO public.planet VALUES (7, NULL, NULL, NULL, NULL, 'Saturn', NULL, 2);
INSERT INTO public.planet VALUES (8, NULL, NULL, NULL, NULL, 'Uranus', NULL, 2);
INSERT INTO public.planet VALUES (9, NULL, NULL, NULL, NULL, 'Ceres', NULL, 2);
INSERT INTO public.planet VALUES (10, NULL, NULL, NULL, NULL, 'Pluto', NULL, 2);
INSERT INTO public.planet VALUES (11, NULL, NULL, NULL, NULL, 'Orcus', NULL, 2);
INSERT INTO public.planet VALUES (12, NULL, NULL, NULL, NULL, 'Neptune', NULL, 2);
INSERT INTO public.planet VALUES (13, NULL, NULL, NULL, NULL, 'Makemake', NULL, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, NULL, NULL, NULL, NULL, 'Sun', NULL, 6);
INSERT INTO public.star VALUES (3, NULL, NULL, NULL, NULL, 'Ross 128', NULL, 6);
INSERT INTO public.star VALUES (4, NULL, NULL, NULL, NULL, 'Toliman', NULL, 6);
INSERT INTO public.star VALUES (5, NULL, NULL, NULL, NULL, 'Rigil Kentaurus', NULL, 6);
INSERT INTO public.star VALUES (6, NULL, NULL, NULL, NULL, 'Sirius', NULL, 6);
INSERT INTO public.star VALUES (7, NULL, NULL, NULL, NULL, 'YZ Ceti', NULL, 6);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 10, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_unique UNIQUE (name);


--
-- Name: moon moon_pk; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pk PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

