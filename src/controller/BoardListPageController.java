package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import vo.BoardVO;

public class BoardListPageController implements Controller {
	@Override
	public MyView process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String type = request.getParameter("type");
		int end = Integer.parseInt(request.getParameter("p")) * 10;
		
		BoardDAO dao = new BoardDAO();
		ArrayList<BoardVO> boardList = dao.getBoardList(type, end);

		request.setAttribute("boardList", boardList);
		
		return new MyView("/view/boardList.jsp");
	}
}
