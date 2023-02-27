<%@page import="kr.member.model.UserDAO"%>
<%@page import="kr.member.model.User"%>
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
	int log = Integer.parseInt((String) session.getAttribute("log"));
	ArrayList<User> userList = UserDAO.getInstance();
	String pw = request.getParameter("loginPw");
	if (userList.get(log).getPw().equals(pw)) {
	%>

	<script>
		alert("회원 탈퇴 완료");
		location.href = "02_main.jsp";
	</script>
	<%
	userList.remove(log);
	session.setAttribute("userList", userList);
	session.setAttribute("log", "-1");
	} else {
	%>
	<script>
		alert("비밀번호가 일치하지 않습니다");
		history.back();
	</script>
	<%
	}
	%>
</body>
</html>