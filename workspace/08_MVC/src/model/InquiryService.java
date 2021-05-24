package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ModelAndView;

public class InquiryService implements HomeService {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) {
		
		int kor = 0;
		int eng = 0;
		int mat = 0;
		
		String grade = "";
		double average = 0;
		
		try {
			kor = Integer.parseInt(request.getParameter("kor"));
			eng = Integer.parseInt(request.getParameter("eng"));
			mat = Integer.parseInt(request.getParameter("mat"));
			
			average = (kor + eng + mat) / 3.0;
			
			switch ((int)average/10) {
			case 10: case 9: grade = "A"; break;
			case 8: grade = "B"; break;
			case 7: grade = "C"; break;
			case 6: grade = "D"; break;
			default: grade = "F"; break;
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		request.setAttribute("grade", grade);
		request.setAttribute("average", average);
		
		return new ModelAndView(false,"views/output.jsp");
	}
	
	
}
