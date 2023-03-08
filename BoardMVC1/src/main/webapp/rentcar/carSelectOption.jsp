<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="ctx" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="${ctx}/css/style.css">
<script
	src='https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js'></script>
</head>
<body>
	<form method="post"
		action="${ctx }/carReserve.do?no=${rc.no}&cnt=${cnt}">
		<table>
			<tr>
				<td colspan="3" align="center"><h2 style="color: gray;">옵션
						선택</h2></td>
			</tr>
			<tr>
				<td rowspan="6" id="carList" width="700px"><img alt=""
					src="${ctx }/img/${rc.img}" /></td>
				<td>대여기간</td>
				<td><select id="selCnt">
						<option value="1">1일</option>
						<option value="2">2일</option>
						<option value="3">3일</option>
				</select></td>
			</tr>
			<tr>
				<td>대여일</td>
				<td><input type="date" /></td>
			</tr>
			<tr>
				<td>보험</td>
				<td><input type="checkbox" /></td>
			</tr>
			<tr>
				<td>Wi-fi</td>
				<td><input type="checkbox" /></td>
			</tr>
			<tr>
				<td>네비게이션</td>
				<td><input type="checkbox" /></td>
			</tr>
			<tr>
				<td>베이비시트</td>
				<td><input type="checkbox" /></td>
			</tr>
			<tr>
				<td colspan="3" align="justify"><input type="submit"
					value="차량 예약하기" /><input type="button" value="취소" /></td>
			</tr>
		</table>
	</form>

</body>
</html>