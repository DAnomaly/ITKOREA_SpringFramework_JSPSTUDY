package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DateService;
import model.HomeService;
import model.TimeService;

@WebServlet("*.do")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public HomeController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// request, response 기본 처리
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		// 요청 확인 과정
		String requestURI = request.getRequestURI().split("/")[2]; // '/06_MVC/data.do' -> 'data.do'
		
		response.getWriter().write(requestURI);
		
		HomeService service = null;
		String path = "";                    
		switch (requestURI) {                
		case "date.do":                      
			service = new DateService();     
			break;                           
		case "time.do":                      
			service = new TimeService();     
			break;                           
		}                                       
		path = service.execute(request,response);
		
		request.getRequestDispatcher(path).forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
