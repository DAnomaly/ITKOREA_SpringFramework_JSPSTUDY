package quiz;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
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
@WebServlet("/Quiz04")
public class Quiz04 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Quiz04() {
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
		String filename = strDate.substring(0,10) + "_" + writer + ".txt";
		
		File file = new File("C:\\Users\\PSH\\SpringFrameWork\\thumb",filename);
		
		BufferedWriter bw = new BufferedWriter(new FileWriter(file));
		
		bw.write("작성일자: " + date); bw.newLine();
		bw.write("작성IP: " + ip); bw.newLine();
		bw.write("작성자: " + writer); bw.newLine();
		bw.write("제목: " + title); bw.newLine();
		bw.write(contents); bw.newLine();
		if(bw != null)
			bw.close();
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('" + filename + "파일이 생성되었습니다.');");
		out.println("history.back()");
		out.println("</script>");
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
