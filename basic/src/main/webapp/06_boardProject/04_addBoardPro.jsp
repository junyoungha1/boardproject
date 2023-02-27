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
	BoardDAO bdao = BoardDAO.getInstance();
	String id = request.getParameter("newBoardId").replaceAll(" ", "");
	String date = BoardDAO.getInstance().getToday();
	String subject = request.getParameter("newBoardSubject").replaceAll(" ", "");
	String contents = request.getParameter("newBoardContents").replaceAll(" ", "");
	if (id.equals("") || subject.equals("") || contents.equals("")) {
	%>
	<script>
		alert("작성되지 않은 항목이 있습니다.");
		history.back();
	</script>
	<%
	} else {
	int no = bdao.getNextNum();
	bdao.addBoard(no, id, date, subject, contents);
	%>
	<script>
		alert("게시글 추가 완료");
		location.href = '01_boardList.jsp?pageNum=1';
	</script>
	<%
	}
	%>
</body>
</html>