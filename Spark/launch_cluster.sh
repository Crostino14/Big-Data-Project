/opt/bitnami/spark/bin/spark-submit \
  --class it.unisa.diem.hpc.spark.exercise2.RegionSaleAnalysisDriver \
  --master spark://spark-master:7077 \
  --deploy-mode client \
  --supervise \
  --executor-memory 1G \
  ./Exercise2_BIGDATA.jar \
./input ./output2
