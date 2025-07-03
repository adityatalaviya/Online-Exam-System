<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.concurrent.TimeUnit"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Online Exam</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background: #f5f5f5;
            font-family: 'Arial', sans-serif;
        }
        .container {
            max-width: 800px;
            margin: 40px auto;
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.2);
        }
        .question {
            padding: 15px;
            border-radius: 10px;
            background: #f8f9fa;
            margin-bottom: 20px;
        }
        .question p {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .options input {
            margin-right: 10px;
        }
        .btn-submit {
            background: #ff4081;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 18px;
            border: none;
            transition: 0.3s;
            width: 100%;
        }
        .btn-submit:hover {
            background: #e91e63;
        }
        #timer {
            position: fixed;
            top: 20px;
            right: 20px;
            background: #ff9800;
            color: white;
            padding: 15px 20px;
            border-radius: 10px;
            font-size: 18px;
            font-weight: bold;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>

<!-- Timer -->
<%
    Long startTime = (Long) session.getAttribute("startTime");
    Integer duration = (Integer) session.getAttribute("duration");

    if (startTime == null || duration == null) {
        startTime = System.currentTimeMillis();
        duration = 0;
    }

    long currentTime = System.currentTimeMillis();
    long elapsedTime = (currentTime - startTime) / 1000;
    long timeLeft = (duration * 60) - elapsedTime;

    if (timeLeft < 0) {
        timeLeft = 0;
    }
%>

<div id="timer">Time Left: <span id="timeDisplay"></span></div>

<script>
    var timeLeft = <%= timeLeft %>;

    function updateTimer() {
        var minutes = Math.floor(timeLeft / 60);
        var seconds = timeLeft % 60;
        document.getElementById("timeDisplay").innerHTML = minutes + "m " + seconds + "s";

        if (timeLeft > 0) {
            timeLeft--;
            setTimeout(updateTimer, 1000);
        } else {
            alert("Time's up! Submitting exam...");
            document.getElementById("examForm").submit();
        }
    }

    window.onload = function () {
        updateTimer();
    };
</script>

<%
    String examTitle = (String) session.getAttribute("examTitle");
%>

<!-- Exam Container -->
<div class="container">
    <h2 class="text-center text-primary">Exam: <%= (examTitle != null) ? examTitle : "Unknown Exam" %></h2>
    <hr>

    <form action="<%= request.getContextPath()%>/ExamController?action=submit" method="post" id="examForm">
        <c:forEach items="${sessionScope.que}" var="q" varStatus="loop">
            <div class="question">
                <p><b>${loop.index + 1}. ${q.question_text}</b></p>  <%-- Displays question number --%>
                <div class="options">
                    <input type="radio" name="answer_${q.id}" value="A"> ${q.option_a}<br>
                    <input type="radio" name="answer_${q.id}" value="B"> ${q.option_b}<br>
                    <input type="radio" name="answer_${q.id}" value="C"> ${q.option_c}<br>
                    <input type="radio" name="answer_${q.id}" value="D"> ${q.option_d}<br>
                </div>
            </div>
        </c:forEach>
        <input type="submit" class="btn btn-submit" value="Submit Exam">
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
