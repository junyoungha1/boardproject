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
		String id = request.getParameter("log");

		Member m = MemberDAO.getInstance().getMember(id);
		m.setPw(request.getParameter("pw"));
		m.setEmail(request.getParameter("email"));
		m.setTel(request.getParameter("tel"));
		m.setHobby(request.getParameter("hobby"));
		m.setJob(request.getParameter("job"));
		m.setAge(request.getParameter("age"));
		m.setInfo(request.getParameter("info"));
		String ctx = request.getContextPath();
		int cnt = MemberDAO.getInstance().memberUpdate(m);
		if (cnt > 0) {
			return "redirect:" + ctx + "/board/main.jsp";

		} else {
			throw new ServletException("not update");
		}
	}

}
