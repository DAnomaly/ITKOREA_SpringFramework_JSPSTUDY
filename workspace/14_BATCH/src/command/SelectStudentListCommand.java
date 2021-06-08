package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.ModelAndView;
import dao.StudentDAO;

public class SelectStudentListCommand implements Command {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setAttribute("list", StudentDAO.getInstance().selectStudentList());
		return new ModelAndView("student/listPage.jsp",false);
	}

}
