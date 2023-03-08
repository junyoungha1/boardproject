package kr.rentcar.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.controller.Controller;
import kr.rentcar.model.RentCar;
import kr.rentcar.model.RentCarDAO;

public class CarReserveMainController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RentCar rc = RentCarDAO.getInstance().getOneCar(Integer.parseInt((String) request.getParameter("no")));
		request.setAttribute("rc", rc);
		return "carReserveMain";
	}
}
