package kr.rentcar.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.controller.Controller;
import kr.rentcar.model.RentCar;
import kr.rentcar.model.RentCarDAO;

public class CarCategoryListController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int category = Integer.parseInt(request.getParameter("category"));
		ArrayList<RentCar> list = RentCarDAO.getInstance().getCategoryList(category);
		if(category==1) {
			request.setAttribute("categoryName", "소형");
		}else if(category==2) {
			request.setAttribute("categoryName", "중형");
		}else {
			request.setAttribute("categoryName", "대형");
		}
		request.setAttribute("categoryList", list);
		return "carCategoryList";
	}

}
