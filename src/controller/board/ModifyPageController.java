package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.WriteDAO;
import vo.BoardVO;
import vo.UserVO;

public class ModifyPageController implements Controller {
	@Override
	public MyView process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		WriteDAO dao = new WriteDAO();
		
		if (request.getMethod().equals("GET")) {
			int code = Integer.parseInt(request.getParameter("id"));
			BoardVO vo = dao.getBoard(code);
			
			ArrayList<String> teamList = dao.getTeamList(request.getParameter("type"));

			request.setAttribute("board", vo);
			request.setAttribute("teamList", teamList);
			
			return new MyView("/view/modify.jsp");
		}
		
		String url;
		
		HttpSession session = request.getSession();
		UserVO user = (UserVO) session.getAttribute("user");
		String writerId = request.getParameter("writerId");
		
		if (!writerId.equals(user.getUserId())) {
			request.setAttribute("alert", "해당 글을 수정 할 권한이 없습니다.");
			return null;
		}
		
		BoardVO vo = new BoardVO();
		vo.setwCode(Integer.parseInt(request.getParameter("id")));
		vo.setTitle(request.getParameter("title"));
		vo.setContent(request.getParameter("content"));
		vo.setTeamList(request.getParameter("teamList"));
		vo.setPlayerList(request.getParameter("playerList"));
		
		int n = dao.modifyWrite(vo);
		if (n > 0) url = "/index.jsp";
		else {
			request.setAttribute("alert", "DB 오류로 인하여 글 작성에 실패하였습니다.");
			return null;
		}
		
		return new MyView(url);
	}

}
