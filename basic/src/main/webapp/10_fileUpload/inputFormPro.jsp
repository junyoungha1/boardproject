<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
   // 파일 업로드 -> 서버 공간 저장 : 저장 폴더 지정 
   String saveFolder = application.getRealPath("/file"); // getRealPath("") => 현재 프로젝트의 실제 저장 경로 
	out.print("<p> 파일 경로 = "+ saveFolder+"</p>");
   
   // 파일 업로드시 필요한 자원 , requset, 파일경로, 파일사이즈, 파일인코딩타입
   int maxSize =  1024*1024*5;   // 5MB  1MB --> 1024*1024 : 최대 용량 설정 
   String encType="utf-8";
   // 파일 업로드 기술 (cos.jar) com.oreilly. 외부 jar 파일 클래스 사용
   // request 여러 데이터를 받아올때 request 객체 사용할 수 없음 
   // 반드시 파일 업로드 할때는  MultipartRequest 만 사용 가능 
   MultipartRequest multi = null;
   
   //  DefaultFileRenamePolicy() => 파일이름 중복 해결 클래스 :이미 해당이름으로 파일이 업로드 되면 + 1 2 중복되지 않게 숫자를 뒤에 붙여준다 
   try{
	   multi = new MultipartRequest(request,saveFolder, maxSize , encType, new DefaultFileRenamePolicy());
	   System.out.println("test= " + multi);
	   
	   String user = multi.getParameter("user");  // request 객체 사용할 수 없음 
	   out.print("<p> 유저 = "+ user+"</p>");
	   // input="file" name = "uploadFile" -> 올린 파일의 정보를 가져온다 
	   String fileName = multi.getFilesystemName("uploadFile");// 실제 서버에 올라간 파일이름
	   String orginFileName = multi.getOriginalFileName("uploadFile"); // 우리가 업로드한 파일이름 
	   String fileType = multi.getContentType("uploadFile"); // 파일의 타입 .txt , jpg , .png 
		out.print("<p> 파일 저장된 정보 </p> <br>");
		 out.print("<p> 실제 파일명 = "+ fileName+"</p> <br>");
		 out.print("<p> 저장 파일명 = "+ orginFileName+"</p> <br>");
		 out.print("<p> 파일 종류  = "+ fileType+"</p> <br>");
		 
		File file = multi.getFile("uploadFile"); 
		if(file != null){
			 out.print("<p> 파일 크기  = "+ file.length()+"</p> <br>");
		}
	   
   }catch(Exception e){
	   e.printStackTrace();
   }
   
   
%>


</body>
</html>