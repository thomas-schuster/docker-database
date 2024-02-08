-- Populate "Article" table
INSERT INTO mondial_wh."Article" ("ArticleId", "GTIN", "ArticleName", "Weight", "Description", "Manufacturer", "Brand", "ProductGroup", "Width", "Length", "Height", "SizeMeasure", "UnitCost", "UnitPrice", "AvailableSince", "SaleStoppedSince")
VALUES
  ('ART1', '1234567890123', 'Laptop', 2.5, '15-inch laptop with SSD', 'ABC Electronics', 'XYZ', 'Electronics', 14.5, 9.8, 0.7, 'inches', 500, 699, '2023-01-01', NULL),
  ('ART2', '9876543210987', 'Smartphone', 0.3, '5.5-inch smartphone with OLED display', 'DEF Mobile', 'PQR', 'Electronics', 2.7, 5.9, 0.3, 'inches', 300, 499, '2022-12-01', NULL);

-- Populate "Time" table
INSERT INTO mondial_wh."Time" ("TimeId", "FullDateLabel", "CalendarYear", "CalendarYearLabel", "CalendarQuarter", "CalendarQuarterLabel", "CalendarMonth", "CalendarMonthLabel", "CalendarWeek", "CalendarWeekLabel", "CalendarDay", "CalendarDayLabel", "CalendarDayOfWeek", "CalendarDayOfWeekLabel", "IsWorkDay", "IsHoliday", "HolidayName")
VALUES
  ('20220101', '2022-01-01', 2022, '2022', 1, 'Q1', 1, 'January', 53, 'Week 53', 1, 'Sunday', 7, 'Sunday', 'f', 't', 'New Year'),
  ('20220102', '2022-01-02', 2022, '2022', 1, 'Q1', 1, 'January', 53, 'Week 53', 2, 'Monday', 1, 'Monday', 't', 'f', NULL);

-- Populate "Customer" table
INSERT INTO mondial_wh."Customer" ("CustomerId", "Group", "Title", "FirstName", "LastName", "BirthDate", "Age", "Gender", "EductationLevel", "MartialStatus", "Children", "NumberOfChildren", "NumberOfChildrenAtHome", "YearlyIncome", "Occupation", "HouseOwnerFlag", "CarOwnerFlag", "EmailAdress", "Phone", "AdressLine1", "AdressLine2", "ZIP", "City", "FirstPurchaseDate", "LastPurchaseDate", "TotalSpent", "CustomerType")
VALUES
  ('CUST1', 'Regular', 'Mr', 'John', 'Doe', '1985-05-10', 36, 'M', 'Graduate', 'married', 't', 2, 1, 60000, 'Engineer', 't', 'f', 'john.doe@example.com', '+1234567890', '123 Main St', 'Apt 101', 12345, 'Anytown', '2023-01-15', '2023-12-20', 2500, 'Individual'),
  ('CUST2', 'Regular', 'Ms', 'Jane', 'Smith', '1990-12-15', 31, 'F', 'Graduate', 'single', 'f', 0, 0, 45000, 'Teacher', 'f', 't', 'jane.smith@example.com', '+1987654321', '456 Elm St', NULL, 54321, 'Smallville', '2022-11-05', '2023-09-10', 1800, 'Individual');

-- Populate "Location" table
INSERT INTO mondial_wh."Location" ("StoreId", "StoreManagerId", "StoreManagerName", "StoreType", "StoreName", "Status", "OpenDate", "CloseDate", "StorePhone", "StoreFax", "AdressLine1", "AdressLine2", "ZIP", "City", "Country", "CloseReason", "EmployeeCount", "SellingSizeArea", "LastRemodelDate", "MaxDailyCustomerCountRecorded", "AvgDailyCustomerCountRecorded")
VALUES
  ('STORE1', 'MGR1', 'Alice Johnson', 'Electronics', 'ABC Electronics - Downtown', 'Open', '2020-01-01', NULL, '+1234567890', NULL, '789 Broadway', NULL, 12345, 'Metropolis', 'USA', NULL, 15, 2500, '2019-05-15', 150, 100),
  ('STORE2', 'MGR2', 'Bob Smith', 'Electronics', 'DEF Electronics - Mall', 'Open', '2018-03-10', NULL, '+1987654321', NULL, '456 Elm St', NULL, 54321, 'Smallville', 'USA', NULL, 12, 1800, '2017-07-20', 120, 80);

-- Populate "Sales" table
INSERT INTO mondial_wh."Sales" ("ArticleId", "TimeId", "StoreId", "CustomerId", "SalesVolume", "Amount")
VALUES
  ('ART1', '20220101', 'STORE1', 'CUST1', 10, 6990),
  ('ART2', '20220102', 'STORE2', 'CUST2', 15, 7485);