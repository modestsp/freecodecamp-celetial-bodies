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
    name character varying(50),
    age integer NOT NULL,
    mass integer NOT NULL,
    has_life boolean
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    age integer NOT NULL,
    mass integer NOT NULL,
    radius numeric(2,1),
    has_life boolean,
    description text,
    name character varying(50)
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    age integer NOT NULL,
    mass integer NOT NULL,
    radius numeric(2,1),
    has_life boolean,
    description text,
    name character varying(50),
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    age integer NOT NULL,
    mass integer NOT NULL,
    radius numeric(2,1),
    has_life boolean,
    description text,
    name character varying(50),
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
    age integer NOT NULL,
    mass integer NOT NULL,
    radius numeric(2,1),
    has_life boolean,
    description text,
    name character varying(50),
    galaxy_id integer
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


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

INSERT INTO public.asteroid VALUES (1, 'Asteroid 1', 12, 32, false);
INSERT INTO public.asteroid VALUES (2, 'Asteroid 2', 12, 32, false);
INSERT INTO public.asteroid VALUES (3, 'Asteroid 3', 12, 32, false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 123, 123, 2.1, false, 'The galaxy where the earth belongs', 'Milky Way');
INSERT INTO public.galaxy VALUES (2, 12, 32, 1.4, true, 'Galaxy 2', 'Galaxy 2');
INSERT INTO public.galaxy VALUES (3, 12, 32, 1.4, true, 'Galaxy 3', 'Galaxy 3');
INSERT INTO public.galaxy VALUES (4, 12, 32, 1.4, true, 'Galaxy 4', 'Galaxy 4');
INSERT INTO public.galaxy VALUES (5, 12, 32, 1.4, true, 'Galaxy 5', 'Galaxy 5');
INSERT INTO public.galaxy VALUES (6, 12, 32, 1.4, true, 'Galaxy 6', 'Galaxy 6');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 12, 1.1, false, 'Moon 1', 'Moon1', 1);
INSERT INTO public.moon VALUES (2, 1, 12, 1.1, false, 'Moon 2', 'Moon2', 1);
INSERT INTO public.moon VALUES (3, 1, 12, 1.1, false, 'Moon 3', 'Moon3', 1);
INSERT INTO public.moon VALUES (4, 1, 12, 1.1, false, 'Moon 4', 'Moon4', 1);
INSERT INTO public.moon VALUES (5, 1, 12, 1.1, false, 'Moon 5', 'Moon5', 1);
INSERT INTO public.moon VALUES (6, 1, 12, 1.1, false, 'Moon 6', 'Moon6', 1);
INSERT INTO public.moon VALUES (7, 1, 12, 1.1, false, 'Moon 7', 'Moon7', 1);
INSERT INTO public.moon VALUES (8, 1, 12, 1.1, false, 'Moon 8', 'Moon8', 1);
INSERT INTO public.moon VALUES (9, 1, 12, 1.1, false, 'Moon 9', 'Moon9', 1);
INSERT INTO public.moon VALUES (10, 1, 12, 1.1, false, 'Moon 10', 'Moon10', 1);
INSERT INTO public.moon VALUES (11, 1, 12, 1.1, false, 'Moon 11', 'Moon11', 1);
INSERT INTO public.moon VALUES (12, 1, 12, 1.1, false, 'Moon 12', 'Moon12', 1);
INSERT INTO public.moon VALUES (13, 1, 12, 1.1, false, 'Moon 13', 'Moon13', 1);
INSERT INTO public.moon VALUES (14, 1, 12, 1.1, false, 'Moon 14', 'Moon14', 1);
INSERT INTO public.moon VALUES (15, 1, 12, 1.1, false, 'Moon 15', 'Moon15', 1);
INSERT INTO public.moon VALUES (16, 1, 12, 1.1, false, 'Moon 16', 'Moon16', 1);
INSERT INTO public.moon VALUES (17, 1, 12, 1.1, false, 'Moon 17', 'Moon17', 1);
INSERT INTO public.moon VALUES (18, 1, 12, 1.1, false, 'Moon 18', 'Moon18', 1);
INSERT INTO public.moon VALUES (19, 1, 12, 1.1, false, 'Moon 19', 'Moon19', 1);
INSERT INTO public.moon VALUES (20, 1, 12, 1.1, false, 'Moon 20', 'Moon20', 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 12, 1.1, false, 'Planet 1', 'Planet1', 1);
INSERT INTO public.planet VALUES (2, 1, 12, 1.1, false, 'Planet 2', 'Planet2', 1);
INSERT INTO public.planet VALUES (3, 1, 12, 1.1, false, 'Planet 3', 'Planet3', 1);
INSERT INTO public.planet VALUES (4, 1, 12, 1.1, false, 'Planet 4', 'Planet4', 1);
INSERT INTO public.planet VALUES (5, 1, 12, 1.1, false, 'Planet 5', 'Planet5', 1);
INSERT INTO public.planet VALUES (6, 1, 12, 1.1, false, 'Planet 6', 'Planet6', 1);
INSERT INTO public.planet VALUES (7, 1, 12, 1.1, false, 'Planet 7', 'Planet7', 1);
INSERT INTO public.planet VALUES (8, 1, 12, 1.1, false, 'Planet 8', 'Planet8', 1);
INSERT INTO public.planet VALUES (9, 1, 12, 1.1, false, 'Planet 9', 'Planet9', 1);
INSERT INTO public.planet VALUES (10, 1, 12, 1.1, false, 'Planet 10', 'Planet10', 1);
INSERT INTO public.planet VALUES (11, 1, 12, 1.1, false, 'Planet 11', 'Planet11', 1);
INSERT INTO public.planet VALUES (12, 1, 12, 1.1, false, 'Planet 12', 'Planet12', 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 12, 1.1, false, 'Star 1', 'Star1', 1);
INSERT INTO public.star VALUES (2, 1, 12, 1.1, false, 'Star 2', 'Star2', 1);
INSERT INTO public.star VALUES (3, 1, 12, 1.1, false, 'Star 3', 'Star3', 1);
INSERT INTO public.star VALUES (4, 1, 12, 1.1, false, 'Star 4', 'Star4', 1);
INSERT INTO public.star VALUES (5, 1, 12, 1.1, false, 'Star 5', 'Star5', 1);
INSERT INTO public.star VALUES (6, 1, 12, 1.1, false, 'Star 6', 'Star6', 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


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