<%@page import="kr.board.model.Board"%>
<%@page import="kr.board.model.BoardDAO"%>
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
	<script>
		alert("모든 게시물이 삭제되었습니다.");
		location.href = "01_boardList.jsp?pageNum=1"
	</script>
</body>
</html>