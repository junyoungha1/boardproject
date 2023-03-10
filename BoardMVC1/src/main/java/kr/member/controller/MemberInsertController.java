package kr.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.controller.Controller;
import kr.member.model.Member;
import kr.member.model.MemberDAO;

public class MemberInsertController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		if (request.getParameter("id") == null) {
			return "memberInsert";
		}
		String ctx = request.getContextPath();
		int cnt = MemberDAO.getInstance()
				.memberInsert(new Member(request.getParameter("id"), request.getParameter("pw"),
						request.getParameter("email"), request.getParameter("tel"), request.getParameter("hobby"),
						request.getParameter("job"), request.getParameter("age"), request.getParameter("info")));
		if (cnt > 0) {
			return "redirect:" + ctx + "/memberList.do";
		} else {
			throw new ServletException("not insert");
		}
	}

}
