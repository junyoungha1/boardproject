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
	request.setCharacterEncoding("utf-8");
	int no = Integer.parseInt(request.getParameter("newBoardNo"));
	String id = request.getParameter("newBoardId");
	String date = BoardDAO.getInstance().getToday();
	String subject = request.getParameter("newBoardSubject");
	String contents = request.getParameter("newBoardContents");
	if (id.equals("") || subject.equals("") || contents.equals("")) {
	%>
	<script>
		alert("작성되지 않은 항목이 있습니다.");
		history.back();
	</script>
	<%
	} else {
	BoardDAO.getInstance().addBoard(no, id, date, subject, contents);
	%>
	<script>
		alert("게시글 추가 완료");
		location.href = '00_main.jsp'
	</script>
	<%
	}
	%>
</body>
</html>