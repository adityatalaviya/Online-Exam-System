<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>All Student Results</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <style>
        body {
            background: linear-gradient(to right, #1e3c72, #2a5298);
            color: white;
            font-family: 'Poppins', sans-serif;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        .container {
            max-width: 1200px;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.3);
        }
        .left-panel {
            width: 45%;
            padding: 30px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            text-align: center;
        }
        .left-panel h2 {
            font-size: 2rem;
            font-weight: bold;
            color: #f8f9fa;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3);
        }
        .left-panel p {
            font-size: 1.1rem;
            opacity: 0.8;
        }
        .right-panel {
            width: 55%;
            overflow-x: auto;
        }
        .table-container {
            background: rgba(255, 255, 255, 0.2);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
        }
        .table thead {
            background: #ff8c00;
            color: white;
            text-align: center;
        }
        .table tbody tr:hover {
            background: rgba(255, 255, 255, 0.1);
            transition: 0.3s;
        }
        .btn-back {
            background: #ff8c00;
            color: white;
            font-weight: bold;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            text-decoration: none;
        }
        .btn-back:hover {
            background: #e07b00;
            color: white;
        }
        @media (max-width: 992px) {
            .container {
                flex-direction: column;
                text-align: center;
            }
            .left-panel, .right-panel {
                width: 100%;
                padding: 20px 0;
            }
        }
    </style>
</head>
<body>

<div class="container">
    
    <!-- Left Side Panel -->
    <div class="left-panel">
        <h2> Student Exam Results</h2>
        <p>View and analyze the scores of all students in different exams. Stay informed and track performance effortlessly.</p>
        <a href="admin.jsp" class="btn btn-back">&larr; Back to Admin Panel</a>
    </div>

    <!-- Right Side Panel -->
    <div class="right-panel">
        <div class="table-container">
            <table class="table table-hover text-white">
                <thead>
                    <tr>
                        <th>User ID</th>
                        <th>Student Name</th>
                        <th>Exam ID</th>
                        <th>Exam Title</th>
                        <th>Score</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${sessionScope.results}" var="r">
                        <tr class="text-center">
                            <td>${r.user_id}</td>
                            <td>${r.userName}</td>
                            <td>${r.exam_id}</td>
                            <td>${r.examTitle}</td>
                            <td class="fw-bold">${r.score}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

</div>

<!-- Bootstrap JS (Optional for interactivity) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
