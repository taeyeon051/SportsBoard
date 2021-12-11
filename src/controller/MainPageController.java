package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MainDAO;
import vo.BoardVO;
import vo.VideoVO;

public class MainPageController implements Controller {
	@Override
	public MyView process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String type = request.getParameter("type");
		if (type == null || type.equals("null")) type = "home";
		
		MainDAO dao = new MainDAO();
		ArrayList<BoardVO> viewsList = dao.getMainList(type, "views");
		ArrayList<BoardVO> latestList = dao.getMainList(type, "latest"); 
		ArrayList<VideoVO> videoList = dao.getVideoList(type); 
		
		request.setAttribute("viewsList", viewsList);
		request.setAttribute("latestList", latestList);
		request.setAttribute("videoList", videoList);
		
		return new MyView("/index.jsp");
	}

}
