<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.studentproject.model.Student" %>
<%
    // Session check
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    
    // Get the student list from request attribute (set by ViewStudentServlet)
    List<Student> studentList = (List<Student>) request.getAttribute("studentList");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Students - Smart Student Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background: #f0f2f5;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .navbar {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%) !important;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
        }
        .navbar-brand { font-weight: 700; font-size: 1.3rem; }
        .table-card {
            background: white;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin-top: 30px;
        }
        .table-card h3 {
            font-weight: 700;
            color: #333;
        }
        .table thead {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }
        .table thead th {
            border: none;
            padding: 15px;
            font-weight: 600;
        }
        .table tbody td {
            padding: 12px 15px;
            vertical-align: middle;
        }
        .table tbody tr:hover {
            background-color: #f8f9ff;
        }
        .btn-edit {
            background: linear-gradient(135deg, #667eea, #764ba2);
            border: none;
            border-radius: 8px;
            padding: 6px 15px;
            color: white;
            font-size: 0.85rem;
            transition: transform 0.2s;
        }
        .btn-edit:hover {
            transform: scale(1.05);
            color: white;
        }
        .btn-delete {
            background: linear-gradient(135deg, #eb3349, #f45c43);
            border: none;
            border-radius: 8px;
            padding: 6px 15px;
            color: white;
            font-size: 0.85rem;
            transition: transform 0.2s;
        }
        .btn-delete:hover {
            transform: scale(1.05);
            color: white;
        }
        .btn-add-new {
            background: linear-gradient(135deg, #11998e, #38ef7d);
            border: none;
            border-radius: 10px;
            padding: 10px 25px;
            font-weight: 600;
            color: white;
        }
        .btn-add-new:hover {
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(17, 153, 142, 0.4);
        }
        .badge-marks {
            padding: 5px 12px;
            border-radius: 20px;
            font-weight: 600;
            font-size: 0.85rem;
        }
        .marks-high { background: #d4edda; color: #155724; }
        .marks-mid { background: #fff3cd; color: #856404; }
        .marks-low { background: #f8d7da; color: #721c24; }
        .student-count {
            background: #f8f9fa;
            border-radius: 10px;
            padding: 8px 15px;
            display: inline-block;
            font-size: 0.9rem;
            color: #666;
        }
        .empty-state {
            text-align: center;
            padding: 50px;
            color: #999;
        }
        .empty-state i {
            font-size: 60px;
            margin-bottom: 15px;
            color: #ddd;
        }
    </style>
</head>
<body>

<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <a class="navbar-brand" href="dashboard.jsp">
            <i class="bi bi-mortarboard-fill me-2"></i>Student Management
        </a>
        <div class="d-flex">
            <a href="dashboard.jsp" class="btn btn-outline-light btn-sm me-2">
                <i class="bi bi-house me-1"></i>Dashboard
            </a>
            <a href="logout" class="btn btn-outline-light btn-sm">
                <i class="bi bi-box-arrow-right me-1"></i>Logout
            </a>
        </div>
    </div>
</nav>

<!-- Main Content -->
<div class="container">
    <div class="table-card">
        <!-- Header Row -->
        <div class="d-flex justify-content-between align-items-center mb-4">
            <div>
                <h3><i class="bi bi-table me-2"></i>All Students</h3>
                <% if (studentList != null) { %>
                    <span class="student-count">
                        <i class="bi bi-people me-1"></i>Total: <strong><%= studentList.size() %></strong> students
                    </span>
                <% } %>
            </div>
            <a href="addStudent.jsp" class="btn btn-add-new">
                <i class="bi bi-plus-circle me-1"></i>Add New Student
            </a>
        </div>

        <!-- Success Message -->
        <%
            String successMessage = (String) session.getAttribute("successMessage");
            if (successMessage != null) {
                session.removeAttribute("successMessage");
        %>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <i class="bi bi-check-circle-fill me-2"></i><%= successMessage %>
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        <% } %>

        <!-- Error Message -->
        <%
            String errorMessage = (String) session.getAttribute("errorMessage");
            if (errorMessage != null) {
                session.removeAttribute("errorMessage");
        %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <i class="bi bi-exclamation-triangle-fill me-2"></i><%= errorMessage %>
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        <% } %>

        <!-- Student Table -->
        <% if (studentList != null && !studentList.isEmpty()) { %>
            <div class="table-responsive">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Student ID</th>
                            <th>Student Name</th>
                            <th>Marks</th>
                            <th>Grade</th>
                            <th class="text-center">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            int count = 1;
                            for (Student student : studentList) { 
                                String badgeClass;
                                String grade;
                                if (student.getMarks() >= 90) {
                                    badgeClass = "marks-high";
                                    grade = "A+";
                                } else if (student.getMarks() >= 80) {
                                    badgeClass = "marks-high";
                                    grade = "A";
                                } else if (student.getMarks() >= 70) {
                                    badgeClass = "marks-mid";
                                    grade = "B";
                                } else if (student.getMarks() >= 60) {
                                    badgeClass = "marks-mid";
                                    grade = "C";
                                } else {
                                    badgeClass = "marks-low";
                                    grade = "D";
                                }
                        %>
                            <tr>
                                <td><strong><%= count++ %></strong></td>
                                <td><%= student.getId() %></td>
                                <td>
                                    <i class="bi bi-person-circle me-1 text-muted"></i>
                                    <%= student.getName() %>
                                </td>
                                <td><%= student.getMarks() %></td>
                                <td>
                                    <span class="badge-marks <%= badgeClass %>"><%= grade %></span>
                                </td>
                                <td class="text-center">
                                    <a href="updateStudent?id=<%= student.getId() %>" 
                                       class="btn btn-edit btn-sm me-1"
                                       title="Edit Student">
                                        <i class="bi bi-pencil-square me-1"></i>Edit
                                    </a>
                                    <a href="deleteStudent?id=<%= student.getId() %>" 
                                       class="btn btn-delete btn-sm"
                                       title="Delete Student"
                                       onclick="return confirm('Are you sure you want to delete this student?');">
                                        <i class="bi bi-trash me-1"></i>Delete
                                    </a>
                                </td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        <% } else { %>
            <!-- Empty State -->
            <div class="empty-state">
                <i class="bi bi-inbox"></i>
                <h5>No Students Found</h5>
                <p>Start by adding a new student record.</p>
                <a href="addStudent.jsp" class="btn btn-add-new mt-2">
                    <i class="bi bi-plus-circle me-1"></i>Add First Student
                </a>
            </div>
        <% } %>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
