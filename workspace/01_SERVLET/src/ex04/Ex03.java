package ex04;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Ex03
 */
@WebServlet("/Ex03")
public class Ex03 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Ex03() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String name = request.getParameter("name");
		if(name == null || name.isEmpty()) {
			name = "기본이름";
		}
		System.out.println("이름: " + name);
		
		String strHeight = request.getParameter("height");
		int height = 0;
		if(strHeight != null && !strHeight.isEmpty()) 
			height = Integer.parseInt(strHeight);
		System.out.println("키: " + height + "cm");
		
		String strWeight = request.getParameter("weight");
		double weight = 0;
		if(strWeight != null && !strWeight.isEmpty()) 
			weight = Double.parseDouble(strWeight);
		System.out.println("몸무게: " + weight + "kg");
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
