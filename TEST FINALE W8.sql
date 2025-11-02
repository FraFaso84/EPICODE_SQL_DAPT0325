-- CASE STUDY, TASK1(progettazione concettuale in excalidraw, diagramma allegato come file) , TASK2, TASK3

create database Toys_Group;
use Toys_Group;

create table Category
(CategoryID int auto_increment primary key
, NameCategory varchar(100)
);

create table Product 
(ProductID int auto_increment primary key
, ProductName varchar(100)
, Unitcost decimal(10,2)
, CategoryID int
, foreign key(CategoryID) references Category(CategoryID) 
);

create table State
(StateID int auto_increment primary key
, StateName varchar(100)
);

create table Region
(RegionID int auto_increment primary key
, RegionName varchar(100)
, StateID int
,foreign key(StateID) references State(StateID)
);


create table sales 
(OrderID int auto_increment primary key
, OrderDate varchar(10)
, Price decimal(10,2)
, ProductID int
, RegionID int
, foreign key(ProductID) references Product(ProductID)
, foreign key(RegionID) references Region(RegionID)
);

alter table sales
modify OrderDate date;

insert into Category (NameCategory) values
('Guanti'),
('Bicilette'),
('Accessori');

select * from sales;

insert into Product (ProductName, Unitcost, CategoryID) values
('RedBike60', 400, 2),
('RedBike80', 420, 2),
('GreenBike80', 432, 2),
('GreyBike80', 432, 2),
('SuperBike110', 550, 2),
('SuperBike80', 560, 2),
('Wintergloves S', 22, 1),
('Wintergloves M', 22.5, 1),
('Wintergloves L', 24, 1),
('Wintergloves XL', 26, 1),
('Supergloves M', 15, 1),
('Wiregloves L', 20, 1),
('SteelGloveUltra L', 30, 1),
('Fanalino', 9.90, 3),
('Dinamo M', 10, 3),
('Specchietto', 5.50, 3),
('ManubrioPelle', 12, 3),
('ManubrioPelleRossa', 12, 3),
('ManubrioPelleBianca', 12, 3),
('Sellino', 25, 3);

insert into State (StateName) values
('Italia'),
('Francia'),
('Germania'),
('Grecia'),
('Spagna'),
('Portogallo'),
('Paesi Bassi'),
('Svezia'),
('Polonia'),
('Ungheria');

insert into Region (RegionName, StateID) values
('SouthEurope', 1),
('SouthEurope', 4),
('WestEurope', 2),
('WestEurope', 3),  
('NorthEurope', 8),   
('CentralEurope', 9), 
('CentralEurope', 10),
('Iberia', 5),        
('Iberia', 6),        
('LowCountries', 7);  

insert into sales (OrderDate, Price, ProductID, RegionID) values
('2025-01-12', 54.20, 5, 1),
('2025-01-27', 122.90, 8, 3),
('2025-02-04', 19.99, 12, 2),
('2025-02-18', 85.70, 4, 5),
('2025-03-03', 199.90, 17, 3),
('2025-03-12', 49.99, 9, 4),
('2025-03-25', 75.00, 14, 2),
('2025-04-07', 22.45, 3, 1),
('2025-04-19', 189.00, 20, 4),
('2025-04-30', 12.99, 6, 5),
('2025-05-09', 215.50, 2, 3),
('2025-05-17', 44.10, 13, 1),
('2025-05-28', 88.20, 10, 5),
('2025-06-04', 72.40, 15, 4),
('2025-06-13', 115.00, 18, 2),
('2025-06-22', 33.33, 11, 5),
('2025-07-01', 48.50, 7, 3),
('2025-07-09', 156.25, 16, 1),
('2025-07-17', 92.80, 19, 2),
('2025-07-24', 27.60, 1, 4),
('2025-08-01', 41.90, 5, 5),
('2025-08-09', 63.75, 9, 2),
('2025-08-17', 177.99, 3, 3),
('2025-08-26', 132.00, 8, 4),
('2025-09-02', 84.60, 12, 5),
('2025-09-10', 47.30, 6, 1),
('2025-09-18', 166.40, 20, 2),
('2025-09-25', 91.00, 4, 5),
('2025-10-02', 13.90, 10, 3),
('2025-10-07', 208.00, 18, 4),
('2025-10-11', 57.45, 11, 1),
('2025-10-14', 39.99, 2, 2),
('2025-10-17', 99.10, 14, 5),
('2025-10-20', 25.50, 13, 3),
('2025-10-23', 220.00, 19, 2),
('2025-10-25', 72.90, 7, 4),
('2025-10-27', 18.60, 1, 1),
('2025-10-28', 134.40, 5, 3),
('2025-10-29', 244.99, 9, 2),
('2025-10-29', 89.00, 16, 5),
('2025-10-30', 29.99, 3, 1),
('2025-10-30', 66.10, 8, 4),
('2025-10-31', 118.50, 12, 2),
('2025-10-31', 104.70, 15, 3),
('2025-11-01', 11.99, 20, 5),
('2025-11-01', 185.80, 14, 1),
('2025-11-01', 49.90, 6, 2),
('2025-11-01', 77.77, 19, 4),
('2025-11-01', 59.99, 2, 3),
('2025-11-01', 127.50, 17, 1);


insert into sales (OrderDate, Price, ProductID, RegionID) values
('2023-01-12', 145.90, 4, 1),
('2023-02-03', 89.99, 8, 3),
('2023-03-17', 72.50, 15, 2),
('2023-04-05', 199.00, 12, 4),
('2023-05-23', 38.75, 9, 2),
('2023-06-14', 212.30, 18, 1),
('2023-07-08', 54.10, 2, 5),
('2023-08-29', 127.90, 7, 4),
('2023-10-11', 98.45, 16, 3),
('2023-12-22', 65.80, 5, 2),
('2024-01-05', 110.20, 14, 1),
('2024-02-18', 189.90, 20, 4),
('2024-03-30', 44.50, 1, 3),
('2024-04-12', 139.80, 3, 5),
('2024-05-25', 76.40, 10, 2),
('2024-07-07', 94.70, 17, 3),
('2024-09-19', 55.55, 6, 1),
('2024-10-02', 215.00, 11, 4),
('2024-11-10', 183.60, 13, 5),
('2024-12-27', 149.99, 19, 2);

insert into Product (ProductName, Unitcost, CategoryID) values
('Summergloves S', 18, 1),
('Summergloves M', 19, 1),
('Summergloves L', 20, 1),
('CityBike50', 380, 2),
('CityBike80', 430, 2),
('ElectricBike100', 780, 2),
('ElectricBikePro', 920, 2),
('CatenaCarbon', 35, 3),
('FaroLEDUltra', 15, 3),
('SupportoSmartphone', 9.90, 3);
