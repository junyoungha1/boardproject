package kr.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.board.controller.Controller;
import kr.member.model.MemberDAO;

public class MemberLoginController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String passData = MemberDAO.getInstance().checkLogin(id, pw) ? "valid" : "notValid";

		HttpSession session = request.getSession();

		if (passData.equals("notValid")) {
			session.setAttribute("log", null);
		} else {
			session.setAttribute("log", id);
		}
		response.getWriter().print(passData);
		return null;
	}

}
