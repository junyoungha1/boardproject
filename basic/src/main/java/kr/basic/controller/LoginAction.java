package kr.basic.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login.do")
public class LoginAction extends HttpServlet {

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		String dbId = "qwer";
		String dbPw = "1234";
		
		int check = -1;
		if(dbId.equals(id) && dbPw.equals(pw)) {
			check = 1;
		}
		
		// jsp 페이지로 request 값 전달  -> forward를 통해서 request 객체 유지 가능 
		request.setAttribute("check", check);
		                                                     // 
		RequestDispatcher dis = request.getRequestDispatcher("/00_ex/loginPro.jsp");
		dis.forward(request, response);
		
	}
	
}














