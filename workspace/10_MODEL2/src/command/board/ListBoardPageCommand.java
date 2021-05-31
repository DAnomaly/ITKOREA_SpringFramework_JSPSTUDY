package command.board;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections4.map.HashedMap;

import common.ModelAndView;
import dao.BoardDAO;
import dto.BoardDTO;

public class ListBoardPageCommand implements BoardCommand {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) {
		
		// 전체 게시글 개수 구하기
		int totalRecord = BoardDAO.getInstance().getTotalBoardCount();
		
		// 페이지 수 처리하기(파라미터로 전달)
		Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
		int page = Integer.parseInt(opt.orElse("1"));
		
		// 한 페이지에 표시할 게시글의 개수 : recordPerPage
		int recordPerPage = 5;
		
		// totalRecord, page, recordPerPage를 통해서
		// beginRecord, endRecord를 계산
		int beginRecord = (page - 1) * recordPerPage + 1;
		int endRecord = beginRecord + recordPerPage - 1;
		endRecord = (endRecord < totalRecord) ? endRecord : totalRecord;
		
		// DB로 보낼 Map
		Map<String, Integer> map = new HashedMap<String, Integer>();
		map.put("begin", beginRecord);
		map.put("end", endRecord);
		
		// DAO의 selectList() 메소드 호출
		List<BoardDTO> list = BoardDAO.getInstance().selectList(map);
		
		// 페이징 처리
		
		
		request.setAttribute("list", list);
		request.setAttribute("totalRecord", totalRecord);
		return new ModelAndView("/board/listBoardPage.jsp",false);
	}

}
