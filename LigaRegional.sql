DROP TABLE partidos cascade constraints;

DROP TABLE jugadores cascade constraints;

DROP TABLE entrenadores cascade constraints;

DROP TABLE equipos cascade constraints;

DROP TABLE juegan cascade constraints;

CREATE TABLE entrenadores (
    dni_entrenador        VARCHAR2(9) NOT NULL,
    apellidos_entrenador  VARCHAR2(25),
    nombre_entrenador     VARCHAR2(15),
    cuidad_entrenador     VARCHAR2(15),
    edad_entrenador       NUMBER
);

ALTER TABLE entrenadores ADD CONSTRAINT entrenadores_pk PRIMARY KEY ( dni_entrenador );

CREATE TABLE equipos (
    cod_equipo                   NUMBER NOT NULL,
    nombre_equipo                VARCHAR2(15),
    num_jugadores                NUMBER,
    dni_entrenador               VARCHAR2(9) NOT NULL
);

CREATE UNIQUE INDEX equipos__idx ON
    equipos (
        dni_entrenador
    ASC );

ALTER TABLE equipos ADD CONSTRAINT equipos_pk PRIMARY KEY ( cod_equipo );


CREATE TABLE juegan (
    cod_equipo           NUMBER NOT NULL,
    cod_partido         NUMBER NOT NULL,
    codigo_tablaJuegan NUMBER NOT NULL
);

ALTER TABLE juegan
    ADD CONSTRAINT hay_pk PRIMARY KEY ( cod_partido,
                                        codigo_tablaJuegan);

CREATE TABLE jugadores (
    dni_jugador         VARCHAR2(9) NOT NULL,
    apellidos_jugador   VARCHAR2(25) NOT NULL,
    nombre_jugador      VARCHAR2(15)NOT NULL,
    numero_jugador      NUMBER NOT NULL,
    edad_jugador        NUMBER NOT NULL,
    ciudad_jugador      VARCHAR2(15) NOT NULL,
    cod_equipo  NUMBER NOT NULL
    
);

ALTER TABLE jugadores ADD CONSTRAINT jugadores_pk PRIMARY KEY ( dni_jugador );

CREATE TABLE partidos (
    cod_partido          NUMBER NOT NULL,
    lugar                VARCHAR2(15),
    fecha                DATE,
    cod_equipo   NUMBER
);

ALTER TABLE partidos ADD CONSTRAINT partidos_pk PRIMARY KEY ( cod_partido );

ALTER TABLE equipos
    ADD CONSTRAINT equipos_entrenadores_fk FOREIGN KEY ( dni_entrenador )
        REFERENCES entrenadores ( dni_entrenador );

--ALTER TABLE juegan
--    ADD CONSTRAINT hay_equipos_fk FOREIGN KEY ( cod_equipo )
   --     REFERENCES equipos ( cod_equipo );

ALTER TABLE juegan
    ADD CONSTRAINT hay_partidos_fk FOREIGN KEY ( cod_partido )
        REFERENCES partidos ( cod_partido );

ALTER TABLE juegan
    ADD CONSTRAINT juegan_equipos_fk FOREIGN KEY ( cod_equipo )
        REFERENCES equipos ( cod_equipo );

ALTER TABLE jugadores
    ADD CONSTRAINT jugadores_equipos_fk FOREIGN KEY ( cod_equipo )
        REFERENCES equipos ( cod_equipo );


REM *** INSERCION DE DATOS ***
REM juegan
--INSERT INTO juegan VALUES



REM entrenadores

INSERT INTO entrenadores VALUES('12345678R','CARVHALO', 'EDDY','CARAVACA',45);
INSERT INTO entrenadores VALUES('23456789A','VIERA', 'RAUL','MURCIA',33);
INSERT INTO entrenadores VALUES('98765432D','ALEGRE', 'JULIAN','CARTAGENA',54);
INSERT INTO entrenadores VALUES('87482974L','VELEZ', 'JESICA','MULA',41);
COMMIT;

REM equipos


INSERT INTO equipos VALUES(10,'CV-CARAVACA',8,'12345678R');
INSERT INTO equipos VALUES(12,'CV-MURCIA',6,'23456789A');
INSERT INTO equipos VALUES(32,'CV-CARTAGENA',7,'98765432D');
INSERT INTO equipos VALUES(21,'CV-MULA',6,'87482974L');
COMMIT;

REM jugadores

INSERT INTO jugadores VALUES('8563563L','COBOS','SANTIAGO',14,19,'CARAVACA',10);
INSERT INTO jugadores VALUES('86552498F','LABORDA','ANTONIO',1,24,'CARAVACA',10);
INSERT INTO jugadores VALUES('16573597D','LABORDA','SIMON',3,25,'CARAVACA',10);
INSERT INTO jugadores VALUES('96587954F','BEIRO','JOSE',5,19,'MURCIA',10);
INSERT INTO jugadores VALUES('87587201S','LOPEZ','JAVIER',11,18,'CARAVACA',10);
INSERT INTO jugadores VALUES('98763254A','ARIAS','SEVERIANO',10,17,'CARAVACA',10);
INSERT INTO jugadores VALUES('79864532D','PERNI','AGUSTIN',6,26,'CARAVACA',10);
INSERT INTO jugadores VALUES('18994896J','MIRAS','BLADIMIR',66,31,'MORATALLA',10);

INSERT INTO jugadores VALUES('61386700E','OROZCO','SAIOA',1,18,'MURCIA',12);
INSERT INTO jugadores VALUES('54735616D','HIDALGO','ELIAS',2,31,'MURCIA',12);
INSERT INTO jugadores VALUES('64326831V','ZAMORANO','MARTIN',4,18,'MURCIA',12);
INSERT INTO jugadores VALUES('06667233Q','ROSELLO','RAFA',5,25,'MURCIA',12);
INSERT INTO jugadores VALUES('66504172V','VALERA','EULOGIO',10,26,'MURCIA',12);
INSERT INTO jugadores VALUES('71806116R','LUJAN','JOEL',8,21,'MURCIA',12);
INSERT INTO jugadores VALUES('07706022X','FERNANDEZ','ANTONIO',14,18,'MURCIA',12);

INSERT INTO jugadores VALUES('92959553Q','SANTOS','GAIZKA',2,30,'PORTMAN',32);
INSERT INTO jugadores VALUES('62172127E','AFONSO','ANTONIO',3,17,'CARTAGENA',32);
INSERT INTO jugadores VALUES('86304631Y','LEAL','JORGE',5,31,'CARTAGENA',32);
INSERT INTO jugadores VALUES('61992582S','BOLAÑOS','EDUARDO',12,27,'CARTAGENA',32);
INSERT INTO jugadores VALUES('32791424W','ARELLANO','RAYAN',31,26,'CARTAGENA',32);
INSERT INTO jugadores VALUES('20597680F','ZABALA','EMILIO',1,19,'CARTAGENA',32);
INSERT INTO jugadores VALUES('93918527M','VENTURA','IGNASI',6,40,'CARTAGENA',32);
INSERT INTO jugadores VALUES('40243686B','GRAU','HANANE',11,20,'CARTAGENA',32);

INSERT INTO jugadores VALUES('32400454D','LARA','JUAN',6,19,'MULA',21);
INSERT INTO jugadores VALUES('71491053S','GASPAR','SANTIAGO',18,31,'MULA',21);
INSERT INTO jugadores VALUES('71701044Q','OCHOA','ROBERTO',11,21,'MULA',21);
INSERT INTO jugadores VALUES('70061387Y','MARQUEZ','TEOFILO',16,24,'MULA',21);
INSERT INTO jugadores VALUES('94579646N','PONS ENEKO','HANANE',1,23,'MULA',21);
INSERT INTO jugadores VALUES('63699715L','ROLDAN','LEONARDO',2,34,'MULA',21);
COMMIT;


REM partidos
--12 murcia
--10 caravaca
--32 cartagena
--21 mula

ALTER SESSION SET NLS_DATE_FORMAT='DD/MM/YYYY';

INSERT INTO partidos VALUES(1,'MURCIA',TO_DATE('04/09/2021'),NULL);
INSERT INTO partidos VALUES(2,'MULA',TO_DATE('11/09/2021'),NULL);
INSERT INTO partidos VALUES(3,'CARAVACA',TO_DATE('18/09/2021'),nULL);
INSERT INTO partidos VALUES(4,'CARTAGENA',TO_DATE('25/09/2021'),NULL);
INSERT INTO partidos VALUES(5,'CARAVACA',TO_DATE('02/10/2021'),NULL);
INSERT INTO partidos VALUES(6,'MURCIA',TO_DATE('09/10/2021'),NULL);
INSERT INTO partidos VALUES(7,'CARTAGENA',TO_DATE('16/10/2021'),NULL);
INSERT INTO partidos VALUES(8,'MULA',TO_DATE('23/10/2021'),NULL);
INSERT INTO partidos VALUES(9,'CARTAGENA',TO_DATE('30/09/2021'),NULL);
INSERT INTO partidos VALUES(10,'MURCIA',TO_DATE('06/10/2021'),NULL);
INSERT INTO partidos VALUES(11,'CARAVACA',TO_DATE('13/09/2021'),NULL);
INSERT INTO partidos VALUES(12,'MULA',TO_DATE('20/10/2021'),NULL);
COMMIT;

REM juegan
--12 murcia
--10 caravaca
--32 cartagena
--21 mula
INSERT INTO juegan VALUES(12,1,12);
INSERT INTO juegan VALUES(10,1,2);

INSERT INTO juegan VALUES(21,2,3);
INSERT INTO juegan VALUES(12,2,4);

INSERT INTO juegan VALUES(10,3,5);
INSERT INTO juegan VALUES(12,3,6);


INSERT INTO juegan VALUES(32,4,7);
INSERT INTO juegan VALUES(21,4,8);

INSERT INTO juegan VALUES(10,5,9);
INSERT INTO juegan VALUES(21,5,10);

INSERT INTO juegan VALUES(12,6,11);
INSERT INTO juegan VALUES(21,6,12);

INSERT INTO juegan VALUES(32,7,13);
INSERT INTO juegan VALUES(10,7,14);

INSERT INTO juegan VALUES(21,8,15);
INSERT INTO juegan VALUES(32,8,16);

INSERT INTO juegan VALUES(32,9,17);
INSERT INTO juegan VALUES(12,9,18);


INSERT INTO juegan VALUES(12,10,19);
INSERT INTO juegan VALUES(32,10,20);


INSERT INTO juegan VALUES(10,11,21);
INSERT INTO juegan VALUES(32,11,22);

INSERT INTO juegan VALUES(21,12,23);
INSERT INTO juegan VALUES(10,12,24);

COMMIT;