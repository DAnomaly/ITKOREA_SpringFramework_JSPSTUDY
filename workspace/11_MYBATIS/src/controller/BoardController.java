package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.board.BoardCommand;
import command.board.IndexCommand;
import command.board.InsertCommand;
import command.board.InsertPageCommand;
import command.board.SelectListCommand;
import common.ModelAndView;

@WebServlet("*.do")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// request, response setting
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		// mapping : cmd
		String[] arr = request.getRequestURI().split("/");
		String cmd = arr[arr.length - 1];
		
		// ModelAndView : mav
		ModelAndView mav = null;
		BoardCommand command = null;
		switch (cmd) {
		case "index.do":
			command = new IndexCommand(); 
			break;
		case "selectListBoard.do":
			command = new SelectListCommand();
			break;
		case "insertPage.do":
			command = new InsertPageCommand();
			break;
		case "insert.do":
			command = new InsertCommand();
			break;
		}
		
		if(command == null)
			return;
		else
			try {
				mav = command.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		// mav == null
		if(mav == null)
			return;
		
		// mav != null
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
