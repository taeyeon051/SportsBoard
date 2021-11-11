package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JdbcUtil;

public class WriteDAO {
	public ArrayList<String> getTeamList(String item) {
		ArrayList<String> teamList = new ArrayList<>();
		
		if (item.equals("baseball") || item.equals("worldbaseball") || item.equals("soccer")
				|| item.equals("worldsoccer")) {

			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "select t.team from sports s, teams t where s.s_code = t.s_code and s.en_sports_name = ?";

			conn = JdbcUtil.getConnection();
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, item);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					teamList.add(rs.getString("team"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JdbcUtil.close(conn, pstmt, rs);
			}	
		}
		
		return teamList;
	}
}
