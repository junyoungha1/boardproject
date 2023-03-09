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
<script type="text/javascript">

</script>
</head>
<body>
	<nav class="navbar navbar-expand navbar-dark bg-primary">
		<a href="#menu-toggle" id="menu-toggle" class="navbar-brand"><span
			class="navbar-toggler-icon"></span></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarsExample02" aria-controls="navbarsExample02"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarsExample02">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="${ctx}/board/main.jsp">Home <span class="sr-only">(current)</span>
				</a></li>
				<c:if test="${log eq null }">
					<li class="nav-item"><a class="nav-link"
						href="${ctx}/member/memberLogin.jsp">Login</a></li>
				</c:if>
				<c:if test="${log ne null }">
					<li class="nav-item"><a class="nav-link"
						href="${ctx}/memberLogout.do">Logout</a></li>
				</c:if>
			</ul>
			<form class="form-inline my-2 my-md-0"></form>
		</div>
	</nav>

	<div id="wrapper" class="toggled">
		<!-- Sidebar -->
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav">
				<c:if test="${log ne null }">
					<li class="sidebar-brand"><a href="${ctx }/memberContent.do">${log }님
							환영합니다</a></li>
				</c:if>
				<c:if test="${log eq null }">
					<li class="sidebar-brand"><a href="#"> </a></li>
				</c:if>
				<li><a href="${ctx}/carSelect.do">예약하기</a></li>
				<c:if test="${log ne null }">
					<li><a href="${ctx}/carReserveList.do">예약확인</a></li>
				</c:if>
				<li><a href="${ctx}/boardList.do?pageNum=1">게시판</a></li>
				<li><a href="${ctx}/boardAddDummy.do">더미게시물 추가</a></li>
				<li><a href="${ctx}/boardDeleteAll.do">게시판 전체 삭제</a></li>
				<li><a href="${ctx}/memberList.do">회원 목록</a></li>
				<li><a href="#">이벤트</a></li>
				<li><a href="#">고객센터</a></li>
			</ul>
		</div>