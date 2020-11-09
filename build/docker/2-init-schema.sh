#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$NXTGENMONDIAL_DB_USERNAME" --dbname "nxtgenmondialdb" <<-EOSQL
create sequence hibernate_sequence start 1 increment 1;
create table account (id int8 not null, email varchar(254) not null, enabled boolean not null, first_name varchar(70) not null, last_name varchar(70) not null, password varchar(256) not null, points int8 default 0, settings text, username varchar(64), primary key (id));
create table account_activation_token (id int8 not null, expiry_date timestamp, token_value varchar(255) not null, account_id int8 not null, primary key (id));
create table account_role (account_id int8 not null, role_id int8 not null, primary key (account_id, role_id));
create table choice (id int8 not null, correct boolean not null, description varchar(255) not null, multiple_choice_exercise_id int8 not null, primary key (id));
create table exercise_query (id int8 not null, created_date timestamp, last_modified_date timestamp, error_message varchar(255), execution_time float8 not null, query_status varchar(255) not null, sql_statement varchar(255) not null, created_by int8, last_modified_by int8, primary key (id));
create table multiple_choice_exercise (id int8 not null, created_date timestamp, last_modified_date timestamp, difficulty varchar(255) not null, taskDescription varchar(255) not null, taskName varchar(255) not null, created_by int8, last_modified_by int8, primary key (id));
create table multiple_choice_exercise_answer (id int8 not null, created_date timestamp, last_modified_date timestamp, awarded_points int4, created_by int8, last_modified_by int8, quiz_answer_id int8, multiple_choice_answer_result varchar(255), multiple_choice_exercise_id int8 not null, primary key (id));
create table multiple_choice_exercise_answer_choice (multiple_choice_exercise_answer_id int8 not null, choice_id int8 not null, primary key (multiple_choice_exercise_answer_id, choice_id));
create table password_reset_token (id int8 not null, expiry_date timestamp, token_value varchar(255) not null, account_id int8 not null, primary key (id));
create table privilege (id int8 not null, description varchar(255), name varchar(255) not null, primary key (id));
create table query_result (id int8 not null, query_result json, primary key (id));
create table quiz (id int8 not null, created_date timestamp, last_modified_date timestamp, description varchar(255), difficulty varchar(255), title varchar(255) not null, created_by int8, last_modified_by int8, primary key (id));
create table quiz_answer (id int8 not null, created_date timestamp, last_modified_date timestamp, created_by int8, last_modified_by int8, answeredQuiz_id int8 not null, primary key (id));
create table quiz_exercise (quiz_id int8 not null, exercise_id int8 not null, index int4 not null, primary key (quiz_id, index));
create table role (id int8 not null, created_date timestamp, last_modified_date timestamp, name varchar(255) not null, created_by int8, last_modified_by int8, primary key (id));
create table role_privilege (role_id int8 not null, privilege_id int8 not null);
create table sample_query (id int8 not null, created_date timestamp, last_modified_date timestamp, error_message varchar(255), execution_time float8 not null, query_status varchar(255) not null, sql_statement varchar(255) not null, created_by int8, last_modified_by int8, query_result_id int8, primary key (id));
create table sandbox_query (id int8 not null, created_date timestamp, last_modified_date timestamp, error_message varchar(255), execution_time float8 not null, query_status varchar(255) not null, sql_statement varchar(255) not null, created_by int8, last_modified_by int8, primary key (id));
create table sql_comparison_result (id int8 not null, processing_time int8, sql_comparison_result_status varchar(255), primary key (id));
create table statement_exercise (id int8 not null, created_date timestamp, last_modified_date timestamp, difficulty varchar(255) not null, taskDescription varchar(255) not null, taskName varchar(255) not null, created_by int8, last_modified_by int8, hint varchar(255), max_rows int4, query_timeout int4, sample_query_solution_id int8, primary key (id));
create table statement_exercise_answer (id int8 not null, created_date timestamp, last_modified_date timestamp, awarded_points int4, created_by int8, last_modified_by int8, quiz_answer_id int8, exercise_query_id int8 not null, sql_comparison_result_id int8, statement_exercise_id int8 not null, primary key (id));
alter table if exists account add constraint UK_q0uja26qgu1atulenwup9rxyr unique (email);
alter table if exists privilege add constraint UK_h7iwbdg4ev8mgvmij76881tx8 unique (name);
alter table if exists role add constraint UK_8sewwnpamngi6b1dwaa88askk unique (name);
alter table if exists statement_exercise_answer add constraint UK_4sg6vuse2v5un10w672jw99ec unique (exercise_query_id);
alter table if exists account_activation_token add constraint FK_3k9dh6a0n15s88o9clwr3rcvh foreign key (account_id) references account;
alter table if exists account_role add constraint FKrs2s3m3039h0xt8d5yhwbuyam foreign key (role_id) references role;
alter table if exists account_role add constraint FK1f8y4iy71kb1arff79s71j0dh foreign key (account_id) references account;
alter table if exists choice add constraint FK7lmnmoxjo0ensvmslviuowejm foreign key (multiple_choice_exercise_id) references multiple_choice_exercise;
alter table if exists exercise_query add constraint FK_b0cic57uogadgg2q18i1w5uc2 foreign key (created_by) references account;
alter table if exists exercise_query add constraint FK_b7cvgbodpf4sja3n4uk524384 foreign key (last_modified_by) references account;
alter table if exists multiple_choice_exercise add constraint FK_nwhdmwylby6rx1l3uav9k39wt foreign key (created_by) references account;
alter table if exists multiple_choice_exercise add constraint FK_b23om69aqum7x8bxpl2r42ja6 foreign key (last_modified_by) references account;
alter table if exists multiple_choice_exercise_answer add constraint FK6re3i82gp6pvvfnme5yy1d9pr foreign key (multiple_choice_exercise_id) references multiple_choice_exercise on delete cascade;
alter table if exists multiple_choice_exercise_answer add constraint FK_astb5vccd5g05ix33q4q378uf foreign key (created_by) references account;
alter table if exists multiple_choice_exercise_answer add constraint FK_cvg6kjfqbkhw8le2obf8tk4hk foreign key (last_modified_by) references account;
alter table if exists multiple_choice_exercise_answer add constraint FK_kfe3bi3dfv85m0a7i7d5up5i4 foreign key (quiz_answer_id) references quiz_answer;
alter table if exists multiple_choice_exercise_answer_choice add constraint FKatfh4k5pr9neq7hbkob4j2f66 foreign key (choice_id) references choice;
alter table if exists multiple_choice_exercise_answer_choice add constraint FKa6jhn8s2pvdlsymu60f9n3m1 foreign key (multiple_choice_exercise_answer_id) references multiple_choice_exercise_answer;
alter table if exists password_reset_token add constraint FK_qm42b3i63ge5g0a4fb20vdrnw foreign key (account_id) references account;
alter table if exists quiz add constraint FKmj10t5764u0r45n6lkwwdym96 foreign key (created_by) references account;
alter table if exists quiz add constraint FK2na2kxhxxwggvfp5apxkw68o5 foreign key (last_modified_by) references account;
alter table if exists quiz_answer add constraint FKohoscp33ljymyxcjy8numw9tu foreign key (created_by) references account;
alter table if exists quiz_answer add constraint FK6mduogt3ycxr2jljnu14t5ymh foreign key (last_modified_by) references account;
alter table if exists quiz_answer add constraint FKo7tpwlcf656abn09bfywx72jm foreign key (answeredQuiz_id) references quiz;
alter table if exists quiz_exercise add constraint FKg3pxcalqhk47sjegmi6fhiax4 foreign key (quiz_id) references quiz;
alter table if exists role add constraint FKv0ruhrra489cqn3may1psymd foreign key (created_by) references account;
alter table if exists role add constraint FK98n2d2m0q4mx3s1ele7ktr05f foreign key (last_modified_by) references account;
alter table if exists role_privilege add constraint FKdkwbrwb5r8h74m1v7dqmhp99c foreign key (privilege_id) references privilege;
alter table if exists role_privilege add constraint FKsykrtrdngu5iexmbti7lu9xa foreign key (role_id) references role;
alter table if exists sample_query add constraint FKa5cc3n7jytoyssluefh1cdigg foreign key (query_result_id) references query_result;
alter table if exists sample_query add constraint FK_eisqsfrbpcnj0wu1n2rs8llm2 foreign key (created_by) references account;
alter table if exists sample_query add constraint FK_ii760wwv65m3wyt6dcv94iplu foreign key (last_modified_by) references account;
alter table if exists sandbox_query add constraint FK_j1vaqoryaub0oa5iv0fwft4qf foreign key (created_by) references account;
alter table if exists sandbox_query add constraint FK_2i2t887b9powesi1vol46482x foreign key (last_modified_by) references account;
alter table if exists statement_exercise add constraint FKlpfum3oxnp54g1txseguxcre8 foreign key (sample_query_solution_id) references sample_query;
alter table if exists statement_exercise add constraint FK_ba66cj2b2orp1qxo59cvvr8fy foreign key (created_by) references account;
alter table if exists statement_exercise add constraint FK_lb9hfi6svvyod2osdx12sa8p0 foreign key (last_modified_by) references account;
alter table if exists statement_exercise_answer add constraint FKfnffy0u9pea1qix9q3ssm68wu foreign key (exercise_query_id) references exercise_query;
alter table if exists statement_exercise_answer add constraint FK935c15j6afutg9g7jruvgnhh7 foreign key (sql_comparison_result_id) references sql_comparison_result;
alter table if exists statement_exercise_answer add constraint FKmmlyx4xc749ehh76sppn7ebta foreign key (statement_exercise_id) references statement_exercise on delete cascade;
alter table if exists statement_exercise_answer add constraint FK_btkbjki0vwtnm1h4mrkuboc8d foreign key (created_by) references account;
alter table if exists statement_exercise_answer add constraint FK_ntp9bvt70wemt4dnfjaa0pegi foreign key (last_modified_by) references account;
alter table if exists statement_exercise_answer add constraint FK_afnuo23qwmy747kleeu3fq8y1 foreign key (quiz_answer_id) references quiz_answer;
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