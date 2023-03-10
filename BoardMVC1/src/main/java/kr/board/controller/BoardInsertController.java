package kr.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.model.Board;
import kr.board.model.BoardDAO;

public class BoardInsertController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String writer = request.getParameter("writer");
		String date = BoardDAO.getInstance().getToday().toString();
		String subject = request.getParameter("subject");
		String contents = request.getParameter("contents");
		// 파라메터수집(
		
		Board b = new Board();
		b.setWriter(writer);
		b.setDate(date);
		b.setSubject(subject);
		b.setContents(contents);
		
		String ctx = request.getContextPath();
		int cnt = BoardDAO.getInstance().addBoard(b);
		if (cnt > 0) {
			return "redirect:"+ctx+"/boardList.do";
		} else {
			throw new ServletException("not insert");
		}
	}

}
