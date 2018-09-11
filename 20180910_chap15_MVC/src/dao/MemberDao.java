package dao;

import java.sql.*;

import util.JdbcUtil;
import vo.MemberVo;

public class MemberDao {
	Connection conn = null;
	PreparedStatement pstmt =null;
	ResultSet rs = null;

	private static MemberDao memberDao;
	
	private MemberDao() {}

	public static MemberDao getInstance() {
		if (memberDao == null) { memberDao = new MemberDao(); }
		return memberDao;
	}

	public int joinProsess(MemberVo memberVo) {
		conn = JdbcUtil.getConnection();
		int Query = 0;
		String sql = "";
		
		try {
			sql = "INSERT INTO test_member VALUES(?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberVo.getId());
			pstmt.setString(2, memberVo.getPass());
			pstmt.setString(3, memberVo.getName());
			pstmt.setString(4, memberVo.getAddr());
			pstmt.setString(5, memberVo.getPhone());
			Query = pstmt.executeUpdate();
		} catch (SQLException e) { e.printStackTrace(); }
		finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		return Query;
	}

	public ResultSet loginProsess(MemberVo memberVo) {
		conn = JdbcUtil.getConnection();
		String sql = "";
		
		try {
			sql = "SELECT id, pass FROM test_member WHERE id = ? AND pass = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberVo.getId());
			pstmt.setString(2, memberVo.getPass());
			rs = pstmt.executeQuery();
		} catch (SQLException e) { e.printStackTrace(); }
		finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		return rs;
	}

}
