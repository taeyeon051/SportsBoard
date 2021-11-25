package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import vo.BoardVO;

public class BoardViewPageController implements Controller {
	@Override
	public MyView process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int code = Integer.parseInt(request.getParameter("id"));
		
		BoardDAO dao = new BoardDAO();
		BoardVO vo = dao.getBoard(code);
		if (vo == null) {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('존재하지 않는 글입니다.');");
			out.println("history.back();");
			out.println("</script>");
		}
		
		request.setAttribute("board", vo);
		
		return new MyView("/view/boardView.jsp");
	}
}
