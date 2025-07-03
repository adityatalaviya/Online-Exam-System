<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.model.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>User Dashboard - Online Exam System</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #1c1c1c, #343a40);
            color: white;
            font-family: 'Arial', sans-serif;
            min-height: 100vh;
        }
        .navbar {
            background: #212529;
            padding: 10px 20px;
        }
        .navbar-brand img {
            height: 50px;
            margin-right: 10px;
        }
        .dashboard-container {
            display: flex;
            max-width: 1200px;
            margin: 40px auto;
            gap: 30px;
        }
        .sidebar {
            width: 250px;
            background: rgba(255, 255, 255, 0.1);
            padding: 20px;
            border-radius: 10px;
            backdrop-filter: blur(12px);
        }
        .sidebar a {
            display: block;
            padding: 10px;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin-bottom: 10px;
            transition: all 0.3s ease;
        }
        .sidebar a:hover {
            background: #ff4081;
        }
        .main-content {
            flex: 1;
            background: rgba(255, 255, 255, 0.1);
            padding: 25px;
            border-radius: 10px;
            backdrop-filter: blur(12px);
        }
        h2 {
            font-weight: bold;
            text-align: center;
            font-size: 28px;
            text-transform: uppercase;
            margin-bottom: 20px;
        }
        .table {
            border-radius: 10px;
            overflow: hidden;
            background: white;
            padding: 10px;
            border-radius: 10px;
        }
        .table th {
            background: #ff9800;
            color: white;
        }
        .table td {
            color: #333;
        }
        .btn-custom {
            background: #ff4081;
            border: none;
            color: white;
            padding: 8px 12px;
            border-radius: 5px;
            text-decoration: none;
            transition: all 0.3s ease;
        }
        .btn-custom:hover {
            background: #e91e63;
        }
        .btn-warning {
            background: #2196f3;
            border: none;
            color: white;
            padding: 8px 12px;
            border-radius: 5px;
        }
        .btn-warning:hover {
            background: #1976d2;
        }
    </style>
</head>
<body>

<!-- Navbar with Logo -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">
            <img src="images/logo.png" alt="Logo"> Online Exam System
        </a>
        <div class="ms-auto">
            <a href="logout.jsp" class="btn btn-danger">Logout</a>
        </div>
    </div>
</nav>

<% 
    userVO user = (userVO) session.getAttribute("user");
%>

<!-- Dashboard Split Layout -->
<div class="dashboard-container">
    <!-- Sidebar -->
    <div class="sidebar">
        <h4>Navigation</h4>
        <a href="${pageContext.request.contextPath}/RegController?action=dashboard">Dashboard</a>

        <!-- <a href="profile.jsp">My Profile</a> -->
        <a href="<%= request.getContextPath() %>/RegController?action=search">Refresh Exams</a>
       <!--  <a href="logout.jsp" class="btn btn-danger w-100">Logout</a> -->
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <h2>Welcome, <%= user.getName() %> </h2>
        
        <!-- Exam List Table -->
        <div class="table-responsive">
            <table class="table table-striped text-center">
                <thead>
                    <tr>
                        <th>Exam Title</th>
                        <th>Duration (Min)</th>
                        <th>Total Questions</th>
                        <th>Action</th>
                        <th>Result</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${sessionScope.data}" var="i"> 
                        <tr>
                            <td>${i.title}</td>
                            <td>${i.duration}</td>
                            <td>${i.total_questions}</td>
                            <td>
                                <a href="<%= request.getContextPath()%>/ExamController?action=exam&id=${i.id}" class="btn btn-custom">Start Exam</a>
                            </td>
                            <td>
                                <a href="<%= request.getContextPath()%>/ExamController?action=result&id=${i.id}" class="btn btn-warning">View Result</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
