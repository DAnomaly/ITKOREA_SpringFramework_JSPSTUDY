package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.ModelAndView;

public interface Command {

	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
