<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="ctx" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ctx}/css/style.css">
<script
	src='https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js'></script>
</head>
<body>
	<table>
		<tr>
			<td colspan="3" align="center"><h2 style="color: gray;">최신형
					자동차</h2></td>
		</tr>
		<tr>
			<td id="carList"><img width="30%" height = auto alt=""
				src="${ctx }/img/${newestList.get(0).img}"><br />차랑명:${newestList.get(0).name }</td>
			<td id="carList"><img width="30%" height = auto alt=""
				src="${ctx }/img/${newestList.get(1).img}"><br />차랑명:${newestList.get(1).name }</td>
			<td id="carList"><img width="30%" height = auto alt=""
				src="${ctx }/img/${newestList.get(2).img}"><br />차랑명:${newestList.get(2).name }</td>
		</tr>
		<tr>
			<td colspan="3" align="center">
				<hr color="red" size="5"> 차량 검색하기<br /> 차량 검색하기 <select
				id="selCategory" onchange="selectBox">
					<option value="small">소형</option>
					<option value="middle">중형</option>
					<option value="big">대형</option>
			</select>
			<input type="button" value="검색" />
			<input type="button" value="전체 보기" />
			</td>
		</tr>
	</table>

	<script type="text/javascript">
		
	</script>
</body>
</html>