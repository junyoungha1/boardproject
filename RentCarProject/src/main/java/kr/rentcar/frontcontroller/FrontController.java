package kr.rentcar.frontcontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.rentcar.controller.Controller;

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

		if (nextPage != null) {
			if (nextPage.contains("redirect:")) {
				response.sendRedirect(nextPage.split(":")[1]);
			} else {
				request.setAttribute("center", viewRes);
				System.out.println(viewRes);
				RequestDispatcher rd = request.getRequestDispatcher("/board/main.jsp");
				rd.forward(request, response);
			}
		}
	}

}
