package kr.rentcar.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.controller.Controller;
import kr.rentcar.model.RentCar;
import kr.rentcar.model.RentCarDAO;

public class CarListController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ArrayList<RentCar> list = RentCarDAO.getInstance().getNewestCars();
		request.setAttribute("list", list);
		return "carList";
	}

}
