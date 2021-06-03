package command.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ModelAndView;
import dao.BoardDAO;

public class DeleteCommand implements BoardCommand {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 파라미터 처리
		long no = Long.parseLong(request.getParameter("no"));
		
		int result = BoardDAO.getInstance().delete(no);
		
		return new ModelAndView("board/deleteResult.jsp?rs=" + result,false);
	}
	
}
