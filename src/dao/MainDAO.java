package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JdbcUtil;
import vo.BoardVO;
import vo.VideoVO;

public class MainDAO {
	public ArrayList<BoardVO> getMainList(String type, String data) {
		ArrayList<BoardVO> list = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from (select * from writings ";
		if (type.equals("home")) { 
			if (data.equals("views")) sql += "where views > 0 order by views";
			else sql += "order by w_code";
		} else {
			if (data.equals("views")) sql += "where views > 0 and w_type = ? order by views";
			else sql += "where w_type = ? order by w_code";
		}
		sql += " desc) where rownum <= 10";
		
		conn = JdbcUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			if (!type.equals("home")) pstmt.setString(1, type);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setwCode(rs.getInt("w_code"));
				vo.setwType(rs.getString("w_type"));
				vo.setwDate(rs.getString("w_date"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
		return list;
	}	

	public ArrayList<VideoVO> getVideoList(String type) {
		ArrayList<VideoVO> list = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from (select * from videos ";
		if (!type.equals("home")) sql += "where v_type = ? ";
		sql += "order by views desc, v_code desc) where rownum <= 5";
		
		conn = JdbcUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			if (!type.equals("home")) pstmt.setString(1, type);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				VideoVO vo = new VideoVO();
				vo.setvCode(rs.getInt("v_code"));
				vo.setvType(rs.getString("v_type"));
				vo.setvDate(rs.getString("v_date"));
				vo.setTitle(rs.getString("title"));
				vo.setImageSrc(rs.getString("image_src"));
				vo.setVideoTime(rs.getString("video_time"));
				vo.setViews(rs.getInt("views"));
				
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
		return list;
	}
}
