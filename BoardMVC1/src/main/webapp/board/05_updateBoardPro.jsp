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
int no = Integer.parseInt(request.getParameter("no"));
String subject = request.getParameter("updateSubject");
String contents = request.getParameter("updateContents");
bdao.setBoard(subject, contents, no);
%>
	<script>
		alert("게시글 수정 완료");
		location.href = "01_boardList.jsp?pageNum=1";
	</script>

</body>
</html>