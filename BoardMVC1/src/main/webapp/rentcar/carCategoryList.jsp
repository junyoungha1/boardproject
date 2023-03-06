<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="ctx" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<td colspan="3" align="center"><h2 style="color: gray;">${categoryName}
					자동차</h2></td>
		</tr>
		<tr>
			<c:forEach var="item" items="${categoryList}" begin="0"
				end="${categoryList.size() }" step="1" varStatus="status">
				<td id="carList"><img alt=""
					src="${ctx }/img/${categoryList.get(status.index).img}"><br />
					<strong>${categoryList.get(status.index).name }</strong></td>
			</c:forEach>
		</tr>
		<tr>
			<td colspan="3" align="center">
				<hr color="red" size="5"> 차량 검색하기<br /> 차량 검색하기 <select
				id="selCategory">
					<option value="1">소형</option>
					<option value="2">중형</option>
					<option value="3">대형</option>
			</select> <input type="button" id="search" value="검색" /> <input type="button"
				value="전체 보기" />
			</td>
		</tr>
	</table>
</body>
</html>