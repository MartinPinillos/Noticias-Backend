--
-- PostgreSQL database dump
--

-- Dumped from database version 14.18 (Homebrew)
-- Dumped by pg_dump version 14.18 (Homebrew)

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
-- Name: noticiasdb; Type: DATABASE; Schema: -; Owner: martin
--

CREATE DATABASE noticiasdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C';


ALTER DATABASE noticiasdb OWNER TO martin;

\connect noticiasdb

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
-- Name: noticias; Type: TABLE; Schema: public; Owner: noticias
--

CREATE TABLE public.noticias (
    id integer NOT NULL,
    titulo character varying(255) NOT NULL,
    subtitulo character varying(300),
    descripcion text NOT NULL,
    autor character varying(100),
    url_imagen text,
    fecha timestamp without time zone DEFAULT now(),
    categoria character varying(100) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.noticias OWNER TO noticias;

--
-- Name: noticias_id_seq; Type: SEQUENCE; Schema: public; Owner: noticias
--

CREATE SEQUENCE public.noticias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.noticias_id_seq OWNER TO noticias;

--
-- Name: noticias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: noticias
--

ALTER SEQUENCE public.noticias_id_seq OWNED BY public.noticias.id;


--
-- Name: noticias id; Type: DEFAULT; Schema: public; Owner: noticias
--

ALTER TABLE ONLY public.noticias ALTER COLUMN id SET DEFAULT nextval('public.noticias_id_seq'::regclass);


--
-- Data for Name: noticias; Type: TABLE DATA; Schema: public; Owner: noticias
--

INSERT INTO public.noticias (id, titulo, subtitulo, descripcion, autor, url_imagen, fecha, categoria) VALUES (1, 'Un informe global advirtió por el calentamiento de los océanos entre Nueva Zelanda y Argentina', 'Científicos plantearon que el calor no se distribuye de manera uniforme en las aguas marítimas. El impacto del cambio climático y las regiones más comprometidas, según dijo a Infobae el primer autor del estudio, el climatólogo Kevin Trenberth', 'El calentamiento global está dejando una huella profunda e inconfundible en los océanos del planeta, donde se almacena gran parte del calor excedente.

En ese sentido, un estudio realizado por investigadores de Nueva Zelanda, China, Estados Unidos y Austria reveló que la energía térmica se está distribuyendo de manera desigual en los océanos.

Encontraron que cerca de la latitud entre 40 y 45 grados al sur los océanos están calentándose a un ritmo sin precedentes, con efectos especialmente marcados en los alrededores de Nueva Zelanda, Tasmania y en aguas del Atlántico que se encuentran al este de Argentina.

Infobae entrevistó al primer autor de la investigación, el científico Kevin Trenberth, quien trabaja en el Centro Nacional de Investigación Atmosférica en Boulder, Estados Unidos, y en la Universidad de Auckland en Nueva Zelanda.', 'Martin', 'https://res.cloudinary.com/dtlyz4btz/image/upload/v1748226586/gidvv3716v9opo48xamv.avif', '2025-05-25 23:30:22.379', 'MEDIO AMBIENTE');
INSERT INTO public.noticias (id, titulo, subtitulo, descripcion, autor, url_imagen, fecha, categoria) VALUES (2, '¿Las tormentas solares son peligrosas para las comunicaciones en la Tierra? La respuesta de los expertos', 'Las erupciones de alta energía que emite el Sol durante su fase más activa podrían incidir sobre redes satelitales, sistemas de navegación y equipos electrónicos sensibles. Las advertencias de los especialistas.', 'Nuestra estrella está desde el año pasado atravesando un intenso período de actividad, lo que provoca usualmente en la Tierra las famosas tormentas solares que pueden traer desde auroras espectaculares hasta problemas en las telecomunicaciones y daños a los aparatos electrónicos.

El 14 de mayo, el Observatorio de Dinámica Solar de la NASA detectó una de las erupciones solares más intensas del ciclo actual. Clasificada como X2.7 en la escala que mide este tipo de fenómenos, la llamarada captó de inmediato la atención de los expertos en meteorología espacial y puso en marcha protocolos de monitoreo en todo el mundo.

La eyección de masa coronal que acompañó el evento, cuya extensión superó los 967.000 kilómetros, generó fallos temporales en sistemas de radio de alta frecuencia y alteraciones en varios satélites. La forma de esta estructura, que se desplegó como unas alas extendidas, fue denominada “Ala de Pájaro” por la comunidad científica.', 'Martin', 'https://res.cloudinary.com/dtlyz4btz/image/upload/v1748226665/yfhpuab47gbiblupup17.avif', '2025-05-25 23:31:43.19', 'CIENCIA');
INSERT INTO public.noticias (id, titulo, subtitulo, descripcion, autor, url_imagen, fecha, categoria) VALUES (3, 'La cápsula Dragon de SpaceX amerizó con experimentos científicos de la Estación Espacial Internacional', 'Una misión no tripulada completó exitosamente el regreso de tres toneladas de investigaciones que ayudarán a avanzar el conocimiento sobre los materiales espaciales y las comunicaciones', 'Una cápsula Dragon de SpaceX cargada con experimentos científicos críticos amerizó exitosamente en las primeras horas de la madrugada en aguas de la costa de California, completando así la misión número 32 de reabastecimiento comercial a la Estación Espacial Internacional (EEI), confirmó la NASA.

La nave espacial no tripulada tocó las aguas del océano Pacífico aproximadamente a la 1:44 hora local (8:44 GMT), ejecutando un amerizaje controlado que marca el final exitoso de una misión que comenzó el pasado 21 de abril cuando la cápsula despegó desde Florida.

El amerizaje controlado fue con los primeros paracaídas construidos íntegramente por SpaceX. Probados a principios de este año, incluyen mejoras clave, como articulaciones y cintas más resistentes y un paquete reposicionado para un despliegue e inflado más suaves.', 'Ricardo', 'https://res.cloudinary.com/dtlyz4btz/image/upload/v1748226761/lgswlcil5u7mpfu7791h.avif', '2025-05-25 23:33:22.668', 'CIENCIA');
INSERT INTO public.noticias (id, titulo, subtitulo, descripcion, autor, url_imagen, fecha, categoria) VALUES (4, 'Los riesgos de los alimentos ultraprocesados: por qué están cada vez más bajo la lupa de los científicos', 'Más allá de las calorías vacías, son productos que pueden esconder niveles de químicos sintéticos como plaguicidas y microplásticos. Qué pruebas aportaron dos estudios recientes y qué recomiendan expertas consultadas por Infobae', 'Desde hace más de cinco décadas se habla de la “comida chatarra” para englobar desde golosinas, snacks salados y dulces hasta las sopas instantáneas, bebidas azucaradas y energéticas y hamburguesas, entre otros productos.

Ahora el consumo de ese tipo de alimentos, llamados ultraprocesados, está bajo la lupa de los científicos porque hay pruebas sólidas sobre sus efectos perjudiciales en la salud humana.

Pueden aumentar el riesgo de sufrir diferentes enfermedades, desde infartos hasta depresión, y hasta acortar el tiempo de vida.', 'Valeria', 'https://res.cloudinary.com/dtlyz4btz/image/upload/v1748226840/cz2zatymxcatmancsg5z.avif', '2025-05-25 23:34:38.123', 'CIENCIA');
INSERT INTO public.noticias (id, titulo, subtitulo, descripcion, autor, url_imagen, fecha, categoria) VALUES (5, 'Montos de evasión y plazos para revisar “para atrás”: los ejes del proyecto para sacar los dólares “del colchón”', 'La intención es modificar la Ley Penal Tributaria aumentando el monto de evasión a $100 millones. También modificarían los plazos de la Ley de Procedimiento Fiscal. El rol de las provincias', 'El gobierno nacional anunció en la tarde del jueves el proceso que quiere llevar adelante para que los fondos no declarados se puedan utilizar sin tener consecuencias legales.

El denominado Plan de Reparación Histórica de los Ahorros de los Argentinos fue realizado por el ministro de Economía, Luis “Toto” Caputo, el presidente del Banco Central, Santiago Bausili, y el titular de la ARCA, Juan Alberto Pazo, y estableció en esta primera etapa el quite de controles en diferentes operaciones y la modificación de los montos a partir de los cuales se tienen que informar al ente recaudador.

Pero buena parte de los cambios que pretende hacer el Gobierno dependen de modificaciones de leyes que obligatoriamente tienen que pasar por el Congreso, ya que el Ejecutivo no puede legislar sobre temas tributarios.

Tanto es así que el comunicado de la Oficina de Prensa de la Presidencia señala que “la forma de blindar lo anterior -los anuncios realizados ayer- frente a una nueva eventual administración es con la aprobación del proyecto de ley que el Poder Ejecutivo estará enviando al Congreso en los próximos días".

En el Congreso están a la espera de ese proyecto y, aunque se sabe muy poco al respecto, algunas fuentes consultadas adelantaron a Infobae cuáles son los cambios que está terminando de trabajar el Ministerio de Economía y la Casa Rosada.', 'David', 'https://res.cloudinary.com/dtlyz4btz/image/upload/v1748226929/jd6bp9hdbsspoldu9e1i.avif', '2025-05-25 23:35:54.784', 'POLITICA');
INSERT INTO public.noticias (id, titulo, subtitulo, descripcion, autor, url_imagen, fecha, categoria) VALUES (6, 'El Presidente participó del cambio de guardia de los granaderos en Plaza de Mayo tras el Tedeum del 25 de Mayo', 'Javier Milei presenció la ceremonia en el intercambio de guardias de honor del Cabildo. Cómo se fundó el Regimiento Patricios y qué implicancias tuvo en la historia argentina', 'Luego del Tedeum en la Catedral Metropolitana de la Ciudad Autónoma de Buenos Aires el presidente de la Nación, Javier Gerardo Milei, participó del cambio de guardia del Regimiento 1 “Patricios”.

A las 9.40, el mandatario argentino arribó a Plaza de Mayo junto a su hermana y secretaria general de la Presidencia, Karina Milei. Bajo la niebla, Milei se paró frente al regimiento, en el antiguo solar de la Plaza Mayor y de la Plaza de la Victoria, y saludó efusivamente al Regimiento de Infantería 1 “Patricios”, que es la unidad más antigua del Ejército Argentino. También participaron la Armada Argentina y la Fuerza Aérea Argentina.

Luego, los jefes de cada guardia (entrante y saliente) solicitaron autorización para continuar con el relevo de la guardia de honor del Cabildo y, tras efectuar el cambio, un oficial de Patricios pronunció el catecismo militar de dicha agrupación. Finalmente, las tropas se dirigieron a sus respectivos lugares de responsabilidades, con la Marcha de las Malvinas de fondo, mientras una fracción de Granaderos hizo un desfile final ante todos los presentes.

Desde el año pasado, se instauró que todos los primeros sábados de cada mes, se realice abiertamente para todo el público, en Plaza de Mayo, la ceremonia de los relevos en guardias.

Los primeros días de mayo del año pasado, se desarrolló el primer relevo de guardia en simultáneo entre los regimientos de Infantería 1 “Patricios”, Regimiento de Granaderos a Caballo “General San Martín” y Regimiento de Artillería 1 “Brigadier General Tomás de Iriarte”.', 'Alejandro', 'https://res.cloudinary.com/dtlyz4btz/image/upload/v1748227000/l71jn98clp3ay6llurlv.avif', '2025-05-25 23:37:06.498', 'POLITICA');
INSERT INTO public.noticias (id, titulo, subtitulo, descripcion, autor, url_imagen, fecha, categoria) VALUES (7, 'Miguel Russo puso en duda su futuro en San Lorenzo tras la derrota ante Platense: qué dijo sobre su posible vuelta a Boca', 'El experimentado entrenador del Ciclón se refirió a los rumores que lo vinculan al Xeneize', 'Luego de la derrota ante Platense en la semifinal del Torneo Apertura, todas las hipótesis se instalaron sobre el futuro de Miguel Ángel Russo en San Lorenzo. El experimentado estratega lideró una campaña notable en un equipo que careció de jerarquía y apoyo de la Comisión Directiva. Y haberse quedado en las puertas de la final del campeonato doméstico fue tomado como un reconocimiento por los fanáticos que le agradecieron al DT el esfuerzo realizado en plena crisis institucional. Sin embargo, la presión mediática que vincula al entrenador con Boca Juniors fue el tema central que acaparó la atención de su conferencia de prensa.

“Hablo de San Lorenzo y nada más. Ustedes saben cómo soy yo. Estos chicos formaron un gran grupo, y ahora tenemos que afrontar un día muy duro”, comenzó el DT ante la pregunta de los periodistas que buscaron algún indicio sobre algún posible vínculo con el Xeneize.

En la misma sintonía, cuando le consultaron sobre si seguirá al frente del Ciclón, el Palomo insistió en mantener una postura serena, lejos de alimentar cualquier especulación: “No voy a hablar de mi futuro. Hoy me invade la derrota y el dolor. Todo lo que diga, yo no escucho nada ni me interesa. Hay que saber qué decir. Las cosas que tenga internamente no las hablaré en público”.

En una línea paralela por su pasado en el Gigante de Arroyito, Miguel Ángel Russo intentó hacer una comparativa que no quedó del todo clara. “Más allá de todo esto, ustedes me conocen. Hoy es duro mantener todo. Me pasó en Central, porque uno me tiró una piedra y me arruinó todo. En la Copa Libertadores veníamos muy bien, pero influyeron muchas cosas en ese partido con Peñarol. Me acuerdo de todo, porque tengo mucha memoria. Hoy pasó algo similar”.

Finalmente, cuando dejó las sensaciones que le dejó la caída con el Calamar, remarcó el sabor amargo con el que se fue del Pedro Bidegain. “No nos gusta haber quedado eliminados. Estamos dolidos, pero esto es fútbol. Hay que seguir”, concluyó.', 'Daniela', 'https://res.cloudinary.com/dtlyz4btz/image/upload/v1748227076/gfwgaxgfckc7v3zes72s.avif', '2025-05-25 23:38:35.478', 'DEPORTES');
INSERT INTO public.noticias (id, titulo, subtitulo, descripcion, autor, url_imagen, fecha, categoria) VALUES (8, 'Se realizó el sorteo del Mundial Sub 17 de Qatar: los rivales de la selección argentina', 'El combinado nacional albiceleste integrará en el Grupo D', 'La selección argentina Sub 17 ya conoce a sus rivales para el próximo Mundial Sub 17, que se llevará a cabo en Qatar entre el 5 y el 27 de noviembre. El sorteo realizado por la FIFA este domingo 25 de mayo determinó que el equipo dirigido por Diego Placente formará parte del Grupo D, donde enfrentará a Bélgica, Túnez y Fiyi. Los detalles sobre los días y los horarios del calendario de los partidos serán anunciados próximamente.

El torneo de este año marcará un hito en la historia del fútbol juvenil, ya que será la primera edición de un Mundial Sub 17 con 48 selecciones participantes, un formato ampliado que también se implementará en las próximas ediciones aprobadas por la FIFA para disputarse anualmente en Qatar hasta 2029. Los equipos han sido distribuidos en 12 grupos de cuatro integrantes cada uno. De cada zona, avanzarán a los dieciseisavos de final los dos primeros clasificados y los ocho mejores terceros. A partir de esa instancia, el torneo se desarrollará bajo un formato de eliminación directa.

La selección argentina Sub 17, que obtuvo el sexto puesto en el Campeonato Sudamericano de la Conmebol celebrado en Colombia entre marzo y abril, llega a este torneo con el objetivo de superar su desempeño regional y competir al más alto nivel. Bajo la dirección técnica de Diego Placente, el equipo buscará destacarse en un grupo que presenta grandes desafíos, desde la potencia europea de Bélgica hasta la representación africana de Túnez y el combinado oceánico de Fiyi.', 'Milagros', 'https://res.cloudinary.com/dtlyz4btz/image/upload/v1748227172/uxzger9ytld93ear84hx.avif', '2025-05-25 23:40:06.228', 'DEPORTES');


--
-- Name: noticias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: noticias
--

SELECT pg_catalog.setval('public.noticias_id_seq', 8, true);


--
-- Name: noticias noticias_pkey; Type: CONSTRAINT; Schema: public; Owner: noticias
--

ALTER TABLE ONLY public.noticias
    ADD CONSTRAINT noticias_pkey PRIMARY KEY (id);


--
-- Name: DATABASE noticiasdb; Type: ACL; Schema: -; Owner: martin
--

GRANT ALL ON DATABASE noticiasdb TO noticias;


--
-- PostgreSQL database dump complete
--

