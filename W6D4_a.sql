 
show tables;

select * from dimproduct;
select * from dimproductsubcategory;
select * from dimproductcategory;


#1) Esponi lʼanagrafica dei prodotti indicando per ciascun prodotto anche la sua sottocategoria (DimProduct, DimProductSubcategory).
select dp.EnglishProductName, dps.EnglishProductSubcategoryName
from dimproduct as dp 
left join dimproductsubcategory as dps
	on dp.ProductSubcategoryKey = dps.ProductSubcategoryKey;

#2) Esponi lʼanagrafica dei prodotti indicando per ciascun prodotto la sua sottocategoria e la sua categoria 
#(DimProduct, DimProductSubcategory, DimProductCategory).
#ESERCIZIO CON JOIN:
select dp.EnglishProductName, dpc.EnglishProductCategoryName, dps.EnglishProductSubcategoryName
from dimproductsubcategory as dps 
left join dimproductcategory as dpc
	on dps.ProductcategoryKey = dpc.ProductcategoryKey
right join dimproduct as dp
	on dps.ProductSubcategoryKey = dp.ProductSubcategoryKey;
    
#3) Esponi lʼelenco dei soli prodotti venduti (DimProduct, FactResellerSales).
select distinct dp.EnglishProductName
from dimproduct as dp 
inner join factresellersales as frs
	on dp.ProductKey = frs.ProductKey;

#4) Esponi lʼelenco dei prodotti non venduti 
#(considera i soli prodotti finiti cioè quelli per i quali il campo FinishedGoodsFlag è uguale a 1).
select distinct EnglishProductName from dimproduct 
where ProductKey 
	not in (select ProductKey from factresellersales) 
	and FinishedGoodsFlag = 1;

#5) Esponi lʼelenco delle transazioni di vendita (FactResellerSales) indicando anche il nome del prodotto venduto (DimProduct)
select distinct dp.EnglishProductName, frs.*
from factresellersales as frs 
left join dimproduct as dp
	on  frs.ProductKey = dp.ProductKey
    where frs.SalesOrderNumber is not null
    
    
    



