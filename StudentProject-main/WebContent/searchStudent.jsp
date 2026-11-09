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
    <title>Search Student - Smart Student Management System</title>
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
        .search-card {
            background: white;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            padding: 40px;
            margin-top: 30px;
        }
        .search-card h3 {
            font-weight: 700;
            color: #333;
            margin-bottom: 5px;
        }
        .search-card .subtitle {
            color: #777;
            margin-bottom: 30px;
        }
        .form-control {
            border-radius: 10px;
            padding: 12px 15px;
            border: 2px solid #e0e0e0;
        }
        .form-control:focus {
            border-color: #f093fb;
            box-shadow: 0 0 0 0.2rem rgba(240, 147, 251, 0.25);
        }
        .form-label {
            font-weight: 600;
            color: #555;
        }
        .btn-search {
            background: linear-gradient(135deg, #f093fb, #f5576c);
            border: none;
            border-radius: 10px;
            padding: 12px 30px;
            font-weight: 600;
            color: white;
            transition: transform 0.2s, box-shadow 0.2s;
        }
        .btn-search:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(245, 87, 108, 0.4);
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
            color: #f5576c;
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
            <div class="search-card text-center">
                <!-- Icon & Title -->
                <div class="page-icon">
                    <i class="bi bi-search"></i>
                </div>
                <h3>Search Student</h3>
                <p class="subtitle">Enter a student ID to find their record</p>

                <!-- Search Form -->
                <form action="searchStudent" method="GET" class="text-start">
                    <!-- Student ID -->
                    <div class="mb-4">
                        <label for="id" class="form-label">
                            <i class="bi bi-hash me-1"></i>Student ID
                        </label>
                        <input type="number" class="form-control" id="id" name="id" 
                               placeholder="Enter Student ID (e.g., 1, 2, 3...)" 
                               min="1" required autofocus>
                    </div>

                    <!-- Buttons -->
                    <div class="d-flex gap-3">
                        <button type="submit" class="btn btn-search flex-grow-1">
                            <i class="bi bi-search me-2"></i>Search
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
