<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Session check — if not logged in, redirect to login page
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    String user = (String) session.getAttribute("user");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Smart Student Management System</title>
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
        .navbar-brand {
            font-weight: 700;
            font-size: 1.3rem;
        }
        .dashboard-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 40px 0;
            margin-bottom: 40px;
            border-radius: 0 0 30px 30px;
        }
        .dashboard-header h1 {
            font-weight: 700;
            font-size: 2rem;
        }
        .feature-card {
            background: white;
            border: none;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
            transition: transform 0.3s, box-shadow 0.3s;
            padding: 30px;
            text-align: center;
            height: 100%;
        }
        .feature-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.15);
        }
        .feature-icon {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 20px;
            font-size: 28px;
            color: white;
        }
        .icon-add { background: linear-gradient(135deg, #11998e, #38ef7d); }
        .icon-view { background: linear-gradient(135deg, #667eea, #764ba2); }
        .icon-search { background: linear-gradient(135deg, #f093fb, #f5576c); }
        .icon-logout { background: linear-gradient(135deg, #eb3349, #f45c43); }
        .feature-card h5 {
            color: #333;
            font-weight: 600;
            margin-bottom: 10px;
        }
        .feature-card p {
            color: #777;
            font-size: 0.9rem;
            margin-bottom: 20px;
        }
        .btn-feature {
            border-radius: 25px;
            padding: 8px 25px;
            font-weight: 600;
            border: none;
            color: white;
            transition: transform 0.2s;
        }
        .btn-feature:hover {
            transform: scale(1.05);
            color: white;
        }
        .btn-add { background: linear-gradient(135deg, #11998e, #38ef7d); }
        .btn-view { background: linear-gradient(135deg, #667eea, #764ba2); }
        .btn-search { background: linear-gradient(135deg, #f093fb, #f5576c); }
        .btn-logout { background: linear-gradient(135deg, #eb3349, #f45c43); }

        .welcome-text {
            font-size: 1.1rem;
            opacity: 0.9;
        }
        .stats-badge {
            background: rgba(255,255,255,0.2);
            border-radius: 10px;
            padding: 8px 15px;
            display: inline-block;
            margin-top: 10px;
        }
        footer {
            margin-top: 60px;
            padding: 20px;
            text-align: center;
            color: #999;
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
        <div class="d-flex align-items-center">
            <span class="text-white me-3">
                <i class="bi bi-person-circle me-1"></i>Welcome, <strong><%= user %></strong>
            </span>
            <a href="logout" class="btn btn-outline-light btn-sm">
                <i class="bi bi-box-arrow-right me-1"></i>Logout
            </a>
        </div>
    </div>
</nav>

<!-- Dashboard Header -->
<div class="dashboard-header text-center">
    <div class="container">
        <h1><i class="bi bi-speedometer2 me-2"></i>Admin Dashboard</h1>
        <p class="welcome-text">Manage your students efficiently with ease</p>
        <div class="stats-badge">
            <i class="bi bi-calendar3 me-1"></i>
            <%= new java.text.SimpleDateFormat("EEEE, MMMM dd, yyyy").format(new java.util.Date()) %>
        </div>
    </div>
</div>

<!-- Feature Cards -->
<div class="container">
    <div class="row g-4">
        <!-- Add Student Card -->
        <div class="col-md-6 col-lg-3">
            <div class="feature-card">
                <div class="feature-icon icon-add">
                    <i class="bi bi-person-plus-fill"></i>
                </div>
                <h5>Add Student</h5>
                <p>Register a new student with name and marks</p>
                <a href="addStudent.jsp" class="btn btn-feature btn-add">
                    <i class="bi bi-plus-circle me-1"></i>Add New
                </a>
            </div>
        </div>

        <!-- View All Students Card -->
        <div class="col-md-6 col-lg-3">
            <div class="feature-card">
                <div class="feature-icon icon-view">
                    <i class="bi bi-table"></i>
                </div>
                <h5>View Students</h5>
                <p>View all student records in a table format</p>
                <a href="viewStudents" class="btn btn-feature btn-view">
                    <i class="bi bi-eye me-1"></i>View All
                </a>
            </div>
        </div>

        <!-- Search Student Card -->
        <div class="col-md-6 col-lg-3">
            <div class="feature-card">
                <div class="feature-icon icon-search">
                    <i class="bi bi-search"></i>
                </div>
                <h5>Search Student</h5>
                <p>Find a student by their unique ID number</p>
                <a href="searchStudent.jsp" class="btn btn-feature btn-search">
                    <i class="bi bi-search me-1"></i>Search
                </a>
            </div>
        </div>

        <!-- Logout Card -->
        <div class="col-md-6 col-lg-3">
            <div class="feature-card">
                <div class="feature-icon icon-logout">
                    <i class="bi bi-box-arrow-right"></i>
                </div>
                <h5>Logout</h5>
                <p>Securely log out from the admin panel</p>
                <a href="logout" class="btn btn-feature btn-logout">
                    <i class="bi bi-power me-1"></i>Logout
                </a>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<footer>
    <p>&copy; 2025 Smart Student Management System | Built with Java, Servlets & JSP</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
