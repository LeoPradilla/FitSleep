--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-04-07 20:03:42

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
-- TOC entry 221 (class 1259 OID 24631)
-- Name: activities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.activities (
    id integer NOT NULL,
    start_date date,
    name character(20),
    start_time character(20),
    steps integer,
    duration integer,
    calories smallint
);


ALTER TABLE public.activities OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 24630)
-- Name: activities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.activities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activities_id_seq OWNER TO postgres;

--
-- TOC entry 3366 (class 0 OID 0)
-- Dependencies: 220
-- Name: activities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.activities_id_seq OWNED BY public.activities.id;


--
-- TOC entry 223 (class 1259 OID 24646)
-- Name: activities_summary; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.activities_summary (
    id integer NOT NULL,
    date_activity date,
    elevation integer,
    floors integer,
    steps integer,
    marginal_calories integer,
    activity_calories integer,
    calories_bmr integer,
    calories_out integer,
    resting_heart_rate integer,
    sedentary_minutes integer,
    fairly_active_minutes integer,
    lightly_active_minutes integer,
    very_active_minutes integer,
    active_score smallint
);


ALTER TABLE public.activities_summary OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 24645)
-- Name: activities_summary_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.activities_summary_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activities_summary_id_seq OWNER TO postgres;

--
-- TOC entry 3367 (class 0 OID 0)
-- Dependencies: 222
-- Name: activities_summary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.activities_summary_id_seq OWNED BY public.activities_summary.id;


--
-- TOC entry 219 (class 1259 OID 24608)
-- Name: heart_rates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.heart_rates (
    id integer NOT NULL,
    date_time date,
    resting_heart_rate integer
);


ALTER TABLE public.heart_rates OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 24607)
-- Name: heart_rates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.heart_rates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.heart_rates_id_seq OWNER TO postgres;

--
-- TOC entry 3368 (class 0 OID 0)
-- Dependencies: 218
-- Name: heart_rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.heart_rates_id_seq OWNED BY public.heart_rates.id;


--
-- TOC entry 217 (class 1259 OID 24595)
-- Name: sleeps; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sleeps (
    id integer NOT NULL,
    date_of_sleep date,
    start_time date,
    end_time date,
    duration integer,
    efficiency integer,
    is_main_sleep character(5),
    minutes_after_wakeup smallint,
    minutes_asleep smallint,
    minutes_awake smallint,
    minutes_to_fall_asleep smallint,
    time_in_bed smallint,
    deep_sleep smallint,
    light_sleep smallint,
    rem_sleep smallint
);


ALTER TABLE public.sleeps OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 24594)
-- Name: sleeps_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sleeps_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sleeps_id_seq OWNER TO postgres;

--
-- TOC entry 3369 (class 0 OID 0)
-- Dependencies: 216
-- Name: sleeps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sleeps_id_seq OWNED BY public.sleeps.id;


--
-- TOC entry 215 (class 1259 OID 24587)
-- Name: steps; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.steps (
    id integer NOT NULL,
    date_time date NOT NULL,
    steps integer DEFAULT 0
);


ALTER TABLE public.steps OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 24586)
-- Name: steps_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.steps_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.steps_id_seq OWNER TO postgres;

--
-- TOC entry 3370 (class 0 OID 0)
-- Dependencies: 214
-- Name: steps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.steps_id_seq OWNED BY public.steps.id;


--
-- TOC entry 3197 (class 2604 OID 24634)
-- Name: activities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activities ALTER COLUMN id SET DEFAULT nextval('public.activities_id_seq'::regclass);


--
-- TOC entry 3198 (class 2604 OID 24649)
-- Name: activities_summary id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activities_summary ALTER COLUMN id SET DEFAULT nextval('public.activities_summary_id_seq'::regclass);


--
-- TOC entry 3196 (class 2604 OID 24611)
-- Name: heart_rates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.heart_rates ALTER COLUMN id SET DEFAULT nextval('public.heart_rates_id_seq'::regclass);


--
-- TOC entry 3195 (class 2604 OID 24598)
-- Name: sleeps id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sleeps ALTER COLUMN id SET DEFAULT nextval('public.sleeps_id_seq'::regclass);


--
-- TOC entry 3193 (class 2604 OID 24590)
-- Name: steps id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.steps ALTER COLUMN id SET DEFAULT nextval('public.steps_id_seq'::regclass);


--
-- TOC entry 3358 (class 0 OID 24631)
-- Dependencies: 221
-- Data for Name: activities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.activities (id, start_date, name, start_time, steps, duration, calories) FROM stdin;
1	2023-04-02	Treadmill           	13:14               	1764	802000	131
2	2023-04-02	Weights             	13:28               	1076	2605000	294
3	2023-04-02	Walk                	15:27               	6732	3738000	472
4	2023-04-02	Walk                	17:17               	5070	3890000	382
5	2023-03-31	Walk                	14:25               	1015	1025000	95
6	2023-03-28	Treadmill           	16:36               	1855	866000	136
7	2023-03-28	Weights             	16:50               	492	2853000	323
8	2023-03-26	Treadmill           	10:44               	1880	788000	142
9	2023-03-26	Weights             	10:59               	1106	3306000	415
10	2023-03-26	Walk                	13:03               	8484	4916000	589
11	2023-03-23	Treadmill           	18:49               	1813	724000	145
12	2023-03-23	Weights             	19:02               	794	3138000	499
13	2023-03-21	Treadmill           	12:53               	1949	814000	144
14	2023-03-21	Weights             	13:07               	538	2954000	362
15	2023-03-18	Walk                	14:13               	1885	1179000	153
16	2023-03-18	Walk                	14:13               	1885	1179000	153
17	2023-03-16	Walk                	13:31               	1327	973000	121
18	2023-03-15	Treadmill           	21:11               	2000	880000	154
19	2023-03-15	Weights             	21:26               	685	2962000	334
20	2023-03-13	Treadmill           	20:40               	1737	789000	132
21	2023-03-13	Weights             	20:53               	567	2653000	359
22	2023-03-11	Treadmill           	14:29               	1936	887000	150
23	2023-03-11	Weights             	14:44               	592	3133000	359
24	2023-03-11	Walk                	19:37               	1388	973000	114
25	2023-03-07	Treadmill           	21:14               	2202	954000	165
26	2023-03-07	Weights             	21:30               	1632	10930000	708
27	2023-03-05	Walk                	17:05               	2029	1944000	178
28	2023-03-04	Treadmill           	19:55               	1827	868000	140
29	2023-03-04	Weights             	20:09               	744	2657000	363
30	2023-02-27	Treadmill           	19:28               	2361	1001000	168
31	2023-02-27	Weights             	19:44               	548	3048000	388
32	2023-02-25	Treadmill           	14:24               	1936	841000	143
33	2023-02-25	Weights             	14:38               	1311	3122000	380
34	2023-02-24	Sport               	14:47               	573	922000	87
35	2023-02-23	Walk                	13:50               	3103	1895000	243
36	2023-02-20	Outdoor Bike        	18:10               	0	7989000	338
37	2023-02-20	Outdoor Bike        	21:19               	0	1639000	85
38	2023-02-18	Walk                	15:12               	1527	1125000	123
39	2023-02-11	Treadmill           	19:33               	1768	852000	152
40	2023-02-11	Weights             	19:47               	754	2983000	439
41	2023-02-07	Treadmill           	18:45               	2738	1084000	202
42	2023-02-07	Weights             	19:07               	811	1953000	226
43	2023-02-02	Treadmill           	20:53               	1518	788000	122
44	2023-02-02	Weights             	21:06               	825	2489000	344
45	2023-01-30	Treadmill           	21:20               	354	1631000	156
46	2023-01-30	Weights             	21:47               	924	7555000	530
47	2023-01-28	Walk                	15:12               	5374	4098000	460
48	2023-01-28	Walk                	17:01               	2390	1485000	178
49	2023-01-28	Walk                	17:52               	4665	2765000	337
50	2023-01-24	Outdoor Bike        	14:33               	0	1485000	83
51	2023-01-23	Treadmill           	20:21               	1415	3097000	305
52	2023-01-19	Treadmill           	19:47               	83	741000	65
53	2023-01-19	Weights             	19:59               	534	2464000	313
54	2023-01-07	Walk                	14:41               	3073	1946000	229
55	2023-01-07	Walk                	15:39               	6712	4761000	533
56	2023-01-07	Walk                	17:33               	2072	1484000	176
57	2023-01-02	Treadmill           	20:23               	61	669000	75
58	2023-01-02	Weights             	20:35               	327	2225000	323
59	2023-01-01	Walk                	00:37               	2706	1998000	219
60	2022-12-31	Walk                	23:12               	1834	1434000	153
61	2022-12-30	Walk                	16:30               	2093	1434000	168
62	2022-12-30	Walk                	17:08               	2627	2098000	229
63	2022-12-28	Weights             	14:29               	246	1998000	264
64	2022-12-26	Walk                	09:11               	0	1024000	19
65	2022-12-26	Walk                	13:59               	1373	1331000	120
66	2022-12-24	Walk                	11:56               	1428	1895000	151
67	2022-12-23	Weights             	18:19               	502	2514000	346
68	2022-12-21	Walk                	11:09               	1397	922000	109
69	2022-12-21	Walk                	11:45               	2068	1946000	187
70	2022-12-20	Weights             	12:21               	1646	6361000	602
71	2022-12-18	Walk                	15:43               	995	973000	97
72	2022-12-18	Walk                	15:43               	995	973000	97
73	2022-12-11	Outdoor Bike        	22:28               	0	1230000	110
74	2022-12-08	Walk                	14:00               	1906	1690000	178
75	2022-12-08	Outdoor Bike        	16:08               	0	1178000	29
76	2022-12-08	Walk                	18:09               	3271	1998000	238
77	2022-12-07	Weights             	19:16               	1277	3937000	493
78	2022-12-05	Weights             	20:35               	1379	3570000	490
79	2022-12-03	Circuit Training    	12:57               	333	2137000	286
80	2022-11-30	Weights             	19:00               	1044	3584000	382
81	2022-11-25	Treadmill           	18:40               	1361	2096000	152
82	2022-11-25	Weights             	19:15               	208	1735000	122
83	2022-11-20	Outdoor Bike        	08:34               	0	1126000	62
84	2022-11-20	Walk                	14:13               	2004	1228000	149
85	2022-11-19	Treadmill           	12:07               	3320	4059000	373
86	2022-11-19	Walk                	19:24               	1478	1434000	134
87	2022-11-17	Walk                	09:34               	0	1024000	19
88	2022-11-16	Treadmill           	19:22               	5006	14297000	868
89	2022-11-13	Treadmill           	13:18               	5049	2048000	385
90	2022-11-13	Weights             	13:52               	210	1808000	180
91	2022-11-13	Walk                	15:56               	3233	2765000	283
92	2022-11-12	Walk                	15:38               	2843	1844000	218
93	2022-11-12	Walk                	17:51               	4588	2970000	349
94	2022-11-10	Treadmill           	19:35               	1907	936000	144
95	2022-11-10	Weights             	19:51               	1669	3715000	495
96	2022-11-09	Walk                	14:26               	1852	1433000	170
97	2022-11-07	Outdoor Bike        	15:35               	0	1485000	81
98	2022-11-07	Treadmill           	19:23               	2164	1842000	225
99	2022-11-07	Weights             	19:53               	907	2156000	321
100	2022-11-05	Walk                	17:56               	1618	1280000	136
101	2022-11-04	Outdoor Bike        	11:40               	0	1638000	57
102	2022-11-04	Walk                	16:16               	1342	1228000	138
103	2022-11-03	Treadmill           	20:55               	1858	854000	137
104	2022-11-03	Weights             	21:09               	2174	14019000	755
105	2022-10-30	Treadmill           	13:24               	1718	733000	122
106	2022-10-30	Weights             	13:37               	870	3115000	363
107	2022-10-30	Walk                	16:08               	1544	1485000	145
108	2022-10-30	Walk                	18:46               	1936	1793000	174
109	2022-10-29	Walk                	13:34               	1879	1280000	150
110	2022-10-27	Treadmill           	20:36               	4948	1967000	361
111	2022-10-27	Weights             	21:09               	1671	35484000	923
112	2022-10-25	Treadmill           	20:32               	2304	1210000	180
113	2022-10-25	Weights             	20:52               	1153	2820000	400
114	2022-10-21	Treadmill           	20:09               	1336	886000	125
115	2022-10-21	Weights             	20:28               	2512	37908000	1255
116	2022-10-17	Aerobic Workout     	00:23               	0	1177000	29
117	2022-10-16	Treadmill           	14:53               	4815	1891000	327
118	2022-10-16	Weights             	15:24               	617	2999000	329
119	2022-10-14	Treadmill           	17:45               	2068	973000	160
120	2022-10-14	Weights             	18:40               	4	10000	0
121	2022-10-14	Weights             	18:40               	651	1293000	198
122	2022-10-12	Treadmill           	20:19               	1783	839000	138
123	2022-10-12	Weights             	20:33               	654	3114000	352
124	2022-10-12	Treadmill           	20:19               	1783	839000	138
125	2022-10-12	Weights             	20:33               	654	3114000	352
126	2022-10-08	Walk                	17:27               	1607	1177000	125
127	2022-10-08	Walk                	18:21               	1344	1126000	114
128	2022-10-06	Treadmill           	20:03               	2351	3222000	288
129	2022-10-05	Walk                	14:19               	1874	1434000	147
130	2022-10-04	Treadmill           	19:16               	1910	874000	147
131	2022-10-04	Weights             	19:31               	1170	3253000	456
132	2022-10-02	Walk                	13:47               	3891	2765000	323
133	2022-10-01	Treadmill           	13:39               	1907	1018000	155
134	2022-10-01	Weights             	13:56               	839	3554000	460
135	2022-09-27	Treadmill           	06:34               	0	3000	0
136	2022-09-25	Treadmill           	12:10               	1838	756000	131
137	2022-09-25	Weights             	12:23               	1111	4427000	455
138	2022-09-23	Treadmill           	16:43               	1863	921000	153
139	2022-09-23	Weights             	16:59               	1273	3586000	460
140	2022-09-16	Outdoor Bike        	12:18               	0	5426000	229
141	2022-09-16	Outdoor Bike        	14:49               	0	3022000	114
142	2022-09-16	Outdoor Bike        	16:22               	0	4251000	163
143	2022-09-16	Treadmill           	19:05               	1981	898000	160
144	2022-09-16	Weights             	19:20               	1350	4137000	561
145	2022-09-16	Outdoor Bike        	12:18               	0	5426000	229
146	2022-09-16	Outdoor Bike        	14:49               	0	3022000	114
147	2022-09-16	Outdoor Bike        	16:22               	0	4251000	163
148	2022-09-16	Treadmill           	19:05               	1981	898000	160
149	2022-09-16	Weights             	19:20               	1350	4137000	561
150	2022-09-14	Treadmill           	20:21               	1672	769000	118
151	2022-09-14	Weights             	20:37               	1371	2713000	365
152	2022-09-12	Treadmill           	20:02               	1818	803000	133
153	2022-09-12	Weights             	20:16               	1048	3039000	437
154	2022-09-10	Treadmill           	10:57               	1727	1172000	136
155	2022-09-10	Weights             	11:16               	243	2063000	184
156	2022-09-10	Walk                	15:59               	1053	921000	95
157	2022-09-10	Walk                	19:00               	3340	3532000	299
158	2022-09-09	Outdoor Bike        	13:41               	0	1281000	71
159	2022-09-09	Outdoor Bike        	18:24               	0	974000	44
160	2022-09-08	Walk                	12:43               	2419	1485000	183
161	2022-09-08	Walk                	15:48               	1241	1435000	126
162	2022-09-08	Walk                	17:03               	1968	2306000	196
163	2022-09-07	Treadmill           	19:05               	1827	867000	134
164	2022-09-07	Weights             	19:19               	1233	3143000	462
165	2022-09-06	Walk                	15:27               	1437	1280000	138
166	2022-09-06	Treadmill           	18:16               	2101	989000	192
167	2022-09-06	Weights             	18:32               	1281	2832000	425
168	2022-09-04	Walk                	12:26               	1516	1229000	124
169	2022-09-04	Walk                	14:20               	3581	2560000	293
170	2022-09-04	Walk                	15:24               	1418	1229000	115
171	2022-08-31	Walk                	08:13               	1725	974000	127
172	2022-08-31	Walk                	19:22               	2253	1740000	190
173	2022-08-30	Walk                	13:35               	1640	1229000	152
174	2022-08-30	Walk                	16:01               	1981	1229000	149
175	2022-08-30	Walk                	20:06               	1869	1229000	145
176	2022-08-29	Walk                	17:15               	1992	1178000	137
177	2022-08-29	Walk                	18:03               	1168	920000	111
178	2022-08-29	Walk                	20:27               	1566	1076000	117
179	2022-08-26	Walk                	10:31               	3435	2509000	255
180	2022-08-26	Walk                	12:34               	1932	1178000	161
181	2022-08-26	Walk                	15:08               	1686	1485000	145
182	2022-08-26	Walk                	15:47               	1027	1179000	96
183	2022-08-26	Walk                	17:08               	2023	1435000	161
184	2022-08-26	Walk                	18:32               	1921	1383000	155
185	2022-08-25	Walk                	09:54               	1742	1178000	147
186	2022-08-25	Walk                	10:35               	1274	1074000	106
187	2022-08-25	Walk                	14:03               	5396	3533000	416
188	2022-08-25	Walk                	16:47               	2538	2254000	229
189	2022-08-25	Walk                	19:47               	1901	1127000	139
190	2022-08-22	Walk                	13:32               	1676	1126000	132
191	2022-08-22	Walk                	19:45               	2019	1230000	146
192	2022-08-20	Walk                	10:44               	3739	3739000	338
193	2022-08-20	Walk                	17:35               	1344	1332000	142
194	2022-08-20	Walk                	18:54               	2057	1281000	156
195	2022-08-19	Walk                	13:57               	1866	1331000	151
196	2022-08-19	Walk                	15:06               	8408	5377000	638
197	2022-08-19	Walk                	17:59               	1967	1639000	174
198	2022-08-19	Walk                	19:15               	1764	1126000	140
199	2022-08-18	Walk                	14:28               	3567	2714000	284
200	2022-08-18	Walk                	16:27               	1773	1280000	140
201	2022-08-17	Walk                	19:02               	1492	973000	132
202	2022-08-17	Walk                	19:38               	2749	2561000	239
203	2022-08-15	Walk                	12:05               	1561	973000	136
204	2022-08-12	Treadmill           	09:20               	1709	763000	134
205	2022-08-12	Weights             	09:33               	1687	3884000	511
206	2022-08-11	Weights             	16:34               	2935	4751000	660
207	2022-08-09	Weights             	16:47               	1641	4151000	565
208	2022-08-08	Treadmill           	16:31               	1142	432000	79
209	2022-08-08	Weights             	16:38               	1606	3888000	566
210	2022-08-08	Walk                	17:58               	1469	921000	115
211	2022-08-05	Treadmill           	07:09               	0	2000	0
212	2022-08-05	Weights             	07:09               	1383	3645000	450
213	2022-08-05	Sport               	16:26               	1912	1536000	196
214	2022-08-05	Sport               	20:51               	2286	1637000	235
215	2022-08-04	Weights             	19:00               	1705	3936000	508
216	2022-08-04	Walk                	20:04               	1775	1075000	141
217	2022-08-03	Treadmill           	06:17               	226	496000	67
218	2022-08-03	Weights             	06:26               	2073	9981000	690
219	2022-08-01	Weights             	17:24               	1339	5169000	739
220	2022-07-29	Outdoor Bike        	16:33               	0	921000	32
221	2022-07-29	Outdoor Bike        	16:33               	0	921000	32
222	2022-07-25	Outdoor Bike        	09:16               	0	6248000	294
223	2022-07-22	Outdoor Bike        	14:40               	0	1792000	114
224	2022-07-21	Walk                	13:08               	1656	1434000	153
225	2022-07-18	Treadmill           	20:10               	1884	936000	151
226	2022-07-18	Weights             	20:25               	1116	3490000	556
227	2022-07-17	Treadmill           	08:44               	1888	832000	133
228	2022-07-17	Weights             	08:58               	1246	2897000	380
229	2022-07-14	Treadmill           	20:24               	1893	918000	162
230	2022-07-14	Weights             	20:39               	1066	3352000	524
231	2022-07-13	Walk                	06:20               	1889	1023000	134
232	2022-07-13	Walk                	07:53               	2121	1127000	155
233	2022-07-12	Outdoor Bike        	08:50               	0	923000	51
234	2022-07-12	Treadmill           	20:04               	2703	2147000	301
235	2022-07-12	Weights             	20:40               	316	1488000	202
236	2022-07-11	Treadmill           	20:02               	1947	810000	153
237	2022-07-11	Weights             	20:16               	1323	3175000	465
238	2022-07-10	Walk                	13:17               	2567	1844000	217
239	2022-07-10	Walk                	17:22               	1682	1024000	131
240	2022-07-08	Outdoor Bike        	19:40               	0	922000	40
241	2022-07-05	Outdoor Bike        	08:38               	0	1331000	57
242	2022-06-25	Walk                	15:26               	1273	1331000	122
243	2022-06-24	Outdoor Bike        	08:37               	0	1944000	130
244	2022-06-23	Circuit Training    	19:05               	2341	3400000	580
245	2022-06-22	Treadmill           	20:05               	2200	1093000	174
246	2022-06-22	Weights             	20:23               	1710	5506000	752
247	2022-06-20	Treadmill           	12:40               	1666	1529000	221
248	2022-06-20	Weights             	13:06               	1486	5706000	558
249	2022-06-17	Treadmill           	12:33               	3821	3648000	480
250	2022-06-15	Treadmill           	19:38               	2141	1035000	186
251	2022-06-15	Weights             	19:56               	1877	6389000	751
252	2022-06-10	Walk                	20:35               	1998	1740000	164
253	2022-06-05	Run                 	11:41               	7319	2758000	573
254	2022-06-05	Walk                	13:47               	6179	4556000	548
255	2022-05-31	Treadmill           	12:43               	1921	826000	149
256	2022-05-31	Weights             	12:57               	1618	3326000	521
257	2022-05-29	Walk                	15:38               	1227	1229000	114
258	2022-05-28	Walk                	16:40               	2359	1587000	192
259	2022-05-27	Walk                	16:55               	5238	3584000	368
260	2022-05-27	Treadmill           	19:11               	1736	712000	123
261	2022-05-27	Weights             	19:23               	1292	2661000	413
262	2022-05-26	Circuit Training    	19:05               	1795	3468000	508
263	2022-05-25	Treadmill           	12:19               	2386	1288000	184
264	2022-05-25	Weights             	12:41               	1045	2650000	380
265	2022-05-23	Circuit Training    	20:07               	3138	4631000	755
266	2022-05-21	Walk                	15:40               	1972	1690000	185
267	2022-05-20	Walk                	12:32               	1151	921000	104
268	2022-05-20	Walk                	18:10               	1835	1587000	173
269	2022-05-18	Treadmill           	12:47               	1816	714000	128
270	2022-05-18	Weights             	12:59               	1331	3498000	487
271	2022-05-17	Treadmill           	12:43               	2063	980000	154
272	2022-05-17	Weights             	12:59               	1405	3362000	494
273	2022-05-14	Treadmill           	15:06               	2300	1664000	232
274	2022-05-14	Weights             	15:34               	814	2634000	416
275	2022-05-12	Circuit Training    	19:08               	1451	2973000	497
276	2022-05-10	Walk                	14:59               	1575	924000	112
277	2022-05-10	Treadmill           	20:03               	1824	1116000	140
278	2022-05-10	Weights             	20:21               	983	3034000	318
279	2022-05-09	Treadmill           	20:25               	1957	935000	149
280	2022-05-09	Weights             	20:41               	2020	9152000	693
281	2022-05-06	Treadmill           	12:43               	1896	838000	131
282	2022-05-06	Weights             	12:57               	1054	3329000	467
283	2022-05-06	Walk                	19:33               	3318	2561000	268
284	2022-05-05	Circuit Training    	19:10               	995	2440000	329
285	2022-05-05	Treadmill           	19:50               	5400	2075000	403
286	2022-05-04	Treadmill           	20:17               	1870	955000	147
287	2022-05-04	Weights             	20:33               	1837	3052000	471
288	2022-05-03	Treadmill           	13:07               	1987	926000	155
289	2022-05-03	Weights             	13:23               	2088	4340000	671
290	2022-05-02	Outdoor Bike        	14:38               	0	1178000	51
291	2022-05-01	Treadmill           	11:20               	1952	845000	155
292	2022-05-01	Weights             	11:35               	1604	3525000	509
293	2022-04-30	Treadmill           	13:40               	1894	922000	152
294	2022-04-30	Weights             	13:56               	1487	3583000	502
295	2022-04-28	Circuit Training    	19:08               	2696	3670000	631
296	2022-04-26	Treadmill           	13:27               	1816	762000	139
297	2022-04-26	Weights             	13:40               	1710	2945000	470
298	2022-04-25	Outdoor Bike        	11:45               	0	1741000	75
299	2022-04-24	Treadmill           	10:12               	2094	959000	159
300	2022-04-24	Weights             	10:28               	1515	4588000	658
301	2022-04-22	Treadmill           	17:34               	1880	857000	135
302	2022-04-22	Weights             	17:49               	1153	3089000	411
303	2022-04-21	Outdoor Bike        	15:55               	0	2511000	133
304	2022-04-20	Treadmill           	12:45               	1799	734000	122
305	2022-04-20	Weights             	12:57               	1850	3584000	564
306	2022-04-19	Outdoor Bike        	11:35               	0	3329000	165
307	2022-04-19	Treadmill           	13:05               	2042	985000	164
308	2022-04-19	Weights             	13:21               	1252	3425000	506
309	2022-04-18	Outdoor Bike        	09:03               	0	1640000	74
310	2022-04-18	Outdoor Bike        	09:49               	0	6042000	118
311	2022-04-18	Treadmill           	12:35               	2057	985000	166
312	2022-04-18	Weights             	12:52               	782	3093000	433
313	2022-04-18	Outdoor Bike        	16:59               	0	6144000	291
314	2022-04-16	Treadmill           	12:46               	1966	804000	142
315	2022-04-16	Weights             	13:11               	1151	2657000	389
316	2022-04-16	Walk                	15:01               	2180	1690000	195
317	2022-04-16	Walk                	17:23               	2698	2201000	230
318	2022-04-15	Treadmill           	11:29               	1866	861000	138
319	2022-04-15	Weights             	11:43               	1328	3283000	415
320	2022-04-15	Walk                	16:54               	1018	1077000	106
321	2022-04-14	Treadmill           	12:56               	1879	955000	158
322	2022-04-14	Weights             	13:12               	765	3404000	429
323	2022-04-11	Walk                	10:51               	2106	1486000	170
324	2022-04-10	Circuit Training    	10:03               	4122	3769000	627
325	2022-04-08	Treadmill           	12:35               	1788	765000	123
326	2022-04-08	Weights             	12:48               	1599	3463000	557
327	2022-04-07	Outdoor Bike        	10:48               	0	1485000	68
328	2022-04-07	Circuit Training    	19:05               	2407	3193000	528
329	2022-04-06	Treadmill           	12:36               	2237	1289000	211
330	2022-04-06	Weights             	12:58               	865	2011000	329
331	2022-04-06	Treadmill           	12:36               	2237	1289000	211
332	2022-04-06	Weights             	12:58               	865	2011000	329
333	2022-04-04	Treadmill           	12:58               	1893	840000	150
334	2022-04-04	Weights             	13:13               	1766	8397000	592
335	2022-04-04	Outdoor Bike        	21:08               	0	2048000	84
336	2022-04-02	Walk                	18:03               	1955	1589000	160
337	2022-04-01	Outdoor Bike        	11:49               	0	1127000	49
338	2022-04-01	Outdoor Bike        	15:32               	0	3533000	145
339	2022-03-30	Treadmill           	19:52               	2249	1436000	207
340	2022-03-30	Weights             	20:16               	1603	3118000	516
341	2022-03-29	Outdoor Bike        	11:54               	0	1076000	50
342	2022-03-28	Walk                	00:42               	4610	3431000	376
343	2022-03-27	Walk                	01:12               	1842	1280000	146
344	2022-03-27	Outdoor Bike        	01:33               	0	973000	119
345	2022-03-27	Walk                	17:58               	2852	1895000	236
346	2022-03-27	Outdoor Bike        	22:37               	0	7476000	585
347	2022-03-26	Walk                	15:40               	2741	2202000	243
348	2022-03-26	Outdoor Bike        	18:56               	0	3584000	355
349	2022-03-26	Walk                	21:00               	1575	1229000	140
350	2022-03-26	Outdoor Bike        	21:21               	0	3022000	191
351	2022-03-26	Outdoor Bike        	23:13               	0	5171000	205
352	2022-03-25	Walk                	17:17               	6480	5223000	609
353	2022-03-25	Outdoor Bike        	19:44               	0	3583000	343
354	2022-03-25	Walk                	20:54               	1812	1476000	158
355	2022-03-25	Walk                	22:57               	2152	1383000	160
356	2022-03-24	Circuit Training    	19:07               	2003	2828000	524
357	2022-03-23	Outdoor Bike        	10:58               	0	922000	47
358	2022-03-17	Circuit Training    	19:07               	1239	2558000	415
359	2022-03-16	Treadmill           	12:46               	1835	747000	136
360	2022-03-16	Weights             	12:58               	664	3003000	440
361	2022-03-14	Treadmill           	12:36               	1652	777000	128
362	2022-03-14	Weights             	12:49               	2337	6430000	854
363	2022-03-14	Weights             	14:53               	0	3000	0
364	2022-03-13	Walk                	13:42               	1046	921000	103
365	2022-03-11	Outdoor Bike        	17:57               	0	1178000	64
366	2022-03-11	Treadmill           	19:46               	1808	793000	136
367	2022-03-11	Weights             	19:59               	1231	2899000	480
368	2022-03-08	Treadmill           	12:40               	2140	1002000	170
369	2022-03-08	Weights             	12:57               	848	2526000	411
370	2022-03-05	Treadmill           	15:36               	2188	1187000	196
371	2022-03-05	Weights             	15:56               	1845	3542000	527
372	2022-03-05	Treadmill           	15:36               	2188	1187000	196
373	2022-03-05	Weights             	15:56               	1845	3542000	527
374	2022-03-03	Circuit Training    	19:12               	2931	3846000	654
375	2022-03-02	Treadmill           	20:11               	2007	831000	149
376	2022-03-02	Weights             	20:25               	1751	3792000	596
377	2022-03-01	Treadmill           	12:52               	1836	783000	126
378	2022-03-01	Weights             	13:06               	1185	2754000	412
379	2022-02-28	Outdoor Bike        	08:50               	0	923000	34
380	2022-02-27	Walk                	11:45               	2690	1894000	210
381	2022-02-27	Walk                	13:18               	3578	2508000	284
382	2022-02-24	Circuit Training    	19:06               	2185	3725000	600
383	2022-02-23	Treadmill           	12:40               	1942	880000	158
384	2022-02-23	Weights             	12:55               	1243	2815000	465
385	2022-02-23	Outdoor Bike        	20:19               	0	1126000	46
386	2022-02-22	Treadmill           	19:39               	1982	1013000	164
387	2022-02-22	Weights             	19:56               	1561	3124000	417
388	2022-02-21	Outdoor Bike        	11:45               	0	3789000	255
389	2022-02-21	Outdoor Bike        	14:23               	0	9578000	784
390	2022-02-20	Circuit Training    	10:09               	1688	2876000	516
391	2022-02-20	Outdoor Bike        	14:40               	0	1485000	144
392	2022-02-19	Outdoor Bike        	18:57               	0	11421000	760
393	2022-02-19	Outdoor Bike        	23:05               	0	1178000	66
394	2022-02-18	Walk                	12:34               	3646	2560000	276
395	2022-02-17	Circuit Training    	19:05               	2705	4394000	730
396	2022-02-16	Treadmill           	12:34               	1982	847000	167
397	2022-02-16	Weights             	12:49               	1251	3050000	516
398	2022-02-16	Outdoor Bike        	20:29               	0	4249000	216
399	2022-02-14	Treadmill           	13:07               	1748	731000	127
400	2022-02-14	Weights             	13:19               	1890	3167000	515
401	2022-02-13	Walk                	11:03               	4133	2869000	343
402	2022-02-13	Walk                	13:05               	2097	1536000	177
403	2022-02-10	Outdoor Bike        	16:42               	0	2663000	169
404	2022-02-08	Treadmill           	12:56               	2258	1689000	213
405	2022-02-08	Weights             	13:24               	875	1714000	289
406	2022-02-07	Outdoor Bike        	10:43               	0	3226000	185
407	2022-02-06	Circuit Training    	10:02               	2885	3613000	582
408	2022-02-05	Treadmill           	15:23               	1860	893000	128
409	2022-02-05	Weights             	15:38               	1193	3311000	506
410	2022-02-04	Treadmill           	07:00               	1891	779000	126
411	2022-02-04	Weights             	07:13               	778	2711000	397
412	2022-02-02	Circuit Training    	06:50               	1067	2317000	380
413	2022-02-01	Treadmill           	06:50               	1852	803000	131
414	2022-02-01	Weights             	07:03               	918	2871000	459
415	2022-01-31	Outdoor Bike        	15:03               	0	922000	58
416	2022-01-31	Outdoor Bike        	16:17               	0	1126000	51
417	2022-01-30	Circuit Training    	10:16               	1843	2493000	422
418	2022-01-28	Treadmill           	12:29               	2020	1044000	176
419	2022-01-28	Weights             	12:47               	1758	5094000	612
420	2022-01-27	Treadmill           	12:32               	1931	768000	132
421	2022-01-27	Weights             	12:45               	946	2554000	412
422	2022-01-25	Treadmill           	11:39               	1892	758000	147
423	2022-01-25	Weights             	11:52               	1731	12572000	666
424	2022-01-23	Weights             	10:08               	1619	3106000	529
425	2022-01-22	Treadmill           	14:16               	1950	811000	125
426	2022-01-22	Weights             	14:29               	1981	3341000	506
427	2022-01-21	Treadmill           	12:38               	1808	733000	148
428	2022-01-21	Weights             	12:51               	1660	3411000	587
429	2022-01-18	Treadmill           	12:38               	1786	709000	129
430	2022-01-18	Weights             	12:52               	1415	3612000	558
431	2022-01-11	Treadmill           	12:32               	1886	775000	155
432	2022-01-11	Weights             	12:45               	1529	2943000	480
433	2022-01-09	Outdoor Bike        	10:20               	0	1844000	75
434	2022-01-07	Run                 	07:02               	8216	2935000	595
435	2022-01-04	Run                 	07:04               	8294	2983000	605
436	2022-01-04	Walk                	07:55               	1369	973000	149
437	2022-01-02	Run                 	06:55               	7795	2803000	541
438	2022-01-02	Walk                	07:44               	2159	1331000	178
439	2021-12-30	Run                 	07:19               	7393	2741000	519
440	2021-12-30	Walk                	08:06               	2685	1742000	219
441	2021-12-30	Walk                	18:34               	1589	1484000	140
442	2021-12-27	Run                 	06:32               	7253	2632000	506
443	2021-12-27	Walk                	07:17               	2804	1792000	232
444	2021-12-24	Treadmill           	12:57               	2126	1207000	179
445	2021-12-24	Weights             	13:17               	1532	3471000	449
446	2021-12-23	Treadmill           	13:03               	2068	1045000	168
447	2021-12-23	Weights             	13:21               	1508	2941000	460
448	2021-12-21	Outdoor Bike        	09:05               	0	2968000	126
449	2021-12-21	Treadmill           	13:07               	1698	775000	136
450	2021-12-21	Weights             	13:20               	1392	3537000	473
451	2021-12-19	Weights             	07:31               	0	7000	0
452	2021-12-19	Run                 	10:58               	7456	2697000	561
453	2021-12-19	Walk                	11:45               	1631	973000	155
454	2021-12-18	Treadmill           	14:34               	1854	776000	135
455	2021-12-18	Weights             	14:49               	2052	4124000	609
456	2021-12-15	Treadmill           	12:27               	1933	816000	139
457	2021-12-15	Weights             	12:41               	1633	3734000	553
458	2021-12-15	Outdoor Bike        	19:59               	0	972000	39
459	2021-12-14	Treadmill           	12:44               	1946	918000	153
460	2021-12-14	Weights             	13:00               	1192	3108000	432
461	2021-12-13	Treadmill           	12:52               	1502	687000	125
462	2021-12-13	Weights             	13:04               	1875	3239000	508
463	2021-12-12	Outdoor Bike        	09:28               	0	2304000	115
464	2021-12-09	Treadmill           	12:53               	1923	814000	137
465	2021-12-09	Weights             	13:07               	1622	3472000	449
466	2021-12-08	Run                 	10:48               	8360	3042000	618
467	2021-12-08	Run                 	11:39               	7	3000	0
468	2021-12-08	Walk                	11:40               	2950	1895000	264
469	2021-12-05	Run                 	10:51               	9210	3302000	665
470	2021-12-05	Walk                	11:48               	2816	1742000	246
471	2021-12-04	Treadmill           	13:31               	1969	886000	149
472	2021-12-04	Weights             	13:46               	1571	3677000	507
473	2021-12-03	Walk                	16:53               	2308	1383000	157
474	2021-12-03	Walk                	17:51               	1957	1332000	144
475	2021-12-02	Treadmill           	12:26               	1893	809000	132
476	2021-12-02	Weights             	12:40               	859	2960000	377
477	2021-12-01	Treadmill           	12:42               	1911	908000	149
478	2021-12-01	Weights             	12:57               	1835	3792000	526
479	2021-11-30	Treadmill           	12:37               	1867	737000	125
480	2021-11-30	Weights             	12:49               	1417	3342000	457
481	2021-11-28	Run                 	10:22               	7467	2706000	561
482	2021-11-28	Walk                	11:28               	1679	1128000	159
483	2021-11-27	Treadmill           	13:07               	1927	801000	145
484	2021-11-27	Weights             	13:21               	1403	3163000	434
485	2021-11-26	Treadmill           	12:20               	1852	781000	140
486	2021-11-26	Weights             	12:33               	1003	2988000	487
487	2021-11-25	Treadmill           	19:54               	1802	733000	129
488	2021-11-25	Weights             	20:06               	735	3014000	405
489	2021-11-24	Treadmill           	12:16               	2009	921000	148
490	2021-11-24	Weights             	12:31               	1128	2541000	380
491	2021-11-23	Treadmill           	12:34               	1797	747000	134
492	2021-11-23	Weights             	12:47               	1305	3363000	563
493	2021-11-21	Run                 	09:54               	0	3000	0
494	2021-11-21	Run                 	09:58               	7454	2732000	554
495	2021-11-21	Walk                	10:46               	3772	2255000	320
496	2021-11-19	Treadmill           	16:35               	1993	843000	145
497	2021-11-19	Weights             	16:49               	825	3047000	402
498	2021-11-18	Treadmill           	12:40               	1703	741000	131
499	2021-11-18	Weights             	12:52               	1503	2943000	455
500	2021-11-17	Treadmill           	12:18               	1852	772000	148
501	2021-11-17	Weights             	12:31               	1618	3627000	592
502	2021-11-15	Walk                	13:03               	2514	1793000	190
503	2021-11-15	Walk                	15:36               	2554	1844000	212
504	2021-11-14	Run                 	09:33               	6562	2415000	499
505	2021-11-14	Walk                	10:38               	1682	1077000	151
506	2021-11-13	Treadmill           	14:34               	1975	917000	169
507	2021-11-13	Weights             	14:50               	1271	3101000	453
508	2021-11-12	Treadmill           	12:34               	1792	729000	141
509	2021-11-12	Weights             	12:47               	1355	3346000	540
510	2021-11-10	Treadmill           	12:38               	1815	757000	127
511	2021-11-10	Weights             	12:50               	1036	2872000	440
512	2021-11-09	Treadmill           	12:29               	1847	885000	145
513	2021-11-09	Weights             	12:43               	1801	3094000	506
514	2021-10-24	Run                 	11:15               	5305	2022000	354
515	2021-10-24	Walk                	11:58               	1978	1282000	184
516	2021-10-22	Treadmill           	19:16               	1821	763000	116
517	2021-10-22	Workout             	19:29               	1626	6245000	327
518	2021-10-21	Treadmill           	12:19               	2037	975000	125
519	2021-10-21	Workout             	12:35               	1509	2503000	390
520	2021-10-17	Treadmill           	09:26               	0	23000	1
521	2021-10-16	Treadmill           	09:40               	1962	1236000	200
522	2021-10-16	Weights             	10:01               	1263	2569000	336
523	2021-10-15	Run                 	07:21               	5302	2143000	415
524	2021-10-13	Treadmill           	07:14               	1789	739000	140
525	2021-10-13	Weights             	07:27               	1530	2913000	431
526	2021-10-13	Walk                	12:03               	155	973000	33
527	2021-10-12	Treadmill           	07:20               	1817	811000	62
528	2021-10-12	Weights             	07:34               	1433	2591000	375
529	2021-10-07	Outdoor Bike        	08:40               	0	1075000	62
530	2021-10-06	Treadmill           	07:13               	1759	770000	132
531	2021-10-06	Weights             	07:26               	1091	2518000	309
532	2021-10-05	Treadmill           	07:16               	1873	813000	136
533	2021-10-05	Weights             	07:30               	1369	2831000	414
534	2021-10-03	Walk                	16:04               	2166	1382000	171
535	2021-10-03	Walk                	19:00               	2169	1434000	155
536	2021-10-03	Walk                	16:04               	2166	1382000	171
537	2021-10-03	Walk                	19:00               	2169	1434000	155
538	2021-10-02	Treadmill           	13:04               	2238	1296000	177
539	2021-10-02	Weights             	13:25               	749	3114000	408
540	2021-09-30	Treadmill           	07:19               	1992	960000	151
541	2021-09-30	Weights             	07:35               	1097	2367000	325
542	2021-09-26	Walk                	13:02               	1375	1024000	105
543	2021-09-25	Treadmill           	14:41               	1929	880000	130
544	2021-09-25	Weights             	14:56               	1414	2808000	372
545	2021-09-22	Treadmill           	07:11               	1904	795000	137
546	2021-09-22	Weights             	07:24               	1398	2739000	302
547	2021-09-22	Walk                	08:06               	1243	1071000	133
548	2021-09-17	Treadmill           	20:08               	1226	655000	97
549	2021-09-17	Weights             	20:20               	1315	2216000	253
550	2021-09-16	Outdoor Bike        	16:02               	0	4508000	296
551	2021-09-12	Treadmill           	13:42               	2036	883000	144
552	2021-09-12	Weights             	13:56               	742	2946000	387
553	2021-09-11	Walk                	14:50               	0	1945000	37
554	2021-09-11	Walk                	16:59               	0	1741000	33
555	2021-09-11	Walk                	14:50               	0	1945000	37
556	2021-09-11	Walk                	16:59               	0	1741000	33
557	2021-09-08	Treadmill           	07:16               	1731	724000	135
558	2021-09-08	Weights             	07:28               	1778	2583000	384
559	2021-09-07	Treadmill           	07:11               	1987	932000	159
560	2021-09-07	Weights             	07:27               	1409	2948000	373
561	2021-09-02	Treadmill           	07:08               	2086	963000	165
562	2021-09-02	Weights             	07:24               	361	2148000	234
563	2021-09-01	Treadmill           	07:18               	2011	900000	141
564	2021-09-01	Weights             	07:33               	1395	2285000	312
565	2021-08-28	Treadmill           	14:40               	1921	944000	158
566	2021-08-28	Weights             	14:56               	391	2353000	321
567	2021-08-27	Treadmill           	07:17               	1834	777000	148
568	2021-08-27	Weights             	07:30               	1495	2590000	208
569	2021-08-25	Treadmill           	07:14               	4345	5161000	498
570	2021-08-11	Treadmill           	07:15               	1920	869000	156
571	2021-08-11	Weights             	07:30               	712	2202000	225
572	2021-08-10	Treadmill           	07:09               	1784	763000	134
573	2021-08-10	Weights             	07:22               	785	2548000	342
574	2021-08-08	Treadmill           	12:10               	1774	765000	140
575	2021-08-08	Weights             	12:23               	1802	3187000	362
576	2021-08-08	Treadmill           	12:10               	1774	765000	140
577	2021-08-08	Weights             	12:23               	1802	3187000	362
578	2021-08-06	Treadmill           	07:26               	224	165000	27
579	2021-08-06	Weights             	07:29               	1200	2162000	291
580	2021-08-02	Outdoor Bike        	08:47               	0	1332000	26
581	2021-07-29	Treadmill           	07:13               	1798	711000	132
582	2021-07-29	Weights             	07:25               	658	2135000	262
583	2021-07-26	Outdoor Bike        	16:51               	0	2303000	44
584	2021-07-25	Treadmill           	15:39               	2186	1122000	156
585	2021-07-25	Weights             	15:58               	1411	2393000	341
586	2021-07-23	Treadmill           	07:06               	1957	835000	150
587	2021-07-23	Weights             	07:20               	1400	3222000	389
588	2021-07-22	Treadmill           	06:58               	1961	924000	170
589	2021-07-22	Weights             	07:14               	1226	2924000	399
590	2021-07-15	Treadmill           	07:07               	8800	46727000	1406
591	2021-07-14	Treadmill           	07:02               	1910	799000	136
592	2021-07-14	Weights             	07:15               	1448	2831000	364
593	2021-07-13	Treadmill           	07:14               	1965	843000	149
594	2021-07-13	Weights             	07:28               	1271	2476000	362
595	2021-07-10	Treadmill           	14:14               	1877	895000	126
596	2021-07-10	Weights             	14:30               	624	2572000	247
597	2021-07-09	Treadmill           	07:00               	2028	863000	144
598	2021-07-09	Weights             	07:14               	2023	3388000	316
599	2021-07-08	Treadmill           	06:59               	1966	855000	150
600	2021-07-08	Weights             	07:14               	2893	15082000	961
601	2021-07-06	Treadmill           	06:52               	1947	821000	137
602	2021-07-06	Weights             	07:06               	1347	3297000	447
603	2021-07-06	Outdoor Bike        	11:53               	0	1588000	29
604	2021-07-04	Treadmill           	10:58               	1933	1176000	158
605	2021-07-04	Weights             	11:18               	1835	3469000	474
606	2021-07-03	Treadmill           	20:01               	1889	35348000	772
607	2021-07-02	Treadmill           	06:59               	1900	810000	152
608	2021-07-02	Weights             	07:13               	1057	3034000	396
609	2021-07-01	Treadmill           	06:59               	1846	775000	126
610	2021-07-01	Weights             	07:12               	1180	2046000	253
611	2021-07-01	Outdoor Bike        	20:05               	0	1280000	60
612	2021-06-30	Treadmill           	06:56               	2057	905000	156
613	2021-06-30	Weights             	07:11               	1481	2988000	377
614	2021-06-26	Outdoor Bike        	15:23               	0	1433000	114
615	2021-06-25	Treadmill           	09:07               	2156	897000	151
616	2021-06-25	Weights             	09:23               	844	3615000	381
617	2021-06-25	Outdoor Bike        	17:44               	0	2099000	114
618	2021-06-25	Outdoor Bike        	21:25               	0	1280000	68
619	2021-06-22	Outdoor Bike        	10:45               	0	973000	49
620	2021-06-22	Outdoor Bike        	21:01               	0	1946000	36
621	2021-06-21	Treadmill           	09:57               	1978	914000	163
622	2021-06-21	Weights             	10:13               	923	3589000	467
623	2021-06-21	Outdoor Bike        	14:10               	0	3533000	67
624	2021-06-19	Treadmill           	06:42               	2049	873000	129
625	2021-06-19	Weights             	07:00               	1427	3161000	168
626	2021-06-16	Weights             	06:41               	1549	2653000	228
627	2021-06-13	Walk                	14:31               	1912	1018000	134
628	2021-06-13	Walk                	16:56               	2988	2099000	214
629	2021-06-13	Walk                	17:48               	1117	921000	101
630	2021-06-13	Walk                	19:24               	0	1382000	26
631	2021-06-08	Treadmill           	06:14               	2038	881000	136
632	2021-06-08	Weights             	06:30               	1334	3216000	236
633	2021-06-06	Walk                	13:37               	1377	1075000	104
634	2021-06-06	Walk                	15:39               	6693	7423000	554
635	2021-06-06	Walk                	20:38               	0	1690000	31
636	2021-06-05	Weights             	08:44               	1204	3208000	386
637	2021-06-05	Walk                	16:58               	1973	2252000	176
638	2021-06-05	Walk                	18:13               	1118	1075000	103
639	2021-06-03	Treadmill           	17:40               	1934	906000	134
640	2021-06-03	Weights             	17:55               	930	2767000	177
641	2021-05-30	Walk                	15:51               	7539	7212000	537
642	2021-05-30	Walk                	18:11               	8903	5325000	254
643	2021-05-26	Run                 	17:40               	4809	1793000	322
644	2021-05-21	Treadmill           	06:45               	2091	939000	161
645	2021-05-21	Weights             	07:01               	6422	35043000	1723
646	2021-05-20	Walk                	12:30               	2029	1229000	155
647	2021-05-20	Walk                	14:13               	1855	1177000	134
648	2021-05-17	Treadmill           	12:21               	2296	1285000	190
649	2021-05-17	Weights             	12:42               	1453	2691000	390
650	2021-05-15	Treadmill           	13:16               	1982	900000	142
651	2021-05-15	Weights             	13:31               	1181	3401000	421
652	2021-05-13	Outdoor Bike        	14:45               	0	1383000	93
653	2021-05-12	Treadmill           	06:52               	1953	807000	142
654	2021-05-12	Weights             	07:06               	1753	3156000	416
655	2021-05-12	Outdoor Bike        	22:44               	0	1536000	52
656	2021-05-11	Treadmill           	06:49               	1865	744000	124
657	2021-05-11	Weights             	07:01               	1139	2905000	407
658	2021-05-08	Treadmill           	13:23               	1991	1009000	163
659	2021-05-08	Weights             	13:40               	1641	4351000	549
660	2021-05-07	Treadmill           	06:59               	1876	796000	138
661	2021-05-07	Weights             	07:12               	1108	2760000	396
662	2021-05-06	Treadmill           	06:57               	1986	832000	143
663	2021-05-06	Weights             	07:11               	1596	3014000	420
664	2021-05-04	Treadmill           	06:42               	1894	788000	137
665	2021-05-04	Weights             	06:56               	1150	3090000	418
666	2021-05-03	Treadmill           	07:41               	1832	802000	130
667	2021-05-03	Weights             	07:55               	1345	3221000	367
668	2021-05-02	Run                 	11:36               	28	15000	0
669	2021-05-02	Run                 	11:42               	4967	1819000	362
670	2021-05-02	Walk                	13:31               	2167	1536000	183
671	2021-05-01	Weights             	15:57               	990	2260000	298
672	2021-04-29	Treadmill           	07:02               	2001	1071000	162
673	2021-04-29	Weights             	07:20               	1131	2552000	357
674	2021-04-27	Treadmill           	06:50               	1809	727000	122
675	2021-04-27	Weights             	07:02               	1476	4214000	554
676	2021-04-27	Outdoor Bike        	15:30               	0	1434000	67
677	2021-04-26	Treadmill           	06:43               	1828	796000	133
678	2021-04-26	Weights             	06:57               	1177	2695000	343
679	2021-04-25	Run                 	11:34               	5040	1863000	359
680	2021-04-23	Outdoor Bike        	14:54               	0	1896000	36
681	2021-04-22	Treadmill           	06:54               	1897	761000	130
682	2021-04-22	Weights             	07:07               	1219	2995000	349
683	2021-04-21	Treadmill           	06:56               	1933	781000	137
684	2021-04-21	Weights             	07:10               	1123	2803000	425
685	2021-04-19	Treadmill           	07:00               	1942	826000	146
686	2021-04-19	Weights             	07:14               	1768	3126000	352
687	2021-04-17	Weights             	15:42               	1316	2548000	347
688	2021-04-15	Treadmill           	06:52               	1898	818000	144
689	2021-04-15	Weights             	07:06               	1470	3232000	425
690	2021-04-13	Treadmill           	06:41               	1933	853000	153
691	2021-04-13	Weights             	06:56               	1937	3604000	527
692	2021-04-09	Treadmill           	06:50               	1893	755000	128
693	2021-04-09	Weights             	07:03               	1643	3578000	436
694	2021-04-08	Treadmill           	06:52               	1884	804000	136
695	2021-04-08	Weights             	07:05               	2408	3543000	413
696	2021-04-07	Treadmill           	06:53               	1943	855000	152
697	2021-04-07	Weights             	07:08               	1204	2785000	399
698	2021-04-05	Treadmill           	06:55               	1824	784000	124
699	2021-04-05	Weights             	07:08               	1038	2966000	355
700	2021-04-04	Treadmill           	09:39               	2131	1018000	162
701	2021-04-04	Weights             	09:56               	2229	3534000	521
702	2021-04-02	Treadmill           	12:55               	1967	904000	138
703	2021-04-02	Weights             	13:10               	1524	2785000	371
704	2021-03-30	Treadmill           	06:41               	1942	817000	140
705	2021-03-30	Weights             	06:54               	1805	3574000	506
706	2021-03-30	Outdoor Bike        	14:01               	0	2816000	121
707	2021-03-29	Outdoor Bike        	08:15               	0	1741000	33
708	2021-03-28	Treadmill           	13:03               	1978	886000	151
709	2021-03-28	Weights             	13:18               	1190	2648000	406
710	2021-03-24	Treadmill           	06:54               	1847	821000	130
711	2021-03-24	Weights             	07:08               	1344	2841000	441
712	2021-03-20	Treadmill           	14:13               	1820	742000	134
713	2021-03-20	Weights             	14:29               	1366	2969000	442
714	2021-03-18	Treadmill           	06:56               	1842	782000	135
715	2021-03-18	Weights             	07:11               	897	3510000	453
716	2021-03-17	Treadmill           	06:53               	1827	797000	132
717	2021-03-17	Weights             	07:06               	1397	3127000	444
718	2021-03-16	Treadmill           	06:55               	1963	870000	149
719	2021-03-16	Weights             	07:09               	1244	3030000	333
720	2021-03-14	Treadmill           	12:51               	1914	837000	125
721	2021-03-14	Weights             	13:05               	619	3091000	254
722	2021-03-12	Treadmill           	07:00               	2006	874000	151
723	2021-03-12	Weights             	07:14               	1397	3142000	348
724	2021-03-10	Treadmill           	06:53               	1913	927000	145
725	2021-03-10	Weights             	07:09               	1470	3421000	340
726	2021-03-08	Treadmill           	06:51               	2025	905000	148
727	2021-03-08	Weights             	07:07               	1654	3174000	218
728	2021-03-07	Treadmill           	13:13               	1913	856000	137
729	2021-03-07	Weights             	13:28               	920	2703000	168
730	2021-03-04	Treadmill           	06:55               	1959	969000	157
731	2021-03-04	Weights             	07:11               	1168	2516000	203
732	2021-03-03	Treadmill           	07:00               	2029	918000	156
733	2021-03-03	Weights             	07:16               	1566	2889000	389
734	2021-02-28	Treadmill           	11:28               	1946	877000	145
735	2021-02-28	Weights             	11:43               	1733	3875000	320
736	2021-02-27	Treadmill           	10:07               	1920	833000	123
737	2021-02-27	Weights             	10:21               	866	3307000	193
738	2021-02-26	Treadmill           	07:05               	1814	790000	135
739	2021-02-26	Weights             	07:18               	1005	3073000	261
740	2021-02-25	Treadmill           	06:58               	1854	797000	135
741	2021-02-25	Weights             	07:13               	1467	2938000	125
742	2021-02-24	Treadmill           	07:03               	1329	653000	98
743	2021-02-24	Weights             	07:14               	1204	3023000	119
744	2021-02-22	Treadmill           	06:51               	1901	804000	104
745	2021-02-22	Weights             	07:04               	847	3256000	323
746	2021-02-21	Outdoor Bike        	10:53               	0	922000	49
747	2021-02-21	Treadmill           	12:03               	1744	801000	58
748	2021-02-21	Weights             	12:16               	1156	2861000	171
749	2021-02-20	Treadmill           	11:00               	1908	823000	136
750	2021-02-20	Weights             	11:14               	1212	3535000	241
751	2021-02-18	Treadmill           	06:56               	2228	1125000	164
752	2021-02-18	Weights             	07:15               	909	2620000	262
753	2021-02-18	Outdoor Bike        	09:19               	0	1434000	65
754	2021-02-17	Treadmill           	06:53               	1852	849000	146
755	2021-02-17	Weights             	07:08               	1360	2999000	187
756	2021-02-15	Outdoor Bike        	17:58               	0	973000	37
757	2021-02-14	Treadmill           	14:43               	2004	786000	140
758	2021-02-14	Weights             	14:57               	1581	3406000	284
759	2021-02-13	Treadmill           	12:41               	1893	777000	142
760	2021-02-13	Weights             	12:54               	1615	3469000	368
761	2021-02-11	Treadmill           	06:57               	2032	940000	146
762	2021-02-11	Weights             	07:12               	1000	2713000	209
763	2021-02-11	Outdoor Bike        	15:37               	0	1844000	100
764	2021-02-10	Treadmill           	06:58               	1883	809000	138
765	2021-02-10	Weights             	07:12               	1156	3163000	380
766	2021-02-09	Treadmill           	06:59               	1848	753000	135
767	2021-02-09	Weights             	07:12               	1135	2850000	284
768	2021-02-06	Treadmill           	13:41               	1893	782000	131
769	2021-02-06	Weights             	13:54               	1152	3078000	319
770	2021-02-05	Run                 	06:58               	2	2000	0
771	2021-02-05	Run                 	07:15               	4849	1817000	349
772	2021-02-05	Outdoor Bike        	18:33               	0	1229000	54
773	2021-02-01	Treadmill           	17:23               	1919	798000	128
774	2021-02-01	Weights             	17:36               	1449	3493000	418
775	2021-01-31	Treadmill           	13:35               	1393	636000	111
776	2021-01-31	Weights             	13:46               	1363	2609000	324
777	2021-01-29	Treadmill           	07:18               	1948	815000	145
778	2021-01-29	Weights             	07:32               	974	2502000	315
779	2021-01-28	Run                 	07:20               	5165	1904000	369
780	2021-01-27	Treadmill           	07:20               	1703	659000	115
781	2021-01-27	Weights             	07:34               	955	2053000	274
782	2021-01-25	Treadmill           	07:20               	1782	680000	114
783	2021-01-25	Weights             	07:32               	1295	2634000	339
784	2021-01-24	Run                 	10:20               	5200	1926000	355
785	2021-01-22	Run                 	07:18               	5372	2027000	407
786	2021-01-21	Treadmill           	17:15               	1743	668000	121
787	2021-01-21	Weights             	17:26               	1675	2592000	353
788	2021-01-19	Treadmill           	17:09               	1785	686000	113
789	2021-01-19	Weights             	17:20               	862	2647000	278
790	2021-01-17	Weights             	13:07               	1473	2713000	388
791	2021-01-15	Weights             	07:17               	463	2397000	207
792	2021-01-13	Weights             	07:18               	606	2248000	299
793	2021-01-13	Weights             	07:18               	606	2248000	299
794	2021-01-07	Run                 	06:41               	8530	3287000	568
795	2021-01-07	Walk                	07:35               	0	2662000	50
796	2021-01-05	Run                 	06:34               	7624	3145000	466
797	2021-01-05	Walk                	07:26               	108	1434000	33
798	2021-01-05	Sport               	17:57               	1550	1638000	167
799	2021-01-05	Run                 	06:34               	7624	3145000	466
800	2021-01-05	Walk                	07:26               	108	1434000	33
801	2021-01-05	Sport               	17:57               	1550	1638000	167
802	2021-01-01	Walk                	12:48               	0	1024000	19
803	2020-12-30	Walk                	06:12               	787	1178000	66
804	2020-12-30	Run                 	06:31               	7759	3271000	508
805	2020-12-30	Walk                	07:24               	1960	1280000	153
806	2020-12-28	Run                 	06:17               	7052	3140000	439
807	2020-12-23	Treadmill           	17:45               	1784	690000	136
808	2020-12-23	Weights             	17:57               	1386	2647000	375
809	2020-12-21	Treadmill           	17:44               	1817	740000	134
810	2020-12-21	Weights             	17:56               	1261	2534000	319
811	2020-12-19	Treadmill           	10:34               	1823	726000	131
812	2020-12-19	Weights             	10:46               	1078	2395000	245
813	2020-12-17	Treadmill           	07:32               	1871	733000	143
814	2020-12-17	Weights             	07:44               	1552	2787000	389
815	2020-12-16	Treadmill           	07:29               	1970	820000	145
816	2020-12-16	Weights             	07:42               	1094	2966000	436
817	2020-12-15	Treadmill           	07:35               	1921	804000	139
818	2020-12-15	Weights             	07:48               	1164	2118000	242
819	2020-12-12	Treadmill           	09:29               	1966	812000	156
820	2020-12-12	Weights             	09:43               	932	1988000	154
821	2020-12-09	Treadmill           	06:25               	1738	649000	125
822	2020-12-09	Weights             	06:36               	1150	2977000	392
823	2020-12-08	Treadmill           	10:32               	1710	647000	122
824	2020-12-08	Weights             	10:43               	1802	3093000	395
825	2020-12-07	Treadmill           	06:23               	1781	666000	121
826	2020-12-07	Weights             	06:34               	1365	2697000	381
827	2020-12-07	Walk                	20:23               	1654	1126000	129
828	2020-12-05	Treadmill           	12:49               	2015	873000	147
829	2020-12-05	Weights             	13:03               	1291	2484000	299
830	2020-12-02	Treadmill           	06:22               	1884	878000	151
831	2020-12-02	Weights             	06:37               	1275	2474000	227
832	2020-12-01	Treadmill           	06:22               	1782	738000	130
833	2020-12-01	Weights             	06:34               	1029	2192000	217
834	2020-12-01	Outdoor Bike        	21:15               	0	4096000	162
835	2020-12-01	Outdoor Bike        	22:43               	0	972000	54
836	2020-11-30	Treadmill           	06:24               	1715	667000	117
837	2020-11-30	Weights             	06:35               	1020	2303000	132
838	2020-11-25	Treadmill           	06:22               	1729	667000	126
839	2020-11-25	Weights             	06:33               	1072	2699000	347
840	2020-11-24	Treadmill           	06:24               	1708	661000	125
841	2020-11-24	Weights             	06:35               	1101	2377000	231
842	2020-11-21	Treadmill           	12:52               	1735	659000	122
843	2020-11-21	Weights             	13:03               	1149	2181000	230
844	2020-11-20	Treadmill           	08:46               	1727	653000	121
845	2020-11-20	Weights             	08:57               	966	2404000	162
846	2020-11-19	Treadmill           	08:38               	1731	645000	125
847	2020-11-19	Weights             	08:49               	1275	2894000	372
848	2020-11-16	Treadmill           	11:41               	1738	702000	117
849	2020-11-16	Weights             	11:53               	1312	3043000	237
850	2020-11-16	Treadmill           	11:41               	1738	702000	117
851	2020-11-16	Weights             	11:53               	1312	3043000	237
852	2020-11-11	Treadmill           	09:54               	1517	642000	127
853	2020-11-11	Weights             	10:06               	1073	2499000	322
854	2020-11-08	Outdoor Bike        	12:45               	0	924000	53
855	2020-11-08	Outdoor Bike        	12:45               	0	924000	53
856	2020-11-06	Walk                	15:14               	3686	3855000	281
857	2020-11-04	Treadmill           	12:11               	1665	666000	123
858	2020-11-04	Weights             	12:22               	930	2768000	255
859	2020-11-03	Treadmill           	07:34               	1205	508000	78
860	2020-11-03	Weights             	07:43               	1619	9784000	310
861	2020-11-03	Outdoor Bike        	20:18               	0	1741000	85
862	2020-10-28	Treadmill           	06:39               	1236	540000	96
863	2020-10-28	Weights             	06:49               	1185	2634000	302
864	2020-10-25	Run                 	11:26               	6784	2699000	534
865	2020-10-20	Treadmill           	16:55               	1694	667000	127
866	2020-10-20	Weights             	17:09               	1097	2433000	81
867	2020-10-19	Treadmill           	11:53               	1714	642000	115
868	2020-10-19	Weights             	12:10               	1106	2285000	149
869	2020-10-18	Run                 	11:30               	5977	2384000	385
870	2020-10-16	Treadmill           	06:33               	1628	621000	16
871	2020-10-16	Weights             	06:47               	1474	2263000	79
872	2020-10-13	Treadmill           	16:45               	1719	635000	16
873	2020-10-13	Weights             	17:00               	1027	2593000	430
874	2020-10-12	Treadmill           	08:20               	1760	655000	22
875	2020-10-12	Weights             	08:38               	1644	2669000	70
876	2020-10-09	Treadmill           	06:34               	1867	748000	27
877	2020-10-09	Workout             	06:50               	1430	2453000	48
878	2020-10-07	Treadmill           	06:32               	1500	618000	116
879	2020-10-07	Workout             	06:45               	995	2019000	327
880	2020-10-03	Run                 	11:29               	4757	1813000	366
881	2020-09-29	Run                 	07:37               	4818	1814000	357
882	2020-09-26	Run                 	10:13               	4725	1807000	356
883	2020-09-26	Walk                	10:45               	1646	1231000	192
884	2020-09-23	Workout             	07:23               	277	691000	14
885	2020-09-23	Weights             	07:35               	437	1420000	192
886	2020-09-17	Run                 	07:37               	4970	1903000	384
887	2020-09-15	Run                 	07:17               	4769	1813000	323
\.


--
-- TOC entry 3360 (class 0 OID 24646)
-- Dependencies: 223
-- Data for Name: activities_summary; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.activities_summary (id, date_activity, elevation, floors, steps, marginal_calories, activity_calories, calories_bmr, calories_out, resting_heart_rate, sedentary_minutes, fairly_active_minutes, lightly_active_minutes, very_active_minutes, active_score) FROM stdin;
1	2023-04-02	0	0	17910	1216	1864	1629	3188	47	823	28	178	131	-1
2	2023-04-01	0	0	1655	133	349	1629	1907	45	738	0	110	0	-1
3	2023-03-31	0	0	10653	837	1432	1629	2867	45	755	25	271	12	-1
4	2023-03-30	0	0	7663	377	616	1629	2215	45	874	22	82	18	-1
5	2023-03-29	0	0	9266	673	1223	1629	2684	44	750	11	250	19	-1
6	2023-03-28	0	0	4875	534	879	1629	2399	45	870	21	119	37	-1
7	2023-03-27	0	0	2392	209	532	1629	2077	45	833	0	163	0	-1
8	2023-03-26	0	0	17270	1292	1908	1629	3254	46	682	37	161	128	-1
9	2023-03-25	0	0	2134	184	454	1629	2018	47	1014	0	135	0	-1
10	2023-03-24	0	0	8301	635	1097	1629	2619	46	765	14	201	20	-1
11	2023-03-23	0	0	9432	1073	1627	1629	3032	46	683	24	178	84	-1
12	2023-03-22	0	0	7444	568	1089	1629	2529	46	663	15	243	8	-1
13	2023-03-21	0	0	6045	734	1176	1629	2677	46	817	33	142	49	-1
14	2023-03-20	0	0	9762	745	1292	1629	2684	46	763	31	242	8	-1
15	2023-03-19	0	0	2115	170	435	1629	1973	47	824	0	135	0	-1
16	2023-03-18	0	0	11038	787	1260	1629	2694	48	655	17	169	61	-1
17	2023-03-18	0	0	11038	787	1260	1629	2694	48	655	17	169	61	-1
18	2023-03-17	0	0	7122	499	971	1629	2459	47	665	6	226	8	-1
19	2023-03-17	0	0	7122	499	971	1629	2459	47	665	6	226	8	-1
20	2023-03-16	0	0	6333	491	908	1629	2419	48	782	25	168	20	-1
21	2023-03-15	0	0	10704	1059	1631	1629	3035	48	687	60	182	60	-1
22	2023-03-14	0	0	5562	311	614	1629	2251	49	884	4	147	6	-1
23	2023-03-13	0	0	9003	972	1624	1629	2976	48	654	33	255	50	-1
24	2023-03-12	0	0	1805	167	414	1629	1982	49	870	0	122	0	-1
25	2023-03-11	0	0	7740	772	1221	1629	2682	47	716	31	145	52	-1
26	2023-03-10	0	0	7115	502	890	1629	2400	48	849	13	166	22	-1
27	2023-03-08	0	0	8962	628	1140	1629	2575	49	770	13	223	24	-1
28	2023-03-07	0	0	7602	846	1322	1629	2770	48	850	11	152	75	-1
29	2023-03-06	0	0	994	80	224	1629	1813	49	897	0	73	0	-1
30	2023-03-05	0	0	8954	569	965	1629	2438	49	794	26	147	33	-1
31	2023-03-04	0	0	5091	596	973	1629	2468	49	758	12	126	53	-1
32	2023-03-03	0	0	7488	726	1303	1629	2690	50	699	58	221	14	-1
33	2023-03-01	0	0	6366	758	1355	1629	2845	50	756	29	259	17	-1
34	2023-02-28	0	0	3267	250	551	1629	2146	50	925	0	150	0	-1
35	2023-02-27	0	0	4809	633	1021	1629	2566	49	796	20	125	53	-1
36	2023-02-26	0	0	4449	342	663	1629	2198	49	797	9	139	16	-1
37	2023-02-25	0	0	7317	745	1146	1629	2623	50	622	32	112	66	-1
38	2023-02-24	0	0	12965	1052	1815	1629	3132	50	656	28	325	40	-1
39	2023-02-23	0	0	8896	656	1238	1629	2655	50	742	5	263	27	-1
40	2023-02-21	0	0	1365	108	268	1629	1962	49	994	0	80	0	-1
41	2023-02-20	0	0	5118	366	847	1629	2314	48	761	0	241	0	-1
42	2023-02-19	0	0	3004	239	525	1629	2105	48	837	0	145	0	-1
43	2023-02-18	0	0	6119	462	844	1629	2360	48	754	17	166	12	-1
44	2023-02-17	0	0	6211	462	828	1629	2346	48	809	12	153	20	-1
45	2023-02-16	0	0	9690	679	1169	1629	2621	49	674	1	241	9	-1
46	2023-02-15	0	0	8018	560	987	1629	2488	49	750	8	190	19	-1
47	2023-02-14	0	0	9030	783	1399	1629	2829	49	664	19	277	16	-1
48	2023-02-13	0	0	9305	770	1298	1629	2794	50	762	19	226	28	-1
49	2023-02-11	0	0	3865	601	875	1629	2443	49	851	8	73	60	-1
50	2023-02-10	0	0	9491	721	1270	1629	2691	50	811	23	231	27	-1
51	2023-02-09	0	0	5864	526	958	1629	2485	50	820	14	205	6	-1
52	2023-02-08	0	0	9264	733	1185	1629	2693	49	759	44	153	38	-1
53	2023-02-07	0	0	5120	505	769	1629	2396	49	901	18	80	38	-1
54	2023-02-05	0	0	4686	372	718	1629	2292	49	861	8	152	16	-1
55	2023-02-04	0	0	1060	91	230	1629	1823	49	904	0	72	0	-1
56	2023-02-03	0	0	7281	455	771	1629	2520	50	951	2	154	8	-1
57	2023-02-02	0	0	9269	796	1302	1629	2866	50	696	25	187	47	-1
58	2023-02-01	0	0	14748	902	1501	1629	3106	50	710	15	261	31	-1
59	2023-01-31	0	0	4270	375	673	1629	2265	50	865	18	115	19	-1
60	2023-01-30	0	0	3133	581	936	1629	2465	51	792	33	104	44	-1
61	2023-01-29	0	0	1259	111	293	1629	1866	51	872	0	92	0	-1
62	2023-01-28	0	0	17994	1112	1642	1629	3069	52	783	40	118	123	-1
63	2023-01-27	0	0	6460	499	898	1629	2390	52	843	28	153	23	-1
64	2023-01-26	0	0	6926	443	879	1629	2467	53	873	25	177	20	-1
65	2023-01-25	0	0	4820	344	687	1629	2251	53	915	0	171	0	-1
66	2023-01-24	0	0	5446	453	955	1629	2465	53	772	0	253	0	-1
67	2023-01-23	0	0	3956	484	892	1629	2454	52	811	23	169	20	-1
68	2023-01-22	0	0	1234	126	308	1629	1978	51	816	0	91	0	-1
69	2023-01-21	0	0	7365	505	868	1629	2381	52	875	13	147	26	-1
70	2023-01-20	0	0	6708	473	911	1629	2442	52	790	10	191	19	-1
71	2023-01-19	0	0	6953	913	1489	1629	2935	50	668	29	220	49	-1
72	2023-01-18	0	0	14101	1062	1658	1629	3222	50	734	62	194	53	-1
73	2023-01-17	0	0	1298	113	297	1629	1981	50	917	0	92	0	-1
74	2023-01-16	0	0	2229	199	490	1629	2148	51	932	0	144	0	-1
75	2023-01-15	0	0	1612	161	380	1629	1981	50	869	0	112	0	-1
76	2023-01-14	0	0	6208	427	755	1629	2305	50	773	13	142	12	-1
77	2023-01-13	0	0	8796	629	1210	1629	2652	50	776	2	275	11	-1
78	2023-01-12	0	0	5354	399	712	1629	2345	50	831	5	137	17	-1
79	2023-01-11	0	0	7588	703	1210	1629	2700	50	717	12	237	14	-1
80	2023-01-10	0	0	2981	229	584	1629	2152	51	824	0	173	0	-1
81	2023-01-09	0	0	1293	108	273	1629	1877	50	989	0	84	0	-1
82	2023-01-08	0	0	8437	628	1141	1629	2583	50	765	9	238	15	-1
83	2023-01-07	0	0	18602	1213	1840	1629	3244	50	707	54	156	117	-1
84	2023-01-06	0	0	2001	169	393	1629	2053	51	912	0	114	0	-1
85	2023-01-04	0	0	874	76	202	1629	1873	50	964	0	64	0	-1
86	2023-01-03	0	0	1236	123	304	1629	1936	50	934	0	91	0	-1
87	2023-01-02	0	0	2817	493	826	1629	2339	50	858	12	123	37	-1
88	2023-01-01	0	0	6362	430	724	1629	2262	51	879	22	96	34	-1
89	2022-12-31	0	0	8697	589	1004	1629	2545	51	823	19	167	26	-1
90	2022-12-30	0	0	13266	881	1399	1629	2833	51	657	32	175	60	-1
91	2022-12-29	0	0	1929	199	444	1629	2048	50	805	0	124	0	-1
92	2022-12-28	0	0	3819	503	861	1629	2427	48	872	13	128	37	-1
93	2022-12-27	0	0	1097	87	217	1629	1831	49	950	0	68	0	-1
94	2022-12-26	0	0	12665	697	1226	1629	2854	49	771	36	209	24	-1
95	2022-12-25	0	0	2655	206	463	1629	2011	50	795	0	132	0	-1
96	2022-12-24	0	0	8074	453	831	1629	2468	50	640	25	154	16	-1
97	2022-12-23	0	0	3548	480	817	1629	2310	49	754	8	120	43	-1
98	2022-12-22	0	0	9445	767	1457	1629	2856	49	594	14	330	10	-1
99	2022-12-21	0	0	8840	579	962	1629	2480	49	778	17	142	38	-1
100	2022-12-20	0	0	2991	595	911	1629	2496	49	865	9	97	53	-1
101	2022-12-19	0	0	1306	134	320	1629	1956	50	832	0	95	0	-1
102	2022-12-18	0	0	7220	1221	2005	1629	3327	50	487	75	277	51	-1
103	2022-12-18	0	0	7220	1221	2005	1629	3327	50	487	75	277	51	-1
104	2022-12-17	0	0	2012	201	457	1629	2014	50	915	0	130	0	-1
105	2022-12-16	0	0	4404	385	741	1629	2296	48	822	12	160	7	-1
106	2022-12-15	0	0	1991	172	439	1629	2099	47	793	0	131	0	-1
107	2022-12-14	0	0	1926	176	417	1629	2000	47	861	0	121	0	-1
108	2022-12-13	0	0	1984	183	447	1629	2127	48	879	0	132	0	-1
109	2022-12-12	0	0	2756	266	595	1629	2241	48	885	0	162	0	-1
110	2022-12-11	0	0	5006	377	708	1629	2315	47	801	22	120	23	-1
111	2022-12-10	0	0	2213	177	439	1629	2079	47	874	0	129	0	-1
112	2022-12-09	0	0	1210	118	272	1629	2007	47	861	0	78	0	-1
113	2022-12-08	0	0	13085	1164	1777	1629	3215	47	659	71	161	88	-1
114	2022-12-07	0	0	8277	991	1582	1629	3010	47	605	55	194	53	-1
115	2022-12-06	0	0	8223	727	1284	1629	2791	48	807	15	247	20	-1
116	2022-12-05	0	0	4718	692	1141	1629	2662	46	711	19	167	44	-1
117	2022-12-04	0	0	5043	416	779	1629	2331	45	843	17	146	18	-1
118	2022-12-03	0	0	2354	406	700	1629	2253	45	740	8	112	29	-1
119	2022-12-02	0	0	2138	199	452	1629	2097	45	784	7	117	3	-1
120	2022-12-01	0	0	4505	298	618	1629	2220	45	817	6	145	10	-1
121	2022-11-30	0	0	3419	505	924	1629	2462	44	770	21	162	28	-1
122	2022-11-29	0	0	8383	555	965	1629	2478	44	856	13	180	19	-1
123	2022-11-28	0	0	4268	342	685	1629	2301	45	914	0	172	0	-1
124	2022-11-27	0	0	1683	155	398	1629	1994	45	872	0	123	0	-1
125	2022-11-25	0	0	3787	391	773	1629	2269	45	844	2	185	9	-1
126	2022-11-24	0	0	2053	177	456	1629	2032	45	868	0	143	0	-1
127	2022-11-23	0	0	8807	639	1112	1629	2566	45	781	21	191	29	-1
128	2022-11-22	0	0	8418	575	1074	1629	2535	46	816	11	223	18	-1
129	2022-11-21	0	0	1898	163	425	1629	2005	46	907	0	132	0	-1
130	2022-11-20	0	0	12684	815	1352	1629	2786	47	779	19	205	53	-1
131	2022-11-19	0	0	14211	1038	1790	1629	3090	46	432	50	300	33	-1
132	2022-11-18	0	0	2358	208	519	1629	2069	46	823	0	157	0	-1
133	2022-11-17	0	0	8956	394	777	1629	2539	47	861	10	175	7	-1
134	2022-11-16	0	0	14218	1193	1897	1629	3259	47	702	70	238	50	-1
135	2022-11-15	0	0	9512	686	1205	1629	2694	47	822	26	209	30	-1
136	2022-11-14	0	0	2341	169	417	1629	1978	47	944	0	125	0	-1
137	2022-11-13	0	0	11793	936	1422	1629	2864	48	716	36	164	57	-1
138	2022-11-12	0	0	13253	805	1288	1629	2704	49	595	42	131	74	-1
139	2022-11-11	0	0	3980	315	581	1629	2148	48	860	10	110	18	-1
140	2022-11-10	0	0	5694	738	1181	1629	2676	48	769	21	142	64	-1
141	2022-11-09	0	0	8973	554	947	1629	2565	49	808	10	168	24	-1
142	2022-11-08	0	0	9176	644	1173	1629	2621	50	826	19	218	27	-1
143	2022-11-07	0	0	6265	726	1198	1629	2645	51	647	39	149	51	-1
144	2022-11-06	0	0	8497	708	1291	1629	2766	53	744	23	261	15	-1
145	2022-11-05	0	0	11897	959	1758	1629	3093	53	547	17	375	13	-1
146	2022-11-04	0	0	5649	509	946	1629	2454	51	794	5	208	8	-1
147	2022-11-03	0	0	10609	857	1362	1629	3033	51	759	21	167	69	-1
148	2022-11-02	0	0	8152	626	1069	1629	2595	50	828	26	161	38	-1
149	2022-11-01	0	0	4991	273	566	1629	2246	49	933	0	147	0	-1
150	2022-10-31	0	0	2931	244	572	1629	2163	51	858	0	164	0	-1
151	2022-10-30	0	0	10914	1011	1575	1629	2993	51	725	51	170	73	-1
152	2022-10-29	0	0	7677	555	963	1629	2503	51	729	20	150	36	-1
153	2022-10-27	0	0	9545	830	1236	1629	2761	50	801	27	119	60	-1
154	2022-10-26	0	0	3899	286	557	1629	2149	50	838	0	137	0	-1
155	2022-10-25	0	0	4785	578	864	1629	2427	50	866	10	76	60	-1
156	2022-10-24	0	0	1446	125	309	1629	1904	50	892	0	94	0	-1
157	2022-10-23	0	0	9120	733	1356	1629	2727	51	691	20	279	18	-1
158	2022-10-22	0	0	6639	499	886	1629	2390	50	834	16	171	11	-1
159	2022-10-21	0	0	4608	727	1074	1629	2634	50	811	9	100	68	-1
160	2022-10-20	0	0	9293	728	1297	1629	2768	49	892	38	226	29	-1
161	2022-10-19	0	0	8157	662	1138	1629	2672	49	784	13	211	18	-1
162	2022-10-18	0	0	7058	616	1091	1629	2671	49	829	32	178	33	-1
163	2022-10-17	0	0	1826	149	364	1629	2020	48	961	0	108	0	-1
164	2022-10-16	0	0	6795	710	1062	1629	2546	48	786	36	93	52	-1
165	2022-10-15	0	0	9048	801	1355	1629	2795	48	738	27	223	33	-1
166	2022-10-14	0	0	5972	638	1076	1629	2607	47	824	17	168	37	-1
167	2022-10-13	0	0	2012	156	378	1629	2018	46	907	0	110	0	-1
168	2022-10-12	0	0	9119	867	1344	1629	2790	46	754	37	136	73	-1
169	2022-10-12	0	0	9119	867	1344	1629	2790	46	754	37	136	73	-1
170	2022-10-11	0	0	7676	557	957	1629	2486	47	904	3	194	10	-1
171	2022-10-10	0	0	1530	147	355	1629	1975	47	925	0	106	0	-1
172	2022-10-09	0	0	2052	188	449	1629	2039	47	849	0	130	0	-1
173	2022-10-08	0	0	11054	878	1527	1629	2900	47	625	13	306	15	-1
174	2022-10-06	0	0	11673	955	1559	1629	2982	46	633	48	205	55	-1
175	2022-10-05	0	0	9237	623	1103	1629	2609	45	834	16	198	31	-1
176	2022-10-04	0	0	11835	1133	1697	1629	3130	44	777	36	158	97	-1
177	2022-10-03	0	0	2313	215	507	1629	2129	44	884	0	147	0	-1
178	2022-10-02	0	0	12719	1069	1737	1629	3089	43	655	65	222	57	-1
179	2022-10-01	0	0	4222	601	905	1629	2387	43	816	13	85	59	-1
180	2022-09-30	0	0	3760	335	669	1629	2220	43	803	2	159	8	-1
181	2022-09-29	0	0	7350	497	929	1629	2428	44	765	0	217	0	-1
182	2022-09-28	0	0	7126	528	898	1629	2424	44	834	13	147	29	-1
183	2022-09-27	0	0	7851	663	1099	1629	2619	45	885	35	146	40	-1
184	2022-09-26	0	0	1289	120	298	1629	1901	45	918	0	91	0	-1
185	2022-09-25	0	0	10978	1030	1623	1629	3019	45	693	12	234	60	-1
186	2022-09-24	0	0	3006	214	486	1629	2019	46	628	0	138	0	-1
187	2022-09-23	0	0	8674	978	1564	1629	2937	45	664	41	205	59	-1
188	2022-09-22	0	0	10235	783	1292	1629	2739	46	709	17	202	42	-1
189	2022-09-21	0	0	6894	507	921	1629	2463	47	896	12	179	21	-1
190	2022-09-20	0	0	6721	511	954	1629	2517	47	818	5	199	18	-1
191	2022-09-18	0	0	3794	444	911	1634	2389	45	700	20	211	3	-1
192	2022-09-17	0	0	4960	360	654	1634	2217	44	796	14	116	18	-1
193	2022-09-16	0	0	8423	1207	1967	1634	3298	43	498	33	286	69	-1
194	2022-09-16	0	0	8423	1207	1967	1634	3298	43	498	33	286	69	-1
195	2022-09-15	0	0	9250	755	1324	1634	2746	43	675	33	207	49	-1
196	2022-09-14	0	0	12066	1089	1684	1634	3063	43	737	28	206	75	-1
197	2022-09-13	0	0	7154	521	971	1634	2502	44	825	2	217	8	-1
198	2022-09-12	0	0	5473	656	1047	1634	2585	43	820	10	130	58	-1
199	2022-09-11	0	0	2251	187	456	1634	2017	43	838	0	136	0	-1
200	2022-09-10	0	0	15707	1148	1889	1634	3164	44	656	59	282	45	-1
201	2022-09-09	0	0	5726	423	933	1634	2363	45	681	0	259	0	-1
202	2022-09-08	0	0	14705	982	1696	1634	3024	45	573	18	302	41	-1
203	2022-09-07	0	0	11597	1074	1677	1634	3060	44	645	23	206	77	-1
204	2022-09-06	0	0	12243	1199	1803	1634	3211	43	739	24	195	92	-1
205	2022-09-05	0	0	4351	329	810	1634	2254	43	645	0	238	0	-1
206	2022-09-04	0	0	16899	1081	1774	1634	3056	44	701	54	235	70	-1
207	2022-09-03	0	0	7712	593	1185	1634	2571	45	650	16	277	7	-1
208	2022-09-02	0	0	13055	922	1760	1634	3016	45	610	21	395	13	-1
209	2022-09-01	0	0	9900	817	1435	1634	2823	43	460	45	227	42	-1
210	2022-09-01	0	0	9900	817	1435	1634	2823	43	460	45	227	42	-1
211	2022-08-31	0	0	16456	1203	2127	1634	3332	43	575	29	392	48	-1
212	2022-08-30	0	0	14295	984	1613	1634	3002	44	671	34	233	57	-1
213	2022-08-29	0	0	9897	659	1094	1634	2543	46	845	25	149	49	-1
214	2022-08-27	0	0	1269	156	356	1634	1947	48	885	0	102	0	-1
215	2022-08-26	0	0	20352	1235	2033	1634	3315	47	514	46	269	90	-1
216	2022-08-25	0	0	20064	1226	1911	1634	3220	48	569	47	194	112	-1
217	2022-08-23	0	0	456	41	111	1634	1724	48	852	0	37	0	-1
218	2022-08-22	0	0	10123	628	1119	1634	2522	49	711	11	211	32	-1
219	2022-08-20	0	0	15353	982	1593	1634	2950	48	656	63	193	56	-1
220	2022-08-19	0	0	19206	1146	1699	1634	3049	49	609	46	121	120	-1
221	2022-08-18	0	0	12909	824	1457	1634	2801	51	573	35	234	56	-1
222	2022-08-17	0	0	13994	1018	1724	1634	3079	52	650	54	265	46	-1
223	2022-08-16	0	0	8548	722	1230	1634	2706	54	824	41	195	27	-1
224	2022-08-15	0	0	9641	734	1268	1634	2813	51	755	10	234	30	-1
225	2022-08-14	0	0	7122	594	1088	1634	2615	50	738	3	243	6	-1
226	2022-08-13	0	0	6232	484	999	1634	2472	49	803	0	259	0	-1
227	2022-08-12	0	0	11568	1227	1964	1634	3391	48	627	27	272	76	-1
228	2022-08-11	0	0	8804	1038	1658	1634	3115	48	1009	21	221	74	-1
229	2022-08-09	0	0	8852	1014	1648	1634	3046	49	634	34	228	62	-1
230	2022-08-08	0	0	12772	1322	2018	1634	3382	49	574	19	250	89	-1
231	2022-08-07	0	0	8985	864	1499	1634	2931	50	792	26	293	11	-1
232	2022-08-06	0	0	8955	690	1375	1634	2704	48	479	16	327	5	-1
233	2022-08-06	0	0	8955	690	1375	1634	2704	48	479	16	327	5	-1
234	2022-08-05	0	0	19144	1768	2769	1634	3967	48	562	72	350	92	-1
235	2022-08-04	0	0	7944	819	1293	1634	2851	46	798	28	143	67	-1
236	2022-08-03	0	0	6157	848	1287	1634	2868	44	846	13	137	76	-1
237	2022-08-02	0	0	2832	256	604	1634	2226	45	883	0	171	0	-1
238	2022-08-01	0	0	6571	1096	1662	1634	3162	45	724	18	171	98	-1
239	2022-07-31	0	0	5412	513	1048	1634	2595	47	770	14	257	1	-1
240	2022-07-30	0	0	10884	796	1415	1634	2768	47	642	29	272	19	-1
241	2022-07-29	0	0	4065	292	645	1634	2228	47	772	0	178	0	-1
242	2022-07-29	0	0	4065	292	645	1634	2228	47	772	0	178	0	-1
243	2022-07-28	0	0	3509	349	750	1634	2353	46	854	0	202	0	-1
244	2022-07-27	0	0	2422	300	650	1634	2206	47	766	0	177	0	-1
245	2022-07-26	0	0	4194	412	797	1634	2346	48	886	8	188	0	-1
246	2022-07-25	0	0	2681	209	512	1634	2056	48	883	0	149	0	-1
247	2022-07-24	0	0	2752	229	477	1634	2012	50	864	0	125	0	-1
248	2022-07-23	0	0	6997	522	1117	1634	2521	51	600	3	286	7	-1
249	2022-07-22	0	0	5228	480	932	1634	2427	52	765	0	226	0	-1
250	2022-07-21	0	0	9216	709	1193	1634	2630	54	689	34	188	30	-1
251	2022-07-20	0	0	5118	341	726	1634	2207	56	825	0	190	0	-1
252	2022-07-19	0	0	2666	237	538	1634	2116	54	877	9	141	3	-1
253	2022-07-18	0	0	5755	831	1208	1634	2684	53	791	18	102	78	-1
254	2022-07-17	0	0	7247	723	1209	1634	2657	55	775	20	171	54	-1
255	2022-07-16	0	0	8584	624	1171	1634	2649	55	753	27	242	9	-1
256	2022-07-15	0	0	972	74	185	1634	1812	57	997	0	56	0	-1
257	2022-07-14	0	0	5557	1004	1459	1634	2921	54	750	22	134	81	-1
258	2022-07-13	0	0	8388	560	959	1634	2481	55	888	13	152	36	-1
259	2022-07-12	0	0	8962	1159	1772	1634	3179	54	562	22	216	75	-1
260	2022-07-11	0	0	7426	948	1473	1634	2945	53	806	16	185	66	-1
261	2022-07-10	0	0	10686	725	1208	1634	2684	53	748	14	179	49	-1
262	2022-07-08	0	0	3431	279	577	1634	2204	50	843	0	148	0	-1
263	2022-07-07	0	0	1693	152	374	1634	2040	50	938	0	111	0	-1
264	2022-07-06	0	0	2095	190	455	1634	2087	50	831	0	132	0	-1
265	2022-07-05	0	0	1997	148	375	1634	2006	49	903	0	111	0	-1
266	2022-07-04	0	0	1658	212	448	1634	2005	50	714	16	105	0	-1
267	2022-07-03	0	0	4703	366	715	1634	2297	50	1011	4	171	6	-1
268	2022-07-01	0	0	2480	213	503	1634	2084	49	647	0	146	0	-1
269	2022-07-01	0	0	2480	213	503	1634	2084	49	647	0	146	0	-1
270	2022-06-30	0	0	2400	204	503	1634	2136	48	893	0	148	0	-1
271	2022-06-29	0	0	1925	220	454	1634	2063	48	745	0	119	0	-1
272	2022-06-28	0	0	2026	348	658	1634	2216	49	813	0	156	0	-1
273	2022-06-27	0	0	2720	192	489	1634	1999	50	768	0	152	0	-1
274	2022-06-26	0	0	2598	193	457	1634	1987	52	810	0	134	0	-1
275	2022-06-25	0	0	6422	446	845	1634	2324	53	693	10	193	1	-1
276	2022-06-24	0	0	3616	276	604	1634	2126	55	1059	0	166	0	-1
277	2022-06-23	0	0	6500	991	1518	1634	2992	54	724	16	192	62	-1
278	2022-06-22	0	0	7606	1122	1707	1634	3204	51	668	9	197	92	-1
279	2022-06-21	0	0	4408	354	781	1634	2317	49	742	0	212	0	-1
280	2022-06-20	0	0	6146	799	1244	1634	2740	49	688	29	129	68	-1
281	2022-06-19	0	0	4781	562	1074	1634	2589	47	693	10	255	0	-1
282	2022-06-18	0	0	5128	373	709	1634	2238	47	745	0	170	0	-1
283	2022-06-17	0	0	8899	871	1459	1634	2918	45	684	20	227	54	-1
284	2022-06-15	0	0	8523	1050	1621	1634	3029	44	695	14	191	86	-1
285	2022-06-14	0	0	5069	440	834	1634	2324	45	677	0	200	0	-1
286	2022-06-13	0	0	2818	224	497	1634	2075	46	795	0	136	0	-1
287	2022-06-12	0	0	7137	600	1216	1634	2602	46	581	29	283	1	-1
288	2022-06-11	0	0	3523	241	571	1634	2097	47	776	0	168	0	-1
289	2022-06-10	0	0	7529	509	998	1634	2441	46	704	3	238	8	-1
290	2022-06-09	0	0	637	43	107	1634	1720	47	924	0	32	0	-1
291	2022-06-07	0	0	2342	294	610	1634	2154	48	835	2	148	9	-1
292	2022-06-06	0	0	3251	282	564	1634	2110	49	823	0	146	0	-1
293	2022-06-05	0	0	18867	1370	1945	1634	3312	49	592	23	152	125	-1
294	2022-06-04	0	0	6564	489	1073	1634	2465	48	673	0	295	0	-1
295	2022-06-02	0	0	4264	364	819	1634	2278	47	718	0	228	0	-1
296	2022-06-01	0	0	6944	525	1086	1634	2516	48	772	8	277	2	-1
297	2022-05-31	0	0	8595	983	1538	1634	2983	48	703	6	197	80	-1
298	2022-05-30	0	0	2715	221	483	1634	2029	48	821	0	134	0	-1
299	2022-05-29	0	0	6528	473	958	1634	2454	49	725	13	221	13	-1
300	2022-05-28	0	0	6907	517	1024	1634	2530	46	612	3	227	23	-1
301	2022-05-27	0	0	12901	1135	1647	1634	3069	46	719	34	122	105	-1
302	2022-05-26	0	0	6075	782	1254	1634	2748	45	752	14	157	68	-1
303	2022-05-25	0	0	13066	1212	2006	1634	3290	46	555	28	306	73	-1
304	2022-05-24	0	0	3417	274	516	1634	2121	46	780	11	110	4	-1
305	2022-05-23	0	0	6044	883	1366	1634	2871	45	699	2	170	74	-1
306	2022-05-22	0	0	3454	254	555	1634	2089	46	849	0	153	0	-1
307	2022-05-21	0	0	12021	976	1850	1634	3054	47	482	37	393	19	-1
308	2022-05-20	0	0	15375	1109	2053	1634	3205	48	552	51	402	26	-1
309	2022-05-19	0	0	8316	772	1495	1634	2816	48	637	55	309	2	-1
310	2022-05-18	0	0	9653	1021	1748	1634	3072	48	621	13	276	74	-1
311	2022-05-17	0	0	7261	997	1524	1634	2963	48	771	41	156	80	-1
312	2022-05-16	0	0	2616	201	492	1634	2065	48	881	0	145	0	-1
313	2022-05-15	0	0	2946	249	588	1634	2151	49	844	0	166	0	-1
314	2022-05-14	0	0	5621	739	1064	1634	2596	47	880	9	89	73	-1
315	2022-05-13	0	0	2236	172	400	1634	1995	47	898	0	114	0	-1
316	2022-05-12	0	0	4069	647	989	1634	2523	48	810	2	119	55	-1
317	2022-05-11	0	0	2644	180	407	1634	1986	48	861	0	115	0	-1
318	2022-05-10	0	0	9070	769	1309	1634	2725	49	709	28	204	44	-1
319	2022-05-09	0	0	6096	767	1189	1634	2658	49	688	7	136	75	-1
320	2022-05-08	0	0	1773	145	378	1634	1932	50	822	0	120	0	-1
321	2022-05-06	0	0	12286	1178	1874	1634	3228	46	560	37	228	91	-1
322	2022-05-05	0	0	9569	884	1360	1634	2814	46	708	10	153	78	-1
323	2022-05-04	0	0	7546	762	1146	1634	2628	46	792	12	111	74	-1
324	2022-05-03	0	0	6020	926	1293	1634	2753	45	835	11	91	87	-1
325	2022-05-02	0	0	2769	223	527	1634	2087	46	903	0	153	0	-1
326	2022-05-01	0	0	9709	994	1556	1634	2999	46	632	20	187	78	-1
327	2022-04-30	0	0	6756	837	1344	1634	2788	46	700	10	175	72	-1
328	2022-04-29	0	0	2197	190	466	1634	2074	44	921	0	140	0	-1
329	2022-04-28	0	0	5322	759	1164	1634	2674	45	724	7	137	62	-1
330	2022-04-27	0	0	1422	111	283	1634	1884	46	790	0	90	0	-1
331	2022-04-26	0	0	5085	620	890	1634	2398	47	915	7	70	60	-1
332	2022-04-25	0	0	3108	408	764	1634	2309	47	696	15	169	0	-1
333	2022-04-24	0	0	8040	1051	1639	1634	3093	45	704	14	194	91	-1
334	2022-04-23	0	0	5443	412	806	1634	2260	46	793	24	173	2	-1
335	2022-04-22	0	0	6068	662	1105	1634	2566	47	675	14	154	60	-1
336	2022-04-21	0	0	3639	326	751	1634	2254	48	913	0	218	0	-1
337	2022-04-20	0	0	6257	803	1192	1634	2665	49	740	7	121	75	-1
338	2022-04-19	0	0	6472	746	1137	1634	2608	49	745	9	119	71	-1
339	2022-04-18	0	0	8800	875	1404	1634	2999	49	679	13	189	67	-1
340	2022-04-17	0	0	2024	162	432	1634	1972	50	826	0	135	0	-1
341	2022-04-16	0	0	13942	1176	1773	1634	3157	50	588	32	156	116	-1
342	2022-04-15	0	0	12124	1093	1660	1634	3036	50	685	68	164	66	-1
343	2022-04-14	0	0	6216	744	1209	1634	2665	50	724	21	156	61	-1
344	2022-04-13	0	0	1343	120	269	1634	1897	52	891	0	76	0	-1
345	2022-04-12	0	0	732	277	491	1634	2140	50	835	11	102	0	-1
346	2022-04-11	0	0	4848	337	662	1634	2183	50	843	17	130	17	-1
347	2022-04-10	0	0	5841	656	907	1634	2458	50	835	10	52	69	-1
348	2022-04-09	0	0	4880	327	746	1634	2241	49	861	0	213	0	-1
349	2022-04-08	0	0	7609	1029	1622	1634	3074	48	660	12	218	75	-1
350	2022-04-06	0	0	7836	921	1401	1634	2887	48	614	17	166	67	-1
351	2022-04-06	0	0	7836	921	1401	1634	2887	48	614	17	166	67	-1
352	2022-04-05	0	0	2729	230	512	1634	2152	47	823	0	141	0	-1
353	2022-04-04	0	0	7267	883	1433	1634	2902	46	720	2	207	72	-1
354	2022-04-03	0	0	1541	130	335	1634	1891	47	803	0	105	0	-1
355	2022-04-02	0	0	6966	466	893	1634	2360	47	751	9	197	12	-1
356	2022-04-01	0	0	3122	280	657	1634	2219	48	784	0	189	0	-1
357	2022-03-31	0	0	3934	289	682	1634	2194	49	759	0	198	0	-1
358	2022-03-30	0	0	5549	776	1120	1634	2664	48	785	21	89	69	-1
359	2022-03-29	0	0	2327	197	495	1634	2083	48	743	0	150	0	-1
360	2022-03-28	0	0	9040	600	1147	1634	2603	49	734	24	209	38	-1
361	2022-03-27	0	0	19010	1317	2115	1634	3392	49	582	57	266	91	-1
362	2022-03-26	0	0	20827	1270	2115	1634	3406	48	605	41	301	89	-1
363	2022-03-25	0	0	24529	1812	2878	1634	4032	48	452	113	309	120	-1
364	2022-03-24	0	0	8107	1045	1645	1634	3125	46	678	9	233	64	-1
365	2022-03-23	0	0	8099	317	741	1634	3109	46	721	0	216	0	-1
366	2022-03-22	0	0	1441	115	300	1634	1875	46	835	0	95	0	-1
367	2022-03-19	0	0	8920	679	1362	1634	2750	47	818	12	324	7	-1
368	2022-03-18	0	0	5003	343	728	1634	2230	46	830	0	190	0	-1
369	2022-03-17	0	0	4687	604	983	1634	2453	46	815	5	140	52	-1
370	2022-03-16	0	0	5772	780	1190	1634	2691	46	811	7	135	68	-1
371	2022-03-15	0	0	2790	180	442	1634	2003	46	858	0	131	0	-1
372	2022-03-14	0	0	6546	1040	1577	1634	2995	46	717	24	166	88	-1
373	2022-03-13	0	0	3528	271	544	1634	2128	47	927	4	123	11	-1
374	2022-03-12	0	0	1117	98	222	1634	1883	46	986	0	64	0	-1
375	2022-03-11	0	0	5710	913	1373	1634	2898	44	742	25	148	65	-1
376	2022-03-10	0	0	1736	136	361	1634	1936	44	811	0	113	0	-1
377	2022-03-09	0	0	1355	98	240	1634	1862	44	1007	0	71	0	-1
378	2022-03-08	0	0	7444	940	1430	1634	2890	44	671	28	154	71	-1
379	2022-03-07	0	0	1418	116	315	1634	1902	44	972	0	100	0	-1
380	2022-03-06	0	0	1273	106	295	1634	1861	45	802	0	95	0	-1
381	2022-03-05	0	0	6308	766	1145	1634	2637	46	704	13	113	70	-1
382	2022-03-05	0	0	6308	766	1145	1634	2637	46	704	13	113	70	-1
383	2022-03-03	0	0	5895	799	1238	1634	2706	46	791	3	153	67	-1
384	2022-03-02	0	0	5950	808	1158	1634	2671	46	850	9	93	79	-1
385	2022-03-01	0	0	5470	688	1038	1634	2532	47	869	10	107	65	-1
386	2022-02-28	0	0	2530	256	502	1634	2042	49	960	8	117	0	-1
387	2022-02-27	0	0	8689	547	945	1634	2436	50	701	12	138	50	-1
388	2022-02-26	0	0	2962	220	563	1634	2078	49	826	0	169	0	-1
389	2022-02-25	0	0	1421	104	260	1634	1866	49	1015	0	79	0	-1
390	2022-02-24	0	0	5835	846	1307	1634	2760	48	820	16	160	63	-1
391	2022-02-23	0	0	5352	680	967	1634	2509	49	776	2	75	71	-1
392	2022-02-22	0	0	7367	767	1248	1634	2702	49	763	21	167	59	-1
393	2022-02-21	0	0	9693	898	1541	1634	2878	49	665	76	236	19	-1
394	2022-02-20	0	0	7917	1068	1675	1634	3115	48	653	19	215	75	-1
395	2022-02-19	0	0	10657	762	1485	1634	2780	47	611	25	342	3	-1
396	2022-02-18	0	0	6616	438	782	1634	2327	47	837	14	122	38	-1
397	2022-02-17	0	0	5635	898	1327	1634	2846	46	779	2	146	74	-1
398	2022-02-16	0	0	6561	926	1348	1634	2851	45	797	26	119	72	-1
399	2022-02-15	0	0	1420	118	313	1634	1924	46	887	0	98	0	-1
400	2022-02-14	0	0	5792	708	1079	1634	2600	47	784	7	121	64	-1
401	2022-02-13	0	0	10283	668	1182	1634	2593	48	704	27	177	54	-1
402	2022-02-12	0	0	3675	384	773	1634	2298	47	735	9	188	1	-1
403	2022-02-11	0	0	731	70	177	1634	1768	47	933	0	55	0	-1
404	2022-02-10	0	0	2737	243	499	1634	2078	47	808	0	129	0	-1
405	2022-02-09	0	0	1601	121	309	1634	1905	47	869	0	96	0	-1
406	2022-02-08	0	0	5201	643	1001	1634	2543	47	798	11	120	52	-1
407	2022-02-07	0	0	5787	543	1083	1634	2514	46	838	17	255	2	-1
408	2022-02-06	0	0	5358	714	1072	1634	2609	46	776	7	115	64	-1
409	2022-02-05	0	0	5384	750	1104	1634	2609	46	837	18	92	72	-1
410	2022-02-04	0	0	4368	553	785	1634	2305	46	909	11	46	63	-1
411	2022-02-03	0	0	1475	130	348	1634	1946	47	798	0	111	0	-1
412	2022-02-02	0	0	5554	655	1094	1634	2572	47	755	17	164	45	-1
413	2022-02-01	0	0	5915	721	1149	1634	2618	47	836	7	148	63	-1
414	2022-01-31	0	0	1849	177	414	1634	2009	46	895	0	121	0	-1
415	2022-01-30	0	0	6108	906	1384	1634	2866	46	766	15	179	56	-1
416	2022-01-29	0	0	2091	151	317	1634	1902	47	964	0	84	0	-1
417	2022-01-28	0	0	5116	720	996	1634	2502	45	805	12	64	70	-1
418	2022-01-27	0	0	5561	669	1049	1634	2546	45	707	4	129	61	-1
419	2022-01-26	0	0	6300	483	939	1634	2401	46	752	0	234	0	-1
420	2022-01-25	0	0	6380	738	1113	1634	2589	46	805	11	121	62	-1
421	2022-01-24	0	0	1875	148	400	1634	1974	47	830	0	126	0	-1
422	2022-01-23	0	0	8398	1073	1700	1634	3081	46	647	34	229	62	-1
423	2022-01-22	0	0	11041	1087	1702	1634	3096	46	465	21	218	76	-1
424	2022-01-21	0	0	6147	841	1238	1634	2736	44	792	3	120	78	-1
425	2022-01-20	0	0	4864	392	834	1634	2333	43	782	3	209	10	-1
426	2022-01-19	0	0	1643	131	332	1634	1947	43	803	0	104	0	-1
427	2022-01-18	0	0	6594	913	1391	1634	2884	43	732	7	164	74	-1
428	2022-01-17	0	0	2641	191	444	1634	2003	44	903	0	129	0	-1
429	2022-01-16	0	0	1434	134	329	1634	1894	43	1245	0	101	0	-1
430	2022-01-15	0	0	2857	220	408	1634	1988	43	841	2	91	7	-1
431	2022-01-14	0	0	1353	111	285	1634	1948	43	883	0	88	0	-1
432	2022-01-13	0	0	2504	208	434	1634	1993	43	885	0	118	0	-1
433	2022-01-12	0	0	1203	100	276	1634	1859	44	880	0	89	0	-1
434	2022-01-11	0	0	6109	781	1208	1634	2700	44	787	3	147	66	-1
435	2022-01-10	0	0	1289	115	281	1634	1873	45	948	0	83	0	-1
436	2022-01-09	0	0	4203	349	747	1634	2249	45	814	0	198	0	-1
437	2022-01-08	0	0	5876	422	827	1634	2420	45	720	5	190	7	-1
438	2022-01-07	0	0	18360	1268	1896	1634	3262	45	1052	28	198	94	-1
439	2022-01-06	0	0	9355	703	1277	1634	2713	45	675	5	281	5	-1
440	2022-01-05	0	0	5235	387	798	1634	2315	44	747	6	193	8	-1
441	2022-01-04	0	0	20958	1577	2435	1634	3728	44	653	54	302	83	-1
442	2022-01-03	0	0	5342	363	684	1634	2203	45	890	3	155	7	-1
443	2022-01-02	0	0	18695	1283	1975	1634	3382	45	666	11	247	94	-1
444	2022-01-01	0	0	6446	472	812	1634	2390	46	887	17	147	8	-1
445	2021-12-31	0	0	12911	924	1723	1634	3022	45	462	17	372	16	-1
446	2021-12-30	0	0	23055	1441	2195	1634	3533	45	590	17	272	96	-1
447	2021-12-29	0	0	13611	993	1769	1634	3088	46	657	33	350	13	-1
448	2021-12-28	0	0	3627	266	612	1634	2150	47	791	5	162	7	-1
449	2021-12-27	0	0	15482	994	1491	1634	2957	48	760	10	149	96	-1
450	2021-12-26	0	0	8694	737	1419	1634	2816	49	560	29	293	20	-1
451	2021-12-25	0	0	5876	446	945	1634	2482	50	838	3	239	7	-1
452	2021-12-24	0	0	6822	749	1142	1634	2630	49	744	18	124	61	-1
453	2021-12-23	0	0	6449	756	1162	1634	2708	48	834	7	127	72	-1
454	2021-12-22	0	0	2209	165	434	1634	1995	49	905	0	132	0	-1
455	2021-12-21	0	0	6594	781	1272	1634	2734	49	705	11	174	68	-1
456	2021-12-20	0	0	2930	232	569	1634	2120	49	745	0	167	0	-1
457	2021-12-20	0	0	2930	232	569	1634	2120	49	745	0	167	0	-1
458	2021-12-19	0	0	14054	1080	1680	1634	3074	48	631	13	228	64	-1
459	2021-12-18	0	0	5770	811	1195	1634	2695	48	576	8	106	83	-1
460	2021-12-17	0	0	3511	298	741	1634	2287	48	845	0	218	0	-1
461	2021-12-16	0	0	5111	376	836	1634	2339	46	760	7	226	1	-1
462	2021-12-15	0	0	5855	758	1147	1634	2666	46	817	12	116	72	-1
463	2021-12-14	0	0	4070	547	756	1634	2279	47	933	11	36	63	-1
464	2021-12-13	0	0	5269	714	1041	1633	2561	48	803	11	92	67	-1
465	2021-12-12	0	0	1600	112	272	1633	1849	49	938	0	82	0	-1
466	2021-12-11	0	0	3999	284	601	1633	2119	50	887	0	158	0	-1
467	2021-12-10	0	0	1151	97	258	1633	1870	50	905	0	81	0	-1
468	2021-12-09	0	0	5397	623	933	1633	2439	51	834	18	83	61	-1
469	2021-12-08	0	0	13237	953	1349	1633	2883	50	758	9	111	82	-1
470	2021-12-06	0	0	876	76	196	1633	1826	50	872	0	62	0	-1
471	2021-12-05	0	0	15651	1157	1680	1633	3152	49	620	12	166	86	-1
472	2021-12-04	0	0	10460	1061	1651	1633	3047	48	666	18	213	72	-1
473	2021-12-03	0	0	6835	433	769	1633	2302	48	1017	11	126	33	-1
474	2021-12-02	0	0	6109	633	956	1633	2553	48	816	17	91	58	-1
475	2021-12-01	0	0	6251	789	1158	1633	2734	47	710	10	113	72	-1
476	2021-11-30	0	0	5010	624	938	1633	2504	47	736	10	86	66	-1
477	2021-11-29	0	0	1288	110	262	1633	1935	46	882	0	77	0	-1
478	2021-11-28	0	0	13648	1029	1447	1633	3007	45	738	10	115	88	-1
479	2021-11-27	0	0	5788	701	1083	1633	2577	45	758	10	118	69	-1
480	2021-11-26	0	0	7419	966	1446	1633	2897	45	687	9	158	80	-1
481	2021-11-25	0	0	5405	646	996	1633	2512	45	799	14	101	64	-1
482	2021-11-24	0	0	5082	606	883	1633	2439	45	865	8	70	66	-1
483	2021-11-23	0	0	5771	964	1426	1633	2904	45	678	16	142	80	-1
484	2021-11-22	0	0	1990	191	403	1633	1963	45	876	0	110	0	-1
485	2021-11-21	0	0	12488	829	1084	1633	2598	45	850	4	42	86	-1
486	2021-11-20	0	0	4086	321	659	1633	2192	44	794	0	174	0	-1
487	2021-11-19	0	0	5647	672	1027	1633	2548	43	755	17	106	63	-1
488	2021-11-18	0	0	6291	804	1206	1633	2717	44	771	14	119	73	-1
489	2021-11-17	0	0	5386	830	1165	1633	2729	45	859	10	85	80	-1
490	2021-11-16	0	0	1151	225	431	1633	2051	45	876	1	95	11	-1
491	2021-11-15	0	0	7239	460	767	1632	2291	45	820	19	102	39	-1
492	2021-11-14	0	0	12729	929	1286	1632	2814	45	850	7	95	82	-1
493	2021-11-13	0	0	5882	944	1399	1632	2862	44	640	20	124	92	-1
494	2021-11-12	0	0	5941	870	1258	1631	2758	45	775	15	111	77	-1
495	2021-11-10	0	0	5425	650	922	1626	2519	44	809	8	61	71	-1
496	2021-11-09	0	0	5848	759	1115	1615	2628	44	831	8	100	76	-1
497	2021-10-24	0	0	11518	629	896	1483	2473	45	782	3	90	58	-1
498	2021-10-23	0	0	6118	295	549	1485	2092	44	671	12	129	5	-1
499	2021-10-23	0	0	6118	295	549	1485	2092	44	671	12	129	5	-1
500	2021-10-22	0	0	6418	451	741	1487	2237	45	769	10	130	26	-1
501	2021-10-21	0	0	7241	679	1077	1490	2452	44	761	6	162	59	-1
502	2021-10-17	0	0	546	61	132	1521	1623	44	804	0	42	0	-1
503	2021-10-16	34	11	6223	540	726	1548	2174	44	808	10	33	58	-1
504	2021-10-15	49	16	7778	532	767	1630	2346	45	1058	1	71	48	-1
505	2021-10-14	0	0	3644	249	558	1629	2194	45	873	0	157	0	-1
506	2021-10-14	0	0	3644	249	558	1629	2194	45	873	0	157	0	-1
507	2021-10-13	40	13	10107	804	1239	1629	2873	45	770	7	149	66	-1
508	2021-10-12	49	16	10012	802	1279	1629	2824	47	738	14	179	48	-1
509	2021-10-11	0	0	4192	234	605	1629	2207	49	904	0	185	0	-1
510	2021-10-10	18	6	7200	467	933	1629	2457	51	1102	0	237	0	-1
511	2021-10-07	0	0	2358	169	411	1629	1993	48	795	0	120	0	-1
512	2021-10-06	46	15	7894	631	994	1629	2554	49	1238	7	132	47	-1
513	2021-10-05	27	9	7250	771	1270	1629	2710	48	669	6	189	60	-1
514	2021-10-03	27	9	6473	399	694	1629	2249	50	683	16	105	32	-1
515	2021-10-03	27	9	6473	399	694	1629	2249	50	683	16	105	32	-1
516	2021-10-02	30	10	7800	714	1097	1629	2685	50	1158	16	116	62	-1
517	2021-09-30	24	8	6690	570	926	1630	2540	50	869	9	120	52	-1
518	2021-09-26	52	17	5411	304	579	1629	2141	50	855	13	119	11	-1
519	2021-09-25	27	9	4955	493	707	1629	2254	48	1224	9	45	55	-1
520	2021-09-22	52	17	7558	614	913	1629	2529	50	928	14	86	53	-1
521	2021-09-17	24	8	4736	433	679	1634	2254	52	824	9	81	37	-1
522	2021-09-16	3	1	4640	351	695	1634	2352	49	775	0	175	0	-1
523	2021-09-12	27	9	5088	694	1015	1634	2580	48	844	27	77	63	-1
524	2021-09-11	37	12	9645	182	374	1634	2527	48	1039	0	97	0	-1
525	2021-09-08	24	8	5726	514	716	1634	2449	46	909	3	45	55	-1
526	2021-09-07	18	6	5006	529	774	1634	2370	46	843	4	64	56	-1
527	2021-09-02	67	22	7730	636	975	1634	2667	47	844	4	120	50	-1
528	2021-09-01	24	8	6880	489	746	1634	2510	47	922	9	72	47	-1
529	2021-08-28	24	8	4145	552	812	1634	2369	46	939	11	66	56	-1
530	2021-08-27	37	12	7029	584	931	1634	2711	45	1102	0	155	22	-1
531	2021-08-25	24	8	5586	507	767	1634	2324	44	1001	5	84	43	-1
532	2021-08-11	12	4	5424	471	770	1634	2355	46	878	7	108	39	-1
533	2021-08-10	12	4	4791	494	711	1634	2334	48	978	2	47	59	-1
534	2021-08-08	27	9	5070	462	625	1634	2277	49	1021	2	26	56	-1
535	2021-08-06	15	5	5613	513	800	1634	2453	48	897	7	97	44	-1
536	2021-08-02	0	0	2234	91	236	1634	1968	51	1175	0	73	0	-1
537	2021-07-29	24	8	5718	540	871	1634	2547	51	919	7	116	45	-1
538	2021-07-26	0	0	1898	66	177	1634	1938	50	1243	0	55	0	-1
539	2021-07-25	27	9	6183	523	801	1634	2431	51	815	1	88	52	-1
540	2021-07-23	12	4	6498	610	929	1634	2596	50	894	6	101	57	-1
541	2021-07-22	27	9	5612	604	848	1634	2541	51	925	3	59	64	-1
542	2021-07-15	24	8	8017	498	784	1634	2539	49	899	19	89	37	-1
543	2021-07-14	24	8	6388	513	805	1634	2562	50	868	2	94	52	-1
544	2021-07-13	24	8	6221	712	1112	1634	2645	50	841	3	142	59	-1
545	2021-07-10	27	9	5311	456	731	1634	2425	48	1164	17	99	27	-1
546	2021-07-09	24	8	6319	550	893	1634	2566	47	1195	4	119	49	-1
547	2021-07-08	27	9	6920	902	1372	1634	2955	47	800	28	140	73	-1
548	2021-07-06	27	9	7407	631	958	1633	2723	48	872	8	87	71	-1
549	2021-07-04	46	15	6273	679	977	1633	2594	49	877	5	81	68	-1
550	2021-07-03	0	0	2685	227	514	1632	2128	48	775	0	144	0	-1
551	2021-07-02	24	8	6053	623	954	1631	2620	48	869	16	98	56	-1
552	2021-07-01	27	9	6559	554	938	1628	2513	48	779	8	144	43	-1
553	2021-06-30	27	9	7402	719	1182	1629	2750	49	810	3	176	57	-1
554	2021-06-26	0	0	2628	232	448	1627	2078	50	1108	0	108	0	-1
555	2021-06-25	24	8	7814	775	1238	1624	2791	51	823	19	161	58	-1
556	2021-06-22	34	11	5898	284	549	1629	2300	50	1255	0	134	0	-1
557	2021-06-21	27	9	9868	656	928	1635	2979	48	756	8	68	66	-1
558	2021-06-19	15	5	11967	457	682	1648	2721	49	932	12	75	29	-1
559	2021-06-16	18	6	9415	380	651	1647	2734	47	1032	8	115	21	-1
560	2021-06-13	49	16	16910	701	1189	1648	3059	49	739	38	180	38	-1
561	2021-06-08	30	10	7446	510	837	1648	2645	50	885	12	130	31	-1
562	2021-06-06	110	36	21141	808	1333	1648	3207	49	669	88	162	23	-1
563	2021-06-05	61	20	18568	1014	1590	1648	3484	48	632	39	195	68	-1
564	2021-06-03	30	10	7643	453	818	1648	2542	47	1150	9	162	20	-1
565	2021-05-30	494	162	24626	822	1290	1648	3432	46	776	32	163	52	-1
566	2021-05-26	58	19	10289	537	858	1648	2710	47	902	1	137	32	-1
567	2021-05-21	40	13	14562	1174	1638	1648	3646	49	834	16	105	122	-1
568	2021-05-20	21	7	8188	508	891	1647	2392	49	750	10	156	37	-1
569	2021-05-17	24	8	6276	680	998	1648	2561	50	919	7	87	71	-1
570	2021-05-15	24	8	5416	627	893	1648	2508	50	1204	13	69	58	-1
571	2021-05-13	0	0	3127	257	543	1648	2196	50	898	15	134	0	-1
572	2021-05-12	24	8	5983	598	923	1648	2566	50	877	6	104	62	-1
573	2021-05-11	24	8	6661	700	1053	1648	2687	50	880	4	121	64	-1
574	2021-05-08	24	8	6490	772	1174	1648	2735	50	1163	18	119	70	-1
575	2021-05-07	30	10	6569	661	983	1648	2643	49	860	7	103	61	-1
576	2021-05-06	27	9	6814	727	1140	1648	2713	49	846	8	152	59	-1
577	2021-05-04	24	8	6228	640	985	1647	2653	49	850	10	112	59	-1
578	2021-05-03	27	9	5930	613	973	1648	2549	49	850	14	116	56	-1
579	2021-05-02	67	22	11080	790	1173	1648	2708	50	1102	8	142	51	-1
580	2021-05-01	0	0	1993	324	512	1647	2131	50	1030	4	64	32	-1
581	2021-04-29	24	8	6271	638	962	1648	2637	49	806	5	98	66	-1
582	2021-04-27	24	8	6125	732	1118	1648	2726	48	864	16	122	66	-1
583	2021-04-26	21	7	6389	504	740	1648	2571	47	961	19	57	47	-1
584	2021-04-25	43	14	7682	553	823	1647	2452	47	791	3	102	39	-1
585	2021-04-23	0	0	2753	178	404	1648	2076	47	1232	0	123	0	-1
586	2021-04-22	34	11	6939	667	1088	1647	2601	47	810	16	154	54	-1
587	2021-04-21	27	9	5496	617	870	1647	2518	47	917	3	61	67	-1
588	2021-04-19	21	7	6304	494	695	1647	2546	47	1014	2	54	50	-1
589	2021-04-17	0	0	2353	421	627	1647	2244	47	822	8	68	35	-1
590	2021-04-15	21	7	6473	653	997	1647	2645	47	825	5	117	61	-1
591	2021-04-13	24	8	6935	882	1273	1647	2853	47	850	7	118	78	-1
592	2021-04-09	27	9	6311	672	1037	1647	2651	47	1058	23	113	54	-1
593	2021-04-08	24	8	7165	619	908	1647	2578	46	934	9	87	57	-1
594	2021-04-07	34	11	7272	674	988	1647	2601	47	914	2	96	64	-1
595	2021-04-05	24	8	6685	597	932	1647	2584	47	857	19	108	48	-1
596	2021-04-04	27	9	8775	714	1049	1647	2831	47	749	4	104	67	-1
597	2021-04-02	27	9	6273	573	868	1646	2522	49	830	7	95	54	-1
598	2021-03-30	55	18	8314	967	1415	1646	3030	48	833	7	160	75	-1
599	2021-03-29	0	0	2492	136	298	1646	2006	48	1019	0	84	0	-1
600	2021-03-28	34	11	6398	715	1051	1645	2591	48	877	6	98	69	-1
601	2021-03-24	27	9	8420	763	1169	1644	2926	49	950	3	135	67	-1
602	2021-03-20	27	9	5746	591	832	1637	2429	46	892	7	51	65	-1
603	2021-03-18	24	8	5905	650	1001	1614	2593	46	999	20	98	62	-1
604	2021-03-17	27	9	5734	626	944	1614	2515	46	907	8	88	67	-1
605	2021-03-16	24	8	6293	544	866	1614	2516	47	904	1	117	46	-1
606	2021-03-14	21	7	5614	493	788	1614	2287	45	804	16	107	31	-1
607	2021-03-12	24	8	6212	514	746	1615	2491	45	929	6	64	51	-1
608	2021-03-10	27	9	6097	594	954	1613	2537	45	825	12	125	50	-1
609	2021-03-08	27	9	5561	368	593	1616	2337	45	1110	3	77	34	-1
610	2021-03-07	18	6	5569	400	635	1619	2228	44	845	12	83	28	-1
611	2021-03-04	24	8	6122	440	740	1619	2362	44	867	7	115	30	-1
612	2021-03-03	52	17	7384	694	1108	1609	2581	45	852	6	163	43	-1
613	2021-02-28	27	9	6677	525	838	1620	2484	44	740	5	125	32	-1
614	2021-02-27	24	8	5102	329	564	1614	2211	43	860	0	110	11	-1
615	2021-02-26	37	12	6547	460	788	1620	2494	42	818	2	126	38	-1
616	2021-02-25	24	8	6313	410	757	1614	2341	43	774	2	157	16	-1
617	2021-02-24	37	12	7517	507	930	1616	2428	43	850	6	191	21	-1
618	2021-02-22	27	9	6183	543	933	1612	2545	44	953	7	165	28	-1
619	2021-02-21	34	11	7384	460	805	1612	2425	44	846	1	168	10	-1
620	2021-02-20	27	9	5410	474	750	1612	2354	44	817	2	113	29	-1
621	2021-02-18	24	8	6544	643	1124	1610	2572	44	800	25	179	43	-1
622	2021-02-17	27	9	5814	432	751	1614	2330	45	877	5	138	23	-1
623	2021-02-15	0	0	2082	144	374	1610	1970	45	876	0	119	0	-1
624	2021-02-14	21	7	5704	470	729	1609	2270	45	837	7	80	46	-1
625	2021-02-13	27	9	5500	490	716	1607	2341	45	1090	0	80	38	-1
626	2021-02-11	21	7	6641	575	993	1600	2523	44	803	6	193	20	-1
627	2021-02-10	24	8	6073	588	877	1600	2481	45	912	10	86	57	-1
628	2021-02-09	27	9	6914	514	854	1600	2465	45	843	2	148	27	-1
629	2021-02-06	21	7	5014	474	704	1600	2255	47	866	7	70	43	-1
630	2021-02-05	58	19	9655	615	968	1600	2493	46	817	2	142	40	-1
631	2021-02-01	37	12	6057	692	1038	1602	2513	47	1020	19	106	58	-1
632	2021-01-31	30	10	4923	473	681	1602	2202	46	761	6	51	53	-1
633	2021-01-29	30	10	7291	659	1050	1606	2622	46	1128	6	149	47	-1
634	2021-01-28	61	20	8279	532	882	1606	2432	46	821	1	144	36	-1
635	2021-01-27	30	10	5805	526	891	1606	2429	46	696	10	137	42	-1
636	2021-01-25	21	7	8213	759	1275	1609	2722	48	898	10	203	52	-1
637	2021-01-24	58	19	7833	428	591	1609	2197	47	893	1	54	32	-1
638	2021-01-22	85	28	8741	589	863	1610	2474	48	897	7	89	46	-1
639	2021-01-21	30	10	6436	611	950	1610	2532	47	721	7	120	48	-1
640	2021-01-19	24	8	4709	383	556	1611	2192	43	862	6	51	33	-1
641	2021-01-17	0	0	4580	581	1029	1611	2464	42	983	10	179	39	-1
642	2021-01-15	0	0	1470	219	367	1611	1957	43	924	18	40	16	-1
643	2021-01-13	0	0	1944	385	643	1611	2222	42	808	4	101	29	-1
644	2021-01-07	183	60	24638	767	1172	1611	3491	42	817	7	147	54	-1
645	2021-01-05	159	52	19668	1014	1635	1611	3226	44	636	30	236	58	-1
646	2021-01-01	155	51	11133	613	1201	1611	2850	46	795	5	297	0	-1
647	2020-12-30	192	63	18223	770	1189	1612	3064	43	838	8	146	61	-1
648	2020-12-28	171	56	19480	849	1370	1612	3153	45	899	12	208	50	-1
649	2020-12-23	40	13	7545	613	899	1612	2572	45	817	12	83	56	-1
650	2020-12-21	21	7	4549	435	618	1612	2272	44	1225	4	54	39	-1
651	2020-12-19	64	21	9487	669	1100	1612	2647	44	757	10	172	39	-1
652	2020-12-17	21	7	5239	550	835	1613	2431	44	859	2	97	48	-1
653	2020-12-16	24	8	5235	540	722	1614	2409	45	858	3	35	56	-1
654	2020-12-15	27	9	5651	476	744	1614	2316	45	858	6	93	40	-1
655	2020-12-12	30	10	5290	336	534	1626	2201	44	916	3	71	26	-1
656	2020-12-09	24	8	5612	562	886	1626	2448	45	883	1	114	50	-1
657	2020-12-08	43	14	7838	762	1126	1626	2723	46	759	9	133	49	-1
658	2020-12-07	40	13	11291	856	1316	1626	2873	47	1092	22	148	68	-1
659	2020-12-05	37	12	6724	592	929	1626	2532	46	713	7	115	52	-1
660	2020-12-02	24	8	5442	419	670	1626	2367	47	1216	5	95	27	-1
661	2020-12-01	21	7	7014	546	975	1626	2533	46	824	5	179	33	-1
662	2020-11-30	21	7	6225	328	605	1626	2398	46	1049	2	121	17	-1
663	2020-11-25	27	9	5405	549	813	1626	2486	46	906	2	83	51	-1
664	2020-11-24	24	8	6340	331	493	1626	2396	46	928	5	46	31	-1
665	2020-11-21	27	9	4696	411	559	1626	2172	47	1050	12	28	40	-1
666	2020-11-20	30	10	6031	311	479	1626	2330	47	917	1	72	14	-1
667	2020-11-19	24	8	5703	471	700	1626	2398	48	904	2	66	49	-1
668	2020-11-16	15	5	4380	282	375	1626	2127	50	1206	1	27	21	-1
669	2020-11-11	24	8	4726	462	684	1626	2356	46	1240	4	64	44	-1
670	2020-11-08	24	8	3344	234	519	1626	2046	46	1141	0	144	0	-1
671	2020-11-06	174	57	7702	416	763	1626	2438	48	1124	18	144	17	-1
672	2020-11-04	18	6	5845	356	493	1626	2324	46	866	7	30	33	-1
673	2020-11-03	24	8	6302	288	535	1626	2363	47	829	3	111	10	-1
674	2020-10-28	24	8	5182	450	652	1626	2349	45	1003	3	56	45	-1
675	2020-10-25	85	28	9865	575	745	1626	2544	46	849	0	39	50	-1
676	2020-10-20	27	9	6843	211	295	1626	2245	46	957	0	28	15	-1
677	2020-10-19	21	7	5872	372	582	1626	2287	47	865	7	70	32	-1
678	2020-10-18	49	16	11179	483	722	1626	2635	48	849	0	103	22	-1
679	2020-10-16	18	6	6197	34	52	1626	2214	48	951	0	9	0	-1
680	2020-10-13	46	15	7746	481	657	1626	2678	49	976	1	38	50	-1
681	2020-10-12	15	5	6079	143	280	1626	2191	49	941	0	71	0	-1
682	2020-10-09	15	5	6567	63	141	1626	2300	50	1016	0	41	0	-1
683	2020-10-07	18	6	6426	668	1067	1626	2601	51	1165	6	147	50	-1
684	2020-10-03	76	25	7969	600	886	1626	2479	53	1223	3	100	45	-1
685	2020-09-29	67	22	7656	543	860	1626	2444	53	938	6	117	38	-1
686	2020-09-26	67	22	7690	548	739	1626	2262	55	907	2	42	54	-1
687	2020-09-23	0	0	2687	306	587	1626	2186	57	1239	5	117	19	-1
688	2020-09-17	73	24	8016	536	777	1631	2496	54	851	2	80	41	-1
689	2020-09-15	82	27	10170	715	1110	1631	2716	55	865	16	142	44	-1
\.


--
-- TOC entry 3356 (class 0 OID 24608)
-- Dependencies: 219
-- Data for Name: heart_rates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.heart_rates (id, date_time, resting_heart_rate) FROM stdin;
124	2022-04-04	46
125	2022-04-05	47
126	2022-04-06	48
127	2022-04-07	48
128	2022-04-08	48
129	2022-04-09	49
130	2022-04-10	50
131	2022-04-11	50
132	2022-04-12	50
133	2022-04-13	52
134	2022-04-14	50
135	2022-04-15	50
136	2022-04-16	50
137	2022-04-17	50
138	2022-04-18	49
139	2022-04-19	49
140	2022-04-20	49
141	2022-04-21	48
142	2022-04-22	47
143	2022-04-23	46
144	2022-04-24	45
145	2022-04-25	47
146	2022-04-26	47
147	2022-04-27	46
148	2022-04-28	45
149	2022-04-29	44
150	2022-04-30	46
151	2022-05-01	46
152	2022-05-02	46
153	2022-05-03	45
154	2022-05-04	46
155	2022-05-05	46
156	2022-05-06	46
157	2022-05-07	47
158	2022-05-08	50
159	2022-05-09	49
160	2022-05-10	49
161	2022-05-11	48
162	2022-05-12	48
163	2022-05-13	47
164	2022-05-14	47
165	2022-05-15	49
166	2022-05-16	48
167	2022-05-17	48
168	2022-05-18	48
169	2022-05-19	48
170	2022-05-20	48
171	2022-05-21	47
172	2022-05-22	46
173	2022-05-23	45
174	2022-05-24	46
175	2022-05-25	46
176	2022-05-26	45
177	2022-05-27	46
178	2022-05-28	46
179	2022-05-29	49
180	2022-05-30	48
181	2022-05-31	48
182	2022-06-01	48
183	2022-06-02	47
184	2022-06-03	47
185	2022-06-04	48
186	2022-06-05	49
187	2022-06-06	49
188	2022-06-07	48
189	2022-06-08	0
190	2022-06-09	47
191	2022-06-10	46
192	2022-06-11	47
193	2022-06-12	46
194	2022-06-13	46
195	2022-06-14	45
196	2022-06-15	44
197	2022-06-16	44
198	2022-06-17	45
199	2022-06-18	47
200	2022-06-19	47
201	2022-06-20	49
202	2022-06-21	49
203	2022-06-22	51
204	2022-06-23	54
205	2022-06-24	55
206	2022-06-25	53
207	2022-06-26	52
208	2022-06-27	50
209	2022-06-28	49
210	2022-06-29	48
211	2022-06-30	48
212	2022-07-01	49
213	2022-07-02	0
214	2022-07-03	50
215	2022-07-04	50
216	2022-07-05	49
217	2022-07-06	50
218	2022-07-07	50
219	2022-07-08	50
220	2022-07-09	52
221	2022-07-10	53
222	2022-07-11	53
223	2022-07-12	54
224	2022-07-13	55
225	2022-07-14	54
226	2022-07-15	57
227	2022-07-16	55
228	2022-07-17	55
229	2022-07-18	53
230	2022-07-19	54
231	2022-07-20	56
232	2022-07-21	54
233	2022-07-22	52
234	2022-07-23	51
235	2022-07-24	50
236	2022-07-25	48
237	2022-07-26	48
238	2022-07-27	47
239	2022-07-28	46
240	2022-07-29	47
241	2022-07-30	47
242	2022-07-31	47
243	2022-08-01	45
244	2022-08-02	45
245	2022-08-03	44
246	2022-08-04	46
247	2022-08-05	48
248	2022-08-06	48
249	2022-08-07	50
250	2022-08-08	49
251	2022-08-09	49
252	2022-08-10	49
253	2022-08-11	48
254	2022-08-12	48
255	2022-08-13	49
256	2022-08-14	50
257	2022-08-15	51
258	2022-08-16	54
259	2022-08-17	52
260	2022-08-18	51
261	2022-08-19	49
262	2022-08-20	48
263	2022-08-21	49
264	2022-08-22	49
265	2022-08-23	48
266	2022-08-24	49
267	2022-08-25	48
268	2022-08-26	47
269	2022-08-27	48
270	2022-08-28	48
271	2022-08-29	46
272	2022-08-30	44
273	2022-08-31	43
274	2022-09-01	43
275	2022-09-02	45
276	2022-09-03	45
277	2022-09-04	44
278	2022-09-05	43
279	2022-09-06	43
280	2022-09-07	44
281	2022-09-08	45
282	2022-09-09	45
283	2022-09-10	44
284	2022-09-11	43
285	2022-09-12	43
286	2022-09-13	44
287	2022-09-14	43
288	2022-09-15	43
289	2022-09-16	43
290	2022-09-17	44
291	2022-09-18	45
292	2022-09-19	45
293	2022-09-20	47
294	2022-09-21	47
295	2022-09-22	46
296	2022-09-23	45
297	2022-09-24	46
298	2022-09-25	45
299	2022-09-26	45
300	2022-09-27	45
301	2022-09-28	44
302	2022-09-29	44
303	2022-09-30	43
304	2022-10-01	43
305	2022-10-02	43
306	2022-10-03	44
307	2022-10-04	44
308	2022-10-05	45
309	2022-10-06	46
310	2022-10-07	46
311	2022-10-08	47
312	2022-10-09	47
313	2022-10-10	47
314	2022-10-11	47
315	2022-10-12	46
316	2022-10-13	46
317	2022-10-14	47
318	2022-10-15	48
319	2022-10-16	48
320	2022-10-17	48
321	2022-10-18	49
322	2022-10-19	49
323	2022-10-20	49
324	2022-10-21	50
325	2022-10-22	50
326	2022-10-23	51
327	2022-10-24	50
328	2022-10-25	50
329	2022-10-26	50
330	2022-10-27	50
331	2022-10-28	50
332	2022-10-29	51
333	2022-10-30	51
334	2022-10-31	51
335	2022-11-01	49
336	2022-11-02	50
337	2022-11-03	51
338	2022-11-04	51
339	2022-11-05	53
340	2022-11-06	53
341	2022-11-07	51
342	2022-11-08	50
343	2022-11-09	49
344	2022-11-10	48
345	2022-11-11	48
346	2022-11-12	49
347	2022-11-13	48
348	2022-11-14	47
349	2022-11-15	47
350	2022-11-16	47
351	2022-11-17	47
352	2022-11-18	46
353	2022-11-19	46
354	2022-11-20	47
355	2022-11-21	46
356	2022-11-22	46
357	2022-11-23	45
358	2022-11-24	45
359	2022-11-25	45
360	2022-11-26	45
361	2022-11-27	45
362	2022-11-28	45
363	2022-11-29	44
364	2022-11-30	44
365	2022-12-01	45
366	2022-12-02	45
367	2022-12-03	45
368	2022-12-04	45
369	2022-12-05	46
370	2022-12-06	48
371	2022-12-07	47
372	2022-12-08	47
373	2022-12-09	47
374	2022-12-10	47
375	2022-12-11	47
376	2022-12-12	48
377	2022-12-13	48
378	2022-12-14	47
379	2022-12-15	47
380	2022-12-16	48
381	2022-12-17	50
382	2022-12-18	50
383	2022-12-19	50
384	2022-12-20	49
385	2022-12-21	49
386	2022-12-22	49
387	2022-12-23	49
388	2022-12-24	50
389	2022-12-25	50
390	2022-12-26	49
391	2022-12-27	49
392	2022-12-28	48
393	2022-12-29	50
394	2022-12-30	51
395	2022-12-31	51
396	2023-01-01	51
397	2023-01-02	50
398	2023-01-03	50
399	2023-01-04	50
400	2023-01-05	0
401	2023-01-06	51
402	2023-01-07	50
403	2023-01-08	50
404	2023-01-09	50
405	2023-01-10	51
406	2023-01-11	50
407	2023-01-12	50
408	2023-01-13	50
409	2023-01-14	50
410	2023-01-15	50
411	2023-01-16	51
412	2023-01-17	50
413	2023-01-18	50
414	2023-01-19	50
415	2023-01-20	52
416	2023-01-21	52
417	2023-01-22	51
418	2023-01-23	52
419	2023-01-24	53
420	2023-01-25	53
421	2023-01-26	53
422	2023-01-27	52
423	2023-01-28	52
424	2023-01-29	51
425	2023-01-30	51
426	2023-01-31	50
427	2023-02-01	50
428	2023-02-02	50
429	2023-02-03	50
430	2023-02-04	49
431	2023-02-05	49
432	2023-02-06	50
433	2023-02-07	49
434	2023-02-08	49
435	2023-02-09	50
436	2023-02-10	50
437	2023-02-11	49
438	2023-02-12	50
439	2023-02-13	50
440	2023-02-14	49
441	2023-02-15	49
442	2023-02-16	49
443	2023-02-17	48
444	2023-02-18	48
445	2023-02-19	48
446	2023-02-20	48
447	2023-02-21	49
448	2023-02-22	50
449	2023-02-23	50
450	2023-02-24	50
451	2023-02-25	50
452	2023-02-26	49
453	2023-02-27	49
454	2023-02-28	50
455	2023-03-01	50
456	2023-03-02	50
457	2023-03-03	50
458	2023-03-04	49
459	2023-03-05	49
460	2023-03-06	49
461	2023-03-07	48
462	2023-03-08	49
463	2023-03-09	48
464	2023-03-10	48
465	2023-03-11	47
466	2023-03-12	49
467	2023-03-13	48
468	2023-03-14	49
469	2023-03-15	48
470	2023-03-16	48
471	2023-03-17	47
472	2023-03-18	48
473	2023-03-19	47
474	2023-03-20	46
475	2023-03-21	46
476	2023-03-22	46
477	2023-03-23	46
478	2023-03-24	46
479	2023-03-25	47
480	2023-03-26	46
481	2023-03-27	45
482	2023-03-28	45
483	2023-03-29	44
484	2023-03-30	45
485	2023-03-31	45
486	2023-04-01	45
487	2023-04-02	47
488	2023-04-03	46
489	2023-04-04	46
490	2020-04-04	0
491	2020-04-05	0
492	2020-04-06	0
493	2020-04-07	0
494	2020-04-08	0
495	2020-04-09	0
496	2020-04-10	0
497	2020-04-11	0
498	2020-04-12	0
499	2020-04-13	0
500	2020-04-14	0
501	2020-04-15	0
502	2020-04-16	0
503	2020-04-17	0
504	2020-04-18	0
505	2020-04-19	0
506	2020-04-20	0
507	2020-04-21	0
508	2020-04-22	0
509	2020-04-23	0
510	2020-04-24	0
511	2020-04-25	0
512	2020-04-26	0
513	2020-04-27	0
514	2020-04-28	0
515	2020-04-29	0
516	2020-04-30	0
517	2020-05-01	0
518	2020-05-02	0
519	2020-05-03	0
520	2020-05-04	0
521	2020-05-05	0
522	2020-05-06	0
523	2020-05-07	0
524	2020-05-08	0
525	2020-05-09	0
526	2020-05-10	0
527	2020-05-11	0
528	2020-05-12	0
529	2020-05-13	0
530	2020-05-14	0
531	2020-05-15	0
532	2020-05-16	0
533	2020-05-17	0
534	2020-05-18	0
535	2020-05-19	0
536	2020-05-20	0
537	2020-05-21	0
538	2020-05-22	0
539	2020-05-23	0
540	2020-05-24	0
541	2020-05-25	0
542	2020-05-26	0
543	2020-05-27	0
544	2020-05-28	0
545	2020-05-29	0
546	2020-05-30	0
547	2020-05-31	0
548	2020-06-01	0
549	2020-06-02	0
550	2020-06-03	0
551	2020-06-04	0
552	2020-06-05	0
553	2020-06-06	0
554	2020-06-07	0
555	2020-06-08	0
556	2020-06-09	0
557	2020-06-10	0
558	2020-06-11	0
559	2020-06-12	0
560	2020-06-13	0
561	2020-06-14	0
562	2020-06-15	0
563	2020-06-16	0
564	2020-06-17	0
565	2020-06-18	0
566	2020-06-19	0
567	2020-06-20	0
568	2020-06-21	0
569	2020-06-22	0
570	2020-06-23	0
571	2020-06-24	0
572	2020-06-25	0
573	2020-06-26	0
574	2020-06-27	0
575	2020-06-28	0
576	2020-06-29	0
577	2020-06-30	0
578	2020-07-01	0
579	2020-07-02	0
580	2020-07-03	0
581	2020-07-04	0
582	2020-07-05	0
583	2020-07-06	0
584	2020-07-07	0
585	2020-07-08	0
586	2020-07-09	0
587	2020-07-10	0
588	2020-07-11	0
589	2020-07-12	0
590	2020-07-13	0
591	2020-07-14	0
592	2020-07-15	0
593	2020-07-16	0
594	2020-07-17	0
595	2020-07-18	0
596	2020-07-19	0
597	2020-07-20	0
598	2020-07-21	0
599	2020-07-22	0
600	2020-07-23	0
601	2020-07-24	0
602	2020-07-25	0
603	2020-07-26	0
604	2020-07-27	0
605	2020-07-28	0
606	2020-07-29	0
607	2020-07-30	0
608	2020-07-31	0
609	2020-08-01	0
610	2020-08-02	0
611	2020-08-03	0
612	2020-08-04	0
613	2020-08-05	0
614	2020-08-06	0
615	2020-08-07	0
616	2020-08-08	0
617	2020-08-09	0
618	2020-08-10	0
619	2020-08-11	0
620	2020-08-12	0
621	2020-08-13	0
622	2020-08-14	0
623	2020-08-15	0
624	2020-08-16	0
625	2020-08-17	0
626	2020-08-18	0
627	2020-08-19	0
628	2020-08-20	0
629	2020-08-21	0
630	2020-08-22	0
631	2020-08-23	0
632	2020-08-24	0
633	2020-08-25	0
634	2020-08-26	0
635	2020-08-27	0
636	2020-08-28	0
637	2020-08-29	0
638	2020-08-30	0
639	2020-08-31	0
640	2020-09-01	0
641	2020-09-02	0
642	2020-09-03	0
643	2020-09-04	0
644	2020-09-05	0
645	2020-09-06	0
646	2020-09-07	0
647	2020-09-08	58
648	2020-09-09	52
649	2020-09-10	52
650	2020-09-11	52
651	2020-09-12	52
652	2020-09-13	54
653	2020-09-14	55
654	2020-09-15	55
655	2020-09-16	55
656	2020-09-17	54
657	2020-09-18	54
658	2020-09-19	56
659	2020-09-20	58
660	2020-09-21	59
661	2020-09-22	57
662	2020-09-23	57
663	2020-09-24	57
664	2020-09-25	57
665	2020-09-26	55
666	2020-09-27	54
667	2020-09-28	54
668	2020-09-29	53
669	2020-09-30	53
670	2020-10-01	53
671	2020-10-02	52
672	2020-10-03	53
673	2020-10-04	53
674	2020-10-05	52
675	2020-10-06	52
676	2020-10-07	51
677	2020-10-08	0
678	2020-10-09	50
679	2020-10-10	0
680	2020-10-11	50
681	2020-10-12	49
682	2020-10-13	49
683	2020-10-14	0
684	2020-10-15	0
685	2020-10-16	0
686	2020-10-17	0
687	2020-10-18	48
688	2020-10-19	47
689	2020-10-20	46
690	2020-10-21	46
691	2020-10-22	0
692	2020-10-23	48
693	2020-10-24	47
694	2020-10-25	46
695	2020-10-26	0
696	2020-10-27	46
697	2020-10-28	45
698	2020-10-29	46
699	2020-10-30	47
700	2020-10-31	0
701	2020-11-01	0
702	2020-11-02	0
703	2020-11-03	47
704	2020-11-04	46
705	2020-11-05	0
706	2020-11-06	0
707	2020-11-07	45
708	2020-11-08	46
709	2020-11-09	46
710	2020-11-10	0
711	2020-11-11	46
712	2020-11-12	46
713	2020-11-13	0
714	2020-11-14	0
715	2020-11-15	47
716	2020-11-16	50
717	2020-11-17	49
718	2020-11-18	0
719	2020-11-19	48
720	2020-11-20	47
721	2020-11-21	47
722	2020-11-22	0
723	2020-11-23	47
724	2020-11-24	46
725	2020-11-25	46
726	2020-11-26	45
727	2020-11-27	0
728	2020-11-28	0
729	2020-11-29	0
730	2020-11-30	46
731	2020-12-01	46
732	2020-12-02	47
733	2020-12-03	46
734	2020-12-04	46
735	2020-12-05	46
736	2020-12-06	46
737	2020-12-07	47
738	2020-12-08	46
739	2020-12-09	45
740	2020-12-10	0
741	2020-12-11	45
742	2020-12-12	44
743	2020-12-13	43
744	2020-12-14	43
745	2020-12-15	45
746	2020-12-16	45
747	2020-12-17	44
748	2020-12-18	44
749	2020-12-19	44
750	2020-12-20	44
751	2020-12-21	44
752	2020-12-22	0
753	2020-12-23	45
754	2020-12-24	44
755	2020-12-25	0
756	2020-12-26	45
757	2020-12-27	45
758	2020-12-28	45
759	2020-12-29	0
760	2020-12-30	43
761	2020-12-31	43
762	2021-01-01	46
763	2021-01-02	0
764	2021-01-03	0
765	2021-01-04	0
766	2021-01-05	44
767	2021-01-06	44
768	2021-01-07	42
769	2021-01-08	42
770	2021-01-09	43
771	2021-01-10	42
772	2021-01-11	43
773	2021-01-12	42
774	2021-01-13	42
775	2021-01-14	42
776	2021-01-15	43
777	2021-01-16	43
778	2021-01-17	42
779	2021-01-18	42
780	2021-01-19	43
781	2021-01-20	45
782	2021-01-21	47
783	2021-01-22	48
784	2021-01-23	47
785	2021-01-24	47
786	2021-01-25	48
787	2021-01-26	47
788	2021-01-27	46
789	2021-01-28	46
790	2021-01-29	46
791	2021-01-30	46
792	2021-01-31	46
793	2021-02-01	47
794	2021-02-02	0
795	2021-02-03	47
796	2021-02-04	47
797	2021-02-05	46
798	2021-02-06	47
799	2021-02-07	47
800	2021-02-08	46
801	2021-02-09	45
802	2021-02-10	45
803	2021-02-11	44
804	2021-02-12	45
805	2021-02-13	45
806	2021-02-14	45
807	2021-02-15	45
808	2021-02-16	0
809	2021-02-17	45
810	2021-02-18	44
811	2021-02-19	44
812	2021-02-20	44
813	2021-02-21	44
814	2021-02-22	44
815	2021-02-23	44
816	2021-02-24	43
817	2021-02-25	43
818	2021-02-26	42
819	2021-02-27	43
820	2021-02-28	44
821	2021-03-01	44
822	2021-03-02	44
823	2021-03-03	45
824	2021-03-04	44
825	2021-03-05	44
826	2021-03-06	44
827	2021-03-07	44
828	2021-03-08	45
829	2021-03-09	45
830	2021-03-10	45
831	2021-03-11	44
832	2021-03-12	45
833	2021-03-13	46
834	2021-03-14	45
835	2021-03-15	46
836	2021-03-16	47
837	2021-03-17	46
838	2021-03-18	46
839	2021-03-19	0
840	2021-03-20	46
841	2021-03-21	47
842	2021-03-22	48
843	2021-03-23	49
844	2021-03-24	49
845	2021-03-25	49
846	2021-03-26	49
847	2021-03-27	49
848	2021-03-28	48
849	2021-03-29	48
850	2021-03-30	48
851	2021-03-31	48
852	2021-04-01	0
853	2021-04-02	49
854	2021-04-03	48
855	2021-04-04	47
856	2021-04-05	47
857	2021-04-06	47
858	2021-04-07	47
859	2021-04-08	46
860	2021-04-09	47
861	2021-04-10	47
862	2021-04-11	0
863	2021-04-12	47
864	2021-04-13	47
865	2021-04-14	47
866	2021-04-15	47
867	2021-04-16	47
868	2021-04-17	47
869	2021-04-18	47
870	2021-04-19	47
871	2021-04-20	48
872	2021-04-21	47
873	2021-04-22	47
874	2021-04-23	47
875	2021-04-24	46
876	2021-04-25	47
877	2021-04-26	47
878	2021-04-27	48
879	2021-04-28	48
880	2021-04-29	49
881	2021-04-30	51
882	2021-05-01	50
883	2021-05-02	50
884	2021-05-03	49
885	2021-05-04	49
886	2021-05-05	49
887	2021-05-06	49
888	2021-05-07	49
889	2021-05-08	50
890	2021-05-09	50
891	2021-05-10	50
892	2021-05-11	50
893	2021-05-12	50
894	2021-05-13	50
895	2021-05-14	50
896	2021-05-15	50
897	2021-05-16	50
898	2021-05-17	50
899	2021-05-18	50
900	2021-05-19	50
901	2021-05-20	49
902	2021-05-21	49
903	2021-05-22	48
904	2021-05-23	51
905	2021-05-24	49
906	2021-05-25	48
907	2021-05-26	47
908	2021-05-27	0
909	2021-05-28	46
910	2021-05-29	0
911	2021-05-30	46
912	2021-05-31	0
913	2021-06-01	0
914	2021-06-02	47
915	2021-06-03	47
916	2021-06-04	48
917	2021-06-05	48
918	2021-06-06	49
919	2021-06-07	48
920	2021-06-08	50
921	2021-06-09	50
922	2021-06-10	49
923	2021-06-11	50
924	2021-06-12	0
925	2021-06-13	49
926	2021-06-14	48
927	2021-06-15	47
928	2021-06-16	47
929	2021-06-17	0
930	2021-06-18	48
931	2021-06-19	0
932	2021-06-20	47
933	2021-06-21	48
934	2021-06-22	50
935	2021-06-23	50
936	2021-06-24	50
937	2021-06-25	51
938	2021-06-26	50
939	2021-06-27	0
940	2021-06-28	51
941	2021-06-29	50
942	2021-06-30	49
943	2021-07-01	48
944	2021-07-02	48
945	2021-07-03	48
946	2021-07-04	0
947	2021-07-05	0
948	2021-07-06	48
949	2021-07-07	48
950	2021-07-08	47
951	2021-07-09	47
952	2021-07-10	48
953	2021-07-11	50
954	2021-07-12	50
955	2021-07-13	50
956	2021-07-14	50
957	2021-07-15	49
958	2021-07-16	50
959	2021-07-17	50
960	2021-07-18	50
961	2021-07-19	0
962	2021-07-20	50
963	2021-07-21	51
964	2021-07-22	51
965	2021-07-23	50
966	2021-07-24	50
967	2021-07-25	51
968	2021-07-26	50
969	2021-07-27	51
970	2021-07-28	51
971	2021-07-29	51
972	2021-07-30	50
973	2021-07-31	50
974	2021-08-01	52
975	2021-08-02	51
976	2021-08-03	51
977	2021-08-04	51
978	2021-08-05	49
979	2021-08-06	48
980	2021-08-07	0
981	2021-08-08	49
982	2021-08-09	48
983	2021-08-10	48
984	2021-08-11	46
985	2021-08-12	0
986	2021-08-13	0
987	2021-08-14	46
988	2021-08-15	45
989	2021-08-16	44
990	2021-08-17	44
991	2021-08-18	43
992	2021-08-19	42
993	2021-08-20	42
994	2021-08-21	41
995	2021-08-22	43
996	2021-08-23	43
997	2021-08-24	43
998	2021-08-25	44
999	2021-08-26	0
1000	2021-08-27	45
1001	2021-08-28	46
1002	2021-08-29	0
1003	2021-08-30	46
1004	2021-08-31	48
1005	2021-09-01	47
1006	2021-09-02	47
1007	2021-09-03	47
1008	2021-09-04	47
1009	2021-09-05	47
1010	2021-09-06	47
1011	2021-09-07	46
1012	2021-09-08	46
1013	2021-09-09	46
1014	2021-09-10	47
1015	2021-09-11	48
1016	2021-09-12	48
1017	2021-09-13	48
1018	2021-09-14	48
1019	2021-09-15	49
1020	2021-09-16	49
1021	2021-09-17	52
1022	2021-09-18	0
1023	2021-09-19	51
1024	2021-09-20	51
1025	2021-09-21	51
1026	2021-09-22	50
1027	2021-09-23	0
1028	2021-09-24	50
1029	2021-09-25	0
1030	2021-09-26	50
1031	2021-09-27	50
1032	2021-09-28	50
1033	2021-09-29	50
1034	2021-09-30	50
1035	2021-10-01	49
1036	2021-10-02	50
1037	2021-10-03	50
1038	2021-10-04	0
1039	2021-10-05	48
1040	2021-10-06	49
1041	2021-10-07	48
1042	2021-10-08	48
1043	2021-10-09	0
1044	2021-10-10	51
1045	2021-10-11	49
1046	2021-10-12	47
1047	2021-10-13	45
1048	2021-10-14	45
1049	2021-10-15	45
1050	2021-10-16	44
1051	2021-10-17	44
1052	2021-10-18	0
1053	2021-10-19	0
1054	2021-10-20	44
1055	2021-10-21	44
1056	2021-10-22	45
1057	2021-10-23	44
1058	2021-10-24	45
1059	2021-10-25	0
1060	2021-10-26	0
1061	2021-10-27	0
1062	2021-10-28	0
1063	2021-10-29	0
1064	2021-10-30	0
1065	2021-10-31	0
1066	2021-11-01	0
1067	2021-11-02	0
1068	2021-11-03	0
1069	2021-11-04	0
1070	2021-11-05	0
1071	2021-11-06	0
1072	2021-11-07	0
1073	2021-11-08	45
1074	2021-11-09	44
1075	2021-11-10	44
1076	2021-11-11	44
1077	2021-11-12	45
1078	2021-11-13	44
1079	2021-11-14	45
1080	2021-11-15	45
1081	2021-11-16	45
1082	2021-11-17	45
1083	2021-11-18	44
1084	2021-11-19	43
1085	2021-11-20	44
1086	2021-11-21	45
1087	2021-11-22	45
1088	2021-11-23	45
1089	2021-11-24	45
1090	2021-11-25	45
1091	2021-11-26	45
1092	2021-11-27	45
1093	2021-11-28	45
1094	2021-11-29	46
1095	2021-11-30	47
1096	2021-12-01	47
1097	2021-12-02	48
1098	2021-12-03	48
1099	2021-12-04	48
1100	2021-12-05	49
1101	2021-12-06	50
1102	2021-12-07	50
1103	2021-12-08	50
1104	2021-12-09	51
1105	2021-12-10	50
1106	2021-12-11	50
1107	2021-12-12	49
1108	2021-12-13	48
1109	2021-12-14	47
1110	2021-12-15	46
1111	2021-12-16	46
1112	2021-12-17	48
1113	2021-12-18	48
1114	2021-12-19	48
1115	2021-12-20	49
1116	2021-12-21	49
1117	2021-12-22	49
1118	2021-12-23	48
1119	2021-12-24	49
1120	2021-12-25	50
1121	2021-12-26	49
1122	2021-12-27	48
1123	2021-12-28	47
1124	2021-12-29	46
1125	2021-12-30	45
1126	2021-12-31	45
1127	2022-01-01	46
1128	2022-01-02	45
1129	2022-01-03	45
1130	2022-01-04	44
1131	2022-01-05	44
1132	2022-01-06	45
1133	2022-01-07	45
1134	2022-01-08	45
1135	2022-01-09	45
1136	2022-01-10	45
1137	2022-01-11	44
1138	2022-01-12	44
1139	2022-01-13	43
1140	2022-01-14	43
1141	2022-01-15	43
1142	2022-01-16	43
1143	2022-01-17	44
1144	2022-01-18	43
1145	2022-01-19	43
1146	2022-01-20	43
1147	2022-01-21	44
1148	2022-01-22	46
1149	2022-01-23	46
1150	2022-01-24	47
1151	2022-01-25	46
1152	2022-01-26	46
1153	2022-01-27	45
1154	2022-01-28	45
1155	2022-01-29	47
1156	2022-01-30	46
1157	2022-01-31	46
1158	2022-02-01	47
1159	2022-02-02	47
1160	2022-02-03	47
1161	2022-02-04	46
1162	2022-02-05	46
1163	2022-02-06	46
1164	2022-02-07	46
1165	2022-02-08	47
1166	2022-02-09	47
1167	2022-02-10	47
1168	2022-02-11	47
1169	2022-02-12	47
1170	2022-02-13	48
1171	2022-02-14	47
1172	2022-02-15	46
1173	2022-02-16	45
1174	2022-02-17	46
1175	2022-02-18	47
1176	2022-02-19	47
1177	2022-02-20	48
1178	2022-02-21	49
1179	2022-02-22	49
1180	2022-02-23	49
1181	2022-02-24	48
1182	2022-02-25	49
1183	2022-02-26	49
1184	2022-02-27	50
1185	2022-02-28	49
1186	2022-03-01	47
1187	2022-03-02	46
1188	2022-03-03	46
1189	2022-03-04	0
1190	2022-03-05	46
1191	2022-03-06	45
1192	2022-03-07	44
1193	2022-03-08	44
1194	2022-03-09	44
1195	2022-03-10	44
1196	2022-03-11	44
1197	2022-03-12	46
1198	2022-03-13	47
1199	2022-03-14	46
1200	2022-03-15	46
1201	2022-03-16	46
1202	2022-03-17	46
1203	2022-03-18	46
1204	2022-03-19	47
1205	2022-03-20	47
1206	2022-03-21	0
1207	2022-03-22	46
1208	2022-03-23	46
1209	2022-03-24	46
1210	2022-03-25	48
1211	2022-03-26	48
1212	2022-03-27	49
1213	2022-03-28	49
1214	2022-03-29	48
1215	2022-03-30	48
1216	2022-03-31	49
1217	2022-04-01	48
1218	2022-04-02	47
1219	2022-04-03	47
\.


--
-- TOC entry 3354 (class 0 OID 24595)
-- Dependencies: 217
-- Data for Name: sleeps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sleeps (id, date_of_sleep, start_time, end_time, duration, efficiency, is_main_sleep, minutes_after_wakeup, minutes_asleep, minutes_awake, minutes_to_fall_asleep, time_in_bed, deep_sleep, light_sleep, rem_sleep) FROM stdin;
2747	2023-04-03	2023-04-02	2023-04-03	494	97	true 	1	424	70	0	494	74	300	50
2748	2023-04-02	2023-04-02	2023-04-02	280	98	true 	0	259	21	0	280	52	178	29
2749	2023-04-01	2023-03-31	2023-04-01	592	94	true 	0	512	80	0	592	114	353	45
2750	2023-03-31	2023-03-31	2023-03-31	377	98	true 	0	337	40	0	377	84	240	13
2751	2023-03-30	2023-03-30	2023-03-30	444	96	true 	0	380	64	0	444	74	289	17
2752	2023-03-29	2023-03-29	2023-03-29	410	98	true 	0	371	39	0	410	79	236	56
2753	2023-03-27	2023-03-27	2023-03-27	444	97	true 	0	388	56	0	444	69	265	54
2754	2023-03-26	2023-03-26	2023-03-26	432	98	true 	0	365	67	0	432	58	269	38
2755	2023-03-25	2023-03-25	2023-03-25	291	97	true 	0	260	31	0	291	60	156	44
2756	2023-03-24	2023-03-23	2023-03-24	440	98	true 	0	391	49	0	440	50	255	86
2757	2023-03-22	2023-03-21	2023-03-22	511	94	true 	0	437	74	0	511	93	259	85
2758	2023-03-21	2023-03-21	2023-03-21	399	97	true 	0	345	54	0	399	48	247	50
2759	2023-03-19	2023-03-19	2023-03-19	481	97	true 	0	426	55	0	481	60	316	50
2760	2023-03-18	2023-03-18	2023-03-18	470	96	true 	0	410	60	0	470	78	281	51
2761	2023-03-17	2023-03-16	2023-03-17	467	96	true 	1	424	43	0	467	62	327	35
2762	2023-03-16	2023-03-16	2023-03-16	445	96	true 	2	378	67	0	445	49	284	45
2763	2023-03-15	2023-03-15	2023-03-15	451	97	true 	0	396	55	0	451	110	253	33
2764	2023-03-14	2023-03-14	2023-03-14	399	94	true 	0	337	62	0	399	74	235	28
2765	2023-03-13	2023-03-13	2023-03-13	448	94	true 	0	398	50	0	448	72	252	74
2766	2023-03-12	2023-03-12	2023-03-12	508	98	true 	1	397	51	0	508	96	209	92
2767	2023-03-10	2023-03-09	2023-03-10	390	98	true 	0	329	61	0	390	87	242	0
2768	2023-03-08	2023-03-08	2023-03-08	410	95	true 	3	365	45	0	410	53	265	47
2769	2023-03-07	2023-03-07	2023-03-07	352	96	true 	0	312	40	0	352	48	236	28
2770	2023-03-05	2023-03-05	2023-03-05	440	94	true 	1	371	69	0	440	90	261	20
2771	2023-02-26	2023-02-26	2023-02-26	479	97	true 	0	413	66	0	479	100	255	58
2772	2023-02-25	2023-02-24	2023-02-25	608	92	true 	0	511	97	0	608	76	369	66
2773	2023-02-21	2023-02-21	2023-02-21	366	96	true 	0	310	56	0	366	21	247	42
2774	2023-02-19	2023-02-19	2023-02-19	458	96	true 	1	401	57	0	458	73	279	49
2775	2023-02-18	2023-02-17	2023-02-18	491	97	true 	0	439	52	0	491	92	263	84
2776	2023-02-17	2023-02-16	2023-02-17	446	93	true 	0	372	74	0	446	85	249	38
2777	2023-02-16	2023-02-15	2023-02-16	515	97	true 	0	447	68	0	515	85	308	54
2778	2023-02-15	2023-02-14	2023-02-15	473	97	true 	0	414	59	0	473	99	260	55
2779	2023-02-14	2023-02-13	2023-02-14	464	95	true 	0	414	50	0	464	105	268	41
2780	2023-02-13	2023-02-13	2023-02-13	405	96	true 	0	335	70	0	405	19	263	53
2781	2023-02-11	2023-02-11	2023-02-11	448	99	true 	0	381	67	0	448	74	225	82
2782	2023-02-09	2023-02-09	2023-02-09	395	96	true 	0	355	40	0	395	63	239	53
2783	2023-02-08	2023-02-07	2023-02-08	446	94	true 	0	382	64	0	446	78	242	62
2784	2023-02-05	2023-02-05	2023-02-05	403	96	true 	0	337	66	0	403	58	251	28
2785	2023-02-03	2023-02-03	2023-02-03	325	95	true 	0	275	50	0	325	76	199	0
2786	2023-02-02	2023-02-01	2023-02-02	485	96	true 	0	435	50	0	485	76	282	77
2787	2023-02-01	2023-02-01	2023-02-01	423	96	true 	0	369	54	0	423	80	218	71
2788	2023-01-30	2023-01-30	2023-01-30	467	98	true 	0	416	51	0	467	72	303	41
2789	2023-01-27	2023-01-26	2023-01-27	393	96	true 	0	331	62	0	393	38	284	9
2790	2023-01-26	2023-01-26	2023-01-26	345	98	true 	0	306	39	0	345	77	209	20
2791	2023-01-25	2023-01-25	2023-01-25	354	95	true 	0	314	40	0	354	85	189	40
2792	2023-01-24	2023-01-24	2023-01-24	415	94	true 	0	364	51	0	415	81	214	69
2793	2023-01-22	2023-01-22	2023-01-22	533	95	true 	0	450	83	0	533	101	268	81
2794	2023-01-21	2023-01-21	2023-01-21	379	94	true 	0	333	46	0	379	69	208	56
2795	2023-01-20	2023-01-19	2023-01-20	430	92	true 	1	366	64	0	430	83	223	60
2796	2023-01-19	2023-01-19	2023-01-19	474	95	true 	0	415	59	0	474	74	285	56
2797	2023-01-18	2023-01-18	2023-01-18	397	94	true 	0	343	54	0	397	67	229	47
2798	2023-01-17	2023-01-17	2023-01-17	431	97	true 	0	391	40	0	431	55	273	63
2799	2023-01-16	2023-01-16	2023-01-16	364	96	true 	0	312	52	0	364	59	193	60
2800	2023-01-13	2023-01-12	2023-01-13	376	99	true 	0	340	36	0	376	81	181	78
2801	2023-01-12	2023-01-12	2023-01-12	450	98	true 	0	376	74	0	450	71	291	14
2802	2023-01-11	2023-01-11	2023-01-11	460	98	true 	0	419	41	0	460	93	239	87
2803	2023-01-10	2023-01-10	2023-01-10	443	93	true 	0	378	65	0	443	78	282	18
2804	2023-01-09	2023-01-09	2023-01-09	367	97	true 	1	331	36	0	367	57	249	25
2805	2023-01-08	2023-01-08	2023-01-08	413	94	true 	0	358	55	0	413	79	258	21
2806	2023-01-07	2023-01-07	2023-01-07	406	95	true 	1	351	55	0	406	64	227	60
2807	2023-01-06	2023-01-06	2023-01-06	414	98	true 	0	351	63	0	414	81	229	41
2808	2023-01-04	2023-01-04	2023-01-04	412	97	true 	0	357	55	0	412	71	276	10
2809	2023-01-02	2023-01-02	2023-01-02	410	97	true 	0	340	70	0	410	55	253	32
2810	2023-01-01	2023-01-01	2023-01-01	409	94	true 	1	358	51	0	409	80	206	72
2811	2022-12-30	2022-12-29	2022-12-30	516	93	true 	0	437	79	0	516	102	262	73
2812	2022-12-29	2022-12-29	2022-12-29	511	93	true 	0	453	58	0	511	107	258	88
2813	2022-12-27	2022-12-27	2022-12-27	422	95	true 	0	378	44	0	422	59	240	79
2814	2022-12-24	2022-12-23	2022-12-24	605	90	true 	0	507	98	0	605	69	389	49
2815	2022-12-23	2022-12-23	2022-12-23	515	94	true 	0	463	52	0	515	105	291	67
2816	2022-12-21	2022-12-21	2022-12-21	465	98	true 	1	404	61	0	465	65	283	56
2817	2022-12-20	2022-12-20	2022-12-20	416	95	true 	0	352	64	0	416	79	236	37
2818	2022-12-19	2022-12-18	2022-12-19	513	97	true 	0	454	59	0	513	98	278	78
2819	2022-12-18	2022-12-17	2022-12-18	438	97	true 	0	390	48	0	438	91	244	55
2820	2022-12-17	2022-12-17	2022-12-17	395	92	true 	7	337	58	0	395	68	245	24
2821	2022-12-16	2022-12-16	2022-12-16	439	95	true 	0	396	43	0	439	75	285	36
2822	2022-12-14	2022-12-13	2022-12-14	458	96	true 	0	392	66	0	458	109	200	83
2823	2022-12-13	2022-12-13	2022-12-13	429	96	true 	0	368	61	0	429	63	256	49
2824	2022-12-12	2022-12-12	2022-12-12	393	97	true 	0	361	32	0	393	66	245	50
2825	2022-12-11	2022-12-11	2022-12-11	474	97	true 	0	414	60	0	474	74	267	73
2826	2022-12-09	2022-12-09	2022-12-09	501	96	true 	1	427	74	0	501	36	292	99
2827	2022-12-08	2022-12-08	2022-12-08	461	97	true 	1	405	56	0	461	81	263	61
2828	2022-12-07	2022-12-06	2022-12-07	533	96	true 	0	458	75	0	533	85	339	34
2829	2022-12-06	2022-12-06	2022-12-06	351	95	true 	6	300	51	0	351	65	214	21
2830	2022-12-05	2022-12-04	2022-12-05	499	96	true 	0	436	63	0	499	127	278	31
2831	2022-12-04	2022-12-04	2022-12-04	416	97	true 	0	370	46	0	416	57	289	24
2832	2022-12-03	2022-12-02	2022-12-03	551	95	true 	0	485	66	0	551	114	276	95
2833	2022-12-02	2022-12-01	2022-12-02	529	96	true 	0	475	54	0	529	100	302	73
2834	2022-12-01	2022-12-01	2022-12-01	462	98	true 	0	401	61	0	462	96	243	62
2835	2022-11-30	2022-11-30	2022-11-30	459	98	true 	1	402	57	0	459	97	247	58
2836	2022-11-29	2022-11-29	2022-11-29	372	97	true 	2	319	53	0	372	37	246	36
2837	2022-11-28	2022-11-28	2022-11-28	354	96	true 	0	300	54	0	354	50	226	24
2838	2022-11-27	2022-11-27	2022-11-27	445	97	true 	1	383	62	0	445	39	291	53
2839	2022-11-24	2022-11-24	2022-11-24	429	95	true 	0	371	58	0	429	82	243	46
2840	2022-11-23	2022-11-23	2022-11-23	418	98	true 	4	361	57	0	418	90	248	23
2841	2022-11-22	2022-11-22	2022-11-22	372	96	true 	1	326	46	0	372	62	226	38
2842	2022-11-20	2022-11-20	2022-11-20	384	95	true 	0	345	39	0	384	55	274	16
2843	2022-11-14	2022-11-14	2022-11-14	371	95	true 	0	322	49	0	371	56	236	30
2844	2022-11-13	2022-11-13	2022-11-13	467	97	true 	0	420	47	0	467	72	244	104
2845	2022-11-10	2022-11-10	2022-11-10	444	97	true 	0	381	63	0	444	83	294	4
2846	2022-11-08	2022-11-08	2022-11-08	350	97	true 	1	311	39	0	350	36	229	46
2847	2022-11-07	2022-11-06	2022-11-07	554	92	true 	0	450	104	0	554	79	311	60
2848	2022-10-24	2022-10-24	2022-10-24	454	95	true 	0	402	52	0	454	94	279	29
2849	2022-10-23	2022-10-23	2022-10-23	432	95	true 	0	373	59	0	432	97	238	38
2850	2022-10-03	2022-10-03	2022-10-03	409	98	true 	0	376	33	0	409	99	235	42
2851	2022-10-02	2022-10-02	2022-10-02	441	96	true 	0	395	46	0	441	97	267	31
2852	2022-10-01	2022-10-01	2022-10-01	467	99	true 	0	413	54	0	467	66	263	84
2853	2022-09-30	2022-09-30	2022-09-30	468	97	true 	0	416	52	0	468	112	256	48
2854	2022-09-29	2022-09-29	2022-09-29	458	95	true 	0	391	67	0	458	69	312	10
2855	2022-09-28	2022-09-28	2022-09-28	417	98	true 	1	376	41	0	417	68	215	93
2856	2022-09-27	2022-09-27	2022-09-27	334	98	true 	5	273	61	0	334	36	224	13
2857	2022-09-26	2022-09-26	2022-09-26	431	98	true 	0	388	43	0	431	90	226	72
2858	2022-09-25	2022-09-25	2022-09-25	441	98	true 	0	400	41	0	441	55	304	41
2859	2022-09-23	2022-09-23	2022-09-23	471	97	true 	0	397	74	0	471	49	319	29
2860	2022-09-22	2022-09-22	2022-09-22	470	97	true 	0	408	62	0	470	78	303	27
2861	2022-09-20	2022-09-19	2022-09-20	400	96	true 	1	344	56	0	400	35	279	30
2862	2022-09-18	2022-09-18	2022-09-18	506	94	true 	0	458	48	0	506	70	313	75
2863	2022-09-14	2022-09-14	2022-09-14	394	96	true 	1	348	46	0	394	66	238	44
2864	2022-09-13	2022-09-12	2022-09-13	388	97	true 	0	344	44	0	388	49	259	36
2865	2022-09-11	2022-09-11	2022-09-11	466	98	true 	0	388	78	0	466	31	317	40
2866	2022-09-10	2022-09-10	2022-09-10	398	96	true 	1	342	56	0	398	56	243	43
2867	2022-09-09	2022-09-08	2022-09-09	500	99	true 	0	452	48	0	500	70	342	40
2868	2022-09-08	2022-09-07	2022-09-08	506	95	true 	0	447	59	0	506	60	336	51
2869	2022-09-07	2022-09-06	2022-09-07	489	98	true 	1	441	48	0	489	81	317	43
2870	2022-09-06	2022-09-05	2022-09-06	390	99	true 	1	353	37	0	390	45	263	45
2871	2022-09-05	2022-09-04	2022-09-05	557	96	true 	0	488	69	0	557	76	361	51
2872	2022-09-03	2022-09-02	2022-09-03	490	94	true 	0	441	49	0	490	82	297	62
2873	2022-09-02	2022-09-02	2022-09-02	401	97	true 	0	357	44	0	401	76	250	31
2874	2022-09-01	2022-08-31	2022-09-01	498	98	true 	1	452	46	0	498	63	344	45
2875	2022-08-30	2022-08-30	2022-08-30	445	96	true 	4	384	61	0	445	70	309	5
2876	2022-08-29	2022-08-29	2022-08-29	372	97	true 	0	339	33	0	372	14	251	74
2877	2022-08-27	2022-08-27	2022-08-27	453	95	true 	0	399	54	0	453	53	276	70
2878	2022-08-26	2022-08-25	2022-08-26	521	91	true 	0	441	80	0	521	50	331	60
2879	2022-08-25	2022-08-24	2022-08-25	518	92	true 	0	452	66	0	518	89	262	101
2880	2022-08-23	2022-08-22	2022-08-23	551	96	true 	0	496	55	0	551	92	338	66
2881	2022-08-22	2022-08-21	2022-08-22	475	97	true 	0	424	51	0	475	92	269	63
2882	2022-08-20	2022-08-20	2022-08-20	472	98	true 	0	420	52	0	472	23	370	27
2883	2022-08-19	2022-08-18	2022-08-19	544	97	true 	0	469	75	0	544	62	364	43
2884	2022-08-18	2022-08-17	2022-08-18	542	93	true 	0	468	74	0	542	67	386	15
2885	2022-08-17	2022-08-17	2022-08-17	425	91	true 	0	361	64	0	425	105	185	71
2886	2022-08-16	2022-08-16	2022-08-16	353	93	true 	0	314	39	0	353	16	206	92
2887	2022-08-15	2022-08-15	2022-08-15	411	95	true 	3	367	44	0	411	60	228	79
2888	2022-08-13	2022-08-13	2022-08-13	378	95	true 	1	315	63	0	378	73	198	44
2889	2022-08-12	2022-08-11	2022-08-12	438	95	true 	0	381	57	0	438	56	297	28
2890	2022-08-08	2022-08-07	2022-08-08	508	92	true 	0	447	61	0	508	86	300	61
2891	2022-08-03	2022-08-02	2022-08-03	368	97	true 	0	335	33	0	368	46	239	50
2892	2022-08-02	2022-08-02	2022-08-02	386	95	true 	0	341	45	0	386	42	263	36
2893	2022-07-30	2022-07-29	2022-07-30	478	93	true 	0	420	58	0	478	76	261	83
2894	2022-07-29	2022-07-28	2022-07-29	416	94	true 	0	364	52	0	416	68	262	34
2895	2022-07-28	2022-07-28	2022-07-28	384	92	true 	0	339	45	0	384	56	235	48
2896	2022-07-27	2022-07-26	2022-07-27	497	96	true 	1	437	60	0	497	63	309	65
2897	2022-07-26	2022-07-26	2022-07-26	358	98	true 	1	322	36	0	358	58	230	34
2898	2022-07-25	2022-07-24	2022-07-25	408	97	true 	0	355	53	0	408	49	272	34
2899	2022-07-24	2022-07-23	2022-07-24	451	97	true 	1	405	46	0	451	86	233	86
2900	2022-07-23	2022-07-22	2022-07-23	544	94	true 	1	470	74	0	544	76	333	61
2901	2022-07-22	2022-07-21	2022-07-22	449	97	true 	0	405	44	0	449	77	264	64
2902	2022-07-20	2022-07-20	2022-07-20	425	93	true 	0	366	59	0	425	81	234	51
2903	2022-07-19	2022-07-18	2022-07-19	410	93	true 	0	365	45	0	410	34	301	30
2904	2022-07-17	2022-07-16	2022-07-17	420	97	true 	0	360	60	0	420	71	264	25
2905	2022-07-15	2022-07-15	2022-07-15	387	92	true 	0	344	43	0	387	75	236	33
2906	2022-07-14	2022-07-14	2022-07-14	453	95	true 	0	393	60	0	453	75	270	48
2907	2022-07-13	2022-07-12	2022-07-13	351	97	true 	0	316	35	0	351	58	167	91
2908	2022-07-11	2022-07-11	2022-07-11	367	95	true 	1	320	47	0	367	55	224	41
2909	2022-07-07	2022-07-07	2022-07-07	391	98	true 	0	357	34	0	391	58	256	43
2910	2022-07-06	2022-07-06	2022-07-06	477	97	true 	0	400	77	0	477	81	279	40
2911	2022-07-05	2022-07-05	2022-07-05	426	96	true 	0	378	48	0	426	82	257	39
2912	2022-07-04	2022-07-03	2022-07-04	605	93	true 	1	501	104	0	605	119	356	26
2913	2022-07-01	2022-06-30	2022-07-01	555	92	true 	0	466	89	0	555	78	327	61
2914	2022-06-30	2022-06-30	2022-06-30	399	96	true 	3	347	52	0	399	76	216	55
2915	2022-06-29	2022-06-28	2022-06-29	576	93	true 	0	493	83	0	576	120	266	107
2916	2022-06-28	2022-06-28	2022-06-28	471	92	true 	0	383	88	0	471	49	302	32
2917	2022-06-27	2022-06-26	2022-06-27	520	91	true 	0	434	86	0	520	110	300	24
2918	2022-06-26	2022-06-26	2022-06-26	496	93	true 	0	437	59	0	496	80	264	93
2919	2022-06-23	2022-06-23	2022-06-23	446	95	true 	0	396	50	0	446	102	199	95
2920	2022-06-22	2022-06-21	2022-06-22	474	95	true 	1	406	68	0	474	81	278	47
2921	2022-06-21	2022-06-20	2022-06-21	486	96	true 	0	439	47	0	486	106	266	67
2922	2022-06-20	2022-06-19	2022-06-20	526	91	true 	0	462	64	0	526	63	332	67
2923	2022-06-19	2022-06-19	2022-06-19	482	93	true 	6	410	72	0	482	50	287	73
2924	2022-06-18	2022-06-18	2022-06-18	525	94	true 	0	444	81	0	525	64	310	70
2925	2022-06-17	2022-06-17	2022-06-17	455	95	true 	0	397	58	0	455	100	242	55
2926	2022-06-16	2022-06-15	2022-06-16	479	94	true 	0	416	63	0	479	44	328	44
2927	2022-06-15	2022-06-15	2022-06-15	454	98	true 	0	408	46	0	454	68	273	67
2928	2022-06-13	2022-06-12	2022-06-13	509	94	true 	0	453	56	0	509	108	266	79
2929	2022-06-12	2022-06-11	2022-06-12	546	94	true 	0	456	90	0	546	53	359	44
2930	2022-06-10	2022-06-10	2022-06-10	487	96	true 	0	428	59	0	487	83	280	65
2931	2022-06-09	2022-06-08	2022-06-09	484	95	true 	0	431	53	0	484	89	273	69
2932	2022-06-06	2022-06-05	2022-06-06	471	95	true 	0	422	49	0	471	115	222	85
2933	2022-06-02	2022-06-01	2022-06-02	494	94	true 	0	427	67	0	494	105	270	52
2934	2022-06-01	2022-06-01	2022-06-01	381	95	true 	0	335	46	0	381	70	226	39
2935	2022-05-30	2022-05-30	2022-05-30	485	96	true 	0	441	44	0	485	67	334	40
2936	2022-05-29	2022-05-29	2022-05-29	468	96	true 	0	408	60	0	468	72	289	47
2937	2022-05-28	2022-05-27	2022-05-28	575	93	true 	4	491	84	0	575	74	354	63
2938	2022-05-27	2022-05-27	2022-05-27	460	96	true 	0	390	70	0	460	56	295	39
2939	2022-05-26	2022-05-26	2022-05-26	449	96	true 	0	390	59	0	449	69	277	44
2940	2022-05-25	2022-05-24	2022-05-25	478	94	true 	0	403	75	0	478	78	289	36
2941	2022-05-24	2022-05-23	2022-05-24	535	94	true 	0	473	62	0	535	99	294	80
2942	2022-05-22	2022-05-21	2022-05-22	438	94	true 	6	390	48	0	438	78	265	47
2943	2022-05-21	2022-05-20	2022-05-21	509	96	true 	0	452	57	0	509	67	320	65
2944	2022-05-20	2022-05-20	2022-05-20	409	93	true 	1	353	56	0	409	40	279	34
2945	2022-05-19	2022-05-19	2022-05-19	437	97	true 	0	380	57	0	437	71	253	56
2946	2022-05-17	2022-05-17	2022-05-17	392	97	true 	0	352	40	0	392	73	235	44
2947	2022-05-16	2022-05-16	2022-05-16	414	99	true 	0	356	58	0	414	38	307	11
2948	2022-05-15	2022-05-15	2022-05-15	430	95	true 	0	376	54	0	430	99	223	54
2949	2022-05-14	2022-05-14	2022-05-14	389	93	true 	0	346	43	0	389	89	197	60
2950	2022-05-13	2022-05-13	2022-05-13	428	94	true 	0	376	52	0	428	73	303	0
2951	2022-05-12	2022-05-12	2022-05-12	454	96	true 	0	396	58	0	454	55	309	32
2952	2022-05-11	2022-05-11	2022-05-11	464	97	true 	0	420	44	0	464	68	311	41
2953	2022-05-10	2022-05-10	2022-05-10	455	97	true 	0	396	59	0	455	46	326	24
2954	2022-05-09	2022-05-08	2022-05-09	534	96	true 	0	475	59	0	534	59	403	13
2955	2022-05-08	2022-05-08	2022-05-08	498	95	true 	0	428	70	0	498	81	300	47
2956	2022-05-06	2022-05-05	2022-05-06	524	95	true 	0	477	47	0	524	91	340	46
2957	2022-05-05	2022-05-05	2022-05-05	491	93	true 	0	423	68	0	491	72	318	33
2958	2022-05-04	2022-05-04	2022-05-04	451	98	true 	0	410	41	0	451	90	274	46
2959	2022-05-02	2022-05-02	2022-05-02	384	96	true 	0	335	49	0	384	79	215	41
2960	2022-05-01	2022-05-01	2022-05-01	523	95	true 	0	458	65	0	523	100	307	51
2961	2022-04-30	2022-04-30	2022-04-30	483	95	true 	0	432	51	0	483	79	248	105
2962	2022-04-28	2022-04-27	2022-04-28	510	92	true 	7	442	68	0	510	92	319	31
2963	2022-04-22	2022-04-21	2022-04-22	537	96	true 	0	460	77	0	537	65	352	43
2964	2022-04-21	2022-04-21	2022-04-21	309	93	true 	0	209	100	0	309	46	153	10
2965	2022-04-18	2022-04-17	2022-04-18	492	94	true 	0	431	61	0	492	71	314	46
2966	2022-04-16	2022-04-16	2022-04-16	548	97	true 	0	489	59	0	548	119	346	24
2967	2022-04-15	2022-04-15	2022-04-15	457	97	true 	0	405	52	0	457	85	266	54
2968	2022-04-14	2022-04-14	2022-04-14	478	97	true 	0	426	52	0	478	80	262	84
2969	2022-04-13	2022-04-13	2022-04-13	473	95	true 	0	409	64	0	473	95	269	45
2970	2022-04-12	2022-04-11	2022-04-12	492	92	true 	0	433	59	0	492	72	245	116
2971	2022-04-11	2022-04-11	2022-04-11	433	94	true 	0	390	43	0	433	69	263	58
2972	2022-04-10	2022-04-10	2022-04-10	474	98	true 	1	424	50	0	474	89	264	71
2973	2022-04-09	2022-04-09	2022-04-09	366	93	true 	1	328	38	0	366	83	185	60
2974	2022-04-07	2022-04-07	2022-04-07	488	95	true 	1	441	47	0	488	90	267	84
2975	2022-04-05	2022-04-05	2022-04-05	476	95	true 	0	408	68	0	476	69	265	74
2976	2022-04-03	2022-04-03	2022-04-03	532	96	true 	0	475	57	0	532	68	303	104
2977	2022-04-02	2022-04-02	2022-04-02	471	97	true 	1	421	50	0	471	85	319	17
2978	2022-04-01	2022-03-31	2022-04-01	467	95	true 	1	401	66	0	467	69	319	13
2979	2022-03-30	2022-03-30	2022-03-30	476	97	true 	0	404	72	0	476	72	311	21
2980	2022-03-27	2022-03-27	2022-03-27	444	96	true 	0	395	49	0	444	70	270	55
2981	2022-03-26	2022-03-26	2022-03-26	404	99	true 	0	360	44	0	404	70	271	19
2982	2022-03-25	2022-03-25	2022-03-25	446	97	true 	0	409	37	0	446	87	208	114
2983	2022-03-24	2022-03-24	2022-03-24	456	98	true 	0	419	37	0	456	91	253	75
2984	2022-03-22	2022-03-21	2022-03-22	510	92	true 	0	423	87	0	510	87	305	31
2985	2022-03-19	2022-03-18	2022-03-19	279	96	true 	0	254	25	0	279	43	177	34
2986	2022-03-18	2022-03-18	2022-03-18	420	95	true 	0	372	48	0	420	92	236	44
2987	2022-03-17	2022-03-17	2022-03-17	428	97	true 	3	376	52	0	428	80	250	46
2988	2022-03-16	2022-03-16	2022-03-16	419	97	true 	0	365	54	0	419	66	273	26
2989	2022-03-15	2022-03-15	2022-03-15	451	96	true 	1	390	61	0	451	47	314	29
2990	2022-03-14	2022-03-14	2022-03-14	445	95	true 	0	382	63	0	445	98	238	46
2991	2022-03-11	2022-03-10	2022-03-11	460	96	true 	0	397	63	0	460	51	315	31
2992	2022-03-10	2022-03-09	2022-03-10	516	93	true 	0	420	96	0	516	83	299	38
2993	2022-03-09	2022-03-09	2022-03-09	362	96	true 	0	304	58	0	362	80	152	72
2994	2022-03-08	2022-03-07	2022-03-08	516	97	true 	0	451	65	0	516	61	313	77
2995	2022-03-07	2022-03-07	2022-03-07	368	98	true 	5	323	45	0	368	30	266	27
2996	2022-03-06	2022-03-06	2022-03-06	543	96	true 	0	482	61	0	543	85	314	83
2997	2022-03-05	2022-03-05	2022-03-05	476	96	true 	1	420	56	0	476	103	245	72
2998	2022-03-03	2022-03-03	2022-03-03	426	93	true 	0	368	58	0	426	78	245	45
2999	2022-03-01	2022-03-01	2022-03-01	389	98	true 	0	349	40	0	389	61	215	73
3000	2022-02-28	2022-02-28	2022-02-28	355	98	true 	0	319	36	0	355	60	231	28
3001	2022-02-26	2022-02-26	2022-02-26	445	97	true 	0	403	42	0	445	76	247	80
3002	2022-02-25	2022-02-25	2022-02-25	346	97	true 	0	300	46	0	346	36	264	0
3003	2022-02-23	2022-02-22	2022-02-23	516	95	true 	5	437	79	0	516	52	358	27
3004	2022-02-20	2022-02-20	2022-02-20	478	96	true 	0	431	47	0	478	75	272	84
3005	2022-02-19	2022-02-19	2022-02-19	459	96	true 	0	398	61	0	459	92	275	31
3006	2022-02-17	2022-02-17	2022-02-17	439	96	true 	0	399	40	0	439	75	291	33
3007	2022-02-16	2022-02-16	2022-02-16	426	95	true 	0	348	78	0	426	33	291	24
3008	2022-02-15	2022-02-14	2022-02-15	455	95	true 	0	399	56	0	455	106	274	19
3009	2022-02-14	2022-02-14	2022-02-14	464	95	true 	0	407	57	0	464	86	287	34
3010	2022-02-13	2022-02-13	2022-02-13	478	97	true 	0	431	47	0	478	108	220	103
3011	2022-02-12	2022-02-12	2022-02-12	507	96	true 	0	433	74	0	507	97	289	47
3012	2022-02-11	2022-02-11	2022-02-11	452	97	true 	1	401	51	0	452	80	315	6
3013	2022-02-09	2022-02-08	2022-02-09	475	95	true 	0	426	49	0	475	79	307	40
3014	2022-02-08	2022-02-07	2022-02-08	459	97	true 	0	419	40	0	459	64	299	56
3015	2022-02-07	2022-02-07	2022-02-07	328	98	true 	0	286	42	0	328	75	206	5
3016	2022-02-06	2022-02-05	2022-02-06	478	96	true 	0	422	56	0	478	91	324	7
3017	2022-02-04	2022-02-03	2022-02-04	411	98	true 	0	363	48	0	411	75	247	41
3018	2022-02-03	2022-02-02	2022-02-03	531	95	true 	0	472	59	0	531	92	291	89
3019	2022-02-02	2022-02-01	2022-02-02	459	97	true 	0	410	49	0	459	29	346	35
3020	2022-02-01	2022-01-31	2022-02-01	386	95	true 	0	346	40	0	386	81	190	75
3021	2022-01-31	2022-01-31	2022-01-31	424	96	true 	0	353	71	0	424	49	281	23
3022	2022-01-30	2022-01-30	2022-01-30	424	99	true 	5	391	33	0	424	59	255	77
3023	2022-01-29	2022-01-29	2022-01-29	392	96	true 	0	348	44	0	392	57	248	43
3024	2022-01-28	2022-01-27	2022-01-28	489	96	true 	0	428	61	0	489	83	286	59
3025	2022-01-27	2022-01-26	2022-01-27	539	93	true 	1	462	77	0	539	106	307	49
3026	2022-01-26	2022-01-26	2022-01-26	454	95	true 	1	391	63	0	454	79	280	32
3027	2022-01-25	2022-01-25	2022-01-25	441	97	true 	0	363	78	0	441	69	282	12
3028	2022-01-24	2022-01-24	2022-01-24	484	97	true 	0	437	47	0	484	101	296	40
3029	2022-01-23	2022-01-23	2022-01-23	468	94	true 	0	417	51	0	468	67	276	74
3030	2022-01-21	2022-01-21	2022-01-21	447	96	true 	0	407	40	0	447	88	219	100
3031	2022-01-20	2022-01-20	2022-01-20	436	98	true 	0	383	53	0	436	65	287	31
3032	2022-01-19	2022-01-18	2022-01-19	533	97	true 	1	465	68	0	533	65	388	12
3033	2022-01-17	2022-01-17	2022-01-17	408	96	true 	4	365	43	0	408	49	271	45
3034	2022-01-11	2022-01-11	2022-01-11	437	94	true 	0	374	63	0	437	31	321	22
3035	2022-01-10	2022-01-10	2022-01-10	409	98	true 	0	381	28	0	409	47	294	40
3036	2022-01-05	2022-01-05	2022-01-05	486	94	true 	0	417	69	0	486	63	320	34
3037	2022-01-04	2022-01-04	2022-01-04	348	95	true 	0	305	43	0	348	45	236	24
3038	2022-01-03	2022-01-03	2022-01-03	385	95	true 	0	347	38	0	385	66	234	47
3039	2022-01-02	2022-01-01	2022-01-02	422	95	true 	0	365	57	0	422	91	224	50
3040	2022-01-01	2022-01-01	2022-01-01	381	95	true 	0	352	29	0	381	74	182	96
3041	2021-12-31	2021-12-30	2021-12-31	573	96	true 	0	496	77	0	573	112	361	23
3042	2021-12-30	2021-12-29	2021-12-30	465	93	true 	0	398	67	0	465	94	239	65
3043	2021-12-29	2021-12-29	2021-12-29	387	97	true 	1	350	37	0	387	52	245	53
3044	2021-12-27	2021-12-26	2021-12-27	425	95	true 	0	375	50	0	425	62	285	28
3045	2021-12-26	2021-12-25	2021-12-26	538	96	true 	0	468	70	0	538	118	287	63
3046	2021-12-24	2021-12-23	2021-12-24	493	94	true 	0	433	60	0	493	71	306	56
3047	2021-12-22	2021-12-22	2021-12-22	403	95	true 	0	352	51	0	403	49	269	34
3048	2021-12-21	2021-12-21	2021-12-21	482	96	true 	0	424	58	0	482	86	273	65
3049	2021-12-19	2021-12-18	2021-12-19	504	98	true 	0	453	51	0	504	62	343	48
3050	2021-12-16	2021-12-16	2021-12-16	446	94	true 	0	384	62	0	446	23	345	16
3051	2021-12-15	2021-12-15	2021-12-15	423	97	true 	0	366	57	0	423	80	260	26
3052	2021-12-14	2021-12-14	2021-12-14	397	94	true 	0	336	61	0	397	80	227	29
3053	2021-12-13	2021-12-13	2021-12-13	467	97	true 	0	399	68	0	467	76	284	39
3054	2021-12-11	2021-12-11	2021-12-11	395	98	true 	0	355	40	0	395	52	282	21
3055	2021-12-10	2021-12-10	2021-12-10	454	96	true 	0	409	45	0	454	75	317	17
3056	2021-12-09	2021-12-09	2021-12-09	444	97	true 	0	394	50	0	444	87	219	88
3057	2021-12-08	2021-12-08	2021-12-08	480	94	true 	0	426	54	0	480	71	316	39
3058	2021-12-06	2021-12-05	2021-12-06	506	94	true 	0	447	59	0	506	58	341	48
3059	2021-12-05	2021-12-04	2021-12-05	556	93	true 	0	474	82	0	556	71	359	44
3060	2021-12-04	2021-12-04	2021-12-04	471	95	true 	5	417	54	0	471	71	300	46
3061	2021-12-01	2021-11-30	2021-12-01	535	97	true 	1	461	74	0	535	54	359	48
3062	2021-11-30	2021-11-29	2021-11-30	542	95	true 	0	467	75	0	542	80	318	69
3063	2021-11-29	2021-11-29	2021-11-29	481	96	true 	4	440	41	0	481	69	278	93
3064	2021-11-28	2021-11-28	2021-11-28	489	96	true 	0	434	55	0	489	91	314	29
3065	2021-11-27	2021-11-27	2021-11-27	485	98	true 	0	427	58	0	485	82	267	78
3066	2021-11-26	2021-11-25	2021-11-26	506	96	true 	0	445	61	0	506	99	279	67
3067	2021-11-25	2021-11-24	2021-11-25	462	99	true 	0	403	59	0	462	63	321	19
3068	2021-11-24	2021-11-24	2021-11-24	431	97	true 	0	392	39	0	431	56	282	54
3069	2021-11-23	2021-11-22	2021-11-23	524	95	true 	0	472	52	0	524	74	317	81
3070	2021-11-21	2021-11-21	2021-11-21	458	97	true 	0	416	42	0	458	88	263	65
3071	2021-11-20	2021-11-20	2021-11-20	472	98	true 	0	431	41	0	472	98	247	86
3072	2021-11-18	2021-11-18	2021-11-18	463	98	true 	0	406	57	0	463	71	296	39
3073	2021-11-17	2021-11-17	2021-11-17	406	97	true 	0	359	47	0	406	86	198	75
3074	2021-11-15	2021-11-15	2021-11-15	460	94	true 	0	420	40	0	460	107	254	59
3075	2021-11-12	2021-11-12	2021-11-12	462	96	true 	0	402	60	0	462	102	293	7
3076	2021-11-10	2021-11-09	2021-11-10	491	96	true 	0	440	51	0	491	88	345	7
3077	2021-10-24	2021-10-24	2021-10-24	507	98	true 	0	436	71	0	507	110	277	49
3078	2021-10-23	2021-10-23	2021-10-23	563	95	true 	0	482	81	0	563	62	340	80
3079	2021-10-22	2021-10-21	2021-10-22	505	96	true 	0	446	59	0	505	110	296	40
3080	2021-10-21	2021-10-21	2021-10-21	452	97	true 	0	392	60	0	452	84	276	32
3081	2021-10-17	2021-10-16	2021-10-17	594	96	true 	0	510	84	0	594	90	390	30
3082	2021-10-16	2021-10-15	2021-10-16	531	97	true 	0	448	83	0	531	60	323	65
3083	2021-10-14	2021-10-13	2021-10-14	311	99	true 	0	294	17	0	311	75	192	27
3084	2021-10-13	2021-10-12	2021-10-13	448	97	true 	0	389	59	0	448	97	283	9
3085	2021-10-12	2021-10-11	2021-10-12	461	98	true 	0	422	39	0	461	86	236	100
3086	2021-10-07	2021-10-06	2021-10-07	525	96	true 	0	441	84	0	525	69	358	14
3087	2021-10-05	2021-10-04	2021-10-05	416	97	true 	0	366	50	0	416	49	265	52
3088	2021-10-03	2021-10-03	2021-10-03	539	95	true 	0	475	64	0	539	83	314	78
3089	2021-09-30	2021-09-29	2021-09-30	390	95	true 	0	351	39	0	390	72	234	45
3090	2021-09-26	2021-09-26	2021-09-26	442	99	true 	0	390	52	0	442	87	286	17
3091	2021-09-22	2021-09-22	2021-09-22	359	99	true 	0	300	59	0	359	38	209	53
3092	2021-09-17	2021-09-17	2021-09-17	489	96	true 	0	433	56	0	489	93	227	113
3093	2021-09-09	2021-09-09	2021-09-09	321	97	true 	0	271	50	0	321	50	205	16
3094	2021-09-08	2021-09-07	2021-09-08	428	98	true 	0	378	50	0	428	65	260	53
3095	2021-09-05	2021-09-04	2021-09-05	563	95	true 	0	496	67	0	563	91	333	72
3096	2021-09-02	2021-09-01	2021-09-02	416	97	true 	0	374	42	0	416	83	274	17
3097	2021-09-01	2021-08-31	2021-09-01	390	98	true 	0	350	40	0	390	27	285	38
3098	2021-08-29	2021-08-29	2021-08-29	423	94	true 	0	364	59	0	423	57	294	13
3099	2021-08-28	2021-08-28	2021-08-28	368	95	true 	0	304	64	0	368	46	228	30
3100	2021-08-25	2021-08-25	2021-08-25	307	99	true 	0	281	26	0	307	49	195	37
3101	2021-08-11	2021-08-10	2021-08-11	408	96	true 	0	341	67	0	408	58	278	5
3102	2021-08-06	2021-08-05	2021-08-06	395	98	true 	0	354	41	0	395	47	271	36
3103	2021-07-31	2021-07-30	2021-07-31	403	96	true 	0	364	39	0	403	84	214	66
3104	2021-07-29	2021-07-29	2021-07-29	353	100	true 	0	313	40	0	353	26	268	19
3105	2021-07-24	2021-07-24	2021-07-24	383	97	true 	0	339	44	0	383	55	243	41
3106	2021-07-23	2021-07-22	2021-07-23	382	97	true 	0	337	45	0	382	49	271	17
3107	2021-07-22	2021-07-21	2021-07-22	389	98	true 	1	350	39	0	389	54	247	49
3108	2021-07-21	2021-07-21	2021-07-21	420	93	true 	3	370	50	0	420	89	222	59
3109	2021-07-17	2021-07-16	2021-07-17	376	98	true 	0	340	36	0	376	38	271	31
3110	2021-07-16	2021-07-15	2021-07-16	460	95	true 	0	397	63	0	460	66	299	32
3111	2021-07-15	2021-07-14	2021-07-15	396	98	true 	0	348	48	0	396	43	292	13
3112	2021-07-11	2021-07-11	2021-07-11	485	96	true 	1	432	53	0	485	83	302	47
3113	2021-07-08	2021-07-07	2021-07-08	399	97	true 	0	346	53	0	399	48	259	39
3114	2021-07-07	2021-07-07	2021-07-07	421	98	true 	0	357	64	0	421	40	293	24
3115	2021-07-06	2021-07-05	2021-07-06	402	95	true 	0	355	47	0	402	64	229	62
3116	2021-07-04	2021-07-03	2021-07-04	409	96	true 	0	369	40	0	409	70	246	53
3117	2021-07-03	2021-07-02	2021-07-03	521	93	true 	0	463	58	0	521	99	309	55
3118	2021-07-02	2021-07-01	2021-07-02	401	96	true 	0	348	53	0	401	48	279	21
3119	2021-06-30	2021-06-29	2021-06-30	394	98	true 	1	349	45	0	394	31	293	25
3120	2021-06-29	2021-06-28	2021-06-29	482	99	true 	3	418	64	0	482	87	266	65
3121	2021-06-25	2021-06-24	2021-06-25	379	96	true 	1	337	42	0	379	28	267	42
3122	2021-06-19	2021-06-18	2021-06-19	392	96	true 	0	349	43	0	392	58	264	27
3123	2021-06-15	2021-06-14	2021-06-15	534	95	true 	1	467	67	0	534	87	340	40
3124	2021-06-13	2021-06-13	2021-06-13	445	96	true 	0	414	31	0	445	27	351	36
3125	2021-06-08	2021-06-07	2021-06-08	382	92	true 	0	331	51	0	382	20	311	0
3126	2021-06-06	2021-06-06	2021-06-06	498	98	true 	0	435	63	0	498	66	338	31
3127	2021-06-05	2021-06-04	2021-06-05	506	94	true 	0	439	67	0	506	78	304	57
3128	2021-05-30	2021-05-29	2021-05-30	417	98	true 	0	374	43	0	417	55	278	41
3129	2021-05-24	2021-05-23	2021-05-24	512	97	true 	4	449	63	0	512	76	325	48
3130	2021-05-21	2021-05-20	2021-05-21	363	96	true 	0	321	42	0	363	63	244	14
3131	2021-05-20	2021-05-19	2021-05-20	487	97	true 	2	434	53	0	487	115	258	61
3132	2021-05-17	2021-05-17	2021-05-17	356	97	true 	0	307	49	0	356	54	247	6
3133	2021-05-16	2021-05-16	2021-05-16	314	95	true 	0	275	39	0	314	50	172	53
3134	2021-05-13	2021-05-12	2021-05-13	393	98	true 	0	353	40	0	393	54	289	10
3135	2021-05-12	2021-05-11	2021-05-12	391	95	true 	0	343	48	0	391	44	264	35
3136	2021-05-11	2021-05-10	2021-05-11	371	98	true 	0	338	33	0	371	79	208	51
3137	2021-05-07	2021-05-06	2021-05-07	409	95	true 	0	353	56	0	409	75	220	58
3138	2021-05-06	2021-05-05	2021-05-06	375	97	true 	0	332	43	0	375	69	219	44
3139	2021-05-04	2021-05-03	2021-05-04	409	98	true 	0	363	46	0	409	61	247	55
3140	2021-05-03	2021-05-03	2021-05-03	404	97	true 	0	354	50	0	404	56	285	13
3141	2021-05-01	2021-04-30	2021-05-01	310	98	true 	0	272	38	0	310	54	218	0
3142	2021-04-29	2021-04-28	2021-04-29	418	97	true 	0	367	51	0	418	71	223	73
3143	2021-04-26	2021-04-25	2021-04-26	356	98	true 	0	321	35	0	356	71	214	36
3144	2021-04-19	2021-04-19	2021-04-19	320	98	true 	0	281	39	0	320	57	174	50
3145	2021-04-17	2021-04-16	2021-04-17	507	92	true 	4	444	63	0	507	72	311	61
3146	2021-04-12	2021-04-11	2021-04-12	526	97	true 	0	472	54	0	526	91	331	50
3147	2021-04-08	2021-04-08	2021-04-08	353	97	true 	0	303	50	0	353	60	208	35
3148	2021-04-07	2021-04-07	2021-04-07	364	96	true 	0	316	48	0	364	85	204	27
3149	2021-04-05	2021-04-04	2021-04-05	408	96	true 	0	366	42	0	408	66	267	33
3150	2021-04-04	2021-04-03	2021-04-04	516	96	true 	0	454	62	0	516	56	370	28
3151	2021-04-02	2021-04-02	2021-04-02	454	94	true 	0	404	50	0	454	78	267	59
3152	2021-03-30	2021-03-29	2021-03-30	365	99	true 	0	337	28	0	365	45	273	19
3153	2021-03-29	2021-03-29	2021-03-29	337	98	true 	0	307	30	0	337	33	229	45
3154	2021-03-28	2021-03-28	2021-03-28	390	97	true 	0	346	44	0	390	52	265	29
3155	2021-03-22	2021-03-22	2021-03-22	356	96	true 	0	321	35	0	356	43	260	18
3156	2021-03-20	2021-03-20	2021-03-20	425	96	true 	0	377	48	0	425	36	304	37
3157	2021-03-17	2021-03-16	2021-03-17	370	97	true 	0	321	49	0	370	29	241	51
3158	2021-03-15	2021-03-14	2021-03-15	500	98	true 	2	452	48	0	500	99	270	83
3159	2021-03-14	2021-03-14	2021-03-14	482	97	true 	0	419	63	0	482	59	360	0
3160	2021-03-13	2021-03-13	2021-03-13	513	96	true 	0	437	76	0	513	73	318	46
3161	2021-03-10	2021-03-09	2021-03-10	428	97	true 	0	379	49	0	428	41	298	40
3162	2021-03-07	2021-03-07	2021-03-07	472	96	true 	0	418	54	0	472	77	286	55
3163	2021-03-06	2021-03-06	2021-03-06	436	98	true 	0	387	49	0	436	52	294	41
3164	2021-03-04	2021-03-03	2021-03-04	421	98	true 	0	375	46	0	421	73	296	6
3165	2021-03-03	2021-03-03	2021-03-03	376	96	true 	0	329	47	0	376	32	255	42
3166	2021-02-28	2021-02-27	2021-02-28	538	95	true 	0	478	60	0	538	82	334	62
3167	2021-02-27	2021-02-27	2021-02-27	459	95	true 	0	402	57	0	459	71	251	80
3168	2021-02-26	2021-02-25	2021-02-26	456	97	true 	1	398	58	0	456	58	289	51
3169	2021-02-25	2021-02-24	2021-02-25	491	93	true 	0	433	58	0	491	81	347	5
3170	2021-02-24	2021-02-24	2021-02-24	372	97	true 	0	335	37	0	372	60	259	16
3171	2021-02-23	2021-02-22	2021-02-23	504	95	true 	0	451	53	0	504	93	334	24
3172	2021-02-20	2021-02-19	2021-02-20	479	97	true 	0	439	40	0	479	58	300	81
3173	2021-02-19	2021-02-18	2021-02-19	494	96	true 	0	423	71	0	494	75	338	10
3174	2021-02-18	2021-02-17	2021-02-18	393	98	true 	0	354	39	0	393	60	284	10
3175	2021-02-17	2021-02-16	2021-02-17	397	96	true 	0	352	45	0	397	67	274	11
3176	2021-02-15	2021-02-15	2021-02-15	445	97	true 	0	391	54	0	445	45	308	38
3177	2021-02-14	2021-02-14	2021-02-14	470	96	true 	0	430	40	0	470	58	306	66
3178	2021-02-12	2021-02-11	2021-02-12	530	97	true 	0	452	78	0	530	85	340	27
3179	2021-02-11	2021-02-10	2021-02-11	418	96	true 	1	371	47	0	418	55	311	5
3180	2021-02-09	2021-02-08	2021-02-09	420	97	true 	3	366	54	0	420	34	311	21
3181	2021-02-08	2021-02-08	2021-02-08	433	95	true 	1	374	59	0	433	47	290	37
3182	2021-02-06	2021-02-06	2021-02-06	454	97	true 	0	383	71	0	454	85	263	35
3183	2021-02-05	2021-02-04	2021-02-05	439	94	true 	0	380	59	0	439	53	322	5
3184	2021-01-31	2021-01-31	2021-01-31	569	95	true 	0	519	50	0	569	103	328	88
3185	2021-01-28	2021-01-27	2021-01-28	438	97	true 	0	389	49	0	438	38	339	12
3186	2021-01-27	2021-01-26	2021-01-27	555	94	true 	0	478	77	0	555	74	392	12
3187	2021-01-24	2021-01-24	2021-01-24	460	98	true 	0	406	54	0	460	50	327	29
3188	2021-01-23	2021-01-23	2021-01-23	436	97	true 	0	380	56	0	436	79	232	69
3189	2021-01-22	2021-01-21	2021-01-22	401	99	true 	0	342	59	0	401	37	295	10
3190	2021-01-21	2021-01-20	2021-01-21	544	98	true 	0	500	44	0	544	114	299	87
3191	2021-01-19	2021-01-18	2021-01-19	475	98	true 	0	412	63	0	475	66	324	22
3192	2021-01-18	2021-01-18	2021-01-18	470	97	true 	0	414	56	0	470	78	269	67
3193	2021-01-16	2021-01-16	2021-01-16	431	94	true 	0	381	50	0	431	66	271	44
3194	2021-01-15	2021-01-14	2021-01-15	442	94	true 	0	395	47	0	442	50	299	46
3195	2021-01-13	2021-01-13	2021-01-13	394	97	true 	0	344	50	0	394	40	294	10
3196	2021-01-10	2021-01-10	2021-01-10	459	96	true 	0	407	52	0	459	80	282	45
3197	2021-01-09	2021-01-08	2021-01-09	525	97	true 	0	470	55	0	525	109	272	89
3198	2021-01-08	2021-01-08	2021-01-08	322	99	true 	0	297	25	0	322	0	276	21
3199	2021-01-07	2021-01-06	2021-01-07	415	96	true 	0	357	58	0	415	47	278	32
3200	2021-01-05	2021-01-04	2021-01-05	385	95	true 	2	338	47	0	385	50	234	54
3201	2021-01-01	2021-01-01	2021-01-01	343	93	true 	0	308	35	0	343	48	214	46
3202	2020-12-30	2020-12-29	2020-12-30	387	98	true 	0	331	56	0	387	18	275	38
3203	2020-12-28	2020-12-28	2020-12-28	271	97	true 	0	225	46	0	271	25	187	13
3204	2020-12-24	2020-12-24	2020-12-24	461	98	true 	0	402	59	0	461	59	275	68
3205	2020-12-23	2020-12-23	2020-12-23	472	97	true 	1	421	51	0	472	87	266	68
3206	2020-12-17	2020-12-16	2020-12-17	434	98	true 	1	381	53	0	434	68	278	35
3207	2020-12-16	2020-12-15	2020-12-16	488	96	true 	0	427	61	0	488	33	366	28
3208	2020-12-15	2020-12-14	2020-12-15	443	96	true 	0	402	41	0	443	89	279	34
3209	2020-12-12	2020-12-12	2020-12-12	424	97	true 	0	379	45	0	424	48	305	26
3210	2020-12-01	2020-11-30	2020-12-01	373	95	true 	0	330	43	0	373	54	239	37
3211	2020-11-25	2020-11-24	2020-11-25	398	98	true 	1	358	40	0	398	33	297	28
3212	2020-11-21	2020-11-21	2020-11-21	310	98	true 	0	283	27	0	310	7	252	24
3213	2020-11-20	2020-11-20	2020-11-20	436	98	true 	3	384	52	0	436	45	330	9
3214	2020-11-19	2020-11-19	2020-11-19	419	97	true 	0	363	56	0	419	67	243	53
3215	2020-11-17	2020-11-17	2020-11-17	304	98	true 	0	247	57	0	304	26	206	15
3216	2020-11-07	2020-11-06	2020-11-07	514	96	true 	0	467	47	0	514	78	321	68
3217	2020-11-03	2020-11-02	2020-11-03	487	97	true 	0	428	59	0	487	31	353	44
3218	2020-10-28	2020-10-27	2020-10-28	333	98	true 	0	291	42	0	333	30	215	46
3219	2020-10-25	2020-10-25	2020-10-25	502	97	true 	5	452	50	0	502	75	295	82
3220	2020-10-20	2020-10-19	2020-10-20	440	98	true 	1	390	50	0	440	49	322	19
3221	2020-10-18	2020-10-18	2020-10-18	466	97	true 	0	409	57	0	466	53	319	37
3222	2020-10-12	2020-10-12	2020-10-12	428	98	true 	1	381	47	0	428	61	241	79
3223	2020-10-09	2020-10-08	2020-10-09	383	97	true 	0	348	35	0	383	46	250	52
3224	2020-10-05	2020-10-05	2020-10-05	415	98	true 	0	378	37	0	415	77	248	53
3225	2020-10-02	2020-10-01	2020-10-02	563	95	true 	0	507	56	0	563	96	324	87
3226	2020-09-30	2020-09-30	2020-09-30	490	98	true 	0	435	55	0	490	95	272	68
3227	2020-09-29	2020-09-29	2020-09-29	341	96	true 	0	310	31	0	341	54	203	53
3228	2020-09-28	2020-09-28	2020-09-28	406	97	true 	0	369	37	0	406	93	245	31
3229	2020-09-26	2020-09-26	2020-09-26	435	97	true 	0	374	61	0	435	95	232	47
3230	2020-09-22	2020-09-21	2020-09-22	491	96	true 	0	450	41	0	491	130	215	105
3231	2020-09-21	2020-09-21	2020-09-21	384	98	true 	0	355	29	0	384	63	238	54
3232	2020-09-20	2020-09-20	2020-09-20	438	95	true 	0	406	32	0	438	104	171	131
3233	2020-09-17	2020-09-16	2020-09-17	466	94	true 	0	379	87	0	466	92	283	4
3234	2020-09-16	2020-09-15	2020-09-16	471	95	true 	0	434	37	0	471	97	245	92
3235	2020-09-15	2020-09-15	2020-09-15	373	98	true 	0	340	33	0	373	56	216	68
3236	2020-09-13	2020-09-13	2020-09-13	480	96	true 	0	426	54	0	480	72	285	69
3237	2020-09-11	2020-09-11	2020-09-11	477	88	true 	0	414	63	0	477	69	258	87
3238	2020-09-09	2020-09-09	2020-09-09	436	97	true 	0	383	53	0	436	77	238	68
\.


--
-- TOC entry 3352 (class 0 OID 24587)
-- Dependencies: 215
-- Data for Name: steps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.steps (id, date_time, steps) FROM stdin;
29	2022-04-04	7267
30	2022-04-05	2729
31	2022-04-06	7836
32	2022-04-07	6887
33	2022-04-08	7609
34	2022-04-09	4880
35	2022-04-10	5841
36	2022-04-11	4848
37	2022-04-12	732
38	2022-04-13	1343
39	2022-04-14	6216
40	2022-04-15	12124
41	2022-04-16	13942
42	2022-04-17	2024
43	2022-04-18	8800
44	2022-04-19	6472
45	2022-04-20	6257
46	2022-04-21	3639
47	2022-04-22	6068
48	2022-04-23	5443
49	2022-04-24	8040
50	2022-04-25	3108
51	2022-04-26	5085
52	2022-04-27	1422
53	2022-04-28	5322
54	2022-04-29	2197
55	2022-04-30	6756
56	2022-05-01	9709
57	2022-05-02	2769
58	2022-05-03	6020
59	2022-05-04	7546
60	2022-05-05	9569
61	2022-05-06	12286
62	2022-05-07	6050
63	2022-05-08	1773
64	2022-05-09	6096
65	2022-05-10	9070
66	2022-05-11	2644
67	2022-05-12	4069
68	2022-05-13	2236
69	2022-05-14	5621
70	2022-05-15	2946
71	2022-05-16	2616
72	2022-05-17	7261
73	2022-05-18	9653
74	2022-05-19	8316
75	2022-05-20	15375
76	2022-05-21	12021
77	2022-05-22	3454
78	2022-05-23	6044
79	2022-05-24	3417
80	2022-05-25	13066
81	2022-05-26	6075
82	2022-05-27	12901
83	2022-05-28	6907
84	2022-05-29	6528
85	2022-05-30	2715
86	2022-05-31	8595
87	2022-06-01	6944
88	2022-06-02	4264
89	2022-06-03	7661
90	2022-06-04	6564
91	2022-06-05	18867
92	2022-06-06	3251
93	2022-06-07	2342
94	2022-06-08	90
95	2022-06-09	637
96	2022-06-10	7529
97	2022-06-11	3523
98	2022-06-12	7137
99	2022-06-13	2818
100	2022-06-14	5069
101	2022-06-15	8523
102	2022-06-16	1582
103	2022-06-17	8899
104	2022-06-18	5128
105	2022-06-19	4781
106	2022-06-20	6146
107	2022-06-21	4408
108	2022-06-22	7606
109	2022-06-23	6500
110	2022-06-24	3616
111	2022-06-25	6422
112	2022-06-26	2598
113	2022-06-27	2720
114	2022-06-28	2026
115	2022-06-29	1925
116	2022-06-30	2400
117	2022-07-01	2480
118	2022-07-02	1360
119	2022-07-03	4703
120	2022-07-04	1658
121	2022-07-05	1997
122	2022-07-06	2095
123	2022-07-07	1693
124	2022-07-08	3431
125	2022-07-09	8577
126	2022-07-10	10686
127	2022-07-11	7426
128	2022-07-12	8962
129	2022-07-13	8388
130	2022-07-14	5557
131	2022-07-15	972
132	2022-07-16	8584
133	2022-07-17	7247
134	2022-07-18	5755
135	2022-07-19	2666
136	2022-07-20	5118
137	2022-07-21	9216
138	2022-07-22	5228
139	2022-07-23	6997
140	2022-07-24	2752
141	2022-07-25	2681
142	2022-07-26	4194
143	2022-07-27	2422
144	2022-07-28	3509
145	2022-07-29	4065
146	2022-07-30	10884
147	2022-07-31	5412
148	2022-08-01	6571
149	2022-08-02	2832
150	2022-08-03	6157
151	2022-08-04	7944
152	2022-08-05	19144
153	2022-08-06	8955
154	2022-08-07	8985
155	2022-08-08	12772
156	2022-08-09	8852
157	2022-08-10	7547
158	2022-08-11	8804
159	2022-08-12	11568
160	2022-08-13	6232
161	2022-08-14	7122
162	2022-08-15	9641
163	2022-08-16	8548
164	2022-08-17	13994
165	2022-08-18	12909
166	2022-08-19	19206
167	2022-08-20	15353
168	2022-08-21	9113
169	2022-08-22	10123
170	2022-08-23	456
171	2022-08-24	20930
172	2022-08-25	20064
173	2022-08-26	20352
174	2022-08-27	1269
175	2022-08-28	13775
176	2022-08-29	9897
177	2022-08-30	14295
178	2022-08-31	16456
179	2022-09-01	9900
180	2022-09-02	13055
181	2022-09-03	7712
182	2022-09-04	16899
183	2022-09-05	4351
184	2022-09-06	12243
185	2022-09-07	11597
186	2022-09-08	14705
187	2022-09-09	5726
188	2022-09-10	15707
189	2022-09-11	2251
190	2022-09-12	5473
191	2022-09-13	7154
192	2022-09-14	12066
193	2022-09-15	9250
194	2022-09-16	8423
195	2022-09-17	4960
196	2022-09-18	3794
197	2022-09-19	6973
198	2022-09-20	6721
199	2022-09-21	6894
200	2022-09-22	10235
201	2022-09-23	8674
202	2022-09-24	3006
203	2022-09-25	10978
204	2022-09-26	1289
205	2022-09-27	7851
206	2022-09-28	7126
207	2022-09-29	7350
208	2022-09-30	3760
209	2022-10-01	4222
210	2022-10-02	12719
211	2022-10-03	2313
212	2022-10-04	11835
213	2022-10-05	9237
214	2022-10-06	11673
215	2022-10-07	4753
216	2022-10-08	11054
217	2022-10-09	2052
218	2022-10-10	1530
219	2022-10-11	7676
220	2022-10-12	9119
221	2022-10-13	2012
222	2022-10-14	5972
223	2022-10-15	9048
224	2022-10-16	6795
225	2022-10-17	1826
226	2022-10-18	7058
227	2022-10-19	8157
228	2022-10-20	9293
229	2022-10-21	4608
230	2022-10-22	6639
231	2022-10-23	9120
232	2022-10-24	1446
233	2022-10-25	4785
234	2022-10-26	3899
235	2022-10-27	9545
236	2022-10-28	3840
237	2022-10-29	7677
238	2022-10-30	10914
239	2022-10-31	2931
240	2022-11-01	4991
241	2022-11-02	8152
242	2022-11-03	10609
243	2022-11-04	5649
244	2022-11-05	11897
245	2022-11-06	8497
246	2022-11-07	6265
247	2022-11-08	9176
248	2022-11-09	8973
249	2022-11-10	5694
250	2022-11-11	3980
251	2022-11-12	13253
252	2022-11-13	11793
253	2022-11-14	2341
254	2022-11-15	9512
255	2022-11-16	14218
256	2022-11-17	8956
257	2022-11-18	2358
258	2022-11-19	14211
259	2022-11-20	12684
260	2022-11-21	1898
261	2022-11-22	8418
262	2022-11-23	8807
263	2022-11-24	2053
264	2022-11-25	3787
265	2022-11-26	2430
266	2022-11-27	1683
267	2022-11-28	4268
268	2022-11-29	8383
269	2022-11-30	3419
270	2022-12-01	4505
271	2022-12-02	2138
272	2022-12-03	2354
273	2022-12-04	5043
274	2022-12-05	4718
275	2022-12-06	8223
276	2022-12-07	8277
277	2022-12-08	13085
278	2022-12-09	1210
279	2022-12-10	2213
280	2022-12-11	5006
281	2022-12-12	2756
282	2022-12-13	1984
283	2022-12-14	1926
284	2022-12-15	1991
285	2022-12-16	4404
286	2022-12-17	2012
287	2022-12-18	7220
288	2022-12-19	1306
289	2022-12-20	2991
290	2022-12-21	8840
291	2022-12-22	9445
292	2022-12-23	3548
293	2022-12-24	8074
294	2022-12-25	2655
295	2022-12-26	12665
296	2022-12-27	1097
297	2022-12-28	3819
298	2022-12-29	1929
299	2022-12-30	13266
300	2022-12-31	8697
301	2023-01-01	6362
302	2023-01-02	2817
303	2023-01-03	1236
304	2023-01-04	874
305	2023-01-05	271
306	2023-01-06	2001
307	2023-01-07	18602
308	2023-01-08	8437
309	2023-01-09	1293
310	2023-01-10	2981
311	2023-01-11	7588
312	2023-01-12	5354
313	2023-01-13	8796
314	2023-01-14	6208
315	2023-01-15	1612
316	2023-01-16	2229
317	2023-01-17	1298
318	2023-01-18	14101
319	2023-01-19	6953
320	2023-01-20	6708
321	2023-01-21	7365
322	2023-01-22	1234
323	2023-01-23	3956
324	2023-01-24	5446
325	2023-01-25	4820
326	2023-01-26	6926
327	2023-01-27	6460
328	2023-01-28	17994
329	2023-01-29	1259
330	2023-01-30	3133
331	2023-01-31	4270
332	2023-02-01	14748
333	2023-02-02	9269
334	2023-02-03	7281
335	2023-02-04	1060
336	2023-02-05	4686
337	2023-02-06	2162
338	2023-02-07	5120
339	2023-02-08	9264
340	2023-02-09	5864
341	2023-02-10	9491
342	2023-02-11	3865
343	2023-02-12	12672
344	2023-02-13	9305
345	2023-02-14	9030
346	2023-02-15	8018
347	2023-02-16	9690
348	2023-02-17	6211
349	2023-02-18	6119
350	2023-02-19	3004
351	2023-02-20	5118
352	2023-02-21	1365
353	2023-02-22	8543
354	2023-02-23	8896
355	2023-02-24	12965
356	2023-02-25	7317
357	2023-02-26	4449
358	2023-02-27	4809
359	2023-02-28	3267
360	2023-03-01	6366
361	2023-03-02	1558
362	2023-03-03	7488
363	2023-03-04	5091
364	2023-03-05	8954
365	2023-03-06	994
366	2023-03-07	7602
367	2023-03-08	8962
368	2023-03-09	6704
369	2023-03-10	7115
370	2023-03-11	7740
371	2023-03-12	1805
372	2023-03-13	9003
373	2023-03-14	5562
374	2023-03-15	10704
375	2023-03-16	6333
376	2023-03-17	7122
377	2023-03-18	11038
378	2023-03-19	2115
379	2023-03-20	9762
380	2023-03-21	6045
381	2023-03-22	7444
382	2023-03-23	9432
383	2023-03-24	8301
384	2023-03-25	2134
385	2023-03-26	17270
386	2023-03-27	2392
387	2023-03-28	4875
388	2023-03-29	9266
389	2023-03-30	7663
390	2023-03-31	10653
391	2023-04-01	1655
392	2023-04-02	17910
393	2023-04-03	2413
394	2023-04-04	747
395	2021-04-04	8775
396	2021-04-05	6685
397	2021-04-06	1933
398	2021-04-07	7272
399	2021-04-08	7165
400	2021-04-09	6311
401	2021-04-10	2119
402	2021-04-11	8132
403	2021-04-12	2473
404	2021-04-13	6935
405	2021-04-14	5982
406	2021-04-15	6473
407	2021-04-16	1929
408	2021-04-17	2353
409	2021-04-18	1641
410	2021-04-19	6304
411	2021-04-20	5878
412	2021-04-21	5496
413	2021-04-22	6939
414	2021-04-23	2753
415	2021-04-24	1955
416	2021-04-25	7682
417	2021-04-26	6389
418	2021-04-27	6125
419	2021-04-28	1996
420	2021-04-29	6271
421	2021-04-30	1452
422	2021-05-01	1993
423	2021-05-02	11080
424	2021-05-03	5930
425	2021-05-04	6228
426	2021-05-05	1480
427	2021-05-06	6814
428	2021-05-07	6569
429	2021-05-08	6490
430	2021-05-09	3818
431	2021-05-10	2324
432	2021-05-11	6661
433	2021-05-12	5983
434	2021-05-13	3127
435	2021-05-14	6147
436	2021-05-15	5416
437	2021-05-16	1446
438	2021-05-17	6276
439	2021-05-18	2421
440	2021-05-19	5475
441	2021-05-20	8188
442	2021-05-21	14562
443	2021-05-22	7202
444	2021-05-23	12472
445	2021-05-24	5269
446	2021-05-25	8150
447	2021-05-26	10289
448	2021-05-27	8383
449	2021-05-28	3392
450	2021-05-29	12759
451	2021-05-30	24626
452	2021-05-31	15980
453	2021-06-01	4080
454	2021-06-02	12307
455	2021-06-03	7643
456	2021-06-04	7955
457	2021-06-05	18568
458	2021-06-06	21141
459	2021-06-07	13328
460	2021-06-08	7446
461	2021-06-09	11622
462	2021-06-10	5413
463	2021-06-11	10839
464	2021-06-12	20920
465	2021-06-13	16910
466	2021-06-14	3234
467	2021-06-15	4857
468	2021-06-16	9415
469	2021-06-17	4948
470	2021-06-18	8634
471	2021-06-19	11967
472	2021-06-20	1378
473	2021-06-21	9868
474	2021-06-22	5898
475	2021-06-23	7223
476	2021-06-24	14056
477	2021-06-25	7814
478	2021-06-26	2628
479	2021-06-27	6598
480	2021-06-28	7295
481	2021-06-29	3890
482	2021-06-30	7402
483	2021-07-01	6559
484	2021-07-02	6053
485	2021-07-03	2685
486	2021-07-04	6273
487	2021-07-05	2310
488	2021-07-06	7407
489	2021-07-07	1844
490	2021-07-08	6920
491	2021-07-09	6319
492	2021-07-10	5311
493	2021-07-11	4319
494	2021-07-12	1737
495	2021-07-13	6221
496	2021-07-14	6388
497	2021-07-15	8017
498	2021-07-16	1362
499	2021-07-17	932
500	2021-07-18	6853
501	2021-07-19	357
502	2021-07-20	4908
503	2021-07-21	1407
504	2021-07-22	5612
505	2021-07-23	6498
506	2021-07-24	2990
507	2021-07-25	6183
508	2021-07-26	1898
509	2021-07-27	5601
510	2021-07-28	1505
511	2021-07-29	5718
512	2021-07-30	1795
513	2021-07-31	1211
514	2021-08-01	159
515	2021-08-02	2234
516	2021-08-03	5392
517	2021-08-04	6777
518	2021-08-05	3238
519	2021-08-06	5613
520	2021-08-07	2098
521	2021-08-08	5070
522	2021-08-09	1580
523	2021-08-10	4791
524	2021-08-11	5424
525	2021-08-12	2364
526	2021-08-13	6149
527	2021-08-14	2243
528	2021-08-15	4243
529	2021-08-16	2775
530	2021-08-17	6208
531	2021-08-18	3016
532	2021-08-19	1867
533	2021-08-20	203
534	2021-08-21	5410
535	2021-08-22	876
536	2021-08-23	5097
537	2021-08-24	1365
538	2021-08-25	5586
539	2021-08-26	425
540	2021-08-27	7029
541	2021-08-28	4145
542	2021-08-29	1055
543	2021-08-30	2678
544	2021-08-31	7139
545	2021-09-01	6880
546	2021-09-02	7730
547	2021-09-03	1572
548	2021-09-04	4336
549	2021-09-05	4724
550	2021-09-06	4695
551	2021-09-07	5006
552	2021-09-08	5726
553	2021-09-09	2024
554	2021-09-10	2704
555	2021-09-11	9645
556	2021-09-12	5088
557	2021-09-13	3573
558	2021-09-14	6334
559	2021-09-15	147
560	2021-09-16	4640
561	2021-09-17	4736
562	2021-09-18	532
563	2021-09-19	599
564	2021-09-20	1435
565	2021-09-21	2541
566	2021-09-22	7558
567	2021-09-23	2224
568	2021-09-24	5817
569	2021-09-25	4955
570	2021-09-26	5411
571	2021-09-27	1594
572	2021-09-28	3767
573	2021-09-29	5780
574	2021-09-30	6690
575	2021-10-01	1999
576	2021-10-02	7800
577	2021-10-03	6473
578	2021-10-04	2112
579	2021-10-05	7250
580	2021-10-06	7894
581	2021-10-07	2358
582	2021-10-08	7625
583	2021-10-09	2122
584	2021-10-10	7200
585	2021-10-11	4192
586	2021-10-12	10012
587	2021-10-13	10107
588	2021-10-14	3644
589	2021-10-15	7778
590	2021-10-16	6223
591	2021-10-17	546
592	2021-10-18	16913
593	2021-10-19	1016
594	2021-10-20	7127
595	2021-10-21	7241
596	2021-10-22	6418
597	2021-10-23	6118
598	2021-10-24	11518
599	2021-10-25	11518
600	2021-10-26	0
601	2021-10-27	0
602	2021-10-28	0
603	2021-10-29	0
604	2021-10-30	0
605	2021-10-31	0
606	2021-11-01	0
607	2021-11-02	0
608	2021-11-03	0
609	2021-11-04	0
610	2021-11-05	0
611	2021-11-06	0
612	2021-11-07	0
613	2021-11-08	727
614	2021-11-09	5848
615	2021-11-10	5425
616	2021-11-11	917
617	2021-11-12	5941
618	2021-11-13	5882
619	2021-11-14	12729
620	2021-11-15	7239
621	2021-11-16	1151
622	2021-11-17	5386
623	2021-11-18	6291
624	2021-11-19	5647
625	2021-11-20	4086
626	2021-11-21	12488
627	2021-11-22	1990
628	2021-11-23	5771
629	2021-11-24	5082
630	2021-11-25	5405
631	2021-11-26	7419
632	2021-11-27	5788
633	2021-11-28	13648
634	2021-11-29	1288
635	2021-11-30	5010
636	2021-12-01	6251
637	2021-12-02	6109
638	2021-12-03	6835
639	2021-12-04	10460
640	2021-12-05	15651
641	2021-12-06	876
642	2021-12-07	8594
643	2021-12-08	13237
644	2021-12-09	5397
645	2021-12-10	1151
646	2021-12-11	3999
647	2021-12-12	1600
648	2021-12-13	5269
649	2021-12-14	4070
650	2021-12-15	5855
651	2021-12-16	5111
652	2021-12-17	3511
653	2021-12-18	5770
654	2021-12-19	14054
655	2021-12-20	2930
656	2021-12-21	6594
657	2021-12-22	2209
658	2021-12-23	6449
659	2021-12-24	6822
660	2021-12-25	5876
661	2021-12-26	8694
662	2021-12-27	15482
663	2021-12-28	3627
664	2021-12-29	13611
665	2021-12-30	23055
666	2021-12-31	12911
667	2022-01-01	6446
668	2022-01-02	18695
669	2022-01-03	5342
670	2022-01-04	20958
671	2022-01-05	5235
672	2022-01-06	9355
673	2022-01-07	18360
674	2022-01-08	5876
675	2022-01-09	4203
676	2022-01-10	1289
677	2022-01-11	6109
678	2022-01-12	1203
679	2022-01-13	2504
680	2022-01-14	1353
681	2022-01-15	2857
682	2022-01-16	1434
683	2022-01-17	2641
684	2022-01-18	6594
685	2022-01-19	1643
686	2022-01-20	4864
687	2022-01-21	6147
688	2022-01-22	11041
689	2022-01-23	8398
690	2022-01-24	1875
691	2022-01-25	6380
692	2022-01-26	6300
693	2022-01-27	5561
694	2022-01-28	5116
695	2022-01-29	2091
696	2022-01-30	6108
697	2022-01-31	1849
698	2022-02-01	5915
699	2022-02-02	5554
700	2022-02-03	1475
701	2022-02-04	4368
702	2022-02-05	5384
703	2022-02-06	5358
704	2022-02-07	5787
705	2022-02-08	5201
706	2022-02-09	1601
707	2022-02-10	2737
708	2022-02-11	731
709	2022-02-12	3675
710	2022-02-13	10283
711	2022-02-14	5792
712	2022-02-15	1420
713	2022-02-16	6561
714	2022-02-17	5635
715	2022-02-18	6616
716	2022-02-19	10657
717	2022-02-20	7917
718	2022-02-21	9693
719	2022-02-22	7367
720	2022-02-23	5352
721	2022-02-24	5835
722	2022-02-25	1421
723	2022-02-26	2962
724	2022-02-27	8689
725	2022-02-28	2530
726	2022-03-01	5470
727	2022-03-02	5950
728	2022-03-03	5895
729	2022-03-04	1864
730	2022-03-05	6308
731	2022-03-06	1273
732	2022-03-07	1418
733	2022-03-08	7444
734	2022-03-09	1355
735	2022-03-10	1736
736	2022-03-11	5710
737	2022-03-12	1117
738	2022-03-13	3528
739	2022-03-14	6546
740	2022-03-15	2790
741	2022-03-16	5772
742	2022-03-17	4687
743	2022-03-18	5003
744	2022-03-19	8920
745	2022-03-20	3321
746	2022-03-21	13344
747	2022-03-22	1441
748	2022-03-23	8099
749	2022-03-24	8107
750	2022-03-25	24529
751	2022-03-26	20827
752	2022-03-27	19010
753	2022-03-28	9040
754	2022-03-29	2327
755	2022-03-30	5549
756	2022-03-31	3934
757	2022-04-01	3122
758	2022-04-02	6966
759	2022-04-03	1541
760	2020-04-04	0
761	2020-04-05	0
762	2020-04-06	0
763	2020-04-07	0
764	2020-04-08	0
765	2020-04-09	0
766	2020-04-10	0
767	2020-04-11	0
768	2020-04-12	0
769	2020-04-13	0
770	2020-04-14	0
771	2020-04-15	0
772	2020-04-16	0
773	2020-04-17	0
774	2020-04-18	0
775	2020-04-19	0
776	2020-04-20	0
777	2020-04-21	0
778	2020-04-22	0
779	2020-04-23	0
780	2020-04-24	0
781	2020-04-25	0
782	2020-04-26	0
783	2020-04-27	0
784	2020-04-28	0
785	2020-04-29	0
786	2020-04-30	0
787	2020-05-01	0
788	2020-05-02	0
789	2020-05-03	0
790	2020-05-04	0
791	2020-05-05	0
792	2020-05-06	0
793	2020-05-07	0
794	2020-05-08	0
795	2020-05-09	0
796	2020-05-10	0
797	2020-05-11	0
798	2020-05-12	0
799	2020-05-13	0
800	2020-05-14	0
801	2020-05-15	0
802	2020-05-16	0
803	2020-05-17	0
804	2020-05-18	0
805	2020-05-19	0
806	2020-05-20	0
807	2020-05-21	0
808	2020-05-22	0
809	2020-05-23	0
810	2020-05-24	0
811	2020-05-25	0
812	2020-05-26	0
813	2020-05-27	0
814	2020-05-28	0
815	2020-05-29	0
816	2020-05-30	0
817	2020-05-31	0
818	2020-06-01	0
819	2020-06-02	0
820	2020-06-03	0
821	2020-06-04	0
822	2020-06-05	0
823	2020-06-06	0
824	2020-06-07	0
825	2020-06-08	0
826	2020-06-09	0
827	2020-06-10	0
828	2020-06-11	0
829	2020-06-12	0
830	2020-06-13	0
831	2020-06-14	0
832	2020-06-15	0
833	2020-06-16	0
834	2020-06-17	0
835	2020-06-18	0
836	2020-06-19	0
837	2020-06-20	0
838	2020-06-21	0
839	2020-06-22	0
840	2020-06-23	0
841	2020-06-24	0
842	2020-06-25	0
843	2020-06-26	0
844	2020-06-27	0
845	2020-06-28	0
846	2020-06-29	0
847	2020-06-30	0
848	2020-07-01	0
849	2020-07-02	0
850	2020-07-03	0
851	2020-07-04	0
852	2020-07-05	0
853	2020-07-06	0
854	2020-07-07	0
855	2020-07-08	0
856	2020-07-09	0
857	2020-07-10	0
858	2020-07-11	0
859	2020-07-12	0
860	2020-07-13	0
861	2020-07-14	0
862	2020-07-15	0
863	2020-07-16	0
864	2020-07-17	0
865	2020-07-18	0
866	2020-07-19	0
867	2020-07-20	0
868	2020-07-21	0
869	2020-07-22	0
870	2020-07-23	0
871	2020-07-24	0
872	2020-07-25	0
873	2020-07-26	0
874	2020-07-27	0
875	2020-07-28	0
876	2020-07-29	0
877	2020-07-30	0
878	2020-07-31	0
879	2020-08-01	0
880	2020-08-02	0
881	2020-08-03	0
882	2020-08-04	0
883	2020-08-05	0
884	2020-08-06	0
885	2020-08-07	0
886	2020-08-08	0
887	2020-08-09	0
888	2020-08-10	0
889	2020-08-11	0
890	2020-08-12	0
891	2020-08-13	0
892	2020-08-14	0
893	2020-08-15	0
894	2020-08-16	0
895	2020-08-17	0
896	2020-08-18	0
897	2020-08-19	0
898	2020-08-20	0
899	2020-08-21	0
900	2020-08-22	0
901	2020-08-23	0
902	2020-08-24	0
903	2020-08-25	0
904	2020-08-26	0
905	2020-08-27	0
906	2020-08-28	0
907	2020-08-29	0
908	2020-08-30	0
909	2020-08-31	0
910	2020-09-01	0
911	2020-09-02	0
912	2020-09-03	0
913	2020-09-04	0
914	2020-09-05	0
915	2020-09-06	0
916	2020-09-07	0
917	2020-09-08	438
918	2020-09-09	1620
919	2020-09-10	1805
920	2020-09-11	1891
921	2020-09-12	1530
922	2020-09-13	7575
923	2020-09-14	2024
924	2020-09-15	10170
925	2020-09-16	1996
926	2020-09-17	8016
927	2020-09-18	1725
928	2020-09-19	7975
929	2020-09-20	1857
930	2020-09-21	1597
931	2020-09-22	1125
932	2020-09-23	2687
933	2020-09-24	8355
934	2020-09-25	1382
935	2020-09-26	7690
936	2020-09-27	9088
937	2020-09-28	2659
938	2020-09-29	7656
939	2020-09-30	1244
940	2020-10-01	8003
941	2020-10-02	1172
942	2020-10-03	7969
943	2020-10-04	3424
944	2020-10-05	1894
945	2020-10-06	7434
946	2020-10-07	6426
947	2020-10-08	7451
948	2020-10-09	6567
949	2020-10-10	4850
950	2020-10-11	5810
951	2020-10-12	6079
952	2020-10-13	7746
953	2020-10-14	5212
954	2020-10-15	6535
955	2020-10-16	6197
956	2020-10-17	1231
957	2020-10-18	11179
958	2020-10-19	5872
959	2020-10-20	6843
960	2020-10-21	1889
961	2020-10-22	9267
962	2020-10-23	5548
963	2020-10-24	2179
964	2020-10-25	9865
965	2020-10-26	5693
966	2020-10-27	5441
967	2020-10-28	5182
968	2020-10-29	6475
969	2020-10-30	580
970	2020-10-31	5487
971	2020-11-01	10354
972	2020-11-02	8231
973	2020-11-03	6302
974	2020-11-04	5845
975	2020-11-05	4319
976	2020-11-06	7702
977	2020-11-07	6362
978	2020-11-08	3344
979	2020-11-09	5572
980	2020-11-10	6723
981	2020-11-11	4726
982	2020-11-12	5692
983	2020-11-13	4652
984	2020-11-14	6
985	2020-11-15	12052
986	2020-11-16	4380
987	2020-11-17	2398
988	2020-11-18	5442
989	2020-11-19	5703
990	2020-11-20	6031
991	2020-11-21	4696
992	2020-11-22	0
993	2020-11-23	6352
994	2020-11-24	6340
995	2020-11-25	5405
996	2020-11-26	1426
997	2020-11-27	6383
998	2020-11-28	5986
999	2020-11-29	1219
1000	2020-11-30	6225
1001	2020-12-01	7014
1002	2020-12-02	5442
1003	2020-12-03	2055
1004	2020-12-04	6514
1005	2020-12-05	6724
1006	2020-12-06	2112
1007	2020-12-07	11291
1008	2020-12-08	7838
1009	2020-12-09	5612
1010	2020-12-10	5048
1011	2020-12-11	1448
1012	2020-12-12	5290
1013	2020-12-13	1930
1014	2020-12-14	10431
1015	2020-12-15	5651
1016	2020-12-16	5235
1017	2020-12-17	5239
1018	2020-12-18	1231
1019	2020-12-19	9487
1020	2020-12-20	1603
1021	2020-12-21	4549
1022	2020-12-22	45
1023	2020-12-23	7545
1024	2020-12-24	4473
1025	2020-12-25	7187
1026	2020-12-26	24656
1027	2020-12-27	8879
1028	2020-12-28	19480
1029	2020-12-29	7416
1030	2020-12-30	18223
1031	2020-12-31	6167
1032	2021-01-01	11133
1033	2021-01-02	7955
1034	2021-01-03	20497
1035	2021-01-04	11099
1036	2021-01-05	19668
1037	2021-01-06	13896
1038	2021-01-07	24638
1039	2021-01-08	5010
1040	2021-01-09	2162
1041	2021-01-10	2608
1042	2021-01-11	2191
1043	2021-01-12	2148
1044	2021-01-13	1944
1045	2021-01-14	1052
1046	2021-01-15	1470
1047	2021-01-16	2466
1048	2021-01-17	4580
1049	2021-01-18	1523
1050	2021-01-19	4709
1051	2021-01-20	1093
1052	2021-01-21	6436
1053	2021-01-22	8741
1054	2021-01-23	2908
1055	2021-01-24	7833
1056	2021-01-25	8213
1057	2021-01-26	5447
1058	2021-01-27	5805
1059	2021-01-28	8279
1060	2021-01-29	7291
1061	2021-01-30	1306
1062	2021-01-31	4923
1063	2021-02-01	6057
1064	2021-02-02	3176
1065	2021-02-03	5857
1066	2021-02-04	7002
1067	2021-02-05	9655
1068	2021-02-06	5014
1069	2021-02-07	1776
1070	2021-02-08	1384
1071	2021-02-09	6914
1072	2021-02-10	6073
1073	2021-02-11	6641
1074	2021-02-12	212
1075	2021-02-13	5500
1076	2021-02-14	5704
1077	2021-02-15	2082
1078	2021-02-16	6641
1079	2021-02-17	5814
1080	2021-02-18	6544
1081	2021-02-19	1405
1082	2021-02-20	5410
1083	2021-02-21	7384
1084	2021-02-22	6183
1085	2021-02-23	2408
1086	2021-02-24	7517
1087	2021-02-25	6313
1088	2021-02-26	6547
1089	2021-02-27	5102
1090	2021-02-28	6677
1091	2021-03-01	6298
1092	2021-03-02	2318
1093	2021-03-03	7384
1094	2021-03-04	6122
1095	2021-03-05	6022
1096	2021-03-06	1709
1097	2021-03-07	5569
1098	2021-03-08	5561
1099	2021-03-09	1415
1100	2021-03-10	6097
1101	2021-03-11	6572
1102	2021-03-12	6212
1103	2021-03-13	1407
1104	2021-03-14	5614
1105	2021-03-15	2208
1106	2021-03-16	6293
1107	2021-03-17	5734
1108	2021-03-18	5905
1109	2021-03-19	1836
1110	2021-03-20	5746
1111	2021-03-21	4891
1112	2021-03-22	929
1113	2021-03-23	5977
1114	2021-03-24	8420
1115	2021-03-25	7209
1116	2021-03-26	5995
1117	2021-03-27	1476
1118	2021-03-28	6398
1119	2021-03-29	2492
1120	2021-03-30	8314
1121	2021-03-31	6270
1122	2021-04-01	3505
1123	2021-04-02	6273
1124	2021-04-03	2445
\.


--
-- TOC entry 3371 (class 0 OID 0)
-- Dependencies: 220
-- Name: activities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.activities_id_seq', 887, true);


--
-- TOC entry 3372 (class 0 OID 0)
-- Dependencies: 222
-- Name: activities_summary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.activities_summary_id_seq', 689, true);


--
-- TOC entry 3373 (class 0 OID 0)
-- Dependencies: 218
-- Name: heart_rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.heart_rates_id_seq', 1219, true);


--
-- TOC entry 3374 (class 0 OID 0)
-- Dependencies: 216
-- Name: sleeps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sleeps_id_seq', 3238, true);


--
-- TOC entry 3375 (class 0 OID 0)
-- Dependencies: 214
-- Name: steps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.steps_id_seq', 1124, true);


--
-- TOC entry 3206 (class 2606 OID 24636)
-- Name: activities activities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activities
    ADD CONSTRAINT activities_pkey PRIMARY KEY (id);


--
-- TOC entry 3208 (class 2606 OID 24653)
-- Name: activities_summary activities_summary_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activities_summary
    ADD CONSTRAINT activities_summary_pkey PRIMARY KEY (id);


--
-- TOC entry 3204 (class 2606 OID 24613)
-- Name: heart_rates heart_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.heart_rates
    ADD CONSTRAINT heart_rates_pkey PRIMARY KEY (id);


--
-- TOC entry 3202 (class 2606 OID 24600)
-- Name: sleeps sleeps_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sleeps
    ADD CONSTRAINT sleeps_pkey PRIMARY KEY (id);


--
-- TOC entry 3200 (class 2606 OID 24593)
-- Name: steps steps_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.steps
    ADD CONSTRAINT steps_pkey PRIMARY KEY (id);


-- Completed on 2023-04-07 20:03:42

--
-- PostgreSQL database dump complete
--

