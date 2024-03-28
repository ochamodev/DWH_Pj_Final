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


CREATE TABLE Dim_Client(
	SK_Customer INT AUTO_INCREMENT PRIMARY KEY,
    Customer_ID VARCHAR(8),
    Customer_Name VARCHAR(255), 
    Segment VARCHAR(50),
    Timestamp DATETIME
);


CREATE TABLE Dim_Product(
	SK_Producto INT AUTO_INCREMENT PRIMARY KEY,
    Product_ID VARCHAR(15),
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Product_Name VARCHAR(255),
    Timestamp DATETIME
);


CREATE TABLE Dim_Order(
	SK_Pedido INT AUTO_INCREMENT PRIMARY KEY,
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


-- FALTA TABLA DE HECHOS
-- Aun no la he hecho porque queria implementar de alguna manera lo de las slow changing dimensions. 
-- La opcion que se miraba mas entendible era una SCD - Tipo 2, pero no se que piensan los demas