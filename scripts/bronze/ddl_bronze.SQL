---create Database 'Datawarehouse'
USE MASTER;
CREATE DATABASE Datawarehouse
USE Datawarehouse;

CREATE SCHEMA BRONZE;
go
CREATE SCHEMA Silver;
go
CREATE SCHEMA Gold;
go

---creating the tables in bronze layer--
--CREATE TABLE BRONZE.crm_cust_info---

IF OBJECT_ID('bronze.crm_cust_info', 'U') IS NOT NULL
    DROP TABLE bronze.crm_cust_info;

create table BRONZE.crm_cust_info (
	cst_id INT,
	cst_key NVARCHAR(50),
	cst_firstname NVARCHAR(50),
	cst_lastname nVARCHAR(50),
	cst_material_status NVARCHAR(50),
	cst_gndr NVARCHAR(50),
	cst_create_date DATE
	);

IF OBJECT_ID('bronze.crm_prd_info', 'U') IS NOT NULL
DROP TABLE bronze.crm_prd_info;
GO

create table BRONZE.crm_prd_info (
	prd_id INT,
	prd_key NVARCHAR(50),
	prd_nm NVARCHAR(50),
	prd_cost INT,
	prd_line NVARCHAR(50),
	prd_start_dt DATETIME,
	prd_end_dt DATETIME
	);

IF OBJECT_ID('bronze.crm_sales_details', 'U') IS NOT NULL
DROP TABLE bronze.crm_sales_details;
GO
	CREATE TABLE bronze.crm_sales_details (
    sls_ord_num  NVARCHAR(50),
    sls_prd_key  NVARCHAR(50),
    sls_cust_id  INT,
    sls_order_dt INT,
    sls_ship_dt  INT,
    sls_due_dt   INT,
    sls_sales    INT,
    sls_quantity INT,
    sls_price    INT
	);

IF OBJECT_ID('bronze.erp_loc_a101', 'U') IS NOT NULL
    DROP TABLE bronze.erp_loc_a101;
GO

CREATE TABLE bronze.erp_loc_a101 (
    cid    NVARCHAR(50),
    cntry  NVARCHAR(50)
);
GO

IF OBJECT_ID('bronze.erp_cust_az12', 'U') IS NOT NULL
    DROP TABLE bronze.erp_cust_az12;
GO

CREATE TABLE bronze.erp_cust_az12 (
    cid    NVARCHAR(50),
    bdate  DATE,
    gen    NVARCHAR(50)
);
GO

IF OBJECT_ID('bronze.erp_px_cat_g1v2', 'U') IS NOT NULL
    DROP TABLE bronze.erp_px_cat_g1v2;
GO

CREATE TABLE bronze.erp_px_cat_g1v2 (
    id           NVARCHAR(50),
    cat          NVARCHAR(50),
    subcat       NVARCHAR(50),
    maintenance  NVARCHAR(50)
);
GO

--loading table into the source tablea--
truncate table BRONZE.crm_cust_info;
Bulk Insert BRONZE.crm_cust_info
from'C:\Users\abiod\AppData\Local\Temp\d8510e18-81f0-428d-be9a-beeb32a75ec1_dbc9660c89a3480fa5eb9bae464d6c07.zip.ec1\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
with (
firstrow = 2,
fieldterminator = ',',
tablock
);

truncate table BRONZE.crm_prd_info;
Bulk Insert BRONZE.crm_prd_info
from'C:\Users\abiod\AppData\Local\Temp\5ad8a4ca-fa14-4b15-85d7-0f0588abb33c_dbc9660c89a3480fa5eb9bae464d6c07.zip.33c\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
with (
firstrow = 2,
fieldterminator = ',',
tablock
);

truncate table BRONZE.crm_sales_details;
Bulk Insert BRONZE.crm_sales_details
from'C:\Users\abiod\AppData\Local\Temp\7ff8de20-93cf-4540-bc13-6b917bf30070_dbc9660c89a3480fa5eb9bae464d6c07.zip.070\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
with (
firstrow = 2,
fieldterminator = ',',
tablock
);

truncate table BRONZE.erp_cust_az12;
Bulk Insert BRONZE.erp_cust_az12
from'C:\Users\abiod\AppData\Local\Temp\c779c6ce-8219-4956-9d52-9d318b5c6bca_dbc9660c89a3480fa5eb9bae464d6c07.zip.bca\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
with (
firstrow = 2,
fieldterminator = ',',
tablock
);

truncate table BRONZE.erp_loc_a101;
Bulk Insert BRONZE.erp_loc_a101
from'C:\Users\abiod\AppData\Local\Temp\f98b428f-51ea-4d04-b23f-fc4b0d56a939_dbc9660c89a3480fa5eb9bae464d6c07.zip.939\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
with (
firstrow = 2,
fieldterminator = ',',
tablock
);

truncate table BRONZE.erp_px_cat_g1v2;
Bulk Insert BRONZE.erp_px_cat_g1v2
from'C:\Users\abiod\AppData\Local\Temp\8fb2b38f-a99c-45ef-9609-7b3e29a76070_dbc9660c89a3480fa5eb9bae464d6c07.zip.070\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
with (
firstrow = 2,
fieldterminator = ',',
tablock
)
