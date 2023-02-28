<%@page import="kr.board.model.BoardDAO"%>
<%@page import="kr.board.model.Board"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<link rel="stylesheet" href="./style.css">
</head>
<body>
<%
ArrayList<Board> list = BoardDAO.getInstance().boardList();
%>

	<nav class="navbar navbar-expand navbar-dark bg-primary">
		<a href="#menu-toggle" id="menu-toggle" class="navbar-brand"><span
			class="navbar-toggler-icon"></span></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarsExample02" aria-controls="navbarsExample02"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarsExample02">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="00_main.jsp">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Login</a></li>
			</ul>
			<form class="form-inline my-2 my-md-0"></form>
		</div>
	</nav>
	<div id="wrapper" class="toggled">
		<!-- Sidebar -->
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav">
				<li class="sidebar-brand"><a href="#"> Start Bootstrap </a></li>
				<li><a href="01_boardList.jsp?pageNum=1">게시판</a></li>
			</ul>
		</div>
		<!-- /#sidebar-wrapper -->
		<!-- Page Content -->
		<div id="page-content-wrapper">
			<div class="container-fluid">
				<h1>Simple Side</h1>
				<p>This template has a responsive menu toggling system. The menu
					will appear collapsed on smaller screens, and will appear
					non-collapsed on larger screens. When toggled using the button
					below, the menu will appear/disappear. On small screens, the page
					content will be pushed off canvas.</p>
				<p>
					Make sure to keep all page content within the
					<code>#page-content-wrapper</code>
					.
				</p>
			</div>
		</div>
		<!-- /#page-content-wrapper -->
	</div>
	<!-- /#wrapper -->
	<!-- Bootstrap core JavaScript -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
	<!-- Menu Toggle Script -->
	<script>
		$(function() {
			$("#menu-toggle").click(function(e) {
				e.preventDefault();
				$("#wrapper").toggleClass("toggled");
			});

			$(window).resize(function(e) {
				if ($(window).width() <= 768) {
					$("#wrapper").removeClass("toggled");
				} else {
					$("#wrapper").addClass("toggled");
				}
			});
		});
	</script>
</body>
</html>