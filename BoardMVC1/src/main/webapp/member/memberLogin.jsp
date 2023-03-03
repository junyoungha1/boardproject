<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../board/header.jsp"%>
<script type="text/javascript">
	function check() {
		if ($('#user_id').val() == '') {
			alert("아이디를 입력하세요");
			return false;
		}
		if ($('#password').val() == '') {
			alert("비밀번호를 입력하세요");
			return false;
		}
		return true;
	}
</script>

<div id="page-content-wrapper">
	<div class="container-fluid">
		<header>
			<h1 style="color: #007bff;">로그인</h1>
		</header>
		<div class="main" style="width: 30%; height: 15%">
			<form action="${ctx}/memberLogin.do" method="post">
				<table>
					<tr>
						<td>아이디</td>
						<td><input type="text" name="id" /></td>
					</tr>
					<tr>
						<td>패스워드</td>
						<td><input type="password" name="pw" /></td>
					</tr>
				</table>
				<nav aria-label="Page navigation example">
					<ul class="pagination buttonBox">
						<li class="page-item"><input type="submit" class="page-link"
							value="로그인" /></li>
						<li class="page-item"><input type="button"
							class="page-link join" value="회원가입" /></li>
					</ul>
				</nav>
			</form>
		</div>
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
	$(".join").click(function(e){
		 location.href = '${ctx}/member/memberInsert.jsp';
	})
</script>
</body>
</html>
