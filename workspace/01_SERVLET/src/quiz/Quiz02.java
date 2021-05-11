package quiz;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Quiz01
 */
@WebServlet("/Quiz02")
public class Quiz02 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Quiz02() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String type = request.getParameter("type");
		String strDate = "";
		
		/*
		// Date클래스과 SimpleDateFormat 버전
		if(type != null && !type.isEmpty()) {
			Date date = new Date(System.currentTimeMillis());
			if(type.equalsIgnoreCase("date"))
				strDate = new SimpleDateFormat("yyyy년 MM월 dd일").format(date);
			if(type.equalsIgnoreCase("time"))
				strDate = new SimpleDateFormat("a hh시 mm분 ss초").format(date);
		}
		*/
		
		// Calendar 클래스 버전
		Calendar calendar = Calendar.getInstance();
		
		if (type != null && !type.isEmpty())
			switch (type) {
			case "date":
				int year = calendar.get(Calendar.YEAR);
				int month = calendar.get(Calendar.MONTH) + 1;
				int date = calendar.get(Calendar.DATE);
				strDate = year + "년 " + month + "월 " + date + "일";
				break;
			case "time":
				int hour = calendar.get(Calendar.HOUR);
				int minute = calendar.get(Calendar.MINUTE);
				int second = calendar.get(Calendar.SECOND);
				strDate = hour + "시 " + minute + "분 " + second + "초";
				break;
			}
		
		response.setContentType("text/html; charset=\"utf-8\"");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		if(!strDate.isEmpty())
			out.println("alert('" + strDate + "');");
		out.println("history.back();");
		out.println("</script>");
		out.flush();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
