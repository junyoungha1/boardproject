package kr.rentcar.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.controller.Controller;
import kr.rentcar.model.CarReserveDAO;
import kr.rentcar.model.RentCarDAO;

public class CarDeleteController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		CarReserveDAO.getInstance().reserveCarDelete(Integer.parseInt(request.getParameter("reserve_seq")));
		RentCarDAO.getInstance().updateCnt(Integer.parseInt(request.getParameter("no")), (Integer.parseInt(request.getParameter("qty")))*-1);
		return "carReserveList";
	}

}
