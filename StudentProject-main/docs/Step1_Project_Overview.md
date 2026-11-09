# Step 1: Project Overview & Structure

## 📌 What is this Project?

The **Smart Student Management System** is a web-based CRUD (Create, Read, Update, Delete) application
built using Java technologies. It allows an admin to log in and manage student records — add new students,
view all students in a table, update marks, delete records, and search students by their ID.

## 🏗️ Technology Stack

| Technology      | Purpose                                |
|-----------------|----------------------------------------|
| Java (JDK 8+)  | Core programming language (OOP)        |
| JDBC            | Database connectivity with MySQL       |
| Servlets        | Backend controller logic (HTTP)        |
| JSP             | Frontend UI (dynamic HTML pages)       |
| HTML + Bootstrap| Styling and responsive layout          |
| MySQL           | Relational database for data storage   |
| Apache Tomcat   | Web server to deploy and run the app   |

## 🧩 Architecture Pattern: MVC (Model-View-Controller)

This project follows the **MVC design pattern**:

```
┌─────────────────────────────────────────────────────┐
│                    USER (Browser)                    │
│                        │                            │
│                   ▼ HTTP Request                    │
│  ┌─────────────────────────────────────────────┐   │
│  │         CONTROLLER (Servlets)                │   │
│  │  LoginServlet, AddStudentServlet, etc.       │   │
│  └──────────────┬──────────────┬───────────────┘   │
│                 │              │                    │
│          ▼ calls DAO    ▼ forwards to JSP          │
│  ┌──────────────┐   ┌─────────────────────────┐   │
│  │ MODEL (DAO)  │   │    VIEW (JSP Pages)      │   │
│  │ StudentDAO   │   │  dashboard.jsp, etc.     │   │
│  │ Student.java │   │  Bootstrap styled        │   │
│  └──────┬───────┘   └─────────────────────────┘   │
│         │                                          │
│    ▼ JDBC calls                                    │
│  ┌──────────────┐                                  │
│  │   MySQL DB   │                                  │
│  │  student_db  │                                  │
│  └──────────────┘                                  │
└─────────────────────────────────────────────────────┘
```

### How MVC Works Here:

- **Model** → `Student.java` (data class) + `StudentDAO.java` (database operations)
- **View** → JSP pages (what the user sees in browser)
- **Controller** → Servlets (handle requests, call DAO, forward to JSP)

## 📁 Project Folder Structure

```
StudentProject/
│
├── docs/                          ← Documentation (this folder)
│   ├── Step1_Project_Overview.md
│   ├── Step2_Database_Setup.md
│   ├── Step3_Model_Layer.md
│   ├── Step4_Utility_Layer.md
│   ├── Step5_DAO_Layer.md
│   ├── Step6_Servlets.md
│   ├── Step7_JSP_Pages.md
│   ├── Step8_Web_Configuration.md
│   ├── Step9_Setup_Instructions.md
│   └── Step10_Viva_Questions.md
│
├── database.sql                   ← SQL script to create database & tables
│
├── src/                           ← Java source code
│   └── com/
│       └── studentproject/
│           ├── model/
│           │   └── Student.java           ← POJO / Data class
│           ├── dao/
│           │   └── StudentDAO.java        ← Database operations (CRUD)
│           ├── util/
│           │   └── DBConnection.java      ← MySQL connection helper
│           └── servlet/
│               ├── LoginServlet.java      ← Handles admin login
│               ├── LogoutServlet.java     ← Handles admin logout
│               ├── AddStudentServlet.java ← Add new student
│               ├── ViewStudentServlet.java← View all students
│               ├── UpdateStudentServlet.java ← Update student marks
│               ├── DeleteStudentServlet.java ← Delete a student
│               └── SearchStudentServlet.java ← Search student by ID
│
├── WebContent/                    ← Web resources (JSP, CSS, HTML)
│   ├── login.jsp                  ← Admin login page
│   ├── dashboard.jsp              ← Main dashboard after login
│   ├── addStudent.jsp             ← Form to add a student
│   ├── viewStudents.jsp           ← Table showing all students
│   ├── editStudent.jsp            ← Form to edit student marks
│   ├── searchStudent.jsp          ← Search form
│   ├── searchResult.jsp           ← Search result display
│   ├── error.jsp                  ← Error page
│   └── WEB-INF/
│       └── web.xml                ← Deployment descriptor
│
└── README.md                      ← Project readme
```

## 🔗 How the Parts Connect

1. **User opens browser** → goes to `login.jsp`
2. **User submits login form** → `LoginServlet` checks credentials
3. **If valid** → session created → redirected to `dashboard.jsp`
4. **From dashboard** → user can Add / View / Search / Update / Delete students
5. **Each action** → goes to a specific Servlet → Servlet calls `StudentDAO` → DAO talks to MySQL via `DBConnection`
6. **Result** → Servlet forwards to the appropriate JSP page to show results

## 📌 OOP Concepts Used

| Concept         | Where Used                                     |
|-----------------|------------------------------------------------|
| Encapsulation   | Student.java (private fields + getters/setters)|
| Abstraction     | DAO pattern hides SQL complexity from Servlets |
| Classes/Objects | Student objects created and passed around       |
| Constructors    | Student class has parameterized constructors   |
| Packages        | Code organized into model, dao, servlet, util  |

## ✅ Next Step

Proceed to **Step 2: Database Setup** to create the MySQL database and table.
