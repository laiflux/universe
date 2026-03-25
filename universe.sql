--
-- PostgreSQL database dump
--
-- just for testing
-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: dwarf_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.dwarf_planet (
    name character varying(30) NOT NULL,
    number_of_moons integer,
    star_id integer,
    galaxy_id integer,
    dwarf_planet_id integer NOT NULL
);


ALTER TABLE public.dwarf_planet OWNER TO freecodecamp;

--
-- Name: dwarf_planet_dwarf_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.dwarf_planet_dwarf_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dwarf_planet_dwarf_planet_id_seq OWNER TO freecodecamp;

--
-- Name: dwarf_planet_dwarf_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.dwarf_planet_dwarf_planet_id_seq OWNED BY public.dwarf_planet.dwarf_planet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type text,
    diameter integer,
    distance_from_earth integer,
    age_in_million_years numeric(10,1)
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
    name character varying(30) NOT NULL,
    planet_id integer,
    star_id integer NOT NULL,
    galaxy_id integer
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
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    number_of_moons integer,
    planet_type text,
    has_moon boolean,
    age_in_million_years numeric(10,1)
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
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    type text,
    distance_from_earth integer,
    age_in_million_years numeric(10,1),
    is_binary boolean,
    has_confirmed_planets boolean
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
-- Name: dwarf_planet dwarf_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet ALTER COLUMN dwarf_planet_id SET DEFAULT nextval('public.dwarf_planet_dwarf_planet_id_seq'::regclass);


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
-- Data for Name: dwarf_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.dwarf_planet VALUES ('Eris', 1, 1, 1, 1);
INSERT INTO public.dwarf_planet VALUES ('Pluto', 5, 1, 1, 2);
INSERT INTO public.dwarf_planet VALUES ('Haumea', 2, 1, 1, 3);
INSERT INTO public.dwarf_planet VALUES ('Makemake', 0, 1, 1, 4);
INSERT INTO public.dwarf_planet VALUES ('Ceres', 0, 1, 1, 5);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 105000, 0, 13500.0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 220000, 2537000, 10000.0);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 60000, 2730000, 10000.0);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic', 'Irregular', 14000, 163000, 13500.0);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic', 'Irregular', 7000, 200000, 13500.0);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'Spiral', 76000, 23000000, 400.0);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3, 1, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 1, 1);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 1, 1);
INSERT INTO public.moon VALUES (4, 'Ganymede', 5, 1, 1);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 1, 1);
INSERT INTO public.moon VALUES (7, 'Io', 5, 1, 1);
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, 1, 1);
INSERT INTO public.moon VALUES (9, 'Titan', 6, 1, 1);
INSERT INTO public.moon VALUES (10, 'Rhea', 6, 1, 1);
INSERT INTO public.moon VALUES (11, 'Enceladus', 6, 1, 1);
INSERT INTO public.moon VALUES (12, 'Dione', 6, 1, 1);
INSERT INTO public.moon VALUES (13, 'Tethys', 6, 1, 1);
INSERT INTO public.moon VALUES (14, 'Mimas', 6, 1, 1);
INSERT INTO public.moon VALUES (15, 'Phoebe', 6, 1, 1);
INSERT INTO public.moon VALUES (16, 'Hyperion', 6, 1, 1);
INSERT INTO public.moon VALUES (17, 'Titania', 7, 1, 1);
INSERT INTO public.moon VALUES (18, 'Oberon', 7, 1, 1);
INSERT INTO public.moon VALUES (19, 'Ariel', 7, 1, 1);
INSERT INTO public.moon VALUES (20, 'Miranda', 7, 1, 1);
INSERT INTO public.moon VALUES (21, 'Umbriel', 7, 1, 1);
INSERT INTO public.moon VALUES (22, 'Triton', 8, 1, 1);
INSERT INTO public.moon VALUES (23, 'Nereid', 8, 1, 1);
INSERT INTO public.moon VALUES (24, 'Proteus', 8, 1, 1);
INSERT INTO public.moon VALUES (6, 'Callisto', 5, 1, 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 0, 'terrestrial', false, 4500.0);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 0, 'terrestrial', false, 4500.0);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 1, 'terrestrial', true, 4540.0);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 2, 'terrestrial', true, 4500.0);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 95, 'gas giant', true, 4600.0);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 274, 'gas giant', true, 4600.0);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 28, 'ice giant', true, 4500.0);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 16, 'ice giant', true, 4500.0);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 4, 0, 'terrestrial', false, 4850.0);
INSERT INTO public.planet VALUES (10, 'Kepler-22b', 2, 0, 'super-earth', false, 4000.0);
INSERT INTO public.planet VALUES (12, 'Kepler-442b', 6, 0, 'super-earth', false, 2900.0);
INSERT INTO public.planet VALUES (13, 'HD 40307g', 3, 0, 'super-earth', false, 4500.0);
INSERT INTO public.planet VALUES (14, 'Gliese 667Cc', 8, 0, 'terrestrial', false, 2000.0);
INSERT INTO public.planet VALUES (15, 'Kepler 452b', 5, 0, 'super-earth', false, 6000.0);
INSERT INTO public.planet VALUES (11, 'Tau Ceti e', 1, 0, 'super-earth', false, 5800.0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'Yellow Dwarf', 0, 4600.0, false, true);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 1, 'Red Dwarf', 4, 4850.0, true, true);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'White Main Seq', 9, 237.0, true, false);
INSERT INTO public.star VALUES (5, 'Alpha Centuri', 1, 'Yellow Dwarf', 4, 5300.0, true, false);
INSERT INTO public.star VALUES (9, 'Alpheratz', 2, 'Blue Subgiant', 97, 60.0, true, false);
INSERT INTO public.star VALUES (7, 'Rigel', 1, 'Blue Superggiant', 860, 8.0, true, false);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 'Red Supergiant', 700, 8.0, false, false);
INSERT INTO public.star VALUES (6, 'Vega', 1, 'White Main Seq', 25, 455.0, false, false);
INSERT INTO public.star VALUES (8, 'Canopus', 1, 'Yellow-White', 310, 71.0, false, false);
INSERT INTO public.star VALUES (10, 'Mirach', 2, 'Red Dwarf', 199, 2000.0, false, false);


--
-- Name: dwarf_planet_dwarf_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.dwarf_planet_dwarf_planet_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: dwarf_planet dwarf_planet_dwarf_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet
    ADD CONSTRAINT dwarf_planet_dwarf_planet_id_key UNIQUE (dwarf_planet_id);


--
-- Name: dwarf_planet dwarf_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet
    ADD CONSTRAINT dwarf_planet_pkey PRIMARY KEY (dwarf_planet_id);


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
-- Name: dwarf_planet dwarf_planet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet
    ADD CONSTRAINT dwarf_planet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: dwarf_planet dwarf_planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet
    ADD CONSTRAINT dwarf_planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

