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

public class FindListCommand implements BoardCommand {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// page
		Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
		int page = Integer.parseInt(opt.orElse("1"));
		// parameter
		Map<String, Object> map = new HashMap<String, Object>();
		String column = request.getParameter("column");
		String query = request.getParameter("query");
		map.put("column", column);
		map.put("query", "%" + query + "%");
		
		// 개시글 개수
		int totalRecord = BoardDAO.getInstance().findTotalRecord(map);
		
		int recordPerPage = 5;
		int beginRecord = (page - 1) * recordPerPage + 1;
		int endRecord = beginRecord + recordPerPage - 1;
		if(endRecord > totalRecord)
			endRecord = totalRecord;
		
		map.put("beginRecord", beginRecord);
		map.put("endRecord", endRecord);
		
		List<BoardDTO> list = BoardDAO.getInstance().findList(map);
		
		String paging = Paging.getPaging("/11_MYBATIS/selectListBoard.do", totalRecord, recordPerPage, page);
		
		request.setAttribute("totalRecord", totalRecord);
		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		request.setAttribute("seq", totalRecord - (page - 1) * recordPerPage);
		return new ModelAndView("board/findList.jsp",false);
	}

}
