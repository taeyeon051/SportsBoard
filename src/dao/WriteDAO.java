package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import common.JdbcUtil;
import oracle.jdbc.OracleResultSet;
import oracle.sql.CLOB;
import vo.BoardVO;
import vo.UserVO;

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

	public int getLastCode() {
		int code = 1;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select max(w_code) + 1 as code from writings";
		
		conn = JdbcUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				code = rs.getInt("code");
				if (code < 1) code = 1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
		return code;
	}

	public int insertWrite(BoardVO vo, UserVO user) {
		int n = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "insert into writings values(?, ?, to_char(sysdate,'yyyy.mm.dd hh24:mi'), ?, ?, ?, ?, ?, ?, ?)";
		
		conn = JdbcUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getwCode());
			pstmt.setString(2, vo.getwType());
			pstmt.setString(3, vo.getTitle());
			pstmt.setString(4, user.getUserId());
			pstmt.setString(5, user.getUserName());
			pstmt.setString(6, vo.getContent());
			pstmt.setString(7, vo.getTeamList());
			pstmt.setString(8, vo.getPlayerList());
			pstmt.setInt(9, 0);
			
			n = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
		return n;
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
				vo.setTitle(rs.getString("title"));
				vo.setWriterId(rs.getString("writer_id"));
				vo.setContent(rs.getString("content"));
				vo.setTeamList(rs.getString("teamList"));
				vo.setPlayerList(rs.getString("playerList"));
			} else {
				vo = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
		return vo;
	}

	public int modifyWrite(BoardVO vo) {
		int n = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "update writings set title = ?, content = ?, teamList = ?, playerList = ? where w_code = ?";
		
		conn = JdbcUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getTeamList());
			pstmt.setString(4, vo.getPlayerList());
			pstmt.setInt(5, vo.getwCode());
			
			n = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
		return n;
	}
}
