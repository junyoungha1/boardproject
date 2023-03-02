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
	      if(request.getParameter("id") == null) {
	        	return "memberLogin";
	        }
		String pw = request.getParameter("pw");

		String dbPw = MemberDAO.getInstance().checkMemberId(id);
		
		String ctx=request.getContextPath();

		if (dbPw == null || dbPw.equals(pw) == false) {
			return "redirect:"+ctx+"/memberLogin.do";
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("log", MemberDAO.getInstance().getMemberNo(id));
			return "redirect:"+ctx+"/memberList.do";
		}
		
	}

}
