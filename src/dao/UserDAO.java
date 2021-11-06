package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.JdbcUtil;
import common.SHA256;
import vo.UserVO;

public class UserDAO {
	public boolean userCheck(String userId) {
		boolean user = false;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from users where userId = ?";
		
		conn = JdbcUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				user = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
		return user;
	}

	public int userRegister(String id, String name, String pwd) {
		int n = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into users values(users_seq.nextval, ?, ?, ?)";
		String shaPwd = SHA256.encodeSha256(pwd);
		
		conn = JdbcUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, shaPwd);
			
			n = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt);
		}
		
		return n;
	}
	
	public UserVO userLogin(String id, String pwd) {
		UserVO vo = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from users where userId = ? and userPwd = ?";
		String shaPwd = SHA256.encodeSha256(pwd);
		
		conn = JdbcUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, shaPwd);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				vo = new UserVO();
				vo.setId(rs.getInt("id"));
				vo.setUserId(rs.getString("userId"));
				vo.setUserName(rs.getString("userName"));
				vo.setUserPwd(rs.getString("userPwd"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
		return vo;
	}
}
