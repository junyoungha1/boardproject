<%@page import="kr.board.model.Board"%>
<%@page import="kr.board.model.BoardDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<div id="page-content-wrapper">
	<div class="container-fluid">
		<header>
			<h1 style="color: #007bff;">게시판</h1>
		</header>
	 	<%
		BoardDAO bdao = BoardDAO.getInstance();
		ArrayList<Board> boardList = bdao.boardList();
		int cnt = boardList.size();
		int currentPageNum = Integer.parseInt(request.getParameter("pageNum"));
		int onePageBoard = 15;
		int startPage = (currentPageNum - 1) * onePageBoard;
		int endPage = cnt % onePageBoard == 0 ? cnt / onePageBoard : cnt / onePageBoard + 1;
		%>
		<div class="main">
			<table>
				<tr>
					<td style="width: 200px">번호</td>
					<td style="width: 600px">제목</td>
					<td>작성자</td>
					<td>작성일</td>
				</tr>
				<c:forEach var="b" items="${list}">
					<tr>
						<td>${b.no}</td>
						<td><a href="${ctx}/boardContent.do?no=${b.no}">${b.subject}</a></td>
						<td>${b.writer}</td>
						<td>${b.date}</td>
					</tr>
				</c:forEach>
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
						<li class="page-item"><input type="submit" class="page-link"
							value="글쓰기" /></li>
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