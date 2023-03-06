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
			<td id="carList"><img alt=""
				src="${ctx }/img/${newestList.get(0).img}"><br />
			<strong>${newestList.get(0).name }</strong></td>
			<td id="carList"><img alt=""
				src="${ctx }/img/${newestList.get(1).img}"><br />
			<strong>${newestList.get(1).name }</strong></td>
			<td id="carList"><img alt=""
				src="${ctx }/img/${newestList.get(2).img}"><br />
			<strong>${newestList.get(2).name }</strong></td>
		</tr>
		<tr>
			<td colspan="3" align="center">
				<hr color="red" size="5"> 차량 검색하기<br /> 차량 검색하기 
				<select
				id="selCategory">
					<option value="1">소형</option>
					<option value="2">중형</option>
					<option value="3">대형</option>
			</select> <input type="button" id="search" value="검색" /> <input type="button"
				value="전체 보기" />
			</td>
		</tr>
	</table>

	<script type="text/javascript">
	var category = null;
		$("#selCategory").change(function(){
			category = $(this).val();
		})
		$("#search").click(function() {
			if(category==null){
				category = 1;
			}
			location.href = '${ctx}/carCategoryList.do?category='+category;
		})
	</script>
</body>
</html>