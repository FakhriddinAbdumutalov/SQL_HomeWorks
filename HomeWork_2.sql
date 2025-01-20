--HomeWork2

--Displays all databases and their tables in the system 
--sp_MSforeachdb: A system stored procedure that runs the same query against all databases
--use [?]: Switches to each database dynamically
--sys.tables: Retrieves all user tables from the current database
--db_name(): returns the name of the current database
exec sp_MSforeachdb ' 
use [?];
select db_name() as DatabaseName, name as TableName 
from sys.tables';

--Displays only all tables in the system 
exec sp_MSforeachdb '
use [?];
select name as TableName 
from sys.tables';