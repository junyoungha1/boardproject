<%@page import="kr.member.model.MemberDAO"%>
<%@page import="kr.member.model.Member"%>
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
	request.setCharacterEncoding("utf-8");
			String id = request.getParameter("joinId");
			String pw = request.getParameter("joinPw");
			String name = request.getParameter("joinName");
			String gender = request.getParameter("joinGender");
			ArrayList<Member> userList = MemberDAO.getInstance();
			MemberDAO.addUser(id, pw, name, gender);
	%>

	<script>
		alert("회원가입 완료");
		location.href = "02_main.jsp"
	</script>
</body>
</html>