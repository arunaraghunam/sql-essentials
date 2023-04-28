DROP TABLE IF EXISTS products.products;
DROP TABLE IF EXISTS products.categories;
DROP SCHEMA IF EXISTS products;

-- create the products schema

GO
CREATE SCHEMA products;
GO

-- CREATE TABLE FOR Two trees product data

CREATE TABLE products.products(
SKU CHAR(7) NOT NULL PRIMARY KEY,
ProductName CHAR(50) NOT NULL,
CategoryID INT,
Size INT,
Price DECIMAL(5,2) NOT NULL
);

-- Create a table for Two trees category data

CREATE TABLE products.categories (
CategoryID INT PRIMARY KEY,
CategoryDescription CHAR(50),
ProductLine CHAR(25)
);

-- Add data to product table

INSERT INTO [products].[products]
           ([SKU]
           ,[ProductName]
           ,[CategoryID]
           ,[Size]
           ,[Price])
     VALUES
           ('FCP008', 'First Cold Press', 1, 8, 8.99),
		   ('BI008', 'Basil-Infused EVO', 2, 8, 10.99),
		   ('GI016', 'Garlic-Infused EVO', 2, 16, 15.99),
		   ('OGEC004', 'Olive Glow Eye Cream', 3, 4, 18.99)
GO

INSERT INTO [products].[categories]
           ([CategoryID]
           ,[CategoryDescription]
           ,[ProductLine])
     VALUES
           (1, 'Olive Oils', 'Gormet Chef'),
		   (2, 'Flavor Infused Oils', 'Gormet Chef'),
		   (3, 'Bath and Beauty', 'Cosmetics')
		   ;
GO

select * from products.products
select * from products.categories