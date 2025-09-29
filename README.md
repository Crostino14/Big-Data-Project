# 🐘 🔥 Big Data Analysis: Hadoop MapReduce and Apache Spark Exercises

## 📚 Project Overview
This project focuses on **Big Data analysis** and **distributed computing** using two foundational industry frameworks: **Hadoop MapReduce** and **Apache Spark**. The primary goal is to solve real-world retail data problems by leveraging the specific strengths of each paradigm.

The repository contains two main computational exercises:
📂 /MapReduce - **Customer Loyalty Mapping** with **Hadoop MapReduce** 🐘
📂 /Spark **Regional Sales Extremes Analysis** with **Apache Spark** 🔥

The work demonstrates the ability to implement, configure, and execute distributed jobs, contrasting the I/O-intensive approach of MapReduce with the speed and in-memory processing capabilities of Spark.

---

## 📖 Theoretical Background
The project explores two distinct approaches to parallel and distributed processing:

- **Hadoop MapReduce** 🐘: Used for the **Customer Loyalty** exercise. It is ideal for processing massive datasets where intermediate data is written to disk, ensuring **fault tolerance** and efficient handling of files that exceed a single node's capacity.
- **Apache Spark** 🔥: Employed for the **Regional Sales Analysis**. Spark excels in iterative computations and complex calculations due to its fast, **in-memory data processing** capabilities, relying on **Resilient Distributed Datasets (RDDs)**.

The core **MapReduce Design Pattern** utilized is **Numerical Summarization**, which is highly effective for grouping records (by customer ID) and calculating numerical aggregates (total sales, purchase count).

---

## ⚙️ Implementation Details
The implementation is structured around Java code for both Hadoop and Spark, supplemented by auxiliary shell scripts for execution management on a cluster environment (typically configured via Docker).

### **1. Hadoop MapReduce Exercise: Customer Loyalty**
This application analyzes raw sales data to rank customers based on loyalty metrics.

| Component | Role |
|-----------|------|
| `DriverCustomerLoyalty.java` | Configures the job (input/output paths, Mapper/Reducer classes) and manages execution on the Hadoop cluster. |
| `MapperCustomerLoyalty.java` | Processes raw input data and emits key-value pairs, grouping data by `CustomerID`. |
| `ReducerCustomerLoyalty.java` | Aggregates all values for a single `CustomerID`, computing **Total Sales** and the **Number of Purchases** for the current year. |
| `CustomerDataWritable.java` | Custom Writable class for efficient data serialization/deserialization of customer transaction details. |

### **2. Apache Spark Exercise: Regional Sales Analysis**
This application aggregates sales data by region to efficiently determine the regions with the maximum and minimum total sales.

| Component | Role |
|-----------|------|
| `RegionSaleAnalysisDriver` | The main Spark application that initializes the **Spark Context**, performs necessary **RDD transformations** (`filter`, `mapToPair`, `reduceByKey`), and executes actions (`max`, `min`) for the final output. |

---

## 📊 Execution and Performance Analysis

### **Key Findings from Spark Performance Comparison**
The Spark job was executed in both local (`--master local`) and cluster (`--master spark://spark-master:7077`) modes to compare performance.

| Aspect | Single-Node Performance | Cluster Performance |
|---|---|---|
| **Speed** | Comparable to cluster mode for the small dataset (0.2 - 0.3 seconds per stage). | Faster in principle, but overhead slightly offset benefits for small data. |
| **Overhead** | Minimal complexity and overhead. | Introduced **network overhead** due to data shuffling between executors. |
| **Scalability** | Does not scale well. | Provides **scalability** and **fault tolerance**, with benefits becoming much more evident with large datasets. |

---

## 🔧 Prerequisites

To compile and run the project, the following environments and tools are required:

- **Hadoop Cluster** 🐘 (typically set up using Docker)
- **Apache Spark Cluster** 🔥 (typically set up using Docker)
- **Java Development Kit (JDK)** ☕ (for compiling and running the `.jar` files)

---

## 🚀 Usage Guide

Execution involves compiling the Java code and submitting the jobs to the respective cluster masters using shell scripts.

### **Hadoop Execution Flow (Master Node Container)**
1.  Access the master container: `docker container exec -ti master bash`
2.  Start HDFS and YARN: `$HADOOP_HOME/sbin/start-dfs.sh` and `$HADOOP_HOME/sbin/start-yarn.sh`
3.  Upload data to HDFS: `hdfs dfs -put store3.csv hdfs:///input`
4.  Run the MapReduce job: `hadoop jar Exercise1_BIGDATA.jar /input /output`

### **Spark Execution Commands (Spark Master Container)**
The project uses dedicated launch scripts for submitting the Spark application:

| Script | Command | Mode |
|---------|------------|------------|
| `./launch_single.sh` | Submits `spark-submit` | **Local/Single-Node** (`--master local`) |
| `./launch_cluster.sh` | Submits `spark-submit` | **Cluster** (`--master spark://spark-master:7077`) |

---

## 📖 Full Report
For detailed **implementation specifics**, code snippets, and **comprehensive performance analysis**, please refer to the full **[Project Report](Project-Report-BIG-DATA.pdf)** 📑.

---

## 🤝 Contributors
- **Agostino Cardamone** 🎓 (Student & Creator)
- **Lecturer:** Giuseppe D'Aniello 🏫
