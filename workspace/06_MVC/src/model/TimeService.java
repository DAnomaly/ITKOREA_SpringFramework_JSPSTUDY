package model;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TimeService implements HomeService{

	@Override
	public String execute(HttpServletRequest request,HttpServletResponse response) {
		
		Date date = new Date();
		request.setAttribute("time", new SimpleDateFormat("H:mm:ss").format(date));
		
		return "views/output.jsp";
	}
	
}
