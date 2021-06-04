package command.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ModelAndView;

public class JoinPageMemberCommand implements MemberCommand{
	
	 @Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		 
		return new ModelAndView("member/joinPage.jsp",false);
	}
}
