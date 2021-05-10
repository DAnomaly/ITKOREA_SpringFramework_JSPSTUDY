package ex04;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sun.awt.image.IntegerComponentRaster;

/**
 * Servlet implementation class Ex02
 */
@WebServlet("/Ex02")
public class Ex02 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Ex02() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setCharacterEncoding("UTF-8");
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		// 1. <a> 태그를 이용해서 넘어오면 100% get 방식이다.
		// 2. 함께 넘어오는 파라미터는 request가 처리한다.
		
		// request에서 파라미터 꺼내는 방법
		// 1. getParameter() 메소드를 이용한다.
		//   1) String getParameter(String parameter) { } 형식이다. (String을 반환한다.)
		String name = request.getParameter("name");
		String strAge = request.getParameter("age");
		System.out.println(name);
		if(name != null && !name.isEmpty()) {
			response.getWriter().append("\nname: " + name);
		}
		if(strAge != null && !strAge.isEmpty()) {
			int age = Integer.parseInt(strAge);
			response.getWriter().append("\nage: " + age);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
