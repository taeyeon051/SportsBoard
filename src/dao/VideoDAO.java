package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
		String sql = "insert into videos values(?, ?, to_char(sysdate,'yyyy.mm.dd hh24:mi'), ?, ?, ?, ?, ?, ?, ?, ?)";
		
		conn = JdbcUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getvCode());
			pstmt.setString(2, vo.getvType());
			pstmt.setString(3, vo.getTitle());
			pstmt.setString(4, user.getUserId());
			pstmt.setString(5, vo.getImageSrc());
			pstmt.setString(6, vo.getVideoSrc());
			pstmt.setString(7, vo.getVideoTime());
			pstmt.setString(8, vo.getTeamList());
			pstmt.setString(9, vo.getPlayerList());
			pstmt.setInt(10, 0);
			
			n = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
		return n;
	}

	public double getVideoCnt(String type) {
		double cnt = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) as cnt from videos where v_type = ?";
		
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

	public ArrayList<VideoVO> getVideoList(String type) {
		ArrayList<VideoVO> videoList = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		if (type.equals("home")) sql = "select * from videos order by v_code desc";
		else sql = "select * from videos where v_type = ? order by v_code desc";
		
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
				
				videoList.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
		return videoList;
	}

	public VideoVO getVideo(int code) {
		VideoVO vo = new VideoVO();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from videos where v_code = ?";
		
		conn = JdbcUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, code);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				vo.setvCode(rs.getInt("v_code"));
				vo.setvType(rs.getString("v_type"));
				vo.setvDate(rs.getString("v_date"));
				vo.setTitle(rs.getString("title"));
				vo.setUploaderId(rs.getString("uploader_id"));
				vo.setVideoSrc(rs.getString("video_src"));
				vo.setViews(rs.getInt("views"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
		return vo;
	}
	
	public int viewPlus(int code) {
		int n = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update videos set views = (select views from videos where v_code = ?) + 1 where v_code = ?";
		
		conn = JdbcUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, code);
			pstmt.setInt(2, code);
			
			n = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt);
		}
		
		return n;
	}
}
