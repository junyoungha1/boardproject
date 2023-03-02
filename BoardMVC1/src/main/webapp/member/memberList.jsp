<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../board/header.jsp"%>
<script type="text/javascript">
	function deleteFn(id) {
		location.href = "${ctx}/memberDelete.do?id=" + id;
	}
</script>
<div id="page-content-wrapper">
	<div class="container-fluid">
		<header>
			<h1 style="color: #007bff;">회원목록</h1>
		</header>
		<div class="main">
			<table style="display: flex;justify-content: space-around;">
				<tr>
					<td>번호</td>
					<td>아이디</td>
					<td>비밀번호</td>
					<td>이름</td>
					<td>나이</td>
					<td>이메일</td>
					<td>전화번호</td>
					<td>삭제</td>
				</tr>
				<c:forEach var="m" items="${list}">
					<tr>
						<td>${m.num}</td>
						<td><a href="${ctx}/memberContent.do?num=${m.num}">${m.id}</a></td>
						<td>${m.pass}</td>
						<td>${m.name}</td>
						<td>${m.age}</td>
						<td>${m.email}</td>
						<td>${m.phone}</td>
						<td><input type="button" value="삭제" class="page-link"
							onclick="deleteFn('${m.id}')"></td>
					</tr>
				</c:forEach>

			</table>
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
</script>
</body>
</html>