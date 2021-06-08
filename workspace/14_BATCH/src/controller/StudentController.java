package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.Command;
import command.InsertStudentCommand;
import command.SelectStudentListCommand;

@WebServlet("*.do")
public class StudentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public StudentController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String[] arr = request.getRequestURI().split("/");
		String cmd = arr[arr.length - 1];
		
		ModelAndView mav = null;
		Command command = null;
		switch (cmd) {
		case "selectStudentList.do":
			command = new SelectStudentListCommand();
			break;
		case "insertStudent.do":
			command = new InsertStudentCommand();
			break;
		}
		if(command == null) return;

		try {
			mav = command.execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(mav == null) return;
		
		if(mav.isRedirect()) {
			response.sendRedirect(mav.getView());
		} else {
			request.getRequestDispatcher(mav.getView()).forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
