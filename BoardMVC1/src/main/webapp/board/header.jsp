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
					href="${ctx}/carMain.do">Home <span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${ctx}/member/memberLogin.jsp">Login</a></li>
			</ul>
			<form class="form-inline my-2 my-md-0"></form>
		</div>
	</nav>

	<div id="wrapper" class="toggled">
		<!-- Sidebar -->
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav">
				<li class="sidebar-brand"><a href="#">Rent Car Service </a></li>
				<li><a href="${ctx}/carSelect.do">예약하기</a></li>
				<li><a href="#">예약확인</a></li>
				<li><a href="${ctx}/boardList.do?pageNum=1">게시판</a></li>
				<li><a href="${ctx}/boardAddDummy.do">더미게시물 추가</a></li>
				<li><a href="${ctx}/boardDeleteAll.do">게시판 전체 삭제</a></li>
				<li><a href="${ctx}/memberList.do">회원 목록</a></li>
				<li><a href="#">이벤트</a></li>
				<li><a href="#">고객센터</a></li>
			</ul>
		</div>
