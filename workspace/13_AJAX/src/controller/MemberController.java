package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.Command;
import command.DeleteMemberCommand;
import command.InsertMemberCommand;
import command.SelectMemberListCommand;
import command.SelectMemberOneCommand;
import command.UpdateMemberCommand;

@WebServlet("*.do")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String[] arr = request.getRequestURI().split("/");
		String cmd = arr[arr.length -1];
		
		Command command = null;
		switch (cmd) {
		case "selectMemberList.do":
			command = new SelectMemberListCommand();
			break;
		case "selectMemberOne.do":
			command = new SelectMemberOneCommand();
			break;
		case "deleteMember.do":
			command = new DeleteMemberCommand();
			break;
		case "insertMember.do":
			command = new InsertMemberCommand();
			break;
		case "updateMember.do":
			command = new UpdateMemberCommand();
			break;
		}
		
		if(command == null)
			return;
		
		ModelAndView mav = null;
		try {
			mav = command.execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(mav == null)
			return;
		
		if(mav.isRedirect())
			response.sendRedirect(mav.getView());
		else
			request.getRequestDispatcher(mav.getView()).forward(request,response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
