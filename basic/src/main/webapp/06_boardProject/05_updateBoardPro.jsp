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
int no = bdao.getList().get(idx).getNo();
String id = bdao.getList().get(idx).getWriter();
String date = bdao.getList().get(idx).getDate();
String subject = request.getParameter("updateSubject");
String contents = request.getParameter("updateContents");
bdao.setBoard(idx, no, id, date, subject, contents);

%>
	<script>
		alert("게시글 수정 완료");
		location.href = "01_boardList.jsp?pageNum=1";
	</script>

</body>
</html>