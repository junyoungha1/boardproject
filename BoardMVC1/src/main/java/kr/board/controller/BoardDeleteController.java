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

@WebServlet("/boardDelete.do")
public class BoardDeleteController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		int no = Integer.parseInt(request.getParameter("no"));

		String ctx = request.getContextPath();
		int cnt = BoardDAO.getInstance().removeBoard(no);
		if (cnt > 0) {
			response.sendRedirect(ctx + "/boardList.do");
		} else {
			throw new ServletException("not remove");
		}
	}

}
