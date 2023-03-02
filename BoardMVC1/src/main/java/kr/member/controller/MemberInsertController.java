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
        if(request.getParameter("id") == null) {
        	return "memberInsert";
        }
		String id=request.getParameter("id");
		String pass=request.getParameter("pass");
		String name=request.getParameter("name");
		int age=Integer.parseInt(request.getParameter("age"));
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");

		Member m=new Member();
		m.setId(id);
		m.setPass(pass);
		m.setName(name);
		m.setAge(age);
		m.setEmail(email);
		m.setPhone(phone);
		 String ctx=request.getContextPath();
		int cnt=MemberDAO.getInstance().memberInsert(m);
			if(cnt>0) {
		    	return "redirect:"+ctx+"/memberList.do";
		}else {
		    	throw new ServletException("not insert");	    	
		}
	}

}
