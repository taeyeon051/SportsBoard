package controller.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.MyView;
import dao.BoardDAO;
import vo.UserVO;

public class DeletePageController implements Controller {
	@Override
	public MyView process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BoardDAO dao = new BoardDAO();
		
		HttpSession session = request.getSession();
		UserVO user = (UserVO) session.getAttribute("user");
		boolean video = Boolean.parseBoolean(request.getParameter("video"));
		String writerId = request.getParameter("writerId");

		if (!writerId.equals(user.getUserId())) {
			request.setAttribute("alert", "해당 " + (video ? "영상" : "글") + "을 삭제할 권한이 없습니다.");
			return null;
		}
		
		int code = Integer.parseInt(request.getParameter("no"));
		
		String url;
		int n = dao.deleteBoard(code, video);
		if (n > 0) url = "/index.jsp";
		else {
			request.setAttribute("alert", "DB 오류로 인하여 삭제에 실패하였습니다.");
			return null;
		}
		
		return new MyView(url);
	}
}
