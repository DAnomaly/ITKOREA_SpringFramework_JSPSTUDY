package command;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import common.Paging;
import controller.ModelAndView;
import dao.MemberDAO;
import dto.Member;

public class SelectMemberListCommand implements Command {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		JSONObject obj = new JSONObject();
		
		// paging 처리
		JSONObject paging = new JSONObject();
		int page = Integer.parseInt(request.getParameter("page"));
		paging.put("page", page);
		
		int totalRecord = MemberDAO.getInstance().getMemberCount();
		paging.put("totalRecord", totalRecord);
		
		int recordPerPage = 10;
		paging.put("recordPerPage", recordPerPage);
		int pagePerBlock = 5;
		paging.put("pagePerBlock", pagePerBlock);
		
		String strPaging = Paging.getPaging("selectMemberList", totalRecord, recordPerPage, pagePerBlock, page);
		paging.put("toHTML", strPaging);
		
		obj.put("paging",paging);
		
		// member list 불러오기
		int beginRecord = (page - 1) * recordPerPage + 1;
		int endRecord = beginRecord + recordPerPage - 1;
		if(endRecord > totalRecord) 
			endRecord = totalRecord;
		Map<String, Object> recordMap = new HashMap<String, Object>();
		recordMap.put("beginRecord", beginRecord);
		paging.put("beginRecord", beginRecord);
		recordMap.put("endRecord", endRecord);
		paging.put("endRecord", endRecord);
		List<Member> list = MemberDAO.getInstance().selectMemberList(recordMap);
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
