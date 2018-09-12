package dao;

import java.sql.*;
import java.util.ArrayList;

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
			sql = "SELECT id FROM test_member WHERE id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberVo.getId());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return Query;
			}
			
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

	public int loginProsess(MemberVo memberVo) {
		conn = JdbcUtil.getConnection();
		String sql = "";
		int result = 0;
		
		try {
			sql = "SELECT * FROM test_member WHERE id = ? AND pass = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberVo.getId());
			pstmt.setString(2, memberVo.getPass());
			rs = pstmt.executeQuery();
			if(rs.next()) { result = 1; }
		} catch (SQLException e) { e.printStackTrace(); }
		finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		return result;
	}
	
	// 로그인 정보 확인
	public MemberVo memberLogin(MemberVo member) {
		MemberVo memberVo = null;

		try {
			conn = JdbcUtil.getConnection();
			String sql = "SELECT * FROM test_member WHERE id = ? AND pass =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPass());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				memberVo = new MemberVo();
				memberVo.setId(rs.getString("id"));
				memberVo.setPass(rs.getString("pass"));
				memberVo.setName(rs.getString("name"));
				memberVo.setAddr(rs.getString("addr"));
				memberVo.setPhone(rs.getString("phone"));
			}
		}
		catch (SQLException e) { e.printStackTrace(); }
		finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		return memberVo;
	}

	public MemberVo getMemberVo(String value) {
		MemberVo member = new MemberVo();
		try {
			conn = JdbcUtil.getConnection();
			String sql = "SELECT * FROM test_member WHERE id =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, value);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				member.setId(rs.getString(1));
				member.setPass(rs.getString(2));
				member.setName(rs.getString(3));
				member.setAddr(rs.getString(4));
				member.setPhone(rs.getString(5));
			}
		}
		catch (SQLException e) { e.printStackTrace(); }
		finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		
		return member;
	}

	public ArrayList<MemberVo> getMemberList(int page, int count) {
		ArrayList<MemberVo> memberList = new ArrayList<>();
		
		try {
			int startRow = ((page - 1) * 10) + 1;
			int endRow = startRow + count;
			
			conn = JdbcUtil.getConnection();
			String sql = "SELECT * FROM (SELECT ROWNUM AS rnum, temp.* FROM "
					+ "(SELECT * FROM test_member ORDER BY name ASC) temp)"
					+ " WHERE rnum BETWEEN ? AND ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemberVo memberVo = new MemberVo();
				memberVo.setId(rs.getString("id"));
				memberVo.setPass(rs.getString("pass"));
				memberVo.setName(rs.getString("name"));
				memberVo.setAddr(rs.getString("addr"));
				memberVo.setPhone(rs.getString("phone"));
				memberList.add(memberVo);
			}
		} catch (SQLException e) { e.printStackTrace(); }
		finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		return memberList;
	}

	public int getListCount() {
		int listCount = 0;
		
		try {
			conn = JdbcUtil.getConnection();
			String sql = "SELECT COUNT(*) FROM test_member";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (SQLException e) { e.printStackTrace(); }
		finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		return listCount;
	}

	public void deleteMember(String id) {
		try {
			conn = JdbcUtil.getConnection();
			String sql = "DELETE FROM test_member WHERE id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		} catch (SQLException e) { e.printStackTrace(); }
		finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
	}

	public boolean memberUpdate(MemberVo member) {
		boolean success = false;
		
		try {
			conn = JdbcUtil.getConnection();
			String sql = "UPDATE test_member SET pass = ?, name = ?, addr = ?, phone = ? WHERE id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getPass());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getAddr());
			pstmt.setString(4, member.getPhone());
			pstmt.setString(5, member.getId());
			
			int result = pstmt.executeUpdate();
			
			if(result != 0) { success = true; }
		}
		catch (SQLException e) { e.printStackTrace(); }
		finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		return success;
	}
}
