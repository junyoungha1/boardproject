package kr.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.board.controller.Controller;
import kr.member.model.Member;
import kr.member.model.MemberDAO;

public class MemberContentController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member m = MemberDAO.getInstance().getMember((String)session.getAttribute("log"));
		request.setAttribute("m", m);
		return "memberContent";
	}

}
