<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Smart Student Management System</title>
    <!-- Bootstrap 5 CSS (CDN) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .login-card {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
            padding: 40px;
            width: 100%;
            max-width: 420px;
        }
        .login-card h2 {
            color: #333;
            font-weight: 700;
            margin-bottom: 10px;
        }
        .login-card .subtitle {
            color: #666;
            margin-bottom: 30px;
        }
        .form-control {
            border-radius: 10px;
            padding: 12px 15px;
            border: 2px solid #e0e0e0;
            transition: border-color 0.3s;
        }
        .form-control:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
        }
        .btn-login {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            border-radius: 10px;
            padding: 12px;
            font-size: 16px;
            font-weight: 600;
            width: 100%;
            color: white;
            transition: transform 0.2s, box-shadow 0.2s;
        }
        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
            color: white;
        }
        .logo-icon {
            font-size: 50px;
            color: #667eea;
            margin-bottom: 15px;
        }
        .input-group-text {
            background: transparent;
            border: 2px solid #e0e0e0;
            border-right: none;
            border-radius: 10px 0 0 10px;
        }
        .input-group .form-control {
            border-left: none;
            border-radius: 0 10px 10px 0;
        }
        .credentials-info {
            background: #f8f9fa;
            border-radius: 10px;
            padding: 12px;
            margin-top: 20px;
            font-size: 0.85rem;
        }
    </style>
</head>
<body>

<div class="login-card text-center">
    <!-- Logo / Icon -->
    <div class="logo-icon">
        <i class="bi bi-mortarboard-fill"></i>
    </div>

    <!-- Title -->
    <h2>Admin Login</h2>
    <p class="subtitle">Smart Student Management System</p>

    <!-- Error Message Alert -->
    <% 
        String errorMessage = (String) request.getAttribute("errorMessage");
        if (errorMessage != null) { 
    %>
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <i class="bi bi-exclamation-triangle-fill me-2"></i><%= errorMessage %>
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    <% } %>

    <!-- Login Form -->
    <form action="login" method="POST">
        <!-- Username Field -->
        <div class="input-group mb-3">
            <span class="input-group-text"><i class="bi bi-person-fill"></i></span>
            <input type="text" class="form-control" name="username" 
                   placeholder="Enter Username" required autofocus>
        </div>

        <!-- Password Field -->
        <div class="input-group mb-4">
            <span class="input-group-text"><i class="bi bi-lock-fill"></i></span>
            <input type="password" class="form-control" name="password" 
                   placeholder="Enter Password" required>
        </div>

        <!-- Login Button -->
        <button type="submit" class="btn btn-login">
            <i class="bi bi-box-arrow-in-right me-2"></i>Login
        </button>
    </form>

    <!-- Default Credentials Info -->
    <div class="credentials-info text-muted">
        <i class="bi bi-info-circle me-1"></i>
        Default: <strong>admin</strong> / <strong>admin123</strong>
    </div>
</div>

<!-- Bootstrap 5 JS (CDN) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
