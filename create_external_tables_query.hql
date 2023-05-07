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