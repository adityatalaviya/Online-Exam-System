<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="com.model.ResultVO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Exam Result</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background: #f4f6f9;
            font-family: 'Arial', sans-serif;
        }
        .container {
            max-width: 500px;
            margin: 80px auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            text-align: center;
            animation: fadeIn 0.8s ease-in-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .result-title {
            font-size: 24px;
            font-weight: bold;
            color: #333;
            margin-bottom: 10px;
        }
        .score {
            font-size: 28px;
            font-weight: bold;
            color: #28a745;
            margin: 15px 0;
        }
        .btn-dashboard {
            display: inline-block;
            padding: 10px 20px;
            font-size: 18px;
            color: white;
            background: #007bff;
            border-radius: 5px;
            text-decoration: none;
            transition: 0.3s;
        }
        .btn-dashboard:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>

<%
    ResultVO result = (ResultVO) request.getAttribute("result");
    String examTitle = (String) request.getAttribute("examTitle");
%>

<div class="container">
    <h2 class="result-title"> Exam Result</h2>

    <% if (result != null) { %>
        <p><strong>Exam:</strong> <%= (examTitle != null) ? examTitle : "Unknown Exam" %></p>
        <p class="score">Your Score: <%= result.getScore() %></p>
    <% } else { %>
        <p class="text-danger">No result found for this exam.</p>
    <% } %>

    <a href="user_dashboard.jsp" class="btn-dashboard">Go to Dashboard</a>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
