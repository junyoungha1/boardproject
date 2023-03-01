<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file= "header.jsp" %>
		<!-- /#sidebar-wrapper -->
		<!-- Page Content -->
		<div id="page-content-wrapper">
			<div class="container-fluid">
				<form method="post" action="${ctx}/boardInsert.do">
					<table>

						<tr>
							<td>작성자</td>
							<td><input type="text" name="writer" /></td>
						</tr>

						<tr>
							<td>제목</td>
							<td><input type="text" name="subject" /></td>
						</tr>

						<tr>
							<td>내용</td>
							<td><textarea name="contents" rows="10" cols="50"></textarea></td>
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