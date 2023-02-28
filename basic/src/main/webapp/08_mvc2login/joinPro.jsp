<%@page import="kr.member.model.UserDAO"%>
<%@page import="kr.member.model.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	ArrayList<User> userList = UserDAO.getInstance();
	UserDAO.addUser(${joinId}, pw, name, gender);
	%>

	<script>
		alert("회원가입 완료");
		location.href = "login.jsp";
	</script>
</body>
</html>