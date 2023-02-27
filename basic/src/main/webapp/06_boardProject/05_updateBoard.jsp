<%@page import="kr.board.model.Board"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.board.model.BoardDAO"%>
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
	int idx = Integer.parseInt(request.getParameter("idx"));
	BoardDAO bdao = BoardDAO.getInstance();
	ArrayList<Board> list = bdao.getList();
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
				<li><a href="02_addDummyPro.jsp">더미게시물 추가</a></li>
				<li><a href="03_deleteAllBoard.jsp">게시판 전체 삭제</a></li>
				<li><a href="#">Events</a></li>
				<li><a href="#">About</a></li>
				<li><a href="#">Services</a></li>
				<li><a href="#">Contact</a></li>
			</ul>
		</div>
		<div id="page-content-wrapper">
			<div class="container-fluid">
				<form method="post" action="05_updateBoardPro.jsp?idx=<%=idx%>">
					<table border="1">
						<tr>
							<td>번호</td>
							<td colspan="3" style="text-align: left;"><%=list.get(idx).getNo()%></td>
						</tr>
						<tr>
							<td>작성자</td>
							<td style="text-align: left;"><%=list.get(idx).getWriter()%></td>
							<td>작성일</td>
							<td style="text-align: left;"><%=list.get(idx).getDate()%></td>
						</tr>

						<tr>
							<td>제목</td>
							<td colspan="3"><input type="text" name="updateSubject"
								value=<%=list.get(idx).getSubject()%> /></td>
						</tr>

						<tr>
							<td>내용</td>
							<td colspan="3"><textarea name="updateContents" rows="10"
									cols="50"><%=list.get(idx).getContents()%></textarea></td>
						</tr>
					</table>
					<nav aria-label="Page navigation example">
						<ul class="pagination buttonBox">
							<li class="page-item"><input type="submit" class="page-link"
								value="수정하기" /></li>
							<li class="page-item"><input type="button"
								class="page-link delete" value="삭제하기" /></li>
							<li class="page-item"><input type="button"
								class="page-link cancel" value="취소" /></li>
						</ul>
					</nav>
					<td><input type="hidden" name="idx" value=<%=idx%> /></td>
				</form>
			</div>
		</div>

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
			let cancel = document.querySelector(".cancel");
			cancel.addEventListener('click', ()=>{
			    location.href = '01_boardList.jsp?pageNum=1';
			})
			let delBoard= document.querySelector(".delete");
			delBoard.addEventListener('click', ()=>{
			    location.href = '06_deleteBoardPro.jsp?idx=<%=idx%>';
			})
			
		</script>
</body>
</html>