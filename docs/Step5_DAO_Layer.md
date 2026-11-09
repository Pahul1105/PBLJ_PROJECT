# Step 5: DAO Layer — StudentDAO.java

## 📌 What This Step Does

The **DAO (Data Access Object) Layer** contains the `StudentDAO` class. This class is the
**heart of the backend** — it contains ALL the methods that interact with the MySQL database.

The DAO pattern is a design pattern that separates database logic from business/controller logic.
This means our Servlets never write SQL directly — they call DAO methods instead.

## 🔗 How It Connects to Other Parts

- **Uses** `DBConnection.java` (Step 4) to get database connections
- **Uses** `Student.java` (Step 3) to create and return Student objects
- **Called by** all Servlets (Step 6) — each Servlet calls a specific DAO method
- **Executes SQL** against the `students` table (Step 2)

### Connection Flow:
```
Servlet → calls StudentDAO method → DAO uses DBConnection → executes SQL → returns result
```

## 📄 File Location

**File:** `StudentProject/src/com/studentproject/dao/StudentDAO.java`

**Package:** `com.studentproject.dao`

## 💻 Methods Overview

| Method                    | SQL Operation | Called By              |
|---------------------------|---------------|------------------------|
| `addStudent(Student)`     | INSERT        | AddStudentServlet      |
| `getAllStudents()`        | SELECT *      | ViewStudentServlet     |
| `getStudentById(int)`    | SELECT WHERE  | SearchStudentServlet   |
| `updateStudent(Student)` | UPDATE        | UpdateStudentServlet   |
| `deleteStudent(int)`     | DELETE        | DeleteStudentServlet   |

## 💻 Code Explained

### PreparedStatement vs Statement

We use **PreparedStatement** instead of regular Statement because:

1. **Security**: Prevents SQL Injection attacks
2. **Performance**: Pre-compiled queries are faster
3. **Readability**: Parameterized queries are cleaner
4. **Best Practice**: Industry standard for database operations

```java
// BAD (vulnerable to SQL Injection):
Statement stmt = conn.createStatement();
stmt.executeQuery("SELECT * FROM students WHERE id = " + userInput);

// GOOD (safe with PreparedStatement):
PreparedStatement ps = conn.prepareStatement("SELECT * FROM students WHERE id = ?");
ps.setInt(1, userInput);
```

### CRUD Operations Mapping

| Operation | HTTP Method | SQL Command | Description       |
|-----------|-------------|-------------|-------------------|
| Create    | POST        | INSERT      | Add new student   |
| Read      | GET         | SELECT      | View/Search       |
| Update    | POST        | UPDATE      | Modify marks      |
| Delete    | GET/POST    | DELETE      | Remove student    |

## 📝 Important JDBC Concepts Used

### ResultSet
- Holds the results returned by a SELECT query
- Navigate through results using `rs.next()` (returns true if there's another row)
- Get column values using `rs.getInt("column")`, `rs.getString("column")`, etc.

### Try-with-Resources
- `try (Connection conn = ...)` automatically closes the connection when done
- Prevents resource leaks (unclosed connections)

### Connection Closing
- Always close Connection, PreparedStatement, and ResultSet when done
- Unclosed connections cause memory leaks and database connection pool exhaustion

## ⚠️ Common Issues

| Problem | Solution |
|---------|----------|
| NullPointerException | Check if DBConnection returns null |
| SQLException | Check SQL syntax, table/column names |
| Empty ResultSet | Check if data exists in the table |
| Connection timeout | Close connections properly, don't hold them open |

## ✅ Next Step

Proceed to **Step 6: Servlets** to create the controller layer.
