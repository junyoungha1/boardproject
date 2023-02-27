<%@page import="kr.member.model.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
int log = Integer.parseInt((String) session.getAttribute("log"));
ArrayList<User> userList = (ArrayList<User>) session.getAttribute("userList");
String updateId = userList.get(log).getId();
String updateName = userList.get(log).getName();
String updateGender = userList.get(log).getGender();
String str1 = "";
String str2 = "";
if (updateGender.equals("남성")) {
	str1 = "checked";
}
if (updateGender.equals("여성")) {
	str2 = "checked";
}
%>
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
	<form method="post" action="03_31_updatePro.jsp">
		<h1>회원정보 수정</h1>
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="updateId" value=<%=updateId%>
					readonly /></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="text" name="updatePw" /></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="updateName" value=<%=updateName%> /></td>
			</tr>
			<tr>
				<td>성별</td>
				<td><input type="radio" name="updateGender" value="남성"
					<%=str1%> />남성 <input type="radio" name="updateGender" value="여성"
					<%=str2%> />여성</td>
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