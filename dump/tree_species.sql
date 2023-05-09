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
-- Name: tree_species; Type: TABLE; Schema: public; Owner: postgis_user
--

CREATE TABLE public.tree_species (
    skey integer NOT NULL,
    species_latin character varying,
    species_german character varying
);


ALTER TABLE public.tree_species OWNER TO postgis_user;

--
-- Name: tree_species_skey_seq; Type: SEQUENCE; Schema: public; Owner: postgis_user
--

CREATE SEQUENCE public.tree_species_skey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tree_species_skey_seq OWNER TO postgis_user;

--
-- Name: tree_species_skey_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgis_user
--

ALTER SEQUENCE public.tree_species_skey_seq OWNED BY public.tree_species.skey;


--
-- Name: tree_species skey; Type: DEFAULT; Schema: public; Owner: postgis_user
--

ALTER TABLE ONLY public.tree_species ALTER COLUMN skey SET DEFAULT nextval('public.tree_species_skey_seq'::regclass);


--
-- Data for Name: tree_species; Type: TABLE DATA; Schema: public; Owner: postgis_user
--

COPY public.tree_species (skey, species_latin, species_german) FROM stdin;
4591	Abelia x grandiflora	Großblütige Abelie
4592	Abienus festuschristus	Weihnachtsbaum
4593	Abies alba	Weiß-Tanne
4594	Abies balsamea	Balsam-Tanne
4595	Abies cephalonica	Griechische Tanne
4596	Abies concolor	Colorado-Tanne
4597	Abies equi-trojani	Kleinasiatische Tanne
4598	Abies grandis	Küsten-Tanne
4599	Abies holophylla	Mandschurische Tanne
4600	Abies homolepis	Nikko-Tanne
4601	Abies koreana	Korea-Tanne
4602	Abies lasiocarpa	Felsen-Gebirgstanne
4603	Abies nordmanniana	Nordmanns Tanne
4604	Abies pinsapo	Spanische Tanne
4605	Abies procera	Edel-Tanne
4606	Abies procera 'Glauca'	Blau-Tanne
4607	Abies veitchii	Veitchs Tanne
4608	Abutilon megapotamicum	Schönmalve
4609	Acacia dealbata	Silber-Akazie
4610	Acacia karroo	Karroo-Akazie
4611	Acacia retinodes	Immerblühende Akazie
4612	Acer buergerianum	Dreizähniger Ahorn
4613	Acer campestre	Feld-Ahorn
4614	Acer capillipes	Roter Schlangenhaut-Ahorn
4615	Acer cappadocicum	Kolchischer Ahorn
4616	Acer carpinifolium	Hainbuchenblättriger Ahorn
4617	Acer caudatum subsp. caudatum	Geschwänzter Ahorn
4618	Acer circinatum	Weinblatt-Ahorn
4619	Acer cissifolium	Cissusblättriger Ahorn
4620	Acer coriaceifolium	Lederblatt-Ahorn
4621	Acer davidii	Davids-Ahorn
4622	Acer davidii subsp. grosserii	Grossers Ahorn
4623	Acer griseum	Zimt-Ahorn
4624	Acer japonicum 'Aconitifolium'	Japanischer Feuer-Ahorn
4625	Acer macrophyllum	Oregon-Ahorn
4626	Acer mandshuricum	Mandschurischer Ahorn
4627	Acer monspessulanum	Felsen-Ahorn
4628	Acer negundo	Eschen-Ahorn
4629	Acer opalus	Schneeballblättriger Ahorn
4630	Acer opalus ssp. obtusatum	Italienischer Ahorn
4631	Acer palmatum	Fächer-Ahorn
4632	Acer palmatum 'Dissectum Viridis'	Japanischer Schlitzahorn
4633	Acer pensylvanicum	Amerikanischer Schlangenhaut-Ahorn
4634	Acer platanoides	Spitz-Ahorn
4635	Acer platanoides 'Crimson King'	Blut-Ahorn
4636	Acer platanoides 'palmatifidum'	Geschlitzter Spitz-Ahorn
4637	Acer platanoides f. drummondii	Drummonds Spitz-Ahorn
4638	Acer pseudoplatanus	Berg-Ahorn
4639	Acer pseudoplatanus 'Leopoldii'	Berg-Ahorn 'Leopoldii'
4640	Acer pseudoplatanus f. atropurpureum	Rotblättriger Berg-Ahorn
4641	Acer rubrum	Rot-Ahorn
4642	Acer rufinerve	Rostnerviger Schlangenhaut-Ahorn
4643	Acer saccharinum	Silber-Ahorn
4644	Acer saccharum	Zucker-Ahorn
4645	Acer sempervirens	Kretischer Ahorn
4646	Acer shirasawanum	Shirasawas Fächer-Ahorn
4647	Acer tataricum	Tataren-Ahorn
4648	Acer tataricum subsp. ginnala	Feuer-Ahorn
4649	Acer tegmentosum	Koreanischer Schlangenhaut-Ahorn
4650	Acer triflorum	Dreiblütiger Ahorn
4651	Acer x freemanii	Freemans Ahorn
4652	Acer x zoeschense	Zoescheners Ahorn
4653	Actinidia arguta	Kleinfruchtige Kiwi
4654	Actinidia deliciosa	Kiwi
4655	Actinidia kolomikta	Bunter Strahlengriffel
4656	Adonidia merrillii	Manilapalme
4657	Aesculus flava	Gelbe Rosskastanie
4658	Aesculus glabra	Ohio-Rosskastanie
4659	Aesculus hippocastanum	Gemeine Rosskastanie
4660	Aesculus hippocastanum f. laciniata	Schlitzblättrige Rosskastanie
4661	Aesculus hippocastanum f. memingeri	Gold-Kastanie
4662	Aesculus indica	Indische Rosskastanie
4663	Aesculus parviflora	Strauch-Rosskastanie
4664	Aesculus pavia	Echte Pavie
4665	Aesculus turbinata	Japanische Rosskastanie
4666	Aesculus x carnea	Rotblühende Rosskastanie
4667	Aesculus x mutabilis 'Penduliflora'	Rosskastanien-Hybrid
4668	Aesculus x neglecta 'Erythroblastos'	Carolina-Rosskastanie
4669	Afzelia africana	Afzelia
4670	Ailanthus altissima	Götterbaum
4671	Akebia quinata	Fingerblättrige Akebie
4672	Alangium platanifolium	Platanenblättrige Alangie
4673	Albizia julibrissin	Seidenbaum
4674	Allocasuarina luehmannii	Buloke
4675	Alnus cordata	Italienische Erle
4676	Alnus glutinosa	Schwarz-Erle
4677	Alnus incana	Grau-Erle
4678	Alnus sinuata	Sitka-Erle
4679	Alnus viridis	Grün-Erle
4680	Alnus x spaethii	Spaeths Erle
4681	Aloysia citrodora	Zitronen-Verbene
4682	Amelanchier arborea	Baum-Felsenbirne
4683	Amelanchier asiatica	Japanische Felsenbirne
4684	Amelanchier laevis	Kahle Felsenbirne
4685	Amelanchier lamarckii	Kupfer-Felsenbirne
4686	Amelanchier ovalis	Gemeine Felsenbirne
4687	Amelanchier spicata	Ährige Felsenbirne
4688	Amorpha fructicosa	Gewöhnlicher Bastardindigo
4689	Anacardium occidentale	Cashew
4690	Anagyris foetida	Stinkstrauch
4691	Andromeda polifolia	Rosmarinheide
4692	Annona cherimola	Cherimoya
4693	Aralia elata	Japanischer Angelikabaum
4694	Araucaria araucana	Andentanne
4695	Araucaria bidwillii	Queensland-Araukarie
4696	Araucaria columnaris	Säulen-Araukarie
4697	Araucaria cunninghamii	Cunninghams Araukarie
4698	Araucaria heterophylla	Norfolktanne
4699	Arbutus canariensis	Kanarischer Erdbeerbaum
4700	Arbutus menziesii	Amerikanischer Erdbeerbaum
4701	Arbutus unedo	Westlicher Erdbeerbaum
4702	Argania spinosa	Arganbaum
4703	Argyrocytisus battandieri	Silberginster
4704	Aronia arbutifolia	Filzige Apfelbeere
4705	Aronia melanocarpa	Kahle Apfelbeere
4706	Aronia x prunifolia	Pflaumenblättrige Apfelbeere
4707	Artemisia absinthum	Echter Wermut
4708	Asimina triloba	Indianerbanane
4709	Asparagus acutifolius	Stechender Spargel
4710	Aucuba japonica	Japanische Goldorange
4711	Averrhoa carambola	Karambole
4712	Barringtonia asiatica	Barringtonia asiatica
4713	Bauhinia galpinii	Zwerg-Orchideenbaum
4714	Bauhinia kockiana	Kocks Bauhinie
4715	Bauhinia x blakeana	Hong-Kong-Orchideenbaum
4716	Berberis julianae	Julianes Berberitze
4717	Berberis koreana	Koreanische Berberitze
4718	Berberis thunbergii	Thunbergs Berberitze
4719	Berberis vulgaris	Gewöhnliche Berberitze
4720	Betula alleghaniensis	Gelb-Birke
4721	Betula alnoides subsp. alnoides	Erlenblättrige Birke
4722	Betula alnoides subsp. luminifera	Leuchtende Birke 
4723	Betula costata	Gerippte Birke
4724	Betula dahurica	Mongolische Birke
4725	Betula ermanii	Gold-Birke Hybride
4726	Betula insignis	Birke
4727	Betula lenta	Zucker-Birke
4728	Betula lenta f. uber	Virginische Rundblatt-Birke
4729	Betula maximowicziana	Lindenblättrige Birke
4730	Betula nana	Zwerg-Birke
4731	Betula nigra	Schwarz-Birke
4732	Betula papyrifera	Papier-Birke
4733	Betula pendula	Hänge-Birke
4734	Betula pendula f. dalecarlica	Schlitzblättrige Hänge-Birke
4735	Betula populifolia	Pappelblättrige Birke Hybride
4736	Betula pubescens	Moor-Birke
4737	Betula utilis var. jacquemontii 'Doorenbos'	Doorenbos Weißrindige Himalaja-Birke
4738	Bougainvillea glabra	Bougainvillea
4739	Bougainvillea spectabilis	Prächtige Bougainvillea
4740	Brachychiton acerifolius	Ahornblättriger Flaschenbaum
4741	Brachychiton discolor	Lacebark Flaschenbaum
4742	Brachychiton populneus	Pappelblättriger Flaschenbaum
4743	Brachychiton rupestris	Queensland-Flaschenbaum
4744	Broussonetia papyrifera	Papiermaulbeerbaum
4745	Buddleja alternifolia	Schmalblättriger Sommerflieder
4746	Buddleja davidii	Gewöhnlicher Sommerflieder
4747	Buddleja globosa	Kugelblütiger Sommerflieder
4748	Buddleja x weyeriana	Gelber Sommerflieder
4749	Bupleurum fruticosum	Strauchiges Hasenohr
4750	Butyrospermum parkii	Afrikanischer Butterbaum
4751	Buxus sempervirens	Gewöhnlicher Buchsbaum
4752	Caesalpinia gilliesii	Paradiesvogelbusch
4753	Calicotome spinosa	Stacheliger Dornginster
4754	Callicarpa dichotoma	Purpur-Schönfrucht
4755	Callistemon citrinus	Karminroter Zylinderputzer
4756	Calluna vulgaris	Besenheide
4757	Calocedrus decurrens	Rauchzypresse
4758	Calocedrus decurrens 'Aureovariegata'	Rauchzypresse
4759	Calycanthus fertilis	Fruchtbarer Gewürzstrauch
4760	Calycanthus floridus	Echter Gewürzstrauch
4761	Camellia japonica	Japanische Kamelie
4762	Camellia sasanqua	Herbst-Kamelie
4763	Campsis grandiflora	Chinesische Klettertrompete
4764	Campsis radicans	Amerikanische Klettertrompete
4765	Campsis x tagliabuana	Hybrid-Klettertrompete
4766	Capparis spinosa	Kapernstrauch
4767	Caragana arborescens	Gewöhnlicher Erbsenstrauch
4768	Carissa edulis	Karandapflaume
4769	Carissa macrocarpa	Natalpflaume
4770	Carpenteria californica	Baum-Anemone
4771	Carpinus betulus	Hainbuche
4772	Carpinus betulus 'Quercifolia'	Eichenblättrige Hainbuche
4773	Carpinus caroliniana	Amerikanische Hainbuche
4774	Carpinus japonica	Japanische Hainbuche
4775	Carya cordiformis	Bitternuss
4776	Carya illinoinensis	Pekannuss
4777	Carya laciniosa	Königsnuss
4778	Carya ovata	Schuppenrinden-Hickorynuss
4779	Carya tomentosa	Spottnuss-Hickory
4780	Cascabela thevetia	Tropischer Oleander
4781	Cassia siberiana	Cassia siberiana
4782	Castanea crenata	Japanische Kastanie
4783	Castanea dentata	Amerikanische Kastanie
4784	Castanea sativa	Ess-Kastanie
4785	Casuarina cunninghamiana	Cunninghams Kasuarine
4786	Casuarina stricta	Kasuarine
4787	Catalpa bignonioides	Trompetenbaum
4788	Catalpa bungei	Bunges Trompetenbaum
4789	Catalpa ovata	Gelber Trompetenbaum
4790	Catalpa speciosa	Prächtiger Trompetenbaum
4791	Catalpa x erubescens	Purpurblättriger Trompetenbaum
4792	Ceanothus hybridus	Immergrüne Hybrid-Säckelblume
4793	Ceanothus x delilianus	Französische Hybrid-Säckelblume
4794	Cedrus atlantica	Atlas-Zeder
4795	Cedrus atlantica 'Glauca'	Blaue Atlas-Zeder
4796	Cedrus brevifolia	Zypern-Zeder
4797	Cedrus deodara	Himalaja-Zeder
4798	Cedrus deodara 'Paktia'	Himalaja-Zeder 'Paktia'
4799	Cedrus libani	Libanon Zeder
4800	Ceiba speciosa	Florettseidenbaum
4801	Celtis australis	Südlicher Zürgelbaum
4802	Celtis occidentalis	Westlicher Zürgelbaum
4803	Cephalanthus occidentalis	Knopfstrauch
4804	Cephalotaxus fortunei	Chinesische Kopfeibe
4805	Cephalotaxus harringtonia	Harringtons Kopfeibe
4806	Cephalotaxus sinensis	Chinesische Kopfeibe
4807	Ceratonia siliqua	Johannisbrotbaum
4808	Cercidiphyllum japonicum	Katsurabaum
4809	Cercis canadensis	Kanadischer Judasbaum
4810	Cercis chinensis	Chinesischer Judasbaum
4811	Cercis siliquastrum	Gewöhnlicher Judasbaum
4812	Chaenomeles japonica	Japanische Zierquitte
4813	Chaenomeles speciosa	Chinesische Zierquitte
4814	Chamaecyparis lawsoniana	Lawsons Scheinzypresse
4815	Chamaecyparis obtusa	Hinoki-Scheinzypresse
4816	Chamaecyparis pisifera	Sawara-Scheinzypresse
4817	Chamaecyparis pisifera f. squarrosa	Sawara-Scheinzypresse Squarrosa-Form
4818	Chamaecyparis thyoides	Weiße Scheinzypresse
4819	Chamaerops humilis	Europäische Zwergpalme
4820	Chimonanthus praecox	Chinesische Winterblüte
4821	Chionanthus retusus	Chinesischer Schneeflockenstrauch
4822	Chionanthus virginicus	Virginischer Schneeflockenstrauch
4823	Chitalpa tashkentensis	Schmalblättriger Trompetenbaum
4824	Choisya ternata	Mexikanische Orangenblume
4825	Choisya x dewitteana	Dewittes Orangenblume
4826	Cinnamomum camphora	Kampferbaum
4827	Cistus albidus	Weißliche Zistrose
4828	Cistus crispus	Krause Zistrose
4829	Cistus incanus	Graue Zistrose
4830	Cistus incanus ssp. creticus	Kretische Zistrose
4831	Cistus ladanifer	Lack-Zistrose
4832	Cistus laurifolius	Lorbeerblättrige Zistrose
4833	Cistus monspeliensis	Montpelier-Zistrose
4834	Cistus populifolius	Pappelblättrige Zistrose
4835	Cistus salviifolius	Salbeiblättrige Zistrose
4836	Cistus symphytifolius	Beinwellblättrige Zistrose
4837	Citharexylum spinosum	Leierholz
4838	Citrus medica	Zitronat-Zitrone
4839	Citrus x aurantium	Orange
4840	Citrus x limon	Zitrone
4841	Cladrastis kentukea	Amerikanisches Gelbholz
4842	Clematis armandii	Immergrüne Waldrebe
4843	Clematis flammula	Brennende Waldrebe
4844	Clematis montana	Berg-Waldrebe
4845	Clematis vitalba	Gewöhnliche Waldrebe
4846	Clematis viticella	Italienische Waldrebe
4847	Clerodendrum bungei	Bunges Losbaum
4848	Clerodendrum trichotomum	Losbaum
4849	Clethra alnifolia	Erlenblättrige Zimterle
4850	Clethra barbinervis	Japanische Zimterle
4851	Cneorum tricoccon	Zwergölbaum
4852	Coccoloba uvifera	Seetraube
4853	Cocos nucifera	Kokospalme
4854	Colutea arborescens	Gewöhnlicher Blasenstrauch
4855	Cornus alba	Tatarischer Hartriegel
4856	Cornus alternifolia	Wechselblättriger Hartriegel
4857	Cornus canadensis	Teppich-Hartriegel
4858	Cornus controversa	Riesen-Hartriegel
4859	Cornus florida	Blüten-Hartriegel
4860	Cornus kousa	Japanischer Blumen-Hartriegel
4861	Cornus mas	Kornelkirsche
4862	Cornus nuttallii	Nutalls Blumen-Hartriegel
4863	Cornus officinalis	Japanische Kornelkirsche
4864	Cornus racemosa	Rispen-Hartriegel
4865	Cornus sanguinea	Blutroter Hartriegel
4866	Cornus sericea	Seidiger Hartriegel
4867	Coronilla valentina ssp. glauca	Blaue Kronwicke
4868	Corylopsis pauciflora	Armblütige Scheinhasel
4869	Corylopsis spicata	Ährige Scheinhasel
4870	Corylopsis veitchiana	Veitchs Scheinhasel
4871	Corylus avellana	Gemeine Hasel
4872	Corylus avellana 'Contorta'	Korkenzieher-Hasel
4873	Corylus colurna	Baum-Hasel
4874	Corylus maxima	Lamberts-Hasel
4875	Corymbia dallachiana	Ghost Tree
4876	Cotinus coggygria	Gewöhnlicher Perückenstrauch
4877	Cotoneaster bullatus	Runzelige Zwergmispel
4878	Cotoneaster dammeri	Teppich-Zwergmispel
4879	Cotoneaster dielsianus	Diels Zwergmispel
4880	Cotoneaster divaricatus	Sparrige Zwergmispel
4881	Cotoneaster floccosus	Flockige Zwergmispel
4882	Cotoneaster frigidus	Himalaya-Baummispel
4883	Cotoneaster horizontalis	Fächer-Zwergmispel
4884	Cotoneaster integerrimus	Gewöhnliche Zwergmispel
4885	Cotoneaster multiflorus	Vielblütige Zwergmispel
4886	Cotoneaster x suecicus	Schwedische Zwergmispel
4887	Crataegus laevigata	Zweigriffeliger Weißdorn
4888	Crataegus laevigata 'Paul's Scarlet'	Rotdorn
4889	Crataegus monogyna	Eingriffeliger Weißdorn
4890	Crataegus nigra	Schwarzfrüchtiger Weißdorn
4891	Crataegus pedicellata	Scharlach-Weißdorn
4892	Crataegus pinnatifida	Fiederblatt-Weißdorn
4893	Crataegus succulenta var. macrantha	Saft-Weißdorn
4894	Crataegus x lavallei 'Carrierei'	Lederblättriger Weißdorn
4895	Crataemespilus grandiflora	Großblütige Weißdorn-Mispel
4896	Cryptomeria japonica	Sicheltanne
4897	Cryptomeria japonica f. cristata	Hahnenkamm-Sicheltanne
4898	Cunninghamia lanceolata	Chinesische Spießtanne
4899	Cupressus arizonica	Arizona-Zypresse
4900	Cupressus glabra	Glatte Arizona-Zypresse
4901	Cupressus sempervirens	Italienische Zypresse
4902	Cycas revoluta	Japanischer Sagopalmfarn
4903	Cydonia oblonga	Echte Quitte
4904	Cytisus scoparius	Besen-Ginster
4905	Danae racemosa	Alexandrinischer Lorbeer
4906	Daphne gnidium	Mittelmeer-Seidelbast
4907	Daphne laureola	Lorbeer-Seidelbast
4908	Daphne mezereum	Gewöhnlicher Seidelbast
4909	Dasiphora fruticosa	Fingerstrauch
4910	Davidia involucrata	Taschentuchbaum
4911	Decaisnea fargesii	Chinesische Blaugurke
4912	Delonix regia	Flammenbaum
4913	Deutzia gracilis	Zierliche Deutzie
4914	Deutzia longifolia	Langblättrige Deutzie
4915	Deutzia scabra	Raublättrige Deutzie
4916	Deutzia x hybrida	Rosen-Deutzie
4917	Diospyros kaki	Kakipflaume
4918	Diospyros lotus	Lotuspflaume
4919	Diospyros virginiana	Amerikanische Persimone
4920	Dipelta floribunda	Vielblütiges Doppelschild
4921	Distylium racemosum	Isu-Baum
4922	Dracaena draco	Drachenbaum
4923	Duranta erecta	Taubenbeere
4924	Edgeworthia chrysantha	Japanischer Papierbusch
4925	Ehretia dicksonii	Dicksons Ehretia
4926	Elaeagnus angustifolia	Schmalblättrige Ölweide
4927	Elaeagnus pungens	Dornige Ölweide
4928	Elaeagnus umbellata	Schirm-Ölweide
4929	Elaeagnus x ebbingei	Wintergrüne Ölweide
4930	Eleutherococcus sieboldianus	Siebolds Fingeraralie
4931	Enkianthus campanulatus	Prachtglocke
4932	Enkianthus perulatus	Frühblühende Prachtglocke
4933	Erica arborea	Baum-Heide
4934	Erica carnea	Schnee-Heide
4935	Erica cinerea	Grau-Heide
4936	Erica tetralix	Glocken-Heide
4937	Eriobotrya japonica	Japanische Wollmispel
4938	Erythrina crista-galli	Korallenbaum
4939	Eucalyptus globulus	Gewöhnlicher Eukalyptus
4940	Eucommia ulmoides	Guttaperchabaum
4941	Euonymus alatus	Flügel-Spindelstrauch
4942	Euonymus europaeus	Gemeines Pfaffenhütchen
4943	Euonymus fortunei	Kletternder Spindelstrauch
4944	Euonymus japonicus	Japanisches Pfaffenhütchen
4945	Euonymus macropterus	Ussuri-Spindelstrauch
4946	Euonymus planipes	Großfrüchtiges Pfaffenhütchen
4947	Euphorbia pulcherrima	Weihnachtsstern
4948	Exochorda giraldii	Dahurische Radspiere
4949	Fagus crenata	Kerb-Buche
4950	Fagus engleriana	Englers Buche
4951	Fagus grandifolia	Amerikanische Buche
4952	Fagus orientalis	Orient-Buche
4953	Fagus sylvatica	Gemeine Buche
4954	Fagus sylvatica 'Asplenifolia'	Farnblättrige Buche
4955	Fagus sylvatica 'Felderbach'	Felderbach-Buche
4956	Fagus sylvatica 'Pendula'	Hänge-Buche
4957	Fagus sylvatica 'Purpurea'	Blut-Buche
4958	Fagus sylvatica 'Tortuosa'	Süntel-Buche
4959	Fagus sylvatica f. grandidentata	Grobgezähnte Buche
4960	Fagus sylvatica f. laciniata	Schlitzblättrige Buche
4961	Fagus sylvatica f. luteo-variegata	Gelbbunte Buche
4962	Fagus sylvatica f. purpurea tricolor	Buntblättrige Buche
4963	Fagus sylvatica f. quercifolia	Eichenblättrige Buche
4964	Fallopia baldschuanica	Schling-Knöterich
4965	Fatsia japonica	Zimmeraralie
4966	Feijoa sellowiana	Brasilianische Guave
4967	Ficus benjamina	Birken-Feige
4968	Ficus carica	Echter Feigenbaum
4969	Ficus elastica	Gummibaum
4970	Ficus lyrata	Leier-Feige
4971	Ficus macrophylla	Großblättrige Feige
4972	Ficus microcarpa	Chinesische Feige
4973	Ficus sycomorus	Maulbeer-Feige
4974	Firmiana simplex	Sonnenschirmbaum
4975	Forsythia x intermedia	Forsythie
4976	Fortunella margarita	Kumquat
4977	Fothergilla major	Großer Federbuschstrauch
4978	Frangula alnus	Gemeiner Faulbaum
4979	Fraxinus angustifolia	Schmalblättrige Esche
4980	Fraxinus excelsior	Gemeine Esche
4981	Fraxinus excelsior f. diversifolia	Einblatt-Esche
4982	Fraxinus excelsior f. pendula	Hänge-Esche
4983	Fraxinus latifolia	Oregon-Esche
4984	Fraxinus ornus	Manna-Esche
4985	Fraxinus paxiana	Chinesische Blumenesche
4986	Fraxinus pennsylvanica	Rot-Esche
4987	Freylinia lanceolata	Honigglockenbusch
4988	Fuchsia magellanica	Scharlach-Fuchsie
4989	Gaultheria procumbens	Niedere Scheinbeere
4990	Genista tinctoria	Färber-Ginster
4991	Ginkgo biloba L.	Ginkgobaum
4992	Gleditsia triacanthos	Amerikanische Gleditschie
4993	Grevillea robusta	Australische Silbereiche
4994	Gymnocladus dioicus	Geweihbaum
4995	Halesia carolina	Carolina-Schneeglöckchenbaum
4996	Halesia monticola	Berg-Schneeglöckchenbaum
4997	Halimodendron halodendron	Salzstrauch
4998	Hamamelis virginiana	Virginische Zaubernuss
4999	Hamamelis x intermedia	Hybrid-Zaubernuss
5000	Hebe x andersonii	Strauch-Veronika
5001	Hedera helix	Gewöhnlicher Efeu
5002	Helichrysum italicum	Italienische Strohblume
5003	Hemiptelea davidii	Dorn-Ulme
5004	Heptacodium miconioides	Sieben Söhne des Himmels Strauch
5005	Hibiscus rosa-sinensis	Chinesischer Rosen-Eibisch
5006	Hibiscus syriacus	Strauch-Eibisch
5007	Hippophae rhamnoides	Sanddorn
5008	Holodiscus discolor	Schaumspiere
5009	Hovenia dulcis	Japanischer Rosinenbaum
5010	Humulus lupulus	Echter Hopfen
5011	Hura crepitans	Sandbüchsenbaum 
5012	Hydrangea arborescens	Wald-Hortensie
5013	Hydrangea aspera ssp. aspera	Rauhe Hortensie
5014	Hydrangea aspera ssp. sargentiana	Sargents Samt-Hortensie
5015	Hydrangea macrophylla	Garten-Hortensie
5016	Hydrangea paniculata	Rispen-Hortensie
5017	Hydrangea petiolaris	Kletter-Hortensie
5018	Hydrangea quercifolia	Eichblatt-Hortensie
5019	Hypericum androsaemum	Blut-Johanniskraut
5020	Hypericum balearicum	Balearen-Johanniskraut
5021	Hyssopus officinalis	Ysop
5022	Idesia polycarpa	Orangenkirsche
5023	Ilex aquifolium	Stechpalme
5024	Ilex crenata	Japanische Stechpalme
5025	Ilex pernyi	Rautenblättrige Stechpalme
5026	Indigofera heterantha	Himalaja-Indigostrauch
5027	Indigofera tinctoria	Färber-Indigostrauch
5028	Jacaranda mimosifolia	Palisanderholzbaum
5029	Jasminum nudiflorum	Winter-Jasmin
5030	Jasminum officinale	Echter Jasmin 
5031	Juglans ailantifolia	Japanische Walnuss
5032	Juglans cinerea	Butternuss
5033	Juglans microcarpa	Kleinfruchtige Walnuss
5034	Juglans nigra	Schwarznuss
5035	Juglans regia	Echte Walnuss
5036	Juniperus communis	Gemeiner Wacholder
5037	Juniperus oxycedrus	Rotbeeriger Wacholder
5038	Juniperus sabina	Sadebaum
5039	Juniperus scopulorum	Felsengebirgs-Wacholder
5040	Juniperus x pfitzeriana	Pfitzers Wacholder
5041	Kalmia latifolia	Breitblättrige Lorbeerrose
5042	Kalopanax septemlobus	Baum-Aralie
5043	Kerria japonica 'Pleniflora'	Ranunkelstrauch
5044	Khaya senegalensis	Afrikanischer Mahagonibaum
5045	Koelreuteria paniculata	Rispiger Blasenbaum
5046	Kolkwitzia amabilis	Kolkwitzie
5047	Laburnum alpinum	Alpen-Goldregen
5048	Laburnum anagyroides	Gewöhnlicher Goldregen
5049	Lagerstroemia indica	Indische Lagerstroemie
5050	Lagerstroemia speciosa	Prächtige Lagerstroemie
5051	Lagunaria patersonia	Norfolk-Hibiskus
5052	Lantana camara	Wandelröschen
5053	Larix decidua	Europäische Lärche
5054	Larix kaempferi	Japanische Lärche
5055	Larix x marschlinsii	Hybrid-Lärche
5056	Laurus nobilis	Lorbeerbaum
5057	Lavandula angustifolia	Schmalblättriger Lavendel
5058	Lavandula dentata	Gezähnter Lavendel
5059	Lavandula stoechas	Schopf-Lavendel
5060	Lespedeza thunbergii	Thunbergs Buschklee
5061	Leucaena leucocephala	Weißkopfmimose
5062	Leuocothoe fontanesiana	Gebogene Traubenheide
5063	Leycesteria formosa	Schöne Lycesterie
5064	Ligustrum japonicum	Japanischer Liguster
5065	Ligustrum lucidum	Glänzender Liguster
5066	Ligustrum ovalifolium	Wintergrüner Liguster
5067	Ligustrum vulgare	Gewöhnlicher Liguster
5068	Liquidambar formosana	Chinesischer Amberbaum
5069	Liquidambar orientalis	Orientalischer Amberbaum
5070	Liquidambar styraciflua	Amerikanischer Amberbaum
5071	Liriodendron chinense	Chinesischer Tulpenbaum
5072	Liriodendron tulipifera	Tulpenbaum
5073	Lonicera alpigena	Alpen-Heckenkirsche
5074	Lonicera caprifolium	Echtes Geißblatt
5075	Lonicera etrusca	Etruskisches Geißblatt
5076	Lonicera henryi	Henrys Heckenkirsche
5077	Lonicera implexa	Macchien-Geißblatt
5078	Lonicera japonica	Japanisches Geißblatt
5079	Lonicera kamtschatica	Kamtschatka-Heckenkirsche
5080	Lonicera maackii	Maacks Heckenkirsche
5081	Lonicera nigra	Schwarze Heckenkirsche
5082	Lonicera periclymenum	Wald-Geißblatt
5083	Lonicera pileata	Immergrüne Kriech-Heckenkirsche
5084	Lonicera tatarica	Tataren-Heckenkirsche
5085	Lonicera x heckrottii	Heckrotts Geißblatt
5086	Lonicera x purpusii 'Winter Beauty'	Purpus Heckenkirsche
5087	Lonicera xylosteum	Rote Heckenkirsche
5088	Lycium barbarum	Gemeiner Bocksdorn
5089	Maackia chinensis	Chinesisches Gelbholz
5090	Maclura pomifera	Osagedorn
5091	Magnolia acuminata	Gurken-Magnolie
5092	Magnolia acuminata var. acuminata	Blaue Gurken-Magnolie
5093	Magnolia denudata	Yulan-Magnolie
5094	Magnolia grandiflora	Immergrüne Magnolie
5095	Magnolia kobus	Kobushi-Magnolie
5096	Magnolia liliiflora	Purpur-Magnolie
5097	Magnolia macrophylla	Großblättrige Magnolie
5098	Magnolia obovata	Honoki-Magnolie
5099	Magnolia officinalis	Arznei-Magnolie
5100	Magnolia sieboldii	Sommer-Magnolie
5101	Magnolia stellata	Stern-Magnolie
5102	Magnolia tripetala	Schirm-Magnolie
5103	Magnolia x soulangeana	Tulpen-Magnolie
5104	Magnolia x wiesneri	Wiesners Magnolie
5105	Mahonia aquifolium	Gewöhnliche Mahonie
5106	Mahonia x media	Mittlere Mahonie
5107	Malus domestica	Kultur-Apfel
5108	Malus floribunda	Vielblütiger Apfel
5109	Malus sargentii	Sargents Apfel
5110	Malus sieboldii	Siebolds Apfel
5111	Malus sylvestris	Holz-Apfel
5112	Malus toringo	Toringo-Apfel
5113	Malus toringoides	Chinesischer Apfel
5114	Malus trilobata	Dreilappiger Apfel
5115	Malus x purpurea	Purpur-Apfel
5116	Malvaviscus penduliflorus	Hängender Schlafender Hibiskus
5117	Melia azedarach	Paternosterbaum
5118	Mespilus germanica	Mispel
5119	Metasequoia glyptostroboides	Chinesisches Rotholz
5120	Metrosideros excelsa	Neuseeländischer Weihnachtsbaum
5121	Morus alba	Weißer Maulbeerbaum
5122	Morus alba f. macrophylla	Platanenblättriger Maulbeerbaum
5123	Morus nigra	Schwarzer Maulbeerbaum
5124	Myoporum serratum	Myoporum serratum
5125	Myrtus communis	Gemeine Myrte
5126	Nandina domestica	Himmelsbambus
5127	Nerium oleander	Oleander
5128	Nicotiana glauca	Blaugrüner Tabak
5129	Nothofagus antarctica	Südbuche
5130	Nyssa sylvatica	Wald-Tupelobaum
5131	Olea europaea	Ölbaum
5132	Osmanthus x burkwoodii	Burkwoods Duftblüte
5133	Osmanthus x fortunei	Spätsommer-Duftblüte
5134	Ostrya carpinifolia	Hopfenbuche
5135	Ostrya virginiana	Virginische Hopfenbuche
5136	Osyris alba	Honigduftender Rutenstrauch
5137	Oxydendrum arboreum	Sauerbaum
5138	Pachypodium lamerei	Madagaskarpalme
5139	Paeonia x suffruticosa	Strauch-Päonie
5140	Paliurus spina-christi	Christdorn
5141	Parkinsonia aculeata	Jerusalemsdorn
5142	Parrotia persica	Persischer Eisenholzbaum
5143	Parrotiopsis jaquemontiana	Scheinparrotie
5144	Parthenocissus inserta	Gewöhnliche Jungfernrebe
5145	Parthenocissus quinquefolia	Wilder Wein
5146	Parthenocissus tricuspidata	Wilder Wein
5147	Passiflora caerulea	Blaue Passionsblume
5148	Paulownia hybridus	Paulownia-Hybride
5149	Paulownia tomentosa	Chinesischer Blauglockenbaum
5150	Peltophorum pterocarpum	Gelber Flammenbaum
5151	Pereskia bleo	Rosen-Kaktus
5152	Persea americana	Avocado
5153	Petteria ramentacea	Petterie
5154	Phellodendron amurense	Amur-Korkbaum
5155	Philadelphus coronarius	Pfeifenstrauch
5156	Philadelphus x virginalis	Pfeifenstrauch
5157	Phillyrea angustifolia	Schmalblättrige Steinlinde
5158	Phillyrea latifolia	Breitblättrige Steinlinde
5159	Phlomis fruticosa	Strauchiges Brandkraut
5160	Phoenix canariensis	Kanarische Dattelpalme
5161	Phoenix dactylifera	Echte Dattelpalme
5162	Photinia davidiana	Davids-Glanzmispel
5163	Photinia x fraseri	Kahle Glanzmispel
5164	Physocarpus opulifolius	Schneeballblättrige Blasenspiere
5165	Phytolacca dioica	Zweihäusige Kermesbeere
5166	Picea abies	Gemeine Fichte
5167	Picea abies 'Inversa'	Hänge-Fichte
5168	Picea asperata	Borsten-Fichte
5169	Picea breweriana	Siskiyou-Fichte
5170	Picea engelmanii	Engelmanns Fichte
5171	Picea glauca	Weiß-Fichte
5172	Picea glauca 'Conica'	Zuckerhut-Fichte
5173	Picea mariana	Schwarz-Fichte
5174	Picea omorika	Serbische Fichte
5175	Picea orientalis	Kaukasus-Fichte
5176	Picea polita	Tigerschwanz-Fichte
5177	Picea pungens 'Glauca'	Blaue Stech-Fichte
5178	Picea sitchensis	Sitka-Fichte
5179	Picea wilsonii	Wilsons Fichte
5180	Pieris floribunda	Vielblütige Lavendelheide
5181	Pieris japonica	Japanische Lavendelheide
5182	Pinus aristata	Grannen-Kiefer
5183	Pinus armandii	Davids-Kiefer
5184	Pinus attenuata	Höcker-Kiefer
5185	Pinus banksiana	Banks-Kiefer
5186	Pinus bungeana	Tempel-Kiefer
5187	Pinus canariensis	Kanarische Kiefer
5188	Pinus cembra	Zirbel-Kiefer
5189	Pinus contorta	Dreh-Kiefer
5190	Pinus coulteri	Coulter-Kiefer
5191	Pinus halepensis	Aleppo-Kiefer
5192	Pinus heldreichii	Panzer-Kiefer
5193	Pinus jeffreyi	Jeffrey-Kiefer
5194	Pinus koraiensis	Korea-Kiefer
5195	Pinus leucodermis	Schlangenhaut-Kiefer
5196	Pinus monophylla	Einnnadelige Kiefer
5197	Pinus monticola	Westamerikanische Weymouths-Kiefer
5198	Pinus mugo	Berg-Kiefer
5199	Pinus nigra	Schwarz-Kiefer
5200	Pinus nigra var. laricio	Korsische Kiefer
5201	Pinus nigra var. salzmanii	Pyrenäen-Kiefer
5202	Pinus parviflora	Mädchen-Kiefer
5203	Pinus peuce	Rumelische Kiefer
5204	Pinus pinaster	Strand-Kiefer
5205	Pinus pinea	Pinie
5206	Pinus ponderosa	Gelb-Kiefer
5207	Pinus strobus	Weymouths Kiefer
5208	Pinus sylvestris	Wald-Kiefer
5209	Pinus thunbergii	Thunbergs Kiefer
5210	Pinus uncinata	Haken-Kiefer
5211	Pinus wallichiana	Tränen-Kiefer
5212	Pinus x schwerinii	Schwerins Kiefer
5213	Pistacia lentiscus	Mastixstrauch
5214	Pistacia terebinthus	Terpentin-Pistazie
5215	Pistacia vera	Echte Pistazie
5216	Pittosporum crassifolium	Dickblättriger Klebsame
5217	Pittosporum tobira	Chinesischer Klebsame
5218	Pittosporum undulatum	Krausblättriger Klebsame
5219	Platanus orientalis	Morgenländische Platane
5220	Platanus x hispanica	Gewöhnliche Platane
5221	Platycarya strobilacea	Zapfennuss
5222	Platycladus orientalis	Morgenländischer Lebensbaum
5223	Plumbago auriculata	Kap-Bleiwurz
5224	Plumeria rubra	Frangipani
5225	Podranea ricasoliana	Rosa Klettertrompete
5226	Polygala myrtifolia	Myrtenblättrige Kreuzblume
5227	Poncirus trifoliata	Bitterorange
5228	Populus alba	Silber-Pappel
5229	Populus balsamifera	Balsam-Pappel
5230	Populus lasiocarpa	Großblatt-Pappel
5231	Populus nigra	Schwarz-Pappel
5232	Populus nigra 'Italica'	Pyramiden-Pappel
5233	Populus simonii	Birken-Pappel
5234	Populus tremula	Zitter-Pappel
5235	Populus trichocarpa	Westliche Balsam-Pappel
5236	Populus x canadensis	Kanada-Pappel
5237	Populus x canescens	Grau-Pappel
5238	Prosopis juliflora	Mesquite
5239	Prunus 'Accolade'	Prunus 'Accolade'
5240	Prunus 'Kursar'	Prunus 'Kursar'
5241	Prunus armeniaca	Aprikose
5242	Prunus avium	Vogel-Kirsche
5243	Prunus avium 'Plena'	Prunus avium 'Plena'
5244	Prunus cerasifera	Kirschpflaume
5245	Prunus cerasifera 'Nigra'	Blut-Pflaume
5246	Prunus cerasifera 'Rosea'	Prunus cerasifera 'Rosea'
5247	Prunus cerasus	Sauer-Kirsche
5248	Prunus cerasus 'Rhexii'	Prunus cerasus 'Rhexii'
5249	Prunus davidiana	Davids Pfirsich
5250	Prunus domestica	Pflaume
5251	Prunus domestica ssp. insititia	Hafer-Pflaume
5252	Prunus domestica ssp. syriaca	Mirabelle
5253	Prunus domestica subsp. domestica	Zwetschge
5254	Prunus domestica subsp. italica	Reneklode
5255	Prunus dulcis	Mandelbaum
5256	Prunus fenziliana	Kaukasische Mandel
5257	Prunus incana	Graue Kirschmandel
5258	Prunus incisa	Fuji-Kirsche
5259	Prunus laurocerasus	Kirschlorbeer
5260	Prunus lusitanica	Portugiesische Lorbeer-Kirsche
5261	Prunus maackii	Amur-Trauben-Kirsche
5262	Prunus mahaleb	Felsen-Kirsche
5263	Prunus mume	Japanische Aprikose
5264	Prunus nipponica var. kurilensis	Kurilen-Kirsche
5265	Prunus padus	Gemeine Trauben-Kirsche
5266	Prunus persica	Pfirsich
5267	Prunus sargentii	Berg-Kirsche
5268	Prunus serotina	Späte Trauben-Kirsche
5269	Prunus serrula	Mahagoni-Kirsche
5270	Prunus serrulata 'Kanzan'	Japanische Blüten-Kirsche
5271	Prunus sibirica	Sibirische Aprikose
5272	Prunus spinosa	Schlehe 
5273	Prunus subhirtella	Higan-Kirsche
5274	Prunus subhirtella f. autumnalis	Winter-Kirsche
5275	Prunus tomentosa	Japanische Mandel-Kirsche
5276	Prunus triloba	Mandelbäumchen
5277	Pseudocydonia sinensis	Holz-Quitte
5278	Pseudolarix amabilis	Goldlärche
5279	Pseudotsuga menziesii	Douglasie
5280	Ptelea trifoliata	Kleeulme
5281	Pterocarya fraxinifolia	Kaukasische Flügelnuss
5282	Pterocarya rhoifolia	Japanische Flügelnuss
5283	Pterocarya stenoptera	Chinesische Flügelnuss
5284	Pterostyrax corymbosus	Doldiger Flügel-Storax
5285	Pterostyrax hispidus	Borstiger Flügelstorax
5286	Punica granatum	Granatapfel
5287	Pyracantha coccinea	Feuerdorn
5288	Pyrocydonia daniellii	Quittenbirne
5289	Pyrus betulifolia	Birkenblättrige Birne
5290	Pyrus calleryana 'Chanticleer'	Chinesische Birne
5291	Pyrus communis	Kultur-Birne
5292	Pyrus pyraster	Holz-Birne
5293	Pyrus pyrifolia var. culta	Nashi-Birne
5294	Pyrus salicifolia	Weidenblättrige Birne
5295	Quercus acutissima	Seidenraupen-Eiche
5296	Quercus alba	Weiß-Eiche
5297	Quercus calliprinos	Palästina-Eiche
5298	Quercus canariensis	Algerische Eiche
5299	Quercus castaneifolia	Kastanienblättrige Eiche
5300	Quercus cerris	Zerr-Eiche
5301	Quercus coccifera	Kermes-Eiche
5302	Quercus coccinea	Scharlach-Eiche
5303	Quercus dentata	Japanische Kaiser-Eiche
5304	Quercus faginea	Portugiesische Eiche
5305	Quercus frainetto	Ungarische Eiche
5306	Quercus ilex	Stein-Eiche
5307	Quercus ilicifolia	Busch-Eiche
5308	Quercus imbricaria	Schindel-Eiche
5309	Quercus ithaburensis ssp. macrolepis	Vallonea-Eiche
5310	Quercus libani	Libanon-Eiche
5311	Quercus macranthera	Persische Eiche
5312	Quercus macrocarpa	Klettenfrüchtige Eiche
5313	Quercus marilandica	Schwarz-Eiche
5314	Quercus nigra	Wasser-Eiche
5315	Quercus palustris	Sumpf-Eiche
5316	Quercus petraea	Trauben-Eiche
5317	Quercus petraea 'Laciniata Crispa'	Fadenblatt-Eiche
5318	Quercus petraea Mespilifolia Group	Mispelblättrige Eiche
5319	Quercus phellos	Weiden-Eiche
5320	Quercus pontica	Pontische Eiche
5321	Quercus pubescens	Flaum-Eiche
5322	Quercus pyrenaica	Pyrenäen-Eiche
5323	Quercus robur	Stiel-Eiche
5324	Quercus robur f. fastigiata	Säulen-Stiel-Eiche
5325	Quercus robur f. pectinata	Schlitzblättrige Stiel-Eiche
5326	Quercus rubra	Rot-Eiche
5327	Quercus rysophylla	Wollmispel-Eiche
5328	Quercus shumardii	Shumard-Eiche
5329	Quercus stellata	Pfahl-Eiche
5330	Quercus suber	Kork-Eiche
5331	Quercus velutina	Färber-Eiche
5332	Quercus x hispanica 'Lucombeana'	Spanische Eiche
5333	Quercus x leana	Leas Eiche
5334	Quercus x turneri	Wintergrüne Eiche
5335	Rhamnus alaternus	Immergrüner Kreuzdorn
5336	Rhamnus cathartica	Purgier-Kreuzdorn
5337	Rhamnus imeretina	Kaukasischer Faulbaum
5338	Rhamnus lycioides	Bocksdornartiger Kreuzdorn
5339	Rhamnus pumila	Zwerg-Kreuzdorn
5340	Rhamnus saxatilis	Felsen-Kreuzdorn
5341	Rhododendron catawbiense	Catawba-Rhododendron 
5342	Rhododendron ferrugineum	Rostblättrige Alpenrose
5343	Rhododendron hirsutum	Behaarte Alpenrose
5344	Rhododendron tomentosum	Sumpf-Porst
5345	Rhodotypos scandens	Scheinkerrie
5346	Rhus typhina	Essig-Baum
5347	Ribes aureum	Gold-Johannisbeere
5348	Ribes petraeum	Felsen-Johannisbeere
5349	Ribes rubrum	Rote Johannisbeere
5350	Ribes sanguineum	Blut-Johannisbeere
5351	Ribes uva-crispa var. sativum	Kultur-Stachelbeere
5352	Ricinus communis	Wunderbaum
5353	Robinia hispida	Borstige Robinie
5354	Robinia luxurians	Üppige Robinie
5355	Robinia pseudoacacia	Robinie
5356	Robinia pseudoacacia 'Frisia'	Gold-Robinie
5357	Robinia x margaretta 'Casque Rouge'	Robinia x margaretta
5358	Rosa banksiae	Banks Rose
5359	Rosa canina	Hunds-Rose
5360	Rosa gallica	Essig-Rose
5361	Rosa glauca	Rotblatt-Rose
5362	Rosa multiflora	Vielblütige Rose
5363	Rosa rugosa	Kartoffel-Rose
5364	Rosa sericea ssp. omeiensis f. pteracantha	Stacheldraht-Rose
5365	Rosa spinosissima	Bibernell-Rose
5366	Rosa tomentosa	Filz-Rose
5367	Rosmarinus officinalis	Rosmarin
5368	Rubia peregrina	Kletten-Krapp
5369	Rubus fruticosus	Brombeere
5370	Rubus idaeus	Himbeere
5371	Rubus odoratus	Wohlriechende Himbeere
5372	Rubus spectabilis	Lachs-Himbeere
5373	Ruscus aculeatus	Stacheliger Mäusedorn
5374	Ruta graveolens	Wein-Raute
5375	Salix alba	Silber-Weide
5376	Salix alba 'Tristis'	Trauer-Weide
5377	Salix aurita	Ohr-Weide
5378	Salix babylonica	Babylonische Trauer-Weide
5379	Salix caprea	Sal-Weide
5380	Salix caprea 'Kilmarnock'	Hängekätzchen-Weide
5381	Salix cinerea	Grau-Weide
5382	Salix fragilis	Bruch-Weide
5383	Salix integra 'Hakuro Nishiki'	Harlekin-Weide
5384	Salix irrorata	Amerikanische Reif-Weide
5385	Salix matsudana 'Tortuosa'	Korkenzieher-Weide
5386	Salix purpurea	Purpur-Weide
5387	Salix retusa	Stumpfblättrige Weide
5388	Salix udensis f. sekka	Drachen-Weide
5389	Salix viminalis	Korb-Weide
5390	Salvia greggii	Herbst-Salbei
5391	Salvia officinalis	Echter Salbei
5392	Samanea saman	Rain Tree
5393	Sambucus nigra	Schwarzer Holunder
5394	Sambucus nigra f. porphyrophylla	Schwarzpurpurner schlitzblättriger Holunder
5395	Sambucus nigra ssp. caerulea	Blauer Holunder
5396	Sambucus racemosa	Trauben-Holunder
5397	Santolina chamaecyparissus	Graues Heiligenkraut
5398	Sarcococca hookeriana var. humilis	Himalaja-Fleischbeere
5399	Sassafras albidum	Fenchelholzbaum
5400	Satureja montana	Berg-Bohnenkraut
5401	Schefflera actinophylla	Queensland Strahlenaralie
5402	Schinus molle	Pfefferbaum
5403	Sciadopitys verticillata	Schirmtanne
5404	Senna didymobotrya	Kerzenstrauch
5405	Senna x floribunda	Gewürzstrauch
5406	Sequoia sempervirens	Küsten-Mammutbaum
5407	Sequoiadendron giganteum	Riesen-Mammutbaum
5408	Shepherdia argentea	Silber-Büffelbeere
5409	Sinocalycanthus chinensis	Chinesischer Gewürzstrauch
5410	Skimmia japonica	Japanische Skimmie
5411	Smilax aspera	Raue Stechwinde
5412	Solanum dulcamara	Bittersüßer Nachtschatten
5413	Solanum jasminoides	Jasminblütiger Nachtschatten 
5414	Sorbaria sorbifolia	Sibirische Fiederspiere
5415	Sorbus alnifolia	Erlenblättrige Mehlbeere
5416	Sorbus americana	Amerikanische Eberesche
5417	Sorbus aria	Echte Mehlbeere
5418	Sorbus aucuparia	Eberesche
5419	Sorbus chamaemespilus	Zwerg-Eberesche
5420	Sorbus domestica	Speierling
5421	Sorbus intermedia	Schwedische Mehlbeere
5422	Sorbus torminalis	Elsbeere
5423	Sparmannia africana	Zimmerlinde
5424	Spartium junceum	Pfriemenginster
5425	Spathodea campanulata	Afrikanischer Tulpenbaum
5426	Spiraea japonica	Japanischer Spierstrauch
5427	Spiraea thunbergii	Thunbergs Spierstrauch
5428	Spiraea x billardii	Billards Spierstrauch
5429	Spiraea x vanhouttei	Pracht-Spierstrauch
5430	Stachyurus praecox	Japanischer Perlschweif
5431	Staphylea colchica	Kolchische Pimpernuss
5432	Staphylea holocarpa	Chinesische Pimpernuss
5433	Staphylea pinnata	Pimpernuss
5434	Stephanandra incisa	Kleine Kranzspiere
5435	Stewartia pseudocamellia	Scheinkamelie
5436	Styphnolobium japonicum	Japanischer Schnurbaum
5437	Styrax japonicus	Japanischer Storaxbaum
5438	Styrax obassia	Obassia-Storaxbaum
5439	Styrax officinalis	Echter Storaxbaum
5440	Symphoricarpos albus	Gemeine Schneebeere
5441	Symphoricarpos x chenaultii	Chenault-Schneebeere
5442	Syringa meyeri	Zwerg-Flieder
5443	Syringa reflexa	Bogen-Flieder
5444	Syringa vulgaris	Gewöhnlicher Flieder
5445	Taiwania cryptomerioides	Taiwanie
5446	Tamarix africana	Afrikanische Tamariske
5447	Tamarix aphylla	Blattlose Tamariske
5448	Tamarix parviflora	Frühlings-Tamariske
5449	Taxodium distichum	Sumpfzypresse
5450	Taxus baccata	Gemeine Eibe
5451	Tecoma capensis	Kapgeißblatt
5452	Tecoma stans	Gelbe Trompetenblume
5453	Terminalia catappa	Seemandel
5454	Tetradium daniellii	Samthaarige Stinkesche
5455	Tetrapanax papyrifer	Reispapierbaum
5456	Thuja occidentalis	Abendländischer Lebensbaum
5457	Thuja plicata	Riesen-Lebensbaum
5458	Thujopsis dolabrata	Hiba-Lebensbaum
5459	Thymelaea hirsuta	Behaarte Spatzenzunge
5460	Thymus vulgaris	Echter Thymian
5461	Tilia americana	Amerikanische Linde
5462	Tilia cordata	Winter-Linde
5463	Tilia dasystyla	Kaukasische Linde
5464	Tilia henryana	Henrys Linde
5465	Tilia mongolica	Mongolische Linde
5466	Tilia platyphyllos	Sommer-Linde
5467	Tilia tomentosa	Silber-Linde
5468	Tilia tomentosa f. petiolaris	Hänge-Silber-Linde
5469	Tilia x euchlora	Krim-Linde
5470	Tilia x europaea	Holländische Linde
5471	Tipuana tipu	Tipubaum
5472	Toona sinensis	Surenbaum
5473	Torreya californica	Kalifornische Nusseibe
5474	Trachelospermum jasminoides	Chinesischer Sternjasmin
5475	Trachycarpus fortunei	Chinesische Hanfpalme
5476	Trochodendron aralioides	Radbaum
5477	Tsuga canadensis	Kanadische Hemlock
5478	Tsuga diversifolia	Japanische Hemlocktanne
5479	Tsuga heterophylla	Westliche Hemlockstanne
5480	Ulex europaeus	Stechginster
5481	Ulmus glabra	Berg-Ulme
5482	Ulmus laevis	Flatter-Ulme
5483	Ulmus minor	Feld-Ulme
5484	Ulmus minor 'Jacqueline Hillier'	Ulme 'Jacqueline Hillier'
5485	Ulmus minor 'Wredei'	Gold-Ulme
5486	Ulmus parvifolia	Chinesische Ulme
5487	Ulmus pumila	Sibirische Ulme
5488	Vaccinium corymbosum	Amerikanische Heidelbeere
5489	Vaccinium myrtillus	Blaubeere
5490	Vaccinium uliginosum	Rauschbeere
5491	Vaccinium vitis-idaea	Preißelbeere
5492	Vachellia xanthophloea	Gelbrinden-Akazie
5493	Viburnum carlesii	Koreanischer Schneeball
5494	Viburnum davidii	Davids Schneeball
5495	Viburnum farreri	Duftender Schneeball
5496	Viburnum lantana	Wolliger Schneeball
5497	Viburnum lantanoides	Erlenblättriger Schneeball
5498	Viburnum lentago	Kanadischer Schneeball
5499	Viburnum opulus	Gemeiner Schneeball
5500	Viburnum opulus f. roseum	Gefüllter Gewöhnlicher Schneeball
5501	Viburnum plicatum	Japanischer Schneeball
5502	Viburnum plicatum f. sterile	Gefüllter Japanischer Schneeball
5503	Viburnum rhytidophyllum	Runzelblättriger Schneeball
5504	Viburnum tinus	Lorbeerblättriger Schneeball
5505	Viburnum x bodnantense	Bodnant-Schneeball
5506	Viburnum x burkwoodii	Oster-Schneeball
5507	Viburnum x carlcephalum	Großblumiger Duft-Schneeball
5508	Viscum album	Mistel
5509	Vitex agnus-castus	Mönchspfeffer
5510	Vitis coignetiae	Rostrote Weinrebe
5511	Vitis vinifera	Echte Weinrebe
5512	Washingtonia filifera	Kalifornische Palme
5513	Washingtonia robusta	Mexikanische Fächerpalme
5514	Weigela florida	Liebliche Weigelie
5515	Wisteria floribunda	Japanischer Blauregen
5516	Wisteria sinensis	Chinesischer Blauregen
5517	Wollemia nobilis	Wollemie
5518	Xanthoceras sorbifolium	Gelbhorn
5519	Xanthocyparis nootkatensis	Nootka-Scheinzypresse
5520	Yucca gloriosa	Kerzen-Palmlilie
5521	Zanthoxylum simulans	Täuschendes Gelbholz
5522	Zelkova carpinifolia	Kaukasische Zelkove
5523	Zelkova serrata	Japanische Zelkove
5524	Ziziphus jujuba	Chinesische Dattel
\.


--
-- Name: tree_species_skey_seq; Type: SEQUENCE SET; Schema: public; Owner: postgis_user
--

SELECT pg_catalog.setval('public.tree_species_skey_seq', 5524, true);


--
-- Name: tree_species tree_species_pkey; Type: CONSTRAINT; Schema: public; Owner: postgis_user
--

ALTER TABLE ONLY public.tree_species
    ADD CONSTRAINT tree_species_pkey PRIMARY KEY (skey);


--
-- PostgreSQL database dump complete
--

