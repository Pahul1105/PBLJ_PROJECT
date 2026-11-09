# Step 4: Utility Layer — DBConnection.java

## 📌 What This Step Does

The **Utility Layer** contains the `DBConnection` class, which is responsible for creating
and managing the connection between our Java application and the MySQL database.

This class uses **JDBC (Java Database Connectivity)** — a Java API that allows Java programs
to interact with databases using SQL.

## 🔗 How It Connects to Other Parts

- **StudentDAO.java** (Step 5) calls `DBConnection.getConnection()` every time it needs to
  run a database query
- This class is the ONLY place where database credentials (URL, username, password) are defined
- If you need to change your MySQL password, you ONLY change it here

### Connection Flow:
```
StudentDAO → calls DBConnection.getConnection() → JDBC Driver → MySQL Database
```

## 📄 File Location

**File:** `StudentProject/src/com/studentproject/util/DBConnection.java`

**Package:** `com.studentproject.util`

## 💻 Code Explained

```java
package com.studentproject.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Database Connection Utility Class
 * 
 * This class provides a static method to get a connection to MySQL database.
 * It uses JDBC (Java Database Connectivity) API.
 * 
 * JDBC Steps:
 * 1. Load the MySQL JDBC Driver
 * 2. Establish connection using DriverManager
 * 3. Return the Connection object
 */
public class DBConnection {

    // Database configuration constants
    // CHANGE THESE VALUES according to your MySQL setup
    private static final String URL = "jdbc:mysql://localhost:3306/student_db";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "root";  // Change to your MySQL password

    /**
     * Get a connection to the MySQL database.
     * 
     * @return Connection object if successful
     * @throws ClassNotFoundException if MySQL driver is not found
     * @throws SQLException if connection fails
     */
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        // Step 1: Load MySQL JDBC Driver into memory
        // This tells Java which database driver to use
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Step 2: Create and return the database connection
        // DriverManager uses the URL, username, and password to connect
        Connection connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);

        return connection;
    }
}
```

## 📝 Explanation of Each Part

### JDBC URL Format
```
jdbc:mysql://localhost:3306/student_db
│     │       │         │      │
│     │       │         │      └── Database name
│     │       │         └── Port number (MySQL default: 3306)
│     │       └── Hostname (localhost = your machine)
│     └── Database type
└── Protocol
```

### Class.forName()
- Loads the MySQL JDBC driver class into JVM memory
- The driver class `com.mysql.cj.jdbc.Driver` comes from the MySQL Connector/J JAR file
- **You MUST add the MySQL Connector JAR to your project's classpath** (see Step 9)

### DriverManager.getConnection()
- Creates an actual connection to the MySQL database
- Takes three parameters: URL, username, password
- Returns a `Connection` object that we use to execute SQL queries

### Static Method
- `getConnection()` is a **static method** — called using class name: `DBConnection.getConnection()`
- No need to create an object of `DBConnection`

## ⚠️ Important: MySQL Connector JAR

For JDBC to work, you MUST download and add the **MySQL Connector/J** JAR file:

1. Download from: https://dev.mysql.com/downloads/connector/j/
2. Choose "Platform Independent" → Download the ZIP
3. Extract and find `mysql-connector-j-8.x.x.jar`
4. Add it to your project:
   - **Eclipse**: Right-click project → Build Path → Add External JARs
   - **IntelliJ**: File → Project Structure → Libraries → Add JAR
   - **Also copy to**: `WebContent/WEB-INF/lib/` folder (for Tomcat deployment)

## ⚠️ Common Issues

| Problem | Solution |
|---------|----------|
| ClassNotFoundException | MySQL Connector JAR not in classpath. Add it! |
| Access denied | Wrong username/password in DBConnection.java |
| Communications link failure | MySQL server not running. Start it! |
| Unknown database 'student_db' | Run database.sql first (Step 2) |

## ✅ Next Step

Proceed to **Step 5: DAO Layer** to create the database operations class.
