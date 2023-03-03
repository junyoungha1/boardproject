<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
  // 파일 -> 큰 용량 url로 값전달하는 get 방식은 불가능 : post로만 값 전달 가능 
%>
  <form action="inputFormPro.jsp" method="post" enctype="multipart/form-data">
  
     작성자 : <input type="text" name="user" ><br>
     파일 :  <input type="file" name="uploadFile" ><br>
  	<input type="submit" value="업로드"/>
  </form>

</body>
</html>