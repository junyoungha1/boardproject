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
import kr.rentcar.model.RentCarDAO;

public class CarReserveController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		CarReserveDAO cdao = CarReserveDAO.getInstance();
		int no = Integer.parseInt(request.getParameter("no"));
		String id = (String) session.getAttribute("log");
		int qty = Integer.parseInt(request.getParameter("cnt"));
		int dday = cdao.chkOption(request.getParameter("rentDay"));
		String rday = request.getParameter("rentDate");
		int usein = cdao.chkOption(request.getParameter("ins"));
		int usewifi = cdao.chkOption(request.getParameter("wifi"));
		int usenavi = cdao.chkOption(request.getParameter("navi"));
		int useseat = cdao.chkOption(request.getParameter("seat"));

		CarReserve cr = new CarReserve(no, id, qty, dday, rday, usein, usewifi, usenavi, useseat);
		cdao.reserveCarInsert(cr);
		RentCarDAO.getInstance().updateCnt(no, qty);
		ArrayList<RentCar> list = RentCarDAO.getInstance().getNewestCars();
		request.setAttribute("newestList", list);
		return "carReserve";
	}

}
