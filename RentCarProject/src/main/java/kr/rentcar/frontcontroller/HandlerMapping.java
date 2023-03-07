package kr.rentcar.frontcontroller;

import java.util.HashMap;

import kr.rentcar.controller.CarCategoryListController;
import kr.rentcar.controller.CarDeleteController;
import kr.rentcar.controller.CarListController;
import kr.rentcar.controller.CarMainController;
import kr.rentcar.controller.CarReserveController;
import kr.rentcar.controller.CarSelectController;
import kr.rentcar.controller.CarSelectOptionController;
import kr.rentcar.controller.Controller;

public class HandlerMapping {
	private HashMap<String, Controller> mappings;
	public HandlerMapping() {
		mappings.put("/carSelect.do", new CarSelectController());
		mappings.put("/carCategoryList.do", new CarCategoryListController());
		mappings.put("/carDelete.do", new CarDeleteController());
		mappings.put("/carList.do", new CarListController());
		mappings.put("/carMain.do", new CarMainController());
		mappings.put("/carReserve.do", new CarReserveController());
		mappings.put("/carSelectOption.do", new CarSelectOptionController());
	}
	public Controller getController(String key) {
		return mappings.get(key);
	}
}
