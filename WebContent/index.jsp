<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.model.userVO"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Online Exam System</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<style>
body {
	font-family: Arial, sans-serif;
}

.hero {
	height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
	background: linear-gradient(to right, #007bff, #6610f2);
	color: white;
	text-align: center;
}

.hero h1 {
	font-size: 3rem;
}

.hero p {
	font-size: 1.2rem;
	margin-bottom: 20px;
}

.stats {
	padding: 50px 0;
	background: #f8f9fa;
	text-align: center;
}

.stats .stat-box {
	padding: 20px;
	background: white;
	border-radius: 10px;
	box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
}

footer {
	background: #222;
	color: white;
	padding: 15px 0;
	text-align: center;
}

footer a {
	color: #f8f9fa;
	text-decoration: none;
}

footer a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>

	<%
		// Check if the user is logged in
		com.model.userVO user = (com.model.userVO) session.getAttribute("user");
	%>

	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand" href="#"> <img
				src="images/logo.png" alt="Logo" width="50" height="50"
				class="d-inline-block align-text-top"> Online Exam
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto">
					<%
						if (user == null) {
					%>
					<li class="nav-item"><a class="nav-link" href="register.jsp">Register</a></li>
					<li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
					<%
						} else {
					%>
					<li class="nav-item"><a class="nav-link"
						href="user_dashboard.jsp">Dashboard</a></li>
					<li class="nav-item"><a class="nav-link" href="logout.jsp">Logout</a></li>
					<%
						}
					%>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Hero Section -->
	<section class="hero">
		<div class="container">
			<h1>Welcome to the Online Exam System</h1>
			<p>Enhance your skills by taking online exams anytime, anywhere!</p>
			<a href="<%=(user == null) ? "register.jsp" : "user_dashboard.jsp"%>"
				class="btn btn-light btn-lg"> Start Exam </a>
		</div>
	</section>

	<!-- Statistics Section -->
	<section class="stats">
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<div class="stat-box">
						<h3>500+</h3>
						<p>Registered Students</p>
					</div>
				</div>
				<div class="col-md-4">
					<div class="stat-box">
						<h3>100+</h3>
						<p>Available Exams</p>
					</div>
				</div>
				<div class="col-md-4">
					<div class="stat-box">
						<h3>95%</h3>
						<p>Success Rate</p>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Footer -->
	<footer>
		<div class="container">
			<p>&copy; 2025 Online Exam System. All rights reserved.</p>
			<p>
				Contact us: <a href="mailto:support@example.com">support@example.com</a>
			</p>
			<p>
				<a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a>
			</p>
		</div>
	</footer>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
