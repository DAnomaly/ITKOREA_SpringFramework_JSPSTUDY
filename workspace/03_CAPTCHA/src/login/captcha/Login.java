package login.captcha;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import login.captcha.util.GetCaptchaImage;
import login.captcha.util.GetCaptchaKey;

/**
 *	http://localhost:9090/03_CAPTCHA/Login
 */

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Login() { super(); }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1. 네이버에 캡차 키 요청하기
		String key = GetCaptchaKey.getKey();
		
		// 2. 네이버에 캡차 이미지 요청하기
		String realPath = request.getServletContext().getRealPath("/captcha_img"); // 받아온 파일을 realPath에 담아야 정상적으로 이미지를 불러올 수 있음

		String filename = GetCaptchaImage.getImage(key,realPath);
		
		// 3. 로그인 페이지(login.jsp)로 이동하기
		request.setAttribute("key", key);
		request.setAttribute("filename", filename);
		
		request.getRequestDispatcher("/Login/login.jsp").forward(request, response);
	}	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { doGet(request, response); }
}
