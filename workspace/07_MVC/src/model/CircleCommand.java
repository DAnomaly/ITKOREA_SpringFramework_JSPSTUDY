package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ModelAndView;

public class CircleCommand implements ShapeCommand{

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) {
		double radius = 0;
		
		try {
			radius = Double.parseDouble(request.getParameter("radius"));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		request.setAttribute("area", Math.pow(radius,2) * Math.PI );
		
		ModelAndView mav = new ModelAndView();
		mav.setRedirect(false);
		mav.setView("views/output.jsp");
		
		return mav;
	}
	
}
