<%@page import="kr.board.model.Board"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.board.model.BoardDAO"%>
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
	int idx = Integer.parseInt(request.getParameter("idx"));
	bdao.removeBoard(idx);
%>
	<script>
alert("게시글이 삭제되었습니다.");
location.href="01_boardList.jsp?pageNum=1";
</script>
</body>
</html>