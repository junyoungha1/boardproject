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
			<td colspan="3" align="center"><h2 style="color: gray;">${rc.name }</h2></td>
		</tr>
		<tr>
			<td rowspan="6" id="carList" width="700px"><img alt=""
				src="${ctx }/img/${rc.img}" /></td>
			<td>차량이름</td>
			<td>${rc.name }</td>
		</tr>
		<tr>
			<td>차량수량</td>
			<td><select id="selCnt">
					<c:forEach begin="0" end="${rc.usepeople }" varStatus="status">
						<option value="${status.index }">${status.index }</option>
					</c:forEach>
			</select></td>
		</tr>
		<tr>
			<td>차량분류</td>
			<td id="category"></td>
		</tr>
		<tr>
			<td>대여가격</td>
			<td>${rc.price }</td>
		</tr>
		<tr>
			<td>제조회사</td>
			<td>${rc.company }</td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" id="selectOption"
				value="차량 옵션" /></td>
		</tr>
		<tr>
			<td colspan="3" align="center">
				<h3>차량 정보 보기</h3> <br /> ${rc.name } 자동차 입니다.
			</td>
		</tr>
	</table>
	<script type="text/javascript">
	window.onload = ()=>{
		setCategory();
	}
		var cnt = 0;
		$("#selCnt").change(function() {
			cnt = $(this).val();
		})
		$("#selectOption")
				.click(
						function() {
							if (cnt == 0) {
								alert("차량 수량을 선택해 주세요");
							} else {
								location.href = '${ctx}/carSelectOption.do?no=${rc.no}&cnt='
										+ cnt;
							}
						})
						function setCategory(){
			var category = ${rc.category}*1;
			if(category==1){
				$('#category').text('소형');
			}else if(category==2){
				$('#category').text('중형');
			}else if(category==3){
				$('#category').text('대형');
			}
		}
						
	</script>
</body>
</html>