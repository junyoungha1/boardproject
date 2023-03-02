package kr.project.frontcontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.controller.Controller;

@WebServlet("*.do")
public class FrontController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String url = request.getRequestURI();
		String ctx = request.getContextPath();
		String key = url.substring(ctx.length());
		HandlerMapping mapping = new HandlerMapping();
		Controller cont = mapping.getController(key);
		String nextPage = cont.requestHandler(request, response);
		String viewRes = ViewResolver.makeView(nextPage, key);
		String conPath = null;
		int no = -1;
		int pageNum = -1;
		if (request.getParameter("no") != null) {
			no = Integer.parseInt(request.getParameter("no"));
		}
		if (request.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
		if (request.getParameter("conPath") != null) {
			conPath = request.getParameter("conPath");
		}

		if (nextPage != null) {
			if (nextPage.contains("redirect:")) {
				nextPage += "?no=" + no + "&pageNum=" + pageNum + "&conPath=" + conPath;
				response.sendRedirect(nextPage.split(":")[1]);
			} else {
				viewRes += "?no=" + no + "&pageNum=" + pageNum + "&conPath=" + conPath;
				RequestDispatcher rd = request.getRequestDispatcher(viewRes);
				rd.forward(request, response);
			}
		}
	}

}
