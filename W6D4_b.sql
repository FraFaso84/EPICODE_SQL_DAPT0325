#1) Esponi lʼelenco delle transazioni di vendita (FactResellerSales) indicando la categoria di appartenenza del prodotto venduto (DimProduct)
select distinct dp.EnglishProductName, dpc.EnglishProductCategoryName, frs.*
from dimproductsubcategory dps 
left join dimproductcategory dpc
	on dps.ProductcategoryKey = dpc.ProductcategoryKey
right join dimproduct dp
	on dps.ProductSubcategoryKey = dp.ProductSubcategoryKey
left join factresellersales frs
	on  dp.ProductKey = frs.ProductKey
    where frs.SalesOrderNumber is not null;
    
#2) esplora tabella Dimreseller   
select * from dimreseller;

#3) esponi in output l'elenco dei reselle indicando per ciascun reseller, la sua area geografica 
select rs.resellername, geo.EnglishCountryRegionName 
from dimreseller rs
join dimgeography geo 
on rs.GeographyKey = geo.GeographyKey;

#4) esponi l'elecno delle transazioni di vendinta. Il result set deve esporre: 
#SalesOrderNumber,SalesOrderLineNumber, OrderDate, UnitPrice, OrderQuantity, TotalProductCost
#EnglishProductName, EnglishCountryRegionName, resellername, EnglishProductCategoryName                 

# tabelle:  dimreseller;dimgeography;dimproductcategory;dimproductsubcategory;dimproduct

Select frs.SalesOrderNumber
, frs.SalesOrderLineNumber
, frs.OrderDate
, frs.UnitPrice
, frs.OrderQuantity
, frs.TotalProductCost
, p.EnglishProductName
, c.EnglishProductCategoryName
, g.EnglishCountryRegionName
, rs.ResellerName
from dimproductcategory c
join dimproductsubcategory sc
on sc.ProductCategoryKey=c.ProductCategoryKey
join dimproduct p
on p.ProductSubCategoryKey=sc.ProductSubCategoryKey
left join factresellersales frs
on p.ProductKey=frs.ProductKey
left join dimreseller rs
on frs.ResellerKey=rs.ResellerKey
left join dimgeography g
on rs.geographykey=g.geographykey