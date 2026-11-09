# 🎓 Smart Student Management System

A web-based CRUD application built with Java Servlets, JSP, JDBC, MySQL, and Bootstrap 5.

## 🏗️ Tech Stack

| Technology      | Purpose                          |
|-----------------|----------------------------------|
| Java (JDK 8+)  | Core programming language (OOP)  |
| JDBC            | Database connectivity            |
| Servlets        | Backend controller logic         |
| JSP             | Frontend dynamic pages           |
| Bootstrap 5     | Responsive UI styling            |
| MySQL           | Relational database              |
| Apache Tomcat 9 | Web server                       |

## ✨ Features

- ✅ Admin Login with Session Management
- ✅ Add New Student (Name + Marks)
- ✅ View All Students (Table with Grades)
- ✅ Update Student Information
- ✅ Delete Student (with Confirmation)
- ✅ Search Student by ID
- ✅ Input Validation & Error Handling
- ✅ Professional Bootstrap 5 UI
- ✅ MVC Architecture (Model-View-Controller)

## 📁 Project Structure

```
StudentProject/
├── docs/                          ← Step-by-step documentation
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
├── database.sql                   ← SQL setup script
├── src/com/studentproject/
│   ├── model/Student.java
│   ├── dao/StudentDAO.java
│   ├── util/DBConnection.java
│   └── servlet/ (7 servlets)
├── WebContent/
│   ├── login.jsp, dashboard.jsp, ...
│   └── WEB-INF/web.xml
└── README.md
```

## 🚀 Quick Start

1. **Setup MySQL**: Run `database.sql` in MySQL
2. **Open in Eclipse**: Import as Dynamic Web Project
3. **Add MySQL JAR**: Add `mysql-connector-j-8.x.x.jar` to Build Path + WEB-INF/lib
4. **Update Password**: Edit `DBConnection.java` with your MySQL password
5. **Run on Tomcat**: Right-click → Run As → Run on Server
6. **Login**: Username: `admin` | Password: `admin123`

## 📚 Documentation

See the `docs/` folder for detailed step-by-step documentation covering:
- Project overview and architecture
- Database setup instructions
- Code explanation for each layer
- Setup and running instructions
- 33 Viva questions with detailed answers

## 📝 Login Credentials

| Username | Password  |
|----------|-----------|
| admin    | admin123  |

## 👨‍💻 Built for University Submission

This project demonstrates:
- Object-Oriented Programming (Encapsulation, Constructors)
- DAO Design Pattern
- MVC Architecture
- JDBC with PreparedStatement (SQL Injection prevention)
- Session Management
- Input Validation and Error Handling
