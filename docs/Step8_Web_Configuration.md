# Step 8: Web Configuration — web.xml

## 📌 What This Step Does

The `web.xml` file is the **Deployment Descriptor** for a Java web application. It tells
Apache Tomcat how to configure and run the application. It maps URLs to Servlets, sets
session timeouts, defines error pages, and more.

## 🔗 How It Connects to Other Parts

- **Tomcat reads this file** when the application is deployed
- **Maps URL patterns** (like `/login`, `/addStudent`) to specific Servlet classes
- **Defines welcome page** — the first page shown when the app starts
- **Configures error handling** — redirects to error.jsp on errors

### URL Mapping Flow:
```
User types: http://localhost:8080/StudentProject/login
                                                 │
Tomcat checks web.xml ──► finds /login mapping ──► LoginServlet.java
```

## 📄 File Location

**File:** `StudentProject/WebContent/WEB-INF/web.xml`

## 💻 Configuration Explained

### 1. Welcome File
```xml
<welcome-file-list>
    <welcome-file>login.jsp</welcome-file>
</welcome-file-list>
```
- This tells Tomcat: "When someone visits `http://localhost:8080/StudentProject/`, show `login.jsp`"

### 2. Servlet Declaration
```xml
<servlet>
    <servlet-name>LoginServlet</servlet-name>
    <servlet-class>com.studentproject.servlet.LoginServlet</servlet-class>
</servlet>
```
- **servlet-name**: An internal identifier (can be anything)
- **servlet-class**: The fully qualified class name (package + class)

### 3. Servlet Mapping
```xml
<servlet-mapping>
    <servlet-name>LoginServlet</servlet-name>
    <url-pattern>/login</url-pattern>
</servlet-mapping>
```
- **url-pattern**: The URL that triggers this servlet
- When user visits `/login`, Tomcat calls `LoginServlet`

### 4. Session Configuration
```xml
<session-config>
    <session-timeout>30</session-timeout>
</session-config>
```
- Sessions expire after 30 minutes of inactivity

### 5. Error Pages
```xml
<error-page>
    <error-code>404</error-code>
    <location>/error.jsp</location>
</error-page>
```
- If a 404 (page not found) or 500 (server error) occurs, show error.jsp

## 📝 Complete URL Mapping Table

| URL Pattern     | Servlet Name          | Java Class                                      |
|-----------------|-----------------------|-------------------------------------------------|
| /login          | LoginServlet          | com.studentproject.servlet.LoginServlet          |
| /logout         | LogoutServlet         | com.studentproject.servlet.LogoutServlet         |
| /addStudent     | AddStudentServlet     | com.studentproject.servlet.AddStudentServlet     |
| /viewStudents   | ViewStudentServlet    | com.studentproject.servlet.ViewStudentServlet    |
| /updateStudent  | UpdateStudentServlet  | com.studentproject.servlet.UpdateStudentServlet  |
| /deleteStudent  | DeleteStudentServlet  | com.studentproject.servlet.DeleteStudentServlet  |
| /searchStudent  | SearchStudentServlet  | com.studentproject.servlet.SearchStudentServlet  |

## ⚠️ Common Issues

| Problem | Solution |
|---------|----------|
| 404 after deploying | Check if url-pattern matches the form action |
| Servlet not found | Verify servlet-class has correct package path |
| web.xml not loading | Ensure it's in WEB-INF folder (exact path matters) |
| Multiple servlets conflict | Each servlet-name must be unique |

## ✅ Next Step

Proceed to **Step 9: Setup Instructions** for how to run the project.
