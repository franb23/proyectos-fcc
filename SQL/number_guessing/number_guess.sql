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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    username character varying(22),
    games integer,
    best_guess integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('user_1736280195434', 0, 0);
INSERT INTO public.users VALUES ('user_1736280195433', 0, 0);
INSERT INTO public.users VALUES ('user_1736280245923', 0, 0);
INSERT INTO public.users VALUES ('323', 0, 0);
INSERT INTO public.users VALUES ('288', 0, 0);
INSERT INTO public.users VALUES ('user_1736280245922', 0, 0);
INSERT INTO public.users VALUES ('user_1736279216261', 2, 945);
INSERT INTO public.users VALUES ('963', 0, 0);
INSERT INTO public.users VALUES ('777', 0, 0);
INSERT INTO public.users VALUES ('user_1736279216262', 5, 44);
INSERT INTO public.users VALUES ('514', 0, 0);
INSERT INTO public.users VALUES ('752', 0, 0);
INSERT INTO public.users VALUES ('user_1736280289659', 0, 0);
INSERT INTO public.users VALUES ('199', 1, 199);
INSERT INTO public.users VALUES ('user_1736279337006', 2, 387);
INSERT INTO public.users VALUES ('user_1736279337007', 5, 134);
INSERT INTO public.users VALUES ('549', 1, 549);
INSERT INTO public.users VALUES ('Francina', 1, 15);
INSERT INTO public.users VALUES ('user_1736280289658', 0, 0);
INSERT INTO public.users VALUES ('529', 1, 529);
INSERT INTO public.users VALUES ('user_1736279545776', 2, 109);
INSERT INTO public.users VALUES ('510', 1, 510);
INSERT INTO public.users VALUES ('user_1736279545777', 5, 120);
INSERT INTO public.users VALUES ('449', 1, 451);
INSERT INTO public.users VALUES ('992', 1, 992);
INSERT INTO public.users VALUES ('user_1736279795634', 2, 34);
INSERT INTO public.users VALUES ('767', 1, 767);
INSERT INTO public.users VALUES ('user_1736279795635', 5, 232);
INSERT INTO public.users VALUES ('user_1736279856705', 0, 0);
INSERT INTO public.users VALUES ('user_1736279856704', 0, 0);
INSERT INTO public.users VALUES ('user_1736279869657', 0, 0);
INSERT INTO public.users VALUES ('user_1736279869656', 0, 0);
INSERT INTO public.users VALUES ('user_1736279892300', 0, 0);
INSERT INTO public.users VALUES ('user_1736279892299', 0, 0);
INSERT INTO public.users VALUES ('user_1736279973277', 0, 0);
INSERT INTO public.users VALUES ('user_1736279973276', 0, 0);
INSERT INTO public.users VALUES ('user_1736280004761', 0, 0);
INSERT INTO public.users VALUES ('user_1736280004760', 0, 0);
INSERT INTO public.users VALUES ('user_1736280042192', 0, 0);
INSERT INTO public.users VALUES ('user_1736280042191', 0, 0);
INSERT INTO public.users VALUES ('user_1736280055544', 0, 0);
INSERT INTO public.users VALUES ('user_1736280055543', 0, 0);
INSERT INTO public.users VALUES ('22', 0, 0);
INSERT INTO public.users VALUES ('613', 0, 0);
INSERT INTO public.users VALUES ('user_1736280168916', 2, 472);
INSERT INTO public.users VALUES ('148', 0, 0);
INSERT INTO public.users VALUES ('user_1736280316605', 2, 148);
INSERT INTO public.users VALUES ('204', 0, 0);
INSERT INTO public.users VALUES ('user_1736280168917', 5, 12);
INSERT INTO public.users VALUES ('53', 0, 0);
INSERT INTO public.users VALUES ('883', 0, 0);
INSERT INTO public.users VALUES ('user_1736280316606', 5, 22);
INSERT INTO public.users VALUES ('722', 0, 0);
INSERT INTO public.users VALUES ('user_1736280389136', 2, 786);
INSERT INTO public.users VALUES ('user_1736280389137', 5, 420);
INSERT INTO public.users VALUES ('user_1736280403866', 2, 6);
INSERT INTO public.users VALUES ('user_1736280403867', 5, 439);


--
-- PostgreSQL database dump complete
--

