hadoop fs -mkdir /datasets
hadoop fs -mkdir /datasets/address
hadoop fs -mkdir /datasets/customer
hadoop fs -mkdir /datasets/customeraddress
hadoop fs -mkdir /datasets/product
hadoop fs -mkdir /datasets/productcategory
hadoop fs -mkdir /datasets/productdescription
hadoop fs -mkdir /datasets/productmodel
hadoop fs -mkdir /datasets/productmodeldescription
hadoop fs -mkdir /datasets/salesorderdetail
hadoop fs -mkdir /datasets/salesorderhead
hadoop fs -put /datasets/address.csv                  /datasets/address/address.csv
hadoop fs -put /datasets/customer.csv                 /datasets/customer/customer.csv
hadoop fs -put /datasets/customeraddress.csv          /datasets/customeraddress/customeraddress.csv
hadoop fs -put /datasets/product.csv                  /datasets/product/product.csv
hadoop fs -put /datasets/productcategory.csv          /datasets/productcategory/productcategory.csv
hadoop fs -put /datasets/productdescription.csv       /datasets/productdescription/productdescription.csv
hadoop fs -put /datasets/productmodel.csv             /datasets/productmodel/productmodel.csv
hadoop fs -put /datasets/productmodeldescription.csv  /datasets/productmodeldescription/productmodeldescription.csv
hadoop fs -put /datasets/salesorderdetail.csv         /datasets/salesorderdetail/salesorderdetail.csv
hadoop fs -put /datasets/salesorderhead.csv           /datasets/salesorderhead/salesorderhead.csv