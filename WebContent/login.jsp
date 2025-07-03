<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login - Online Exam System</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #f8f9fa;
        }
        .container {
            max-width: 900px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            overflow: hidden;
        }
        .left-section {
            background: linear-gradient(to right, #ff7e5f, #feb47b);
            color: white;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 30px;
            text-align: center;
        }
        .left-section h2 {
            font-weight: bold;
        }
        .right-section {
            padding: 40px;
        }
        .btn-primary {
            background-color: #ff7e5f;
            border: none;
        }
        .btn-primary:hover {
            background-color: #e76d52;
        }
        @media (max-width: 768px) {
            .left-section {
                display: none;
            }
            .right-section {
                width: 100%;
            }
        }
    </style>
</head>
<body>

<div class="container d-flex">
    <!-- Left Section -->
    <div class="left-section col-md-6">
        <h2>Welcome Back!</h2>
        <p>Login and continue your exam journey.</p>
        <img src="images/exam-icon.png" alt="Login Icon" width="100">
    </div>

    <!-- Right Section (Login Form) -->
    <div class="right-section col-md-6">
        <h3 class="text-center">Login</h3>
        <form action="<%= request.getContextPath() %>/RegController?action=login" method="post">
            <div class="mb-3">
                <label class="form-label">Email</label>
                <input type="email" name="email" class="form-control" required placeholder="Enter your email">
            </div>
            <div class="mb-3">
                <label class="form-label">Password</label>
                <input type="password" name="password" class="form-control" required placeholder="Enter your password">
            </div>
            <button type="submit" class="btn btn-primary w-100">Login</button>
        </form>
        <p class="text-center mt-3">Don't have an account? <a href="register.jsp" class="text-primary">Register here</a></p>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
