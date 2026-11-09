package com.studentproject.util;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
/**
 * Database Connection Utility Class
 * Provides a static method to get a connection to the MySQL database.
 * Uses JDBC (Java Database Connectivity) API.
 * JDBC Steps:
 * 1. Load the MySQL JDBC Driver
 * 2. Establish connection using DriverManager
 * 3. Return the Connection object
 */
public class DBConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/student_db";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "";  // Change to your MySQL password
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection(URL, USERNAME, PASSWORD)
        return connection;
    }
}
