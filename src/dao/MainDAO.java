package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JdbcUtil;
import vo.BoardVO;

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
