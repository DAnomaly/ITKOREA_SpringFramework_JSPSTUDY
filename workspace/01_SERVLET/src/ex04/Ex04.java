package ex04;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Ex04
 */
@WebServlet("/Ex04")
public class Ex04 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Ex04() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		// request의 캐릭터 셋 인코딩 처리 : UTF-8
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("name");
		String strHeight = request.getParameter("height");
		String strWeight = request.getParameter("weight");
		
		if(name == null || name.isEmpty()) 
			name ="Unknown";
		System.out.println("이름: " + name);
		
		double height = 0.0;
		if(strHeight != null && !strHeight.isEmpty())
			height = Double.parseDouble(strHeight);
		System.out.println("키: " + height);
		
		double weight = 0.0;
		if(strWeight != null && !strWeight.isEmpty())
			weight = Double.parseDouble(strWeight);
		System.out.println("몸무게: " + weight);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
