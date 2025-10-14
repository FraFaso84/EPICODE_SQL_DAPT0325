# Scrivi unʼaltra query al fine di esporre lʼelenco dei prodotti finiti il cui prezzo di listino è compreso tra 1000 e 2000.

use AdventureWorksDW;
select EnglishProductName from dimproduct where FinishedGoodsFlag = 1 and StandardCost between 1000 and 2000;

# Esplora la tabella degli impiegati aziendali DimEmployee) 
# Esponi, interrogando la tabella degli impiegati aziendali, lʼelenco dei soli agenti. 
# Gli agenti sono i dipendenti per i quali il campo SalespersonFlag è uguale a 1.

select * from dimemployee where SalesPersonFlag = 1;

# Interroga la tabella delle vendite FactResellerSales). 
# Esponi in output lʼelenco delle transazioni registrate a partire dal 1 gennaio 2020 dei soli codici prodotto: 597, 598, 477, 214. 
# Calcola per ciascuna transazione il profitto SalesAmount - TotalProductCost).

select *, SalesAmount - TotalProductCost as profitto from factresellersales where ProductKey in (597, 598, 477, 214) and OrderDate >= '2020-01-01'

