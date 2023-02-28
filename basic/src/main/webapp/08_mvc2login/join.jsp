<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="${ contextPath}/join.do">
		<h1>회원가입</h1>
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="joinId" /></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="text" name="joinPw" /></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="joinName" /></td>
			</tr>
			<tr>
				<td>성별</td>
				<td><input type="radio" name="joinGender" value="남성" />남성 <input
					type="radio" name="joinGender" value="여성" />여성</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit"
					value="입력완료" /></td>
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