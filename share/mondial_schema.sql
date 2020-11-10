



CREATE TABLE Country
(Name VARCHAR(50) NOT NULL UNIQUE,
 Code VARCHAR(4) CONSTRAINT CountryKey PRIMARY KEY,
 Capital VARCHAR(50),
 Province VARCHAR(50),
 Area DECIMAL CONSTRAINT CountryArea
   CHECK (Area >= 0),
 Population DECIMAL CONSTRAINT CountryPop
   CHECK (Population >= 0));

CREATE TABLE City
(Name VARCHAR(50),
 Country VARCHAR(4),
 Province VARCHAR(50),
 Population DECIMAL CONSTRAINT CityPop
   CHECK (Population >= 0),
 Latitude DECIMAL CONSTRAINT CityLat
   CHECK ((Latitude >= -90) AND (Latitude <= 90)) ,
 Longitude DECIMAL CONSTRAINT CityLon
   CHECK ((Longitude >= -180) AND (Longitude <= 180)) ,
 Elevation DECIMAL ,
 CONSTRAINT CityKey PRIMARY KEY (Name, Country, Province));

CREATE TABLE Province
(Name VARCHAR(50) CONSTRAINT PrName NOT NULL ,
 Country  VARCHAR(4) CONSTRAINT PrCountry NOT NULL ,
 Population DECIMAL CONSTRAINT PrPop
   CHECK (Population >= 0),
 Area DECIMAL CONSTRAINT PrAr
   CHECK (Area >= 0),
 Capital VARCHAR(50),
 CapProv VARCHAR(50),
 CONSTRAINT PrKey PRIMARY KEY (Name, Country));

CREATE TABLE Economy
(Country VARCHAR(4) CONSTRAINT EconomyKey PRIMARY KEY,
 GDP DECIMAL CONSTRAINT EconomyGDP
   CHECK (GDP >= 0),
 Agriculture DECIMAL,
 Service DECIMAL,
 Industry DECIMAL,
 Inflation DECIMAL,
 Unemployment DECIMAL);

CREATE TABLE Population
(Country VARCHAR(4) CONSTRAINT PopKey PRIMARY KEY,
 Population_Growth DECIMAL,
 Infant_Mortality DECIMAL);

CREATE TABLE Politics
(Country VARCHAR(4) CONSTRAINT PoliticsKey PRIMARY KEY,
 Independence DATE,
 WasDependent VARCHAR(50),
 Dependent  VARCHAR(4),
 Government VARCHAR(120));

CREATE TABLE Religion
(Country VARCHAR(4),
 Name VARCHAR(50),
 Percentage DECIMAL CONSTRAINT ReligionPercent 
   CHECK ((Percentage > 0) AND (Percentage <= 100)),
 CONSTRAINT ReligionKey PRIMARY KEY (Name, Country));

CREATE TABLE EthnicGroup
(Country VARCHAR(4),
 Name VARCHAR(50),
 Percentage DECIMAL CONSTRAINT EthnicPercent 
   CHECK ((Percentage > 0) AND (Percentage <= 100)),
 CONSTRAINT EthnicKey PRIMARY KEY (Name, Country));

CREATE TABLE Language
(Country VARCHAR(4),
 Name VARCHAR(50),
 Percentage DECIMAL CONSTRAINT LanguagePercent 
   CHECK ((Percentage > 0) AND (Percentage <= 100)),
 CONSTRAINT LanguageKey PRIMARY KEY (Name, Country));

CREATE TABLE Countrypops
(Country VARCHAR(4),
 Year DECIMAL CONSTRAINT CountryPopsYear
   CHECK (Year >= 0),
 Population DECIMAL CONSTRAINT CountryPopsPop
   CHECK (Population >= 0),
 CONSTRAINT CountryPopsKey PRIMARY KEY (Country, Year));

CREATE TABLE Countryothername
(Country VARCHAR(4),
 othername VARCHAR(50),
 CONSTRAINT CountryOthernameKey PRIMARY KEY (Country, othername));

CREATE TABLE Countrylocalname
(Country VARCHAR(4),
 localname VARCHAR(300),
 CONSTRAINT CountrylocalnameKey PRIMARY KEY (Country));

CREATE TABLE Provpops
(Province VARCHAR(50),
 Country VARCHAR(4),
 Year DECIMAL CONSTRAINT ProvPopsYear
   CHECK (Year >= 0),
 Population DECIMAL CONSTRAINT ProvPopsPop
   CHECK (Population >= 0),
 CONSTRAINT ProvPopKey PRIMARY KEY (Country, Province, Year));

CREATE TABLE Provinceothername
(Province VARCHAR(50),
 Country VARCHAR(4),
 othername VARCHAR(50),
 CONSTRAINT ProvOthernameKey PRIMARY KEY (Country, Province, othername));

CREATE TABLE Provincelocalname
(Province VARCHAR(50),
 Country VARCHAR(4),
 localname VARCHAR(300),
 CONSTRAINT ProvlocalnameKey PRIMARY KEY (Country, Province));

CREATE TABLE Citypops
(City VARCHAR(50),
 Country VARCHAR(4),
 Province VARCHAR(50),
 Year DECIMAL CONSTRAINT CityPopsYear
   CHECK (Year >= 0),
 Population DECIMAL CONSTRAINT CityPopsPop
   CHECK (Population >= 0),
 CONSTRAINT CityPopKey PRIMARY KEY (Country, Province, City, Year));

CREATE TABLE Cityothername
(City VARCHAR(50),
 Country VARCHAR(4),
 Province VARCHAR(50),
 othername VARCHAR(50),
 CONSTRAINT CityOthernameKey PRIMARY KEY (Country, Province, City, othername));

CREATE TABLE Citylocalname
(City VARCHAR(50),
 Country VARCHAR(4),
 Province VARCHAR(50),
 localname VARCHAR(300),
 CONSTRAINT CitylocalnameKey PRIMARY KEY (Country, Province, City));

CREATE TABLE Continent
(Name VARCHAR(20) CONSTRAINT ContinentKey PRIMARY KEY,
 Area DECIMAL(10));

CREATE TABLE borders
(Country1 VARCHAR(4),
 Country2 VARCHAR(4),
 Length DECIMAL 
   CHECK (Length > 0),
 CONSTRAINT BorderKey PRIMARY KEY (Country1,Country2) );

CREATE TABLE encompasses
(Country VARCHAR(4) NOT NULL,
 Continent VARCHAR(20) NOT NULL,
 Percentage DECIMAL,
   CHECK ((Percentage > 0) AND (Percentage <= 100)),
 CONSTRAINT EncompassesKey PRIMARY KEY (Country,Continent));

CREATE TABLE Organization
(Abbreviation VARCHAR(12) Constraint OrgKey PRIMARY KEY,
 Name VARCHAR(100) NOT NULL,
 City VARCHAR(50) ,
 Country VARCHAR(4) , 
 Province VARCHAR(50) ,
 Established DATE,
 CONSTRAINT OrgNameUnique UNIQUE (Name));

CREATE TABLE isMember
(Country VARCHAR(4),
 Organization VARCHAR(12),
 Type VARCHAR(60) DEFAULT 'member',
 CONSTRAINT MemberKey PRIMARY KEY (Country,Organization) );

CREATE TYPE GeoCoord AS
(Latitude DECIMAL,
 Longitude DECIMAL);


CREATE TABLE Mountain
(Name VARCHAR(50) CONSTRAINT MountainKey PRIMARY KEY,
 Mountains VARCHAR(50),
 Elevation DECIMAL,
 Type VARCHAR(10),
 Coordinates GeoCoord CONSTRAINT MountainCoord
     CHECK (((Coordinates).Latitude >= -90) AND 
            ((Coordinates).Latitude <= 90) AND
            ((Coordinates).Longitude > -180) AND
            ((Coordinates).Longitude <= 180)));

CREATE TABLE Desert
(Name VARCHAR(50) CONSTRAINT DesertKey PRIMARY KEY,
 Area DECIMAL,
 Coordinates GeoCoord CONSTRAINT DesCoord
     CHECK (((Coordinates).Latitude >= -90) AND 
            ((Coordinates).Latitude <= 90) AND
            ((Coordinates).Longitude > -180) AND
            ((Coordinates).Longitude <= 180)));

CREATE TABLE Island
(Name VARCHAR(50) CONSTRAINT IslandKey PRIMARY KEY,
 Islands VARCHAR(50),
 Area DECIMAL CONSTRAINT IslandAr check (Area >= 0),
 Elevation DECIMAL,
 Type VARCHAR(12),
 Coordinates GeoCoord CONSTRAINT IslandCoord
     CHECK (((Coordinates).Latitude >= -90) AND 
            ((Coordinates).Latitude <= 90) AND
            ((Coordinates).Longitude > -180) AND
            ((Coordinates).Longitude <= 180)));

CREATE TABLE Lake
(Name VARCHAR(50) CONSTRAINT LakeKey PRIMARY KEY,
 River VARCHAR(50),
 Area DECIMAL CONSTRAINT LakeAr CHECK (Area >= 0),
 Elevation DECIMAL,
 Depth DECIMAL CONSTRAINT LakeDpth CHECK (Depth >= 0),
 Height DECIMAL CONSTRAINT DamHeight CHECK (Height > 0),
 Type VARCHAR(12),
 Coordinates GeoCoord CONSTRAINT LakeCoord
     CHECK (((Coordinates).Latitude >= -90) AND 
            ((Coordinates).Latitude <= 90) AND
            ((Coordinates).Longitude > -180) AND
            ((Coordinates).Longitude <= 180)));

CREATE TABLE Sea
(Name VARCHAR(50) CONSTRAINT SeaKey PRIMARY KEY,
 Area DECIMAL CONSTRAINT SeaAr CHECK (Area >= 0),
 Depth DECIMAL CONSTRAINT SeaDepth CHECK (Depth >= 0));

CREATE TABLE River
(Name VARCHAR(50) CONSTRAINT RiverKey PRIMARY KEY,
 River VARCHAR(50),
 Lake VARCHAR(50),
 Sea VARCHAR(50),
 Length DECIMAL CONSTRAINT RiverLength
   CHECK (Length >= 0),
 Area DECIMAL CONSTRAINT RiverArea
   CHECK (Area >= 0),
 Source GeoCoord CONSTRAINT SourceCoord
     CHECK (((Source).Latitude >= -90) AND 
            ((Source).Latitude <= 90) AND
            ((Source).Longitude > -180) AND
            ((Source).Longitude <= 180)),
 Mountains VARCHAR(50),
 SourceElevation DECIMAL,
 Estuary GeoCoord CONSTRAINT EstCoord
     CHECK (((Estuary).Latitude >= -90) AND 
            ((Estuary).Latitude <= 90) AND
            ((Estuary).Longitude > -180) AND
            ((Estuary).Longitude <= 180)),
 EstuaryElevation DECIMAL,
 CONSTRAINT RivFlowsInto 
     CHECK ((River IS NULL AND Lake IS NULL)
            OR (River IS NULL AND Sea IS NULL)
            OR (Lake IS NULL AND Sea is NULL)));

CREATE TABLE RiverThrough
(River VARCHAR(50),
 Lake  VARCHAR(50),
 CONSTRAINT RThroughKey PRIMARY KEY (River,Lake) );

CREATE TABLE geo_Mountain
(Mountain VARCHAR(50) ,
 Country VARCHAR(4) ,
 Province VARCHAR(50) ,
 CONSTRAINT GMountainKey PRIMARY KEY (Province,Country,Mountain) );

CREATE TABLE geo_Desert
(Desert VARCHAR(50) ,
 Country VARCHAR(4) ,
 Province VARCHAR(50) ,
 CONSTRAINT GDesertKey PRIMARY KEY (Province, Country, Desert) );

CREATE TABLE geo_Island
(Island VARCHAR(50) , 
 Country VARCHAR(4) ,
 Province VARCHAR(50) ,
 CONSTRAINT GIslandKey PRIMARY KEY (Province, Country, Island) );

CREATE TABLE geo_River
(River VARCHAR(50) , 
 Country VARCHAR(4) ,
 Province VARCHAR(50) ,
 CONSTRAINT GRiverKey PRIMARY KEY (Province ,Country, River) );

CREATE TABLE geo_Sea
(Sea VARCHAR(50) ,
 Country VARCHAR(4)  ,
 Province VARCHAR(50) ,
 CONSTRAINT GSeaKey PRIMARY KEY (Province, Country, Sea) );

CREATE TABLE geo_Lake
(Lake VARCHAR(50) ,
 Country VARCHAR(4) ,
 Province VARCHAR(50) ,
 CONSTRAINT GLakeKey PRIMARY KEY (Province, Country, Lake) );

CREATE TABLE geo_Source
(River VARCHAR(50) ,
 Country VARCHAR(4) ,
 Province VARCHAR(50) ,
 CONSTRAINT GSourceKey PRIMARY KEY (Province, Country, River) );

CREATE TABLE geo_Estuary
(River VARCHAR(50) ,
 Country VARCHAR(4) ,
 Province VARCHAR(50) ,
 CONSTRAINT GEstuaryKey PRIMARY KEY (Province, Country, River) );

CREATE TABLE mergesWith
(Sea1 VARCHAR(50) ,
 Sea2 VARCHAR(50) ,
 CONSTRAINT MergesWithKey PRIMARY KEY (Sea1, Sea2) );

CREATE TABLE located
(City VARCHAR(50) ,
 Province VARCHAR(50) ,
 Country VARCHAR(4) ,
 River VARCHAR(50),
 Lake VARCHAR(50),
 Sea VARCHAR(50) );

CREATE TABLE locatedOn
(City VARCHAR(50) ,
 Province VARCHAR(50) ,
 Country VARCHAR(4) ,
 Island VARCHAR(50) ,
 CONSTRAINT locatedOnKey PRIMARY KEY (City, Province, Country, Island) );

CREATE TABLE islandIn
(Island VARCHAR(50) ,
 Sea VARCHAR(50) ,
 Lake VARCHAR(50) ,
 River VARCHAR(50) );

CREATE TABLE MountainOnIsland
(Mountain VARCHAR(50),
 Island   VARCHAR(50),
 CONSTRAINT MountainIslKey PRIMARY KEY (Mountain, Island) );

CREATE TABLE LakeOnIsland
(Lake    VARCHAR(50),
 Island  VARCHAR(50),
 CONSTRAINT LakeIslKey PRIMARY KEY (Lake, Island) );

CREATE TABLE RiverOnIsland
(River   VARCHAR(50),
 Island  VARCHAR(50),
 CONSTRAINT RiverIslKey PRIMARY KEY (River, Island) );

CREATE TABLE Airport
(IATACode VARCHAR(3) PRIMARY KEY,
 Name VARCHAR(100) ,
 Country VARCHAR(4) ,
 City VARCHAR(50) ,
 Province VARCHAR(50) ,
 Island VARCHAR(50) ,
 Latitude DECIMAL CONSTRAINT AirpLat
   CHECK ((Latitude >= -90) AND (Latitude <= 90)) ,
 Longitude DECIMAL CONSTRAINT AirpLon
   CHECK ((Longitude >= -180) AND (Longitude <= 180)) ,
 Elevation DECIMAL ,
 gmtOffset DECIMAL );

ALTER TABLE organization 
ADD CONSTRAINT fk_capital 
FOREIGN KEY (city, country, province) 
REFERENCES city (name, country, province);

ALTER TABLE country 
ADD CONSTRAINT fk_capital 
FOREIGN KEY (capital, code, province) 
REFERENCES city (name, country, province);

ALTER TABLE citypops 
ADD CONSTRAINT fk_citypops 
FOREIGN KEY (city, country, province) 
REFERENCES city (name, country, province);

ALTER TABLE province 
ADD CONSTRAINT fk_citycapital 
FOREIGN KEY (capital, country, capprov) 
REFERENCES city (name, country, province);

ALTER TABLE located 
ADD CONSTRAINT fk_locatedcity 
FOREIGN KEY (city, country, province) 
REFERENCES city (name, country, province);

ALTER TABLE located 
ADD CONSTRAINT fk_locsea
FOREIGN KEY (sea) 
REFERENCES sea (name);

ALTER TABLE located 
ADD CONSTRAINT fk_locriver
FOREIGN KEY (river) 
REFERENCES river (name);

ALTER TABLE located 
ADD CONSTRAINT fk_loclake
FOREIGN KEY (lake) 
REFERENCES lake (name);

ALTER TABLE locatedOn 
ADD CONSTRAINT fk_locatedcityOn 
FOREIGN KEY (city, country, province) 
REFERENCES city (name, country, province);

ALTER TABLE locatedOn
ADD CONSTRAINT fk_onisland
FOREIGN KEY (island) 
REFERENCES island (name);

ALTER TABLE isMember 
ADD CONSTRAINT fk_ismember 
FOREIGN KEY (organization) 
REFERENCES organization (abbreviation);

ALTER TABLE isMember 
ADD CONSTRAINT fk_country 
FOREIGN KEY (country) 
REFERENCES country (code);

ALTER TABLE province 
ADD CONSTRAINT fk_provcountry 
FOREIGN KEY (country) 
REFERENCES country (code);

ALTER TABLE borders 
ADD CONSTRAINT fk_border1 
FOREIGN KEY (country1) 
REFERENCES country (code);

ALTER TABLE borders 
ADD CONSTRAINT fk_border2 
FOREIGN KEY (country2) 
REFERENCES country (code);

ALTER TABLE countrypops 
ADD CONSTRAINT fk_popscountry 
FOREIGN KEY (country) 
REFERENCES country (code);

ALTER TABLE economy 
ADD CONSTRAINT fk_ecoscountry 
FOREIGN KEY (country) 
REFERENCES country (code);

ALTER TABLE politics 
ADD CONSTRAINT fk_polscountry1 
FOREIGN KEY (country) 
REFERENCES country (code);

ALTER TABLE politics 
ADD CONSTRAINT fk_polscountry2 
FOREIGN KEY (dependent) 
REFERENCES country (code);

ALTER TABLE politics 
ADD CONSTRAINT fk_polscountry3 
FOREIGN KEY (wasdependent) 
REFERENCES country (code);

ALTER TABLE population 
ADD CONSTRAINT fk_popcountry 
FOREIGN KEY (country) 
REFERENCES country (code);

ALTER TABLE language 
ADD CONSTRAINT fk_langcountry 
FOREIGN KEY (country) 
REFERENCES country (code);

ALTER TABLE religion 
ADD CONSTRAINT fk_popcountry 
FOREIGN KEY (country) 
REFERENCES country (code);

ALTER TABLE ethnicgroup 
ADD CONSTRAINT fk_popcountry 
FOREIGN KEY (country) 
REFERENCES country (code);

ALTER TABLE encompasses 
ADD CONSTRAINT fk_enccountry 
FOREIGN KEY (country) 
REFERENCES country (code);

ALTER TABLE encompasses 
ADD CONSTRAINT fk_enccontinent 
FOREIGN KEY (continent) 
REFERENCES continent (name);

ALTER TABLE geo_desert 
ADD CONSTRAINT fk_desert 
FOREIGN KEY (desert) 
REFERENCES desert (name);

ALTER TABLE geo_desert 
ADD CONSTRAINT fk_desertprovince 
FOREIGN KEY (country, province) 
REFERENCES province (country, name);

ALTER TABLE geo_mountain
ADD CONSTRAINT fk_mountainprovince 
FOREIGN KEY (country, province) 
REFERENCES province (country, name);

ALTER TABLE geo_mountain
ADD CONSTRAINT fk_geomountain 
FOREIGN KEY (mountain) 
REFERENCES mountain (name);

ALTER TABLE geo_island
ADD CONSTRAINT fk_islandprovince 
FOREIGN KEY (country, province) 
REFERENCES province (country, name);

ALTER TABLE geo_island
ADD CONSTRAINT fk_geoisland
FOREIGN KEY (island) 
REFERENCES island (name);

ALTER TABLE geo_sea
ADD CONSTRAINT fk_seaprovince 
FOREIGN KEY (country, province) 
REFERENCES province (country, name);

ALTER TABLE geo_sea
ADD CONSTRAINT fk_geosea
FOREIGN KEY (sea) 
REFERENCES sea (name);

ALTER TABLE geo_estuary
ADD CONSTRAINT fk_gestprovince 
FOREIGN KEY (country, province) 
REFERENCES province (country, name);

ALTER TABLE geo_estuary
ADD CONSTRAINT fk_gestriver 
FOREIGN KEY (river) 
REFERENCES river (name);

ALTER TABLE geo_source
ADD CONSTRAINT fk_gsrcprovince 
FOREIGN KEY (country, province) 
REFERENCES province (country, name);

ALTER TABLE geo_source
ADD CONSTRAINT fk_gsrcriver 
FOREIGN KEY (river) 
REFERENCES river (name);

ALTER TABLE geo_river
ADD CONSTRAINT fk_griverprovince 
FOREIGN KEY (country, province) 
REFERENCES province (country, name);

ALTER TABLE geo_river
ADD CONSTRAINT fk_georiver 
FOREIGN KEY (river) 
REFERENCES river (name);

ALTER TABLE geo_lake
ADD CONSTRAINT fk_lakeprovince 
FOREIGN KEY (country, province) 
REFERENCES province (country, name);

ALTER TABLE geo_lake
ADD CONSTRAINT fk_geolake 
FOREIGN KEY (lake) 
REFERENCES lake (name);

ALTER TABLE city
ADD CONSTRAINT fk_cityprovince 
FOREIGN KEY (country, province) 
REFERENCES province (country, name);

ALTER TABLE provpops
ADD CONSTRAINT fk_ppopsprovince 
FOREIGN KEY (country, province) 
REFERENCES province (country, name);

ALTER TABLE MountainOnIsland
ADD CONSTRAINT fk_mtimountain 
FOREIGN KEY (mountain) 
REFERENCES mountain (name);

ALTER TABLE islandin
ADD CONSTRAINT fk_islandin
FOREIGN KEY (island) 
REFERENCES island (name);

ALTER TABLE islandin
ADD CONSTRAINT fk_insea
FOREIGN KEY (sea) 
REFERENCES sea (name);

ALTER TABLE mergeswith
ADD CONSTRAINT fk_sea1
FOREIGN KEY (sea1) 
REFERENCES sea (name);

ALTER TABLE mergeswith
ADD CONSTRAINT fk_sea2
FOREIGN KEY (sea2) 
REFERENCES sea (name);

ALTER TABLE river
ADD CONSTRAINT fk_riversea
FOREIGN KEY (sea) 
REFERENCES sea (name);

ALTER TABLE river
ADD CONSTRAINT fk_riverriver
FOREIGN KEY (river) 
REFERENCES river (name);

ALTER TABLE river
ADD CONSTRAINT fk_riverlake
FOREIGN KEY (lake) 
REFERENCES lake (name);

ALTER TABLE riverthrough
ADD CONSTRAINT fk_thriver
FOREIGN KEY (river) 
REFERENCES river (name);

ALTER TABLE riverthrough
ADD CONSTRAINT fk_thlake
FOREIGN KEY (lake) 
REFERENCES lake (name);

ALTER TABLE lake
ADD CONSTRAINT fk_lakeriver
FOREIGN KEY (river) 
REFERENCES river (name);

ALTER TABLE lake DISABLE TRIGGER ALL;
ALTER TABLE riverthrough DISABLE TRIGGER ALL;
ALTER TABLE river DISABLE TRIGGER ALL;
ALTER TABLE mergeswith DISABLE TRIGGER ALL;
ALTER TABLE islandin DISABLE TRIGGER ALL;
ALTER TABLE MountainOnIsland DISABLE TRIGGER ALL;
ALTER TABLE provpops DISABLE TRIGGER ALL;
ALTER TABLE city DISABLE TRIGGER ALL;
ALTER TABLE geo_lake DISABLE TRIGGER ALL;
ALTER TABLE geo_river DISABLE TRIGGER ALL;
ALTER TABLE geo_source DISABLE TRIGGER ALL;
ALTER TABLE geo_estuary DISABLE TRIGGER ALL;
ALTER TABLE geo_sea DISABLE TRIGGER ALL;
ALTER TABLE geo_island DISABLE TRIGGER ALL;
ALTER TABLE geo_mountain DISABLE TRIGGER ALL;
ALTER TABLE geo_desert DISABLE TRIGGER ALL;
ALTER TABLE encompasses DISABLE TRIGGER ALL;
ALTER TABLE language DISABLE TRIGGER ALL;
ALTER TABLE religion DISABLE TRIGGER ALL;
ALTER TABLE ethnicgroup DISABLE TRIGGER ALL;
ALTER TABLE politics DISABLE TRIGGER ALL;
ALTER TABLE population DISABLE TRIGGER ALL;
ALTER TABLE economy DISABLE TRIGGER ALL;
ALTER TABLE countrypops DISABLE TRIGGER ALL;
ALTER TABLE borders DISABLE TRIGGER ALL;
ALTER TABLE isMember DISABLE TRIGGER ALL;
ALTER TABLE located DISABLE TRIGGER ALL;
ALTER TABLE locatedOn DISABLE TRIGGER ALL;
ALTER TABLE province DISABLE TRIGGER ALL;
ALTER TABLE citypops DISABLE TRIGGER ALL;
ALTER TABLE country DISABLE TRIGGER ALL;
ALTER TABLE organization DISABLE TRIGGER ALL;