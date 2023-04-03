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
				<td rowspan="7" id="carList" width="700px"><img alt=""
					src="${ctx }/img/${rc.img}" /></td>
				<td>대여기간</td>
				<td><select id="selDay" name="rentDay">
						<option value="1" selected>1일</option>
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
				<td><input type="date" id="rDay" name="rentDate" /></td>
			</tr>
			<tr>
				<td>보험</td>
				<td><input type="checkbox" id="chkOption" name="ins" /></td>
			</tr>
			<tr>
				<td>Wi-fi</td>
				<td><input type="checkbox" id="chkOption" name="wifi" /></td>
			</tr>
			<tr>
				<td>네비게이션</td>
				<td><input type="checkbox" id="chkOption" name="navi" /></td>
			</tr>
			<tr>
				<td>베이비시트</td>
				<td><input type="checkbox" id="chkOption" name="seat" /></td>
			</tr>
			<tr>
				<td>가격</td>
				<td id="priceRes">${cnt*1*rc.price}</td>
				<input type="hidden" id="totalPrice" name="totalPrice" value="" />
			</tr>
			<tr>
				<td colspan="3" align="center"><input type="button"
					id="formBtn" value="차량 예약하기" /><input type="button" value="취소" /></td>
			</tr>
		</table>
	</form>
	<script type="text/javascript">
		window.onload = ()=>{
			setRentDay();
		}
				 
		$('input:checkbox, #selDay').change(function(){
		    var dayPrice = ${cnt*1*rc.price} * $('#selDay').val();
		    $('input:checkbox').each(function() {
		        if ($(this).is(':checked')) {
		            dayPrice += 1000 * ${cnt*1};
		        }
		    });
		    $('#priceRes').text(dayPrice);
		    $('#totalPrice').val($('#priceRes').text());
		});
			
		function setRentDay(){
			var now = new Date().toISOString().substring(0,10);
			document.getElementById("rDay").setAttribute("min",now);
		}
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