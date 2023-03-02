<%@page import="kr.member.model.MemberDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page import="kr.member.model.Member"%>
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
	ArrayList<Member> userList = MemberDAO.getInstance();
			boolean logChk = false;
			int log = -1;
			String loginId = request.getParameter("loginId");
			String loginPw = request.getParameter("loginPw");
			if (loginId.equals("admin") && loginPw.equals("admin")) {
		session.setAttribute("log", "admin");
		response.sendRedirect("01_11_adminMain.jsp");
			} else {
		for (int i = 0; i < userList.size(); i++) {
			if (userList.get(i).getId().equals(loginId)) {
		log = i;
		if (userList.get(i).getPw().equals(loginPw)) {
			logChk = true;
		}
			}
		}

		if (logChk) {
			session.setAttribute("log", log + "");
			response.sendRedirect("02_main.jsp");
		} else {
	%>
	<script>
		alert("아이디 혹은 비밀번호를 확인하세요");
		history.back();
	</script>
	<%
	}
	}
	%>
</body>
</html>