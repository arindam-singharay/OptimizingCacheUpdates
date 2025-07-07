Database Script
This SQL script sets up the initial database schema and seed data for the Country table, and includes a trigger to notify the API when master data is updated.
Features
•	Creates the Country table with an auto-incrementing Id and a Name field.
•	Inserts sample data for several countries.
•	Defines a trigger (trgMasterDataUpdate) that calls a local API endpoint via curl whenever the Country table is updated.
Usage
1.	Run the script in your SQL Server Management Studio or preferred SQL tool to create the table and insert the data.
2.	Ensure that the SQL Server instance has xp_cmdshell enabled for the trigger to work.
3.	The trigger will POST to http://localhost:5000/api/cache/update after any update to the Country table, which is expected to notify your .NET 9 Web API to update its cache.
Notes
•	The trigger uses xp_cmdshell and curl. Make sure both are enabled and available on your SQL Server host.
•	Adjust the API endpoint URL in the trigger if your API is hosted elsewhere or on a different port.
•	Review security implications of enabling xp_cmdshell in production environments.
