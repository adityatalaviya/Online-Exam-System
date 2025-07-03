<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Add Question</title>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    
    <style>
        body {
            background: #f8f9fa;
        }
        .container {
            max-width: 600px;
            margin-top: 50px;
        }
        .card {
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .btn-submit {
            background: #28a745;
            color: white;
        }
        .btn-submit:hover {
            background: #218838;
        }
        .btn-back {
            margin-top: 10px;
            display: block;
            text-align: center;
        }
    </style>
</head>
<body>

<%
    String examId = request.getParameter("exam_id");
    if (examId == null) {
        examId = ""; // Default empty value if no exam ID is passed
    }
%>

<div class="container">
    <div class="card p-4">
        <h2 class="text-center text-success">Add Question</h2>

        <form action="<%= request.getContextPath() %>/QueController?action=addQue" method="post">
            
            <div class="mb-3">
                <label class="form-label">Exam ID</label>
                <input type="number" class="form-control" name="exam_id" value="<%= examId %>" readonly required>
            </div>

            <div class="mb-3">
                <label class="form-label">Question</label>
                <input type="text" class="form-control" name="question_text" placeholder="Enter Question" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Option A</label>
                <input type="text" class="form-control" name="option_a" placeholder="Enter Option A" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Option B</label>
                <input type="text" class="form-control" name="option_b" placeholder="Enter Option B" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Option C</label>
                <input type="text" class="form-control" name="option_c" placeholder="Enter Option C" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Option D</label>
                <input type="text" class="form-control" name="option_d" placeholder="Enter Option D" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Correct Option</label>
                <input type="text" class="form-control" name="correct_option" placeholder="Enter Correct Option (A, B, C, or D)" required>
            </div>

            <div class="d-grid">
                <button type="submit" class="btn btn-submit">Add Question</button>
            </div>

        </form>

        <a href="admin.jsp" class="btn btn-outline-secondary btn-back">Back to Admin</a>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
