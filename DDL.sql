CREATE DATABASE STORE;
USE STORE;


CREATE TABLE Dim_Date(
    date_key INT PRIMARY KEY,
    full_date DATE,
    day_of_week TINYINT,
    day_num_in_month TINYINT,
    day_num_overall INT,
    day_name VARCHAR(9),
    day_abbrev CHAR(3),
    weekday_flag CHAR(7),
    week_num_in_year TINYINT,
    week_num_overall INT,
    week_begin_date DATE,
    week_begin_date_key INT,
    month TINYINT,
    month_num_overall INT,
    month_name VARCHAR(9),
    month_abbrev VARCHAR(3),
    quarter TINYINT,
    year INT,
    yearmo INT,
    fiscal_month TINYINT,
    fiscal_quarter TINYINT,
    fiscal_year INT,
    last_day_in_month_flag ENUM('Not Month End', 'Month End'),
    same_day_year_ago_date DATE
);

CREATE TABLE Dim_Customer(
	SK_Customer INT AUTO_INCREMENT PRIMARY KEY,
    Customer_ID VARCHAR(8),
    Customer_Name VARCHAR(255), 
    Segment VARCHAR(50),
    Timestamp DATETIME
);

CREATE TABLE Dim_Product(
	SK_Product INT AUTO_INCREMENT PRIMARY KEY,
    Product_ID VARCHAR(15),
    Product_Name VARCHAR(255),
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Timestamp DATETIME
);

CREATE TABLE Dim_Order(
	SK_Order INT AUTO_INCREMENT PRIMARY KEY,
    Order_ID VARCHAR(14), 
    Ship_Mode VARCHAR(50),
    Timestamp DATETIME
);

CREATE TABLE Dim_Location(
	SK_Location INT AUTO_INCREMENT PRIMARY KEY,
    Country VARCHAR(50), 
    Region VARCHAR(10),
    State VARCHAR(50),
    City VARCHAR(255),
    Postal_Code INT,
    Timestamp DATETIME
);

-- TABLA DE HECHOS
CREATE TABLE Sales_Fact(
    SK_Customer INT NOT NULL REFERENCES Dim_Customer(SK_Customer), 
    SK_Product INT NOT NULL REFERENCES Dim_Product(SK_Product),
    SK_Order INT NOT NULL REFERENCES Dim_Order(SK_Order),
    SK_Location INT NOT NULL REFERENCES Dim_Location(SK_Location),
    SK_Order_Date INT NOT NULL REFERENCES Dim_Date(date_key),
    SK_Ship_Date INT NOT NULL REFERENCES Dim_Date(date_key),
    Row_ID INT,
    Sales DECIMAL(18,2) DEFAULT NULL,
    Quantity INT DEFAULT NULL,
    Discount DECIMAL(18,2) DEFAULT NULL,
    Profit DECIMAL(18,2) DEFAULT NULL  
);


-- TABLA DE STAGING (script generado por Tableau)
CREATE TABLE `sales_staging` (
  `Row_ID` bigint DEFAULT NULL,
  `Order_ID` text,
  `Order_Date` datetime DEFAULT NULL,
  `Ship_Date` datetime DEFAULT NULL,
  `Ship_Mode` text,
  `Customer_ID` text,
  `Customer_Name` text,
  `Segment` text,
  `Country` text,
  `City` text,
  `State` text,
  `Postal_Code` bigint DEFAULT NULL,
  `Region` text,
  `Product_ID` text,
  `Product_Name` text,
  `Category` text,
  `Sub_Category` text,
  `Sales` double DEFAULT NULL,
  `Quantity` bigint DEFAULT NULL,
  `Discount` double DEFAULT NULL,
  `Profit` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
