package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JdbcUtil;
import vo.BoardVO;

public class BoardDAO {
	public ArrayList<BoardVO> getBoardList(String type, int end) {
		ArrayList<BoardVO> boardList = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select b.*, rownum as num "
				+ "from (select * from writings order by w_date) b "
				+ "where w_type = ? and rownum >= ? and rownum <= ?";
		
		conn = JdbcUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, type);
			pstmt.setInt(2, end - 9);
			pstmt.setInt(3, end);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setwCode(rs.getInt("w_code"));
				vo.setwType(rs.getString("w_type"));
				vo.setwDate(rs.getString("w_date"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setTeamList(rs.getString("teamList"));
				vo.setPlayerList(rs.getString("playerList"));
				
				boardList.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
		return boardList;
	}

}
