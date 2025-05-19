
-- Drop tables if they exist to avoid errors
DROP TABLE IF EXISTS BrandDiscountMapping;
DROP TABLE IF EXISTS BrandProductMapping;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Brand;
DROP TABLE IF EXISTS ProductType;


-- 1. ProductType Table
CREATE TABLE ProductType (
    ProductTypeID INTEGER PRIMARY KEY,
    ProductTypeName TEXT
);

INSERT INTO ProductType (ProductTypeID, ProductTypeName) VALUES
(1, 'Electronics'),
(2, 'Grocery'),
(3, 'Bakery');

-- 2. Brand Table
CREATE TABLE Brand (
    BrandID INTEGER PRIMARY KEY,
    BrandName TEXT
);

INSERT INTO Brand (BrandID, BrandName) VALUES
(1, 'LG'),
(2, 'Panasonic'),
(3, 'Britannia'),
(4, 'Balaji'),
(5, 'Amul'),
(6, 'Lays');

-- 3. Product Table
CREATE TABLE Product (
    ProductID INTEGER PRIMARY KEY,
    ProductName TEXT,
    ProductTypeID INTEGER,
    FOREIGN KEY (ProductTypeID) REFERENCES ProductType(ProductTypeID)
);

INSERT INTO Product (ProductID, ProductName, ProductTypeID) VALUES
(1, 'AC', 1),
(2, 'TV', 1),
(3, 'Wafers', 2),
(4, 'Butter', 2),
(5, 'Milk', 2),
(6, 'Bread', 3),
(7, 'Chips', 2),
(8, 'Fan', 1),
(9, 'Cheese', 2),
(10, 'Cake', 3);

-- 4. BrandProductMapping Table
CREATE TABLE BrandProductMapping (
    MappingID INTEGER PRIMARY KEY,
    ProductID INTEGER,
    BrandID INTEGER,
    ActualPrice REAL,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY (BrandID) REFERENCES Brand(BrandID)
);

INSERT INTO BrandProductMapping (MappingID, ProductID, BrandID, ActualPrice) VALUES
(1, 1, 2, 50000),
(2, 1, 1, 30000),
(3, 3, 4, 300),
(4, 3, 6, 20),
(5, 5, 5, 28),
(6, 6, 3, 25),
(7, 2, 1, 40000),
(8, 8, 2, 2500),
(9, 9, 5, 50),
(10, 10, 3, 120);



-- 5. BrandDiscountMapping Table
CREATE TABLE BrandDiscountMapping (
    MappingID INTEGER PRIMARY KEY,
    BrandProductMappingID INTEGER,
    DiscountPercent REAL,
    StartDate TEXT,
    EndDate TEXT,
    FOREIGN KEY (BrandProductMappingID) REFERENCES BrandProductMapping(MappingID)
);

INSERT INTO BrandDiscountMapping (MappingID, BrandProductMappingID, DiscountPercent, StartDate, EndDate) VALUES
(1, 4, 5.00, '2025-05-16', '2025-05-20'),
(2, 3, 2.00, '2025-05-16', NULL),
(3, 2, 3.50, '2025-05-15', '2025-05-30'),
(4, 10, 10.00, '2025-05-10', '2025-05-25'),
(5, 5, 4.00, '2025-05-17', NULL);



