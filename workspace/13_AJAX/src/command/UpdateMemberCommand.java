package command;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import controller.ModelAndView;
import dao.MemberDAO;
import dto.Member;

public class UpdateMemberCommand implements Command{
	
	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		long no = Long.parseLong(request.getParameter("no"));
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String address = request.getParameter("address");
		
		Member member = new Member();
		member.setNo(no);
		member.setId(id);
		member.setName(name);
		member.setGender(gender);
		member.setAddress(address);
		
		int result = MemberDAO.getInstance().updateMember(member);
		
		JSONObject obj = new JSONObject();
		obj.put("result", result > 0);
		
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(obj);
		
		return null;
	}

}
