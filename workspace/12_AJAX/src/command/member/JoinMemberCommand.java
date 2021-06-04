package command.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import common.ModelAndView;
import dao.MemberDAO;
import dto.Member;

public class JoinMemberCommand implements MemberCommand{

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("application/json; charset=UTF-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone1") + "-" 
					+ request.getParameter("phone2") + "-"
					+ request.getParameter("phone3");
		Member member = new Member(id, pw, name, email, phone);
		int result = MemberDAO.getInstance().join(member);
		
		JSONObject obj = new JSONObject();
		obj.put("result",result > 0);
		PrintWriter out = response.getWriter();
		out.println(obj);
		
		return null;
	}
	
}
