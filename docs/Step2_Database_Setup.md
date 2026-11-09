# Step 2: Database Setup (MySQL)

## 📌 What This Step Does

This step creates the MySQL database and table required by the application.
We create:
1. A database called `student_db`
2. A table called `students` with columns: id, name, marks
3. Some sample data for testing

## 🔗 How It Connects to Other Parts

- `DBConnection.java` (Step 4) uses the database name `student_db` to connect
- `StudentDAO.java` (Step 5) runs SQL queries against the `students` table
- All Servlets ultimately depend on this database being setup correctly

## 📄 SQL Script Location

**File:** `StudentProject/database.sql`

## 💻 SQL Script Explained

```sql
-- ============================================
-- Smart Student Management System
-- Database Setup Script
-- ============================================

-- Step 1: Create the database
-- This creates a new database called 'student_db'
-- IF NOT EXISTS prevents error if database already exists
CREATE DATABASE IF NOT EXISTS student_db;

-- Step 2: Switch to using this database
USE student_db;

-- Step 3: Create the students table
-- This table stores all student records
-- id: auto-incremented primary key (unique identifier)
-- name: student's full name (up to 100 characters)
-- marks: student's marks stored as decimal (e.g., 85.50)
CREATE TABLE IF NOT EXISTS students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    marks DOUBLE NOT NULL
);

-- Step 4: Insert sample data for testing
-- These are test records so you can immediately see the app working
INSERT INTO students (name, marks) VALUES ('Rahul Sharma', 85.5);
INSERT INTO students (name, marks) VALUES ('Priya Patel', 92.0);
INSERT INTO students (name, marks) VALUES ('Amit Kumar', 78.3);
INSERT INTO students (name, marks) VALUES ('Sneha Gupta', 88.7);
INSERT INTO students (name, marks) VALUES ('Vikram Singh', 91.2);
```

## 📝 Column Details

| Column | Data Type    | Constraints                  | Description               |
|--------|-------------|------------------------------|---------------------------|
| id     | INT         | PRIMARY KEY, AUTO_INCREMENT  | Unique student identifier |
| name   | VARCHAR(100)| NOT NULL                     | Student's full name       |
| marks  | DOUBLE      | NOT NULL                     | Student's marks           |

### Why These Data Types?

- **INT for id**: Whole numbers are perfect for IDs. AUTO_INCREMENT means MySQL automatically assigns the next number.
- **VARCHAR(100) for name**: Variable-length string up to 100 characters. More efficient than CHAR which always uses fixed space.
- **DOUBLE for marks**: Allows decimal values like 85.5, 92.75, etc.

## 🛠️ How to Run This Script

### Option 1: MySQL Command Line
```bash
# Login to MySQL
mysql -u root -p

# Then paste the SQL script or run:
source /path/to/database.sql
```

### Option 2: MySQL Workbench
1. Open MySQL Workbench
2. Connect to your local MySQL server
3. Open `database.sql` file
4. Click the ⚡ (lightning bolt) button to execute

### Option 3: XAMPP phpMyAdmin
1. Start XAMPP → Start Apache + MySQL
2. Open browser → go to `http://localhost/phpmyadmin`
3. Click "SQL" tab
4. Paste the SQL script
5. Click "Go"

## ✅ Verify Setup

After running the script, verify everything works:

```sql
USE student_db;
SELECT * FROM students;
```

You should see 5 sample student records in the output.

## ⚠️ Common Issues

| Problem | Solution |
|---------|----------|
| "Access denied for user 'root'" | Check your MySQL password. Default is often empty or 'root' |
| "Can't connect to MySQL server" | Make sure MySQL service is running |
| "Table already exists" | The IF NOT EXISTS clause handles this — safe to re-run |
| "Unknown database" | Run the CREATE DATABASE line first |

## ✅ Next Step

Proceed to **Step 3: Model Layer** to create the Student Java class.
