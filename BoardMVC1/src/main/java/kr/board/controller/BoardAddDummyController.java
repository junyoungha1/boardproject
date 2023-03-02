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

public class BoardAddDummyController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String ctx = request.getContextPath();
		int cnt = BoardDAO.getInstance().addDummy();
		if (cnt > 0) {
			return "redirect:"+ctx+"/boardList.do";
		} else {
			throw new ServletException("not add dummy");
		}
	}
	
}
