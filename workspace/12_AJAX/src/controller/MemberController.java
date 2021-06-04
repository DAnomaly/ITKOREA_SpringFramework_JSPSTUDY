package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.member.DeleteMemberCommand;
import command.member.IdCheckMemberCommand;
import command.member.JoinMemberCommand;
import command.member.JoinPageMemberCommand;
import command.member.LoginMemberCommand;
import command.member.LoginPageMemberCommand;
import command.member.LogoutMemberCommand;
import command.member.MemberCommand;
import command.member.MyPageMemberCommand;
import command.member.UpdateMemberCommand;
import common.ModelAndView;

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
		
		MemberCommand command = null;
		switch (cmd) {
		case "joinPage.do":
			command = new JoinPageMemberCommand();
			break;
		case "idCheck.do":
			command = new IdCheckMemberCommand();
			break;
		case "join.do":
			command = new JoinMemberCommand();
			break;
		case "loginPage.do":
			command = new LoginPageMemberCommand();
			break;
		case "login.do":
			command = new LoginMemberCommand();
			break;
		case "logout.do":
			command = new LogoutMemberCommand();
			break;
		case "myPage.do":
			command = new MyPageMemberCommand();
			break;
		case "update.do":
			command = new UpdateMemberCommand();
			break;
		case "delete.do":
			command = new DeleteMemberCommand();
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
