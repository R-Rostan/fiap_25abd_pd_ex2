use adventureworks;

-- Criando flat table
CREATE TABLE base_unique_sales (
salesorderid int,
orderdate string,
duedate string,
shipdate string,
status int,
salesordernumber string,
customerid int,
shipmethod string,
subtotal decimal(18,2),
taxamt decimal(18,2),
freight decimal(18,2),
totaldue decimal(18,2),
productid int,
productcatetegoryid int,
orderqty int,
unitprice decimal(18,2),
unitpricediscount decimal(18,2),
linetotal decimal(18,2),
ranking_sales_by_productid int,
ranking_sales_by_productcategoryid int,
net decimal(18,2),
net_margin decimal(18,2),
sum_total_due decimal(18,2),
quartile_invoicing int,
rank_invoicing int
)
PARTITIONED BY(city string)
CLUSTERED BY(quartile_invoicing) into 4 buckets
row format delimited fields terminated by ';'
location '/datasets/flattentable/';


-- Adicionando partição
ALTER TABLE base_unique_sales ADD PARTITION(city='Abingdon');
ALTER TABLE base_unique_sales ADD PARTITION(city='Alhambra');
ALTER TABLE base_unique_sales ADD PARTITION(city='Auburn');
ALTER TABLE base_unique_sales ADD PARTITION(city='Camarillo');
ALTER TABLE base_unique_sales ADD PARTITION(city='Cambridge');
ALTER TABLE base_unique_sales ADD PARTITION(city='Cerritos');
ALTER TABLE base_unique_sales ADD PARTITION(city='Culver City');
ALTER TABLE base_unique_sales ADD PARTITION(city='Daly City');
ALTER TABLE base_unique_sales ADD PARTITION(city='El Segundo');
ALTER TABLE base_unique_sales ADD PARTITION(city='Englewood');
ALTER TABLE base_unique_sales ADD PARTITION(city='Fullerton');
ALTER TABLE base_unique_sales ADD PARTITION(city='Gloucestershire');
ALTER TABLE base_unique_sales ADD PARTITION(city='High Wycombe');
ALTER TABLE base_unique_sales ADD PARTITION(city='Las Vegas');
ALTER TABLE base_unique_sales ADD PARTITION(city='Liverpool');
ALTER TABLE base_unique_sales ADD PARTITION(city='London');
ALTER TABLE base_unique_sales ADD PARTITION(city='Maidenhead');
ALTER TABLE base_unique_sales ADD PARTITION(city='Milton Keynes');
ALTER TABLE base_unique_sales ADD PARTITION(city='Oxnard');
ALTER TABLE base_unique_sales ADD PARTITION(city='Oxon');
ALTER TABLE base_unique_sales ADD PARTITION(city='Sandy');
ALTER TABLE base_unique_sales ADD PARTITION(city='Santa Ana');
ALTER TABLE base_unique_sales ADD PARTITION(city='Santa Fe');
ALTER TABLE base_unique_sales ADD PARTITION(city='Sherman Oaks');
ALTER TABLE base_unique_sales ADD PARTITION(city='Union City');
ALTER TABLE base_unique_sales ADD PARTITION(city='Van Nuys');
ALTER TABLE base_unique_sales ADD PARTITION(city='West Sussex');
ALTER TABLE base_unique_sales ADD PARTITION(city='Wokingham');
ALTER TABLE base_unique_sales ADD PARTITION(city='Woolston');


-- Inserindo dados
insert into table base_unique_sales partition(city='Abingdon')     		select 
soh.salesorderid,
soh.orderdate,
soh.duedate,
soh.shipdate,
soh.status,
soh.salesordernumber,
soh.customerid,
soh.shipmethod,
soh.subtotal,
soh.taxamt,
soh.freight,
soh.totaldue,
sod.productid,
tp.productcatetegoryid,
sod.orderqty,
sod.unitprice,
sod.unitpricediscount,
sod.linetotal,
tp.ranking_sales_by_productid,
tp.ranking_sales_by_productcategoryid,
tp.net,
tp.net_margin,
tc.sum_total_due,
tc.quartile_invoicing,
tc.rank_invoicing
from salesorderhead soh 
inner join salesorderdetail sod on sod.salesorderid = soh.salesorderid
inner join topproductsales tp on sod.productid = tp.productid
inner join topcustomersales tc on soh.customerid = tc.customerid where city ='Abingdon';


insert into table base_unique_sales partition(city='Alhambra')     		select 
soh.salesorderid,
soh.orderdate,
soh.duedate,
soh.shipdate,
soh.status,
soh.salesordernumber,
soh.customerid,
soh.shipmethod,
soh.subtotal,
soh.taxamt,
soh.freight,
soh.totaldue,
sod.productid,
tp.productcatetegoryid,
sod.orderqty,
sod.unitprice,
sod.unitpricediscount,
sod.linetotal,
tp.ranking_sales_by_productid,
tp.ranking_sales_by_productcategoryid,
tp.net,
tp.net_margin,
tc.sum_total_due,
tc.quartile_invoicing,
tc.rank_invoicing
from salesorderhead soh 
inner join salesorderdetail sod on sod.salesorderid = soh.salesorderid
inner join topproductsales tp on sod.productid = tp.productid
inner join topcustomersales tc on soh.customerid = tc.customerid where city ='Alhambra';

insert into table base_unique_sales partition(city='Auburn')     		select 
soh.salesorderid,
soh.orderdate,
soh.duedate,
soh.shipdate,
soh.status,
soh.salesordernumber,
soh.customerid,
soh.shipmethod,
soh.subtotal,
soh.taxamt,
soh.freight,
soh.totaldue,
sod.productid,
tp.productcatetegoryid,
sod.orderqty,
sod.unitprice,
sod.unitpricediscount,
sod.linetotal,
tp.ranking_sales_by_productid,
tp.ranking_sales_by_productcategoryid,
tp.net,
tp.net_margin,
tc.sum_total_due,
tc.quartile_invoicing,
tc.rank_invoicing
from salesorderhead soh 
inner join salesorderdetail sod on sod.salesorderid = soh.salesorderid
inner join topproductsales tp on sod.productid = tp.productid
inner join topcustomersales tc on soh.customerid = tc.customerid where city ='Auburn';

insert into table base_unique_sales partition(city='Camarillo')    		select 
soh.salesorderid,
soh.orderdate,
soh.duedate,
soh.shipdate,
soh.status,
soh.salesordernumber,
soh.customerid,
soh.shipmethod,
soh.subtotal,
soh.taxamt,
soh.freight,
soh.totaldue,
sod.productid,
tp.productcatetegoryid,
sod.orderqty,
sod.unitprice,
sod.unitpricediscount,
sod.linetotal,
tp.ranking_sales_by_productid,
tp.ranking_sales_by_productcategoryid,
tp.net,
tp.net_margin,
tc.sum_total_due,
tc.quartile_invoicing,
tc.rank_invoicing
from salesorderhead soh 
inner join salesorderdetail sod on sod.salesorderid = soh.salesorderid
inner join topproductsales tp on sod.productid = tp.productid
inner join topcustomersales tc on soh.customerid = tc.customerid where city ='Camarillo';

insert into table base_unique_sales partition(city='Cambridge')     	select 
soh.salesorderid,
soh.orderdate,
soh.duedate,
soh.shipdate,
soh.status,
soh.salesordernumber,
soh.customerid,
soh.shipmethod,
soh.subtotal,
soh.taxamt,
soh.freight,
soh.totaldue,
sod.productid,
tp.productcatetegoryid,
sod.orderqty,
sod.unitprice,
sod.unitpricediscount,
sod.linetotal,
tp.ranking_sales_by_productid,
tp.ranking_sales_by_productcategoryid,
tp.net,
tp.net_margin,
tc.sum_total_due,
tc.quartile_invoicing,
tc.rank_invoicing
from salesorderhead soh 
inner join salesorderdetail sod on sod.salesorderid = soh.salesorderid
inner join topproductsales tp on sod.productid = tp.productid
inner join topcustomersales tc on soh.customerid = tc.customerid where city ='Cambridge';

insert into table base_unique_sales partition(city='Cerritos')     		select 
soh.salesorderid,
soh.orderdate,
soh.duedate,
soh.shipdate,
soh.status,
soh.salesordernumber,
soh.customerid,
soh.shipmethod,
soh.subtotal,
soh.taxamt,
soh.freight,
soh.totaldue,
sod.productid,
tp.productcatetegoryid,
sod.orderqty,
sod.unitprice,
sod.unitpricediscount,
sod.linetotal,
tp.ranking_sales_by_productid,
tp.ranking_sales_by_productcategoryid,
tp.net,
tp.net_margin,
tc.sum_total_due,
tc.quartile_invoicing,
tc.rank_invoicing
from salesorderhead soh 
inner join salesorderdetail sod on sod.salesorderid = soh.salesorderid
inner join topproductsales tp on sod.productid = tp.productid
inner join topcustomersales tc on soh.customerid = tc.customerid where city ='Cerritos';

insert into table base_unique_sales partition(city='Culver City')     	select 
soh.salesorderid,
soh.orderdate,
soh.duedate,
soh.shipdate,
soh.status,
soh.salesordernumber,
soh.customerid,
soh.shipmethod,
soh.subtotal,
soh.taxamt,
soh.freight,
soh.totaldue,
sod.productid,
tp.productcatetegoryid,
sod.orderqty,
sod.unitprice,
sod.unitpricediscount,
sod.linetotal,
tp.ranking_sales_by_productid,
tp.ranking_sales_by_productcategoryid,
tp.net,
tp.net_margin,
tc.sum_total_due,
tc.quartile_invoicing,
tc.rank_invoicing
from salesorderhead soh 
inner join salesorderdetail sod on sod.salesorderid = soh.salesorderid
inner join topproductsales tp on sod.productid = tp.productid
inner join topcustomersales tc on soh.customerid = tc.customerid where city ='Culver City';

insert into table base_unique_sales partition(city='Daly City')     	select 
soh.salesorderid,
soh.orderdate,
soh.duedate,
soh.shipdate,
soh.status,
soh.salesordernumber,
soh.customerid,
soh.shipmethod,
soh.subtotal,
soh.taxamt,
soh.freight,
soh.totaldue,
sod.productid,
tp.productcatetegoryid,
sod.orderqty,
sod.unitprice,
sod.unitpricediscount,
sod.linetotal,
tp.ranking_sales_by_productid,
tp.ranking_sales_by_productcategoryid,
tp.net,
tp.net_margin,
tc.sum_total_due,
tc.quartile_invoicing,
tc.rank_invoicing
from salesorderhead soh 
inner join salesorderdetail sod on sod.salesorderid = soh.salesorderid
inner join topproductsales tp on sod.productid = tp.productid
inner join topcustomersales tc on soh.customerid = tc.customerid where city ='Daly City';

insert into table base_unique_sales partition(city='El Segundo')     	select 
soh.salesorderid,
soh.orderdate,
soh.duedate,
soh.shipdate,
soh.status,
soh.salesordernumber,
soh.customerid,
soh.shipmethod,
soh.subtotal,
soh.taxamt,
soh.freight,
soh.totaldue,
sod.productid,
tp.productcatetegoryid,
sod.orderqty,
sod.unitprice,
sod.unitpricediscount,
sod.linetotal,
tp.ranking_sales_by_productid,
tp.ranking_sales_by_productcategoryid,
tp.net,
tp.net_margin,
tc.sum_total_due,
tc.quartile_invoicing,
tc.rank_invoicing
from salesorderhead soh 
inner join salesorderdetail sod on sod.salesorderid = soh.salesorderid
inner join topproductsales tp on sod.productid = tp.productid
inner join topcustomersales tc on soh.customerid = tc.customerid where city ='El Segundo';

insert into table base_unique_sales partition(city='Englewood')     	select 
soh.salesorderid,
soh.orderdate,
soh.duedate,
soh.shipdate,
soh.status,
soh.salesordernumber,
soh.customerid,
soh.shipmethod,
soh.subtotal,
soh.taxamt,
soh.freight,
soh.totaldue,
sod.productid,
tp.productcatetegoryid,
sod.orderqty,
sod.unitprice,
sod.unitpricediscount,
sod.linetotal,
tp.ranking_sales_by_productid,
tp.ranking_sales_by_productcategoryid,
tp.net,
tp.net_margin,

tc.sum_total_due,
tc.quartile_invoicing,
tc.rank_invoicing
from salesorderhead soh 
inner join salesorderdetail sod on sod.salesorderid = soh.salesorderid
inner join topproductsales tp on sod.productid = tp.productid
inner join topcustomersales tc on soh.customerid = tc.customerid where city ='Englewood';

insert into table base_unique_sales partition(city='Fullerton')     	select 
soh.salesorderid,
soh.orderdate,
soh.duedate,
soh.shipdate,
soh.status,
soh.salesordernumber,
soh.customerid,
soh.shipmethod,
soh.subtotal,
soh.taxamt,
soh.freight,
soh.totaldue,
sod.productid,
tp.productcatetegoryid,
sod.orderqty,
sod.unitprice,
sod.unitpricediscount,
sod.linetotal,
tp.ranking_sales_by_productid,
tp.ranking_sales_by_productcategoryid,
tp.net,
tp.net_margin,
tc.sum_total_due,
tc.quartile_invoicing,
tc.rank_invoicing
from salesorderhead soh 
inner join salesorderdetail sod on sod.salesorderid = soh.salesorderid
inner join topproductsales tp on sod.productid = tp.productid
inner join topcustomersales tc on soh.customerid = tc.customerid where city ='Fullerton';

insert into table base_unique_sales partition(city='Gloucestershire')  	select 
soh.salesorderid,
soh.orderdate,
soh.duedate,
soh.shipdate,
soh.status,
soh.salesordernumber,
soh.customerid,
soh.shipmethod,
soh.subtotal,
soh.taxamt,
soh.freight,
soh.totaldue,
sod.productid,
tp.productcatetegoryid,
sod.orderqty,
sod.unitprice,
sod.unitpricediscount,
sod.linetotal,
tp.ranking_sales_by_productid,
tp.ranking_sales_by_productcategoryid,
tp.net,
tp.net_margin,
tc.sum_total_due,
tc.quartile_invoicing,
tc.rank_invoicing
from salesorderhead soh 
inner join salesorderdetail sod on sod.salesorderid = soh.salesorderid
inner join topproductsales tp on sod.productid = tp.productid
inner join topcustomersales tc on soh.customerid = tc.customerid where city ='Gloucestershire';

insert into table base_unique_sales partition(city='High Wycombe')     	select 
soh.salesorderid,
soh.orderdate,
soh.duedate,
soh.shipdate,
soh.status,
soh.salesordernumber,
soh.customerid,
soh.shipmethod,
soh.subtotal,
soh.taxamt,
soh.freight,
soh.totaldue,
sod.productid,
tp.productcatetegoryid,
sod.orderqty,
sod.unitprice,
sod.unitpricediscount,
sod.linetotal,
tp.ranking_sales_by_productid,
tp.ranking_sales_by_productcategoryid,
tp.net,
tp.net_margin,
tc.sum_total_due,
tc.quartile_invoicing,
tc.rank_invoicing
from salesorderhead soh 
inner join salesorderdetail sod on sod.salesorderid = soh.salesorderid
inner join topproductsales tp on sod.productid = tp.productid
inner join topcustomersales tc on soh.customerid = tc.customerid where city ='High Wycombe';

insert into table base_unique_sales partition(city='Las Vegas')     	select 
soh.salesorderid,
soh.orderdate,
soh.duedate,
soh.shipdate,
soh.status,
soh.salesordernumber,
soh.customerid,
soh.shipmethod,
soh.subtotal,
soh.taxamt,
soh.freight,
soh.totaldue,
sod.productid,
tp.productcatetegoryid,
sod.orderqty,
sod.unitprice,
sod.unitpricediscount,
sod.linetotal,
tp.ranking_sales_by_productid,
tp.ranking_sales_by_productcategoryid,
tp.net,
tp.net_margin,
tc.sum_total_due,
tc.quartile_invoicing,
tc.rank_invoicing
from salesorderhead soh 
inner join salesorderdetail sod on sod.salesorderid = soh.salesorderid
inner join topproductsales tp on sod.productid = tp.productid
inner join topcustomersales tc on soh.customerid = tc.customerid where city ='Las Vegas';

insert into table base_unique_sales partition(city='Liverpool')     	select 
soh.salesorderid,
soh.orderdate,
soh.duedate,
soh.shipdate,
soh.status,
soh.salesordernumber,
soh.customerid,
soh.shipmethod,
soh.subtotal,
soh.taxamt,
soh.freight,
soh.totaldue,
sod.productid,
tp.productcatetegoryid,
sod.orderqty,
sod.unitprice,
sod.unitpricediscount,
sod.linetotal,
tp.ranking_sales_by_productid,
tp.ranking_sales_by_productcategoryid,
tp.net,
tp.net_margin,
tc.sum_total_due,
tc.quartile_invoicing,
tc.rank_invoicing
from salesorderhead soh 
inner join salesorderdetail sod on sod.salesorderid = soh.salesorderid
inner join topproductsales tp on sod.productid = tp.productid
inner join topcustomersales tc on soh.customerid = tc.customerid where city ='Liverpool';

insert into table base_unique_sales partition(city='London')     		select 
soh.salesorderid,
soh.orderdate,
soh.duedate,
soh.shipdate,
soh.status,
soh.salesordernumber,
soh.customerid,
soh.shipmethod,
soh.subtotal,
soh.taxamt,
soh.freight,
soh.totaldue,
sod.productid,
tp.productcatetegoryid,
sod.orderqty,
sod.unitprice,
sod.unitpricediscount,
sod.linetotal,
tp.ranking_sales_by_productid,
tp.ranking_sales_by_productcategoryid,
tp.net,
tp.net_margin,
tc.sum_total_due,
tc.quartile_invoicing,
tc.rank_invoicing
from salesorderhead soh 
inner join salesorderdetail sod on sod.salesorderid = soh.salesorderid
inner join topproductsales tp on sod.productid = tp.productid
inner join topcustomersales tc on soh.customerid = tc.customerid where city ='London';

insert into table base_unique_sales partition(city='Maidenhead')     	select 
soh.salesorderid,
soh.orderdate,
soh.duedate,
soh.shipdate,
soh.status,
soh.salesordernumber,
soh.customerid,
soh.shipmethod,
soh.subtotal,
soh.taxamt,
soh.freight,
soh.totaldue,
sod.productid,
tp.productcatetegoryid,
sod.orderqty,
sod.unitprice,
sod.unitpricediscount,
sod.linetotal,
tp.ranking_sales_by_productid,
tp.ranking_sales_by_productcategoryid,
tp.net,
tp.net_margin,
tc.sum_total_due,
tc.quartile_invoicing,
tc.rank_invoicing
from salesorderhead soh 
inner join salesorderdetail sod on sod.salesorderid = soh.salesorderid
inner join topproductsales tp on sod.productid = tp.productid
inner join topcustomersales tc on soh.customerid = tc.customerid where city ='Maidenhead';

insert into table base_unique_sales partition(city='Milton Keynes')    	select 
soh.salesorderid,
soh.orderdate,
soh.duedate,
soh.shipdate,
soh.status,
soh.salesordernumber,
soh.customerid,
soh.shipmethod,
soh.subtotal,
soh.taxamt,
soh.freight,
soh.totaldue,
sod.productid,
tp.productcatetegoryid,
sod.orderqty,
sod.unitprice,
sod.unitpricediscount,
sod.linetotal,
tp.ranking_sales_by_productid,
tp.ranking_sales_by_productcategoryid,
tp.net,
tp.net_margin,
tc.sum_total_due,
tc.quartile_invoicing,
tc.rank_invoicing
from salesorderhead soh 
inner join salesorderdetail sod on sod.salesorderid = soh.salesorderid
inner join topproductsales tp on sod.productid = tp.productid
inner join topcustomersales tc on soh.customerid = tc.customerid where city ='Milton Keynes';

insert into table base_unique_sales partition(city='Oxnard')     		select 
soh.salesorderid,
soh.orderdate,
soh.duedate,
soh.shipdate,
soh.status,
soh.salesordernumber,
soh.customerid,
soh.shipmethod,
soh.subtotal,
soh.taxamt,
soh.freight,
soh.totaldue,
sod.productid,
tp.productcatetegoryid,
sod.orderqty,
sod.unitprice,
sod.unitpricediscount,
sod.linetotal,
tp.ranking_sales_by_productid,
tp.ranking_sales_by_productcategoryid,
tp.net,
tp.net_margin,
tc.sum_total_due,
tc.quartile_invoicing,
tc.rank_invoicing
from salesorderhead soh 
inner join salesorderdetail sod on sod.salesorderid = soh.salesorderid
inner join topproductsales tp on sod.productid = tp.productid
inner join topcustomersales tc on soh.customerid = tc.customerid where city ='Oxnard';

insert into table base_unique_sales partition(city='Oxon')     			select 
soh.salesorderid,
soh.orderdate,
soh.duedate,
soh.shipdate,
soh.status,
soh.salesordernumber,
soh.customerid,
soh.shipmethod,
soh.subtotal,
soh.taxamt,
soh.freight,
soh.totaldue,
sod.productid,
tp.productcatetegoryid,
sod.orderqty,
sod.unitprice,
sod.unitpricediscount,
sod.linetotal,
tp.ranking_sales_by_productid,
tp.ranking_sales_by_productcategoryid,
tp.net,
tp.net_margin,
tc.sum_total_due,
tc.quartile_invoicing,
tc.rank_invoicing
from salesorderhead soh 
inner join salesorderdetail sod on sod.salesorderid = soh.salesorderid
inner join topproductsales tp on sod.productid = tp.productid
inner join topcustomersales tc on soh.customerid = tc.customerid where city ='Oxon';

insert into table base_unique_sales partition(city='Sandy')     		select 
soh.salesorderid,
soh.orderdate,
soh.duedate,
soh.shipdate,
soh.status,
soh.salesordernumber,
soh.customerid,
soh.shipmethod,
soh.subtotal,
soh.taxamt,
soh.freight,
soh.totaldue,
sod.productid,
tp.productcatetegoryid,
sod.orderqty,
sod.unitprice,
sod.unitpricediscount,
sod.linetotal,
tp.ranking_sales_by_productid,
tp.ranking_sales_by_productcategoryid,
tp.net,
tp.net_margin,
tc.sum_total_due,
tc.quartile_invoicing,
tc.rank_invoicing
from salesorderhead soh 
inner join salesorderdetail sod on sod.salesorderid = soh.salesorderid
inner join topproductsales tp on sod.productid = tp.productid
inner join topcustomersales tc on soh.customerid = tc.customerid where city ='Sandy';

insert into table base_unique_sales partition(city='Santa Ana')     	select 
soh.salesorderid,
soh.orderdate,
soh.duedate,
soh.shipdate,
soh.status,
soh.salesordernumber,
soh.customerid,
soh.shipmethod,
soh.subtotal,
soh.taxamt,
soh.freight,
soh.totaldue,
sod.productid,
tp.productcatetegoryid,
sod.orderqty,
sod.unitprice,
sod.unitpricediscount,
sod.linetotal,
tp.ranking_sales_by_productid,
tp.ranking_sales_by_productcategoryid,
tp.net,
tp.net_margin,
tc.sum_total_due,
tc.quartile_invoicing,
tc.rank_invoicing
from salesorderhead soh 
inner join salesorderdetail sod on sod.salesorderid = soh.salesorderid
inner join topproductsales tp on sod.productid = tp.productid
inner join topcustomersales tc on soh.customerid = tc.customerid where city ='Santa Ana';

insert into table base_unique_sales partition(city='Santa Fe')     		select 
soh.salesorderid,
soh.orderdate,
soh.duedate,
soh.shipdate,
soh.status,
soh.salesordernumber,
soh.customerid,
soh.shipmethod,
soh.subtotal,
soh.taxamt,
soh.freight,
soh.totaldue,
sod.productid,
tp.productcatetegoryid,
sod.orderqty,
sod.unitprice,
sod.unitpricediscount,
sod.linetotal,
tp.ranking_sales_by_productid,
tp.ranking_sales_by_productcategoryid,
tp.net,
tp.net_margin,
tc.sum_total_due,
tc.quartile_invoicing,
tc.rank_invoicing
from salesorderhead soh 
inner join salesorderdetail sod on sod.salesorderid = soh.salesorderid
inner join topproductsales tp on sod.productid = tp.productid
inner join topcustomersales tc on soh.customerid = tc.customerid where city ='Santa Fe';

insert into table base_unique_sales partition(city='Sherman Oaks')     	select 
soh.salesorderid,
soh.orderdate,
soh.duedate,
soh.shipdate,
soh.status,
soh.salesordernumber,
soh.customerid,
soh.shipmethod,
soh.subtotal,
soh.taxamt,
soh.freight,
soh.totaldue,
sod.productid,
tp.productcatetegoryid,
sod.orderqty,
sod.unitprice,
sod.unitpricediscount,
sod.linetotal,
tp.ranking_sales_by_productid,
tp.ranking_sales_by_productcategoryid,
tp.net,
tp.net_margin,
tc.sum_total_due,
tc.quartile_invoicing,
tc.rank_invoicing
from salesorderhead soh 
inner join salesorderdetail sod on sod.salesorderid = soh.salesorderid
inner join topproductsales tp on sod.productid = tp.productid
inner join topcustomersales tc on soh.customerid = tc.customerid where city ='Sherman Oaks';

insert into table base_unique_sales partition(city='Union City')     	select 
soh.salesorderid,
soh.orderdate,
soh.duedate,
soh.shipdate,
soh.status,
soh.salesordernumber,
soh.customerid,
soh.shipmethod,
soh.subtotal,
soh.taxamt,
soh.freight,
soh.totaldue,
sod.productid,
tp.productcatetegoryid,
sod.orderqty,
sod.unitprice,
sod.unitpricediscount,
sod.linetotal,
tp.ranking_sales_by_productid,
tp.ranking_sales_by_productcategoryid,
tp.net,
tp.net_margin,
tc.sum_total_due,
tc.quartile_invoicing,
tc.rank_invoicing
from salesorderhead soh 
inner join salesorderdetail sod on sod.salesorderid = soh.salesorderid
inner join topproductsales tp on sod.productid = tp.productid
inner join topcustomersales tc on soh.customerid = tc.customerid where city ='Union City';

insert into table base_unique_sales partition(city='Van Nuys')     		select 
soh.salesorderid,
soh.orderdate,
soh.duedate,
soh.shipdate,
soh.status,
soh.salesordernumber,
soh.customerid,
soh.shipmethod,
soh.subtotal,
soh.taxamt,
soh.freight,
soh.totaldue,
sod.productid,
tp.productcatetegoryid,
sod.orderqty,
sod.unitprice,
sod.unitpricediscount,
sod.linetotal,
tp.ranking_sales_by_productid,
tp.ranking_sales_by_productcategoryid,
tp.net,
tp.net_margin,
tc.sum_total_due,
tc.quartile_invoicing,
tc.rank_invoicing
from salesorderhead soh 
inner join salesorderdetail sod on sod.salesorderid = soh.salesorderid
inner join topproductsales tp on sod.productid = tp.productid
inner join topcustomersales tc on soh.customerid = tc.customerid where city ='Van Nuys';

insert into table base_unique_sales partition(city='West Sussex')     	select 
soh.salesorderid,
soh.orderdate,
soh.duedate,
soh.shipdate,
soh.status,
soh.salesordernumber,
soh.customerid,
soh.shipmethod,
soh.subtotal,
soh.taxamt,
soh.freight,
soh.totaldue,
sod.productid,
tp.productcatetegoryid,
sod.orderqty,
sod.unitprice,
sod.unitpricediscount,
sod.linetotal,
tp.ranking_sales_by_productid,
tp.ranking_sales_by_productcategoryid,
tp.net,
tp.net_margin,
tc.sum_total_due,
tc.quartile_invoicing,
tc.rank_invoicing
from salesorderhead soh 
inner join salesorderdetail sod on sod.salesorderid = soh.salesorderid
inner join topproductsales tp on sod.productid = tp.productid
inner join topcustomersales tc on soh.customerid = tc.customerid where city ='West Sussex';

insert into table base_unique_sales partition(city='Wokingham')     	select 
soh.salesorderid,
soh.orderdate,
soh.duedate,
soh.shipdate,
soh.status,
soh.salesordernumber,
soh.customerid,
soh.shipmethod,
soh.subtotal,
soh.taxamt,
soh.freight,
soh.totaldue,
sod.productid,
tp.productcatetegoryid,
sod.orderqty,
sod.unitprice,
sod.unitpricediscount,
sod.linetotal,
tp.ranking_sales_by_productid,
tp.ranking_sales_by_productcategoryid,
tp.net,
tp.net_margin,
tc.sum_total_due,
tc.quartile_invoicing,
tc.rank_invoicing
from salesorderhead soh 
inner join salesorderdetail sod on sod.salesorderid = soh.salesorderid
inner join topproductsales tp on sod.productid = tp.productid
inner join topcustomersales tc on soh.customerid = tc.customerid where city ='Wokingham';


insert into table base_unique_sales partition(city='Woolston')     	select 
soh.salesorderid,
soh.orderdate,
soh.duedate,
soh.shipdate,
soh.status,
soh.salesordernumber,
soh.customerid,
soh.shipmethod,
soh.subtotal,
soh.taxamt,
soh.freight,
soh.totaldue,
sod.productid,
tp.productcatetegoryid,
sod.orderqty,
sod.unitprice,
sod.unitpricediscount,
sod.linetotal,
tp.ranking_sales_by_productid,
tp.ranking_sales_by_productcategoryid,
tp.net,
tp.net_margin,
tc.sum_total_due,
tc.quartile_invoicing,
tc.rank_invoicing
from salesorderhead soh 
inner join salesorderdetail sod on sod.salesorderid = soh.salesorderid
inner join topproductsales tp on sod.productid = tp.productid
inner join topcustomersales tc on soh.customerid = tc.customerid where city ='Woolston';


