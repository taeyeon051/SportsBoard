package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MainDAO;
import vo.BoardVO;
import vo.VideoVO;

public class MainPageListController implements Controller {
	@Override
	public MyView process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String type = request.getParameter("type");
		String[] list = request.getParameterValues("list[]");
		
		
		ArrayList<BoardVO> blist = new ArrayList<>();
		ArrayList<VideoVO> vlist = new ArrayList<>();
		
		MainDAO dao = new MainDAO();
		blist = dao.getBList(type, list);
		vlist = dao.getVList(type, list);
		
		request.setAttribute("blist", blist);
		request.setAttribute("vlist", vlist);
		
		return new MyView("/view/ajax.jsp");
	}
}
