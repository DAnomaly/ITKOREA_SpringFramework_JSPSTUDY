package command.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ModelAndView;
import dao.BoardDAO;
import dto.BoardDTO;

public class ViewBoardPageCommand implements BoardCommand{

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) {
		// 파라미터 처리
		long idx = Long.parseLong(request.getParameter("idx"));
		// DAO의 selectOneBoardByIdx() 메소드 호출
		BoardDTO dto = BoardDAO.getInstance().selectOneBoardByIdx(idx);
		request.setAttribute("dto", dto);
		// 조회수 증가
		if(request.getSession().getAttribute("hit") == null || (long)request.getSession().getAttribute("hit") != idx) {
			request.getSession().setAttribute("hit", idx);
			BoardDAO.getInstance().updateHitBoard(idx);
		}
		// 게시글이 존재하던 목록의 주소
		int totalRecord = BoardDAO.getInstance().getTotalBoardCount();
		int recordPerPage = 5;
		int page = 1;
		int record = totalRecord;
		while (true) {
			if((idx > record - recordPerPage + 1)) {
				break;
			} else {
				page++;
				record -= recordPerPage;
			}
		}
		String referer = "page=" + page;
		request.setAttribute("referer", referer);
		// ModelAndView
		return new ModelAndView("/board/viewBoardPage.jsp",false);
	}
	
}
