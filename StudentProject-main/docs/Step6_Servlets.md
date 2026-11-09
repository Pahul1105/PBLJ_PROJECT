# Step 6: Servlets (Controller Layer)

## 📌 What This Step Does

**Servlets** are Java classes that handle HTTP requests (GET and POST) from the browser.
They act as the **Controller** in the MVC pattern — they receive user input, call the DAO
to perform database operations, and then forward the results to a JSP page for display.

## 🔗 How It Connects to Other Parts

- **Receives requests** from JSP forms (Step 7)
- **Calls** `StudentDAO` methods (Step 5) for database operations
- **Forwards to** JSP pages (Step 7) for displaying results
- **Configured in** `web.xml` (Step 8) for URL mapping

### Request Flow for Each Servlet:

```
Browser → HTTP Request → Servlet → StudentDAO → MySQL → Servlet → JSP → Browser
```

## 📄 File Locations

All servlets go in: `StudentProject/src/com/studentproject/servlet/`

**Package:** `com.studentproject.servlet`

| Servlet                    | URL Pattern         | Purpose               |
|----------------------------|---------------------|-----------------------|
| LoginServlet.java          | /login              | Handle admin login    |
| LogoutServlet.java         | /logout             | Handle admin logout   |
| AddStudentServlet.java     | /addStudent         | Add new student       |
| ViewStudentServlet.java    | /viewStudents       | View all students     |
| UpdateStudentServlet.java  | /updateStudent      | Update student data   |
| DeleteStudentServlet.java  | /deleteStudent      | Delete a student      |
| SearchStudentServlet.java  | /searchStudent      | Search student by ID  |

## 💻 Servlet Lifecycle (Important for Viva!)

```
1. Client sends HTTP request
2. Tomcat receives the request
3. Tomcat checks web.xml for URL mapping
4. Tomcat creates/reuses the mapped Servlet
5. Servlet's doGet() or doPost() method runs
6. Servlet processes the request and sends response
```

### doGet() vs doPost()

| Method   | When Used                     | Data Visibility          |
|----------|-------------------------------|--------------------------|
| doGet()  | Loading pages, links, search  | Parameters visible in URL|
| doPost() | Form submissions, login       | Parameters hidden in body|

## 📝 Key Servlet Concepts

### HttpServletRequest
- Contains all data sent from the browser
- `request.getParameter("name")` — gets form field value
- `request.setAttribute("key", value)` — attach data for JSP

### HttpServletResponse
- Used to send data back to the browser
- `response.sendRedirect("page.jsp")` — redirect to another page

### RequestDispatcher
- Forwards the request to a JSP page (server-side)
- `request.getRequestDispatcher("page.jsp").forward(request, response)`

### Session Management
- `request.getSession()` — get/create a session
- `session.setAttribute("user", username)` — store data in session
- `session.invalidate()` — destroy session (logout)

## 📝 Redirect vs Forward

| Feature        | Redirect                        | Forward                         |
|----------------|---------------------------------|---------------------------------|
| Method         | `response.sendRedirect()`       | `requestDispatcher.forward()`   |
| URL changes?   | Yes (new URL in browser)        | No (same URL)                   |
| New request?   | Yes (creates new request)       | No (same request)               |
| Data sharing   | Cannot share request attributes | Can share request attributes    |
| Use case       | After POST (PRG pattern)        | Displaying results              |

## ⚠️ Common Issues

| Problem | Solution |
|---------|----------|
| 404 Not Found | Check URL pattern in web.xml matches servlet mapping |
| 405 Method Not Allowed | Make sure doGet/doPost matches form method |
| NullPointerException | Check if form field names match getParameter names |
| Session is null | Call getSession() before accessing session attributes |

## ✅ Next Step

Proceed to **Step 7: JSP Pages** to create the frontend UI.
