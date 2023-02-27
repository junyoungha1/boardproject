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
	ArrayList<Board> boardList = bdao.getList();
	int cnt = boardList.size();
	int currentPageNum = Integer.parseInt(request.getParameter("pageNum"));
	int startPage = 1;
	int endPage = cnt % 5 == 0 ? cnt / 5 : cnt / 5 + 1;
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
		for (int i = (currentPageNum - 1) * 5; i < currentPageNum * 5; i++) {
			if (i == cnt)
				break;
		%>
		<tr>
			<td><%=boardList.get(i).getNo()%></td>
			<td><%=boardList.get(i).getWriter()%></td>
			<td><%=boardList.get(i).getDate()%></td>
			<td><a
				href="05_updateBoard.jsp?idx=<%=boardList.indexOf(boardList.get(i))%>"><%=boardList.get(i).getSubject()%></a></td>
			<td><%=boardList.get(i).getContents()%></td>
			<td><button
					onclick="location.href='06_deleteBoardPro.jsp?idx=<%=boardList.indexOf(boardList.get(i))%>'">삭제</button></td>
		</tr>
		<%
		}
		%>
		<tr>
			<td><button onclick="location.href='00_main.jsp'">메인화면</button></td>
		</tr>
	</table>
	<%
	for (int i = 1; i <= endPage; i++) {
	%>
	<a href="07_boardListPaging.jsp?pageNum=<%=i%>">[<%=i%>]
	</a>
	<%
	}
	%>
</body>
</html>