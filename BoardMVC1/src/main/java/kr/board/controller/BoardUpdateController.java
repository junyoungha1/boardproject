package kr.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.model.BoardDAO;

@WebServlet("/boardUpdate.do")
public class BoardUpdateController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int no = Integer.parseInt(request.getParameter("no"));
		String subject = request.getParameter("subject");
		String contents = request.getParameter("contents");

		String ctx = request.getContextPath();
		int cnt = BoardDAO.getInstance().updateBoard(subject, contents, no);
		if (cnt > 0) {
			response.sendRedirect(ctx + "/boardList.do");
		} else {
			throw new ServletException("not update");
		}
		
	}

}
