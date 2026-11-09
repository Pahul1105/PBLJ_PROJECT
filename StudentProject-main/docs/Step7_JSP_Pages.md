# Step 7: JSP Pages (Frontend UI)

## 📌 What This Step Does

**JSP (JavaServer Pages)** are the **View** in the MVC pattern. They generate the HTML
that users see in their browser. Our JSPs use **Bootstrap 5** for professional styling
and **JSTL** (JSP Standard Tag Library) for displaying dynamic data.

## 🔗 How It Connects to Other Parts

- **login.jsp** → submits form to `LoginServlet`
- **dashboard.jsp** → links to all operations (Add, View, Search)
- **addStudent.jsp** → form submits to `AddStudentServlet`
- **viewStudents.jsp** → receives student list from `ViewStudentServlet`
- **editStudent.jsp** → pre-filled form from `UpdateStudentServlet`, submits update back
- **searchStudent.jsp** → search form submits to `SearchStudentServlet`
- **searchResult.jsp** → displays search results from `SearchStudentServlet`

### Request-Response Flow:
```
User → JSP Form → Servlet → DAO → Database → Servlet → JSP (display result) → User
```

## 📄 File Locations

All JSP files go in: `StudentProject/WebContent/`

| JSP File          | Purpose                           |
|-------------------|-----------------------------------|
| login.jsp         | Admin login form                  |
| dashboard.jsp     | Main dashboard with navigation    |
| addStudent.jsp    | Form to add a new student         |
| viewStudents.jsp  | Table showing all student records |
| editStudent.jsp   | Form to edit student data         |
| searchStudent.jsp | Form to search by student ID      |
| searchResult.jsp  | Display search results            |
| error.jsp         | Error display page                |

## 💻 Key JSP Concepts Used

### Expression Language (EL)
- `${variable}` — outputs a variable's value in HTML
- `${student.name}` — calls the `getName()` method on the student object
- `${studentList}` — accesses the list set as request attribute

### JSTL (JSP Standard Tag Library)
- `<c:forEach>` — loop through a collection
- `<c:if>` — conditional display
- `<c:out>` — safely output text (prevents XSS)

### Scriptlets (used minimally)
- `<% Java code here %>` — execute Java code in JSP
- `<%= expression %>` — output expression result
- We minimize scriptlet usage in favor of EL and JSTL

### Bootstrap 5
- Loaded via CDN (Content Delivery Network)
- Provides responsive grid, styled forms, buttons, tables, and alerts
- No need to download — just include the CDN link in each JSP

## 📝 Bootstrap Components Used

| Component  | Where Used        | Purpose                        |
|------------|-------------------|--------------------------------|
| Navbar     | All pages         | Navigation bar                 |
| Cards      | Dashboard         | Feature cards with icons        |
| Tables     | viewStudents.jsp  | Display student data           |
| Forms      | Add/Edit/Search   | Input fields for student data  |
| Alerts     | Multiple pages    | Success/error messages         |
| Buttons    | Multiple pages    | Action buttons (Add, Edit, etc)|
| Container  | All pages         | Centered page layout           |

## ⚠️ Common Issues

| Problem | Solution |
|---------|----------|
| JSTL tags not working | Add JSTL JAR to WEB-INF/lib and taglib directive to JSP |
| ${variable} shows as text | JSTL JAR missing or EL is disabled |
| Bootstrap not loading | Check internet connection (CDN requires internet) |
| Form data not reaching Servlet | Verify form action URL and input name attributes match |

## ✅ Next Step

Proceed to **Step 8: Web Configuration** to create the deployment descriptor (web.xml).
