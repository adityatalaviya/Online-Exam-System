<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Register - Online Exam System</title>
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
            background: linear-gradient(to right, #2193b0, #6dd5ed);
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
            background-color: #2193b0;
            border: none;
        }
        .btn-primary:hover {
            background-color: #19718a;
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
        <h2>Welcome to Online Exam System</h2>
        <p>Register now and start your learning journey with online exams.</p>
        <img src="images/exam-icon.png" alt="Exam Icon" width="100">
    </div>

    <!-- Right Section (Register Form) -->
    <div class="right-section col-md-6">
        <h3 class="text-center">Register</h3>
        <form action="<%= request.getContextPath() %>/RegController?action=register" method="post">
            <div class="mb-3">
                <label class="form-label">Name</label>
                <input type="text" name="name" class="form-control" required placeholder="Enter your name">
            </div>
            <div class="mb-3">
                <label class="form-label">Email</label>
                <input type="email" name="email" class="form-control" required placeholder="Enter your email">
            </div>
            <div class="mb-3">
                <label class="form-label">Password</label>
                <input type="password" name="password" class="form-control" required placeholder="Enter your password">
            </div>
            <button type="submit" class="btn btn-primary w-100">Register</button>
        </form>
        <p class="text-center mt-3">Already have an account? <a href="login.jsp" class="text-primary">Login here</a></p>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
