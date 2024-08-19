-- Database Schema
-- create tables for Customers, Deliveries, Orders, OrderItems
CREATE DATABASE IF NOT EXISTS capstone_db;

USE capstone_db;

-- create Customers table
CREATE TABLE IF NOT EXISTS Customers (
	CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerName VARCHAR(255) NOT NULL,
    City VARCHAR(100),
    Country VARCHAR(100),
    PostalCode VARCHAR(20),
    CountryCode VARCHAR(10)
);

-- create the Deliveries table
CREATE TABLE IF NOT EXISTS Deliveries (
	DeliveryID INT AUTO_INCREMENT PRIMARY KEY,
    DeliveryDate DATE,
    Cost DECIMAL(10, 2),
    Sales DECIMAL(10, 2),
    DeliveryCost DECIMAL(10, 2),
    Discount DECIMAL(10, 2),
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- create Orders table
CREATE TABLE IF NOT EXISTS Orders (
	OrderId INT AUTO_INCREMENT PRIMARY KEY,
    DeliveryID INT,
    CourseName VARCHAR(255),
    CuisineName VARCHAR(255),
    StarterName VARCHAR(255),
    DessertName VARCHAR(255),
    Drink VARCHAR(255),
    Sides VARCHAR(255),
    FOREIGN KEY (DeliveryID) REFERENCES Deliveries(DeliveryID)
);

-- create the OrderItems table
CREATE TABLE IF NOT EXISTS OrderItems (
	OrderItemID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);