create user MONDIALUSER_PLACEHOLDER with password 'MONDIALUSERPASSWORD';
drop database if exists MONDIALDB_PLACEHOLDER;
create database MONDIALDB_PLACEHOLDER
   encoding = 'UTF8'
   lc_collate = 'en_US.utf8'
   lc_ctype = 'en_US.utf8'
   tablespace = pg_default
   owner = MONDIALUSER_PLACEHOLDER;
grant all privileges on database MONDIALDB_PLACEHOLDER to MONDIALUSER_PLACEHOLDER;
\c MONDIALDB_PLACEHOLDER

create table country
(name varchar(50) not null unique,
 code varchar(4) constraint countrykey primary key,
 capital varchar(50),
 province varchar(50),
 area decimal constraint countryarea
   check (area >= 0),
 population decimal constraint countrypop
   check (population >= 0));

create table city
(name varchar(50),
 country varchar(4),
 province varchar(50),
 population decimal constraint citypop
   check (population >= 0),
 latitude decimal constraint citylat
   check ((latitude >= -90) and (latitude <= 90)) ,
 longitude decimal constraint citylon
   check ((longitude >= -180) and (longitude <= 180)) ,
 elevation decimal ,
 constraint citykey primary key (name, country, province));

create table province
(name varchar(50) constraint prname not null ,
 country  varchar(4) constraint prcountry not null ,
 population decimal constraint prpop
   check (population >= 0),
 area decimal constraint prar
   check (area >= 0),
 capital varchar(50),
 capprov varchar(50),
 constraint prkey primary key (name, country));

create table economy
(country varchar(4) constraint economykey primary key,
 gdp decimal constraint economygdp
   check (gdp >= 0),
 agriculture decimal,
 service decimal,
 industry decimal,
 inflation decimal,
 unemployment decimal);

create table population
(country varchar(4) constraint popkey primary key,
 population_growth decimal,
 infant_mortality decimal);

create table politics
(country varchar(4) constraint politicskey primary key,
 independence date,
 wasdependent varchar(50),
 dependent  varchar(4),
 government varchar(120));

create table religion
(country varchar(4),
 name varchar(50),
 percentage decimal constraint religionpercent 
   check ((percentage > 0) and (percentage <= 100)),
 constraint religionkey primary key (name, country));

create table ethnicgroup
(country varchar(4),
 name varchar(50),
 percentage decimal constraint ethnicpercent 
   check ((percentage > 0) and (percentage <= 100)),
 constraint ethnickey primary key (name, country));

create table spoken
(country varchar(4),
 language varchar(50),
 percentage decimal constraint spokenpercent 
   check ((percentage > 0) and (percentage <= 100)),
 constraint spokenkey primary key (country, language));

create table language
(name varchar(50) constraint languagekey primary key,
 superlanguage varchar(50));

create table countrypops
(country varchar(4),
 year decimal constraint countrypopsyear
   check (year >= 0),
 population decimal constraint countrypopspop
   check (population >= 0),
 constraint countrypopskey primary key (country, year));

create table countryothername
(country varchar(4),
 othername varchar(50),
 constraint countryothernamekey primary key (country, othername));

create table countrylocalname
(country varchar(4),
 localname varchar(300),
 constraint countrylocalnamekey primary key (country));

create table provpops
(province varchar(50),
 country varchar(4),
 year decimal constraint provpopsyear
   check (year >= 0),
 population decimal constraint provpopspop
   check (population >= 0),
 constraint provpopkey primary key (country, province, year));

create table provinceothername
(province varchar(50),
 country varchar(4),
 othername varchar(50),
 constraint provothernamekey primary key (country, province, othername));

create table provincelocalname
(province varchar(50),
 country varchar(4),
 localname varchar(300),
 constraint provlocalnamekey primary key (country, province));

create table citypops
(city varchar(50),
 country varchar(4),
 province varchar(50),
 year decimal constraint citypopsyear
   check (year >= 0),
 population decimal constraint citypopspop
   check (population >= 0),
 constraint citypopkey primary key (country, province, city, year));

create table cityothername
(city varchar(50),
 country varchar(4),
 province varchar(50),
 othername varchar(50),
 constraint cityothernamekey primary key (country, province, city, othername));

create table citylocalname
(city varchar(50),
 country varchar(4),
 province varchar(50),
 localname varchar(300),
 constraint citylocalnamekey primary key (country, province, city));

create table continent
(name varchar(20) constraint continentkey primary key,
 area decimal(10));

create table borders
(country1 varchar(4),
 country2 varchar(4),
 length decimal 
   check (length > 0),
 constraint borderkey primary key (country1,country2) );

create table encompasses
(country varchar(4) not null,
 continent varchar(20) not null,
 percentage decimal,
   check ((percentage > 0) and (percentage <= 100)),
 constraint encompasseskey primary key (country,continent));

create table organization
(abbreviation varchar(12) constraint orgkey primary key,
 name varchar(100) not null,
 city varchar(50) ,
 country varchar(4) , 
 province varchar(50) ,
 established date,
 constraint orgnameunique unique (name));

create table ismember
(country varchar(4),
 organization varchar(12),
 type varchar(60) default 'member',
 constraint memberkey primary key (country,organization) );

create type geocoord as
(latitude decimal,
 longitude decimal);


create table mountain
(name varchar(50) constraint mountainkey primary key,
 mountains varchar(50),
 elevation decimal,
 type varchar(10),
 coordinates geocoord constraint mountaincoord
     check (((coordinates).latitude >= -90) and 
            ((coordinates).latitude <= 90) and
            ((coordinates).longitude > -180) and
            ((coordinates).longitude <= 180)));

create table desert
(name varchar(50) constraint desertkey primary key,
 area decimal,
 coordinates geocoord constraint descoord
     check (((coordinates).latitude >= -90) and 
            ((coordinates).latitude <= 90) and
            ((coordinates).longitude > -180) and
            ((coordinates).longitude <= 180)));

create table island
(name varchar(50) constraint islandkey primary key,
 islands varchar(50),
 area decimal constraint islandar check (area >= 0),
 elevation decimal,
 type varchar(12),
 coordinates geocoord constraint islandcoord
     check (((coordinates).latitude >= -90) and 
            ((coordinates).latitude <= 90) and
            ((coordinates).longitude > -180) and
            ((coordinates).longitude <= 180)));

create table lake
(name varchar(50) constraint lakekey primary key,
 river varchar(50),
 area decimal constraint lakear check (area >= 0),
 elevation decimal,
 depth decimal constraint lakedpth check (depth >= 0),
 height decimal constraint damheight check (height > 0),
 type varchar(12),
 coordinates geocoord constraint lakecoord
     check (((coordinates).latitude >= -90) and 
            ((coordinates).latitude <= 90) and
            ((coordinates).longitude > -180) and
            ((coordinates).longitude <= 180)));

create table sea
(name varchar(50) constraint seakey primary key,
 area decimal constraint seaar check (area >= 0),
 depth decimal constraint seadepth check (depth >= 0));

create table river
(name varchar(50) constraint riverkey primary key,
 river varchar(50),
 lake varchar(50),
 sea varchar(50),
 length decimal constraint riverlength
   check (length >= 0),
 area decimal constraint riverarea
   check (area >= 0),
 source geocoord constraint sourcecoord
     check (((source).latitude >= -90) and 
            ((source).latitude <= 90) and
            ((source).longitude > -180) and
            ((source).longitude <= 180)),
 mountains varchar(50),
 sourceelevation decimal,
 estuary geocoord constraint estcoord
     check (((estuary).latitude >= -90) and 
            ((estuary).latitude <= 90) and
            ((estuary).longitude > -180) and
            ((estuary).longitude <= 180)),
 estuaryelevation decimal,
 constraint rivflowsinto 
     check ((river is null and lake is null)
            or (river is null and sea is null)
            or (lake is null and sea is null)));

create table riverthrough
(river varchar(50),
 lake  varchar(50),
 constraint rthroughkey primary key (river,lake) );

create table geo_mountain
(mountain varchar(50) ,
 country varchar(4) ,
 province varchar(50) ,
 constraint gmountainkey primary key (province,country,mountain) );

create table geo_desert
(desert varchar(50) ,
 country varchar(4) ,
 province varchar(50) ,
 constraint gdesertkey primary key (province, country, desert) );

create table geo_island
(island varchar(50) , 
 country varchar(4) ,
 province varchar(50) ,
 constraint gislandkey primary key (province, country, island) );

create table geo_river
(river varchar(50) , 
 country varchar(4) ,
 province varchar(50) ,
 constraint griverkey primary key (province ,country, river) );

create table geo_sea
(sea varchar(50) ,
 country varchar(4)  ,
 province varchar(50) ,
 constraint gseakey primary key (province, country, sea) );

create table geo_lake
(lake varchar(50) ,
 country varchar(4) ,
 province varchar(50) ,
 constraint glakekey primary key (province, country, lake) );

create table geo_source
(river varchar(50) ,
 country varchar(4) ,
 province varchar(50) ,
 constraint gsourcekey primary key (province, country, river) );

create table geo_estuary
(river varchar(50) ,
 country varchar(4) ,
 province varchar(50) ,
 constraint gestuarykey primary key (province, country, river) );

create table mergeswith
(sea1 varchar(50) ,
 sea2 varchar(50) ,
 constraint mergeswithkey primary key (sea1, sea2) );

create table located
(city varchar(50) ,
 province varchar(50) ,
 country varchar(4) ,
 river varchar(50),
 lake varchar(50),
 sea varchar(50) );

create table locatedon
(city varchar(50) ,
 province varchar(50) ,
 country varchar(4) ,
 island varchar(50) ,
 constraint locatedonkey primary key (city, province, country, island) );

create table islandin
(island varchar(50) ,
 sea varchar(50) ,
 lake varchar(50) ,
 river varchar(50) );

create table mountainonisland
(mountain varchar(50),
 island   varchar(50),
 constraint mountainislkey primary key (mountain, island) );

create table lakeonisland
(lake    varchar(50),
 island  varchar(50),
 constraint lakeislkey primary key (lake, island) );

create table riveronisland
(river   varchar(50),
 island  varchar(50),
 constraint riverislkey primary key (river, island) );

create table airport
(iatacode varchar(3) primary key,
 name varchar(100) ,
 country varchar(4) ,
 city varchar(50) ,
 province varchar(50) ,
 island varchar(50) ,
 latitude decimal constraint airplat
   check ((latitude >= -90) and (latitude <= 90)) ,
 longitude decimal constraint airplon
   check ((longitude >= -180) and (longitude <= 180)) ,
 elevation decimal ,
 gmtoffset decimal );

alter table organization 
add constraint fk_capital 
foreign key (city, country, province) 
references city (name, country, province)
deferrable initially deferred;

alter table country 
add constraint fk_capital 
foreign key (capital, code, province) 
references city (name, country, province)
deferrable initially deferred;

alter table airport 
add constraint fk_airportcity
foreign key (city, country, province) 
references city (name, country, province)
deferrable initially deferred;

alter table airport 
add constraint fk_airportisland
foreign key (island) 
references island (name )
deferrable initially deferred;

alter table citypops 
add constraint fk_citypops 
foreign key (city, country, province) 
references city (name, country, province)
deferrable initially deferred;

alter table province 
add constraint fk_citycapital 
foreign key (capital, country, capprov) 
references city (name, country, province)
deferrable initially deferred;

alter table located 
add constraint fk_locatedcity 
foreign key (city, country, province) 
references city (name, country, province)
deferrable initially deferred;

alter table located 
add constraint fk_locsea
foreign key (sea) 
references sea (name)
deferrable initially deferred;

alter table located 
add constraint fk_locriver
foreign key (river) 
references river (name)
deferrable initially deferred;

alter table located 
add constraint fk_loclake
foreign key (lake) 
references lake (name)
deferrable initially deferred;

alter table locatedon 
add constraint fk_locatedcityon 
foreign key (city, country, province) 
references city (name, country, province)
deferrable initially deferred;

alter table locatedon
add constraint fk_onisland
foreign key (island) 
references island (name)
deferrable initially deferred;

alter table ismember 
add constraint fk_ismember 
foreign key (organization) 
references organization (abbreviation)
deferrable initially deferred;

alter table ismember 
add constraint fk_country 
foreign key (country) 
references country (code)
deferrable initially deferred;

alter table province 
add constraint fk_provcountry 
foreign key (country) 
references country (code)
deferrable initially deferred;

alter table borders 
add constraint fk_border1 
foreign key (country1) 
references country (code)
deferrable initially deferred;

alter table borders 
add constraint fk_border2 
foreign key (country2) 
references country (code)
deferrable initially deferred;

alter table countrypops 
add constraint fk_popscountry 
foreign key (country) 
references country (code)
deferrable initially deferred;

alter table economy 
add constraint fk_ecoscountry 
foreign key (country) 
references country (code)
deferrable initially deferred;

alter table politics 
add constraint fk_polscountry1 
foreign key (country) 
references country (code)
deferrable initially deferred;

alter table politics 
add constraint fk_polscountry2 
foreign key (dependent) 
references country (code)
deferrable initially deferred;

alter table population 
add constraint fk_popcountry 
foreign key (country) 
references country (code)
deferrable initially deferred;

alter table spoken 
add constraint fk_spokencountry 
foreign key (country) 
references country (code)
deferrable initially deferred;

alter table spoken
add constraint fk_spokenlanguage
foreign key (language)
references language (name)
deferrable initially deferred;

alter table language
add constraint fk_languagesuper
foreign key (superlanguage)
references language (name)
deferrable initially deferred;

alter table religion 
add constraint fk_popcountry 
foreign key (country) 
references country (code)
deferrable initially deferred;

alter table ethnicgroup 
add constraint fk_popcountry 
foreign key (country) 
references country (code)
deferrable initially deferred;

alter table encompasses 
add constraint fk_enccountry 
foreign key (country) 
references country (code)
deferrable initially deferred;

alter table encompasses 
add constraint fk_enccontinent 
foreign key (continent) 
references continent (name)
deferrable initially deferred;

alter table geo_desert 
add constraint fk_desert 
foreign key (desert) 
references desert (name)
deferrable initially deferred;

alter table geo_desert 
add constraint fk_desertprovince 
foreign key (country, province) 
references province (country, name)
deferrable initially deferred;

alter table geo_mountain
add constraint fk_mountainprovince 
foreign key (country, province) 
references province (country, name)
deferrable initially deferred;

alter table geo_mountain
add constraint fk_geomountain 
foreign key (mountain) 
references mountain (name)
deferrable initially deferred;

alter table geo_island
add constraint fk_islandprovince 
foreign key (country, province) 
references province (country, name)
deferrable initially deferred;

alter table geo_island
add constraint fk_geoisland
foreign key (island) 
references island (name)
deferrable initially deferred;

alter table geo_sea
add constraint fk_seaprovince 
foreign key (country, province) 
references province (country, name)
deferrable initially deferred;

alter table geo_sea
add constraint fk_geosea
foreign key (sea) 
references sea (name)
deferrable initially deferred;

alter table geo_estuary
add constraint fk_gestprovince 
foreign key (country, province) 
references province (country, name)
deferrable initially deferred;

alter table geo_estuary
add constraint fk_gestriver 
foreign key (river) 
references river (name)
deferrable initially deferred;

alter table geo_source
add constraint fk_gsrcprovince 
foreign key (country, province) 
references province (country, name)
deferrable initially deferred;

alter table geo_source
add constraint fk_gsrcriver 
foreign key (river) 
references river (name)
deferrable initially deferred;

alter table geo_river
add constraint fk_griverprovince 
foreign key (country, province) 
references province (country, name)
deferrable initially deferred;

alter table geo_river
add constraint fk_georiver 
foreign key (river) 
references river (name)
deferrable initially deferred;

alter table geo_lake
add constraint fk_lakeprovince 
foreign key (country, province) 
references province (country, name)
deferrable initially deferred;

alter table geo_lake
add constraint fk_geolake 
foreign key (lake) 
references lake (name)
deferrable initially deferred;

alter table city
add constraint fk_cityprovince 
foreign key (country, province) 
references province (country, name)
deferrable initially deferred;

alter table provpops
add constraint fk_ppopsprovince 
foreign key (country, province) 
references province (country, name)
deferrable initially deferred;

alter table mountainonisland
add constraint fk_mtimountain 
foreign key (mountain) 
references mountain (name)
deferrable initially deferred;

alter table islandin
add constraint fk_islandin
foreign key (island) 
references island (name)
deferrable initially deferred;

alter table islandin
add constraint fk_insea
foreign key (sea) 
references sea (name)
deferrable initially deferred;

alter table mergeswith
add constraint fk_sea1
foreign key (sea1) 
references sea (name)
deferrable initially deferred;

alter table mergeswith
add constraint fk_sea2
foreign key (sea2) 
references sea (name)
deferrable initially deferred;

alter table river
add constraint fk_riversea
foreign key (sea) 
references sea (name)
deferrable initially deferred;

alter table river
add constraint fk_riverriver
foreign key (river) 
references river (name)
deferrable initially deferred;

alter table river
add constraint fk_riverlake
foreign key (lake) 
references lake (name)
deferrable initially deferred;

alter table riverthrough
add constraint fk_thriver
foreign key (river) 
references river (name)
deferrable initially deferred;

alter table riverthrough
add constraint fk_thlake
foreign key (lake) 
references lake (name)
deferrable initially deferred;

alter table lake
add constraint fk_lakeriver
foreign key (river) 
references river (name)
deferrable initially deferred;

alter table lakeonisland
add constraint fk_lakeoisland
foreign key (island) 
references island (name)
deferrable initially deferred;

alter table lakeonisland
add constraint fk_islandlake
foreign key (lake) 
references lake (name)
deferrable initially deferred;

alter table riveronisland
add constraint fk_riveroisland
foreign key (island) 
references island (name)
deferrable initially deferred;

alter table riveronisland
add constraint fk_islandriver
foreign key (river) 
references river (name)
deferrable initially deferred;

alter table provinceothername
add constraint fk_provinceother
foreign key (province, country) 
references province (name, country)
deferrable initially deferred;

alter table provincelocalname
add constraint fk_provincelocal
foreign key (province, country) 
references province (name, country)
deferrable initially deferred;