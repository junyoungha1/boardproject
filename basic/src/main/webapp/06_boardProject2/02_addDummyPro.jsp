<%@page import="boardProject.Board"%>
<%@page import="java.util.ArrayList"%>
<%@page import="boardProject.BoardDAO"%>
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
	BoardDAO bdao = BoardDAO.getInstance();
	ArrayList<Board> list = bdao.getList();
	bdao.addDummy();
	%>
	<script>
		alert("더미 게시글 추가 완료");
		history.back();
	</script>
</body>
</html>