package kr.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.model.BoardDAO;

public class BoardUpdateController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		if (request.getParameter("no") == null) {
			return "boardContent";
		}
		int no = Integer.parseInt(request.getParameter("no"));
		String subject = request.getParameter("subject");
		String contents = request.getParameter("contents");

		String ctx = request.getContextPath();
		int cnt = BoardDAO.getInstance().updateBoard(subject, contents, no);
		if (cnt > 0) {
			return "redirect:" + ctx + "/boardList.do";
		} else {
			throw new ServletException("not update");
		}

	}

}
