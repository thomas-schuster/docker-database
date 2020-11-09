CREATE DATABASE testdb;
\c testdb;

-- object: public."Articles" | type: TABLE --
-- DROP TABLE IF EXISTS public."Articles" CASCADE;
CREATE TABLE public."Articles" (
	"AId" varchar(8) NOT NULL,
	"AName" varchar,
	"Weight" decimal,
	CONSTRAINT "Article_pk" PRIMARY KEY ("AId")

);
-- ddl-end --
ALTER TABLE public."Articles" OWNER TO postgres;
-- ddl-end --

-- object: public."StorageUnits" | type: TABLE --
-- DROP TABLE IF EXISTS public."StorageUnits" CASCADE;
CREATE TABLE public."StorageUnits" (
	"SUId" varchar(8) NOT NULL,
	"AId" varchar(8),
	"Quantity" smallint,
	"StoLId" varchar(8),
	CONSTRAINT "StorageUnit_pk" PRIMARY KEY ("SUId")

);
-- ddl-end --
ALTER TABLE public."StorageUnits" OWNER TO postgres;
-- ddl-end --

-- object: public."StorageLocations" | type: TABLE --
-- DROP TABLE IF EXISTS public."StorageLocations" CASCADE;
CREATE TABLE public."StorageLocations" (
	"StoLId" varchar(8) NOT NULL,
	"Position" integer,
	"StoSId" varchar(8),
	CONSTRAINT "StorageLocation_pk" PRIMARY KEY ("StoLId")

);
-- ddl-end --
ALTER TABLE public."StorageLocations" OWNER TO postgres;
-- ddl-end --

-- object: public."StorageLocationSpecifications" | type: TABLE --
-- DROP TABLE IF EXISTS public."StorageLocationSpecifications" CASCADE;
CREATE TABLE public."StorageLocationSpecifications" (
	"StoSId" varchar(8) NOT NULL,
	"Length" integer,
	"Width" integer,
	"Height" integer,
	"MaxWeight" integer,
	CONSTRAINT "StorageLocationSpecification_pk" PRIMARY KEY ("StoSId")

);
-- ddl-end --
ALTER TABLE public."StorageLocationSpecifications" OWNER TO postgres;
-- ddl-end --

-- object: public."Compatibilities" | type: TABLE --
-- DROP TABLE IF EXISTS public."Compatibilities" CASCADE;
CREATE TABLE public."Compatibilities" (
	"AId" varchar(8) NOT NULL,
	"StoLId" varchar(8) NOT NULL,
	CONSTRAINT "Compatibility_pk" PRIMARY KEY ("AId","StoLId")

);
-- ddl-end --
ALTER TABLE public."Compatibilities" OWNER TO postgres;
-- ddl-end --

-- object: "Articles_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Compatibilities" DROP CONSTRAINT IF EXISTS "Articles_fk" CASCADE;
ALTER TABLE public."Compatibilities" ADD CONSTRAINT "Articles_fk" FOREIGN KEY ("AId")
REFERENCES public."Articles" ("AId") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "StorageLocations_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Compatibilities" DROP CONSTRAINT IF EXISTS "StorageLocations_fk" CASCADE;
ALTER TABLE public."Compatibilities" ADD CONSTRAINT "StorageLocations_fk" FOREIGN KEY ("StoLId")
REFERENCES public."StorageLocations" ("StoLId") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Articles_fk" | type: CONSTRAINT --
-- ALTER TABLE public."StorageUnits" DROP CONSTRAINT IF EXISTS "Articles_fk" CASCADE;
ALTER TABLE public."StorageUnits" ADD CONSTRAINT "Articles_fk" FOREIGN KEY ("AId")
REFERENCES public."Articles" ("AId") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "StorageLocations_fk" | type: CONSTRAINT --
-- ALTER TABLE public."StorageUnits" DROP CONSTRAINT IF EXISTS "StorageLocations_fk" CASCADE;
ALTER TABLE public."StorageUnits" ADD CONSTRAINT "StorageLocations_fk" FOREIGN KEY ("StoLId")
REFERENCES public."StorageLocations" ("StoLId") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "StorageLocationSpecifications_fk" | type: CONSTRAINT --
-- ALTER TABLE public."StorageLocations" DROP CONSTRAINT IF EXISTS "StorageLocationSpecifications_fk" CASCADE;
ALTER TABLE public."StorageLocations" ADD CONSTRAINT "StorageLocationSpecifications_fk" FOREIGN KEY ("StoSId")
REFERENCES public."StorageLocationSpecifications" ("StoSId") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --