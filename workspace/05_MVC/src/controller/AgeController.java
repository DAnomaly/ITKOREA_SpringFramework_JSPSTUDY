package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BeerService;

/**
 * Servlet implementation class AgeController
 */
@WebServlet("/AgeController")
public class AgeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AgeController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String path = new BeerService().execute(request);
		
		request.getRequestDispatcher(path).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-genedrated method stub
		doGet(request, response);
	}

}
