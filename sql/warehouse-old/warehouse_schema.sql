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


-- Customer
--DimCustomer
-- CREATE EXTERNAL TABLE [asb].DimCustomer
-- (
-- 	[CustomerKey] [int]  NOT NULL,
-- 	[GeographyKey] [int] NOT NULL,
-- 	[CustomerLabel] [nvarchar](100) NOT NULL,
-- 	[Title] [nvarchar](8) NULL,
-- 	[FirstName] [nvarchar](50) NULL,
-- 	[MiddleName] [nvarchar](50) NULL,
-- 	[LastName] [nvarchar](50) NULL,
-- 	[NameStyle] [bit] NULL,
-- 	[BirthDate] [datetime] NULL,
-- 	[MaritalStatus] [nchar](1) NULL,
-- 	[Suffix] [nvarchar](10) NULL,
-- 	[Gender] [nvarchar](1) NULL,
-- 	[EmailAddress] [nvarchar](50) NULL,
-- 	[YearlyIncome] [money] NULL,
-- 	[TotalChildren] [tinyint] NULL,
-- 	[NumberChildrenAtHome] [tinyint] NULL,
-- 	[Education] [nvarchar](40) NULL,
-- 	[Occupation] [nvarchar](100) NULL,
-- 	[HouseOwnerFlag] [nchar](1) NULL,
-- 	[NumberCarsOwned] [tinyint] NULL,
-- 	[AddressLine1] [nvarchar](120) NULL,
-- 	[AddressLine2] [nvarchar](120) NULL,
-- 	[Phone] [nvarchar](20) NULL,
-- 	[DateFirstPurchase] [datetime] NULL,
-- 	[CustomerType] [nvarchar](15) NULL,
-- 	[CompanyName] [nvarchar](100) NULL,
-- 	[ETLLoadID] [int] NULL,
-- 	[LoadDate] [datetime] NULL,
-- 	[UpdateDate] [datetime] NULL
-- )

-- Time
-- CREATE EXTERNAL TABLE [asb].DimDate
-- (
-- 	[Datekey] [datetime] NOT NULL,
-- 	[FullDateLabel] [nvarchar](20) NOT NULL,
-- 	[DateDescription] [nvarchar](20) NOT NULL,
-- 	[CalendarYear] [int] NOT NULL,
-- 	[CalendarYearLabel] [nvarchar](20) NOT NULL,
-- 	[CalendarHalfYear] [int] NOT NULL,
-- 	[CalendarHalfYearLabel] [nvarchar](20) NOT NULL,
-- 	[CalendarQuarter] [int] NOT NULL,
-- 	[CalendarQuarterLabel] [nvarchar](20) NULL,
-- 	[CalendarMonth] [int] NOT NULL,
-- 	[CalendarMonthLabel] [nvarchar](20) NOT NULL,
-- 	[CalendarWeek] [int] NOT NULL,
-- 	[CalendarWeekLabel] [nvarchar](20) NOT NULL,
-- 	[CalendarDayOfWeek] [int] NOT NULL,
-- 	[CalendarDayOfWeekLabel] [nvarchar](10) NOT NULL,
-- 	[FiscalYear] [int] NOT NULL,
-- 	[FiscalYearLabel] [nvarchar](20) NOT NULL,
-- 	[FiscalHalfYear] [int] NOT NULL,
-- 	[FiscalHalfYearLabel] [nvarchar](20) NOT NULL,
-- 	[FiscalQuarter] [int] NOT NULL,
-- 	[FiscalQuarterLabel] [nvarchar](20) NOT NULL,
-- 	[FiscalMonth] [int] NOT NULL,
-- 	[FiscalMonthLabel] [nvarchar](20) NOT NULL,
-- 	[IsWorkDay] [nvarchar](20) NOT NULL,
-- 	[IsHoliday] [int] NOT NULL,
-- 	[HolidayName] [nvarchar](20) NOT NULL,
-- 	[EuropeSeason] [nvarchar](50) NULL,
-- 	[NorthAmericaSeason] [nvarchar](50) NULL,
-- 	[AsiaSeason] [nvarchar](50) NULL
-- )


-- Artikel Erweiterungen
-- CREATE EXTERNAL TABLE [asb].DimProduct (
-- 	[ProductKey] [int] NOT NULL,
-- 	[ProductLabel] [nvarchar](255) NULL,
-- 	[ProductName] [nvarchar](500) NULL,
-- 	[ProductDescription] [nvarchar](400) NULL,
-- 	[ProductSubcategoryKey] [int] NULL,
-- 	[Manufacturer] [nvarchar](50) NULL,
-- 	[BrandName] [nvarchar](50) NULL,
-- 	[ClassID] [nvarchar](10) NULL,
-- 	[ClassName] [nvarchar](20) NULL,
-- 	[StyleID] [nvarchar](10) NULL,
-- 	[StyleName] [nvarchar](20) NULL,
-- 	[ColorID] [nvarchar](10) NULL,
-- 	[ColorName] [nvarchar](20) NOT NULL,
-- 	[Size] [nvarchar](50) NULL,
-- 	[SizeRange] [nvarchar](50) NULL,
-- 	[SizeUnitMeasureID] [nvarchar](20) NULL,
-- 	[Weight] [float] NULL,
-- 	[WeightUnitMeasureID] [nvarchar](20) NULL,
-- 	[UnitOfMeasureID] [nvarchar](10) NULL,
-- 	[UnitOfMeasureName] [nvarchar](40) NULL,
-- 	[StockTypeID] [nvarchar](10) NULL,
-- 	[StockTypeName] [nvarchar](40) NULL,
-- 	[UnitCost] [money] NULL,
-- 	[UnitPrice] [money] NULL,
-- 	[AvailableForSaleDate] [datetime] NULL,
-- 	[StopSaleDate] [datetime] NULL,
-- 	[Status] [nvarchar](7) NULL,
-- 	[ImageURL] [nvarchar](150) NULL,
-- 	[ProductURL] [nvarchar](150) NULL,
-- 	[ETLLoadID] [int] NULL,
-- 	[LoadDate] [datetime] NULL,
-- 	[UpdateDate] [datetime] NULL
-- )

--DimProductCategory
-- CREATE EXTERNAL TABLE [asb].DimProductCategory (
-- 	[ProductCategoryKey] [int]  NOT NULL,
-- 	[ProductCategoryLabel] [nvarchar](100) NULL,
-- 	[ProductCategoryName] [nvarchar](30) NOT NULL,
-- 	[ProductCategoryDescription] [nvarchar](50) NOT NULL,
-- 	[ETLLoadID] [int] NULL,
-- 	[LoadDate] [datetime] NULL,
-- 	[UpdateDate] [datetime] NULL
-- )

-- CREATE EXTERNAL TABLE [asb].DimPromotion (
-- 	[PromotionKey] [int]  NOT NULL,
-- 	[PromotionLabel] [nvarchar](100) NULL,
-- 	[PromotionName] [nvarchar](100) NULL,
-- 	[PromotionDescription] [nvarchar](255) NULL,
-- 	[DiscountPercent] [float] NULL,
-- 	[PromotionType] [nvarchar](50) NULL,
-- 	[PromotionCategory] [nvarchar](50) NULL,
-- 	[StartDate] [datetime] NOT NULL,
-- 	[EndDate] [datetime] NULL,
-- 	[MinQuantity] [int] NULL,
-- 	[MaxQuantity] [int] NULL,
-- 	[ETLLoadID] [int] NULL,
-- 	[LoadDate] [datetime] NULL,
-- 	[UpdateDate] [datetime] NULL
-- )


-- Filiale
-- CREATE EXTERNAL TABLE [asb].DimStore
-- (
-- 	[StoreKey] [int] NOT NULL,
-- 	[GeographyKey] [int] NOT NULL,
-- 	[StoreManager] [int] NULL,
-- 	[StoreType] [nvarchar](15) NULL,
-- 	[StoreName] [nvarchar](100) NOT NULL,
-- 	[StoreDescription] [nvarchar](300) NOT NULL,
-- 	[Status] [nvarchar](20) NOT NULL,
-- 	[OpenDate] [datetime] NOT NULL,
-- 	[CloseDate] [datetime] NULL,
-- 	[EntityKey] [int] NULL,
-- 	[ZipCode] [nvarchar](20) NULL,
-- 	[ZipCodeExtension] [nvarchar](10) NULL,
-- 	[StorePhone] [nvarchar](15) NULL,
-- 	[StoreFax] [nvarchar](14) NULL,
-- 	[AddressLine1] [nvarchar](100) NULL,
-- 	[AddressLine2] [nvarchar](100) NULL,
-- 	[CloseReason] [nvarchar](20) NULL,
-- 	[EmployeeCount] [int] NULL,
-- 	[SellingAreaSize] [float] NULL,
-- 	[LastRemodelDate] [datetime] NULL,
-- 	[GeoLocation]	NVARCHAR(50)  NULL,
-- 	[Geometry]		NVARCHAR(50) NULL,
-- 	[ETLLoadID] [int] NULL,
-- 	[LoadDate] [datetime] NULL,
-- 	[UpdateDate] [datetime] NULL
-- )

-- Absatz
-- CREATE EXTERNAL TABLE [asb].FactSales
-- (
-- 	[SalesKey] [int]  NOT NULL,
-- 	[DateKey] [datetime] NOT NULL,
-- 	[channelKey] [int] NOT NULL,
-- 	[StoreKey] [int] NOT NULL,
-- 	[ProductKey] [int] NOT NULL,
-- 	[PromotionKey] [int] NOT NULL,
-- 	[CurrencyKey] [int] NOT NULL,
-- 	[UnitCost] [money] NOT NULL,
-- 	[UnitPrice] [money] NOT NULL,
-- 	[SalesQuantity] [int] NOT NULL,
-- 	[ReturnQuantity] [int] NOT NULL,
-- 	[ReturnAmount] [money] NULL,
-- 	[DiscountQuantity] [int] NULL,
-- 	[DiscountAmount] [money] NULL,
-- 	[TotalCost] [money] NOT NULL,
-- 	[SalesAmount] [money] NOT NULL,
-- 	[ETLLoadID] [int] NULL,
-- 	[LoadDate] [datetime] NULL,
-- 	[UpdateDate] [datetime] NULL
-- )


-- --FactSalesQuota
-- CREATE EXTERNAL TABLE [asb].FactSalesQuota (
-- 	[SalesQuotaKey] [int]  NOT NULL,
-- 	[ChannelKey] [int] NOT NULL,
-- 	[StoreKey] [int] NOT NULL,
-- 	[ProductKey] [int] NOT NULL,
-- 	[DateKey] [datetime] NOT NULL,
-- 	[CurrencyKey] [int] NOT NULL,
-- 	[ScenarioKey] [int] NOT NULL,
-- 	[SalesQuantityQuota] [money] NOT NULL,
-- 	[SalesAmountQuota] [money] NOT NULL,
-- 	[GrossMarginQuota] [money] NOT NULL,
-- 	[ETLLoadID] [int] NULL,
-- 	[LoadDate] [datetime] NULL,
-- 	[UpdateDate] [datetime] NULL
-- )

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
