package quiz;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Quiz03
 */
@WebServlet("/Quiz03")
public class Quiz03 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Quiz03() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String contents = request.getParameter("contents");
		String ip = getRemoteAddr(request);
		Date date = new Date(System.currentTimeMillis());
		String strDate = new SimpleDateFormat("yyyy-MM-dd a hh:mm").format(date);
		contents = contents.replaceAll("\r\n", "<br>");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset=\"utf-8\">");
		out.println("<title>제목</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<ul>");
		out.println("<li>제목: " + title + "</li>");
		out.println("<li>작성자: " + writer + "</li>");
		out.println("<li>내용:<p>" + contents + "</p></li>");
		out.println("<li>작성일자: " + strDate + "</li>");
		out.println("<li>IP: " + ip + "</li>");
		out.println("</ul>");
		out.println("</body>");
		out.println("</html>");
		out.flush();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	protected String getRemoteAddr(HttpServletRequest request){
	    return (request.getHeader("X-FORWARDED-FOR") == null) ? request.getRemoteAddr() : request.getHeader("X-FORWARDED-FOR");
	}

}
