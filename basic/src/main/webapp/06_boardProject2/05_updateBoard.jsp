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
	int idx = Integer.parseInt(request.getParameter("idx"));
	 BoardDAO bdao =  BoardDAO.getInstance();
	ArrayList<Board> list = bdao.getList();
	%>

	<form method="get" action="05_updateBoardPro.jsp">
		<table border="1">
			<tr>
				<td>번호</td>
				<td colspan="3"><input type="text" name="updateBoardNo"
					value=<%=list.get(idx).getNo()%> style="width:350px" readonly /></td>
			</tr>

			<tr>
				<td>작성자</td>
				<td><input type="text" name="updateBoardId"
					value=<%=list.get(idx).getWriter()%> readonly /></td>
				<td>작성일</td>
				<td><input type="text" name="updateBoardDate"
					value=<%=list.get(idx).getDate()%> readonly /></td>
			</tr>

			<tr>
				<td>제목</td>
				<td colspan="3"><input type="text" name="updateBoardSubject"
					value=<%=list.get(idx).getSubject()%> style="width:350px" /></td>
			</tr>

			<tr>
				<td>내용</td>
				<td colspan="3"><textarea name="updateBoardContents" rows="10" cols="50"><%=list.get(idx).getContents()%></textarea></td>
			</tr>

			<tr>
				<td colspan="4"><input type="submit" value="수정하기" /></td>
			</tr>
		</table>
			<td><input type="hidden" name="idx" value=<%=idx%> /></td>
	</form>
</body>
</html>