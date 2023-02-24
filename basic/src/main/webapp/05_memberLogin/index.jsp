<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Arrays"%>
<%@ page import="memberLogin.User"%>
<%@ page import="memberLogin.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
// 화면을 구현하는 페이지가 아니라 db 연동전에 session에다가 데이터저장 사용하는 용도
// init()

// sample 데이터 ==> db 역할 (세션 )
ArrayList<User> userList = UserDAO.getInstance();

UserDAO.addUser("qwer", "1111", "이만수", "남성");
UserDAO.addUser("abcd", "2222", "박영희", "여성");
UserDAO.addUser("hello", "3333", "이수민", "여성");
/* session.setAttribute("userList", userList); */
session.setAttribute("log", "-1");

// 내장객체(미리 톰켓(서블릿)안에 만들어진 객체)
// new 하지않고 바로 사용하는 객체 out, application , session, request, response 

// 세션 setAttribute  해주면 (세션값생성)  => 30분동안 서버에 저장된다 => 세션 삭제 

// reqeuest - response  => 매 요청(url 이동될때마다) 생성된다 => 요청이끝나면 => request, response 삭제

// 강제로 자바에서 페이지 이동 
response.sendRedirect("02_main.jsp");
%>
