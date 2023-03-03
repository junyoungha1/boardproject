<%@page import="kr.board.model.Board"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.board.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<div id="page-content-wrapper">
	<div class="container-fluid">
		<header>
			<h1 style="color: #007bff;">${b.subject }</h1>
		</header>
		<form method="post"
			action="${ctx}/boardContent.do?no=${b.no}&conPath=update">
			<table border="1">
				<tr>
					<td>번호</td>
					<td colspan="3" style="text-align: left;">${b.no }</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td style="text-align: left;">${b.writer }</td>
					<td>작성일</td>
					<td style="text-align: left;">${b.date }</td>
				</tr>

				<tr>
					<td>제목</td>
					<td colspan="3"><input type="text" name="subject"
						value=${b.subject } readonly /></td>
				</tr>

				<tr>
					<td>내용</td>
					<td colspan="3"><textarea name="contents" rows="10" cols="50"
							readonly>${b.contents }</textarea></td>
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
	$(".cancel").click(function() {
		location.href = 'boardList.jsp?pageNum=1';
	})
	$(".delete").click(function() {
		location.href = '${ctx}/boardDelete.do?no=${b.no}';
	})
</script>
</body>
</html>