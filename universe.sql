--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255),
    apparent_magnitude numeric NOT NULL,
    distance_kpc numeric NOT NULL,
    constellation text
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
-- Name: last_table; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.last_table (
    last_table_id integer NOT NULL,
    name character varying(255) NOT NULL,
    radius_km numeric,
    has_parent boolean DEFAULT true,
    parent text NOT NULL,
    moon_id integer
);


ALTER TABLE public.last_table OWNER TO freecodecamp;

--
-- Name: last_table_last_table_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.last_table_last_table_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.last_table_last_table_id_seq OWNER TO freecodecamp;

--
-- Name: last_table_last_table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.last_table_last_table_id_seq OWNED BY public.last_table.last_table_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    mean_radius_km numeric,
    has_parent boolean DEFAULT true,
    parent text NOT NULL,
    announced_year integer NOT NULL,
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
    name character varying(255) NOT NULL,
    mass_10pow24_kg numeric NOT NULL,
    diameter integer,
    global_magnetic_field boolean DEFAULT false,
    rotation_period_hours text,
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
    name character varying(255),
    current_apparent_magnitude numeric NOT NULL,
    mass_dev_mass_earth numeric NOT NULL,
    stellar_classification text,
    has_name_instead_code boolean DEFAULT false,
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
-- Name: last_table last_table_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.last_table ALTER COLUMN last_table_id SET DEFAULT nextval('public.last_table_last_table_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', -6.5, 0, 'Sagittarius');
INSERT INTO public.galaxy VALUES (2, 'Large Magellanic Cloud', 2.7, 49, 'Dorado_Mensa');
INSERT INTO public.galaxy VALUES (3, 'Small Magellanic Cloud', 2.7, 61, 'Tucana');
INSERT INTO public.galaxy VALUES (4, 'Andromeda Galaxy', 3.4, 770, 'Andromeda');
INSERT INTO public.galaxy VALUES (5, 'Triangulum Galaxy', 5.7, 890, 'Triangulum');
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 6.84, 4.2, 'Centaurus');
INSERT INTO public.galaxy VALUES (7, 'Bodes Galaxy', 6.94, 3.7, 'Ursa_Major');
INSERT INTO public.galaxy VALUES (8, 'Sculptor Galaxy', 8, 3.7, 'Sculptor');


--
-- Data for Name: last_table; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.last_table VALUES (1, 'Row 1', 11111, false, 'None', 1);
INSERT INTO public.last_table VALUES (2, 'Row 2', 22222, false, 'None', 2);
INSERT INTO public.last_table VALUES (3, 'Row 3', 33333, false, 'None', 3);
INSERT INTO public.last_table VALUES (4, 'Row 4', 44444, false, 'None', 4);
INSERT INTO public.last_table VALUES (5, 'Row 5', 55555, false, 'None', 5);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1738, true, 'Earth', 1, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 11.267, true, 'Mars', 1877, 5);
INSERT INTO public.moon VALUES (3, 'Deimos', 6.2, true, 'Mars', 1877, 5);
INSERT INTO public.moon VALUES (4, 'Io', 1821.6, true, 'Jupiter', 1610, 6);
INSERT INTO public.moon VALUES (5, 'Europa', 1560.8, true, 'Jupiter', 1610, 6);
INSERT INTO public.moon VALUES (6, 'Mimas', 198.2, true, 'Saturn', 1789, 7);
INSERT INTO public.moon VALUES (7, 'Enceladus', 252.1, true, 'Saturn', 1789, 7);
INSERT INTO public.moon VALUES (8, 'Tethys', 533.1, true, 'Saturn', 1686, 7);
INSERT INTO public.moon VALUES (9, 'Dione', 561.4, true, 'Saturn', 1686, 7);
INSERT INTO public.moon VALUES (10, 'Ariel', 578.9, true, 'Uranus', 1851, 8);
INSERT INTO public.moon VALUES (11, 'Umbriel', 584.7, true, 'Uranus', 1851, 8);
INSERT INTO public.moon VALUES (12, 'Titania', 788.9, true, 'Uranus', 1787, 9);
INSERT INTO public.moon VALUES (13, 'Triton', 1353.4, true, 'Neptune', 1846, 9);
INSERT INTO public.moon VALUES (14, 'Nereid', 178.5, true, 'Neptune', 1949, 9);
INSERT INTO public.moon VALUES (15, 'Naiad', 30.2, true, 'Neptune', 1989, 9);
INSERT INTO public.moon VALUES (16, 'Vanth', 221, true, 'Orcus', 2007, 11);
INSERT INTO public.moon VALUES (17, 'Nix', 22.5, true, 'Pluto', 2005, 10);
INSERT INTO public.moon VALUES (18, 'Charon', 606, true, 'Pluto', 1978, 12);
INSERT INTO public.moon VALUES (19, 'Namaka', 85, true, 'Haumea', 2005, 12);
INSERT INTO public.moon VALUES (20, 'Weywot', 40.5, true, 'Quaoar', 2007, 1);
INSERT INTO public.moon VALUES (21, 'Dusnomia', 350, true, 'Eris', 2005, 2);
INSERT INTO public.moon VALUES (22, 'Xiangliu', 90, true, 'Gonggong', 2016, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0.33, 4879, true, '1407.6', 1);
INSERT INTO public.planet VALUES (2, 'Venus', 4.87, 12104, false, '-5832.5', 2);
INSERT INTO public.planet VALUES (3, 'Earth', 5.97, 12756, true, '23.9', 3);
INSERT INTO public.planet VALUES (4, 'Moon', 0.073, 3475, false, '655.7', 4);
INSERT INTO public.planet VALUES (5, 'Mars', 0.642, 6792, false, '24.6', 5);
INSERT INTO public.planet VALUES (6, 'Jupiter', 1898, 142984, true, '9.9', 6);
INSERT INTO public.planet VALUES (7, 'Saturn', 568, 120536, true, '10.7', 7);
INSERT INTO public.planet VALUES (8, 'Uranus', 86.8, 51118, true, '-17.2', 8);
INSERT INTO public.planet VALUES (9, 'Neptune', 102, 49528, true, '16.1', 1);
INSERT INTO public.planet VALUES (10, 'Pluto', 0.013, 2376, false, '-153.3', 2);
INSERT INTO public.planet VALUES (11, 'Some New', 1, 5555, false, '5555.5', 3);
INSERT INTO public.planet VALUES (12, 'Else One', 1, 6666, true, '6666.6', 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, '2MASS J1921-1244', 12.46, 0.69, 'K6V', false, 1);
INSERT INTO public.star VALUES (2, 'Lalande 21185', 7.52, 0.39, 'M2V', true, 7);
INSERT INTO public.star VALUES (3, 'HD 146248', 9.47, 1.23, 'G2_3IV', false, 5);
INSERT INTO public.star VALUES (4, 'Alpha Centauri AB', 1.33, 0.907, 'K1V', true, 6);
INSERT INTO public.star VALUES (5, 'TYC 9387-2515-1', 11.45, 0.86, 'K1V', false, 2);
INSERT INTO public.star VALUES (6, '2MASS J1941-4602', 12.4, 0.15, 'M4_M6', false, 3);
INSERT INTO public.star VALUES (7, 'Ross 248', 12.29, 0.136, 'M6V', true, 4);
INSERT INTO public.star VALUES (8, 'Gliese 710', 9.6, 0.5, 'K7V', true, 8);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: last_table_last_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.last_table_last_table_id_seq', 5, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


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
-- Name: last_table last_table_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.last_table
    ADD CONSTRAINT last_table_name_key UNIQUE (name);


--
-- Name: last_table last_table_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.last_table
    ADD CONSTRAINT last_table_pkey PRIMARY KEY (last_table_id);


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
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: last_table fk_moon; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.last_table
    ADD CONSTRAINT fk_moon FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

