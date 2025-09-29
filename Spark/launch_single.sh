/opt/bitnami/spark/bin/spark-submit \
  --class it.unisa.diem.hpc.spark.exercise2.RegionSaleAnalysisDriver \
  --master local \
  ./Exercise2_BIGDATA.jar \
  ./input ./output1
