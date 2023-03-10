package kr.rentcar.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.controller.Controller;
import kr.rentcar.model.RentCar;
import kr.rentcar.model.RentCarDAO;

public class CarAddController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RentCar r = new RentCar(request.getParameter("name"), Integer.parseInt(request.getParameter("category")), Integer.parseInt(request.getParameter("price")), Integer.parseInt(request.getParameter("usepeople")), request.getParameter("company"), request.getParameter("img"), request.getParameter("info"));
		RentCarDAO.getInstance().addRentCar(r);
		return "carMain";
	}

}
