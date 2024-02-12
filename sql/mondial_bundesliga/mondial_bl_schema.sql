CREATE USER MONDIALUSER WITH PASSWORD 'admin';
DROP DATABASE IF EXISTS bundesliga;
CREATE DATABASE bundesliga
   ENCODING = 'UTF8'
   LC_COLLATE = 'en_US.utf8'
   LC_CTYPE = 'en_US.utf8'
   TABLESPACE = pg_default
   OWNER = MONDIALUSER;
GRANT ALL PRIVILEGES ON DATABASE bundesliga TO mondial;
\c bundesliga
CREATE TABLE Liga
(
    Liga_Nr              integer      NOT NULL,
    Verband              varchar(255) NOT NULL,
    Erstaustragung       date         NOT NULL,
    Meister              integer      DEFAULT NULL,
    Rekordspieler        varchar(255) DEFAULT NULL,
    Spiele_Rekordspieler integer      DEFAULT NULL,
    CONSTRAINT "Liga_pk" PRIMARY KEY (Liga_Nr)
);
CREATE TABLE Spiel
(
    Spiel_ID  integer NOT NULL,
    Spieltag  integer DEFAULT NULL,
    Datum     date    DEFAULT NULL,
    Uhrzeit   time    DEFAULT NULL,
    Heim      integer NOT NULL,
    Gast      integer NOT NULL,
    Tore_Heim integer DEFAULT NULL,
    Tore_Gast integer DEFAULT NULL,
    CONSTRAINT "Spiel_pk" PRIMARY KEY (Spiel_ID)
);
CREATE TABLE Spieler
(
    Spieler_ID   integer      NOT NULL,
    Vereins_ID   integer      NOT NULL,
    Trikot_Nr    integer      DEFAULT NULL,
    Spieler_Name varchar(255) NOT NULL,
    Land         varchar(255) DEFAULT NULL,
    Spiele       integer      DEFAULT NULL,
    Tore         integer      DEFAULT NULL,
    Vorlagen     integer      DEFAULT NULL,
    CONSTRAINT "Spieler_pk" PRIMARY KEY (Spieler_ID)
);
CREATE TABLE Verein
(
    V_ID integer      NOT NULL,
    Name varchar(255) NOT NULL,
    Liga integer DEFAULT NULL,
    CONSTRAINT "Verein_pk" PRIMARY KEY (V_ID)
);