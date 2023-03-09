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
import kr.rentcar.model.RentCar;

public class CarReserveListController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("log");
		ArrayList<CarReserve> list = CarReserveDAO.getInstance().getReserveList(id);
		if(list.size()==0) {
			request.setAttribute("carReserveList", null);
			return "carMain";
		}
		request.setAttribute("carReserveList", list);
		ArrayList<RentCar> infoList = CarReserveDAO.getInstance().getInfoList(id);
		request.setAttribute("infoList", infoList);
		return "carReserveList";
	}

}
