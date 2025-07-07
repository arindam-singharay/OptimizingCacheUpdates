# WebApiAutoCacheUpdate

A .NET 9 Web API project that demonstrates automatic cache updates in response to changes in master data stored in a SQL Server database.

## Features

- **Country Master Table:**  
  Stores country information in the database.
- **Database Trigger:**  
  A SQL Server trigger on the `Country` table calls a Web API endpoint whenever country data is updated, enabling automatic cache refresh.
- **Cache Update Endpoint:**  
  The API exposes an endpoint (`POST /api/masterdata/updatecache`) to handle cache update requests.

## Project Structure

- `Controllers/MasterDataController.cs`  
  Handles cache update requests.
- `Services/ICacheService.cs` and `Services/CacheService.cs`  
  (If implemented) Define and implement caching logic.
- `Database Scripts/DatabaseScript.sql`  
  SQL script to create the `Country` table, insert sample data, and set up the trigger.

## Getting Started

### Prerequisites

- .NET 9 SDK
- SQL Server (with `xp_cmdshell` and `curl` enabled for trigger functionality)

### Setup

1. **Database Setup**
   - Run `Database Scripts/DatabaseScript.sql` in your SQL Server instance to create the `Country` table, insert sample data, and set up the trigger.
2. **API Setup**
   - Build and run the Web API project.
   - Ensure the API is accessible at `http://localhost:5000` (or update the trigger URL in the SQL script as needed).

## How It Works

- When the `Country` table is updated, the SQL trigger executes a `curl` command to call the API endpoint.
- The API receives the request and updates its cache accordingly.
