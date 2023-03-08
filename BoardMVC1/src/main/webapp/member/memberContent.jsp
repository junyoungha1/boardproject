<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="page-content-wrapper">
	<div class="container-fluid">
		<header>
				<h1 style="color: #007bff;">${log} 회원 정보 수정</h1>
		</header>
		<div class="main">
			<form action="${ctx}/memberUpdate.do" method="post">
				<table>
					<tr>
						<td>아이디</td>
						<td>${m.id}</td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input class="col-12" type="text" name="pw"
							value="" /></td>
					</tr>
					<tr>
						<td>email</td>
						<td><input class="col-12" type="text" name="email"
							value="${m.email}" /></td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td><input class="col-12" type="text" name="tel"
							value="${m.tel}" /></td>
					</tr>
					<tr>
						<td>취미</td>
						<td><input class="col-12" type="text" name="hobby"
							value="${m.hobby}" /></td>
					</tr>
					<tr>
						<td>직업</td>
						<td><input class="col-12" type="text" name="job"
							value="${m.job}" /></td>
					</tr>
					<tr>
						<td>나이</td>
						<td><input class="col-12" type="text" name="age"
							value="${m.age}" /></td>
					</tr>
					<tr>
						<td>자기소개</td>
						<td><input class="col-12" type="text" name="info"
							value="${m.info}" /></td>
					</tr>
					

					<tr>
						<td colspan="2" align="center"><input type="submit"
							value="수정하기" class='page-link' /></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>
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