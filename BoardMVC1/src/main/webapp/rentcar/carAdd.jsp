<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="ctx" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

	function checkImg( fname , ftype,fsize ){
	let fileForm = /(.*?)\.(jpg|jpeg)$/;
	let maxSize = 5 * 1024 * 1024;
	if(fname != "" && fname != null) {    
	    if(!fname.match(fileForm)) {
	    	alert("이미지 파일만 업로드 가능");
	        return false;
	    } else if(fsize >= maxSize) {
	    	alert("파일 사이즈는 5MB까지 가능");
	        return false;
	    }
	}
	return true;
	}
	
	function uploadFile(){

	    let form = $('#imgForm')[0];
	    let formData = new FormData(form);
	    console.log(formData)
	 
	    $.ajax({
	    
	        url : '${ctx}/upLoadCarImg.do',
	        type : 'POST',
	        data : formData,
	        contentType : false,
	        processData : false,
	        success: function(data){
	        
	        	if(data == 'fail'){
	        		alert('파일 업로드 실패');
	        	}else{
	        	    let src = "img/" + data;
	        	    console.log("src=" + src);
	        		$("#inputImg").attr('src',src);
	                $("#imgVal").val(data);
	        	}
	        }
	    });
	}

	
	function update() {

	    let file = $('#formFile')[0].files[0];
       
	   console.log(file.name);
	  console.log(file.type);
	   console.log(file.size);
    
	   if(checkImg( file.name ,file.type,file.size )){
			//alert('test')
		   uploadFile();
	   }
	  
	}
	

	
	function uplaodImg(form){
		if(checkImg()){
			form.submit();
		}
	}
	
	
	function checkSumbit(){
	
		let check = true;
		$(".carValue").each(function(){
		    if($(this).val() == ""){
		    	check = false
		        alert( $(this).attr("name") + "의 값이 입력되지 않았습니다." );
		    	return false; 
		    }
		});
	    if(check){
	    	$("#carAddForm").submit();
	    }
	}
	
	function init(){
		$('input[name ="category"]').on("change click", function() {
				  $('input[name ="category"]').removeClass('carValue');
			  if($(this).is(':checked')){
				  $(this).addClass('carValue');
			  }
		});
	}
window.onload = ()=> {
	init();
}
	
</script>
</head>
<body>
	<table>
		<form id="imgForm" method="post" action="${ctx }/upLoadImg.do"
			enctype="multipart/form-data">
			<tr>
				<td colspan="3" align="center"><h2 style="color: gray;">렌트카
						추가</h2></td>
			</tr>
			<tr>
				<td rowspan="6" " width="700px"><input type="image" width="500"
					name="img" id="inputImg"
					src="https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg" /><br />
					<label for="formFile" class="form-label"> </label> <input
					type="file" class="form-control" onchange="update()" id="formFile"
					type="file" name="uploadFile" accept=" .jpg"></td>
		</form>
		<form id="carAddForm" method="post" action="${ctx }/carAdd.do">
			<td>모델명</td>
			<td><input type="text" class="carValue" name="name" autofocus
				required /></td>
			</tr>
			<tr>
				<td>분류</td>
				<td><input type="radio" name="category" value="1" checked />&nbsp;
					소형 &nbsp;<input type="radio" name="category" value="2" /> &nbsp;중형
					&nbsp;<input type="radio" name="category" value="3" />&nbsp; 대형
					&nbsp;</td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" class="carValue" name="price" /></td>
			</tr>
			<tr>
				<td>대수</td>
				<td><input type="text" class="carValue" name="usepeople" /></td>
			</tr>
			<tr>
				<td>제조사</td>
				<td><input type="text" class="carValue" name="company" /></td>
			</tr>
			<tr>
				<td>차량 설명</td>
				<td><textarea class="carValue" name="info"></textarea> <input
					class="carValue" id="imgVal" type="hidden" name="img" value="" /></td>
			</tr>
			<tr>
				<td colspan="3" align="center"><input type="button"
					onclick="checkSumbit()" value="등록하기" /><input type="button"
					value="취소" onclick="location.href='${ctx}/board/main.jsp'" /></td>
			</tr>
		</form>
	</table>

</body>
</html>