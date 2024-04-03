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
    name character varying(30) NOT NULL,
    age_in_millions_of_years numeric(6,1),
    description text,
    galaxy_type character varying(30),
    diameter integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_body_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_body_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_body_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_body_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_body_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years numeric(6,1),
    description text,
    diameter integer,
    has_atmosphere boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_body_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_body_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_body_id_seq OWNER TO freecodecamp;

--
-- Name: moon_body_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_body_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years numeric(6,1),
    description text,
    distance_from_earth integer,
    has_life boolean,
    diameter integer,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_body_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_body_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_body_id_seq OWNER TO freecodecamp;

--
-- Name: planet_body_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_body_id_seq OWNED BY public.planet.planet_id;


--
-- Name: ship; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.ship (
    ship_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    galaxy_id integer,
    within_range boolean
);


ALTER TABLE public.ship OWNER TO freecodecamp;

--
-- Name: ship_ship_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.ship_ship_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ship_ship_id_seq OWNER TO freecodecamp;

--
-- Name: ship_ship_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.ship_ship_id_seq OWNED BY public.ship.ship_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years numeric(6,1),
    description text,
    diameter integer,
    star_type character varying(30),
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_body_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_body_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_body_id_seq OWNER TO freecodecamp;

--
-- Name: star_body_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_body_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_body_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_body_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_body_id_seq'::regclass);


--
-- Name: ship ship_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.ship ALTER COLUMN ship_id SET DEFAULT nextval('public.ship_ship_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_body_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 3000.1, 'A barred spiral galaxy and is the nearestmajor galaxy to the Milky Way.', 'Spiral Galaxy', 152000);
INSERT INTO public.galaxy VALUES (3, 'Gorthatronilic', 86752.4, 'Largest galaxy known to mankind, distinct large green ribbons of gas clouds spirialling around its center.', 'Elliptical', 8997247);
INSERT INTO public.galaxy VALUES (4, 'Vexparic', 4852.4, 'Electrical, this galaxy has gas clouds sounding its parameter that are very high in ionization making it extremely dangerous to venture into. Some physiists even speculate this ionic cloud was manufactured.', 'Elliptical', 4235447);
INSERT INTO public.galaxy VALUES (5, 'Happru', 558.4, 'Young, hot, and fast, this galaxy is getting somewhere quick.', 'Irregular', 734627);
INSERT INTO public.galaxy VALUES (6, 'Milky Way', 13615.4, 'The Milky Way is a barred spiral galaxy with large pivoting arms stretching out across the cosmos.', 'Barred Spiral', 105700);
INSERT INTO public.galaxy VALUES (2, 'Riquiphi', 99852.4, 'Dense and cold, a giant slowly drifting through the cosmos.', 'Quasar', 5235447);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Goopi', 435.5, 'Green and glowing, to the outside observer it would appear to be an acid planet.', 3468, false, 1);
INSERT INTO public.moon VALUES (2, 'Europa', 2268.2, 'Europa is an ice moon, possessing a subsurface water ocean and cryo geysers. It has the smoothest surface of any body in the solar system and has a thin oxygen atmosphere.', 1569, true, 2);
INSERT INTO public.moon VALUES (3, 'Malthea', 4568.7, 'Small, very red, irregular-shaped moon. Dust ejected from its surface formed the Amalthea Gossamer Ring.', 35856, false, 3);
INSERT INTO public.moon VALUES (4, 'Metis', 945.3, 'Innermost moon of the planet, and is also the fastest-moving. Dust ejected from its surface help form the main planetary ring.', 2314, false, 4);
INSERT INTO public.moon VALUES (5, 'Ganymede', 1257.8, 'Only moon in the solar system to possess a magnetic field, has a tenuous oxygen atmosphere, and is believed to have six times the water on Earth in the form of several subsurface saltwater oceans sandwiched between layers of ice.', 62647, true, 5);
INSERT INTO public.moon VALUES (6, 'Moon', 4533.6, 'The brightest and largest object in our night sky, the Moon makes Earth a more livable planet by moderating our home planets wobble on its axis, leading to a relatively stable climate. It also causes tides, creating a rhythm that has guided humans for thousands of years.', 2160, false, 6);
INSERT INTO public.moon VALUES (7, 'Himalia', 125.6, 'Believed to be one chunk of a C-class or D-class asteroid that broke apart in a collision during capture by planets gravity.', 5314, false, 7);
INSERT INTO public.moon VALUES (8, 'Deimos', 246.8, 'Smaller of the planets two moons. Unlike the Moon which orbits the Earth, Deimos has a very strange shape.', 1293, false, 8);
INSERT INTO public.moon VALUES (9, 'Hegemone', 12312.8, 'Extremely old moon, formed before its planet did, must have been caught in the planets orbit perfectly with no collision.', 86548, true, 9);
INSERT INTO public.moon VALUES (10, 'Carpo', 9472.2, 'Meaty red and brown planet, recently cooling down from its maga surface phase.', 3472, false, 10);
INSERT INTO public.moon VALUES (11, 'Kallichore', 2536.6, 'A very unique moon in that although it has long nights blocked by its planet from the nearby star, its geothermal energy supports liquid water and an atmosphere.', 5693, true, 11);
INSERT INTO public.moon VALUES (12, 'Ananke', 472.8, 'Rather boring moon, gray, desolate, and unexciting.', 4457, false, 12);
INSERT INTO public.moon VALUES (13, 'Thelxinoe', 1156.4, 'Quickest moving moon that’s been observed, particularly surprising given ita rather wide orbit.', 7358, false, 13);
INSERT INTO public.moon VALUES (14, 'Amalthea', 2947.5, 'Temperately warm planet with a atmosphere of thick gasses. ', 3473, true, 14);
INSERT INTO public.moon VALUES (15, 'Hermippe', 7494.7, 'Oblong moon spinning end over end, the g-force at either tip would be immense.', 6282, false, 15);
INSERT INTO public.moon VALUES (16, 'Pasiphae', 3464.4, 'Sister planet of Orthosie, split in two by a large asteroid, the local planet now has 2 planets rather than one.', 5285, false, 16);
INSERT INTO public.moon VALUES (17, 'Orthosie', 2973.1, 'Sister planet of Pasiphae, split in two by a large asteroid, the local planet now has 2 planets rather than one.', 23768, false, 16);
INSERT INTO public.moon VALUES (18, 'Harpalyke', 7290.1, 'Scans of the planet indicate the impossible, it is hollow. There’s much scientific discussion and call for further investigation.', 11275, false, 18);
INSERT INTO public.moon VALUES (19, 'Magaclite', 8093.5, 'Uneventful planet, although surface level readings indicate high levels of vibranium.', 4803, false, 19);
INSERT INTO public.moon VALUES (20, 'Sponde', 4802.7, 'As the name sounds, due to how this planet formed its surface is filled will caves and tunnels which hold pockets of air, as to have an atmosphere held in like a sponge holds water.', 9087, true, 20);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Bokoblin', 8872.3, 'Treacherous surfaces, burning hot, full of violent creatures as unforgiving as its climate.', 97216, true, 96, 1);
INSERT INTO public.planet VALUES (2, 'Zew', 2257.7, 'Flowing water, but due to extremely high oxygen content, a burning atmosphere that couldnt sustain life.', 425673, false, 3277, 1);
INSERT INTO public.planet VALUES (3, 'Netti', 304.2, 'Young and lopsided, this quickly spinning clump forms the beginnings of what might be a planet.', 657981, false, 983247, 1);
INSERT INTO public.planet VALUES (4, 'Moofu', 5954.2, 'Orange desert planet, seemingly no water has ever existed, just endless seas of rough sand like minerals.', 348619, false, 35489, 2);
INSERT INTO public.planet VALUES (5, 'Albonfica', 4954.2, 'A glowing planet, younger, but millions of years more technologically advanced than earth, the city lights of this planet can be seen from millions of light years away.', 132464, true, 18684, 2);
INSERT INTO public.planet VALUES (6, 'Terra', 4543.5, 'Home, the only planet in reach full of life and diverse ecological biomes.', 0, true, 7917, 3);
INSERT INTO public.planet VALUES (7, 'Jupiter', 4603.1, 'The fifth planet from Sol, more than twice as massive as all the other solar system planets combined.', 444, false, 866555, 3);
INSERT INTO public.planet VALUES (8, 'Beckible', 4485.4, 'A soft, warm, and welcoming planet full of life and diverse ecological biomes.', 499274, false, 3845, 4);
INSERT INTO public.planet VALUES (9, 'Nelpery', 5823.9, 'A soft, warm, and welcoming planet full of life and diverse ecological biomes.', 486270, false, 36781, 4);
INSERT INTO public.planet VALUES (10, 'Rokevier 99', 9123.2, 'A soft, warm, and welcoming planet full of life and diverse ecological biomes.', 235004, false, 9345, 1);
INSERT INTO public.planet VALUES (11, 'Melapi', 7368.7, 'A soft, warm, and welcoming planet full of life and diverse ecological biomes.', 685472, false, 3249, 2);
INSERT INTO public.planet VALUES (12, 'Wastle', 7835.4, 'Older than earth and housing life, however Wastle has undergone extreme ecological degradation, any once intelligent life has long since abandon.', 35486, false, 11584, 5);
INSERT INTO public.planet VALUES (13, 'Gevbecky', 5367.7, '', 753691, true, 13578, 5);
INSERT INTO public.planet VALUES (14, 'Avica 33', 6658.6, 'Observed to flash upon its spin, one side of this planet is mostly reflective while the other half is very low in reflectivity.', 348195, false, 4567, 5);
INSERT INTO public.planet VALUES (15, 'Lopini', 1337.9, 'Lightly blue planet due to the vastly water covered surface. However surprisingly lifeless given its able climate.', 678245, false, 2145, 2);
INSERT INTO public.planet VALUES (16, 'Malean', 9050.8, 'Incredibly dull planet by its brown appearance, but on closer examination full of diverse life that is almost exclusively brown. ', 102548, true, 24568, 2);
INSERT INTO public.planet VALUES (17, 'Zeplino', 3548.1, 'Unexpectedly pink planet, its surface is made up of  trillions of crystal grows due to the planets unique chemistry.', 174648, false, 36872, 6);
INSERT INTO public.planet VALUES (18, 'Quailin', 6955.5, 'A highly dense planet, was once a chuck of an dead star that had exploded into many chucks, 90% iron.', 959815, false, 56832, 6);
INSERT INTO public.planet VALUES (19, 'Himphy', 13516.4, 'Milky white in color, but the surface dust is extremely reflective of the local stars light.', 516519, false, 8222, 6);
INSERT INTO public.planet VALUES (20, 'Gevry', 3682.2, 'Similar to earth a few billion years ago, will the beginnings of life about to blossum.', 896582, true, 7006, 6);


--
-- Data for Name: ship; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.ship VALUES (2, 'Vepito', 'Class Six cargo vessel - passive behavior', 5, false);
INSERT INTO public.ship VALUES (3, 'Gritphavic', 'Class One Destroyer, displaying aggressive behavior.', 1, true);
INSERT INTO public.ship VALUES (4, 'Cleriqui', 'Class Two Battleship - passive behavior', 2, true);
INSERT INTO public.ship VALUES (5, 'Hevgurt', 'Class 3 cargo vessel - aggressive behavior', 4, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Yaooti', 347.2, 'Yaooti is an extremely rare blue star with a solar ring.', 895247, 'Blue Giant', 1);
INSERT INTO public.star VALUES (2, 'Ifmarto', 9852.4, 'Grand and intense, this giant harbors not just a few but hundreds of planets in its orbit due its magnitude.', 547, 'Red Giant', 5);
INSERT INTO public.star VALUES (3, 'Gebval', 859.2, 'Smaller than most dwarfs but steady and carries 2 planets.', 57781, 'White dwarf', 4);
INSERT INTO public.star VALUES (4, 'Sol', 4536.8, 'Home to the only solar system in the known universe.', 865370, 'Main Squence Star', 3);
INSERT INTO public.star VALUES (5, 'Xyer', 4445.4, 'Collapsed core of a massive supergiant star, densest known class of stellar objects.', 751251, 'Neutron', 2);
INSERT INTO public.star VALUES (6, 'Naernui', 100.1, 'Soon to be a main sequence star, has strong X-ray flares and intense stellar winds', 671552, 'T Tauri Star', 6);


--
-- Name: galaxy_body_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_body_id_seq', 6, true);


--
-- Name: moon_body_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_body_id_seq', 20, true);


--
-- Name: planet_body_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_body_id_seq', 20, true);


--
-- Name: ship_ship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.ship_ship_id_seq', 5, true);


--
-- Name: star_body_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_body_id_seq', 6, true);


--
-- Name: galaxy galaxy_diameter_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_diameter_key UNIQUE (diameter);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_diameter_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_diameter_key UNIQUE (diameter);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_diameter_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_diameter_key UNIQUE (diameter);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: ship ship_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.ship
    ADD CONSTRAINT ship_name_key UNIQUE (name);


--
-- Name: ship ship_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.ship
    ADD CONSTRAINT ship_pkey PRIMARY KEY (ship_id);


--
-- Name: star star_diameter_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_diameter_key UNIQUE (diameter);


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
-- Name: ship ship_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.ship
    ADD CONSTRAINT ship_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

