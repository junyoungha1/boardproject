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
	<form id="bookForm" method="post"
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
				<td><select id="selDay" name="rentDay">
						<option value="1">1일</option>
						<option value="2">2일</option>
						<option value="3">3일</option>
						<option value="4">4일</option>
						<option value="5">5일</option>
						<option value="6">6일</option>
						<option value="7">7일</option>
				</select></td>
			</tr>
			<tr>
				<td>대여일</td>
				<td><input type="date" name="rentDate" /></td>
			</tr>
			<tr>
				<td>보험</td>
				<td><input type="checkbox" name="ins" /></td>
			</tr>
			<tr>
				<td>Wi-fi</td>
				<td><input type="checkbox" name="wifi" /></td>
			</tr>
			<tr>
				<td>네비게이션</td>
				<td><input type="checkbox" name="navi" /></td>
			</tr>
			<tr>
				<td>베이비시트</td>
				<td><input type="checkbox" name="seat" /></td>
			</tr>
			<tr>
				<td colspan="3" align="center"><input type="button" id="formBtn"
					value="차량 예약하기" /><input type="button" value="취소" /></td>
			</tr>
		</table>
	</form>
	<script type="text/javascript">
		var now = new Date();
		$("input[name=rentDate]").change(function() {
			var date = new Date($(this).val());
			if (date <= now) {
				alert("오늘 이후의 날짜를 선택하세요");
				$(this).attr("value", null);
				history.go(0);
			}
		})
		$("#formBtn").click(function() {
			if (validDateCheck()) {
				alert("예약 완료");
				$("#bookForm").submit();
			} else {
				alert("예약할 날짜를 선택해주세요");
			}
		})

		function validDateCheck() {
			if ($("input[name=rentDate]").val() == '') {
				return false;
			}
			return true;
		}
	</script>
</body>
</html>