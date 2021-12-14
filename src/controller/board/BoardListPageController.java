package controller.board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import controller.MyView;
import dao.BoardDAO;
import vo.BoardVO;

public class BoardListPageController implements Controller {
	@Override
	public MyView process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String type = request.getParameter("type");
		String key = type.equals("keyword") ? request.getParameter("key") : "";
		if (type.equals("keyword") && key.trim().equals("")) type = "home"; 
		
		BoardDAO dao = new BoardDAO();
		int cnt;
		if (type.equals("keyword")) cnt = (int) Math.ceil(dao.getBoardCnt(type, key) / 10);
		else cnt = (int) Math.ceil(dao.getBoardCnt(type, "") / 10);
		
		int end = Integer.parseInt(request.getParameter("p")) * 10;
		ArrayList<BoardVO> boardList = dao.getBoardList(type, end, key);

		request.setAttribute("boardList", boardList);
		request.setAttribute("cnt", cnt);
		
		return new MyView("/view/boardList.jsp");
	}
}
