package kr.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.model.Board;
import kr.board.model.BoardDAO;


@WebServlet("/boardContent.do")
public class BoardContentController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ctx=request.getContextPath();
		  int no =-1;
		  if(request.getParameter("no")==null){
			  response.sendRedirect(ctx+"/boardList.do");
		  }else{
			  no = Integer.parseInt(request.getParameter("no"));
		  }
		  Board b = BoardDAO.getInstance().getBoard(no);
		request.setAttribute("b", b);
		RequestDispatcher rd=request.getRequestDispatcher("board/boardContent.jsp");
		rd.forward(request, response); //-----------------------------------▲
	}

}
