-- create database
show databases;
create database house_management;
use house_management;

-- Create tables
create table Sellers(SellerID int auto_increment primary key,Name varchar(100),ContactNumber varchar(15));
create table Houses(HouaseID int auto_increment primary key,Address varchar(255),Price decimal(10,2),
SellerID int,Status varchar(50));
create table Buyers(BuyerID int auto_increment primary key,Name varchar(100),ContactNumber varchar(15));
-- insert record into tables
INSERT INTO Sellers (Name, ContactNumber) VALUES ('ishimwe samuel', '0781100341'),
('keza ornella', '0792300341'),('muhire omar', '0722342569');
INSERT INTO Houses (Address, Price, SellerID, Status) VALUES ('musanze', 25000000.00, 1, 'Available'),
('rubavu', 20000000.00, 3, 'Available'),('kicukiro', 55000000.00, 2, 'sold');
INSERT INTO Buyers (Name, ContactNumber) VALUES ('karisa elissa', '0787654321'),
('byukusenge marry', '0737654321'),('kagabo paul', '0787654345');

-- select tables
SELECT * FROM Houses;
SELECT * FROM Sellers WHERE SellerID = 1;
SELECT * FROM Buyers WHERE Name='kagabo paul';

-- Update
UPDATE Houses SET Price = 26000000.00 WHERE HouaseID = 1;
UPDATE Sellers SET ContactNumber = '0782366891' WHERE SellerID = 1;

-- Delete
DELETE FROM Buyers WHERE BuyerID = 1;

SELECT COUNT(*) FROM Houses;  -- Count of houses
SELECT AVG(Price) FROM Houses; -- Average house price
SELECT SUM(Price) FROM Houses; -- Sum of all house prices

-- create view

CREATE VIEW available_houses AS
SELECT * FROM Houses WHERE Status = 'Available';

CREATE VIEW sold_houses AS
SELECT * FROM Houses WHERE Status = 'Sold';

CREATE VIEW buyers_info AS
SELECT * FROM Buyers;

CREATE VIEW houses_by_seller AS
SELECT SellerID, COUNT(HouaseID) AS HouseCount FROM Houses GROUP BY SellerID;

-- create procedure

CREATE PROCEDURE add_seller(seller_name VARCHAR(100), seller_contact VARCHAR(15)
BEGIN
    INSERT INTO Sellers (Name, ContactNumber) VALUES (seller_name, seller_contact);
END;
call add_seller('ishimwe salomon', '0731140347');

CREATE PROCEDURE add_house(house_address VARCHAR(100), house_price DECIMAL(10,2), seller_id INT)
BEGIN
    INSERT INTO Houses (Address, Price, SellerID, Status) VALUES (house_address, house_price, seller_id, 'Available');
END;
call add_seller('nyagatare', 10000000.00, 3, 'sold');
CREATE PROCEDURE add_buyer(buyer_name VARCHAR(100), buyer_contact VARCHAR(15)
BEGIN
    INSERT INTO Buyers (Name, ContactNumber) VALUES (buyer_name, buyer_contact);
END;

CREATE update_house_price(house_id INT, new_price DECIMAL(10,2)
BEGIN
    UPDATE Houses SET Price = '40000000' WHERE HouseID = 3;
END;

CREATE update_seller_contact(seller_id INT, new_contact VARCHAR2)
BEGIN
    UPDATE Sellers SET ContactNumber = 'muhoza aline' WHERE SellerID = 4;
END;

CREATE PROCEDURE delete_house(house_id INT) 
BEGIN
    DELETE FROM Houses WHERE HouseID = 4;
END;

-- create triggers

CREATE TRIGGER after_update_seller
AFTER INSERT ON Sellers
FOR EACH ROW
BEGIN
 UPDATE Sellers SET ContactNumber = '0782366891' WHERE SellerID = 1;
END;


CREATE TRIGGER after_delete_buyer
AFTER INSERT ON Buyers
FOR EACH ROW
BEGIN
     DELETE FROM Buyers WHERE BuyerID = 1;
END;

CREATE OR REPLACE TRIGGER after_update_seller
AFTER UPDATE ON Seller
FOR EACH ROW
BEGIN
   UPDATE Sellers SET ContactNumber = '0782366891' WHERE SellerID = 1;
END;

CREATE OR REPLACE TRIGGER after_update_house
AFTER UPDATE ON House
FOR EACH ROW
BEGIN
     UPDATE Houses SET status = 'sold' WHERE HouasesID = 1;
END;

CREATE OR REPLACE TRIGGER after_update_buyer
AFTER UPDATE ON Buyer
FOR EACH ROW
BEGIN
 UPDATE buyers SET ContactNumber = '0782366891' WHERE BuyerID = 1;
END;
