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
	<tr>
		<td align="center"><h2 style="color: gray;">차량 예약 완료 화면</h2></td>
	</tr>
	<table border="1">
		<tr>
			<td>이미지</td>
			<td>이름</td>
			<td>대여일</td>
			<td>대여기간</td>
			<td>금액</td>
			<td>수량</td>
			<td>보험</td>
			<td>Wifi</td>
			<td>베이비시트</td>
			<td>네비게이션</td>
			<td>삭제</td>
		</tr>
		<c:if test="${carReserveList.size() ne 0}">
			<c:forEach var="item" items="${carReserveList}" begin="0"
				end="${carReserveList.size()}" step="1" varStatus="status">
				<tr>
					<td><img alt="" height="200px" width="300px"
						src="${ctx }/img/${infoList.get(status.index).img}" /></td>
					<td>${infoList.get(status.index).name }</td>
					<td>${carReserveList.get(status.index).dday }</td>
					<td>${carReserveList.get(status.index).rday }</td>
					<td id='price'>${infoList.get(status.index).price }</td>
					<td id='qty'>${carReserveList.get(status.index).qty }</td>
					<td><input type="checkbox" name="chkBox"
						value="${carReserveList.get(status.index).usein }"  onClick="return false;" /></td>
					<td><input type="checkbox" name="chkBox"
						value="${carReserveList.get(status.index).usewifi }"  onClick="return false;" /></td>
					<td><input type="checkbox" name="chkBox"
						value="${carReserveList.get(status.index).useseat }"  onClick="return false;" /></td>
					<td><input type="checkbox" name="chkBox"
						value="${carReserveList.get(status.index).usenavi }"  onClick="return false;" /></td>
					<td><input type="button" id="delBtn" name="${status.index}"
						value="삭제" /></td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	<script type="text/javascript">
		$('input:checkbox[name=chkBox]').each(function() {
			if (this.value == "1") {
				this.checked = true;
			}
		});
		$('input:button[id=delBtn]').each(function() {
			$(this).click(function() {
				let idx = this.name;
				deleteCar(${carReserveList.get(idx).reserve_seq});
			})
		});
		function deleteCar(reserve_seq) {
			$.ajax({
				url : "${ctx}/carDelete.do",
				type : "POST",
				data : {
					"reserve_seq" : reserve_seq,
					"qty" : ${carReserveList.get(idx).qty},
					"no" : ${carReserveList.get(idx).no}
				},
				success : function() {
					alert("삭제 완료");
					history.go(0);
				},
				error : function() {
					alert("error");
				}
			})
		}
	</script>
</body>
</html>