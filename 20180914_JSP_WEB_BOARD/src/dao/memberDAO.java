package dao;

import java.sql.*;

import util.JdbcUtil;
import vo.memberVO;

public class memberDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	int Query = 0;
	String sql = "";
	
	private static memberDAO memberDao;
	private memberDAO() {}

	public static memberDAO getInstance() {
		if (memberDao == null) { memberDao = new memberDAO(); }
		return memberDao;
	}

	public int joinCheck(memberVO mVO) {
		conn = JdbcUtil.getConnection();
		
		try {
			sql = "SELECT member_id FROM web_Board WHERE member_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mVO.getId());
			rs = pstmt.executeQuery();
			if(rs.next()) { return Query; }
			
			if(mVO.getPass1().equals(mVO.getPass2())) { mVO.setPass(mVO.getPass1()); }
			
			sql = "INSERT INTO web_Board VALUES(?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mVO.getId());
			pstmt.setString(2, mVO.getPass());
			pstmt.setString(3, mVO.getName());
			pstmt.setString(4, mVO.getAddr());
			Query = pstmt.executeUpdate();
		}
		catch (SQLException e) { e.printStackTrace(); }
		finally { JdbcUtil.close(rs); JdbcUtil.close(pstmt); JdbcUtil.close(conn); }
		return Query;
	}

	public memberVO loginCheck(memberVO mVO) {
		conn = JdbcUtil.getConnection();
		memberVO loginVO = null;
		
		try {
			sql = "SELECT * FROM web_Board WHERE member_id = ? AND member_pass = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mVO.getId());
			pstmt.setString(2, mVO.getPass());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				loginVO = new memberVO();
				loginVO.setId(rs.getString(1));
				loginVO.setPass(rs.getString(2));
				loginVO.setName(rs.getString(3));
				loginVO.setAddr(rs.getString(4));
			}
		}
		catch (SQLException e) { e.printStackTrace(); }
		finally { JdbcUtil.close(rs); JdbcUtil.close(pstmt); JdbcUtil.close(conn); }
		return loginVO;
	}

	public int deleteMember(String id) {
		conn = JdbcUtil.getConnection();
		
		try {
			sql = "DELETE FROM web_boards WHERE member_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			Query = pstmt.executeUpdate();
		}
		catch (SQLException e) { e.printStackTrace(); }
		finally { JdbcUtil.close(pstmt); JdbcUtil.close(conn); }
		return Query;
	}
}
