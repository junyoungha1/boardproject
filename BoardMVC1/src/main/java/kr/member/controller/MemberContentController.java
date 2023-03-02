package kr.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.controller.Controller;
import kr.member.model.Member;
import kr.member.model.MemberDAO;

public class MemberContentController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	    String ctx=request.getContextPath();
	  int num =-1;
	  if(request.getParameter("num")==null){
		  return "redirect:"+ctx+"/memberLogin.do";
	  }else{
		  num = Integer.parseInt(request.getParameter("num"));
	  }
	  Member m=MemberDAO.getInstance().getMember(num);
	request.setAttribute("m", m);
	return "memberContent"; //뷰의 이름만 리턴
}

}
