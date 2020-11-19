Drop DATABASE if exists warehouse;

CREATE DATABASE warehouse
	ENCODING = 'UTF8'
	LC_COLLATE = 'en_US.utf8'
	LC_CTYPE = 'en_US.utf8'
	TABLESPACE = pg_default
	OWNER = postgres;

\c warehouse

-- object: public."Articles" | type: TABLE --
-- DROP TABLE IF EXISTS public."Articles" CASCADE;
CREATE TABLE Articles (
	AId varchar(8) NOT NULL,
	AName varchar,
	Weight decimal,
	CONSTRAINT "Article_pk" PRIMARY KEY (AId)

);
-- ddl-end --
ALTER TABLE Articles OWNER TO postgres;
-- ddl-end --

-- object: public."StorageUnits" | type: TABLE --
-- DROP TABLE IF EXISTS public."StorageUnits" CASCADE;
CREATE TABLE StorageUnits (
	SUId varchar(8) NOT NULL,
	AId varchar(8),
	Quantity smallint,
	StoLId varchar(8),
	CONSTRAINT "StorageUnit_pk" PRIMARY KEY (SUId)

);
-- ddl-end --
ALTER TABLE StorageUnits OWNER TO postgres;
-- ddl-end --

-- object: public."StorageLocations" | type: TABLE --
-- DROP TABLE IF EXISTS public."StorageLocations" CASCADE;
CREATE TABLE StorageLocations (
	StoLId varchar(8) NOT NULL,
	Position integer,
	StoSId varchar(8),
	CONSTRAINT "StorageLocation_pk" PRIMARY KEY (StoLId)

);
-- ddl-end --
ALTER TABLE StorageLocations OWNER TO postgres;
-- ddl-end --

-- object: public."StorageLocationSpecifications" | type: TABLE --
-- DROP TABLE IF EXISTS public."StorageLocationSpecifications" CASCADE;
CREATE TABLE StorageLocationSpecifications (
	StoSId varchar(8) NOT NULL,
	Length integer,
	Width integer,
	Height integer,
	MaxWeight integer,
	CONSTRAINT "StorageLocationSpecification_pk" PRIMARY KEY (StoSId)

);
-- ddl-end --
ALTER TABLE StorageLocationSpecifications OWNER TO postgres;
-- ddl-end --

-- object: public."Compatibilities" | type: TABLE --
-- DROP TABLE IF EXISTS public."Compatibilities" CASCADE;
CREATE TABLE Compatibilities (
	AId varchar(8) NOT NULL,
	StoLId varchar(8) NOT NULL,
	CONSTRAINT "Compatibility_pk" PRIMARY KEY (AId,StoLId)

);
-- ddl-end --
ALTER TABLE Compatibilities OWNER TO postgres;
-- ddl-end --

-- object: "Articles_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Compatibilities" DROP CONSTRAINT IF EXISTS "Articles_fk" CASCADE;
ALTER TABLE Compatibilities ADD CONSTRAINT "Articles_fk" FOREIGN KEY (AId)
REFERENCES Articles (AId) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE
DEFERRABLE INITIALLY DEFERRED;
-- ddl-end --

-- object: "StorageLocations_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Compatibilities" DROP CONSTRAINT IF EXISTS "StorageLocations_fk" CASCADE;
ALTER TABLE Compatibilities ADD CONSTRAINT "StorageLocations_fk" FOREIGN KEY (StoLId)
REFERENCES StorageLocations (StoLId) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE
DEFERRABLE INITIALLY DEFERRED;
-- ddl-end --

-- object: "Articles_fk" | type: CONSTRAINT --
-- ALTER TABLE public."StorageUnits" DROP CONSTRAINT IF EXISTS "Articles_fk" CASCADE;
ALTER TABLE StorageUnits ADD CONSTRAINT "Articles_fk" FOREIGN KEY (AId)
REFERENCES Articles (AId) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE
DEFERRABLE INITIALLY DEFERRED;
-- ddl-end --

-- object: "StorageLocations_fk" | type: CONSTRAINT --
-- ALTER TABLE public."StorageUnits" DROP CONSTRAINT IF EXISTS "StorageLocations_fk" CASCADE;
ALTER TABLE StorageUnits ADD CONSTRAINT "StorageLocations_fk" FOREIGN KEY (StoLId)
REFERENCES StorageLocations (StoLId) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE
DEFERRABLE INITIALLY DEFERRED;
-- ddl-end --

-- object: "StorageLocationSpecifications_fk" | type: CONSTRAINT --
-- ALTER TABLE public."StorageLocations" DROP CONSTRAINT IF EXISTS "StorageLocationSpecifications_fk" CASCADE;
ALTER TABLE StorageLocations ADD CONSTRAINT "StorageLocationSpecifications_fk" FOREIGN KEY (StoSId)
REFERENCES StorageLocationSpecifications (StoSId) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE
DEFERRABLE INITIALLY DEFERRED;
-- ddl-end --
