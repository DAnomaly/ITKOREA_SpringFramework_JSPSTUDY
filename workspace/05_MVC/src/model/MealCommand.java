package model;

import javax.servlet.http.HttpServletRequest;

public class MealCommand {

	public String execute(HttpServletRequest request) {
		
		int hour = 0;
		try {
			hour = Integer.parseInt(request.getParameter("hour"));
		} catch (Exception e) { }
		
		String meal = null;
		
		if(hour < 9) {
			meal = "샌드위치";
		} else if (hour < 15) {
			meal = "돈까스";
		} else {
			meal = "동태찌개";
		}
		
		request.setAttribute("meal", meal);
		
		return "views/output.jsp";
	}
	
}
