package controller.board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.MyView;
import dao.WriteDAO;
import vo.BoardVO;
import vo.UserVO;

public class WritePageController implements Controller {
	@Override
	public MyView process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		WriteDAO dao = new WriteDAO();
		String type = request.getParameter("type"); 
		
		if (request.getMethod().equals("GET")) {
			ArrayList<String> teamList = dao.getTeamList(type);

			request.setAttribute("teamList", teamList);
			
			return new MyView("/view/write.jsp");
		}
		
		String url;
		int code = dao.getLastCode();
		
		BoardVO vo = new BoardVO();
		vo.setwCode(code);
		vo.setwType(type);
		vo.setTitle(request.getParameter("title"));
		vo.setContent(request.getParameter("content"));
		vo.setTeamList(request.getParameter("teamList"));
		vo.setPlayerList(request.getParameter("playerList"));
		
		HttpSession session = request.getSession();
		UserVO user = (UserVO) session.getAttribute("user");
		
		int n = dao.insertWrite(vo, user);
		if (n > 0) url = "/index.jsp";
		else {
			request.setAttribute("alert", "DB 오류로 인하여 글 작성에 실패하였습니다.");
			ArrayList<String> teamList = dao.getTeamList(type);
			request.setAttribute("teamList", teamList);

			url = "/view/write.jsp";
		}

		return new MyView(url);
	}
}
