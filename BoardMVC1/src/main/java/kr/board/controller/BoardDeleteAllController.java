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

@WebServlet("/boardDeleteAll.do")
public class BoardDeleteAllController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BoardDAO bdao = BoardDAO.getInstance();
		ArrayList<Board> list = bdao.boardList();
		String ctx = request.getContextPath();
		int cnt = BoardDAO.getInstance().removeAllBoard();
		if (cnt > 0) {
			response.sendRedirect(ctx + "/boardList.do");
		} else {
			throw new ServletException("not remove");
		}
	}

}
