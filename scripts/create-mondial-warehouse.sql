-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler version: 1.0.2
-- PostgreSQL version: 15.0
-- Project Site: pgmodeler.io
-- Model Author: ---
-- Database creation must be performed outside a multi lined SQL file. 
-- These commands were put in this file only as a convenience.
-- 
-- object: new_database | type: DATABASE --
-- DROP DATABASE IF EXISTS new_database;
-- CREATE DATABASE mondial_warehouse;

-- ddl-end --
-- object: mondial_warehouse | type: SCHEMA --
-- DROP SCHEMA IF EXISTS mondial_warehouse CASCADE;
CREATE SCHEMA mondial_warehouse;

-- ddl-end --
ALTER SCHEMA mondial_warehouse OWNER TO postgres;

-- ddl-end --
SET
	search_path TO pg_catalog,
	public,
	mondial_warehouse;

-- ddl-end --
-- object: mondial_warehouse."Article" | type: TABLE --
-- DROP TABLE IF EXISTS mondial_warehouse."Article" CASCADE;
CREATE TABLE
	mondial_warehouse."Article" (
		"ArticleId" varchar(8) NOT NULL,
		"Name" varchar,
		"Weight" decimal,
		"Description" varchar(256),
		"Manufacturer" varchar(32),
		"Brand" varchar(32),
		"ProductGroup" varchar(32),
		"Width" decimal(16),
		"Length" decimal(16),
		"Height" decimal(16),
		"Volume" decimal(16) GENERATED ALWAYS AS (Width * Length * Height) STORED,
		"SizeMeasure" text,
		"UnitCost" decimal(16),
		"UnitPrice" decimal(16),
		"AvailableSince" date,
		"SaleStoppedSince" date,
		CONSTRAINT "ArticleId_pk" PRIMARY KEY ("ArticleId")
	);

-- ddl-end --
ALTER TABLE mondial_warehouse."Article" OWNER TO postgres;

-- ddl-end --
-- object: mondial_warehouse."Sales" | type: TABLE --
-- DROP TABLE IF EXISTS mondial_warehouse."Sales" CASCADE;
CREATE TABLE
	mondial_warehouse."Sales" (
		"ArticleId" varchar(8) NOT NULL,
		"TimeId" varchar(8) NOT NULL,
		"StoreId" varchar(8) NOT NULL,
		"CustomerId" varchar(8) NOT NULL,
		"SalesVolume" decimal(24),
		"Amount" smallint,
		CONSTRAINT "Sales_pk" PRIMARY KEY ("ArticleId", "TimeId", "StoreId", "CustomerId")
	);

-- ddl-end --
ALTER TABLE mondial_warehouse."Sales" OWNER TO postgres;

-- ddl-end --
-- object: mondial_warehouse."Time" | type: TABLE --
-- DROP TABLE IF EXISTS mondial_warehouse."Time" CASCADE;
CREATE TABLE
	mondial_warehouse."Time" (
		"TimeId" varchar(8) NOT NULL,
		"Timestamp" timestamp,
		CONSTRAINT "TimeId_pk" PRIMARY KEY ("TimeId")
	);

-- ddl-end --
ALTER TABLE mondial_warehouse."Time" OWNER TO postgres;

-- ddl-end --
-- object: mondial_warehouse."Customer" | type: TABLE --
-- DROP TABLE IF EXISTS mondial_warehouse."Customer" CASCADE;
CREATE TABLE
	mondial_warehouse."Customer" (
		"CustomerId" varchar(8) NOT NULL,
		"Name" varchar(32),
		"Group" varchar(16),
		CONSTRAINT "CustomerId_pk" PRIMARY KEY ("CustomerId")
	);

-- ddl-end --
ALTER TABLE mondial_warehouse."Customer" OWNER TO postgres;

-- ddl-end --
-- object: mondial_warehouse."Location" | type: TABLE --
-- DROP TABLE IF EXISTS mondial_warehouse."Location" CASCADE;
CREATE TABLE
	mondial_warehouse."Location" (
		"StoreId" varchar(8) NOT NULL,
		"Name" varchar(32),
		"City" varchar(32),
		"Countrz" varchar(32),
		CONSTRAINT "StoreId_pk" PRIMARY KEY ("StoreId")
	);

-- ddl-end --
ALTER TABLE mondial_warehouse."Location" OWNER TO postgres;

-- ddl-end --
-- object: "ArticleId_fk" | type: CONSTRAINT --
-- ALTER TABLE mondial_warehouse."Sales" DROP CONSTRAINT IF EXISTS "ArticleId_fk" CASCADE;
ALTER TABLE mondial_warehouse."Sales" ADD CONSTRAINT "ArticleId_fk" FOREIGN KEY ("ArticleId") REFERENCES mondial_warehouse."Article" ("ArticleId") MATCH SIMPLE ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ddl-end --
-- object: "TimeId_fk" | type: CONSTRAINT --
-- ALTER TABLE mondial_warehouse."Sales" DROP CONSTRAINT IF EXISTS "TimeId_fk" CASCADE;
ALTER TABLE mondial_warehouse."Sales" ADD CONSTRAINT "TimeId_fk" FOREIGN KEY ("TimeId") REFERENCES mondial_warehouse."Time" ("TimeId") MATCH SIMPLE ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ddl-end --
-- object: "CustomerId_fk" | type: CONSTRAINT --
-- ALTER TABLE mondial_warehouse."Sales" DROP CONSTRAINT IF EXISTS "CustomerId_fk" CASCADE;
ALTER TABLE mondial_warehouse."Sales" ADD CONSTRAINT "CustomerId_fk" FOREIGN KEY ("CustomerId") REFERENCES mondial_warehouse."Customer" ("CustomerId") MATCH SIMPLE ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ddl-end --
-- object: "StoreId_fk" | type: CONSTRAINT --
-- ALTER TABLE mondial_warehouse."Sales" DROP CONSTRAINT IF EXISTS "StoreId_fk" CASCADE;
ALTER TABLE mondial_warehouse."Sales" ADD CONSTRAINT "StoreId_fk" FOREIGN KEY ("StoreId") REFERENCES mondial_warehouse."Location" ("StoreId") MATCH SIMPLE ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ddl-end --