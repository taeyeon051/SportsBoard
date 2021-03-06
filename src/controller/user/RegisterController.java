package controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import controller.MyView;
import dao.UserDAO;

public class RegisterController implements Controller {

	@Override
	public MyView process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getMethod().equals("GET")) return new MyView("/view/register.jsp");
		
		String url;
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String pwd = request.getParameter("password");
		String pwdc = request.getParameter("passwordc");
		
		if (id.trim().equals("") || name.trim().equals("") || pwd.trim().equals("")) {
			request.setAttribute("alert", "빈 값이 있습니다.");
			return new MyView("/view/register.jsp");
		}
		
		if (!pwd.trim().equals(pwdc.trim())) {
			request.setAttribute("alert", "비밀번호와 비밀번호 확인이 일치하지 않습니다.");
			return new MyView("/view/register.jsp");
		}
		
		UserDAO dao = new UserDAO();
		boolean user = dao.userCheck(id);
		
		if (!user) {
			int n = dao.userRegister(id, name, pwd);
			if (n > 0) url = "/view/login.jsp";
			else {
				request.setAttribute("alert", "DB 오류로 인하여 회원가입에 실패하였습니다.");	
				url = "/view/register.jsp";
			}
		} else {
			request.setAttribute("alert", "아이디가 중복됩니다.");
			url = "/view/register.jsp";
		}
		
		return new MyView(url);
	}

}
