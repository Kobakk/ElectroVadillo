use MaterialesElectricosF;
go

DROP TABLE cliente;
DROP TABLE pueblo;
DROP TABLE Provincia;
DROP TABLE articulo;
DROP TABLE categoria;
DROP TABLE pedido;
DROP TABLE lineaPedido;
DROP TABLE factura;
DROP TABLE lineaFactura
go

CREATE TABLE categoria
( id INT IDENTITY NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  imagen VARCHAR(100) NOT NULL,
  descripcion VARCHAR(2000) NOT NULL,
  CONSTRAINT PkCategorias
    PRIMARY KEY (id),
);

INSERT INTO categoria (nombre, imagen, descripcion)
  VALUES ('Cables', '1-Cables.png', 'Mangueras de material aislante y protector que contienen un conductor (hilo eléctrico) aislado o conjunto de conductores aislados (conductor eléctrico), generalmente de cobre o aluminio1'),
         ('Tuberías y Regletas', '2-Tuberias.png', 'Sistemas de conductos flexibles o no, hechos de metal, plástico o fibra, que se usan para la protección y el enrutamiento del cableado eléctrico'),
         ('Protección y control', '3-ProteccionYControl.png', 'Elementos de seguridad para disminuir el riesgo de accidentes, como los causados por cortocircuitos, sobrecargas o contacto de personas o animales con elementos en tensión, y elementos para controlar y procesar la entrada de los impulsos eléctricos en equipos sencillos o complejos. Contienen una serie de dispositivos que se encargan de realizar la función controladora, tales como, interruptor de control (relé), contactores, material sintético y conductores de electricidad'),
         ('Mecanismos', '4-Mecanismos.png', 'Dispositivos destinados a permitir o interrumpir el paso de la corriente al ser accionados por los usuarios. Estos dispositivos son: interruptores, conmutadores, conmutadores de cruzamiento, pulsadores...'),
         ('Transformadores', '5-Transformadores.png', 'Elementos eléctricos que permiten aumentar o disminuir la tensión en un circuito eléctrico de corriente alterna, manteniendo la potencia'),
         ('Reactancias', '6-Reactancias.png',  'Elementos que ofrecen resistencia al paso de la corriente alterna por inductores (bobinas) y condensadores'),
         ('Capacitadores / condensadores', '7-CapacitadoresCondensadores.png', 'Dispositivos pasivos capaces de almacenar energía sustentando un campo eléctrico'),
         ('Módulos de contador', '8-ModulosContador.png', 'Cajas preparadas para contener contadores eléctricos, tanto mofásicos como trifásicos, capaces de informar de los consumos elécricos'),
         ('Cajas de acometida', '9-CajasAcometida.png', 'Cajas generales de protección, también denomidas Cajas de acometida GL, en los distintos esquemas y homologadas por compañía'),
         ('Fusibles', '10-Fusibles.png', 'Elementos de protección por fusión contra posibles fallos en los circuitos eléctricos por sobrecarga de corriente eléctrica'),
         ('Material Cetac', '11-MaterialCetac.png', 'Enchufes de uso industrial estandarizados por la Comisión Electrotécnica Internacional. El mayor voltaje permitido por la norma es 690 V CC o CA; la corriente más alta, 250 A; y la mayor frecuencia, 500 Hz. El rango de temperaturas es de −25 °C a 40 °C');

CREATE TABLE  articulo
( codigo	VARCHAR(10)	NOT NULL,
  descripcion	VARCHAR(100) 	NOT NULL,
  pv		MONEY DEFAULT 0 NOT NULL,
  stock		INT 	DEFAULT 0,
  reponerA	INT 	DEFAULT 0,
  idCategoria INT NOT NULL,
  CONSTRAINT PKArticulo
	PRIMARY KEY (codigo),
  CONSTRAINT FkCategoriaNArticulo
    FOREIGN KEY (idCategoria)
    REFERENCES categoria (id),
);

INSERT INTO articulo (codigo, descripcion, pv, stock, reponerA, idCategoria)
  VALUES ('E-101201', 'Hilo flexible H07Z1-K de 1.5 en azul – libre de halógenos', 0.70, 100, 10, 1),
('E-101204', 'Hilo flexible H07Z1-K de 1.5 en negro – Libre de halógenos', 0.70, 100, 10, 1),
('E-101203', 'Hilo flexible H07Z1-K de 1.5 en marrón – Libre de halógenos', 0.70, 100, 10, 1),
('E-101202', 'Hilo flexible H07Z1-K de 1.5 en gris – Libre de halógenos', 0.70, 100, 10, 1),
('E-101205', 'Hilo flexible H07Z1-K de 1.5 mm en tierra – Libre de halógenos', 0.70, 100, 10, 1),
('E-101348', 'Cable Coaxial de TV especial Normativa ICT|NK10', 1.40, 100, 10, 1),
('E-101347', 'Cable Coaxial satélite con alma y malla de cobre | sección 0.66 mm', 1.77, 100, 10, 1),
('E-101349', 'Cable de Video Portero RG59 con alma y malla de cobre', 1.77, 100, 10, 1),
('E-101357', 'Cable de UTP categoría 6 Aumentada', 1.86, 100, 10, 1),
('E-101355', 'Cable UTP categoría 5e', 1.31, 100, 10, 1),
('E-101358', 'Cable FTP Blindado categoría 5e', 1.46, 100, 10, 1),
('E-361102', 'Rollo de 100 metros de tubo corrugado de 16 mm', 60.00, 50, 5, 2),
('E-361103', 'Rollo de 100 metros de tubo corrugado de 20 mm', 72.00, 50, 5, 2),
('E-361115', 'Rollo de 100 metros de tubo forrado corrugado de 16 mm', 92.00, 50, 5, 2),
('E-361245', 'Rollo de 50 metros de tubo de canalización rojo de doble pared de 40 mm', 172.00, 50, 5, 2),
('WE-9025', 'Interruptor magnetotérmico de 2 Polos x 16 A curva C 240-415 V', 10.65, 40, 5,3),
('WE-9000', 'Interruptor magnetotérmico de 1 Polo x 10 A curva C 240-415 V', 7.67, 40, 5,3), 
('WE-9020', 'Interruptor magnetotérmico de 2 Polos x 10 A curva C 240-415 V', 10.65, 40, 5,3), 
('E-112061', 'Protector sobretensión permanente + transitorio 40 A Trifásico | CHINT', 274.88, 40, 5, 3),
('LU-2016', 'Base de enchufe con TTL 16 A de empotrar en blanco con tripas de baklita', 5.34, 200, 30, 4),
('LU-2000', 'Interruptor de empotrar blanco con tripas de bakelita', 5.11, 200, 30, 4),
('LU-2006', 'Doble interruptor de empotrar en blanco con tripas en bakelita', 5.78, 200, 30, 4),
('LU-2018', 'Doble Base de enchufe con TTL 16ª de empotrar en blanco con tripas en bakelita', 10.00, 200, 30, 4),
('LU-2626', 'Base de Televisión intermedia de empotrar en blanco con tripas en bakelita', 15.44, 200, 30, 4),
('LU-2028', 'Base de Teléfono RJ11/6p4c de empotrar en blanco con tripas en bakelita', 7.78, 200, 30, 4),
('LU-2030', 'Base de Datos RJ45/8p8c de empotrar en blanco con tripas en bakelita', 20.00, 200, 30, 4),
('LU-1920', 'Doble base de enchufe con TTL 16A estanca IP-54', 10.00, 200, 30, 4),
('LU-1916', 'Doble conmutador estanco IP-54 de 10A', 7.36, 200, 30, 4),
('LU-1295', 'Interruptor de paso en blanco con 2 metros de cable, 1 metro antes y otro después', 7.80, 200, 30, 4),
('WE-7500', 'Barra de 2 metros de minicanal blanco de 10x10 mm', 2.52, 150, 10, 2),
('WE-7565', 'Tapa final de 60x40 mm', 3.80, 150, 10, 2),
('WE-7564', 'T recta de 60x40 mm', 5.00, 150, 10, 2),
('WE-7595', 'Barra de 2 metros de canal de suelo gris 66x17 mm', 17.90, 150, 10, 2),
('E-271142', 'Caja de empotrar de 100x100 mm con garra de clic', 4.50, 500, 100, 4),
('E-271203', 'Caja estanca IP-55 cuadrada de 80x80x40 mm con 6 conos y tornillos', 5.75, 500, 100, 4),
('CO-8597', 'Transformador electrónico de 220V a 12V de 105W', 11.25, 75, 7, 5),
('E-241501', 'Transformador para Piscina de 300W', 85.90, 75, 7, 5),
('CO-8310', 'Reactancia (Balastro) electrónica de 1x36 W | Para fluorescente lineal T8', 30.75, 50, 4, 6),
('D-241109', 'Reactancia (Balastro) electrónica de 2x36 W | Para fluorescente lineal T8', 30.75, 50, 4, 6),
('WE-9734', 'Capacitador / condensador 250 V para iluminación de 45 u-f microfaradios mF', 23.00, 65, 7, 7),
('WE-9802', 'Capacitador / condensador 450V para motor aislado de 2 uF microfaradios mF', 5.40, 65, 7, 7),
('E-221005', 'Módulo de contador de 2 ventanas | Monofásico + Reloj', 122.50, 35, 5, 8),
('E-221007', 'Módulo de contador de 2 ventanas | Trifásico + Reloj', 237.50, 35, 5, 8),
('E-221027', 'Caja Acometida CGP GL 160 A | Esquema 7-8', 212.50, 85, 8, 9),
('E-221031', 'Caja Acometida CGP GL 400 A | Esquema 7-8', 212.50, 85, 8, 9),
('TE-4200', 'Fusible industrial 500 V tipo NH-00 de 40 A', 16.50, 345, 50, 10),
('TE-4245', 'Fusible industrial 500 V tipo NH-0 de 160 A', 21.50, 345, 50, 10),
('TE-4100', 'Fusible cerámico tipo Neozed D02 de 35 A', 7.75, 345, 50, 10),
('TE-4001', 'Fusible cilíndrico 8x31 mm de tipo T00 de 6 A', 3.00, 7, 50, 10),
('TE-4300', 'Fusible de cristal de 5x20 mm de 0.5 A', 37.50, 2, 50, 10),
('WE-8130', 'Base superficie bipolar IP-44 Cetac de 2P+T 16 A', 11.00, 35, 8, 11),
('WE-8134', 'Base superficie bipolar IP-44 Cetac de 3P+T 32 A', 12.60, 35, 8, 11),
('WE-8010', 'Base aérea bipolar IP-44 Cetac de 2P+T 16 A', 15.80, 35, 8, 11),
('WE-8070', 'Base aérea bipolar IP-44 Cetac de 3P+T 32 A', 13.80, 35, 8, 11),
('WE-8000', 'Clavija aérea bipolar IP-44 Cetac de 2P+T 16 A', 7.40, 35, 8, 11),
('WE-8060', 'Clavija aérea bipolar IP-44 Cetac de 3P+T 32 A', 14.21, 35, 8, 11),
('WE-1052', 'Prolongador de 2.5 metros, 3x1,5 de sección con clavija 2P+T 16ª y base con TTL 16A', 27.50, 35, 8, 11),
('WE-1054', 'Prolongador de 2.5 metros, 3x1,5 de sección con clavija TTL 16A y base 2P+T 16A', 32.75, 35, 8, 11),
('WE-8200', 'Multiplicador de 3 tomas industrial macho 2P+T 16 A | 3 hembras 2P+T 16 A', 52.50, 35, 8, 11),
('WE-8202', 'Multiplicador de 3 tomas industrial macho 3P+T 16 A | 3 hembras 3P+T 16 A', 52.50, 35, 8, 11),
('WE-8205', 'Adaptador industrial IP-44 de schuko con TTL 16 A a clavija cetac 2P+T 16 A', 52.50, 35, 8, 11);

CREATE TABLE  provincia
( id CHAR(2) 	NOT NULL,
  nombre	VARCHAR(50) 	NOT NULL,
  CONSTRAINT PkProvincia
	PRIMARY KEY (Id),
);

INSERT INTO provincia (id, nombre) 
VALUES ('01','ALAVA'),
('02','ALBACETE'),
('03','ALICANTE'),
('04','ALMERIA'),
('05','AVILA'),
('06','BADAJOZ'),
('07','BALEARES'),
('08','BARCELONA'),
('09','BURGOS'),
('10','CACERES'),
('11','CADIZ'),
('12','CASTELLON'),
('13','CIUDAD REAL'),
('14','CORDOBA'),
('15','LA CORUÑA'),
('16','CUENCA'),
('17','GERONA'),
('18','GRANADA'),
('19','GUADALAJARA'),
('20','GUIPUZCOA'),
('21','HUELVA'),
('22','HUESCA'),
('23','JAEN'),
('24','LEON'),
('25','LERIDA'),
('26','LA RIOJA'),
('27','LUGO'),
('28','MADRID'),
('29','MALAGA'),
('30','MURCIA'),
('31','NAVARRA'),
('32','ORENSE'),
('33','ASTURIAS'),
('34','PALENCIA'),
('35','BALEARES'),
('36','PONTEVEDRA'),
('37','SALAMANCA'),
('38','STA CRUZ DE TENERIFE'),
('39','CANTABRIA'),
('40','SEGOVIA'),
('41','SEVILLA'),
('42','SORIA'),
('43','TARRAGONA'),
('44','TERUEL'),
('45','TOLEDO'),
('46','VALENCIA'),
('47','VALLADOLID'),
('48','VIZCAYA'),
('49','ZAMORA'),
('50','ZARAGOZA'),
('51','CEUTA'),
('52','MELILLA'),
('00','Extranjero');

CREATE TABLE  pueblo
( id	CHAR(5) 	NOT NULL,
  nombre	VARCHAR(50)	NOT NULL,
  idProvincia	CHAR(2)		NOT NULL,
  CONSTRAINT PkPueblo
	PRIMARY KEY (Id),
  CONSTRAINT FkProvinciaEnPueblo
	  FOREIGN KEY (idProvincia) REFERENCES provincia (Id),
 );

INSERT INTO pueblo (id, nombre, idProvincia) 
VALUES ('00021','ANON DE MONCAYO','50'),
('01651','ALGAR (EL)','03'),
('01839','ALMARCHA (LA)','16'),
('02050','ALTERO DE MOMPOY','46'),
('02814','ARAYA','12'),
('03061','ARENAL (EL)','07'),
('04033','AUZOTXIKIA','20'),
('05495','BASANOVA (LA)','12'),
('05754','BEG','02'),
('05998','BENAMAHOMA','11'),


('06362','BERROCALES DEL JARAMA (LOS)','28'),
('06571','BINIAMAR','07'),
('06579','BINISSALEM','07'),
('06905','BONRETORN','43'),
('07625','BUGARRA','46'),
('07766','BURRIANA','12'),
('07951','CAÑADA (LA)','16'),
('08751','CALA LLITERAS','07'),
('08764','CALA ROMANA','43'),
('08820','CALATAYUD','50'),


('08993','CALLUS','08'),
('09248','CAMINO DE PARACUELLOS','28'),
('10917','CARNICERA','33'),
('11024','CARRASCA (LA)','46'),
('11408','CASA GRANDE','44'),
('12060','CASILLAS (LAS)','14'),
('12309','CASTELLON','12'),
('13003','CELADA','24'),
('13541','CEUTA (CIUDAD)','51'),
('13996','CIADUEÑA','42'),


('14140','CINT (EL)','08'),
('14637','COLOMER CUADRA','25'),
('15424','CORTIJO (EL)','28'),
('15619','COSTA DE LOS PINOS','07'),
('16745','CURRELO (O)','36'),
('16926','DEHESA DE VILLANDRANDO','34'),
('17791','ENCINAS (LAS)','28'),
('17859','ENRAMONA','12'),
('20267','FORMICHE ALTO','44'),
('20295','FORNADEIROS (SAN PEDRO)','32'),


('20875','FUENDEJALON','50'),
('21104','FUENTES DE JILOCA','50'),
('21355','GALILEA','07'),
('21819','GENESTOSA','24'),
('24263','IZANA','38'),
('25630','LENTEJI','18'),
('26289','LLUCALARY','07'),
('27215','MAHAVE','26'),
('27861','MARRATXINET','07'),
('27948','MARTINEZ (LOS)','04'),


('28023','MAS D''EN ROCA','08'),
('28097','MAS DEL SECO','12'),
('28370','MATALUENGA','24'),
('28623','MECO','28'),
('29149','MIÑANA','03'),
('30586','MORERA DE MONTSANT (LA)','43'),
('30996','MUGUETA','31'),
('31195','MURUZABAL','31'),
('31289','NARANJEROS (LOS)','38'),
('31481','NAVARREDONDA DE LA RINCONADA','37'),


('31527','NAVASEQUILLA','05'),
('31982','NOVELE','46'),
('32003','NOVILLAS','50'),
('32093','NULES','12'),
('32101','NURTAL-CDA. FARANDOLA','46'),
('32112','OASIS','35'),
('32419','OLMOS (LOS)','44'),
('32457','OMAÑAS (LAS)','24'),
('32550','ORBITA','05'),
('33246','PAIPORTA','46'),


('33534','PALOS DE LA FRONTERA','21'),
('36300','PLANASSA (LA)','08'),
('37953','PUEBLA DE SAN MIGUEL','46'),
('38168','PUERTO (EL)','07'),
('38576','QUESADA','23'),
('39063','RAIGUERO (EL)','03'),
('39486','REBON','15'),
('40066','RENTERIA','20'),
('40332','RIAHUELAS','40'),
('41550','ROSAMIANA','33'),


('42277','SALINAS (LAS)','19'),
('42366','SALTO DE TORREJON','10'),
('42567','SAN ANTONIO DE PORMANY','07'),
('43446','SAN SALVADOR','39'),
('45004','SAX','03'),
('46278','SOMOSAGUAS (CENTRO)','28'),
('46302','SON DEL PUERTO','44'),
('46305','SON FERRER','07'),
('46332','SONEJA','12'),
('46876','TABLADA DE VILLADIEGO','09'),


('47218','TARTANEDO','19'),
('47731','TIURANA','25'),
('47881','TOMILLERAS (LAS)','28'),
('47974','TORIL','44'),
('48037','TORO (EL)','12'),
('48192','TORRE-BELTRAN','12'),
('48367','TORREQUINTO','41'),
('49180','TURIS','46'),
('49866','VALDEARENAS','19'),
('50500','VALLS DE TORRUELLA','08'),


('50646','VARA DE REY','16'),
('53027','VILLAMARTIN','11'),
('53596','VILLARREAL','12'),
('53608','VILLARROAÑE','24');

CREATE TABLE  cliente
( id	INT IDENTITY	NOT NULL,
  nombre	VARCHAR(50)	NOT NULL,
  direccion	VARCHAR(100) 	NOT NULL,
  cP		CHAR(5) DEFAULT 'DESCO' NOT NULL,
  idPueblo	CHAR(5) 	NOT NULL,
  eCorreo VARCHAR(100) NOT NULL,
  pwd VARCHAR(255) NOT NULL,
  CONSTRAINT PkCliente
	PRIMARY KEY (id),
  CONSTRAINT FkPuebloEnCliente
	FOREIGN KEY (IdPueblo) REFERENCES pueblo (id),
  CONSTRAINT UeCorreoCliente
    UNIQUE (eCorreo),
);

begin tran
INSERT INTO cliente (Nombre, Direccion, Cp, IdPueblo, eCorreo, pwd) 
VALUES ('BARRACHINA BUESO, LUIS JORGE','CLAPISA, 58','39137','43446', 'luibar@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('EGEA HERNANDEZ, CARLOS ANTONIO','PASAJE PEQAGOLOSA, 108','37812','31481', 'carege@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('BLASCO ESCUREDO, CESAR LUIS','ALFONDEGUILLA, 127','44953','20267', 'cesbla@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('GARCIA GIRONA, MANUEL','BARON DE CARCER, 88-8','05933','31527', 'mangar@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('VIDAGANY GISBERT, ADOLFO','JOVER, 82-3','33227','10917', 'adovid@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('HERRERO ORENGA, FRANCISCO TEO','AVENIDA CAPUCHINOS, 149','35476','32112', 'fraher@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('VIVES GOZALBO, INMACULADA','DE BAIX, 123','50769','21104', 'inmviv@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('CASTELLO DAMBORENEA, ENRIQUE JAVIER','GRUPO SAN VICENTE, 138-11','12257','46332', 'enrcas@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('VIDAL VILARROYA, VICENTE','CALLE AMALIO GIMENO, 139-1','04540','27948', 'vicvid@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('MORA RUBERT, FRANCISCO','VIRGEN DE LOS DOLORES, 128-7','24228','21819', 'framor@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),


 ('PALANCO MARTINEZ, CARLOS','MAESTRO SANCHIS, 28','19599','42277', 'carpal@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('CUCO NAVARRO, JAVIER SERGIO','PALANQUES, 164','44219','47974', 'javcuc@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('SERRANO MUNYOZ, ENRIQUE FERNANDO','CORTS VALENCIANES, 128-13','19130','47218', 'enrser@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('CHINE BARRACHINA, JOSE MANUEL','MEDICO NEBOT, 23','42293','13996', 'joschi@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('LOPEZ DOBON, VICENTE RAMON','GASSET, 81-14','08288','36300', 'viclop@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('SIMO MARTINEZ, RAMON','ALIAGA, 118-3','11745','05998', 'ramsim@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('SALES LOPEZ, MIQUEL','CARRER TELLOLA, 124','21560','33534', 'miqsal@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('GUAL SALES, MARIA','FELIPE II, 49','03707','39063', 'margua@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('FUENTES RIVERA, JOSE','CURA PLEBAN, 25-14','10674','42366', 'josfue@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('LOPEZ SANMIGUEL, CARLOS','URBANIZACION EL BALCO, 142-13','28241','06362', 'carlop@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),


 ('ANDRES GARGALLO, DIEGO JAVIER','SANTA CRUZ, 18','24432','53608', 'dieand@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('EGEA HUEDO, VICENTE CARLOS','SAN PASQUAL, 50','28193','46278', 'vicege@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('REINA VIDAL, LLUIS','CALLE BARTOLOME REUS, 11','24593','32457', 'llurei@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('BUESO ORDONYEZ, JUAN MANUEL','CALLE LA PUNTA, 46','05359','32550', 'juabue@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('ALOS CONESA, SABINA','PINTOR VERGARA, 102-2','02536','05754', 'sabalo@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('RODRIGUEZ HERNANDEZ, CESAR','GENERAL MARTINEZ CAMPOS, 119','07340','26289', 'cesrod@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('RODRIGUEZ ALOS, JORDI SABINA','EL PLA, 100-8','12042','02814', 'jorrod@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('LLEO GUAITA, MARCOS','CAMINO DONACION, 144-3','07604','06571', 'marlle@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('MATEU MARTI, MARIA DOLORES','CALLE PADRE LUIS MADRE LLOP, 30','03607','29149', 'marmat@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('CABALLERO GALLEGO, ANTONIO','CAMINO DE ONDA, 51','33807','41550', 'antcab@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),


 ('CARRETERO PAVIA, FRANCISCO CARLOS','PLAZA DE LA FONT, 105','43163','06905', 'fracar@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('FABUEL CEPRIA, RAFAEL DAVID','AVENIDA ESPRONCEDA, 116-15','50084','20875', 'raffab@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('NEBOT VITAL, SERGIO MOISES','LUIS MADRE LLOP, 4-19','07119','06579', 'serneb@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('CASAS ROMERO, CARLOS JOSE','GENERAL ARANDA, 180-3','43292','30586', 'carcas@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('LLEO SORIANO, JOSE IGNACIO','AVENIDA DE LAS CONCHAS, 191','25057','47731', 'joslle@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('SERRET JOVER, JOSE','ENMEDIO, 110','07339','08751', 'josser@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('MARIN RAMIREZ, SERGIO VICENTE','FERNANDO EL CATOLICO, 6','07350','03061', 'sermar@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('VERA GOMEZ, VICTOR','ORFEBRES SANTALINEA, 124-14','51965','13541', 'vicver@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('DOMENECH FLORES, RAMON','GENERAL MARTINEZ CAMPOS, 172-7','07541','46305', 'ramdom@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('BELTRAN MENEU, CRISTINA','GABRIEL SOLE, 10-6','46186','31982', 'cribel@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),


 ('CEPRIA AGOST, FERNANDO LUIS','ERMITA, 75','07284','21355', 'fercep@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('MEDRANO FELIS, FERNANDO','SALVADO BARRI, 141','46454','49180', 'fermed@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('DAMBORENEA VALLS, DIEGO RAFAEL','AVENIDA ALMASSORA, 51','03008','01651', 'diedam@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('CASTELLANOS ANDRES, JULIO','CONDE PESTAGUA, 43-4','08681','08993', 'julcas@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('RAMON LEON, JULIAN','BENITANDUS, 183-15','14197','12060', 'julram@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('PERIS VIVES, MANUEL','LUIS CENDOYA, 124','09168','46876', 'manper@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('ROBRES FRANCO, VICENTE IGNACIO','VALL DE UXO, 179','07771','27861', 'vicrob@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('BARBERO VALANZUELA, IGNACIO JAIME','GENERAL MARTINEZ CAMPOS, 5','24913','13003', 'ignbar@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('FIBLA ROMERO, EMILIO','PLAZA SANTA CLARA, 64-8','28406','17791', 'emifib@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('BURRIEL SANCHEZ, JOSE','COS DE GRACIA, 196-10','28460','09248', 'josbur@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),


 ('SIMO GONZALEZ, NOEMI','DOCTOR SANCHIS BERGON, 148','26707','27215', 'noesim@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('FERNANDEZ VENDRELL, DAVID JUAN','POETA DURAN Y TORTAJADA, 29','28563','47881', 'davfer@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('ROMERO AGUILELLA, SERGIO','SAN ABDON, 15-14','43748','08764', 'serrom@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('FORTUNYO GRANGEL, JOSE','PIEDAD, 148','08408','28023', 'josfor@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('CUBEDO ANICETO, JAVIER RUBEN','ALBUFERA, 43','08602','14140', 'javcub@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('CEPRIA LORENTE, CARLOS MIGUEL','VINAROZ, 137','12974','05495', 'carcep@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('GALLEN MOLINER, JORGE TEO','RIO ESCALONA, 132-3','16555','50646', 'jorgal@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('TORRES PEREZ, ANTONIO','MARIA VICTORIA, 117-5','36848','16745', 'martor@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('AMO MONTSN, RAMON FERNANDO','CALLE BENICARLO, 42','46332','32101', 'ramamo@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('ADELL VILLALONGA, LUIS JOSE','MANUEL BECERRA, 61','12712','28097', 'luiade@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),


 ('FONSECA ALMELA, JOSE','PLAZA SANT JOAN, 81','38572','24263', 'josfon@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('HERRERO BERENGUER, IRENE','CALLE SAN ISIDRO, 118','11334','53027', 'ireher@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('MONSONIS SALA, FABRICIANO','CARMADAY, 116','25683','14637', 'mabmon@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('GALLEN IZQUIERDO, EMILIO','PLAZA BORRULL, 72','41924','48367', 'emigal@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('GARCMA LIZONDO, CARLOS FRANCISCO','BENEDITO, 124-14','31157','30996', 'cargar@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('SANMIGUEL CORET, FERNANDO JOSE','CORDON, 182','50725','08820', 'fersan@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('MORA RIBES, ENRIQUE MIGUEL','CALLE BENASAL, 146-14','46367','11024', 'enrmor@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('BERGES REGODON, JUAN','FARIGOLA, 80','20399','04033', 'farber@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('BETORET ABRIL, FRANCISCO','ALCANAR, 169-11','20052','40066', 'frabet@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('FABUEL CEBRIA, FERNANDO ADRIAN','CALLE CISCAR, 49-20','18288','25630', 'ferfab@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),


 ('BELTRAN MUNYOZ, JAIME VICENTE','DEL ANGEL, 79-2','46390','02050', 'jaibel@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('NAVARRO GARGALLO, CARLOS','PEDRO ALCAZAR, 72-6','46470','37953', 'carnav@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('DAMBORENEA CORBATO, ALICIA','CALLE MADRID, 83','12425','17859', 'alidam@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('CANCELAS MORA, MARIA','PINTOR ZARIQENA, 117-4','46501','07625', 'marcan@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('RIOS MARTINEZ, LUIS ABEL','MEDICO MIGUEL GIMENO, 44','40742','40332', 'luirio@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('MIRAVET SALA, MARIA MERCEDES','URBANIZACION EL BALCO, 84-11','DESCO','53596', 'marvir@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('SAMPEDRO SIMO, MARIA MERCEDES','FINELLO, 161','12217','07766', 'marsam@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('GISBERT MIRALLES, BEATRIZ LAURA','CALLE ASUNCION FRANCH, 79','12111','12309', 'beagis@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('DE LA CRUZ AZNAR, CONCHITA PATRICIA','GRUPO ZAFER, 55','12868','53596', 'concru@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('VILLALONGA SANCHIS, MILAGROS','RONDA ESCALANTE, 71-11','DESCO','53596', 'milvil@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),


 ('PITARCH MONSONIS, MARIA CARMEN','SALVADOR, 136','12708','12309', 'marpit@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('GARCIA CASADO, YOLANDA','CONCEPCION ARENAL, 18-14','12914','53596', 'yolgar@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('ADELL GALMES, MERCEDES ROSARIO','MAJOR POBLENOV, 18','12597','53596', 'merade@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('HERRERA SALA, ANA','FOIA DE BUNYOL, 15','12162','32093', 'anager@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('MARTI GALVAN, ALICIA','EL BARRANQUET, 117','44144','11408', 'alimar@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('MARTI MOLTO, CONCHITA','SAN ABDON, 152','DESCO','53596', 'conmar@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('SOS CARRETERO, JESUS','MOSEN COMPTE, 14','12964','53596', 'jessos@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('MIGUEL ARCHILES, OSCAR RAMON','HISANT BERNARDO MUNDINA, 132-5','12652','07766', 'oscmig@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('CHALER SORIANO, MANUEL DIEGO','SAN ROBERTO, 27','DESCO','53596', 'mancha@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('PINEL HUERTA, VICENTE','FRANCISCO SEMPERE, 37-10','12112','07766', 'vicpin@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),


 ('LOPEZ BOTELLA, MAURO','AVENIDA DEL PUERTO, 20-1','12439','12309', 'maulop@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('PALAU MARTINEZ, JORGE','RAVAL DE SANT JOSEP, 97-2','12401','12309', 'jorpau@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('RINCON VERNIA, DAVID','BORRIOL, 74','DESCO','12309', 'davrin@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('MURIA VINAIZA, JOSE','CIUDADELA, 90-18','12990','12309', 'josmur@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('HUGUET PERIS, JUAN ANGEL','CALLE MESTRE RODRIGI, 7','12930','12309', 'juahug@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('TICHELL MONLLEO, MARIA ANGELES','CORAZON DE JESUS, 171','46426','33246', 'martic@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('FABREGA GARGORI, JAVIER SEBASTIAN','SANTA GEMA GALGANI, 130','12939','32093', 'javfab@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('VILLALONGA RAMIREZ, DIEGO SERGIO','CALLE BARTOLOME REUS, 98-7','12332','32093', 'dievil@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('BADENES CEPRIA, ANDRES RICARDO','MAESTRO CABALLEROS, 30-4','12397','12309', 'andbad@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('BOTELLA CATALA, JUAN','MONCADA, 70','12572','07766', 'monbot@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),


 ('LOPEZ LLORENS, SANCHEZ MARCOS','CALLE DOLORS, 6','12967','53596', 'sanlop@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('LOPEZ RINCON, LUIS MIGUEL','PADRE MELIA, 49','DESCO','07766', 'luilop@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('GUIMERA AGOST, LUIS','PADRE PEDRO VELASCO, 89','12423','53596', 'luigui@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('GUILLOT BELDA, FRANCISCO JOSE','PLAZA MAYOR, 200','12059','12309', 'frangui@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('LOPEZ GUITART, XAVIER','CALLE PUIG RODA, 162','DESCO','07766', 'xavlop@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('TUR MARTIN, MANUEL FRANCISCO','CALLE PEDRO VIRUELA, 108-8','12008','07766', 'mantur@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('GARCIA MARTI, MONICA','AVENIDA CAMPANAR, 171-1','44163','46302', 'mongar@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('AZNAR MONFERRER, ADRIAN','EBANISANTA HERVAS, 138','DESCO','32093', 'adrazn@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('CUBEDO FIBLA, MILAGROS','MAESTRO MARTI, 69','34476','16926', 'maecub@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('GALLEN GOZALBO, PATRICIA','CONSTITUCIO, 115-15','23911','38576', 'patgal@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),


 ('LUIS MARIN, MARIA','CALLE COSANTA Y BORRAS, 34-11','16186','01839', 'marlui@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('SABORIT DOMENECH, ELENA','FERRANDIS SALVADOR PALMERAS, 124-6','07101','15619', 'elesab@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('FUENTES VILLALONGA, MARIA','MEDITERRANEO, 91','07521','38168', 'marfue@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('ORENGA CUCO, MARIA PILAR','POETA VERDAGUER, 189','50044','32003', 'marore@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('FOLCH CASABO, MARIA MERCEDES','SANT RAFAEL, 158-17','38894','31289', 'marfol@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('MIRALLES OGAYA, ANA','GENERAL ARANDA, 95-1','31955','31195', 'anamir@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('AMO ZAMBRANA, SUSANA','PINTOR RIBALTA, 131','15425','39486', 'susamo@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('VIVES TORRES, LAURA','CARMEN, 114','16860','07951', 'lauviv@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('GALLEN HUERTA, OLGA','RICARDO CARRERAS, 75','12094','48192', 'olggal@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('NAVARRO BARBERO, MARIA LLEDO','BURRIANA, 19-15','12406','48037', 'marnav@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),


 ('CASTELL VIVES, MARIA','CASTELLDEFELS, 102-10','28192','15424', 'marcas@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('IGLESIAS NAVARRO, IGNACIO','ESCULTOR VICIANA, 30-15','03615','45004', 'ignigl@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('DURAN VICENTE, DIEGO','PLAZA SANTA ANA, 46','19793','49866', 'diedur@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('MARTINEZ FORNER, JOSE','SAN MARCOS, 176-10','32364','20295', 'josmar@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('ATIENZA CASADO, RAMON FRANCISCO','FALCO, 60-17','07061','42567', 'ramati@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('FERNANDEZ MARTIN, CRISTINA','URBANIZACION LAS PALMAS, 1-5','08738','50500', 'crifer@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('RIPOLLES VILLALONGA, JUAN RAUL','CALLE DOCTOR FLEMING, 189-18','28388','28623', 'juarip@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('LOPEZ VICENS, MANUEL VICTOR','PLAZA ESCULTOR ADSUARA, 173-5','50934','00021', 'manlop@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('GARZON CALVO, GABRIEL','MAESTRO MARTI, 152-15','24485','28370', 'gabgar@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.'),
 ('CATALA REVERTE, GUILLERMO JOSE','ESPERANZA, 198-6','44335','32419', 'guicat@gemeil.com', '$2y$10$hCqxiNsDDKr3JeAV3KuDV.1CvSHdOhwwbcuOEF95P2SlwpqyU63V.');

 commit;

CREATE TABLE pedido (
    idPedido INT IDENTITY NOT NULL,
    idCliente INT NOT NULL,
    fPedido DATE NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PkPedido PRIMARY KEY (idPedido),
    CONSTRAINT FkClienteNPedido FOREIGN KEY (idCliente) REFERENCES cliente (id)
);


CREATE TABLE factura (
    idFactura INT IDENTITY NOT NULL,
    idPedido INT NOT NULL,
    eCorreo VARCHAR(100) NOT NULL,
    fFactura DATE NOT NULL,
    total MONEY NOT NULL,
    CONSTRAINT PK_factura PRIMARY KEY (idFactura),
    CONSTRAINT FK_idPedido_factura FOREIGN KEY (idPedido) REFERENCES pedido (idPedido),
    CONSTRAINT FK_eCorreo_factura FOREIGN KEY (eCorreo) REFERENCES cliente (eCorreo)
);

CREATE TABLE lineaPedido (
    idPedido INT NOT NULL,
    codArticulo VARCHAR(10) NOT NULL,
    cantidad INT NOT NULL,
    pv MONEY NOT NULL,
    CONSTRAINT PK_lineaPedido PRIMARY KEY (idPedido, codArticulo),
    CONSTRAINT FK_IdPedido FOREIGN KEY (idPedido) REFERENCES pedido (idPedido),
    CONSTRAINT FkArticuloNPedido FOREIGN KEY (codArticulo) REFERENCES articulo (codigo)
);

CREATE TABLE lineaFactura (
    idFactura INT NOT NULL,
    codigoArticulo VARCHAR(10) NOT NULL,
    cantidad INT NOT NULL,
    pc MONEY NOT NULL,
    CONSTRAINT PK_lineaFactura PRIMARY KEY (idFactura, codigoArticulo),
    CONSTRAINT FK_idFactura_lineaFactura FOREIGN KEY (idFactura) REFERENCES factura (idFactura),
    CONSTRAINT FK_codigoArticulo_lineaFactura FOREIGN KEY (codigoArticulo) REFERENCES articulo (codigo)
);
