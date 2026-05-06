CREATE EXTENSION IF NOT EXISTS postgis;
--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4 (Debian 16.4-1.pgdg110+2)
-- Dumped by pg_dump version 16.4 (Debian 16.4-1.pgdg110+2)

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
-- Name: buildings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.buildings (
    gid bigint NOT NULL,
    ogc_fid integer,
    "timestamp" timestamp with time zone,
    version character varying,
    changeset character varying,
    "user" character varying,
    uid character varying,
    "addr:city" character varying,
    "addr:housenumber" character varying,
    "addr:place" character varying,
    "addr:street" character varying,
    building character varying,
    "building:levels" character varying,
    highway character varying,
    house character varying,
    name character varying,
    id character varying,
    geom public.geometry(MultiPolygon,4326)
);


--
-- Name: poi; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.poi (
    gid bigint NOT NULL,
    ogc_fid integer,
    "timestamp" timestamp with time zone,
    version character varying,
    changeset character varying,
    "user" character varying,
    uid character varying,
    "addr:city" character varying,
    "addr:housenumber" character varying,
    "addr:place" character varying,
    "addr:street" character varying,
    building character varying,
    "building:levels" character varying,
    highway character varying,
    house character varying,
    name character varying,
    id character varying,
    geom public.geometry(MultiPoint,4326)
);


--
-- Name: roads; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.roads (
    gid bigint NOT NULL,
    ogc_fid integer,
    "timestamp" timestamp with time zone,
    version character varying,
    changeset character varying,
    "user" character varying,
    uid character varying,
    "addr:city" character varying,
    "addr:housenumber" character varying,
    "addr:place" character varying,
    "addr:street" character varying,
    building character varying,
    "building:levels" character varying,
    highway character varying,
    house character varying,
    name character varying,
    id character varying,
    geom public.geometry(MultiLineString,4326)
);


--
-- Name: buildings buildings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.buildings
    ADD CONSTRAINT buildings_pkey PRIMARY KEY (gid);


--
-- Name: poi poi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.poi
    ADD CONSTRAINT poi_pkey PRIMARY KEY (gid);


--
-- Name: roads roads_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roads
    ADD CONSTRAINT roads_pkey PRIMARY KEY (gid);


--
-- Name: idx_buildings_geom; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_buildings_geom ON public.buildings USING gist (geom);


--
-- Name: idx_poi_geom; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_poi_geom ON public.poi USING gist (geom);


--
-- Name: idx_roads_geom; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_roads_geom ON public.roads USING gist (geom);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4 (Debian 16.4-1.pgdg110+2)
-- Dumped by pg_dump version 16.4 (Debian 16.4-1.pgdg110+2)

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

--
-- Data for Name: buildings; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.buildings (gid, ogc_fid, "timestamp", version, changeset, "user", uid, "addr:city", "addr:housenumber", "addr:place", "addr:street", building, "building:levels", highway, house, name, id, geom) VALUES (1, 1, '2026-03-03 07:45:23+00', '4', '179287705', 'Miterev Dmitry', '23839758', 'сельское поселение Тимофеевка', '2', 'СНТ Сборщик', '1-я улица', 'house', '2', NULL, NULL, NULL, 'way/1478811227', '0106000020E610000001000000010300000001000000070000001047B2A261A34840B3A72E2AF3CB4A40AB251DE560A34840EA984E46F0CB4A4023A46E675FA3484055078A69F0CB4A40F93E66B15EA34840A4688AA5EDCB4A408BE65CE564A3484039701816EDCB4A40196DFA5866A348401F5E21BDF2CB4A401047B2A261A34840B3A72E2AF3CB4A40');
INSERT INTO public.buildings (gid, ogc_fid, "timestamp", version, changeset, "user", uid, "addr:city", "addr:housenumber", "addr:place", "addr:street", building, "building:levels", highway, house, name, id, geom) VALUES (2, 2, '2026-03-03 07:45:23+00', '4', '179287705', 'Miterev Dmitry', '23839758', 'сельское поселение Тимофеевка', '97', 'СНТ Сборщик', 'улица № 2', 'house', '2', NULL, NULL, NULL, 'way/1478811228', '0106000020E6100000010000000103000000010000000500000052EC0D6377A3484088307E1AF7CB4A40FF0758AB76A34840BED9E6C6F4CB4A405DA8FC6B79A34840D6BF907AF4CB4A40B08CB2237AA348400B5751CDF6CB4A4052EC0D6377A3484088307E1AF7CB4A40');
INSERT INTO public.buildings (gid, ogc_fid, "timestamp", version, changeset, "user", uid, "addr:city", "addr:housenumber", "addr:place", "addr:street", building, "building:levels", highway, house, name, id, geom) VALUES (3, 3, '2026-02-17 14:25:22+00', '2', '178682677', 'Yuri1001', '23829219', 'сельское поселение Тимофеевка', '187', 'СНТ "Сборщик"', '2-я улица', 'house', '2', NULL, NULL, NULL, 'way/1478811229', '0106000020E61000000100000001030000000100000005000000E28794B080A348406D663E31FCCB4A409B09E12C80A3484015692CABFACB4A401C0A9FAD83A348403E5EA340FACB4A406388523184A34840029CDEC5FBCB4A40E28794B080A348406D663E31FCCB4A40');
INSERT INTO public.buildings (gid, ogc_fid, "timestamp", version, changeset, "user", uid, "addr:city", "addr:housenumber", "addr:place", "addr:street", building, "building:levels", highway, house, name, id, geom) VALUES (4, 4, '2026-02-17 14:25:22+00', '2', '178682677', 'Yuri1001', '23829219', 'сельское поселение Тимофеевка', '186', 'СНТ "Сборщик"', 'ул. №2', 'house', '1', NULL, NULL, NULL, 'way/1478811230', '0106000020E610000001000000010300000001000000050000004619BB8E82A34840A680B4FF01CC4A40412E71E481A348409591C4DCFFCB4A40AAD8F39084A3484042374591FFCB4A40B0C33D3B85A34840E7E50BB501CC4A404619BB8E82A34840A680B4FF01CC4A40');
INSERT INTO public.buildings (gid, ogc_fid, "timestamp", version, changeset, "user", uid, "addr:city", "addr:housenumber", "addr:place", "addr:street", building, "building:levels", highway, house, name, id, geom) VALUES (5, 5, '2026-02-17 14:25:22+00', '2', '178682677', 'Yuri1001', '23829219', 'сельское поселение Тимофеевка', '193', 'СНТ "Сборщик"', '3-я улица', 'house', '1', NULL, NULL, NULL, 'way/1478811231', '0106000020E6100000010000000103000000010000000500000092239D8191A34840EB45A3F1FACB4A4062E7B7F990A3484081817BF9F8CB4A406045A1C096A34840D4C78D6CF8CB4A408F81864897A34840D34B8C65FACB4A4092239D8191A34840EB45A3F1FACB4A40');
INSERT INTO public.buildings (gid, ogc_fid, "timestamp", version, changeset, "user", uid, "addr:city", "addr:housenumber", "addr:place", "addr:street", building, "building:levels", highway, house, name, id, geom) VALUES (6, 6, '2026-02-17 14:25:22+00', '2', '178682677', 'Yuri1001', '23829219', 'сельское поселение Тимофеевка', '194', 'СНТ "Сборщик"', '3-я улица', 'house', '1', NULL, NULL, NULL, 'way/1478811232', '0106000020E61000000100000001030000000100000005000000893A185696A34840C5E74EB0FFCB4A4042BC64D295A348402BFBAE08FECB4A40DCBC715298A34840E9DD0EC3FDCB4A408E7B4ED598A3484083CAAE6AFFCB4A40893A185696A34840C5E74EB0FFCB4A40');
INSERT INTO public.buildings (gid, ogc_fid, "timestamp", version, changeset, "user", uid, "addr:city", "addr:housenumber", "addr:place", "addr:street", building, "building:levels", highway, house, name, id, geom) VALUES (7, 7, '2026-02-17 14:25:22+00', '2', '178682677', 'Yuri1001', '23829219', 'сельское поселение Тимофеевка', '195', 'СНТ "Сборщик"', '3-я улица', 'house', '2', NULL, NULL, NULL, 'way/1478811233', '0106000020E61000000100000001030000000100000005000000BFF1B56796A34840059D5AC702CC4A400508D5BC99A348404C07A17202CC4A406F2E59709AA3484027C929F004CC4A402A183A1B97A34840E05EE34405CC4A40BFF1B56796A34840059D5AC702CC4A40');
INSERT INTO public.buildings (gid, ogc_fid, "timestamp", version, changeset, "user", uid, "addr:city", "addr:housenumber", "addr:place", "addr:street", building, "building:levels", highway, house, name, id, geom) VALUES (8, 8, '2026-02-17 14:25:22+00', '2', '178682677', 'Yuri1001', '23829219', 'сельское поселение Тимофеевка', '281', 'СНТ "Сборщик"', '3-я улица', 'house', '2', NULL, NULL, NULL, 'way/1478811234', '0106000020E61000000100000001030000000100000005000000DFA9807B9EA3484047C66AF3FFCB4A403E703A6E9DA348407F5B66C7FCCB4A402DB29DEFA7A3484079B8D38CFBCB4A40CDEBE3FCA8A348404223D8B8FECB4A40DFA9807B9EA3484047C66AF3FFCB4A40');
INSERT INTO public.buildings (gid, ogc_fid, "timestamp", version, changeset, "user", uid, "addr:city", "addr:housenumber", "addr:place", "addr:street", building, "building:levels", highway, house, name, id, geom) VALUES (9, 9, '2026-02-17 14:25:22+00', '2', '178682677', 'Yuri1001', '23829219', 'сельское поселение Тимофеевка', '279', 'СНТ "Сборщик"', '3-я улица', 'house', '2', NULL, NULL, NULL, 'way/1478811235', '0106000020E610000001000000010300000001000000050000007E67C581A1A3484095F661180BCC4A402BB121EEA0A34840D8D7BAD408CC4A40A03138EFA4A3484079454B7908CC4A40F3E7DB82A5A34840A1A41BBC0ACC4A407E67C581A1A3484095F661180BCC4A40');
INSERT INTO public.buildings (gid, ogc_fid, "timestamp", version, changeset, "user", uid, "addr:city", "addr:housenumber", "addr:place", "addr:street", building, "building:levels", highway, house, name, id, geom) VALUES (10, 10, '2026-02-17 14:25:22+00', '2', '178682677', 'Yuri1001', '23829219', 'сельское поселение Тимофеевка', '197', 'СНТ "Сборщик"', '3-я улица', 'house', '1', NULL, NULL, NULL, 'way/1478811236', '0106000020E6100000010000000103000000010000000500000099654F029BA348402DEBFEB110CC4A4046DDBD929AA348407B8E7EEA0ECC4A407A2CC7759DA348404CAEBDAA0ECC4A40CDB458E59DA34840694B677110CC4A4099654F029BA348402DEBFEB110CC4A40');
INSERT INTO public.buildings (gid, ogc_fid, "timestamp", version, changeset, "user", uid, "addr:city", "addr:housenumber", "addr:place", "addr:street", building, "building:levels", highway, house, name, id, geom) VALUES (11, 11, '2026-02-17 14:25:22+00', '2', '178682677', 'Yuri1001', '23829219', 'сельское поселение Тимофеевка', '198', 'СНТ "Сборщик"', '3-я улица', 'house', '1', NULL, NULL, NULL, 'way/1478811237', '0106000020E61000000100000001030000000100000005000000E0C95D3A9CA3484065BDBD1017CC4A40CE0248C89BA34840D7DAFB5415CC4A400D28E5FF9FA34840660BADF314CC4A401FEFFA71A0A34840F4ED6EAF16CC4A40E0C95D3A9CA3484065BDBD1017CC4A40');
INSERT INTO public.buildings (gid, ogc_fid, "timestamp", version, changeset, "user", uid, "addr:city", "addr:housenumber", "addr:place", "addr:street", building, "building:levels", highway, house, name, id, geom) VALUES (12, 12, '2026-02-22 11:00:17+00', '1', '178893712', 'Miterev Dmitry', '23839758', NULL, NULL, NULL, NULL, 'house', '2', NULL, 'detached', NULL, 'way/1481723783', '0106000020E61000000100000001030000000100000005000000D83FF44993A348409FE0078C9ACC4A405C0AA3B492A348405F6D7B7198CC4A4042881A3B97A34840E2653C0098CC4A40BEBD6BD097A3484022D9C81A9ACC4A40D83FF44993A348409FE0078C9ACC4A40');
INSERT INTO public.buildings (gid, ogc_fid, "timestamp", version, changeset, "user", uid, "addr:city", "addr:housenumber", "addr:place", "addr:street", building, "building:levels", highway, house, name, id, geom) VALUES (13, 13, '2026-03-03 07:45:23+00', '2', '179287705', 'Miterev Dmitry', '23839758', 'сельское поселение Тимофеевка', '4', 'СНТ Сборщик', '1-я улица', 'house', '2', NULL, 'detached', NULL, 'way/1481723784', '0106000020E6100000010000000103000000010000000500000009281E6162A348403FC0FFFBF8CB4A40A4BED13362A348408187B36CF7CB4A40207821C264A348407C54B252F7CB4A4085E16DEF64A34840398DFEE1F8CB4A4009281E6162A348403FC0FFFBF8CB4A40');
INSERT INTO public.buildings (gid, ogc_fid, "timestamp", version, changeset, "user", uid, "addr:city", "addr:housenumber", "addr:place", "addr:street", building, "building:levels", highway, house, name, id, geom) VALUES (14, 14, '2026-03-03 07:45:23+00', '2', '179287705', 'Miterev Dmitry', '23839758', 'сельское поселение Тимофеевка', '6', 'СНТ Сборщик', '1-я улица', 'house', '2', NULL, 'detached', NULL, 'way/1481723785', '0106000020E610000001000000010300000001000000050000003830B95164A348404F1F813FFCCB4A407F9AFFFC63A348400F643DB5FACB4A40D1D4A18966A34840C13CBF83FACB4A408A6A5BDE66A3484002F8020EFCCB4A403830B95164A348404F1F813FFCCB4A40');
INSERT INTO public.buildings (gid, ogc_fid, "timestamp", version, changeset, "user", uid, "addr:city", "addr:housenumber", "addr:place", "addr:street", building, "building:levels", highway, house, name, id, geom) VALUES (15, 15, '2026-03-03 07:45:23+00', '2', '179287705', 'Miterev Dmitry', '23839758', 'сельское поселение Тимофеевка', '5', 'СНТ Сборщик', '2-я улица', 'house', '2', NULL, 'detached', NULL, 'way/1481723786', '0106000020E61000000100000001030000000100000005000000E03B20BF6DA348404223D8B8FECB4A40E6B6D8486DA348409CB69091FDCB4A402C9FE57970A34840F62FA41EFDCB4A4025242DF070A348409C9CEB45FECB4A40E03B20BF6DA348404223D8B8FECB4A40');
INSERT INTO public.buildings (gid, ogc_fid, "timestamp", version, changeset, "user", uid, "addr:city", "addr:housenumber", "addr:place", "addr:street", building, "building:levels", highway, house, name, id, geom) VALUES (16, 16, '2026-03-03 07:45:23+00', '2', '179287705', 'Miterev Dmitry', '23839758', 'сельское поселение Тимофеевка', '10', 'СНТ Сборщик', '1-я улица', 'house', '2', NULL, 'detached', NULL, 'way/1481723787', '0106000020E61000000100000001030000000100000005000000DC48D92269A348406C35351A0ACC4A40A70705A568A348406DDF484508CC4A40699B2CFF6BA348400848EAF307CC4A400A1D2A7C6CA348409C5DADC909CC4A40DC48D92269A348406C35351A0ACC4A40');
INSERT INTO public.buildings (gid, ogc_fid, "timestamp", version, changeset, "user", uid, "addr:city", "addr:housenumber", "addr:place", "addr:street", building, "building:levels", highway, house, name, id, geom) VALUES (17, 17, '2026-03-03 07:45:23+00', '2', '179287705', 'Miterev Dmitry', '23839758', 'сельское поселение Тимофеевка', '1', 'СНТ Сборщик', '1-я улица', 'house', '2', NULL, 'detached', NULL, 'way/1481723788', '0106000020E610000001000000010300000001000000050000009BB22EC95CA3484054742497FFCB4A40F459547A5CA3484013B9E00CFECB4A40BD68345E5FA348400753DED8FDCB4A4064C10EAD5FA34840B34E4B62FFCB4A409BB22EC95CA3484054742497FFCB4A40');
INSERT INTO public.buildings (gid, ogc_fid, "timestamp", version, changeset, "user", uid, "addr:city", "addr:housenumber", "addr:place", "addr:street", building, "building:levels", highway, house, name, id, geom) VALUES (18, 18, '2026-03-03 07:45:23+00', '2', '179287705', 'Miterev Dmitry', '23839758', 'сельское поселение Тимофеевка', '3', 'СНТ Сборщик', '1-я улица', 'house', '2', NULL, 'detached', NULL, 'way/1481723789', '0106000020E61000000100000001030000000100000009000000F46DC1525DA3484033B9629005CC4A4012FD35B45CA34840CFF9298E03CC4A40F2199AFC60A3484040B50B1703CC4A4099A0866F61A34840CE3BA98A04CC4A40C894B48762A34840E04A766C04CC4A40B0AE0AD462A34840F7CEC36405CC4A40FEADAE5461A34840093AB58E05CC4A40517EF73361A34840332F2C2405CC4A40F46DC1525DA3484033B9629005CC4A40');
INSERT INTO public.buildings (gid, ogc_fid, "timestamp", version, changeset, "user", uid, "addr:city", "addr:housenumber", "addr:place", "addr:street", building, "building:levels", highway, house, name, id, geom) VALUES (19, 19, '2026-03-03 07:45:23+00', '2', '179287705', 'Miterev Dmitry', '23839758', 'сельское поселение Тимофеевка', '5', 'СНТ Сборщик', '1-я улица', 'house', NULL, NULL, 'detached', NULL, 'way/1481723790', '0106000020E61000000100000001030000000100000005000000E1FC97B55EA34840246992B30BCC4A4017FCEC365EA34840BA1A344F09CC4A40FD4B529962A348405583D5FD08CC4A40338D261763A34840BFD133620BCC4A40E1FC97B55EA34840246992B30BCC4A40');
INSERT INTO public.buildings (gid, ogc_fid, "timestamp", version, changeset, "user", uid, "addr:city", "addr:housenumber", "addr:place", "addr:street", building, "building:levels", highway, house, name, id, geom) VALUES (20, 20, '2026-03-03 07:45:23+00', '2', '179287705', 'Miterev Dmitry', '23839758', 'сельское поселение Тимофеевка', '11', 'СНТ Сборщик', '1-я улица', 'house', '2', NULL, 'detached', NULL, 'way/1481723791', '0106000020E610000001000000010300000001000000050000006253420B64A34840987620A11CCC4A40C7A8216063A348406940738C1ACC4A40E325EE6767A34840993AD9171ACC4A407DD00E1368A34840C870862C1CCC4A406253420B64A34840987620A11CCC4A40');
INSERT INTO public.buildings (gid, ogc_fid, "timestamp", version, changeset, "user", uid, "addr:city", "addr:housenumber", "addr:place", "addr:street", building, "building:levels", highway, house, name, id, geom) VALUES (21, 21, '2026-03-03 07:45:23+00', '3', '179287705', 'Miterev Dmitry', '23839758', 'сельское поселение Тимофеевка', '16', 'СНТ Сборщик', '1-я улица', 'house', '2', NULL, 'detached', NULL, 'way/1481723792', '0106000020E61000000100000001030000000100000009000000154FE2186EA3484015C616821CCC4A40F1A611E96DA34840FE6FDBAD1BCC4A400AD5720C6DA34840332779BF1BCC4A4081C355AF6CA34840BDB497231ACC4A401385F12E72A348406A2C06B419CC4A40AED3ED9172A34840E6D1E8691BCC4A40508F6D1970A34840C8B83D9C1BCC4A4061FA5E4370A34840451CA1551CCC4A40154FE2186EA3484015C616821CCC4A40');
INSERT INTO public.buildings (gid, ogc_fid, "timestamp", version, changeset, "user", uid, "addr:city", "addr:housenumber", "addr:place", "addr:street", building, "building:levels", highway, house, name, id, geom) VALUES (22, 22, '2026-03-03 07:45:23+00', '2', '179287705', 'Miterev Dmitry', '23839758', 'сельское поселение Тимофеевка', '12', 'СНТ Сборщик', '1-я улица', 'house', '2', NULL, 'detached', NULL, 'way/1481723793', '0106000020E6100000010000000103000000010000000500000082E3326E6AA348405D8940F50FCC4A408E91EC116AA34840B15FC1470ECC4A408C0FB3976DA348409AC1CE030ECC4A408061F9F36DA34840B12B77B00FCC4A4082E3326E6AA348405D8940F50FCC4A40');
INSERT INTO public.buildings (gid, ogc_fid, "timestamp", version, changeset, "user", uid, "addr:city", "addr:housenumber", "addr:place", "addr:street", building, "building:levels", highway, house, name, id, geom) VALUES (23, 23, '2026-03-03 07:45:23+00', '2', '179287705', 'Miterev Dmitry', '23839758', NULL, '14', 'СНТ Сборщик', '1-я улица', 'house', '2', NULL, 'detached', NULL, 'way/1481723794', '0106000020E61000000100000001030000000100000005000000F80D5D9A6CA348409B60EE4916CC4A40100EAC996BA3484014CBD2F313CC4A40F1D4230D6EA34840613A089513CC4A40D9D4D40D6FA34840E9CF23EB15CC4A40F80D5D9A6CA348409B60EE4916CC4A40');
INSERT INTO public.buildings (gid, ogc_fid, "timestamp", version, changeset, "user", uid, "addr:city", "addr:housenumber", "addr:place", "addr:street", building, "building:levels", highway, house, name, id, geom) VALUES (24, 24, '2026-03-03 07:45:23+00', '2', '179287705', 'Miterev Dmitry', '23839758', 'сельское поселение Тимофеевка', '9', 'СНТ Сборщик', '1-я улица', 'house', '2', NULL, 'detached', NULL, 'way/1481723795', '0106000020E610000001000000010300000001000000050000000351418F62A3484024720BA716CC4A409886E12362A3484055A0BBC914CC4A40B41D537765A348403D02C98514CC4A401FE8B2E265A348400CD4186316CC4A400351418F62A3484024720BA716CC4A40');


--
-- Data for Name: roads; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.roads (gid, ogc_fid, "timestamp", version, changeset, "user", uid, "addr:city", "addr:housenumber", "addr:place", "addr:street", building, "building:levels", highway, house, name, id, geom) VALUES (1, 25, '2026-02-24 03:58:23+00', '4', '178969445', 'ajmat', '20051395', NULL, NULL, NULL, NULL, NULL, NULL, 'unclassified', NULL, NULL, 'way/308542628', '0105000020E61000000100000001020000001D000000D668835D5EA34840A59CD43CECCB4A4087F3154960A348409F0DAFDAEBCB4A40578FA09D78A3484035ED629AE9CB4A400D39115894A3484090E2772EE7CB4A40CA5D3A9CAFA34840C158DFC0E4CB4A40F885FCD8C9A34840DA8C7857E2CB4A409C7CC4F9E5A34840B1D183CCDFCB4A4005FFB68201A4484024377980DDCB4A40FD69A33A1DA44840429E1331DBCB4A4054DDC8E138A44840F6C484E2D8CB4A401CC418A254A44840806C4892D6CB4A40F172C7516FA44840A506E45CD4CB4A40B9BB73CD89A44840065D0C2FD2CB4A40E6BD20D8A7A44840A241AFE4CFCB4A405A304C01C4A448403EF83F76CDCB4A409314FD46E0A44840572CD90CCBCB4A402C1B8CC7FBA44840708E84C7C8CB4A405FB8CE1A17A548409A2D0F88C6CB4A40164ED2FC31A54840424AA24DC4CB4A401BFD1EAB4AA548409DF7FF71C2CB4A404FB4064A65A5484086032159C0CB4A4064D6411482A548403425A314BECB4A406E6AA0F99CA548400BF4E4F5BBCB4A40A1BF2BDDB8A54840BFBE315FB9CB4A40DFB6007ED7A54840E97129F8B7CB4A4084F57F0EF3A5484091048651B5CB4A40A11AE54F0AA6484045FDE4DEB2CB4A40DAFE959526A64840F452B131AFCB4A40EDF9F59E25A64840E4277A85AACB4A40');
INSERT INTO public.roads (gid, ogc_fid, "timestamp", version, changeset, "user", uid, "addr:city", "addr:housenumber", "addr:place", "addr:street", building, "building:levels", highway, house, name, id, geom) VALUES (2, 26, '2026-02-24 03:58:23+00', '6', '178969445', 'ajmat', '20051395', NULL, NULL, NULL, NULL, NULL, NULL, 'unclassified', NULL, '1-я улица', 'way/308542640', '0105000020E610000001000000010200000023000000DAFE959526A64840F452B131AFCB4A40627028D76FA64840A55E0196A6CC4A40A54BFF9254A648402104E44BA8CC4A4019C5179238A64840F502FDCFABCC4A401536A8A21DA64840A5958CADB1CC4A4010A738B302A64840C539EAE8B8CC4A407C992842EAA548404B332779BFCC4A400DDEFC2BD0A54840B874CC79C6CC4A4032E2A716B6A5484026B6717ACDCC4A40DD723FF1ADA54840849ECDAACFCC4A4022D9C81A9AA54840ADA179A5D1CC4A409C57D00F7EA5484099FC0571D4CC4A4063731FCA61A5484098947142D7CC4A4052D4997B48A5484043D25DC8D9CC4A409595CBEB2DA5484006802A6EDCCC4A40AAAA86B311A54840ACB827FEDECC4A40A691E057F6A448405DFB027AE1CC4A40B9725188DBA44840C14472E8E3CC4A40864BD8C8BFA44840D8C2876DE6CC4A402901D64FA4A44840D06FA994E8CC4A400E50752387A44840934B885EEBCC4A40860AC4A16DA448402114A5CEEDCC4A40BE7F982952A448406C150ECEF1CC4A406107848C36A44840A69718CBF4CC4A40FE9DEDD11BA448400A7F2B7EF8CC4A40712B73A900A448403268322DFBCC4A40840CE4D9E5A348408A5F0C40FECC4A400F385CF5CAA348404D970F5201CD4A4050711C78B5A3484046E80C3103CD4A407B16DFABB1A34840932930AE02CD4A40E8A4F78DAFA348409B4EFC6200CD4A40DC87179F5DA348404A8D1A5DEFCB4A404D710B4C5DA34840D9D77047EECB4A4000A6B1625DA348402DC25E72EDCB4A40D668835D5EA34840A59CD43CECCB4A40');
INSERT INTO public.roads (gid, ogc_fid, "timestamp", version, changeset, "user", uid, "addr:city", "addr:housenumber", "addr:place", "addr:street", building, "building:levels", highway, house, name, id, geom) VALUES (3, 27, '2026-02-13 06:56:01+00', '3', '178488790', 'alexprib', '23813439', NULL, NULL, NULL, NULL, NULL, NULL, 'service', NULL, '2-я улица', 'way/308549384', '0105000020E610000001000000010200000004000000578FA09D78A3484035ED629AE9CB4A409C757C6AABA34840AD24688297CC4A40870959CCBEA348406DDB4136DACC4A400F385CF5CAA348404D970F5201CD4A40');
INSERT INTO public.roads (gid, ogc_fid, "timestamp", version, changeset, "user", uid, "addr:city", "addr:housenumber", "addr:place", "addr:street", building, "building:levels", highway, house, name, id, geom) VALUES (4, 28, '2025-11-12 10:08:21+00', '2', '174550903', 'ПДМ', '23237611', NULL, NULL, NULL, NULL, NULL, NULL, 'service', NULL, '3-я улица', 'way/308549385', '0105000020E610000001000000010200000002000000840CE4D9E5A348408A5F0C40FECC4A400D39115894A3484090E2772EE7CB4A40');

--
-- PostgreSQL database dump complete
--

