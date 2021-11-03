package controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/main/*")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HashMap<String, Controller> controllerMap = new HashMap<>();

    public FrontController() {
        super();
    }

	public void init(ServletConfig config) throws ServletException {
		controllerMap.put("/main/register", new RegisterController());
		controllerMap.put("/main/login", new LoginController());
		controllerMap.put("/main/logout", new LogoutController());
		controllerMap.put("/main/baseball", new MainPageController());
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String uri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String path = uri.substring(contextPath.length());
		
		Controller controller = controllerMap.get(path);
		if (controller == null) {
			System.out.println(controller);
			response.setStatus(HttpServletResponse.SC_NOT_FOUND);
			return;
		}
		
		MyView view = controller.process(request, response);
		
		view.render(request, response);
	}
}
