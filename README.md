# 🐘🔥 Big Data Project - Hadoop MapReduce & Apache Spark

<div align="center">

![Hadoop](https://img.shields.io/badge/Hadoop-66CCFF?style=for-the-badge&logo=apache-hadoop&logoColor=black)
![Spark](https://img.shields.io/badge/Apache_Spark-E25A1C?style=for-the-badge&logo=apache-spark&logoColor=white)
![Java](https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)

*Big Data analysis and distributed computing using Hadoop MapReduce and Apache Spark*

[📖 Documentation](#-documentation) • [🚀 Features](#-features) • [⚙️ Installation](#️-installation) • [📊 Performance Analysis](#-performance-analysis)

</div>

---

## 🎯 Overview

This project demonstrates advanced **Big Data processing techniques** using two industry-standard frameworks: **Hadoop MapReduce** and **Apache Spark**. The work focuses on solving real-world retail data problems by leveraging the specific strengths of each distributed computing paradigm.

The repository showcases:
- 🐘 **Hadoop MapReduce** for fault-tolerant, disk-based batch processing
- 🔥 **Apache Spark** for fast, in-memory iterative computations
- 📊 Real-world retail analytics use cases
- ⚖️ Performance comparison between single-node and cluster deployments

---

## 🚀 Features

- ✅ **Distributed Customer Loyalty Analysis** using Hadoop MapReduce
- ✅ **Regional Sales Extremes Detection** using Apache Spark RDDs
- ✅ **Custom Writable Implementation** for efficient data serialization
- ✅ **Numerical Summarization Pattern** for data aggregation
- ✅ **Docker-based Cluster Configuration** for both Hadoop and Spark
- ✅ **Performance Benchmarking** (Single-Node vs Cluster)
- ✅ **Comprehensive Documentation** with execution results

---

## 🛠 Technologies

| Technology | Purpose | Version |
|------------|---------|---------|
| **Hadoop MapReduce** | Distributed batch processing | 3.3.6 |
| **Apache Spark** | In-memory data processing | Latest |
| **Java** | Implementation language | JDK 8+ |
| **Docker** | Cluster containerization | Latest |
| **HDFS** | Distributed file system | 3.3.6 |
| **YARN** | Resource management | 3.3.6 |

---

## 📁 Project Structure

```
Big-Data-Project/
│
├── MapReduce/                          # Hadoop MapReduce Exercise
│   ├── src/
│   │   ├── DriverCustomerLoyalty.java
│   │   ├── MapperCustomerLoyalty.java
│   │   ├── ReducerCustomerLoyalty.java
│   │   └── CustomerDataWritable.java
│   ├── Exercise1_BIGDATA.jar
│   └── data/
│       └── store3.csv
│
├── Spark/                              # Apache Spark Exercise
│   ├── src/
│   │   └── RegionSaleAnalysisDriver.java
│   ├── Exercise2_BIGDATA.jar
│   ├── launch_single.sh
│   ├── launch_cluster.sh
│   └── data/
│       └── sales_data.csv
│
├── Project-Report-BIG-DATA.pdf         # Complete project documentation
└── README.md

```

---

## 🎯 Exercises

### Exercise 1: Customer Loyalty Analysis with Hadoop MapReduce 🐘

#### 📝 Problem Statement

Online retail stores need to identify and reward their most loyal customers. This exercise implements a **customer loyalty ranking system** that analyzes transaction data to classify customers based on:
- Total sales volume
- Number of purchases in the current year
- Customer segment classification

#### 🔧 Implementation Components

| Component | Class | Responsibility |
|-----------|-------|----------------|
| **Driver** | `DriverCustomerLoyalty.java` | Job configuration, input/output management, cluster execution |
| **Mapper** | `MapperCustomerLoyalty.java` | Data extraction, key-value pair emission (CustomerID → Transaction Data) |
| **Reducer** | `ReducerCustomerLoyalty.java` | Data aggregation, loyalty metrics calculation |
| **Custom Writable** | `CustomerDataWritable.java` | Efficient serialization of customer transaction details |

#### 🎨 Design Pattern

**Numerical Summarization Pattern**:
- Groups records by `CustomerID` (key field)
- Calculates numerical aggregates (total sales, purchase count)
- Produces consolidated customer loyalty metrics

#### 💡 Key Design Decisions

- ✅ **Single Reducer Configuration**: Dataset size manageable by single node, avoiding distributed overhead
- ❌ **No Combiners Used**: Straightforward aggregations don't benefit from intermediate combining
- 🔄 **Efficient Data Serialization**: Custom Writable class minimizes network overhead

#### 📊 Output Format

```csv
CustomerID,CustomerSegment,OrderCount,TotalSales,NumberOfPurchasesCurrentYear
11,Home Office,1,211.15,1
14,Small Business,1,1214.93,4
21,Small Business,1,3084.04,3
```

---

### Exercise 2: Regional Sales Analysis with Apache Spark 🔥

#### 📝 Problem Statement

Identify regions with the **highest** and **lowest** sales figures to inform strategic business decisions, inventory management, and regional marketing strategies.

#### 🔧 Implementation Components

| Component | Responsibility |
|-----------|----------------|
| **RegionSaleAnalysisDriver** | Main Spark application coordinating the entire data flow |
| **RDD Transformations** | `textFile → filter → mapToPair → reduceByKey` |
| **RDD Actions** | `max` and `min` with custom serializable comparators |

#### 🔄 Spark Processing Pipeline

1. **Data Loading**: Read CSV into RDD of strings
2. **Header Filtering**: Remove header row for accurate processing
3. **Key-Value Mapping**: Transform to `(Region, Sales)` pairs
4. **Aggregation**: `reduceByKey` to sum sales per region
5. **Extremes Detection**: Parallel `max` and `min` operations
6. **Result Persistence**: Save results to distributed filesystem

#### ⚡ Spark Advantages

- **In-Memory Processing**: Intermediate results cached in RAM (RDDs)
- **Lazy Evaluation**: Optimized execution plans
- **Parallel Computation**: Distributed max/min operations
- **Fault Tolerance**: RDD lineage for automatic recovery

#### 📊 Output Format

**max.txt**:
```
(West,2347853.45)
```

**min.txt**:
```
(South,562341.78)
```

---

## ⚙️ Installation

### Prerequisites

- **Docker** and **Docker Compose** installed
- **Java Development Kit (JDK)** 8 or higher
- **Git** for cloning the repository

### Setup Instructions

#### 1️⃣ Clone the Repository

```bash
git clone https://github.com/Crostino14/Big-Data-Project.git
cd Big-Data-Project
```

#### 2️⃣ Hadoop Cluster Setup

```bash
# Navigate to Hadoop cluster directory
cd hadoop-cluster-3.3.6-amd64

# Build Docker image
docker build -t hadoop-new .

# Create Docker network
docker network create --driver bridge hadoop_network

# Start cluster
docker compose up -d
```

#### 3️⃣ Spark Cluster Setup

```bash
# Navigate to Spark cluster directory
cd spark-cluster

# Start Spark cluster
docker compose up -d
```

---

## 🚀 Usage

### Hadoop MapReduce Exercise

#### Execute the Job

```bash
# Access master container
docker container exec -ti master bash

# Format HDFS namenode (first time only)
hdfs namenode -format

# Start HDFS and YARN
$HADOOP_HOME/sbin/start-dfs.sh
$HADOOP_HOME/sbin/start-yarn.sh

# Upload dataset to HDFS
cd data/
hdfs dfs -put store3.csv hdfs:///input

# Run MapReduce job
hadoop jar Exercise1_BIGDATA.jar /input /output

# Retrieve results
hdfs dfs -cat /output/part-r-00000 > output_file.csv
```

#### Cleanup

```bash
# Remove HDFS directories
hdfs dfs -rm -r hdfs:///input
hdfs dfs -rm -r hdfs:///output

# Stop services
$HADOOP_HOME/sbin/stop-dfs.sh
$HADOOP_HOME/sbin/stop-yarn.sh

# Exit container
exit

# Stop Docker container
docker stop hadoop-new
```

---

### Apache Spark Exercise

#### Execute the Job

```bash
# Access Spark master container
docker container exec -ti sp_master bash

# Navigate to execution directory
cd bin/testfiles/

# Run in SINGLE-NODE mode (for development/testing)
./launch_single.sh

# Run in CLUSTER mode (for production/benchmarking)
./launch_cluster.sh

# View results
cd output1/max_sales/
cat part-00000 > max.txt

cd ../min_sales/
cat part-00000 > min.txt
```

#### Launch Scripts Explained

**launch_single.sh** (Local Mode):
```bash
/opt/bitnami/spark/bin/spark-submit \
  --class it.unisa.diem.hpc.spark.exercise2.RegionSaleAnalysisDriver \
  --master local \
  ./Exercise2_BIGDATA.jar \
  ./input ./output1
```

**launch_cluster.sh** (Cluster Mode):
```bash
/opt/bitnami/spark/bin/spark-submit \
  --class it.unisa.diem.hpc.spark.exercise2.RegionSaleAnalysisDriver \
  --master spark://spark-master:7077 \
  --deploy-mode client \
  --supervise \
  --executor-memory 1G \
  ./Exercise2_BIGDATA.jar \
  ./input ./output2
```

---

## 📊 Performance Analysis

### Single-Node vs Cluster Comparison

| Aspect | Single-Node 💻 | Cluster 🖥️🖥️🖥️ |
|--------|---------------|----------------|
| **Execution Time** | 0.2 - 0.3s per stage | 0.1 - 0.6s per stage |
| **Network Overhead** | None | Data shuffling between executors |
| **Resource Utilization** | Single executor, limited resources | Distributed across multiple executors |
| **Scalability** | Not scalable | Highly scalable |
| **Fault Tolerance** | Limited | Automatic recovery via RDD lineage |
| **Cost Efficiency** | More cost-effective for small datasets | Justified for large-scale processing |
| **Debugging** | Simplified debugging process | More complex distributed debugging |

### 🔍 Key Findings

- ✅ For **small datasets** (~MB range), single-node execution is **comparable** in performance
- ✅ **Cluster benefits** become significant with **larger datasets** (GB-TB range)
- ✅ Network overhead in cluster mode can **offset benefits** for trivial workloads
- ✅ Cluster mode provides **scalability and fault tolerance** critical for production

### 📈 When to Use Each Mode

| Scenario | Recommended Mode |
|----------|-----------------|
| Development & Testing | Single-Node |
| Small datasets (< 100 MB) | Single-Node |
| Large datasets (> 1 GB) | Cluster |
| Production deployments | Cluster |
| Iterative ML algorithms | Cluster |
| Real-time processing | Cluster |

---

## 📖 Documentation

### 📑 Complete Project Report

For comprehensive implementation details, code snippets, theoretical background, and in-depth performance analysis, please refer to:

**[Project-Report-BIG-DATA.pdf](./Project-Report-BIG-DATA.pdf)**

The report includes:
- Detailed problem statements and motivation
- Complete source code with explanations
- MapReduce and Spark design patterns
- Execution results and output analysis
- Performance benchmarking methodology
- Docker configuration details
- Complete command reference

---

## 🔗 Related Resources

- [Apache Hadoop Documentation](https://hadoop.apache.org/docs/)
- [Apache Spark Documentation](https://spark.apache.org/docs/latest/)
- [MapReduce Design Patterns](https://www.oreilly.com/library/view/mapreduce-design-patterns/9781449341954/)
- [Docker for Big Data](https://www.docker.com/)

---

## 🤝 Contributors
- **Agostino Cardamone** 🎓 (Student & Creator)
- **Lecturer:** Giuseppe D'Aniello 🏫
