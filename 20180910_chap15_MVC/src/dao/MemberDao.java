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

	public MemberVo loginProsess(MemberVo memberVo) {
		conn = JdbcUtil.getConnection();
		String sql = "";
		MemberVo memberInfo = new MemberVo();
		
		try {
			sql = "SELECT * FROM test_member WHERE id = ? AND pass = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberVo.getId());
			pstmt.setString(2, memberVo.getPass());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				memberInfo.setId(rs.getString("id"));
				memberInfo.setPass(rs.getString("pass"));
				memberInfo.setName(rs.getString("name"));
				memberInfo.setAddr(rs.getString("addr"));
				memberInfo.setPhone(rs.getString("phone"));
			}
		} catch (SQLException e) { e.printStackTrace(); }
		finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		return memberInfo;
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
					+ "(SELECT * FROM test_member) temp) WHERE rnum BETWEEN ? and ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemberVo memberVo = new MemberVo();
				memberVo.setId(rs.getString("id"));
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

	/*public ArrayList<MemberVo> getMemberList() {
		ArrayList<MemberVo> memberList = new ArrayList<>();
		try {
			conn = JdbcUtil.getConnection();
			String sql = "SELECT * FROM test_member ORDER BY name ASC";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberVo memberVo = new MemberVo();
				memberVo.setId(rs.getString(1));
				memberVo.setPass(rs.getString(2));
				memberVo.setName(rs.getString(3));
				memberVo.setAddr(rs.getString(4));
				memberVo.setPhone(rs.getString(5));
				memberList.add(memberVo);
			}
		}
		catch (SQLException e) { e.printStackTrace(); }
		finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		return memberList;
	}*/
}
