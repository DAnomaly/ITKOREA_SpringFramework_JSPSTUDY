package command;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import controller.ModelAndView;
import dao.MemberDAO;
import dto.Member;

public class SelectMemberOneCommand implements Command {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		long no = Long.parseLong(request.getParameter("no"));
		
		Member member = MemberDAO.getInstance().selectMemberOne(no);
		
		JSONObject obj = new JSONObject();
		obj.put("no", member.getNo());
		obj.put("id", member.getId());
		obj.put("name", member.getName());
		obj.put("gender", member.getGender());
		obj.put("address", member.getAddress());
		
		JSONObject result = new JSONObject();
		result.put("member", obj);
		
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(result);
		out.close();
		return null;
	}

}
