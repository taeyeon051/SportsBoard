package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import vo.UserVO;

public class LoginController implements Controller {
	@Override
	public MyView process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getMethod().equals("GET")) return new MyView("/view/login.jsp");
		
		String url;
		String id = request.getParameter("id");
		String pwd = request.getParameter("password");
		
		if (id.trim().equals("") || pwd.trim().equals("")) {
			request.setAttribute("alert", "빈 값이 있습니다.");
			return new MyView("/view/login.jsp");
		}
		
		UserDAO dao = new UserDAO();
		UserVO vo = dao.userLogin(id, pwd);
		
		if (vo != null) {
			HttpSession session = request.getSession();
			session.setAttribute("user", vo);
			url = "/main?item=home";
		} else {
			request.setAttribute("alert", "아이디 혹은 비밀번호가 올바르지 않습니다.");
			url = "/view/login.jsp";
		}
		
		return new MyView(url);
	}
}
