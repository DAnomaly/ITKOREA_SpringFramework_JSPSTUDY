package command.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import common.ModelAndView;
import dao.MemberDAO;
import dto.Member;

public class UpdateMemberCommand implements MemberCommand{

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("application/json; charset=UTF-8");
		
		long no = Long.parseLong(request.getParameter("no"));
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		
		Member member = null;
		if(pw == null || pw.isEmpty()) {
			member = new Member(null, null, name, email, phone);
		} else {
			member = new Member(null, pw, name, email, phone);
		}
		member.setNo(no);
		
		int result = MemberDAO.getInstance().update(member);
		
		if(result > 0) {
			Member loginUser = (Member)request.getSession().getAttribute("loginUser");
			loginUser.setName(member.getName());
			loginUser.setEmail(member.getEmail());
			loginUser.setPhone(member.getPhone());
			if(member.getPw() != null)
				loginUser.setPw(member.getPw());
		}
		
		JSONObject obj = new JSONObject();
		obj.put("result",result > 0);
		
		
		PrintWriter out = response.getWriter();
		out.println(obj);
		out.close();
		
		return null;
	}
	
}
