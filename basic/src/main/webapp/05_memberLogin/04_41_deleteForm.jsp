<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String logVal = (String) session.getAttribute("log");
	if (logVal.equals("admin") || logVal.equals("-1")) {
	%>
	<script>
		alert("접근할 수 없습니다");
		history.back();
	</script>

	<%
	}
	%>
	<form method="post" action="04_42_deletePro.jsp">
		<h1>회원탈퇴</h1>
		<table border="1">
			<tr>
				<td>비밀번호</td>
				<td><input type="text" name="loginPw" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit"
					value="입력완료" /></td>
			</tr>
		</table>
		<br>
	</form>
</body>
</html>