<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.model.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Student Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .dashboard-container {
            max-width: 900px;
            margin: 40px auto;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .card {
            transition: 0.3s;
        }
        .card:hover {
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container">
            <a class="navbar-brand" href="#">Online Exam System</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="user_dashboard.jsp">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="user_dashboard.jsp">Exams</a></li>
                    <li class="nav-item"><a class="nav-link" href="user_dashboard.jsp">Results</a></li>
                    <li class="nav-item"><a class="nav-link" href="logout.jsp">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>

<% 
    userVO user = (userVO) session.getAttribute("user");
%>
    <!-- Dashboard Content -->
    <div class="dashboard-container">
        <h2 class="text-center text-primary">Welcome, <%= user.getName() %></h2>
        <hr>
        <div class="row text-center">
            <!-- Total Exams Card -->
            <div class="col-md-6">
                <div class="card text-white bg-warning mb-3">
                    <div class="card-body">
                        <h4 class="card-title">Total Exams</h4>
                        <h2>${sessionScope.totalExams}</h2>
                    </div>
                </div>
            </div>
            <!-- Exams Attempted Card -->
            <div class="col-md-6">
                <div class="card text-white bg-success mb-3">
                    <div class="card-body">
                        <h4 class="card-title">Exams Attempted</h4>
                        <h2>${sessionScope.attemptedExams}</h2>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="text-center mt-4">
            <a href="user_dashboard.jsp" class="btn btn-primary btn-lg">Take a New Exam</a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>