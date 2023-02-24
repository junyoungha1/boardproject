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
	ArrayList<Board> boardList = bdao.getList();
	int cnt = boardList.size();
	%>
	<h2>
		전체 게시글 수 :
		<%=cnt%>개
	</h2>
	<table border="1">
		<tr>
			<td>번호</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>제목</td>
			<td>내용</td>
			<td>삭제</td>
		</tr>
		<%
		for (Board b : boardList) {
		%>
		<tr>
			<td><%=b.getNo()%></td>
			<td><%=b.getWriter()%></td>
			<td><%=b.getDate()%></td>
			<td><a href="05_updateBoard.jsp?idx=<%=boardList.indexOf(b)%>"><%=b.getSubject()%></a></td>
			<td><%=b.getContents()%></td>
			<td><button
					onclick="location.href='06_deleteBoardPro.jsp?idx=<%=boardList.indexOf(b)%>'">삭제</button></td>
		</tr>
		<%
		}
		%>
		<tr>
			<td><button onclick="location.href='00_main.jsp'">메인화면</button></td>
		</tr>
	</table>
</body>
</html>