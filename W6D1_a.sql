show databases;
use AdventureWorksDW;
show tables;
select * from dimproduct;
select ProductKey, ProductAlternateKey, EnglishProductName, Color, StandardCost, FinishedGoodsFlag from dimproduct;
select ProductKey, ProductAlternateKey, EnglishProductName, Color, StandardCost, FinishedGoodsFlag from dimproduct where FinishedGoodsFlag = 1
