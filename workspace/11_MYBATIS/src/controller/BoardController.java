package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.board.BoardCommand;
import command.board.DeleteCommand;
import command.board.FindListCommand;
import command.board.IndexCommand;
import command.board.InsertCommand;
import command.board.InsertPageCommand;
import command.board.InsertReplyCommand;
import command.board.InsertReplyCommand3;
import command.board.InsertReplyPageCommand;
import command.board.SelectListCommand;
import command.board.SelectListCommand2;
import command.board.SelectListCommand3;
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
		case "insertReplyPage.do":
			command = new InsertReplyPageCommand();
			break;
		case "insertReply.do":
			command = new InsertReplyCommand();
			break;
		case "findList.do":
			command = new FindListCommand();
			break;
		case "selectList.do":
			command = new SelectListCommand2();
			break;
		case "delete.do":
			command = new DeleteCommand();
			break;
		case "selectList3.do":
			command = new SelectListCommand3();
			break;
		case "insertReply3.do":
			command = new InsertReplyCommand3();
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
