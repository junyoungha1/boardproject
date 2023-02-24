<%@page import="memberLogin.UserDAO"%>
<%@page import="memberLogin.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
	ArrayList<User> userList = UserDAO.getInstance();
	int log = Integer.parseInt((String) session.getAttribute("log"));
	if (log != -1) {
	%>

	<h1>
		<%=userList.get(log).getName()%>님의 페이지
	</h1>
	<table border="1">
		<tr>
			<td><a href="03_23_logoutPro.jsp"> 로그아웃 </a> <t> <a
					href="03_31_updateForm.jsp"> 회원정보수정 </a> <t> <a
					href="04_41_deleteForm.jsp"> 회원탈퇴 </a></td>
		</tr>
	</table>
	<%
	} else {
	%>
	<h1>메인페이지</h1>

	<table border="1">
		<tr>
			<td><a href="03_11_joinForm.jsp"> 회원가입 </a> <t> <a
					href="03_21_loginForm.jsp"> 로그인 </a></td>
		</tr>
	</table>
	<%
	}
	%>
</body>
</html>
