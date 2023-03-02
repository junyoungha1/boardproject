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
			int log = Integer.parseInt((String) session.getAttribute("log"));
			ArrayList<Member> userList = MemberDAO.getInstance();
			String pw = request.getParameter("updatePw");
			String newName = request.getParameter("updateName");
			String newGender = request.getParameter("updateGender");
			if (userList.get(log).getPw().equals(pw)) {
		userList.get(log).setName(newName);
		userList.get(log).setGender(newGender);
		session.setAttribute("userList", userList);
	%>
	<script>
		alert("회원 정보 수정 완료");
		location.href = "02_main.jsp"
	</script>
	<%
	} else {
	%>
	<script>
		alert("비밀번호가 일치하지 않습니다.");
		history.back();
	</script>
	<%
	}
	%>
</body>
</html>