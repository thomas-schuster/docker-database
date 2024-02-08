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
CREATE DATABASE new_database;
-- ddl-end --


-- object: mondial_wh | type: SCHEMA --
-- DROP SCHEMA IF EXISTS mondial_wh CASCADE;
CREATE SCHEMA mondial_wh;
-- ddl-end --
ALTER SCHEMA mondial_wh OWNER TO postgres;
-- ddl-end --

SET search_path TO pg_catalog,public,mondial_wh;
-- ddl-end --

-- object: mondial_wh."Article" | type: TABLE --
-- DROP TABLE IF EXISTS mondial_wh."Article" CASCADE;
CREATE TABLE mondial_wh."Article" (
	"ArticleId" varchar(8) NOT NULL,
	"GTIN" text,
	"ArticleName" varchar,
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
ALTER TABLE mondial_wh."Article" OWNER TO postgres;
-- ddl-end --

-- object: mondial_wh."Sales" | type: TABLE --
-- DROP TABLE IF EXISTS mondial_wh."Sales" CASCADE;
CREATE TABLE mondial_wh."Sales" (
	"ArticleId" varchar(8) NOT NULL,
	"TimeId" varchar(8) NOT NULL,
	"StoreId" varchar(8) NOT NULL,
	"CustomerId" varchar(8) NOT NULL,
	"SalesVolume" decimal(24),
	"Amount" smallint,
	CONSTRAINT "Sales_pk" PRIMARY KEY ("ArticleId","TimeId","StoreId","CustomerId")
);
-- ddl-end --
ALTER TABLE mondial_wh."Sales" OWNER TO postgres;
-- ddl-end --

-- object: mondial_wh."Time" | type: TABLE --
-- DROP TABLE IF EXISTS mondial_wh."Time" CASCADE;
CREATE TABLE mondial_wh."Time" (
	"TimeId" varchar(8) NOT NULL,
	"FullDateLabel" date NOT NULL,
	"DateDescription" text,
	"CalendarYear" smallint NOT NULL,
	"CalendarYearLabel" text,
	"CalendarHalfYear" smallint,
	"CalendarHalfYearLabel" text,
	"CalendarQuarter" smallint NOT NULL,
	"CalendarQuarterLabel" text,
	"CalendarMonth" smallint NOT NULL,
	"CalendarMonthLabel" text,
	"CalendarWeek" smallint NOT NULL,
	"CalendarWeekLabel" text,
	"CalendarDay" smallint NOT NULL,
	"CalendarDayLabel" text,
	"CalendarDayOfWeek" smallint NOT NULL,
	"CalendarDayOfWeekLabel" text,
	"FiscalYear" smallint,
	"FiscalYearLabel" text,
	"FiscalHalfYear" smallint,
	"FiscalHalfYearLabel" text,
	"FiscalQuarter" smallint,
	"FiscalQuarterLabel" text,
	"FiscalMonth" smallint,
	"FiscalMonthLabel" text,
	"IsWorkDay" bit NOT NULL,
	"IsHoliday" bit NOT NULL,
	"HolidayName" text,
	"EuropeSeason" text,
	CONSTRAINT "TimeId_pk" PRIMARY KEY ("TimeId")
);
-- ddl-end --
ALTER TABLE mondial_wh."Time" OWNER TO postgres;
-- ddl-end --

-- object: mondial_wh."Customer" | type: TABLE --
-- DROP TABLE IF EXISTS mondial_wh."Customer" CASCADE;
CREATE TABLE mondial_wh."Customer" (
	"CustomerId" varchar(8) NOT NULL,
	"Group" varchar(16),
	"Title" varchar(6),
	"FirstName" text,
	"MiddleName" text,
	"LastName" text,
	"BirthDate" date,
	"Age" smallint,
	"Gender" varchar(1),
	"EductationLevel" text,
	"MartialStatus" bit,
	"Children" bit,
	"NumberOfChildren" smallint,
	"NumberOfChildrenAtHome" smallint,
	"YearlyIncome" decimal(16),
	"Occupation" text,
	"HouseOwnerFlag" bit,
	"CarOwnerFlag" bit,
	"EmailAdress" varchar(32),
	"Phone" varchar(32),
	"AdressLine1" varchar(32),
	"AdressLine2" varchar(32),
	"ZIP" smallint,
	"City" text,
	"FirstPurchaseDate" date,
	"LastPurchaseDate" date,
	"TotalSpent" decimal(16),
	"CustomerType" text,
	CONSTRAINT "CustomerId_pk" PRIMARY KEY ("CustomerId")
);
-- ddl-end --
ALTER TABLE mondial_wh."Customer" OWNER TO postgres;
-- ddl-end --

-- object: mondial_wh."Location" | type: TABLE --
-- DROP TABLE IF EXISTS mondial_wh."Location" CASCADE;
CREATE TABLE mondial_wh."Location" (
	"StoreId" varchar(8) NOT NULL,
	"StoreManagerId" varchar(8),
	"StoreManagerName" text,
	"StoreType" text,
	"StoreName" varchar(32),
	"Status" text,
	"OpenDate" date,
	"CloseDate" date,
	"StorePhone" varchar(32),
	"StoreFax" varchar(32),
	"AdressLine1" text,
	"AdressLine2" text,
	"ZIP" smallint,
	"City" varchar(32),
	"Country" varchar(32),
	"CloseReason" text,
	"EmployeeCount" smallint,
	"SellingSizeArea" float,
	"LastRemodelDate" date,
	"MaxDailyCustomerCountRecorded" smallint,
	"AvgDailyCustomerCountRecorded" smallint,
	CONSTRAINT "StoreId_pk" PRIMARY KEY ("StoreId")
);
-- ddl-end --
ALTER TABLE mondial_wh."Location" OWNER TO postgres;
-- ddl-end --

-- object: "ArticleId_fk" | type: CONSTRAINT --
-- ALTER TABLE mondial_wh."Sales" DROP CONSTRAINT IF EXISTS "ArticleId_fk" CASCADE;
ALTER TABLE mondial_wh."Sales" ADD CONSTRAINT "ArticleId_fk" FOREIGN KEY ("ArticleId")
REFERENCES mondial_wh."Article" ("ArticleId") MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: "TimeId_fk" | type: CONSTRAINT --
-- ALTER TABLE mondial_wh."Sales" DROP CONSTRAINT IF EXISTS "TimeId_fk" CASCADE;
ALTER TABLE mondial_wh."Sales" ADD CONSTRAINT "TimeId_fk" FOREIGN KEY ("TimeId")
REFERENCES mondial_wh."Time" ("TimeId") MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: "CustomerId_fk" | type: CONSTRAINT --
-- ALTER TABLE mondial_wh."Sales" DROP CONSTRAINT IF EXISTS "CustomerId_fk" CASCADE;
ALTER TABLE mondial_wh."Sales" ADD CONSTRAINT "CustomerId_fk" FOREIGN KEY ("CustomerId")
REFERENCES mondial_wh."Customer" ("CustomerId") MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: "StoreId_fk" | type: CONSTRAINT --
-- ALTER TABLE mondial_wh."Sales" DROP CONSTRAINT IF EXISTS "StoreId_fk" CASCADE;
ALTER TABLE mondial_wh."Sales" ADD CONSTRAINT "StoreId_fk" FOREIGN KEY ("StoreId")
REFERENCES mondial_wh."Location" ("StoreId") MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


