package controller.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import controller.MyView;
import dao.BoardDAO;
import vo.BoardVO;

public class BoardViewPageController implements Controller {
	@Override
	public MyView process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int code = Integer.parseInt(request.getParameter("id"));
		
		BoardDAO dao = new BoardDAO();
		BoardVO vo = dao.getBoard(code);
		System.out.println(vo.getwCode());
		if (vo.getwCode() < 1) {
			request.setAttribute("alert", "해당 아이디의 글이 존재하지 않습니다.");
			return new MyView("/index.jsp");
		}
		
		request.setAttribute("board", vo);
		
		return new MyView("/view/boardView.jsp");
	}
}
