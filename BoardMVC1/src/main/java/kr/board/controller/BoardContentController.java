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

public class BoardContentController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String ctx = request.getContextPath();
		String conPath = request.getParameter("conPath");
		int no = -1;
		if (request.getParameter("no") == null) {
			return "redirect:"+ctx+"/boardList.do";
		} else {
			no = Integer.parseInt(request.getParameter("no"));
		}
		Board b = BoardDAO.getInstance().getBoard(no);
		request.setAttribute("b", b);
		if (conPath.equals("view")) {
			return "boardContent";
		}else {
			return "updateBoard";
		}
	}

}
