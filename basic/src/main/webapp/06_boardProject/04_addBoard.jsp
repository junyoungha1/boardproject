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
		<!-- /#sidebar-wrapper -->
		<!-- Page Content -->
		<div id="page-content-wrapper">
			<div class="container-fluid">
				<form method="post" action="04_addBoardPro.jsp">
					<table>

						<tr>
							<td>작성자</td>
							<td><input type="text" name="newBoardId" /></td>
						</tr>

						<tr>
							<td>제목</td>
							<td><input type="text" name="newBoardSubject" /></td>
						</tr>

						<tr>
							<td>내용</td>
							<td><textarea name="newBoardContents" rows="10" cols="50"></textarea></td>
						</tr>
					</table>
					<nav aria-label="Page navigation example">
						<ul class="pagination buttonBox">
							<li class="page-item"><input type="submit"
								class="page-link" value="글쓰기" /></li>
							<li class="page-item"><input type="button"
								class="page-link cancel" value="취소" /></li>
						</ul>
					</nav>
				</form>
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
		
		let cancel = document.querySelector(".cancel");
		cancel.addEventListener('click', ()=>{
		    location.href = '01_boardList.jsp?pageNum=1';
		})
		
	</script>

</body>
</html>