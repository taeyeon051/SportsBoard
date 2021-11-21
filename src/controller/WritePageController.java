package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.WriteDAO;
import vo.WriteVO;

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
		
		WriteVO vo = new WriteVO();
		vo.setwCode(code);
		vo.setwType(type);
		vo.setTitle(request.getParameter("title"));
		vo.setContent(request.getParameter("content"));
		vo.setTeamList(request.getParameter("teamList"));
		vo.setPlayerList(request.getParameter("playerList"));
		
		System.out.println(request.getParameter("content"));
		System.out.println(request.getParameter("teamList"));
		System.out.println(request.getParameter("playerList"));
		
		int n = dao.insertWrite(vo);
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
