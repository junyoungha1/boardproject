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
	if (session.getAttribute("log").equals("admin")) {
		int log = Integer.parseInt(request.getParameter("idx"));
		ArrayList<Member> userList = MemberDAO.getInstance();
		userList.remove(log);
	%>
	<script>
		alert("회원 삭제 완료");
		location.href = "01_12_adminUserList.jsp";
	</script>
	<%
	}else{
		%>
	<script>
		alert("관리자만 접근 가능합니다");
		history.back();
	</script>
	<%
	}
	%>
</body>
</html>