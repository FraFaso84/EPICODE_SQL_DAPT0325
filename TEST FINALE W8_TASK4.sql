use toys_group;

-- ESERCIZIO 1 verifica PK delle tabelle implementate
-- Tabella Category
select CategoryID,
	count(*) as conta_quante
    from category
    group by CategoryID
    having count(*) > 1; -- se non da risultati è PK
-- Tabella Product
select ProductID,
	count(ProductID) as quantità_di_prodotti
    from Product
    group by ProductID; -- se ogni prodotto = 1 allora PK
-- Tabella Sales
select distinct orderID
    from Sales
    order by orderID asc; -- se numero di risultati = numero di righe della tabella è PK, distinct mostra solo valori diversi, order by li ordina in ascendente 
-- Tabella Region
select distinct regionID
    from Region;
-- Tabella State
select distinct StateID
    from state;


-- ESERCIZIO 2 Esporre l’elenco delle transazioni indicando nel result set il codice documento, la data, il nome del
-- prodotto, la categoria del prodotto, il nome dello stato, il nome della regione di vendita e un campo
-- booleano valorizzato in base alla condizione che siano passati più di 180 giorni dalla data vendita o
-- meno (>180 -> True, <= 180 --> False)

select
		s.OrderID,
        s.OrderDate,
        p.ProductName,
        c.NameCategory,
        st.StateName,
        r.RegionName,
        IF(DATEDIFF(CURDATE(), OrderDate) > 180, 'TRUE', 'FALSE') AS Oltre180Giorni
FROM sales s
join Product p 
on s.ProductID=p.ProductID
join Category c
on p.CategoryID=c.CategoryID
join Region r
on s.RegionID=r.RegionID
join State st
on r.StateID=st.StateID;

-- 3) Esporre l’elenco dei prodotti che hanno venduto, in totale, una quantità maggiore della media delle
-- vendite realizzate nell’ultimo anno censito. (ogni valore della condizione deve risultare da una query e
-- non deve essere inserito a mano). Nel result set devono comparire solo il codice prodotto e il totale
-- venduto.

select 
    s.ProductID,
    COUNT(*) as TotaleVendite
from sales s
group by s.ProductID
having COUNT(*) > (
					select 
							avg(VenditePerProdotto)
					from		(select 
									s2.ProductID, 
									COUNT(*) as VenditePerProdotto
								from sales s2
								where year(s2.OrderDate) = year(curdate())
								group by s2.ProductID
								) as MediaUltimoAnno
					)
order by TotaleVendite desc;



-- 4) Esporre l’elenco dei soli prodotti venduti e per ognuno di questi il fatturato totale per anno.

select
		p.ProductName,
        sum(s.price) as Fatturato,
        YEAR(s.OrderDate) as Anno
from sales s
join product p
on s.productID=p.productID
group by 
p.ProductName,
YEAR(s.OrderDate)
order by Anno desc, Fatturato desc;


-- 5) Esporre il fatturato totale per stato per anno. Ordina il risultato per data e per fatturato decrescente.

select
		st.StateName,
        sum(s.price) as Fatturato,
        year(s.OrderDate) as Anno
from sales s
join product p
on s.productID=p.productID
join Region r
on s.RegionID=r.RegionID
join State st
on r.StateID=st.StateID
group by 
st.StateName,
YEAR(s.OrderDate)
order by Anno desc, Fatturato desc;


-- 6) Rispondere alla seguente domanda: qual è la categoria di articoli maggiormente richiesta dal mercato?

select
		c.NameCategory,
        count(*) as n°_PezziVenduti
from sales s
join product p
on s.productID=p.productID
join Category c
on p.CategoryID=c.CategoryID
group by 
c.NameCategory
order by n°_PezziVenduti desc;


-- 7) Rispondere alla seguente domanda: quali sono i prodotti invenduti? Proponi due approcci risolutivi
-- differenti.
select
		s.orderID,
        p.productID,
        ProductName
from product p
left join sales s
on p.productID=s.productID
where orderID is null
order by orderID;

select 
    ProductID,
    ProductName
from Product
where ProductID not in (
						select distinct ProductID 
                        from Sales
						);

-- 8) Creare una vista sui prodotti in modo tale da esporre una “versione denormalizzata” delle informazioni
-- utili (codice prodotto, nome prodotto, nome categoria)
create view Prodotti as (
select
		p.productID as CodiceProdotto,
        p.ProductName as NomeProdotto,
        c.NameCategory as NomeCategoria
from Product p
join Category c
on p.CategoryID=c.CategoryID
order by productID);


-- 9) Creare una vista per le informazioni geografiche
    
create view InfoGeo as (
select
		r.RegionName as AreaGeografica,
        st.StateName as NomeStato,
        st.StateID as CodiceStato
from Region r
join State st
on r.StateID=st.StateID
order by r.RegionName asc);

select * from infogeo 
    
    