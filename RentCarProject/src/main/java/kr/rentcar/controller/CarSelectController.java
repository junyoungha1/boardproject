package kr.rentcar.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.rentcar.model.RentCar;
import kr.rentcar.model.RentCarDAO;

public class CarSelectController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ArrayList<RentCar> list = RentCarDAO.getInstance().getNewestCars();
		request.setAttribute("newestList", list);
		return "carSelect";
	}

}
