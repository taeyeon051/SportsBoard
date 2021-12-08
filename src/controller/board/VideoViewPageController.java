package controller.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import controller.MyView;
import dao.VideoDAO;
import vo.VideoVO;

public class VideoViewPageController implements Controller {
	@Override
	public MyView process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int code = Integer.parseInt(request.getParameter("id"));
		
		VideoDAO dao = new VideoDAO();
		VideoVO vo = dao.getVideo(code);
		
		if (vo.getvCode() < 1) {
			request.setAttribute("alert", "해당 아이디의 영상이 존재하지 않습니다.");
			return new MyView("/index.jsp");
		}
		
		request.setAttribute("video", vo);

		return new MyView("/view/videoView.jsp");
	}
}