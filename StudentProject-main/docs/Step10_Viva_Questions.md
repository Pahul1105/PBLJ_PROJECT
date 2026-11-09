# Step 10: Viva Questions & Answers

## 📌 Purpose

This document contains common viva (oral examination) questions and answers that you may
be asked during your university project evaluation. These cover all aspects of the
Student Management System project.

---

## 🔹 Section 1: Java & OOP Questions

### Q1: What is Object-Oriented Programming (OOP)?
**A:** OOP is a programming paradigm based on the concept of "objects" which contain data (fields/attributes) and code (methods). The four main pillars of OOP are:
1. **Encapsulation** — Wrapping data and methods together, hiding internal details
2. **Inheritance** — One class inheriting properties from another
3. **Polymorphism** — Same method behaving differently in different contexts
4. **Abstraction** — Hiding complex implementation, showing only necessary details

### Q2: How is Encapsulation used in your project?
**A:** In `Student.java`, all fields (`id`, `name`, `marks`) are declared **private**. Access to these fields is controlled through **public getter and setter methods**. This ensures that external classes cannot directly modify the data without going through the proper methods.

### Q3: What is the DAO design pattern?
**A:** DAO (Data Access Object) is a design pattern that provides an abstract interface to the database. It separates the database operations from the business logic. In our project, `StudentDAO.java` contains all SQL operations (CRUD), while Servlets only call DAO methods without writing any SQL.

### Q4: What is a POJO?
**A:** POJO stands for Plain Old Java Object. It's a simple Java class with private fields, public getters/setters, and constructors. `Student.java` is a POJO that represents a student entity.

### Q5: What are constructors? What types did you use?
**A:** A constructor is a special method that initializes an object when it is created. In `Student.java`, we used:
- **Default constructor** (`Student()`) — creates an empty object
- **Parameterized constructor** (`Student(int id, String name, double marks)`) — creates object with values
- **Constructor overloading** — having multiple constructors with different parameters

---

## 🔹 Section 2: JDBC Questions

### Q6: What is JDBC?
**A:** JDBC (Java Database Connectivity) is a Java API that allows Java programs to interact with databases. It provides methods to:
1. Connect to a database
2. Execute SQL queries
3. Process results
4. Handle transactions

### Q7: Explain the steps of JDBC connection in your project.
**A:** In `DBConnection.java`:
1. **Load the driver**: `Class.forName("com.mysql.cj.jdbc.Driver")` — loads MySQL driver into JVM
2. **Establish connection**: `DriverManager.getConnection(URL, USERNAME, PASSWORD)` — connects to MySQL
3. **Return connection**: The Connection object is returned to the calling method (usually StudentDAO)

### Q8: What is the difference between Statement and PreparedStatement?
**A:**
| Feature          | Statement                    | PreparedStatement              |
|------------------|------------------------------|--------------------------------|
| SQL Injection    | Vulnerable                   | Protected (parameterized)      |
| Performance      | Compiled every time          | Pre-compiled (faster)          |
| Parameters       | String concatenation         | Uses ? placeholders            |
| Readability      | Harder to read               | Cleaner, easier to read        |

We use **PreparedStatement** in our project for security and performance.

### Q9: What is SQL Injection and how does your project prevent it?
**A:** SQL Injection is a security attack where malicious SQL code is inserted through user input. For example, entering `' OR 1=1 --` as a name could bypass security.

Our project prevents this by using **PreparedStatement** with parameterized queries (`?` placeholders). The values are set using `setString()`, `setInt()`, etc., which automatically escape special characters.

### Q10: What is a ResultSet?
**A:** ResultSet is an object that holds the data returned by a SELECT query. We navigate through it using:
- `rs.next()` — moves cursor to next row (returns false when no more rows)
- `rs.getInt("column")` — gets integer value from current row
- `rs.getString("column")` — gets string value from current row

---

## 🔹 Section 3: Servlet Questions

### Q11: What is a Servlet?
**A:** A Servlet is a Java class that runs on a web server (like Tomcat) and handles HTTP requests (GET, POST). It acts as the **Controller** in MVC, receiving requests from the browser, processing them, and sending responses.

### Q12: Explain the Servlet lifecycle.
**A:**
1. **Loading** — Tomcat loads the servlet class
2. **Instantiation** — Tomcat creates an object of the servlet
3. **Initialization** — `init()` method is called once
4. **Service** — `service()` method is called for each request (which calls doGet/doPost)
5. **Destruction** — `destroy()` method is called when servlet is removed

### Q13: What is the difference between doGet() and doPost()?
**A:**
| Feature      | doGet()                       | doPost()                        |
|-------------|-------------------------------|----------------------------------|
| Data in URL | Yes (visible in address bar)  | No (hidden in request body)     |
| Data limit  | Limited (~2048 chars)         | No limit                        |
| Bookmarkable| Yes                           | No                              |
| Caching     | Can be cached                 | Not cached                      |
| Use case    | Fetching data (view, search)  | Submitting data (add, update)   |

### Q14: What is the difference between forward() and sendRedirect()?
**A:**
- **forward()**: Server-side. Same request. URL doesn't change. Can share request attributes.
  - Used when displaying results (e.g., showing search results)
- **sendRedirect()**: Client-side. New request. URL changes. Cannot share request attributes.
  - Used after POST operations (PRG pattern) to prevent duplicate submissions

### Q15: What is Session Management? How is it used in your project?
**A:** Session management maintains user state across multiple requests. HTTP is stateless, so sessions track logged-in users.

In our project:
- **Login**: `session.setAttribute("user", username)` — stores username
- **Every page**: `session.getAttribute("user")` — checks if user is logged in
- **Logout**: `session.invalidate()` — destroys the session

---

## 🔹 Section 4: JSP Questions

### Q16: What is JSP?
**A:** JSP (JavaServer Pages) is a technology for creating dynamic web pages using Java. It allows embedding Java code in HTML using special tags. JSP pages are compiled into Servlets by the server.

### Q17: What is the difference between Servlet and JSP?
**A:**
| Feature      | Servlet                    | JSP                           |
|-------------|---------------------------|-------------------------------|
| Contains    | Java code with HTML        | HTML with Java code           |
| Best for    | Controller logic           | View/presentation             |
| Extension   | .java                      | .jsp                          |
| Compilation | Compiled by developer      | Compiled by server (Tomcat)   |
| MVC Role    | Controller                 | View                          |

### Q18: What is Expression Language (EL)?
**A:** EL is a simpler way to access data in JSP. Instead of using scriptlets (`<%= %>` ), EL uses `${expression}` syntax. For example, `${student.name}` automatically calls `student.getName()`.

### Q19: What are JSP directives?
**A:** Directives provide instructions to the JSP container:
- `<%@ page ... %>` — page-level settings (imports, content type)
- `<%@ include ... %>` — includes another file
- `<%@ taglib ... %>` — imports tag libraries (like JSTL)

---

## 🔹 Section 5: Web Application Questions

### Q20: What is web.xml?
**A:** `web.xml` is the **Deployment Descriptor** — an XML configuration file that tells Tomcat how to set up the application. It defines:
- Servlet declarations and URL mappings
- Welcome files (first page to load)
- Error pages
- Session timeout settings

### Q21: What is MVC architecture?
**A:** MVC (Model-View-Controller) is a design pattern that separates an application into three components:
- **Model** — Data and business logic (Student.java, StudentDAO.java)
- **View** — User interface (JSP pages)
- **Controller** — Request handling (Servlets)

This separation makes code organized, maintainable, and testable.

### Q22: Why use Apache Tomcat?
**A:** Apache Tomcat is a Java web server and servlet container that:
- Runs Java Servlets and JSP pages
- Handles HTTP requests and responses
- Manages servlet lifecycle
- Provides session management
- It's free, open-source, and widely used

### Q23: What are the advantages of using MVC in this project?
**A:**
1. **Separation of Concerns** — Each layer has a specific responsibility
2. **Maintainability** — Changes in one layer don't affect others
3. **Reusability** — DAO can be reused by different servlets
4. **Testability** — Each component can be tested independently
5. **Scalability** — Easy to add new features

### Q24: What is the difference between request attribute and session attribute?
**A:**
| Feature          | Request Attribute              | Session Attribute                |
|------------------|---------------------------------|----------------------------------|
| Scope            | Single request                  | Entire user session              |
| Lifetime         | Ends when request completes    | Ends when session expires/invalidated|
| Usage            | Pass data from Servlet to JSP  | Store user login state           |
| Set method       | `request.setAttribute()`      | `session.setAttribute()`        |

---

## 🔹 Section 6: Database Questions

### Q25: What is CRUD?
**A:** CRUD stands for the four basic database operations:
- **C**reate — INSERT (Add student)
- **R**ead — SELECT (View/Search students)
- **U**pdate — UPDATE (Edit marks)
- **D**elete — DELETE (Remove student)

### Q26: Why use AUTO_INCREMENT for the id column?
**A:** AUTO_INCREMENT lets MySQL automatically generate unique IDs. When we insert a new student, we don't specify the id — MySQL assigns the next available number. This ensures each student has a unique identifier.

### Q27: What is PRIMARY KEY?
**A:** A PRIMARY KEY is a column (or set of columns) that uniquely identifies each row in a table. It must be:
- **Unique** — no duplicate values
- **Not NULL** — cannot be empty
In our table, `id` is the primary key.

### Q28: What is VARCHAR vs CHAR?
**A:**
- **CHAR(100)** — Always stores exactly 100 characters (pads with spaces)
- **VARCHAR(100)** — Stores up to 100 characters (only uses needed space)
- VARCHAR is more space-efficient for variable-length data like names

---

## 🔹 Section 7: Project-Specific Questions

### Q29: Walk through the complete flow of adding a student.
**A:**
1. User clicks "Add Student" on dashboard → opens `addStudent.jsp`
2. User fills in name and marks → clicks "Add Student" button
3. Form submits POST request to `/addStudent` URL
4. Tomcat maps `/addStudent` to `AddStudentServlet` (via web.xml)
5. `AddStudentServlet.doPost()` extracts name and marks from request
6. Validates input (not empty, marks 0-100)
7. Creates `Student` object: `new Student(name, marks)`
8. Calls `StudentDAO.addStudent(student)`
9. DAO opens JDBC connection via `DBConnection.getConnection()`
10. DAO executes PreparedStatement: `INSERT INTO students (name, marks) VALUES (?, ?)`
11. MySQL adds the record
12. DAO returns `true` to Servlet
13. Servlet sets success message in session
14. Servlet redirects to `/viewStudents`
15. `ViewStudentServlet` fetches all students and forwards to `viewStudents.jsp`
16. User sees the updated table with the new student

### Q30: How do you handle errors in this project?
**A:**
1. **Input Validation** — Check for empty fields, invalid marks range (0-100)
2. **Try-Catch Blocks** — Catch SQLExceptions and ClassNotFoundExceptions
3. **NumberFormatException** — Handle invalid number inputs with try-catch
4. **Session Checks** — Every servlet verifies if the user is logged in
5. **Error Messages** — Display success/error alerts using session attributes
6. **Error Page** — web.xml configures error.jsp for 404 and 500 errors
7. **Confirm Dialogs** — JavaScript confirm() before deleting a student

### Q31: What security measures are implemented?
**A:**
1. **Session Management** — Only logged-in users can access features
2. **PreparedStatement** — Prevents SQL Injection attacks
3. **Input Validation** — Server-side validation for all inputs
4. **Session Timeout** — Auto-logout after 30 minutes of inactivity
5. **Delete Confirmation** — Prevents accidental deletions
6. **Error Handling** — Proper error pages prevent stack trace exposure

### Q32: What are the limitations of this project?
**A:**
1. Hardcoded credentials (not stored in database with hashing)
2. No role-based access control (single admin user)
3. No pagination for large student lists
4. No file upload feature (e.g., student photos)
5. No email/notification system
6. No AJAX for dynamic updates (uses full page refresh)
7. No connection pooling (new connection per request)

### Q33: How would you improve this project?
**A:**
1. Add database-based login with password hashing (BCrypt)
2. Implement connection pooling (HikariCP or Tomcat JNDI)
3. Add pagination for student list
4. Use AJAX for search without page reload
5. Add CSV export/import functionality
6. Implement role-based access (Admin, Teacher, Student)
7. Add student profile pictures using file upload
8. Deploy on cloud (AWS, Heroku)

---

## 🎯 Quick Revision Tips

1. **Always start with explaining MVC** when asked about architecture
2. **Mention PreparedStatement** when asked about security
3. **Know the complete flow** from browser click to database and back
4. **Be ready to explain any code** line by line
5. **Practice modifying** — evaluators may ask you to change something live
6. **Know the difference** between forward and redirect
7. **Understand session management** — it's a favorite viva question

---

## ✅ You're Ready!

With this project and these answers, you're well-prepared for your university evaluation.
Good luck! 🎓
