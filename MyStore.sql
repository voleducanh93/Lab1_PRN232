-- Tạo Database
CREATE DATABASE MyStore;
GO

USE MyStore;
GO

-- Bảng AccountMember
CREATE TABLE AccountMember (
    MemberID NVARCHAR(20) PRIMARY KEY,
    MemberPassword NVARCHAR(80) NOT NULL,
    FullName NVARCHAR(80),
    EmailAddress NVARCHAR(100) NOT NULL,
    MemberRole INT NOT NULL
);
GO

-- Bảng Categories
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    CategoryName NVARCHAR(15) NOT NULL
);
GO

-- Bảng Products
CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName NVARCHAR(40) NOT NULL,
    CategoryID INT NOT NULL,
    UnitsInStock SMALLINT NULL,
    UnitPrice MONEY NULL,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);
GO

  INSERT INTO Categories (CategoryName) VALUES
('Books'),
('Stationery'),
('Electronics');