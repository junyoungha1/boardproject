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
	int no = bdao.getNextNum();
%>
	<form method="post" action="04_addBoardPro.jsp">
		<table border="1">
			<tr>
				<td>번호</td>
				<td><input type="text" name="newBoardNo"
					value=<%=no%> readonly /></td>
			</tr>

			<tr>
				<td>작성자</td>
				<td><input type="text" name="newBoardId" /></td>
			</tr>

			<tr>
				<td>제목</td>
				<td><input type="text" name="newBoardSubject" /></td>
			</tr>

			<tr>
				<td>내용</td>
				<td><textarea name="newBoardContents" rows="10" cols="50"></textarea></td>
			</tr>

			<tr>
				<td><button onclick="location.href='00_main.jsp'">작성완료</button></td>
			</tr>
		</table>
	</form>
</body>
</html>