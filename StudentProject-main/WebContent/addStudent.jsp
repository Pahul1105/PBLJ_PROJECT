<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Session check
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Student - Smart Student Management System</title>
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
        .form-card {
            background: white;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            padding: 40px;
            margin-top: 30px;
        }
        .form-card h3 {
            font-weight: 700;
            color: #333;
            margin-bottom: 5px;
        }
        .form-card .subtitle {
            color: #777;
            margin-bottom: 30px;
        }
        .form-control {
            border-radius: 10px;
            padding: 12px 15px;
            border: 2px solid #e0e0e0;
        }
        .form-control:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
        }
        .form-label {
            font-weight: 600;
            color: #555;
        }
        .btn-submit {
            background: linear-gradient(135deg, #11998e, #38ef7d);
            border: none;
            border-radius: 10px;
            padding: 12px 30px;
            font-weight: 600;
            color: white;
            transition: transform 0.2s, box-shadow 0.2s;
        }
        .btn-submit:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(17, 153, 142, 0.4);
            color: white;
        }
        .btn-back {
            background: #6c757d;
            border: none;
            border-radius: 10px;
            padding: 12px 30px;
            font-weight: 600;
            color: white;
        }
        .btn-back:hover {
            background: #5a6268;
            color: white;
        }
        .page-icon {
            font-size: 40px;
            color: #11998e;
            margin-bottom: 10px;
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
            <div class="form-card text-center">
                <!-- Icon & Title -->
                <div class="page-icon">
                    <i class="bi bi-person-plus-fill"></i>
                </div>
                <h3>Add New Student</h3>
                <p class="subtitle">Fill in the details to register a new student</p>

                <!-- Error Message -->
                <%
                    String errorMessage = (String) session.getAttribute("errorMessage");
                    if (errorMessage != null) {
                        session.removeAttribute("errorMessage");
                %>
                    <div class="alert alert-danger alert-dismissible fade show text-start" role="alert">
                        <i class="bi bi-exclamation-triangle-fill me-2"></i><%= errorMessage %>
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                <% } %>

                <!-- Add Student Form -->
                <form action="addStudent" method="POST" class="text-start">
                    <!-- Student Name -->
                    <div class="mb-3">
                        <label for="name" class="form-label">
                            <i class="bi bi-person me-1"></i>Student Name
                        </label>
                        <input type="text" class="form-control" id="name" name="name" 
                               placeholder="Enter student's full name" required>
                    </div>

                    <!-- Student Marks -->
                    <div class="mb-4">
                        <label for="marks" class="form-label">
                            <i class="bi bi-award me-1"></i>Marks (0-100)
                        </label>
                        <input type="number" class="form-control" id="marks" name="marks" 
                               placeholder="Enter marks" min="0" max="100" step="0.1" required>
                    </div>

                    <!-- Buttons -->
                    <div class="d-flex gap-3">
                        <button type="submit" class="btn btn-submit flex-grow-1">
                            <i class="bi bi-plus-circle me-2"></i>Add Student
                        </button>
                        <a href="dashboard.jsp" class="btn btn-back">
                            <i class="bi bi-arrow-left me-1"></i>Back
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
