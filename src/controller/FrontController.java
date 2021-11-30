package controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/user/*", "/main", "/board/*"})
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HashMap<String, Controller> controllerMap = new HashMap<>();

    public FrontController() {
        super();
    }

	public void init(ServletConfig config) throws ServletException {
		// 유저 로그인, 회원가입, 로그아웃
		controllerMap.put("/user/register", new RegisterController());
		controllerMap.put("/user/login", new LoginController());
		controllerMap.put("/user/logout", new LogoutController());
		// 메인페이지
		controllerMap.put("/main", new MainPageController());
		// 글 작성, 수정, 삭제
		controllerMap.put("/board/write", new WritePageController());
		controllerMap.put("/board/modify", new ModifyPageController());
		controllerMap.put("/board/delete", new DeletePageController());
		// 글 목록
		controllerMap.put("/board/list", new BoardListPageController());
		// 글 보기
		controllerMap.put("/board/view", new BoardViewPageController());
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String uri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String path = uri.substring(contextPath.length());
		
		Controller controller = controllerMap.get(path);
		if (controller == null) {
			response.setStatus(HttpServletResponse.SC_NOT_FOUND);
			return;
		}
		
		MyView view = controller.process(request, response);
		
		view.render(request, response);
	}
}
