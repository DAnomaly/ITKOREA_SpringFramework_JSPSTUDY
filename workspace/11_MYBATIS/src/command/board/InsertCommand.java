package command.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ModelAndView;
import dao.BoardDAO;
import dto.BoardDTO;

public class InsertCommand implements BoardCommand {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// parameter
		String author = request.getParameter("author");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String ip = request.getRemoteAddr();
		// dto
		BoardDTO dto = new BoardDTO();
		dto.setAuthor(author);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setIp(ip);
		// dao : insert()
		int result = BoardDAO.getInstance().insert(dto);
		return new ModelAndView("/11_MYBATIS/board/insertResult.jsp?result=" + result, true);
	}

}
