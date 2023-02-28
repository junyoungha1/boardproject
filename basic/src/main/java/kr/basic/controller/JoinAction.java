package kr.basic.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/join.do")
public class JoinAction extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		reqPro(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		reqPro(req, resp);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("joinId");
		String pw = request.getParameter("joinPw");
		String name = request.getParameter("joinName");
		String gender = request.getParameter("joinGender");
		
		int check = -1;
		if(!id.equals("qwer")) {
			check = 1;
		}
		
		// jsp 페이지로 request 값 전달  -> forward를 통해서 request 객체 유지 가능 
		request.setAttribute("check", check);
		
		RequestDispatcher dis = request.getRequestDispatcher("/08_mvc2login/joinPro.jsp");
		dis.forward(request, response);
		
	}
	
}














