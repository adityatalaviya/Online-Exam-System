<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="com.model.*"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Panel</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        body {
            background: #f8f9fa;
        }
        .sidebar {
            height: 100vh;
            background: #343a40;
            padding-top: 20px;
        }
        .sidebar a {
            color: white;
            text-decoration: none;
            padding: 12px 20px;
            display: block;
            transition: 0.3s;
        }
        .sidebar a:hover {
            background: #007bff;
        }
        .content {
            padding: 20px;
        }
        .table th {
            background: #007bff;
            color: white;
        }
        .table-hover tbody tr:hover {
            background: #f1f1f1;
        }
        .btn-add {
            background: #28a745;
            color: white;
        }
        .btn-add:hover {
            background: #218838;
        }
    </style>
</head>
<body>

<%  
    userVO user = (userVO) session.getAttribute("user");
    if (user == null || !"admin".equals(user.getRole())) { 
        response.sendRedirect("login.jsp");
        return;
    }
%>

<%
if (session.getAttribute("exams") == null) {
    response.sendRedirect("adminController");
    return;
}
%>

<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <nav class="col-md-3 col-lg-2 d-md-block sidebar">
            <h4 class="text-white text-center">Admin Panel</h4>
            <a href="${pageContext.request.contextPath}/adminController?action=dashboard"><i class="fa fa-home"></i> Dashboard</a>

            <a href="addexam.jsp"><i class="fa fa-plus"></i> Add Exam</a>
            <a href="<%= request.getContextPath() %>/adminController?action=viewResults"><i class="fa fa-chart-bar"></i> View Results</a>
            <a href="logout.jsp"><i class="fa fa-sign-out-alt"></i> Logout</a>
        </nav>

        <!-- Main Content -->
        <main class="col-md-9 ms-sm-auto col-lg-10 content">
            <h2 class="mb-4">Manage Exams</h2>

            <div class="d-flex justify-content-between">
                <h3>Exams List</h3>
                <a href="addexam.jsp" class="btn btn-add"><i class="fa fa-plus"></i> Add New Exam</a>
            </div>

            <table class="table table-bordered table-hover mt-3">
                <thead>
                    <tr>
                        <th>Exam ID</th>
                        <th>Title</th>
                        <th>Duration (Min)</th>
                        <th>Total Questions</th>
                        <th>Added Questions</th>
                        <th>Remaining</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${sessionScope.exams}" var="i">
                        <tr>
                            <td>${i.id }</td>
                            <td>${i.title}</td>
                            <td>${i.duration}</td>
                            <td>${i.total_questions}</td>
                            <td>${i.added_questions}</td>
                            <td>${i.total_questions - i.added_questions}</td>
                            <td>
                                <c:if test="${i.added_questions < i.total_questions}">
                                    <a href="addquestions.jsp?exam_id=${i.id}" class="btn btn-warning btn-sm"><i class="fa fa-edit"></i> Add Question</a>
                                </c:if>
                                <c:if test="${i.added_questions >= i.total_questions}">
                                    <strong class="text-success">All Questions Added</strong>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </main>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
