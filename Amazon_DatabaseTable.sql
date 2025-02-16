-- Data Definition Language
-- 1) Creating a Database
-- Create a database named 'Amazon_DB'
CREATE DATABASE Amazon_DB;

-- Switch to the new database
USE Amazon_DB;

SHOW DATABASES;

-- 2) Creating Tables
-- Create a table named 'Users'

CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,           -- Cannot be NULL
    email VARCHAR(150) UNIQUE NOT NULL,   -- Must be unique
    registered_date DATE NOT NULL,        -- Default to today's date
    membership ENUM('Basic', 'Prime') DEFAULT 'Basic'   -- Optional
);
SELECT * from Users;

-- 1) Insert 
-- Insert a single row into the 'Users' table
INSERT INTO Users (name, email, registered_date, membership)
VALUES 
('Alice Johnson', 'alice.j@example.com', '2024-01-15', 'Prime'),
('Bob Smith', 'bob.s@example.com', '2024-02-01', 'Basic'),
('Charlie Brown', 'charlie.b@example.com', '2024-03-10', 'Prime'),
('Daisy Ridley', 'daisy.r@example.com', '2024-04-12', 'Basic');

SELECT * from Users;

CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(200) NOT NULL,           -- Cannot be NULL
    price DECIMAL(10, 2) NOT NULL,        -- Cannot be NULL
    category VARCHAR(100) NOT NULL,       -- Cannot be NULL
    stock INT NOT NULL                    -- Cannot be NULL
);

INSERT INTO Products (name, price, category, stock)
VALUES 
('Echo Dot', 49.99, 'Electronics', 120),
('Kindle Paperwhite', 129.99, 'Books', 50),
('Fire Stick', 39.99, 'Electronics', 80),
('Yoga Mat', 19.99, 'Fitness', 200),
('Wireless Mouse', 24.99, 'Electronics', 150);

SELECT * from Products;

CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,   -- Cannot be NULL, but referenced as a foreign key
    order_date DATE NOT NULL,              -- Cannot be NULL
    total_amount DECIMAL(10, 2) NOT NULL,  -- Cannot be NULL
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

INSERT INTO Orders (user_id, order_date, total_amount) 
VALUES 
(1, '2024-05-01', 79.98),
(2, '2024-05-03', 129.99),
(1, '2024-05-04', 49.99),
(3, '2024-05-05', 24.99);

SELECT * from Orders;

CREATE TABLE Order_Details (
    order_details_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,   -- Cannot be NULL, but referenced as a foreign key
    product_id INT, -- Cannot be NULL, but referenced as a foreign key
    quantity INT NOT NULL,                -- Cannot be NULL
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Order_Details (order_id, product_id, quantity) VALUES
(1, 1, 2),
(2, 2, 1),
(3, 1, 1),
(4, 5, 1);

SELECT * from Orders;

CREATE TABLE Product_Ratings (
    rating_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    rating DECIMAL(3, 2) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Product_Ratings (product_id, rating)
VALUES 
(1, 4.5),
(1, 4.7),
(2, 3.8),
(3, 4.2),
(4, 4.0),
(5, 4.3);

