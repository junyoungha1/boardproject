package kr.project.frontcontroller;

public class ViewResolver {
	public static String makeView(String nextPage, String key) {
		if (key.contains("board")) {
			return "/board/" + nextPage + ".jsp";
		}
		return "/member/" + nextPage + ".jsp";
	}
}
