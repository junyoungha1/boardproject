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
			<td colspan="3" align="center"><h2 style="color: gray;">${categoryName} 자동차 ${categoryList.size() }</h2></td>
		</tr>
		<c:forEach var="item" items="${categoryList}" begin="0" end="${categoryList.size() }" step="1" varStatus="status">
		<tr>
			<td id="carList"><img width="200px" height="200px" alt=""
				src="${ctx }/img/${newestList.get(0).img}"><br />차랑명:${newestList.get(0).name }</td>
			<td id="carList"><img width="200px" height="200px" alt=""
				src="${ctx }/img/${newestList.get(1).img}"><br />차랑명:${newestList.get(1).name }</td>
			<td id="carList"><img width="200px" height="200px" alt=""
				src="${ctx }/img/${newestList.get(2).img}"><br />차랑명:${newestList.get(2).name }</td>
		</tr>
		</c:forEach>
		<tr>
			<td colspan="3" align="center">
				<hr color="red" size="5"> 차량 검색하기<br /> 차량 검색하기 <select>
					<option name="small">소형</option>
					<option name="middle">중형</option>
					<option name="big">대형</option>
			</select><input type="summit" class="page-link" id="btnType" value="검색" /> <br />
				<input type="button" class="page-link" id="btnType" value="전체 보기" />
			</td>
		</tr>
	</table>
</body>
</html>