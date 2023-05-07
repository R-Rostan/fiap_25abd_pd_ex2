create database adventureworks; 
use adventureworks;

create external table address (
    addressid    int,
    addressline1 string,
    addressline2 string,
    city         string,
    postalcode   string,
    rowguid      string,
    modifieddate string
)
row format delimited fields terminated by ';'
location '/datasets/address'
tblproperties ('skip.header.line.count'='1');

create external table customer (
    customerid       int,
    title            string,
    suffix           string,
    companyname      string,
    salesperson      string,
    emailaddress     string,
    passwordhash     string,
    passwordsalt     string,
    rowguid          string,
    modifieddate     string
)
row format delimited fields terminated by ';'
location '/datasets/customer'
tblproperties ('skip.header.line.count'='1');

create external table customeraddress (
    customerid   int,
    addressid    int,
    rowguid      string,
    modifieddate string
)
row format delimited fields terminated by ';'
location '/datasets/customeraddress'
tblproperties ('skip.header.line.count'='1');

create external table product (
    productid                 int,
    productnumber             string,
    color                     string,
    standardcost              double,
    listprice                 double,
    size                      string,
    weight                    double,
    productcategoryid         int,
    productmodelid            int,
    sellstartdate             string,
    sellenddate               string,
    discontinueddate          string,          
    thumbnailphoto            string,
    thumbnailphotofilename    string,
    rowguid                   string,
    modifieddate              string
)
row format delimited fields terminated by ';'
location '/datasets/product'
tblproperties ('skip.header.line.count'='1');

create external table productcategory (
    productcategoryid       int,
    parentproductcategoryid int,
    rowguid                 string,
    modifieddate            string
)
row format delimited fields terminated by ';'
location '/datasets/productcategory'
tblproperties ('skip.header.line.count'='1');

create external table productdescription (
    productdescriptionid  int,
    description           string,
    rowguid               string,
    modifieddate          string
)
row format delimited fields terminated by ';'
location '/datasets/productdescription'
tblproperties ('skip.header.line.count'='1');

create external table productmodel (
    productmodelid     int,
    catalogdescription string,
    rowguid            string,
    modifieddate       string
)
row format delimited fields terminated by ';'
location '/datasets/productmodel'
tblproperties ('skip.header.line.count'='1');

create external table productmodeldescription (
    productmodelid       int,
    productdescriptionid int,
    culture              string,
    rowguid              string,
    modifieddate         string
)
row format delimited fields terminated by ';'
location '/datasets/productmodeldescription'
tblproperties ('skip.header.line.count'='1');

create external table salesorderdetail (
    salesorderid       int,
    salesorderdetailid int,
    orderqty           int,
    productid          int,
    unitprice          double,
    unitpricediscount  double,
    linetotal          double,
    rowguid            string,
    modifieddate       string
)
row format delimited fields terminated by ';'
location '/datasets/salesorderdetail'
tblproperties ('skip.header.line.count'='1');

create external table salesorderhead (
    salesorderid            int,
    revisionnumber          int,
    orderdate               string,
    duedate                 string,
    shipdate                string,
    status                  int,
    salesordernumber        string,
    customerid              int,
    shiptoaddressid         int,
    billtoaddressid         int,
    shipmethod              string,
    creditcardapprovalcode  string,
    subtotal                double,
    taxamt                  double,
    freight                 double,
    totaldue                double,
    comment                 string,
    rowguid                 string,
    modifieddate            string
)
row format delimited fields terminated by ';'
location '/datasets/salesorderhead'
tblproperties ('skip.header.line.count'='1');

create table if not exists topproductsales (
    productid                          int,
    productcatetegoryid                int,
    ranking_sales_by_productid         int,
    ranking_sales_by_productcategoryid int,
    net                                double,
    net_margin                         double
)
row format delimited fields terminated by ';'
location '/datasets/topproducts';

insert into topproductsales
select
    t1.productid,
    t1.productcategoryid,
    rank() over(
        order by
            t2.qtd desc,
            t3.qtd desc
    ) as ranking_sales_by_productid,
    rank() over(
        order by
            t3.qtd desc,
            t2.qtd desc
    ) as ranking_sales_by_productcategoryid,
    (t1.listprice - t1.standardcost) as net,
    ((t1.listprice - t1.standardcost)/t1.standardcost) as net_margin
from 
    product as t1
    
left join (
    select
        productid,
        sum(orderqty) as qtd
    from
        salesorderdetail
    group by
        productid
) as t2
on
    t1.productid = t2.productid

left join (
    select
        b.productcategoryid,
        sum(a.orderqty) as qtd
    from
        salesorderdetail as a
    inner join product as b
    on
        a.productid = b.productid
    group by
        b.productcategoryid
) as t3
on
    t1.productcategoryid = t3.productcategoryid
order by
    t1.productid;
    
create table if not exists topcustomersales (
    customerid                         int,
    city                               string,
    sum_total_due                      double,
    quartile_invoicing                 int,
    rank_invoicing                     int
)
row format delimited fields terminated by ';'
location '/datasets/topcustomers';

insert into topcustomersales
select 
    soh.customerid, 
    a.city,
    sum(soh.totaldue) sum_total_due, 
    NTILE(4) OVER (ORDER BY sum(soh.totaldue) DESC) AS quartile_invoicing,
    rank() over(ORDER BY sum(soh.totaldue) DESC) as rank_invoicing
from 
salesorderhead soh
left join customer c on soh.customerid = c.customerid
left join customeraddress ca on ca.customerid = c.customerid
left join address a on a.addressid = ca.addressid
group by soh.customerid, a.city;
