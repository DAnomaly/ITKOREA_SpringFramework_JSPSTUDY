package command.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ModelAndView;

public class EditBoardPageCommand implements BoardCommand{

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("/board/editBoardPage.jsp",false);
	}
	
}
