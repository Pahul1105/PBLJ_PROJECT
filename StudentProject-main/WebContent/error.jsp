<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error - Smart Student Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background: #f0f2f5;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .error-card {
            background: white;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            padding: 50px;
            text-align: center;
            max-width: 500px;
        }
        .error-icon {
            font-size: 70px;
            color: #f5576c;
            margin-bottom: 20px;
        }
        .error-card h2 {
            font-weight: 700;
            color: #333;
            margin-bottom: 10px;
        }
        .error-card p {
            color: #777;
            margin-bottom: 25px;
        }
        .btn-home {
            background: linear-gradient(135deg, #667eea, #764ba2);
            border: none;
            border-radius: 10px;
            padding: 12px 30px;
            font-weight: 600;
            color: white;
        }
        .btn-home:hover { color: white; }
    </style>
</head>
<body>

<div class="error-card">
    <div class="error-icon">
        <i class="bi bi-exclamation-triangle-fill"></i>
    </div>
    <h2>Oops! Something Went Wrong</h2>
    <p>An unexpected error occurred. Please try again or return to the dashboard.</p>
    
    <%
        String errorMsg = (String) request.getAttribute("errorMessage");
        if (errorMsg != null) {
    %>
        <div class="alert alert-danger">
            <i class="bi bi-bug me-2"></i><%= errorMsg %>
        </div>
    <% } %>
    
    <a href="dashboard.jsp" class="btn btn-home">
        <i class="bi bi-house me-2"></i>Go to Dashboard
    </a>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
