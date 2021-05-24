package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ModelAndView;

public class RectangleCommand implements ShapeCommand {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) {
		int width = 0;
		int height = 0;
		
		try {
			width = Integer.parseInt(request.getParameter("width"));
			height = Integer.parseInt(request.getParameter("height"));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		request.setAttribute("area", width * height);

		ModelAndView mav = new ModelAndView();
		mav.setRedirect(false);
		mav.setView("views/output.jsp");
		
		return mav;
	}

}
