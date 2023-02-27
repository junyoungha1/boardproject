<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="03_22_loginPro.jsp">
		<h1>로그인 페이지</h1>
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="loginId" /></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="text" name="loginPw" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="로그인" /></td>
			</tr>
		</table>
		<br>
	</form>
	<table>
		<form method="post" action="02_main.jsp">
			<input type="submit" value="메인화면">
		</form>
	</table>
</body>
</html>