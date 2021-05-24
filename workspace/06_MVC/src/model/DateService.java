package model;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DateService implements HomeService {

	@Override
	public String execute(HttpServletRequest request,HttpServletResponse response) {
		
		Date date = new Date();
		request.setAttribute("date", new SimpleDateFormat("yyyy-MM-dd").format(date));
		
		return "views/output.jsp";
	}
	
}
