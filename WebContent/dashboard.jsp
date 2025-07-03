<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <style>
        body {
            background: #f8f9fa;
        }
        .container {
            margin-top: 50px;
        }
        .card {
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .card-icon {
            font-size: 3rem;
            color: white;
        }
        .card-title {
            font-weight: bold;
        }
    </style>
</head>
<body>

<div class="container">
    <h2 class="mb-4 text-center">Admin Dashboard</h2>
    
    <div class="row">
        <!-- Total Users Card -->
        <div class="col-md-6">
            <div class="card bg-primary text-white text-center p-4">
                <i class="fa fa-users card-icon"></i>
                <h4 class="card-title">Total Users</h4>
                <h2>${sessionScope.totalUsers}</h2>
            </div>
        </div>

        <!-- Total Exams Card -->
        <div class="col-md-6">
            <div class="card bg-success text-white text-center p-4">
                <i class="fa fa-book card-icon"></i>
                <h4 class="card-title">Total Exams</h4>
                <h2>${sessionScope.totalExams}</h2>
            </div>
        </div>
    </div>
</div>

</body>
</html>
