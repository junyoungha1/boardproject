package kr.project.frontcontroller;

public class ViewResolver {
	public static String makeView(String nextPage, String key) {
		if (key.contains("board")) {
			return "/board/" + nextPage + ".jsp";
		} else if (key.contains("member")) {
			return "/member/" + nextPage + ".jsp";
		} else if (key.contains("car")) {
			return "/rentcar/" + nextPage + ".jsp";
		} else {
			return null;
		}
	}
}
