package controller.board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import controller.MyView;
import dao.VideoDAO;
import vo.VideoVO;

public class VideoListPageController implements Controller {
	@Override
	public MyView process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String type = request.getParameter("type");
		
		VideoDAO dao = new VideoDAO();
		ArrayList<VideoVO> videoList = dao.getVideoList(type);
		
		request.setAttribute("videoList", videoList);
		
		return new MyView("/view/videoList.jsp");
	}
}
