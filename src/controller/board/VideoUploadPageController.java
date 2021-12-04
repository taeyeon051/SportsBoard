package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.WriteDAO;

public class VideoUploadPageController implements Controller {
	@Override
	public MyView process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		WriteDAO dao = new WriteDAO();
		String type = request.getParameter("type");
		
		if (request.getMethod().equals("GET")) {
			ArrayList<String> teamList = dao.getTeamList(type);

			request.setAttribute("teamList", teamList);
			
			return new MyView("/view/upload.jsp");
		}
		
		String url = "";
		
		return new MyView(url);
	}
}
