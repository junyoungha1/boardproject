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
	}
	public Controller getController(String key) {
		return mappings.get(key);
	}
}
