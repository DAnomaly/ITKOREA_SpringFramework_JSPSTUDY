package command.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ModelAndView;
import common.Paging;
import dao.BoardDAO;
import dto.BoardDTO;

// MAPPING : selectListBoard.do
public class SelectListCommand3 implements BoardCommand {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) {
		// page
		Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
		int page = Integer.parseInt(opt.orElse("1"));
		// 개시글 개수
		int totalRecord = BoardDAO.getInstance().getTotalRecord();
		
		int recordPerPage = 5;
		int beginRecord = (page - 1) * recordPerPage + 1;
		int endRecord = beginRecord + recordPerPage - 1;
		if(endRecord > totalRecord)
			endRecord = totalRecord;
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("beginRecord", beginRecord);
		map.put("endRecord", endRecord);
		
		List<BoardDTO> list = BoardDAO.getInstance().selectList3(map);
		
		String paging = Paging.getPaging("/11_MYBATIS/selectList3.do", totalRecord, recordPerPage, page);
		
		request.setAttribute("totalRecord", totalRecord);
		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		request.setAttribute("seq", totalRecord - (page - 1) * recordPerPage);
		return new ModelAndView("board/selectList3.jsp",false);
	}

}
