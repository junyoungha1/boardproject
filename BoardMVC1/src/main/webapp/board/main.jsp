<%@page import="kr.board.model.BoardDAO"%>
<%@page import="kr.board.model.Board"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<div id="page-content-wrapper">
	<div class="container-fluid">
		<h1>Simple Side</h1>
		<p>This template has a responsive menu toggling system. The menu
			will appear collapsed on smaller screens, and will appear
			non-collapsed on larger screens. When toggled using the button below,
			the menu will appear/disappear. On small screens, the page content
			will be pushed off canvas.</p>
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