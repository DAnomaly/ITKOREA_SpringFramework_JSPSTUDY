package command.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import common.ModelAndView;
import dao.MemberDAO;

public class IdCheckMemberCommand implements MemberCommand {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("application/json; charset=UTF-8"); // JSON 데이터의 ContentType
		// parameter
		String id = request.getParameter("id");
		// dao : idCheck();
		int cnt = MemberDAO.getInstance().IdCheck(id);
		boolean isUsable = cnt == 0;
		// 응답 데이터를 JSON 데이터 타입으로 생성
		JSONObject obj = new JSONObject();
		obj.put("result", isUsable);
		// 응답 데이터를 곧바로 응답 처리
		PrintWriter out = response.getWriter();
		out.println(obj);
		out.close();
		// controller로 ModelAndView()를 반환하지 않아야만 redirect 또는 forward 되지 않는다.
		return null;
	}

}
