<%@page import="kr.board.model.Board"%>
<%@page import="kr.board.model.BoardDAO"%>
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
	BoardDAO bdao = BoardDAO.getInstance();
	ArrayList<Board> boardList = bdao.boardList();
	int cnt = boardList.size();
	int currentPageNum = Integer.parseInt(request.getParameter("pageNum"));
	int onePageBoard = 15;
	int startPage = (currentPageNum - 1) * onePageBoard;
	int endPage = cnt % onePageBoard == 0 ? cnt / onePageBoard : cnt / onePageBoard + 1;
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
				<li class="nav-item active"><a class="nav-link"
					href="00_main.jsp">Home <span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="http://localhost:8080/basic/05_memberLogin/02_main.jsp">Login</a></li>
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
				<li><a href="02_addDummyPro.jsp">더미게시물 추가</a></li>
				<li><a href="03_deleteAllBoard.jsp">게시판 전체 삭제</a></li>
				<li><a href="#">Events</a></li>
				<li><a href="#">About</a></li>
				<li><a href="#">Services</a></li>
				<li><a href="#">Contact</a></li>
			</ul>
		</div>
		<!-- /#sidebar-wrapper -->
		<!-- Page Content -->
		<div id="page-content-wrapper">
			<div class="container-fluid">
				<header>
					<h1 style="color: #007bff;">게시판</h1>
				</header>
				<div class="main">
					<table>
						<tr>
							<td style="width: 200px">번호</td>
							<td style="width: 600px">제목</td>
							<td>작성자</td>
							<td>작성일</td>
						</tr>
						<%
						for (int i = startPage; i < currentPageNum * 15; i++) {
							if (i >= boardList.size()) {
						%>
						<tr>
							<td>&nbsp</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<%
						} else {
						%>
						<tr>
							<td><%=boardList.get(i).getNo()%></td>
							<td><a
								href="07_showBoard.jsp?no=<%=boardList.get(i).getNo()%>"><%=boardList.get(i).getSubject()%></a></td>
							<td><%=boardList.get(i).getWriter()%></td>
							<td><%=boardList.get(i).getDate()%></td>
						</tr>
						<%
						}
						}
						%>
					</table>
				</div>
				<footer>
					<nav aria-label="Page navigation example"></nav>
					<nav aria-label="Page navigation example">
						<ul class="pagination"
							style="width: 100%; display: flex; justify-content: center; align-items: center">
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Previous"> <span aria-hidden="true">«</span> <span
									class="sr-only preBtn">Previous</span>
									
							</a></li>
							<%
							for (int i = 1; i <= endPage; i++) {
							%>
							
							<li class="page-item <%if (currentPageNum == i) {%>active<%}%>"><a
								class="page-link" href="01_boardList.jsp?pageNum=<%=i%>"><%=i%></a></li>
							<%
							}
							%>
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Next"> <span aria-hidden="true">»</span> <span
									class="sr-only nextBtn">Next</span>
							</a></li>
						</ul>
					</nav>
					<nav aria-label="Page navigation example">
						<form action="04_addBoard.jsp">
							<ul class="pagination"
								style="width: 100%; padding-right: 40px; display: flex; justify-content: flex-end; align-items: center;">
								<li class="page-item"><input type="submit"
									class="page-link" value="글쓰기" /></li>
							</ul>
						</form>
					</nav>
				</footer>
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