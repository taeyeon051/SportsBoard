package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.JdbcUtil;
import vo.UserVO;
import vo.VideoVO;

public class VideoDAO {
	public int getLastCode() {
		int code = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select max(v_code) + 1 as code from videos";
		
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

	public int insertVideo(VideoVO vo, UserVO user) {
		int n = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "insert into videos values(?, ?, to_char(sysdate,'yyyy.mm.dd hh24:mi'), ?, ?, ?, ?, ?, ?, ?)";
		
		conn = JdbcUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getvCode());
			pstmt.setString(2, vo.getvType());
			pstmt.setString(3, vo.getTitle());
			pstmt.setString(4, user.getUserId());
			pstmt.setString(5, vo.getImageSrc());
			pstmt.setString(6, vo.getVideoSrc());
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
}
