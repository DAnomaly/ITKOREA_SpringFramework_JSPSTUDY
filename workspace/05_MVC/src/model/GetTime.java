package model;

import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

public class GetTime {
	
	public String execute(HttpServletRequest request) {
		
		Date date = new Date(System.currentTimeMillis());
		
		request.setAttribute("time", new SimpleDateFormat("a h시 m분 s초").format(date));
		
		return "views/output.jsp";
	}
	
}
