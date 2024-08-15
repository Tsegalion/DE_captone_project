# Brazilian E-Commerce ETL Project

![Group 9](https://github.com/user-attachments/assets/11df794b-b3bf-4aae-982f-1d0bbdfa0845)

## Overview

This project involves an end-to-end ETL process using the Brazilian E-Commerce dataset. It includes data extraction, transformation, and loading into Google BigQuery using tools like PostgreSQL, Docker, Apache Airflow, dbt, and BigQuery.

## Project Structure

- airflow/: Contains Apache Airflow configuration, DAGs, and utilities.
- dbt_bigquery/: Contains dbt project files for transformation and modeling.
- postgres/: Includes datasets in CSV formats and SQL scripts to create PostgreSQL schema and tables for data ingestion.
- schema/: SQL schema files for database setup.
- utils/: Utility scripts for various data processing tasks.
- docker-compose.yml: Docker Compose configuration for setting up services.
- Dockerfile: Dockerfile for building the Docker image with dependencies.

### Prerequisites

- Docker and Docker Compose installed on your machine.
- Python and `pip` installed on your machine.

## Setup

## Clone the Repository

```plaintext
git clone https://github.com/Tsegalion/DE_captone_project.git
cd DE_captone_project
```

### Create and activate a virtual environment:

```plaintext
python3 -m venv venv
source venv/bin/activate  # On Windows, use `venv\Scripts\activate`
```

## Build and Start Services

Use Docker Compose to build and start all necessary services, including PostgreSQL, Airflow, and BigQuery.

```plaintext
docker-compose up --build
```

## Verify Service Initialization

Ensure that all services (Airflow, PostgreSQL) are running as expected. Open a new terminal type docker ps to confirm all services are healthy

```plaintext
docker ps
```

![alt text](image.png)


## Workflow

## Data Ingestion into PostgreSQL

After running the Docker Compose file, data is automatically ingested into PostgreSQL using the init.sql file. The database details is defined in the .env file which of course is invincible.

## Airflow DAGs

The DAG ```postgres_to_bq.py```, scheduled to run daily, orchestrates the ETL process. It extracts data from PostgreSQL and loads it into Google BigQuery. The DAG can be found in airflow/dags.

If all services are healthy, access the Airflow web UI to monitor and manage DAGs at http://localhost:8080.

![alt text](image-1.png)

## Data Transformation and Modeling with dbt

- ```Staging Models```: Located in dbt_bigquery/models/staging/. These models extracts the raw orders and products data with necessary joins from the raw_ecomm_data dataset.
- ```Intermediate Models```: Located in dbt_bigquery/models/intermediate/. These models aggregate and transform the data.
    - ```int_sales_by_category.sql``` aggregates sales data by product category, including total sales, total orders, and average sales.
    - ```int_avg_delivery_time.sql``` calculates the average delivery time across all orders.
    - ```int_orders_by_state.sql``` counts the number of orders per state.
- ```Final Models```: Located in dbt_bigquery/models/final/. These models generate the final results and insights from the intermediate models

To run the dbt models:

```plaintext
cd dbt_bigquery
dbt run --models staging
dbt run --models intermediate
dbt run --models final
```

##  Data Analysis and Querying
The final models can be queried in BigQuery to gain insights from the data. Key questions to address include:

- Which product categories have the highest sales?
- What is the average delivery time for orders?
- Which states have the highest number of orders?
