package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JdbcUtil;
import vo.BoardVO;

public class BoardDAO {
	public double getBoardCnt(String type) {
		double cnt = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) as cnt from writings where w_type = ?";
		
		conn = JdbcUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, type);
			rs = pstmt.executeQuery();
			
			if (rs.next()) cnt = rs.getInt("cnt");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
		return cnt;
	}
	
	public ArrayList<BoardVO> getBoardList(String type, int end) {
		ArrayList<BoardVO> boardList = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * "
				+ "from (select row_number() over (order by w_code desc) as num, w.* from writings w "
				+ "where w_type = ?) "
				+ "where num between ? and ?";
		
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
				vo.setWriterName(rs.getString("writer_name"));
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

	public BoardVO getBoard(int code) {
		BoardVO vo = new BoardVO();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from writings where w_code = ?";
		
		conn = JdbcUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, code);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				vo.setwCode(rs.getInt("w_code"));
				vo.setwType(rs.getString("w_type"));
				vo.setwDate(rs.getString("w_date"));
				vo.setTitle(rs.getString("title"));
				vo.setWriterId(rs.getString("writer_id"));
				vo.setWriterName(rs.getString("writer_name"));
				vo.setContent(rs.getString("content"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
		return vo;
	}

	public int deleteBoard(int code) {
		int n = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "delete from writings where w_code = ?";
		
		conn = JdbcUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, code);
			
			n = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt);
		}
		
		return n;
	}
}
