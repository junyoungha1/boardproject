package kr.rentcar.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.board.controller.Controller;
import kr.rentcar.model.CarReserve;
import kr.rentcar.model.CarReserveDAO;

public class CarReserveListController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("log");
		ArrayList<CarReserve> list = CarReserveDAO.getInstance().getReserveList(id);
		request.setAttribute("carReserveList", list);
		return "carReserveList";
	}

}
