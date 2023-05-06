--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7 (Ubuntu 14.7-1.pgdg22.04+1)
-- Dumped by pg_dump version 15.2 (Ubuntu 15.2-1.pgdg22.04+1)

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
-- Name: tree_species; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tree_species (
    pkey integer NOT NULL,
    species_latin character varying,
    species_german character varying
);


ALTER TABLE public.tree_species OWNER TO postgres;

--
-- Name: tree_species_pkey_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tree_species_pkey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tree_species_pkey_seq OWNER TO postgres;

--
-- Name: tree_species_pkey_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tree_species_pkey_seq OWNED BY public.tree_species.pkey;


--
-- Name: tree_species pkey; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tree_species ALTER COLUMN pkey SET DEFAULT nextval('public.tree_species_pkey_seq'::regclass);


--
-- Data for Name: tree_species; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tree_species (pkey, species_latin, species_german) FROM stdin;
1	Thuja occidentalis	Abendländischer Lebensbaum
2	Tamarix africana	Afrikanische Tamariske
3	Butyrospermum parkii	Afrikanischer Butterbaum
4	Khaya senegalensis	Afrikanischer Mahagonibaum
5	Spathodea campanulata	Afrikanischer Tulpenbaum
6	Afzelia africana	Afzelia
7	Brachychiton acerifolius	Ahornblättriger Flaschenbaum
8	Amelanchier spicata	Ährige Felsenbirne
9	Corylopsis spicata	Ährige Scheinhasel
10	Pinus halepensis	Aleppo-Kiefer
11	Danae racemosa	Alexandrinischer Lorbeer
12	Quercus canariensis 	Algerische Eiche
13	Laburnum alpinum	Alpen-Goldregen
14	Lonicera alpigena	Alpen-Heckenkirsche
15	Fagus grandifolia	Amerikanische Buche
16	Sorbus americana	Amerikanische Eberesche
17	Gleditsia triacanthos	Amerikanische Gleditschie
18	Carpinus caroliniana	Amerikanische Hainbuche
19	Vaccinium corymbosum	Amerikanische Heidelbeere
20	Castanea dentata	Amerikanische Kastanie
21	Campsis radicans	Amerikanische Klettertrompete
22	Tilia americana	Amerikanische Linde
23	Diospyros virginiana	Amerikanische Persimone
24	Salix irrorata	Amerikanische Reif-Weide
25	Liquidambar styraciflua	Amerikanischer Amberbaum
26	Arbutus menziesii	Amerikanischer Erdbeerbaum
27	Acer pensylvanicum	Amerikanischer Schlangenhaut-Ahorn
28	Cladrastis kentukea	Amerikanisches Gelbholz
29	Phellodendron amurense 	Amur-Korkbaum
30	Prunus maackii	Amur-Trauben-Kirsche
31	Araucaria araucana	Andentanne
32	Prunus armeniaca	Aprikose
33	Argania spinosa	Arganbaum
34	Cupressus arizonica	Arizona-Zypresse
35	Corylopsis pauciflora	Armblütige Scheinhasel
36	Magnolia officinalis	Arznei-Magnolie
37	Cedrus atlantica	Atlas-Zeder
38	Grevillea robusta	Australische Silbereiche
39	Persea americana	Avocado
40	Salix babylonica	Babylonische Trauer-Weide
41	Hypericum balearicum 	Balearen-Johanniskraut
42	Populus balsamifera	Balsam-Pappel
43	Abies balsamea	Balsam-Tanne
44	Rosa banksiae	Banks Rose
45	Pinus banksiana	Banks-Kiefer
46	Barringtonia asiatica	Barringtonia asiatica
47	Carpenteria californica 	Baum-Anemone
48	Kalopanax septemlobus	Baum-Aralie
49	Amelanchier arborea	Baum-Felsenbirne
50	Corylus colurna	Baum-Hasel
51	Erica arborea	Baum-Heide
52	Rhododendron hirsutum	Behaarte Alpenrose
53	Thymelaea hirsuta	Behaarte Spatzenzunge
54	Cistus symphytifolius	Beinwellblättrige Zistrose
55	Acer pseudoplatanus	Berg-Ahorn
56	Acer pseudoplatanus 'Leopoldii'	Berg-Ahorn 'Leopoldii'
57	Satureja montana	Berg-Bohnenkraut
58	Pinus mugo	Berg-Kiefer, Berg-Föhre
59	Prunus sargentii	Berg-Kirsche
60	Halesia monticola	Berg-Schneeglöckchenbaum
61	Ulmus glabra	Berg-Ulme
62	Clematis montana	Berg-Waldrebe
63	Cytisus scoparius	Besen-Ginster
64	Calluna vulgaris	Besenheide
65	Rosa spinosissima	Bibernell-Rose
66	Spiraea x billardii	Billards Spierstrauch
67	Betula insignis	Birke
68	Ficus benjamina	Birken-Feige
69	Populus simonii	Birken-Pappel
70	Pyrus betulifolia	Birkenblättrige Birne
71	Carya cordiformis	Bitternuss
72	Poncirus trifoliata	Bitterorange
73	Solanum dulcamara	Bittersüßer Nachtschatten
74	Tamarix aphylla	Blattlose Tamariske
75	Abies procera 'Glauca'	Blau-Tanne
76	Vaccinium myrtillus	Blaubeere
77	Cedrus atlantica 'Glauca'	Blaue Atlas-Zeder
78	Magnolia acuminata var. acuminata	Blaue Gurken-Magnolie
79	Coronilla valentina ssp. glauca	Blaue Kronwicke
80	Passiflora caerulea	Blaue Passionsblume
81	Picea pungens 'Glauca'	Blaue Stech-Fichte
82	Sambucus nigra ssp. caerulea	Blauer Holunder
83	Nicotiana glauca	Blaugrüner Tabak
84	Acer platanoides 'Crimson King'	Blut-Ahorn
85	Fagus sylvatica 'Purpurea'	Blut-Buche
86	Ribes sanguineum	Blut-Johannisbeere
87	Hypericum androsaemum	Blut-Johanniskraut
88	Prunus cerasifera 'Nigra'	Blut-Pflaume
89	Cornus florida	Blüten-Hartriegel
90	Cornus sanguinea	Blutroter Hartriegel
91	Rhamnus lycioides	Bocksdornartiger Kreuzdorn
92	Viburnum x bodnantense	Bodnant-Schneeball
93	Syringa reflexa	Bogen-Flieder
94	Picea asperata	Borsten-Fichte
95	Robinia hispida	Borstige Robinie
96	Pterostyrax hispidus	Borstiger Flügelstorax
97	Bougainvillea glabra	Bougainvillea
98	Feijoa sellowiana	Brasilianische Guave
99	Kalmia latifolia	Breitblättrige Lorbeerrose
100	Phillyrea latifolia	Breitblättrige Steinlinde
101	Clematis flammula	Brennende Waldrebe
102	Rubus fruticosus	Brombeere
103	Salix fragilis	Bruch-Weide
104	Allocasuarina luehmannii	Buloke
105	Clerodendrum bungei	Bunges Losbaum
106	Catalpa bungei	Bunges Trompetenbaum
107	Fagus sylvatica f. purpurea tricolor	Buntblättrige Buche
108	Actinidia kolomikta	Bunter Strahlengriffel
109	Osmanthus x burkwoodii	Burkwoods Duftblüte
110	Quercus ilicifolia	Busch-Eiche
111	Juglans cinerea	Butternuss
112	Aesculus x neglecta 'Erythroblastos'	Carolina-Rosskastanie
113	Halesia carolina	Carolina-Schneeglöckchenbaum
114	Anacardium occidentale	Cashew
115	Cassia siberiana	Cassia siberiana
116	Rhododendron catawbiense	Catawba-Rhododendron
117	Symphoricarpos x chenaultii	Chenault-Schneebeere
118	Annona cherimola	Cherimoya
119	Abelia chinensis	Chinesische Abelie
120	Pyrus calleryana 'Chanticleer'	Chinesische Birne
121	Decaisnea fargesii	Chinesische Blaugurke
122	Fraxinus paxiana	Chinesische Blumenesche
123	Ziziphus jujuba	Chinesische Dattel
124	Ficus microcarpa	Chinesische Feige
125	Pterocarya stenoptera	Chinesische Flügelnuss
126	Trachycarpus fortunei	Chinesische Hanfpalme
127	Campsis grandiflora	Chinesische Klettertrompete
128	Cephalotaxus sinensis	Chinesische Kopfeibe
129	Cephalotaxus fortunei	Chinesische Kopfeibe
130	Staphylea holocarpa	Chinesische Pimpernuss
131	Cunninghamia lanceolata	Chinesische Spießtanne
132	Ulmus parvifolia	Chinesische Ulme
133	Chimonanthus praecox	Chinesische Winterblüte
134	Chaenomeles speciosa	Chinesische Zierquitte
135	Liquidambar formosana	Chinesischer Amberbaum
136	Malus toringoides	Chinesischer Apfel
137	Paulownia tomentosa	Chinesischer Blauglockenbaum
138	Wisteria sinensis	Chinesischer Blauregen, Glyzine
139	Sinocalycanthus chinensis	Chinesischer Gewürzstrauch
140	Cercis chinensis	Chinesischer Judasbaum
141	Pittosporum tobira	Chinesischer Klebsame
142	Hibiscus rosa-sinensis 	Chinesischer Rosen-Eibisch
143	Chionanthus retusus	Chinesischer Schneeflockenstrauch
144	Trachelospermum jasminoides	Chinesischer Sternjasmin
145	Liriodendron chinense	Chinesischer Tulpenbaum
146	Maackia chinensis	Chinesisches Gelbholz
147	Metasequoia glyptostroboides	Chinesisches Rotholz
148	Paliurus spina-christi	Christdorn
149	Acer cissifolium	Cissusblättriger Ahorn
150	Abies concolor	Colorado-Tanne
151	Pinus coulteri	Coulter-Kiefer
152	Araucaria cunninghamii	Cunninghams Araukarie
153	Casuarina cunninghamiana	Cunninghams Kasuarine
154	Exochorda giraldii	Dahurische Radspiere
155	Prunus davidiana	Davids Pfirsich
156	Viburnum davidii	Davids Schneeball
157	Acer davidii	Davids-Ahorn
158	Photinia davidiana	Davids-Glanzmispel
159	Pinus armandii	Davids-Kiefer
160	Choisya x dewitteana	Dewittes Orangenblume
161	Pittosporum crassifolium	Dickblättriger Klebsame
162	Ehretia dicksonii	Dicksons Ehretia
163	Cotoneaster dielsianus	Diels Zwergmispel
164	Pterostyrax corymbosus	Doldiger Flügel-Storax
165	Betula utilis var. jacquemontii 'Doorenbos'	Doorenbos Weißrindige Himalaja-Birke
166	Hemiptelea davidii	Dorn-Ulme
167	Elaeagnus pungens	Dornige Ölweide
168	Pseudotsuga menziesii	Douglasie
169	Salix udensis f. sekka	Drachen-Weide
170	Dracaena draco	Drachenbaum
171	Pinus contorta	Dreh-Kiefer
172	Acer triflorum	Dreiblütiger Ahorn
173	Malus trilobata	Dreilappiger Apfel
174	Acer buergerianum	Dreizähniger Ahorn
175	Acer platanoides f. drummondii	Drummonds Spitz-Ahorn
176	Viburnum farreri	Duftender Schneeball
177	Sorbus aucuparia	Eberesche
178	Phoenix dactylifera	Echte Dattelpalme
179	Sorbus aria	Echte Mehlbeere
180	Aesculus pavia	Echte Pavie
181	Pistacia vera	Echte Pistazie
182	Cydonia oblonga	Echte Quitte
183	Juglans regia	Echte Walnuss
184	Vitis vinifera	Echte Weinrebe
185	Ficus carica	Echter Feigenbaum
186	Calycanthus floridus	Echter Gewürzstrauch
187	Humulus lupulus	Echter Hopfen
188	Jasminum officinale	Echter Jasmin
189	Salvia officinalis	Echter Salbei
190	Styrax officinalis	Echter Storaxbaum
191	Thymus vulgaris	Echter Thymian
192	Artemisia absinthum	Echter Wermut
193	Lonicera caprifolium	Echtes Geißblatt
194	Abies procera	Edel-Tanne
195	Hydrangea quercifolia	Eichblatt-Hortensie
196	Fagus sylvatica f. quercifolia	Eichenblättrige Buche
197	Carpinus betulus 'Quercifolia'	Eichenblättrige Hainbuche
198	Fraxinus excelsior f. diversifolia	Einblatt-Esche
199	Crataegus monogyna	Eingriffeliger Weißdorn
200	Pinus monophylla	Einnnadelige Kiefer
201	Sorbus torminalis	Elsbeere
202	Picea engelmanii	Engelmanns Fichte
203	Fagus engleriana	Englers Buche
204	Betula alnoides subsp. alnoides	Erlenblättrige Birke
205	Sorbus alnifolia	Erlenblättrige Mehlbeere
206	Clethra alnifolia	Erlenblättrige Zimterle
207	Viburnum lantanoides	Erlenblättriger Schneeball
208	Acer negundo	Eschen-Ahorn
209	Castanea sativa	Ess-Kastanie
210	Rhus typhina	Essig-Baum
211	Rosa gallica	Essig-Rose
212	Lonicera etrusca	Etruskisches Geißblatt
213	Larix decidua	Europäische Lärche
214	Chamaerops humilis	Europäische Zwergpalme
215	Acer palmatum	Fächer-Ahorn
216	Cotoneaster horizontalis	Fächer-Zwergmispel
217	Quercus petraea 'Laciniata Crispa'	Fadenblatt-Eiche
218	Quercus velutina	Färber-Eiche
219	Genista tinctoria	Färber-Ginster
220	Indigofera tinctoria	Färber-Indigostrauch
221	Fagus sylvatica 'Asplenifolia'	Farnblättrige Buche
222	Acer campestre	Feld-Ahorn
223	Ulmus minor	Feld-Ulme
224	Fagus sylvatica 'Felderbach'	Felderbach-Buche
225	Acer monspessulanum	Felsen-Ahorn
226	Abies lasiocarpa	Felsen-Gebirgstanne
227	Ribes petraeum	Felsen-Johannisbeere
228	Prunus mahaleb	Felsen-Kirsche
229	Rhamnus saxatilis	Felsen-Kreuzdorn
230	Juniperus scopulorum 	Felsengebirgs-Wacholder
231	Sassafras albidum	Fenchelholzbaum
232	Acer tataricum subsp. ginnala	Feuer-Ahorn
233	Pyracantha coccinea	Feuerdorn
234	Crataegus pinnatifida	Fiederblatt-Weißdorn
235	Rosa tomentosa	Filz-Rose
236	Aronia arbutifolia	Filzige Apfelbeere
237	Akebia quinata	Fingerblättrige Akebie
238	Dasiphora fruticosa	Fingerstrauch
239	Delonix regia	Flammenbaum
240	Ulmus laevis	Flatter-Ulme
241	Quercus pubescens	Flaum-Eiche
242	Cotoneaster floccosus	Flockige Zwergmispel
243	Ceiba speciosa	Florettseidenbaum
244	Euonymus alatus	Flügel-Spindelstrauch
245	Forsythia x intermedia	Forsythie
246	Plumeria rubra	Frangipani
247	Ceanothus x delilianus	Französische Hybrid-Säckelblume
248	Acer x freemanii	Freemans Ahorn
249	Calycanthus fertilis	Fruchtbarer Gewürzstrauch
250	Enkianthus perulatus	Frühblühende Prachtglocke
251	Tamarix parviflora	Frühlings-Tamariske
252	Prunus incisa	Fuji-Kirsche
253	Hydrangea macrophylla	Garten-Hortensie
254	Leuocothoe fontanesiana	Gebogene Traubenheide
255	Viburnum opulus f. roseum	Gefüllter Gewöhnlicher Schneeball
256	Viburnum plicatum f. sterile	Gefüllter Japanischer Schneeball
257	Betula alleghaniensis	Gelb-Birke
258	Pinus ponderosa	Gelb-Kiefer
259	Fagus sylvatica f. luteo-variegata	Gelbbunte Buche
260	Aesculus flava	Gelbe Rosskastanie
261	Tecoma stans	Gelbe Trompetenblume
262	Peltophorum pterocarpum	Gelber Flammenbaum
263	Buddleja x weyeriana	Gelber Sommerflieder
264	Catalpa ovata	Gelber Trompetenbaum
265	Xanthoceras sorbifolium	Gelbhorn
266	Vachellia xanthophloea	Gelbrinden-Akazie
267	Fagus sylvatica	Gemeine Buche
268	Taxus baccata	Gemeine Eibe
269	Fraxinus excelsior	Gemeine Esche
270	Amelanchier ovalis	Gemeine Felsenbirne
271	Picea abies	Gemeine Fichte
272	Corylus avellana	Gemeine Hasel
273	Myrtus communis 	Gemeine Myrte
274	Aesculus hippocastanum	Gemeine Rosskastanie
275	Symphoricarpos albus	Gemeine Schneebeere
276	Prunus padus	Gemeine Trauben-Kirsche
277	Lycium barbarum	Gemeiner Bocksdorn
278	Frangula alnus	Gemeiner Faulbaum
279	Viburnum opulus	Gemeiner Schneeball
280	Juniperus communis	Gemeiner Wacholder
281	Euonymus europaeus	Gemeines Pfaffenhütchen
282	Betula costata	Gerippte Birke
283	Acer platanoides 'palmatifidum'	Geschlitzter Spitz-Ahorn
284	Acer caudatum subsp. caudatum	Geschwänzter Ahorn
285	Gymnocladus dioicus 	Geweihbaum
286	Berberis vulgaris	Gewöhnliche Berberitze
287	Parthenocissus inserta	Gewöhnliche Jungfernrebe
288	Mahonia aquifolium	Gewöhnliche Mahonie
289	Platanus x hispanica	Gewöhnliche Platane
290	Clematis vitalba	Gewöhnliche Waldrebe
291	Cotoneaster integerrimus	Gewöhnliche Zwergmispel
292	Amorpha fructicosa	Gewöhnlicher Bastardindigo
293	Colutea arborescens	Gewöhnlicher Blasenstrauch
294	Buxus sempervirens	Gewöhnlicher Buchsbaum
295	Hedera helix	Gewöhnlicher Efeu
296	Caragana arborescens	Gewöhnlicher Erbsenstrauch
297	Eucalyptus globulus	Gewöhnlicher Eukalyptus
298	Syringa vulgaris	Gewöhnlicher Flieder
299	Laburnum anagyroides	Gewöhnlicher Goldregen
300	Cercis siliquastrum	Gewöhnlicher Judasbaum
301	Ligustrum vulgare	Gewöhnlicher Liguster
302	Cotinus coggygria	Gewöhnlicher Perückenstrauch
303	Daphne mezereum	Gewöhnlicher Seidelbast
304	Buddleja davidii	Gewöhnlicher Sommerflieder
305	Senna x floribunda	Gewürzstrauch
306	Lavandula dentata	Gezähnter Lavendel
307	Corymbia dallachiana	Ghost Tree
308	Ginkgo biloba L.	Ginkgobaum
309	Ligustrum lucidum	Glänzender Liguster
310	Cupressus glabra	Glatte Arizona-Zypresse
311	Erica tetralix	Glocken-Heide
312	Betula ermanii	Gold-Birke Hybride
313	Ribes aureum	Gold-Johannisbeere
314	Aesculus hippocastanum f. memingeri	Gold-Kastanie
315	Robinia pseudoacacia 'Frisia'	Gold-Robinie
316	Ulmus minor 'Wredei'	Gold-Ulme
317	Pseudolarix amabilis	Goldlärche
318	Ailanthus altissima	Götterbaum
319	Punica granatum	Granatapfel
320	Pinus aristata	Grannen-Kiefer
321	Alnus incana	Grau-Erle
322	Erica cinerea	Grau-Heide
323	Populus x canescens	Grau-Pappel
324	Salix cinerea	Grau-Weide
325	Prunus incana	Graue Kirschmandel
326	Cistus incanus	Graue Zistrose
327	Santolina chamaecyparissus	Graues Heiligenkraut
328	Abies cephalonica	Griechische Tanne
329	Fagus sylvatica f. grandidentata	Grobgezähnte Buche
330	Populus lasiocarpa	Großblatt-Pappel
331	Ficus macrophylla	Großblättrige Feige
332	Magnolia macrophylla	Großblättrige Magnolie
333	Viburnum x carlcephalum	Großblumiger Duft-Schneeball
334	Abelia x grandiflora	Großblütige Abelie
335	Crataemespilus grandiflora	Großblütige Weißdorn-Mispel
336	Fothergilla major	Großer Federbuschstrauch
337	Euonymus planipes	Großfrüchtiges Pfaffenhütchen
338	Acer davidii subsp. grosserii	Grossers Ahorn
339	Alnus viridis	Grün-Erle
340	Ficus elastica	Gummibaum
341	Magnolia acuminata	Gurken-Magnolie
342	Eucommia ulmoides	Guttaperchabaum
343	Prunus domestica ssp. insititia	Hafer-Pflaume
344	Cryptomeria japonica f. cristata	Hahnenkamm-Sicheltanne
345	Carpinus betulus	Hainbuche
346	Acer carpinifolium 	Hainbuchenblättriger Ahorn
347	Pinus uncinata	Haken-Kiefer
348	Betula pendula	Hänge-Birke, Weiß-Birke
349	Fagus sylvatica 'Pendula'	Hänge-Buche
350	Fraxinus excelsior f. pendula	Hänge-Esche
351	Picea abies 'Inversa'	Hänge-Fichte
352	Tilia tomentosa f. petiolaris	Hänge-Silber-Linde
353	Salix caprea 'Kilmarnock'	Hängekätzchen-Weide
354	Malvaviscus penduliflorus	Hängender Schlafender Hibiskus
355	Salix integra 'Hakuro Nishiki'	Harlekin-Weide
356	Cephalotaxus harringtonia	Harringtons Kopfeibe
357	Lonicera x heckrottii	Heckrotts Geißblatt
358	Lonicera henryi	Henrys Heckenkirsche
359	Tilia henryana	Henrys Linde
360	Camellia sasanqua	Herbst-Kamelie
361	Salvia greggii	Herbst-Salbei
362	Thujopsis dolabrata	Hiba-Lebensbaum
363	Prunus subhirtella	Higan-Kirsche
364	Sarcococca hookeriana var. humilis	Himalaja-Fleischbeere
365	Indigofera heterantha	Himalaja-Indigostrauch
366	Cedrus deodara	Himalaja-Zeder
367	Cedrus deodara 'Paktia'	Himalaja-Zeder 'Paktia'
368	Cotoneaster frigidus	Himalaya-Baummispel
369	Rubus idaeus	Himbeere
370	Nandina domestica	Himmelsbambus
371	Chamaecyparis obtusa	Hinoki-Scheinzypresse
372	Pinus attenuata	Höcker-Kiefer
373	Tilia x europaea	Holländische Linde
374	Malus sylvestris	Holz-Apfel
375	Pyrus pyraster	Holz-Birne
376	Pseudocydonia sinensis	Holz-Quitte
377	Bauhinia x blakeana	Hong-Kong-Orchideenbaum
378	Osyris alba	Honigduftender Rutenstrauch
379	Freylinia lanceolata	Honigglockenbusch
380	Magnolia obovata	Honoki-Magnolie
381	Ostrya carpinifolia	Hopfenbuche
382	Rosa canina	Hunds-Rose
383	Campsis x tagliabuana	Hybrid-Klettertrompete
384	Larix x marschlinsii	Hybrid-Lärche
385	Hamamelis x intermedia	Hybrid-Zaubernuss
386	Acacia retinodes	Immerblühende Akazie
387	Ceanothus hybridus	Immergrüne Hybrid-Säckelblume
388	Lonicera pileata	Immergrüne Kriech-Heckenkirsche
389	Magnolia grandiflora	Immergrüne Magnolie
390	Clematis armandii	Immergrüne Waldrebe
391	Rhamnus alaternus	Immergrüner Kreuzdorn
392	Asimina triloba	Indianerbanane
393	Lagerstroemia indica	Indische Lagerstroemie
394	Aesculus indica	Indische Rosskastanie
395	Distylium racemosum	Isu-Baum
396	Alnus cordata	Italienische Erle
397	Helichrysum italicum	Italienische Strohblume
398	Clematis viticella	Italienische Waldrebe
399	Cupressus sempervirens	Italienische Zypresse
400	Acer opalus ssp. obtusatum	Italienischer Ahorn
401	Prunus mume	Japanische Aprikose
402	Prunus serrulata 'Kanzan'	Japanische Blüten-Kirsche
403	Amelanchier asiatica	Japanische Felsenbirne
404	Pterocarya rhoifolia	Japanische Flügelnuss
405	Aucuba japonica	Japanische Goldorange
406	Carpinus japonica	Japanische Hainbuche
407	Tsuga diversifolia	Japanische Hemlocktanne
408	Quercus dentata	Japanische Kaiser-Eiche
409	Kultivar Camellia japonica	Japanische Kamelie
410	Castanea crenata	Japanische Kastanie
411	Cornus officinalis	Japanische Kornelkirsche
412	Larix kaempferi	Japanische Lärche
413	Pieris japonica	Japanische Lavendelheide
414	Prunus tomentosa	Japanische Mandel-Kirsche
415	Aesculus turbinata	Japanische Rosskastanie
416	Skimmia japonica	Japanische Skimmie
417	Ilex crenata	Japanische Stechpalme
418	Juglans ailantifolia	Japanische Walnuss
419	Eriobotrya japonica	Japanische Wollmispel
420	Zelkova serrata	Japanische Zelkove
421	Chaenomeles japonica	Japanische Zierquitte
422	Clethra barbinervis	Japanische Zimterle
423	Aralia elata	Japanischer Angelikabaum
424	Wisteria floribunda	Japanischer Blauregen, Glyzine
425	Cornus kousa	Japanischer Blumen-Hartriegel
426	Acer japonicum 'Aconitifolium'	Japanischer Feuer-Ahorn
427	Ligustrum japonicum	Japanischer Liguster
428	Edgeworthia chrysantha	Japanischer Papierbusch
429	Stachyurus praecox	Japanischer Perlschweif
430	Hovenia dulcis	Japanischer Rosinenbaum
431	Cycas revoluta	Japanischer Sagopalmfarn
432	Acer palmatum 'Dissectum Viridis'	Japanischer Schlitzahorn
433	Viburnum plicatum	Japanischer Schneeball
434	Styphnolobium japonicum	Japanischer Schnurbaum
435	Spiraea japonica	Japanischer Spierstrauch
436	Styrax japonicus	Japanischer Storaxbaum
437	Lonicera japonica	Japanisches Geißblatt
438	Euonymus japonicus	Japanisches Pfaffenhütchen
439	Solanum jasminoides	Jasminblütiger Nachtschatten
440	Pinus jeffreyi	Jeffrey-Kiefer
441	Parkinsonia aculeata	Jerusalemsdorn
442	Ceratonia siliqua	Johannisbrotbaum
443	Berberis julianae	Julianes Berberitze
444	Aronia melanocarpa	Kahle Apfelbeere
445	Amelanchier laevis	Kahle Felsenbirne
446	Photinia x fraseri	Kahle Glanzmispel
447	Diospyros kaki 	Kakipflaume
448	Torreya californica	Kalifornische Nusseibe
449	Washingtonia filifera	Kalifornische Palme
450	Cinnamomum camphora	Kampferbaum
451	Lonicera kamtschatica	Kamtschatka-Heckenkirsche
452	Populus x canadensis	Kanada-Pappel
453	Tsuga canadensis	Kanadische Hemlock
454	Cercis canadensis	Kanadischer Judasbaum
455	Viburnum lentago	Kanadischer Schneeball
456	Phoenix canariensis	Kanarische Dattelpalme
457	Pinus canariensis	Kanarische Kiefer
458	Arbutus canariensis	Kanarischer Erdbeerbaum
459	Plumbago auriculata	Kap-Bleiwurz
460	Capparis spinosa	Kapernstrauch
461	Tecoma capensis	Kapgeißblatt
462	Averrhoa carambola	Karambole
463	Carissa edulis	Karandapflaume
464	Callistemon citrinus	Karminroter Zylinderputzer
465	Acacia karroo	Karroo-Akazie
466	Rosa rugosa	Kartoffel-Rose
467	Quercus castaneifolia	Kastanienblättrige Eiche
468	Casuarina stricta	Kasuarine
469	Cercidiphyllum japonicum	Katsurabaum
470	Pterocarya fraxinifolia	Kaukasische Flügelnuss
471	Tilia dasystyla	Kaukasische Linde
472	Prunus fenziliana	Kaukasische Mandel
473	Zelkova carpinifolia	Kaukasische Zelkove
474	Rhamnus imeretina	Kaukasischer Faulbaum
475	Picea orientalis	Kaukasus-Fichte
476	Fagus crenata	Kerb-Buche
477	Quercus coccifera	Kermes-Eiche
478	Yucca gloriosa	Kerzen-Palmlilie
479	Senna didymobotrya	Kerzenstrauch
480	Prunus laurocerasus	Kirschlorbeer
481	Prunus cerasifera	Kirschpflaume
482	Actinidia deliciosa	Kiwi
483	Ptelea trifoliata	Kleeulme
484	Abies equi-trojani	Kleinasiatische Tanne
485	Stephanandra incisa	Kleine Kranzspiere
486	Actinidia arguta	Kleinfruchtige Kiwi
487	Juglans microcarpa	Kleinfruchtige Walnuss
488	Rubia peregrina	Kletten-Krapp
489	Quercus macrocarpa	Klettenfrüchtige Eiche
490	Hydrangea petiolaris	Kletter-Hortensie
491	Euonymus fortunei	Kletternder Spindelstrauch
492	Cephalanthus occidentalis	Knopfstrauch
493	Magnolia kobus	Kobushi-Magnolie
494	Bauhinia kockiana	Kocks Bauhinie
495	Cocos nucifera	Kokospalme
496	Staphylea colchica	Kolchische Pimpernuss
497	Acer cappadocicum	Kolchischer Ahorn
498	Kolkwitzia amabilis	Kolkwitzie
499	Carya laciniosa	Königsnuss
500	Erythrina crista-galli	Korallenbaum
501	Salix viminalis	Korb-Weide
502	Pinus koraiensis	Korea-Kiefer
503	Abies koreana	Korea-Tanne
504	Berberis koreana	Koreanische Berberitze
505	Acer tegmentosum	Koreanischer Schlangenhaut-Ahorn
506	Viburnum carlesii	Koreanischer Schneeball
507	Quercus suber	Kork-Eiche
508	Corylus avellana 'Contorta'	Korkenzieher-Hasel
509	Salix matsudana 'Tortuosa'	Korkenzieher-Weide
510	Cornus mas	Kornelkirsche
511	Pinus nigra var. laricio	Korsische Kiefer
512	Pittosporum undulatum	Krausblättriger Klebsame
513	Cistus crispus	Krause Zistrose
514	Cistus incanus ssp. creticus	Kretische Zistrose
515	Acer sempervirens	Kretischer Ahorn
516	Tilia x euchlora	Krim-Linde
517	Buddleja globosa	Kugelblütiger Sommerflieder
518	Malus domestica	Kultur-Apfel
519	Pyrus communis	Kultur-Birne
520	Ribes uva-crispa var. sativum	Kultur-Stachelbeere
521	Fortunella margarita	Kumquat
522	Amelanchier lamarckii	Kupfer-Felsenbirne
523	Prunus nipponica var. kurilensis	Kurilen-Kirsche
524	Sequoia sempervirens	Küsten-Mammutbaum
525	Abies grandis	Küsten-Tanne
526	Brachychiton discolor	Lacebark Flaschenbaum
527	Rubus spectabilis	Lachs-Himbeere
528	Cistus ladanifer	Lack-Zistrose
529	Corylus maxima	Lamberts-Hasel
530	Deutzia longifolia	Langblättrige Deutzie
531	Chamaecyparis lawsoniana	Lawsons Scheinzypresse
532	Quercus x leana	Leas Eiche
533	Acer coriaceifolium	Lederblatt-Ahorn
534	Crataegus x lavallei 'Carrierei'	Lederblättriger Weißdorn
535	Ficus lyrata	Leier-Feige
536	Citharexylum spinosum	Leierholz
537	Betula alnoides subsp. luminifera	Leuchtende Birke
538	Cedrus libani	Libanon Zeder
539	Quercus libani	Libanon-Eiche
540	Weigela florida	Liebliche Weigelie
541	Betula maximowicziana	Lindenblättrige Birke
542	Daphne laureola	Lorbeer-Seidelbast
543	Laurus nobilis	Lorbeerbaum
544	Cistus laurifolius	Lorbeerblättrige Zistrose
545	Viburnum tinus	Lorbeerblättriger Schneeball
546	Clerodendrum trichotomum	Losbaum
547	Diospyros lotus	Lotuspflaume
548	Lonicera maackii	Maacks Heckenkirsche
549	Lonicera implexa	Macchien-Geißblatt
550	Pachypodium lamerei	Madagaskarpalme
551	Pinus parviflora	Mädchen-Kiefer
552	Prunus serrula	Mahagoni-Kirsche
553	Prunus dulcis	Mandelbaum
554	Prunus triloba	Mandelbäumchen
555	Abies holophylla	Mandschurische Tanne
556	Acer mandshuricum	Mandschurischer Ahorn
557	Adonidia merrillii	Manilapalme
558	Fraxinus ornus	Manna-Esche
559	Pistacia lentiscus	Mastixstrauch
560	Ficus sycomorus	Maulbeer-Feige
561	Prosopis juliflora Prosopis juliflora 	Mesquite
562	Washingtonia robusta	Mexikanische Fächerpalme
563	Choisya ternata	Mexikanische Orangenblume
564	Prunus domestica ssp. syriaca	Mirabelle
565	Mespilus germanica	Mispel
566	Quercus petraea Mespilifolia Group	Mispelblättrige Eiche
567	Viscum album	Mistel
568	Daphne gnidium	Mittelmeer-Seidelbast
569	Mahonia x media	Mittlere Mahonie
570	Vitex agnus-castus	Mönchspfeffer
571	Betula dahurica	Mongolische Birke
572	Tilia mongolica	Mongolische Linde
573	Cistus monspeliensis	Montpelier-Zistrose
574	Betula pubescens	Moor-Birke
575	Platanus orientalis	Morgenländische Platane
576	Platycladus orientalis	Morgenländischer Lebensbaum
577	Myoporum serratum	Myoporum serratum
578	Polygala myrtifolia	Myrtenblättrige Kreuzblume
579	Pyrus pyrifolia var. culta	Nashi-Birne
580	Carissa macrocarpa	Natalpflaume
581	Metrosideros excelsa	Neuseeländischer Weihnachtsbaum
582	Gaultheria procumbens	Niedere Scheinbeere
583	Abies homolepis	Nikko-Tanne
584	Xanthocyparis nootkatensis	Nootka-Scheinzypresse
585	Abies nordmanniana	Nordmanns Tanne
586	Lagunaria patersonia	Norfolk-Hibiskus
587	Araucaria heterophylla	Norfolktanne
588	Cornus nuttallii	Nutalls Blumen-Hartriegel
589	Styrax obassia	Obassia-Storaxbaum
590	Aesculus glabra 	Ohio-Rosskastanie
591	Salix aurita	Ohr-Weide
592	Olea europaea	Ölbaum, Olive
593	Nerium oleander	Oleander
594	Citrus x aurantium	Orange
595	Idesia polycarpa	Orangenkirsche
596	Acer macrophyllum	Oregon-Ahorn
597	Fraxinus latifolia	Oregon-Esche
598	Fagus orientalis	Orient-Buche
599	Liquidambar orientalis	Orientalischer Amberbaum
600	Maclura pomifera	Osagedorn
601	Viburnum x burkwoodii	Oster-Schneeball
602	Quercus calliprinos	Palästina-Eiche
603	Jacaranda mimosifolia	Palisanderholzbaum
604	Pinus heldreichii	Panzer-Kiefer
605	Betula papyrifera	Papier-Birke
606	Broussonetia papyrifera	Papiermaulbeerbaum
607	Betula populifolia	Pappelblättrige Birke Hybride
608	Cistus populifolius	Pappelblättrige Zistrose
609	Brachychiton populneus	Pappelblättriger Flaschenbaum
610	Caesalpinia gilliesii	Paradiesvogelbusch
611	Melia azedarach	Paternosterbaum
612	Paulownia hybridus	Paulownia-Hybride
613	Carya illinoinensis	Pekannuss
614	Quercus macranthera 	Persische Eiche
615	Parrotia persica	Persischer Eisenholzbaum
616	Petteria ramentacea	Petterie
617	Quercus stellata	Pfahl-Eiche
618	Schinus molle	Pfefferbaum
619	Philadelphus coronarius	Pfeifenstrauch
620	Philadelphus x virginalis	Pfeifenstrauch, Virginalis-Gruppe
621	Prunus persica	Pfirsich
622	Juniperus x pfitzeriana	Pfitzers Wacholder
623	Prunus domestica	Pflaume
624	Aronia x prunifolia	Pflaumenblättrige Apfelbeere
625	Spartium junceum	Pfriemenginster
626	Staphylea pinnata	Pimpernuss
627	Pinus pinea	Pinie
628	Alangium platanifolium	Platanenblättrige Alangie
629	Morus alba f. macrophylla	Platanenblättriger Maulbeerbaum
630	Quercus pontica 	Pontische Eiche
631	Quercus faginea	Portugiesische Eiche
632	Prunus lusitanica	Portugiesische Lorbeer-Kirsche
633	Spiraea x vanhouttei	Pracht-Spierstrauch
634	Enkianthus campanulatus	Prachtglocke
635	Bougainvillea spectabilis	Prächtige Bougainvillea
636	Lagerstroemia speciosa	Prächtige Lagerstroemie
637	Catalpa speciosa	Prächtiger Trompetenbaum
638	Vaccinium vitis-idaea	Preißelbeere
639	Prunus 'Accolade'	Prunus 'Accolade'
640	Prunus 'Kursar'	Prunus 'Kursar'
641	Prunus avium 'Plena'	Prunus avium 'Plena'
642	Prunus cerasifera 'Rosea'	Prunus cerasifera 'Rosea'
643	Prunus cerasus 'Rhexii'	Prunus cerasus 'Rhexii'
644	Rhamnus cathartica	Purgier-Kreuzdorn
645	Malus x purpurea	Purpur-Apfel
646	Magnolia liliiflora	Purpur-Magnolie
647	Callicarpa dichotoma	Purpur-Schönfrucht
648	Salix purpurea	Purpur-Weide
649	Catalpa x erubescens	Purpurblättriger Trompetenbaum
650	Lonicera x purpusii 'Winter Beauty'	Purpus Heckenkirsche
651	Populus nigra 'Italica'	Pyramiden-Pappel
652	Quercus pyrenaica 	Pyrenäen-Eiche
653	Pinus nigra var. salzmanii	Pyrenäen-Kiefer
654	Schefflera actinophylla	Queensland Strahlenaralie
655	Araucaria bidwillii	Queensland-Araukarie
656	Brachychiton rupestris	Queensland-Flaschenbaum
657	Pyrocydonia daniellii	Quittenbirne
658	Trochodendron aralioides	Radbaum
659	Samanea saman	Rain Tree
660	Kerria japonica 'Pleniflora'	Ranunkelstrauch
661	Deutzia scabra	Raublättrige Deutzie
662	Calocedrus decurrens 'Aureovariegata'	Rauchzypresse
663	Calocedrus decurrens	Rauchzypresse, Flusszeder
664	Smilax aspera	Raue Stechwinde
665	Hydrangea aspera ssp. aspera	Rauhe Hortensie
666	Vaccinium uliginosum	Rauschbeere
667	Ilex pernyi	Rautenblättrige Stechpalme
668	Tetrapanax papyrifer	Reispapierbaum
669	Prunus domestica subsp. italica	Reneklode
670	Cornus controversa	Riesen-Hartriegel
671	Thuja plicata	Riesen-Lebensbaum
672	Sequoiadendron giganteum	Riesen-Mammutbaum
673	Cornus racemosa	Rispen-Hartriegel
674	Hydrangea paniculata	Rispen-Hortensie
675	Koelreuteria paniculata	Rispiger Blasenbaum
676	Robinia x margaretta 'Casque Rouge'	Robinia x margaretta
677	Robinia pseudoacacia	Robinie
678	Podranea ricasoliana	Rosa Klettertrompete
679	Deutzia x hybrida	Rosen-Deutzie
680	Pereskia bleo	Rosen-Kaktus
681	Rosmarinus officinalis	Rosmarin
682	Andromeda polifolia	Rosmarinheide
683	Aesculus x mutabilis 'Penduliflora'	Rosskastanien-Hybrid
684	Rhododendron ferrugineum	Rostblättrige Alpenrose
685	Acer rufinerve	Rostnerviger Schlangenhaut-Ahorn
686	Vitis coignetiae	Rostrote Weinrebe
687	Acer rubrum	Rot-Ahorn
688	Quercus rubra	Rot-Eiche
689	Fraxinus pennsylvanica	Rot-Esche
690	Juniperus oxycedrus	Rotbeeriger Wacholder
691	Rosa glauca	Rotblatt-Rose
692	Acer pseudoplatanus f. atropurpureum	Rotblättriger Berg-Ahorn
693	Aesculus x carnea	Rotblühende Rosskastanie
694	Crataegus laevigata 'Paul's Scarlet'	Rotdorn
695	Lonicera xylosteum	Rote Heckenkirsche
696	Ribes rubrum	Rote Johannisbeere
697	Acer capillipes	Roter Schlangenhaut-Ahorn
698	Pinus peuce	Rumelische Kiefer
699	Viburnum rhytidophyllum	Runzelblättriger Schneeball
700	Cotoneaster bullatus	Runzelige Zwergmispel
701	Juniperus sabina	Sadebaum
702	Crataegus succulenta var. macrantha	Saft-Weißdorn
703	Salix caprea	Sal-Weide
704	Cistus salviifolius	Salbeiblättrige Zistrose
705	Halimodendron halodendron	Salzstrauch
706	Tetradium daniellii	Samthaarige Stinkesche
707	Hura crepitans	Sandbüchsenbaum
708	Hippophae rhamnoides	Sanddorn
709	Malus sargentii	Sargents Apfel
710	Hydrangea aspera ssp. sargentiana	Sargents Samt-Hortensie
711	Prunus cerasus	Sauer-Kirsche
712	Oxydendrum arboreum 	Sauerbaum
713	Araucaria columnaris	Säulen-Araukarie
714	Quercus robur f. fastigiata	Säulen-Stiel-Eiche
715	Chamaecyparis pisifera	Sawara-Scheinzypresse
716	Chamaecyparis pisifera f. squarrosa	Sawara-Scheinzypresse Squarrosa-Form
717	Quercus coccinea	Scharlach-Eiche
718	Fuchsia magellanica	Scharlach-Fuchsie
719	Crataegus pedicellata	Scharlach-Weißdorn
720	Holodiscus discolor	Schaumspiere
721	Stewartia pseudocamellia	Scheinkamelie
722	Rhodotypos scandens	Scheinkerrie
723	Parrotiopsis jaquemontiana	Scheinparrotie
724	Quercus imbricaria	Schindel-Eiche
725	Magnolia tripetala	Schirm-Magnolie
726	Elaeagnus umbellata	Schirm-Ölweide
727	Sciadopitys verticillata	Schirmtanne
728	Pinus leucodermis	Schlangenhaut-Kiefer
729	Prunus spinosa	Schlehe
730	Fallopia baldschuanica	Schling-Knöterich
731	Fagus sylvatica f. laciniata	Schlitzblättrige Buche
732	Betula pendula f. dalecarlica	Schlitzblättrige Hänge-Birke
733	Aesculus hippocastanum f. laciniata	Schlitzblättrige Rosskastanie
734	Quercus robur f. pectinata	Schlitzblättrige Stiel-Eiche
735	Fraxinus angustifolia	Schmalblättrige Esche
736	Elaeagnus angustifolia	Schmalblättrige Ölweide
737	Phillyrea angustifolia	Schmalblättrige Steinlinde
738	Lavandula angustifolia	Schmalblättriger Lavendel
739	Buddleja alternifolia	Schmalblättriger Sommerflieder
740	Chitalpa tashkentensis	Schmalblättriger Trompetenbaum
741	Erica carnea	Schnee-Heide
742	Physocarpus opulifolius	Schneeballblättrige Blasenspiere
743	Acer opalus	Schneeballblättriger Ahorn
744	Leycesteria formosa	Schöne Lycesterie
745	Abutilon megapotamicum	Schönmalve
746	Lavandula stoechas	Schopf-Lavendel
747	Carya ovata	Schuppenrinden-Hickorynuss
748	Betula nigra	Schwarz-Birke
749	Quercus marilandica	Schwarz-Eiche
750	Alnus glutinosa	Schwarz-Erle
751	Picea mariana	Schwarz-Fichte
752	Pinus nigra	Schwarz-Kiefer
753	Populus nigra	Schwarz-Pappel
754	Lonicera nigra	Schwarze Heckenkirsche
755	Sambucus nigra	Schwarzer Holunder
756	Morus nigra	Schwarzer Maulbeerbaum
757	Crataegus nigra	Schwarzfrüchtiger Weißdorn
758	Juglans nigra	Schwarznuss
759	Sambucus nigra f. porphyrophylla	Schwarzpurpurner schlitzblättriger Holunder
760	Sorbus intermedia	Schwedische Mehlbeere
761	Cotoneaster x suecicus	Schwedische Zwergmispel
762	Pinus x schwerinii	Schwerins Kiefer
763	Terminalia catappa	Seemandel
764	Coccoloba uvifera	Seetraube
765	Albizia julibrissin	Seidenbaum
766	Quercus acutissima	Seidenraupen-Eiche
767	Cornus sericea	Seidiger Hartriegel
768	Picea omorika	Serbische Fichte
769	Acer shirasawanum	Shirasawas Fächer-Ahorn
770	Quercus shumardii	Shumard-Eiche
771	Prunus sibirica	Sibirische Aprikose
772	Sorbaria sorbifolia	Sibirische Fiederspiere
773	Ulmus pumila	Sibirische Ulme
774	Cryptomeria japonica	Sicheltanne
775	Heptacodium miconioides	Sieben Söhne des Himmels Strauch
776	Malus sieboldii	Siebolds Apfel
777	Eleutherococcus sieboldianus	Siebolds Fingeraralie
778	Acer saccharinum	Silber-Ahorn
779	Acacia dealbata	Silber-Akazie
780	Shepherdia argentea	Silber-Büffelbeere
781	Tilia tomentosa	Silber-Linde
782	Populus alba	Silber-Pappel
783	Salix alba	Silber-Weide
784	Argyrocytisus battandieri	Silberginster
785	Picea breweriana	Siskiyou-Fichte
786	Alnus sinuata	Sitka-Erle
787	Picea sitchensis	Sitka-Fichte
788	Tilia platyphyllos	Sommer-Linde
789	Magnolia sieboldii	Sommer-Magnolie
790	Firmiana simplex	Sonnenschirmbaum
791	Alnus x spaethii	Spaeths Erle
792	Quercus x hispanica 'Lucombeana'	Spanische Eiche
793	Abies pinsapo	Spanische Tanne
794	Cotoneaster divaricatus	Sparrige Zwergmispel
795	Prunus serotina	Späte Trauben-Kirsche
796	Osmanthus x fortunei	Spätsommer-Duftblüte
797	Sorbus domestica	Speierling
798	Acer platanoides	Spitz-Ahorn
799	Carya tomentosa	Spottnuss-Hickory
800	Rosa sericea ssp. omeiensis f. pteracantha	Stacheldraht-Rose
801	Calicotome spinosa	Stacheliger Dornginster
802	Ruscus aculeatus	Stacheliger Mäusedorn
803	Asparagus acutifolius	Stechender Spargel
804	Ulex europaeus	Stechginster
805	Ilex aquifolium	Stechpalme
806	Quercus ilex	Stein-Eiche
807	Magnolia stellata	Stern-Magnolie
808	Quercus robur	Stiel-Eiche
809	Anagyris foetida	Stinkstrauch
810	Pinus pinaster	Strand-Kiefer
811	Hibiscus syriacus	Strauch-Eibisch
812	Paeonia x suffruticosa	Strauch-Päonie
813	Aesculus parviflora	Strauch-Rosskastanie
814	Hebe x andersonii	Strauch-Veronika
815	Phlomis fruticosa	Strauchiges Brandkraut
816	Bupleurum fruticosum	Strauchiges Hasenohr
817	Salix retusa	Stumpfblättrige Weide
818	Nothofagus antarctica	Südbuche
819	Celtis australis	Südlicher Zürgelbaum
820	Quercus palustris	Sumpf-Eiche
821	Rhododendron tomentosum	Sumpf-Porst
822	Taxodium distichum	Sumpfzypresse
823	Fagus sylvatica 'Tortuosa'	Süntel-Buche
824	Toona sinensis	Surenbaum
825	Taiwania cryptomerioides	Taiwanie
826	Davidia involucrata	Taschentuchbaum
827	Acer tataricum	Tataren-Ahorn
828	Lonicera tatarica	Tataren-Heckenkirsche
829	Cornus alba	Tatarischer Hartriegel
830	Duranta erecta	Taubenbeere
831	Zanthoxylum simulans	Täuschendes Gelbholz
832	Pinus bungeana	Tempel-Kiefer
833	Cornus canadensis	Teppich-Hartriegel
834	Cotoneaster dammeri	Teppich-Zwergmispel
835	Pistacia terebinthus	Terpentin-Pistazie
836	Berberis thunbergii	Thunbergs Berberitze
837	Lespedeza thunbergii	Thunbergs Buschklee
838	Pinus thunbergii	Thunbergs Kiefer
839	Spiraea thunbergii	Thunbergs Spierstrauch
840	Picea polita	Tigerschwanz-Fichte
841	Tipuana tipu	Tipubaum
842	Malus toringo	Toringo-Apfel
843	Pinus wallichiana	Tränen-Kiefer
844	Quercus petraea	Trauben-Eiche
845	Sambucus racemosa	Trauben-Holunder
846	Salix alba 'Tristis'	Trauer-Weide
847	Catalpa bignonioides	Trompetenbaum
848	Cascabela thevetia	Tropischer Oleander
849	Magnolia x soulangeana	Tulpen-Magnolie
850	Liriodendron tulipifera	Tulpenbaum
851	Ulmus minor 'Jacqueline Hillier'	Ulme 'Jacqueline Hillier'
852	Quercus frainetto	Ungarische Eiche
853	Robinia luxurians	Üppige Robinie
854	Euonymus macropterus 	Ussuri-Spindelstrauch
855	Quercus ithaburensis ssp. macrolepis	Vallonea-Eiche
856	Corylopsis veitchiana	Veitchs Scheinhasel
857	Abies veitchii	Veitchs Tanne
858	Pieris floribunda	Vielblütige Lavendelheide
859	Rosa multiflora	Vielblütige Rose
860	Cotoneaster multiflorus	Vielblütige Zwergmispel
861	Malus floribunda	Vielblütiger Apfel
862	Dipelta floribunda 	Vielblütiges Doppelschild
863	Ostrya virginiana	Virginische Hopfenbuche
864	Betula lenta f. uber	Virginische Rundblatt-Birke
865	Hamamelis virginiana	Virginische Zaubernuss
866	Chionanthus virginicus	Virginischer Schneeflockenstrauch
867	Prunus avium	Vogel-Kirsche
868	Lonicera periclymenum	Wald-Geißblatt
869	Hydrangea arborescens	Wald-Hortensie
870	Pinus sylvestris	Wald-Kiefer, Wald-Föhre
871	Nyssa sylvatica	Wald-Tupelobaum
872	Lantana camara	Wandelröschen
873	Quercus nigra	Wasser-Eiche
874	Cornus alternifolia	Wechselblättriger Hartriegel
875	Quercus phellos	Weiden-Eiche
876	Pyrus salicifolia	Weidenblättrige Birne
877	Abienus festuschristus	Weihnachtsbaum, Christbaum
878	Euphorbia pulcherrima	Weihnachtsstern
879	Ruta graveolens	Wein-Raute
880	Acer circinatum	Weinblatt-Ahorn
881	Quercus alba	Weiß-Eiche
882	Picea glauca	Weiß-Fichte
883	Abies alba	Weiß-Tanne
884	Chamaecyparis thyoides	Weiße Scheinzypresse
885	Morus alba	Weißer Maulbeerbaum
886	Leucaena leucocephala	Weißkopfmimose
887	Cistus albidus	Weißliche Zistrose
888	Pinus monticola	Westamerikanische Weymouths-Kiefer
889	Populus trichocarpa	Westliche Balsam-Pappel
890	Tsuga heterophylla	Westliche Hemlockstanne
891	Arbutus unedo	Westlicher Erdbeerbaum
892	Celtis occidentalis	Westlicher Zürgelbaum
893	Pinus strobus	Weymouths Kiefer
894	Magnolia x wiesneri	Wiesners Magnolie
895	Parthenocissus quinquefolia	Wilder Wein
896	Parthenocissus tricuspidata	Wilder Wein
897	Picea wilsonii	Wilsons Fichte
898	Jasminum nudiflorum	Winter-Jasmin
899	Prunus subhirtella f. autumnalis	Winter-Kirsche
900	Tilia cordata	Winter-Linde
901	Quercus x turneri	Wintergrüne Eiche
902	Elaeagnus x ebbingei	Wintergrüne Ölweide
903	Ligustrum ovalifolium	Wintergrüner Liguster
904	Rubus odoratus	Wohlriechende Himbeere
905	Wollemia nobilis	Wollemie
906	Viburnum lantana	Wolliger Schneeball
907	Quercus rysophylla	Wollmispel-Eiche
908	Ricinus communis	Wunderbaum
909	Hyssopus officinalis	Ysop
910	Magnolia denudata	Yulan-Magnolie
911	Platycarya strobilacea	Zapfennuss
912	Quercus cerris	Zerr-Eiche
913	Deutzia gracilis	Zierliche Deutzie
914	Fatsia japonica	Zimmeraralie
915	Sparmannia africana	Zimmerlinde
916	Acer griseum	Zimt-Ahorn
917	Pinus cembra	Zirbel-Kiefer
918	Citrus medica	Zitronat-Zitrone
919	Citrus x limon	Zitrone
920	Aloysia citrodora	Zitronen-Verbene
921	Populus tremula	Zitter-Pappel
922	Acer x zoeschense	Zoescheners Ahorn
923	Acer saccharum	Zucker-Ahorn
924	Betula lenta	Zucker-Birke
925	Picea glauca 'Conica'	Zuckerhut-Fichte
926	Crataegus laevigata	Zweigriffeliger Weißdorn
927	Phytolacca dioica	Zweihäusige Kermesbeere
928	Betula nana	Zwerg-Birke
929	Sorbus chamaemespilus	Zwerg-Eberesche
930	Syringa meyeri	Zwerg-Flieder
931	Rhamnus pumila	Zwerg-Kreuzdorn
932	Bauhinia galpinii	Zwerg-Orchideenbaum
933	Cneorum tricoccon	Zwergölbaum
934	Prunus domestica subsp. domestica	Zwetschge
935	Cedrus brevifolia	Zypern-Zeder
\.


--
-- Name: tree_species_pkey_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tree_species_pkey_seq', 935, true);


--
-- Name: tree_species tree_species_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tree_species
    ADD CONSTRAINT tree_species_pkey PRIMARY KEY (pkey);


--
-- Name: TABLE tree_species; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.tree_species TO postgis_user;


--
-- Name: SEQUENCE tree_species_pkey_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.tree_species_pkey_seq TO postgis_user;


--
-- PostgreSQL database dump complete
--

