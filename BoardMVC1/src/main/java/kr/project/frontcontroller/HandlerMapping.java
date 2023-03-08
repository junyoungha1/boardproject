package kr.project.frontcontroller;

import java.util.HashMap;

import kr.board.controller.BoardAddDummyController;
import kr.board.controller.BoardContentController;
import kr.board.controller.BoardDeleteAllController;
import kr.board.controller.BoardDeleteController;
import kr.board.controller.BoardInsertController;
import kr.board.controller.BoardListController;
import kr.board.controller.BoardUpdateController;
import kr.board.controller.Controller;
import kr.member.controller.MemberContentController;
import kr.member.controller.MemberDeleteController;
import kr.member.controller.MemberInsertController;
import kr.member.controller.MemberListController;
import kr.member.controller.MemberLoginController;
import kr.member.controller.MemberLogoutController;
import kr.member.controller.MemberUpdateController;
import kr.member.controller.ValidIdAjaxController;
import kr.rentcar.controller.CarCategoryListController;
import kr.rentcar.controller.CarDeleteController;
import kr.rentcar.controller.CarListController;
import kr.rentcar.controller.CarMainController;
import kr.rentcar.controller.CarReserveController;
import kr.rentcar.controller.CarReserveListController;
import kr.rentcar.controller.CarSelectController;
import kr.rentcar.controller.CarSelectOptionController;
import kr.rentcar.controller.CarReserveMainController;

public class HandlerMapping {
	private HashMap<String, Controller> mappings;
	public HandlerMapping() {
		mappings = new HashMap<String, Controller>();
		mappings.put("/boardList.do", new BoardListController());
		mappings.put("/boardAddDummy.do", new BoardAddDummyController());
		mappings.put("/boardContent.do", new BoardContentController());
		mappings.put("/boardDeleteAll.do", new BoardDeleteAllController());
		mappings.put("/boardDelete.do", new BoardDeleteController());
		mappings.put("/boardInsert.do", new BoardInsertController());
		mappings.put("/boardUpdate.do", new BoardUpdateController());
		mappings.put("/memberUpdate.do", new MemberUpdateController());
		mappings.put("/memberContent.do", new MemberContentController());
		mappings.put("/memberDelete.do", new MemberDeleteController());
		mappings.put("/memberInsert.do", new MemberInsertController());
		mappings.put("/memberList.do", new MemberListController());
		mappings.put("/memberLogin.do", new MemberLoginController());
		mappings.put("/memberLogout.do", new MemberLogoutController());
		mappings.put("/validIdAjax.do", new ValidIdAjaxController());
		mappings.put("/carSelect.do", new CarSelectController());
		mappings.put("/carCategoryList.do", new CarCategoryListController());
		mappings.put("/carDelete.do", new CarDeleteController());
		mappings.put("/carList.do", new CarListController());
		mappings.put("/carMain.do", new CarMainController());
		mappings.put("/carReserve.do", new CarReserveController());
		mappings.put("/carSelectOption.do", new CarSelectOptionController());
		mappings.put("/carReserveList.do", new CarReserveListController());
		mappings.put("/carReserveMain.do", new CarReserveMainController());
	}
	public Controller getController(String key) {
		return mappings.get(key);
	}
}
