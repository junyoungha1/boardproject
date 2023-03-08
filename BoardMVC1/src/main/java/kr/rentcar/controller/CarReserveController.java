package kr.rentcar.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import kr.board.controller.Controller;
import kr.rentcar.model.CarReserve;
import kr.rentcar.model.CarReserveDAO;

public class CarReserveController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		int no = Integer.parseInt(request.getParameter("no"));
		String id = (String)session.getAttribute("log");
		String rentDay = request.getParameter("rentDay");
		String rentDate = request.getParameter("rentDate");
		String ins = request.getParameter("ins");
		String wifi = request.getParameter("wifi");
		String navi = request.getParameter("navi");
		String seat = request.getParameter("seat");
		
		return "carReserve";
	}

}
