package command;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import controller.ModelAndView;
import dao.MemberDAO;
import dto.Member;

public class SelectMemberListCommand implements Command {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		List<Member> list = MemberDAO.getInstance().selectMemberList();
		
		JSONObject obj = new JSONObject();
		if(list.size() > 0) {
			obj.put("isExist", true);
			JSONArray arr = new JSONArray();
			for (Member member : list) {
				JSONObject temp = new JSONObject();
				temp.put("no",member.getNo());
				temp.put("id",member.getId());
				temp.put("name",member.getName());
				temp.put("gender",member.getGender());
				temp.put("address",member.getAddress());
				arr.add(temp);
			}
			obj.put("list", arr);
		} else {
			obj.put("isExist", false);
		}
		
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(obj);
		out.close();
		return null;
	}

}
