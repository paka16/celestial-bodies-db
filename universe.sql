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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20),
    size integer,
    planet_count integer,
    description text NOT NULL
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
    name character varying(20),
    has_neighbors boolean,
    description text NOT NULL,
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
CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20),
    has_moons boolean,
    description text NOT NULL,
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
-- Name: popular; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.popular (
    popular_id integer NOT NULL,
    description text NOT NULL,
    name character varying(20)
);


ALTER TABLE public.popular OWNER TO freecodecamp;

--
-- Name: popular_popular_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.popular_popular_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.popular_popular_id_seq OWNER TO freecodecamp;

--
-- Name: popular_popular_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.popular_popular_id_seq OWNED BY public.popular.popular_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20),
    age numeric,
    galaxy_id integer,
    description text NOT NULL
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
-- Name: popular popular_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.popular ALTER COLUMN popular_id SET DEFAULT nextval('public.popular_popular_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Andromeda', 110000, 1, 'A barred spiral galaxy');
INSERT INTO public.galaxy VALUES (1, 'Milky Way', 52850, 100, 'Our galaxy');
INSERT INTO public.galaxy VALUES (3, 'Pinwheel Galaxy', 85000, 1, 'Twice the diameter of the Milky Way');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool Galaxy', 30000, 0, 'First spiral galaxy to be classified');
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 25000, NULL, 'Too far away to detect planets');
INSERT INTO public.galaxy VALUES (6, 'Cartwheel Galaxy', 65000, NULL, 'Too far away to detect planets');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Namaka', true, 'Belongs to Haumea', 12);
INSERT INTO public.moon VALUES (2, 'Hiiaka', true, 'Belongs to Haumea', 12);
INSERT INTO public.moon VALUES (4, 'Charon', true, 'Belongs to Pluto', 9);
INSERT INTO public.moon VALUES (5, 'Nix', true, 'Belongs to Pluto', 9);
INSERT INTO public.moon VALUES (6, 'Hydra', true, 'Belongs to Pluto', 9);
INSERT INTO public.moon VALUES (7, 'Styx', true, 'Belongs to Pluto', 9);
INSERT INTO public.moon VALUES (3, 'Luna', false, 'Our Moon', 1);
INSERT INTO public.moon VALUES (8, 'Europa', true, 'Belongs to Jupiter', 5);
INSERT INTO public.moon VALUES (9, 'Callisto', true, 'Belongs to Jupiter', 5);
INSERT INTO public.moon VALUES (10, 'Io', true, 'Belongs to Jupiter', 5);
INSERT INTO public.moon VALUES (11, 'Thebe', true, 'Belongs to Jupiter', 5);
INSERT INTO public.moon VALUES (12, 'Adrastea', true, 'Belongs to Jupiter', 5);
INSERT INTO public.moon VALUES (13, 'Carme', true, 'Belongs to Jupiter', 5);
INSERT INTO public.moon VALUES (14, 'Carpo', true, 'Belongs to Jupiter', 5);
INSERT INTO public.moon VALUES (15, 'Titan', true, 'Belongs to Saturn', 6);
INSERT INTO public.moon VALUES (16, 'Mimas', true, 'Belongs to Saturn', 6);
INSERT INTO public.moon VALUES (17, 'Dione', true, 'Belongs to Saturn', 6);
INSERT INTO public.moon VALUES (18, 'Tethys', true, 'Belongs to Saturn', 6);
INSERT INTO public.moon VALUES (19, 'Telesto', true, 'Belongs to Saturn', 6);
INSERT INTO public.moon VALUES (20, 'Phoebe', true, 'Belongs to Saturn', 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, 'Our planet', 1);
INSERT INTO public.planet VALUES (2, 'Venus', true, 'Our neighbor', 1);
INSERT INTO public.planet VALUES (3, 'Mars', true, 'Our neighbor', 1);
INSERT INTO public.planet VALUES (4, 'Mercury', true, 'The planet closest to the Sun', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', true, 'The biggest planet in our Solar System', 1);
INSERT INTO public.planet VALUES (6, 'Saturn', true, 'The planet with most rings in our Solar System', 1);
INSERT INTO public.planet VALUES (7, 'Uranus', true, 'A funny planet', 1);
INSERT INTO public.planet VALUES (8, 'Neptune', true, 'The bluest planet', 1);
INSERT INTO public.planet VALUES (9, 'Pluto', true, 'A real planet', 1);
INSERT INTO public.planet VALUES (10, 'mESSIER 104', true, 'In the Sombrero Galaxy', 7);
INSERT INTO public.planet VALUES (11, 'PA-99-N2', true, 'In the Andromeda Galaxy', 1);
INSERT INTO public.planet VALUES (12, 'Haumea', true, 'Dwarf Planet', 1);


--
-- Data for Name: popular; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.popular VALUES (1, 'The most popular planet', 'Earth');
INSERT INTO public.popular VALUES (2, 'The most popular star', 'Sun');
INSERT INTO public.popular VALUES (3, 'The most popular galaxy', 'The Milky Way');
INSERT INTO public.popular VALUES (4, 'The most popular moon', 'Luna');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4.60, 1, 'Our sun');
INSERT INTO public.star VALUES (2, 'Antares', 11.01, 1, 'Brightest star in Scorpius');
INSERT INTO public.star VALUES (3, 'Betelgeuse', 10.01, 1, 'Red Super giant');
INSERT INTO public.star VALUES (4, 'Vega', 455.3, 1, 'Brightest star in Lyra');
INSERT INTO public.star VALUES (5, 'Sirius', 230, 1, 'Known as the dog star');
INSERT INTO public.star VALUES (6, 'Deneb', 10.01, 1, 'Head of the Northern Cross');
INSERT INTO public.star VALUES (7, 'Spica', 12.5, 1, 'In Virgo');


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
-- Name: popular_popular_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.popular_popular_id_seq', 4, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: planet planet_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key1 UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: popular popular_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.popular
    ADD CONSTRAINT popular_description_key UNIQUE (description);


--
-- Name: popular popular_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.popular
    ADD CONSTRAINT popular_pkey PRIMARY KEY (popular_id);


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

