<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../board/header.jsp"%>
<div id="page-content-wrapper">
	<div class="container-fluid">
		<header>
			<h1 style="color: #007bff;">회원가입</h1>
		</header>
		<div class="main" style="width: 40%; height: 50%">
			<form action="${ctx}/memberInsert.do" method="post">
				<table>
					<tr>
						<td>아이디</td>
						<td><input type="text" name="id" /></td>
					</tr>
					<tr>
						<td>패스워드</td>
						<td><input type="password" name="pass" /></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" name="name" /></td>
					</tr>
					<tr>
						<td>나이</td>
						<td><input type="text" name="age" /></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="text" name="email" /></td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td><input type="text" name="phone" /></td>
					</tr>
				</table>
					<nav aria-label="Page navigation example">
						<ul class="pagination buttonBox" style="display:flex; justify-content: center">
							<li class="page-item"><input type="submit" class="page-link"
								value="가입하기" /></li>
							<li class="page-item"><input type="button"
								class="page-link cancel" value="취소" /></li>
						</ul>
					</nav>
			</form>
		</div>
	</div>
</div>
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
	let cancel = document.querySelector(".cancel");
	cancel.addEventListener('click', ()=>{
	    location.href = '${ctx}/board/main.jsp';
	})
</script>
</body>
</html>