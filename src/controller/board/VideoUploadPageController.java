package controller.board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.MyView;
import dao.VideoDAO;
import dao.WriteDAO;
import vo.UserVO;
import vo.VideoVO;

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
		
		String url;
		VideoDAO videoDAO = new VideoDAO(); 
		int code = videoDAO.getLastCode();
		
		VideoVO vo = new VideoVO();
		vo.setvCode(code);
		vo.setvType(type);
		vo.setTitle(request.getParameter("title"));
		vo.setImageSrc(request.getParameter("imageName"));
		vo.setVideoSrc(request.getParameter("videoName"));
		System.out.println(request.getParameter("videoTime"));
		vo.setVideoTime(request.getParameter("videoTime"));
		vo.setTeamList(request.getParameter("teamList"));
		vo.setPlayerList(request.getParameter("playerList"));
		
		HttpSession session = request.getSession();
		UserVO user = (UserVO) session.getAttribute("user");
		
		int n = videoDAO.insertVideo(vo, user);
		if (n > 0) url = "/index.jsp";
		else {
			request.setAttribute("alert", "DB 오류로 인하여 영상 업로드에 실패하였습니다.");
			ArrayList<String> teamList = dao.getTeamList(type);
			request.setAttribute("teamList", teamList);
			
			url = "/view/upload.jsp";
		}
		
		return new MyView(url);
	}
}
