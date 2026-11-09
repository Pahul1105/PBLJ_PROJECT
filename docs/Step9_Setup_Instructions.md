# Step 9: Setup & Running Instructions

## 📌 Complete Step-by-Step Guide

This document provides detailed instructions to set up and run the Smart Student Management
System project on your machine using Eclipse IDE + Apache Tomcat + MySQL.

---

## 🔧 PREREQUISITES

Before you begin, install the following software:

| Software         | Version      | Download Link                                     |
|------------------|-------------|---------------------------------------------------|
| JDK              | 8 or higher | https://www.oracle.com/java/technologies/downloads/|
| Eclipse IDE      | 2023+       | https://www.eclipse.org/downloads/                |
| Apache Tomcat    | 9.x         | https://tomcat.apache.org/download-90.cgi         |
| MySQL Server     | 8.x         | https://dev.mysql.com/downloads/mysql/            |
| MySQL Connector/J| 8.x         | https://dev.mysql.com/downloads/connector/j/      |

---

## 📋 STEP 1: Install & Configure MySQL

### 1.1 Install MySQL
- Download and install MySQL Community Server
- During installation, set the root password (remember it!)
- Start MySQL service

### 1.2 Create the Database
Open MySQL command line or MySQL Workbench and run:

```sql
-- Copy everything from database.sql and paste here
CREATE DATABASE IF NOT EXISTS student_db;
USE student_db;

CREATE TABLE IF NOT EXISTS students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    marks DOUBLE NOT NULL
);

INSERT INTO students (name, marks) VALUES ('Rahul Sharma', 85.5);
INSERT INTO students (name, marks) VALUES ('Priya Patel', 92.0);
INSERT INTO students (name, marks) VALUES ('Amit Kumar', 78.3);
INSERT INTO students (name, marks) VALUES ('Sneha Gupta', 88.7);
INSERT INTO students (name, marks) VALUES ('Vikram Singh', 91.2);
```

### 1.3 Verify
```sql
SELECT * FROM students;
```
You should see 5 records.

---

## 📋 STEP 2: Setup Eclipse IDE

### 2.1 Open Eclipse
- Launch Eclipse IDE for Enterprise Java Developers
- Choose a workspace folder

### 2.2 Create a Dynamic Web Project
1. Go to **File → New → Dynamic Web Project**
2. Enter Project Name: `StudentProject`
3. Target Runtime: Select **Apache Tomcat v9.0** (configure if not listed)
4. Dynamic Web Module Version: **4.0**
5. Click **Next → Next**
6. Check ✅ "Generate web.xml deployment descriptor"
7. Click **Finish**

### 2.3 Configure Tomcat in Eclipse
If Tomcat is not configured:
1. Go to **Window → Preferences → Server → Runtime Environments**
2. Click **Add → Apache Tomcat v9.0**
3. Browse to your Tomcat installation directory
4. Click **Finish**

---

## 📋 STEP 3: Add Project Files

### 3.1 Create Package Structure
In Eclipse:
1. Right-click `src` folder → **New → Package**
2. Create these packages:
   - `com.studentproject.model`
   - `com.studentproject.dao`
   - `com.studentproject.util`
   - `com.studentproject.servlet`

### 3.2 Add Java Files
Create the following files in their respective packages:

| Package                        | File                      |
|-------------------------------|---------------------------|
| com.studentproject.model      | Student.java              |
| com.studentproject.util       | DBConnection.java         |
| com.studentproject.dao        | StudentDAO.java           |
| com.studentproject.servlet    | LoginServlet.java         |
| com.studentproject.servlet    | LogoutServlet.java        |
| com.studentproject.servlet    | AddStudentServlet.java    |
| com.studentproject.servlet    | ViewStudentServlet.java   |
| com.studentproject.servlet    | UpdateStudentServlet.java |
| com.studentproject.servlet    | DeleteStudentServlet.java |
| com.studentproject.servlet    | SearchStudentServlet.java |

**How to create a Java file:**
1. Right-click on the package → **New → Class**
2. Enter the class name (without .java)
3. Click **Finish**
4. Replace all content with the code from this project

### 3.3 Add JSP Files
1. Right-click `WebContent` folder (or `webapp` in newer Eclipse versions)
2. **New → JSP File**
3. Create each JSP file:
   - `login.jsp`
   - `dashboard.jsp`
   - `addStudent.jsp`
   - `viewStudents.jsp`
   - `editStudent.jsp`
   - `searchStudent.jsp`
   - `searchResult.jsp`
   - `error.jsp`

### 3.4 Update web.xml
Replace the content of `WebContent/WEB-INF/web.xml` with the provided web.xml code.

---

## 📋 STEP 4: Add MySQL Connector JAR

This is **CRITICAL** — without this JAR, JDBC cannot connect to MySQL.

### 4.1 Download the JAR
1. Go to: https://dev.mysql.com/downloads/connector/j/
2. Select: **Platform Independent**
3. Download the ZIP/TAR file
4. Extract and find: `mysql-connector-j-8.x.x.jar`

### 4.2 Add to Project (TWO places!)

**Place 1: Build Path (for compilation)**
1. Right-click project → **Build Path → Configure Build Path**
2. Go to **Libraries** tab
3. Click **Add External JARs**
4. Browse and select `mysql-connector-j-8.x.x.jar`
5. Click **Apply and Close**

**Place 2: WEB-INF/lib (for runtime)**
1. Copy the `mysql-connector-j-8.x.x.jar` file
2. Paste it into: `WebContent/WEB-INF/lib/` folder
3. If `lib` folder doesn't exist, create it

⚠️ **BOTH places are required!** Build Path is for Eclipse compilation. WEB-INF/lib is for Tomcat at runtime.

---

## 📋 STEP 5: Configure Database Password

Open `DBConnection.java` and update the password:

```java
private static final String URL = "jdbc:mysql://localhost:3306/student_db";
private static final String USERNAME = "root";
private static final String PASSWORD = "your_mysql_password_here";  // ← Change this!
```

---

## 📋 STEP 6: Run the Project

### 6.1 Start MySQL
Make sure MySQL server is running.

### 6.2 Run on Tomcat
1. Right-click the project in Eclipse
2. Select **Run As → Run on Server**
3. Select **Apache Tomcat v9.0**
4. Click **Finish**

### 6.3 Open in Browser
Eclipse will automatically open the app. If not, go to:
```
http://localhost:8080/StudentProject/
```

### 6.4 Login
- Username: `admin`
- Password: `admin123`

---

## 📋 STEP 7: Test All Features

After logging in, test each feature:

| # | Feature          | How to Test                              |
|---|------------------|------------------------------------------|
| 1 | Login            | Enter admin/admin123, wrong credentials  |
| 2 | Dashboard        | Verify all 4 cards are visible           |
| 3 | Add Student      | Add a new student with name and marks    |
| 4 | View Students    | Click "View All" — see table with data   |
| 5 | Edit Student     | Click "Edit" on any student, change marks|
| 6 | Delete Student   | Click "Delete" — confirm dialog appears  |
| 7 | Search Student   | Search by ID — verify found/not found    |
| 8 | Logout           | Click logout — verify redirect to login  |
| 9 | Session Check    | After logout, try accessing dashboard    |

---

## 🔧 SETUP FOR INTELLIJ IDEA (Alternative)

### Step 1: Create Project
1. **File → New → Project**
2. Select **Java Enterprise**
3. Template: **Web Application**
4. Application Server: Configure Tomcat 9
5. Click **Next → Finish**

### Step 2: Add Files
- Java files go in: `src/main/java/com/studentproject/...`
- JSP files go in: `src/main/webapp/`
- web.xml goes in: `src/main/webapp/WEB-INF/`

### Step 3: Add JAR
1. **File → Project Structure → Libraries**
2. Click **+** → **Java**
3. Select `mysql-connector-j-8.x.x.jar`
4. Also add to `WEB-INF/lib`

### Step 4: Run
- Click the green ▶ button → Select Tomcat configuration → Run

---

## ⚠️ Common Errors & Fixes

### Error 1: ClassNotFoundException: com.mysql.cj.jdbc.Driver
**Cause:** MySQL Connector JAR is missing.
**Fix:** Add `mysql-connector-j-8.x.x.jar` to both Build Path AND `WEB-INF/lib/`

### Error 2: Access denied for user 'root'@'localhost'
**Cause:** Wrong MySQL password in DBConnection.java
**Fix:** Update the PASSWORD constant in DBConnection.java

### Error 3: Communications link failure
**Cause:** MySQL server is not running.
**Fix:** Start MySQL service. On Windows: Services → MySQL → Start

### Error 4: 404 — Page not found
**Cause:** URL pattern mismatch.
**Fix:** Check that form `action` attributes match `url-pattern` in web.xml

### Error 5: 405 — Method Not Allowed
**Cause:** Form uses POST but servlet only has doGet() (or vice versa).
**Fix:** Ensure the correct doGet/doPost method is implemented

### Error 6: NullPointerException in Servlet
**Cause:** Form field name doesn't match `request.getParameter()` name.
**Fix:** Ensure JSP input `name` attributes exactly match the parameter names in the servlet

### Error 7: JSP compilation error
**Cause:** Missing import or wrong class reference.
**Fix:** Check `<%@ page import="..." %>` directives at the top of JSP

### Error 8: Port 8080 already in use
**Cause:** Another application is using port 8080.
**Fix:** 
- Stop the other application, OR
- Change Tomcat port in `server.xml` (in Tomcat's conf folder)

### Error 9: Table doesn't exist
**Cause:** Database or table not created.
**Fix:** Run `database.sql` in MySQL first

### Error 10: Session is null
**Cause:** Trying to access session attribute after logout.
**Fix:** Always check `session != null` before accessing attributes

---

## ✅ Next Step

Proceed to **Step 10: Viva Questions & Answers** for exam preparation.
