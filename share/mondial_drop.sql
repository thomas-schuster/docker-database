DROP TABLE if exists Country CASCADE;
DROP TABLE if exists Province CASCADE;
DROP TABLE if exists City CASCADE;
DROP TABLE if exists Economy CASCADE;
DROP TABLE if exists Population CASCADE;
DROP TABLE if exists Politics CASCADE;
DROP TABLE if exists Language CASCADE;
DROP TABLE if exists Religion CASCADE;
DROP TABLE if exists EthnicGroup CASCADE;

DROP TABLE if exists Countrypops CASCADE;
DROP TABLE if exists Provpops CASCADE;
DROP TABLE if exists Citypops CASCADE;

DROP TABLE if exists Countryothername CASCADE;
DROP TABLE if exists Provinceothername CASCADE;
DROP TABLE if exists Cityothername CASCADE;

DROP TABLE if exists Countrylocalname CASCADE;
DROP TABLE if exists Provincelocalname CASCADE;
DROP TABLE if exists Citylocalname CASCADE;

DROP TABLE if exists borders CASCADE;

DROP TABLE if exists Continent CASCADE;
DROP TABLE if exists encompasses CASCADE;

DROP TABLE if exists Organization CASCADE;
DROP TABLE if exists isMember CASCADE;

DROP TABLE if exists Mountain CASCADE;
DROP TABLE if exists Desert CASCADE;
DROP TABLE if exists Island CASCADE;
DROP TABLE if exists Lake CASCADE;
DROP TABLE if exists Sea CASCADE;
DROP TABLE if exists River CASCADE;
DROP TABLE if exists RiverThrough CASCADE;

DROP TABLE if exists geo_Mountain CASCADE;
DROP TABLE if exists geo_Desert CASCADE;
DROP TABLE if exists geo_Island CASCADE;
DROP TABLE if exists geo_River CASCADE;
DROP TABLE if exists geo_Sea CASCADE;
DROP TABLE if exists geo_Lake CASCADE;
DROP TABLE if exists geo_Source CASCADE;
DROP TABLE if exists geo_Estuary CASCADE;

DROP TABLE if exists mergesWith CASCADE;
DROP TABLE if exists located CASCADE;
DROP TABLE if exists locatedOn CASCADE;
DROP TABLE if exists islandIn CASCADE;
DROP TABLE if exists mountainOnIsland CASCADE;
DROP TABLE if exists riverOnIsland CASCADE;
DROP TABLE if exists lakeOnIsland CASCADE;

DROP TABLE if exists airport CASCADE;

DROP TYPE if exists GeoCoord;