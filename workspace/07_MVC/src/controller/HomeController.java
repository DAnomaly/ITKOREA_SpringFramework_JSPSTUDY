package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ModelAndView;
import model.ShapeCommand;

@WebServlet("*.do")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public HomeController() {
        super();
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 기본 작업
    	request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		// 2. 요청 확인
		String[] arr = request.getRequestURI().split("/");
		String mapping = arr[arr.length - 1];
		// System.out.println("mapping: " + mapping);
		
		// 3. 요청에 따른 모델의 선택
		// 1) 클래스명 : ModelMapper
		// 2) 매개변수 : String mapping
		// 3) 반환타입 : (Model을 반환)

		// Model의 기본
		// 1. 인터페이스를 하나 생성한다.
		// 2. 해당 인터페이스를 구현한다.
		ShapeCommand command = ModelMapper.getInstance().getModel(mapping);
		ModelAndView mav = command.execute(request, response);
		if(mav == null)
			return;
		
		
		if(mav.isRedirect()) 
			response.sendRedirect(mav.getView());
		else 
			request.getRequestDispatcher(mav.getView()).forward(request, response);
		
	}

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
