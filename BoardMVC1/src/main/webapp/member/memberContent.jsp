<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../board/header.jsp"%>

<div id="page-content-wrapper">
	<div class="container-fluid">
		<header>
			<c:if test="${m==null}">
				<h1 style="color: #007bff;">일치하는 회원이 없습니다</h1>
			</c:if>
			<c:if test="${m ne null}">
				<h1 style="color: #007bff;">${m.name}회원상세보기</h1>
		</header>
		<div class="main">
			<form action="${ctx}/memberUpdate.do" method="post">
				<input type="hidden" name="num" value="${m.num}" />
				<table>
					<tr>
						<td>번호</td>
						<td class="left">${m.num}</td>
					</tr>
					<tr>
						<td>아이디</td>
						<td class="left">${m.id}</td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td class="left">${m.pass}</td>
					</tr>
					<tr>
						<td>이름</td>
						<td class="left">${m.name}</td>
					</tr>
					<tr>
						<td>나이</td>
						<td><input class="col-12" type="text" name="age"
							value="${m.age}" /></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input class="col-12" type="text" name="email"
							value="${m.email}" /></td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td><input class="col-12" type="text" name="phone"
							value="${m.phone}" /></td>
					</tr>

					<tr>
						<td colspan="2" align="center"><input type="submit"
							value="수정하기" class='col-5 btn btn-primary' /></td>
					</tr>
				</table>
			</form>
		</div>
		</c:if>
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