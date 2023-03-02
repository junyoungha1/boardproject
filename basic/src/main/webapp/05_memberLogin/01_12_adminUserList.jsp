<%@page import="kr.member.model.MemberDAO"%>
<%@page import="kr.member.model.Member"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
		ArrayList<Member> userList = MemberDAO.getInstance();
	%>
	<h1>관리자 페이지(회원정보 확인하기)</h1>
	<table border="1">
		<tr>
			<td>아이디</td>
			<td>비밀번호</td>
			<td>이름</td>
			<td>성별</td>
			<td>삭제</td>
		</tr>
		<%
		for (int i = 0; i < userList.size(); i++) {
		%>
		<tr>
			<td><%=userList.get(i).getId()%></td>
			<td><%=userList.get(i).getPw()%></td>
			<td><%=userList.get(i).getName()%></td>
			<td><%=userList.get(i).getGender()%></td>
			<td><button
					onclick="location.href='01_13_adminUserDelete.jsp?idx=<%=i%>'">삭제</button></td>
		</tr>
	</table>
	<%
	}
	} else {
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