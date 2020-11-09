#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$NXTGENMONDIAL_DB_USERNAME" --dbname "nxtgenmondialdb" <<-EOSQL

EOSQL

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "mondialdb" <<-EOSQL
    CREATE TABLE Country
(Name VARCHAR(35) NOT NULL UNIQUE,
 Code VARCHAR(4),
 Capital VARCHAR(35),
 Province VARCHAR(35),
 Area DOUBLE PRECISION,
 Population INT,
 CONSTRAINT CountryKey PRIMARY KEY(Code),
 CONSTRAINT CountryArea CHECK (Area >= 0),
 CONSTRAINT CountryPop CHECK (Population >= 0));

CREATE TABLE City
(Name VARCHAR(35),
 Country VARCHAR(4),
 Province VARCHAR(35),
 Population INT,
 Longitude DOUBLE PRECISION,
 Latitude DOUBLE PRECISION,
 CONSTRAINT CityKey PRIMARY KEY (Name, Country, Province),
 CONSTRAINT CityPop CHECK (Population >= 0),
 CONSTRAINT CityLon CHECK ((Longitude >= -180) AND (Longitude <= 180)),
 CONSTRAINT CityLat CHECK ((Latitude >= -90) AND (Latitude <= 90)));

CREATE TABLE Province
(Name VARCHAR(35) NOT NULL,
 Country VARCHAR(4) NOT NULL ,
 Population INT,
 Area DOUBLE PRECISION,
 Capital VARCHAR(35),
 CapProv VARCHAR(35),
 CONSTRAINT PrKey PRIMARY KEY (Name, Country),
 CONSTRAINT PrPop CHECK (Population >= 0),
 CONSTRAINT PrAr CHECK (Area >= 0));

CREATE TABLE Economy
(Country VARCHAR(4),
 GDP DOUBLE PRECISION,
 Agriculture DOUBLE PRECISION,
 Service DOUBLE PRECISION,
 Industry DOUBLE PRECISION,
 Inflation DOUBLE PRECISION,
 CONSTRAINT EconomyKey PRIMARY KEY(Country),
 CONSTRAINT EconomyGDP CHECK (GDP >= 0));

CREATE TABLE Population
(Country VARCHAR(4),
 Population_Growth DOUBLE PRECISION,
 Infant_Mortality DOUBLE PRECISION,
 CONSTRAINT PopKey PRIMARY KEY(Country));

CREATE TABLE Politics
(Country VARCHAR(4),
 Independence DATE,
 Dependent  VARCHAR(4),
 Government VARCHAR(120),
 CONSTRAINT PoliticsKey PRIMARY KEY(Country));

CREATE TABLE Language
(Country VARCHAR(4),
 Name VARCHAR(50),
 Percentage DOUBLE PRECISION,
 CONSTRAINT LanguageKey PRIMARY KEY (Name, Country),
 CONSTRAINT LanguagePercent
   CHECK ((Percentage > 0) AND (Percentage <= 100)));

CREATE TABLE Religion
(Country VARCHAR(4),
 Name VARCHAR(50),
 Percentage DOUBLE PRECISION,
 CONSTRAINT ReligionKey PRIMARY KEY (Name, Country),
 CONSTRAINT ReligionPercent
   CHECK ((Percentage > 0) AND (Percentage <= 100)));

CREATE TABLE EthnicGroup
(Country VARCHAR(4),
 Name VARCHAR(50),
 Percentage DOUBLE PRECISION,
 CONSTRAINT EthnicKey PRIMARY KEY (Name, Country),
 CONSTRAINT EthnicPercent
   CHECK ((Percentage > 0) AND (Percentage <= 100)));

CREATE TABLE Continent
(Name VARCHAR(20),
 Area DOUBLE PRECISION,
 CONSTRAINT ContinentKey PRIMARY KEY(Name));

CREATE TABLE borders
(Country1 VARCHAR(4),
 Country2 VARCHAR(4),
 Length DOUBLE PRECISION,
 CONSTRAINT borders_length CHECK (Length > 0),
 CONSTRAINT BorderKey PRIMARY KEY (Country1,Country2));

CREATE TABLE encompasses
(Country VARCHAR(4) NOT NULL,
 Continent VARCHAR(20) NOT NULL,
 Percentage DOUBLE PRECISION,
 CONSTRAINT encompasses_percentage CHECK ((Percentage > 0) AND (Percentage <= 100)),
 CONSTRAINT EncompassesKey PRIMARY KEY (Country,Continent));

CREATE TABLE Organization
(Abbreviation VARCHAR(12) PRIMARY KEY,
 Name VARCHAR(80) NOT NULL,
 City VARCHAR(35) ,
 Country VARCHAR(4) ,
 Province VARCHAR(35) ,
 Established DATE,
 CONSTRAINT OrgNameUnique UNIQUE (Name));

CREATE TABLE isMember
(Country VARCHAR(4),
 Organization VARCHAR(12),
 Type VARCHAR(35) DEFAULT 'member',
 CONSTRAINT MemberKey PRIMARY KEY (Country,Organization) );


CREATE TABLE Mountain
(Name VARCHAR(35),
 Mountains VARCHAR(35),
 Height DOUBLE PRECISION,
 Type VARCHAR(10),
 Longitude DOUBLE PRECISION,
 Latitude DOUBLE PRECISION,
 CONSTRAINT MountainKey PRIMARY KEY(Name),
 CONSTRAINT Mountain_longitude_latitude CHECK ((Longitude >= -180) AND (Longitude <= 180)
              AND  (Latitude >= -90) AND (Latitude <= 90)));

CREATE TABLE Desert
(Name VARCHAR(35),
 Area DOUBLE PRECISION,
 Longitude DOUBLE PRECISION,
 Latitude DOUBLE PRECISION,
 CONSTRAINT DesertKey PRIMARY KEY(Name),
 CONSTRAINT DesCoord
   CHECK ((Longitude >= -180) AND (Longitude <= 180)
     AND  (Latitude >= -90) AND (Latitude <= 90)));

CREATE TABLE Island
(Name VARCHAR(35),
 Islands VARCHAR(35),
 Area DOUBLE PRECISION,
 Height DOUBLE PRECISION,
 Type VARCHAR(10),
 CONSTRAINT IslandKey PRIMARY KEY(Name),
 CONSTRAINT IslandAr check (Area >= 0),
 Longitude DOUBLE PRECISION,
 Latitude DOUBLE PRECISION,
 CONSTRAINT IslandCoord
   CHECK ((Longitude >= -180) AND (Longitude <= 180)
     AND  (Latitude >= -90) AND (Latitude <= 90)));

CREATE TABLE Lake
(Name VARCHAR(35),
 Area DOUBLE PRECISION,
 Depth DOUBLE PRECISION,
 Altitude DOUBLE PRECISION,
 Type VARCHAR(10),
 River VARCHAR(35),
 Longitude DOUBLE PRECISION,
 Latitude DOUBLE PRECISION,
 CONSTRAINT LakeKey PRIMARY KEY(Name),
 CONSTRAINT LakeAr CHECK (Area >= 0),
 CONSTRAINT LakeDpth CHECK (Depth >= 0),
 CONSTRAINT LakeCoord
   CHECK ((Longitude >= -180) AND (Longitude <= 180)
     AND  (Latitude >= -90) AND (Latitude <= 90)));

CREATE TABLE Sea
(Name VARCHAR(35),
 Depth DOUBLE PRECISION,
 CONSTRAINT SeaKey PRIMARY KEY(Name),
 CONSTRAINT SeaDepth CHECK (Depth >= 0));

CREATE TABLE River
(Name VARCHAR(35),
 River VARCHAR(35),
 Lake VARCHAR(35),
 Sea VARCHAR(35),
 Length DOUBLE PRECISION,
 SourceLongitude DOUBLE PRECISION,
 SourceLatitude DOUBLE PRECISION,
 Mountains VARCHAR(35),
 SourceAltitude DOUBLE PRECISION,
 EstuaryLongitude DOUBLE PRECISION,
 EstuaryLatitude DOUBLE PRECISION,
 CONSTRAINT RiverKey PRIMARY KEY(Name),
 CONSTRAINT RiverLength CHECK (Length >= 0),
 CONSTRAINT SourceCoord
     CHECK ((SourceLongitude >= -180) AND
            (SourceLongitude <= 180) AND
            (SourceLatitude >= -90) AND
            (SourceLatitude <= 90)),
 CONSTRAINT EstCoord
     CHECK ((EstuaryLongitude >= -180) AND
            (EstuaryLongitude <= 180) AND
            (EstuaryLatitude >= -90) AND
            (EstuaryLatitude <= 90)));

CREATE TABLE geo_Mountain
(Mountain VARCHAR(35) ,
 Country VARCHAR(4) ,
 Province VARCHAR(35) ,
 CONSTRAINT GMountainKey PRIMARY KEY (Province,Country,Mountain) );

CREATE TABLE geo_Desert
(Desert VARCHAR(35) ,
 Country VARCHAR(4) ,
 Province VARCHAR(35) ,
 CONSTRAINT GDesertKey PRIMARY KEY (Province, Country, Desert) );

CREATE TABLE geo_Island
(Island VARCHAR(35) ,
 Country VARCHAR(4) ,
 Province VARCHAR(35) ,
 CONSTRAINT GIslandKey PRIMARY KEY (Province, Country, Island) );

CREATE TABLE geo_River
(River VARCHAR(35) ,
 Country VARCHAR(4) ,
 Province VARCHAR(35) ,
 CONSTRAINT GRiverKey PRIMARY KEY (Province ,Country, River) );

CREATE TABLE geo_Sea
(Sea VARCHAR(35) ,
 Country VARCHAR(4)  ,
 Province VARCHAR(35) ,
 CONSTRAINT GSeaKey PRIMARY KEY (Province, Country, Sea) );

CREATE TABLE geo_Lake
(Lake VARCHAR(35) ,
 Country VARCHAR(4) ,
 Province VARCHAR(35) ,
 CONSTRAINT GLakeKey PRIMARY KEY (Province, Country, Lake) );

CREATE TABLE geo_Source
(River VARCHAR(35) ,
 Country VARCHAR(4) ,
 Province VARCHAR(35) ,
 CONSTRAINT GSourceKey PRIMARY KEY (Province, Country, River) );

CREATE TABLE geo_Estuary
(River VARCHAR(35) ,
 Country VARCHAR(4) ,
 Province VARCHAR(35) ,
 CONSTRAINT GEstuaryKey PRIMARY KEY (Province, Country, River) );

CREATE TABLE mergesWith
(Sea1 VARCHAR(35) ,
 Sea2 VARCHAR(35) ,
 CONSTRAINT MergesWithKey PRIMARY KEY (Sea1, Sea2) );

CREATE TABLE located
(City VARCHAR(35) ,
 Province VARCHAR(35) ,
 Country VARCHAR(4) ,
 River VARCHAR(35),
 Lake VARCHAR(35),
 Sea VARCHAR(35) );

CREATE TABLE locatedOn
(City VARCHAR(35) ,
 Province VARCHAR(35) ,
 Country VARCHAR(4) ,
 Island VARCHAR(35) ,
 CONSTRAINT locatedOnKey PRIMARY KEY (City, Province, Country, Island) );

CREATE TABLE islandIn
(Island VARCHAR(35) ,
 Sea VARCHAR(35) ,
 Lake VARCHAR(35) ,
 River VARCHAR(35) );

CREATE TABLE MountainOnIsland
(Mountain VARCHAR(35),
 Island  VARCHAR(35),
 CONSTRAINT MntIslKey PRIMARY KEY (Mountain, Island) );
EOSQL