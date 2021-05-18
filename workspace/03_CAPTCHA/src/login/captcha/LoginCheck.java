package login.captcha;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import login.captcha.util.ClientDTO;
import login.captcha.util.GetCaptchaAnswer;

/**
 *	uri : http://localhost:9090/03_CAPTCHA/LoginCheck 
 */

@WebServlet("/LoginCheck")
public class LoginCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginCheck() { super(); }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		ClientDTO user = new ClientDTO();
		user.setId(id);
		user.setPw(pw);
		
		String key = request.getParameter("key");
		String user_key = request.getParameter("user_key");
		
		boolean isLogin = false;
		boolean isCaptcha = false;
		
		// 임시 데이터 id pw
		List<ClientDTO> clientList = new ArrayList<ClientDTO>();
		ClientDTO client1 = new ClientDTO("admin","0000");
		ClientDTO client2 = new ClientDTO("bread","1234");
		ClientDTO client3 = new ClientDTO("apple","1234");
		clientList.add(client1);
		clientList.add(client2);
		clientList.add(client3);
		
		// id pw 비교
		for (ClientDTO dto : clientList) 
			if(dto.getId().equals(id) && dto.getPw().equals(pw)) {
				isLogin = true;
				break;
			}
		
		// id pw 불일치
		if(isLogin == false) 
			out.println("<script> alert('존재하지 않는 아이디 이거나 잘못된 비밀번호 입니다.');"
					+ "location.href = '/03_CAPTCHA/Login'"
					+ "</script>");
		
		
		// GetCaptcha 확인
		JSONObject obj = GetCaptchaAnswer.getAnswer(key, user_key);
		if(obj != null)
			isCaptcha = (boolean)obj.get("result");
		
		// GetCaptcha 값 불일치 또는 오류
		if(isCaptcha == false)
			out.println("<script> alert('자동가입 방지문자가 일치하지 않습니다');"
					+ "location.href = '/03_CAPTCHA/Login'"
					+ "</script>");
			
		// 로그인 성공
		if(isLogin == true && isCaptcha == true) {
			request.getSession().setAttribute("user", user);
			out.println("<script>"
					+ "location.href = '/03_CAPTCHA/index.jsp'"
					+ "</script>");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { doGet(request, response); }

}