/*
========================================================================================
Create Database and Schemas
========================================================================================
Script Purpose:
    This script creates a new database named 'DataWarehouse' after checking if it already exists. 
    If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas 
    within the database: 'bronze', 'silver', and 'gold'.
	
WARNING:
    Running this script will drop the entire 'DataWarehouse' database if it exists. 
    All data in the database will be permanently deleted. Proceed with caution 
    and ensure you have proper backups before running this script.
*/

USE MASTER;
GO

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
  PRINT 'Database found. preparing to drop...'

-- Set to single user mode to disconnect all users
ALTER DATABASE DataWarehouse
SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
  PRINT 'set databse to SINGLE_USER mode, all connections terminated...'

-- Drop the database
DROP DATABASE DataWarehouse;
  PRINT 'Database DataWarehouse has been successfully dropped.';
END
ESLE
BEGIN
  PRINT 'Database DataWarehouse does not exist. No action taken.';
END
GO

-- create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO
  
USE DataWarehouse;
GO

-- Create schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
