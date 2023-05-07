CONTAINER_REF=0b326b19973c
docker cp datasets/address.csv                  $CONTAINER_REF:/datasets/address.csv
docker cp datasets/customer.csv                 $CONTAINER_REF:/datasets/customer.csv
docker cp datasets/customeraddress.csv          $CONTAINER_REF:/datasets/customeraddress.csv
docker cp datasets/product.csv                  $CONTAINER_REF:/datasets/product.csv
docker cp datasets/productcategory.csv          $CONTAINER_REF:/datasets/productcategory.csv
docker cp datasets/productdescription.csv       $CONTAINER_REF:/datasets/productdescription.csv
docker cp datasets/productmodel.csv             $CONTAINER_REF:/datasets/productmodel.csv
docker cp datasets/productmodeldescription.csv  $CONTAINER_REF:/datasets/productmodeldescription.csv
docker cp datasets/salesorderdetail.csv         $CONTAINER_REF:/datasets/salesorderdetail.csv
docker cp datasets/salesorderhead.csv           $CONTAINER_REF:/datasets/salesorderhead.csv
docker cp move_datasets_local_to_hdfs.sh        $CONTAINER_REF:/move_datasets_local_to_hdfs.sh
docker cp create_external_tables_query.hql      $CONTAINER_REF:/create_external_tables_query.hql