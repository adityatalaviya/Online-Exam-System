<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Add New Exam</title>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background: #f8f9fa;
        }
        .container {
            max-width: 500px;
            margin-top: 50px;
        }
        .card {
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .btn-add {
            background: #007bff;
            color: white;
        }
        .btn-add:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="card p-4">
        <h2 class="text-center text-primary">Add New Exam</h2>
        
        <form action="<%= request.getContextPath() %>/adminController?action=addExam" method="post">
            <div class="mb-3">
                <label class="form-label">Exam Title</label>
                <input type="text" class="form-control" name="title" placeholder="Enter Exam Title" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Duration (Minutes)</label>
                <input type="number" class="form-control" name="duration" placeholder="Enter Exam Duration" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Total Questions</label>
                <input type="number" class="form-control" name="total_questions" placeholder="Enter Total Questions" required>
            </div>

            <div class="d-grid">
                <button type="submit" class="btn btn-add">Add Exam</button>
            </div>
        </form>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
