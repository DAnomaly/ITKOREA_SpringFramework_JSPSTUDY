package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ModelAndView;
import model.HomeService;
import model.InquiryService;

@WebServlet("*.do")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public HomeController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		
		String[] arr = request.getRequestURI().split("/");
		String mapping = arr[arr.length - 1];
		
		HomeService service = ModelMapper.getInstance().getService(mapping);
		
		ModelAndView mav = service.execute(request, response);
		
		if(mav.isRedirect())
			response.sendRedirect(mav.getView());
		else
			request.getRequestDispatcher(mav.getView()).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
