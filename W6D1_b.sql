#Scrivi una nuova query al fine di esporre in output i prodotti il cui codice modello ProductAlternateKey) comincia con FR oppure BK. 
#Il result set deve contenere il codice prodotto ProductKey),il modello, il nome del prodotto, il costo standard StandardCost) e il prezzo di listino ListPrice).

use AdventureWorksDW;
select ProductKey, ModelName, EnglishProductName, StandardCost, ListPrice from dimproduct where ProductAlternateKey like 'FR%' or 'BK%';

#Arricchisci il risultato della query scritta nel passaggio precedente del Markup applicato dallʼazienda ListPrice - StandardCost)

select ProductKey, ModelName, EnglishProductName, StandardCost, ListPrice, ListPrice - StandardCost as Markup from dimproduct where ProductAlternateKey like 'FR%' or 'BK%';