package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MainDAO;
import vo.BoardVO;

public class MainPageController implements Controller {
	@Override
	public MyView process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String type = request.getParameter("type");
		
		MainDAO dao = new MainDAO();
		ArrayList<BoardVO> viewsList = dao.getMainList(type, "views");
		ArrayList<BoardVO> latestList = dao.getMainList(type, "latest"); 
		
		request.setAttribute("viewsList", viewsList);
		request.setAttribute("latestList", latestList);
		
		return new MyView("/index.jsp");
	}

}
