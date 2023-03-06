<%@page import="kr.board.model.BoardDAO"%>
<%@page import="kr.board.model.Board"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<div id="page-content-wrapper">
	<div class="container-fluid">
		<table>
			<tr align="center">
				<td align="center" width="1000">
				<c:if test="${center ne null }">
				<jsp:include page="${center }" />
				</c:if>
				<c:if test="${center eq null }">
				<jsp:include page="../rentcar/carMain.jsp" />
				</c:if>
				</td>
			</tr>
			<tr height="100" align="center">
				<td align="center" width="1000">
				<jsp:include page="../rentcar/bottom.jsp" />
			</tr>
		</table>
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