package kr.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.model.Board;
import kr.board.model.BoardDAO;

@WebServlet("/boardList.do")
public class BoardListController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		ArrayList<Board> list = BoardDAO.getInstance().boardList();
		request.setAttribute("list", list);
		RequestDispatcher rd=request.getRequestDispatcher("board/01_boardList.jsp?pageNum="+pageNum);
		rd.forward(request, response);
	}

}
