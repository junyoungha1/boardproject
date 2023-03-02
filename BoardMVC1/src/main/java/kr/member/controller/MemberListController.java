package kr.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.controller.Controller;
import kr.member.model.Member;
import kr.member.model.MemberDAO;

public class MemberListController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ArrayList<Member> list=MemberDAO.getInstance().memberList();	
		request.setAttribute("list", list);
		return "memberList";

	}

}
