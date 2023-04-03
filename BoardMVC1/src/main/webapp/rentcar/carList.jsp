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
			<td colspan="3" align="center"><h2 style="color: gray;">렌트카
				</h2></td>
		</tr>
		<c:forEach var="item" items="${carList}" begin="0"
			end="${carList.size() }" step="1" varStatus="status">
			<c:if test="${(status.index)%3 eq 0}">
				<tr>
			</c:if>
			<td id="carList"><img alt=""
				id="${carList.get(status.index).no}"
				src="${ctx }/img/${carList.get(status.index).img}" /><br /> <strong>${carList.get(status.index).name  }</strong></td>
			<c:if test="${(status.index)%3 eq 2}">
				</tr>
			</c:if>
		</c:forEach>
		<tr>
			<td colspan="3" align="center">
				<hr color="red" size="5"> 차량 검색하기<br /> 차량 검색하기 <select
				id="selCategory">
					<option value="1">소형</option>
					<option value="2">중형</option>
					<option value="3">대형</option>
			</select> <input type="button" id="search" value="검색" /> <input type="button"
				id="allList" value="전체 보기" />
			</td>
		</tr>
	</table>


	<script type="text/javascript">
		var category = null;
		$("#selCategory").change(function() {
			category = $(this).val();
		})
		$("#search").click(function() {
			if (category == null) {
				category = 1;
			}
			location.href = '${ctx}/carCategoryList.do?category=' + category;
		})
		$("#allList").click(function() {
			location.href = '${ctx}/carList.do';
		})
		$("img").click(function() {

			alert("로그인 후 이용하세요");
			var num = $(this).attr("id");
			location.href = '${ctx}\/carReserveMain.do?no=' + num;
		})
	</script>
</body>
</html>