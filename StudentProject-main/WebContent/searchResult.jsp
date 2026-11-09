<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.studentproject.model.Student" %>
<%
    // Session check
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    
    Student student = (Student) request.getAttribute("student");
    Boolean searchSuccess = (Boolean) request.getAttribute("searchSuccess");
    String searchMessage = (String) request.getAttribute("searchMessage");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Results - Smart Student Management System</title>
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
        .result-card {
            background: white;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            padding: 40px;
            margin-top: 30px;
        }
        .result-card h3 {
            font-weight: 700;
            color: #333;
            margin-bottom: 5px;
        }
        .result-card .subtitle {
            color: #777;
            margin-bottom: 30px;
        }
        .student-detail {
            background: #f8f9fa;
            border-radius: 15px;
            padding: 25px;
            margin-bottom: 20px;
        }
        .detail-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 12px 0;
            border-bottom: 1px solid #eee;
        }
        .detail-row:last-child {
            border-bottom: none;
        }
        .detail-label {
            font-weight: 600;
            color: #555;
        }
        .detail-value {
            font-weight: 500;
            color: #333;
            font-size: 1.1rem;
        }
        .btn-action {
            border-radius: 10px;
            padding: 10px 20px;
            font-weight: 600;
            border: none;
            color: white;
            transition: transform 0.2s;
        }
        .btn-action:hover {
            transform: translateY(-2px);
            color: white;
        }
        .btn-search-again {
            background: linear-gradient(135deg, #f093fb, #f5576c);
        }
        .btn-edit-found {
            background: linear-gradient(135deg, #667eea, #764ba2);
        }
        .btn-view-all {
            background: linear-gradient(135deg, #11998e, #38ef7d);
        }
        .page-icon {
            font-size: 40px;
            margin-bottom: 10px;
        }
        .icon-success { color: #11998e; }
        .icon-fail { color: #f5576c; }
        .badge-marks {
            padding: 5px 15px;
            border-radius: 20px;
            font-weight: 600;
        }
        .marks-high { background: #d4edda; color: #155724; }
        .marks-mid { background: #fff3cd; color: #856404; }
        .marks-low { background: #f8d7da; color: #721c24; }
        .not-found {
            text-align: center;
            padding: 30px;
        }
        .not-found i {
            font-size: 60px;
            color: #f5576c;
            margin-bottom: 15px;
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
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-6">
            <div class="result-card text-center">

                <% if (searchSuccess != null && searchSuccess && student != null) { %>
                    <!-- STUDENT FOUND -->
                    <div class="page-icon icon-success">
                        <i class="bi bi-check-circle-fill"></i>
                    </div>
                    <h3>Student Found!</h3>
                    <p class="subtitle">Here are the details for the searched student</p>

                    <!-- Student Details -->
                    <div class="student-detail text-start">
                        <div class="detail-row">
                            <span class="detail-label"><i class="bi bi-hash me-2"></i>Student ID</span>
                            <span class="detail-value"><%= student.getId() %></span>
                        </div>
                        <div class="detail-row">
                            <span class="detail-label"><i class="bi bi-person me-2"></i>Name</span>
                            <span class="detail-value"><%= student.getName() %></span>
                        </div>
                        <div class="detail-row">
                            <span class="detail-label"><i class="bi bi-award me-2"></i>Marks</span>
                            <span class="detail-value"><%= student.getMarks() %></span>
                        </div>
                        <div class="detail-row">
                            <span class="detail-label"><i class="bi bi-trophy me-2"></i>Grade</span>
                            <span class="detail-value">
                                <%
                                    String grade;
                                    String badgeClass;
                                    if (student.getMarks() >= 90) { grade = "A+"; badgeClass = "marks-high"; }
                                    else if (student.getMarks() >= 80) { grade = "A"; badgeClass = "marks-high"; }
                                    else if (student.getMarks() >= 70) { grade = "B"; badgeClass = "marks-mid"; }
                                    else if (student.getMarks() >= 60) { grade = "C"; badgeClass = "marks-mid"; }
                                    else { grade = "D"; badgeClass = "marks-low"; }
                                %>
                                <span class="badge-marks <%= badgeClass %>"><%= grade %></span>
                            </span>
                        </div>
                    </div>

                    <!-- Action Buttons -->
                    <div class="d-flex gap-2 justify-content-center flex-wrap">
                        <a href="updateStudent?id=<%= student.getId() %>" class="btn btn-action btn-edit-found">
                            <i class="bi bi-pencil-square me-1"></i>Edit
                        </a>
                        <a href="searchStudent.jsp" class="btn btn-action btn-search-again">
                            <i class="bi bi-search me-1"></i>Search Again
                        </a>
                        <a href="viewStudents" class="btn btn-action btn-view-all">
                            <i class="bi bi-table me-1"></i>View All
                        </a>
                    </div>

                <% } else { %>
                    <!-- STUDENT NOT FOUND -->
                    <div class="not-found">
                        <i class="bi bi-emoji-frown"></i>
                        <h3>Student Not Found</h3>
                        <p class="text-muted">
                            <%= searchMessage != null ? searchMessage : "No student found with the given ID." %>
                        </p>
                        <div class="d-flex gap-2 justify-content-center mt-4">
                            <a href="searchStudent.jsp" class="btn btn-action btn-search-again">
                                <i class="bi bi-search me-1"></i>Try Again
                            </a>
                            <a href="viewStudents" class="btn btn-action btn-view-all">
                                <i class="bi bi-table me-1"></i>View All
                            </a>
                            <a href="dashboard.jsp" class="btn btn-action" style="background:#6c757d;">
                                <i class="bi bi-house me-1"></i>Dashboard
                            </a>
                        </div>
                    </div>
                <% } %>

            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
