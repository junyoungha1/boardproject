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
request.setCharacterEncoding("utf-8");
BoardDAO bdao = BoardDAO.getInstance();
String asd = request.getParameter("idx");
int idx = Integer.parseInt(request.getParameter("idx"));
int no = Integer.parseInt(request.getParameter("updateBoardNo"));
String id = request.getParameter("updateBoardId");
String date = request.getParameter("updateBoardDate");
String subject = request.getParameter("updateBoardSubject");
String contents = request.getParameter("updateBoardContents");
bdao.setBoard(idx, no, id, date, subject, contents);

%>
	<script>
		alert("게시글 수정 완료");
		location.href = "01_boardList.jsp";
	</script>

</body>
</html>