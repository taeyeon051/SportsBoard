package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.JdbcUtil;
import dao.WriteDAO;

public class WritePageController implements Controller {
	@Override
	public MyView process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getMethod().equals("GET")) {
			String item = request.getParameter("item");
			WriteDAO dao = new WriteDAO();
			ArrayList<String> teamList = dao.getTeamList(item);

			request.setAttribute("teamList", teamList);
			
			return new MyView("/view/write.jsp");
		}

		String url = "";

		return new MyView(url);
	}
}
