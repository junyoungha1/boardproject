package kr.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.controller.Controller;
import kr.member.model.Member;
import kr.member.model.MemberDAO;

public class MemberUpdateController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		if (request.getParameter("num") == null) {
			return "memberContent";
		}
		int num = Integer.parseInt(request.getParameter("num"));
		int age = Integer.parseInt(request.getParameter("age"));
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");

		Member m = new Member();
		m.setNum(num);
		m.setAge(age);
		m.setEmail(email);
		m.setPhone(phone);
		String ctx = request.getContextPath();
		int cnt = MemberDAO.getInstance().memberUpdate(m);
		if (cnt > 0) {
			return "redirect:" + ctx + "/memberList.do";

		} else {
			throw new ServletException("not update");
		}
	}

}
