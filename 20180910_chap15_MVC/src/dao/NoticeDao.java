package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.JdbcUtil;
import util.OraclePageMaker;
import vo.NoticeVo;

public class NoticeDao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	private static NoticeDao noticeDao;
	private NoticeDao() {}

	public static NoticeDao getInstance() {
		if (noticeDao == null) { noticeDao = new NoticeDao(); }
		return noticeDao;
	}

	public boolean noticeWrite(NoticeVo noticeVo) {
		conn = JdbcUtil.getConnection();
		boolean success = false;
		String sql = "";
		
		try {
			sql = "INSERT INTO notice_board VALUES(notice_board_seq.nextval, ?, ?, ?, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, noticeVo.getNotice_category());
			pstmt.setString(2, noticeVo.getNotice_author());
			pstmt.setString(3, noticeVo.getNotice_title());
			pstmt.setString(4, noticeVo.getNotice_content());
			int result = pstmt.executeUpdate();
			
			if(result != 0) { success = true; }
		}
		catch (SQLException e) { e.printStackTrace(); }
		finally { JdbcUtil.close(pstmt); JdbcUtil.close(conn); }
		return success;
	}

	// 게시물 전체 개수 를 반환
	public int getListCount() {
		conn = JdbcUtil.getConnection();
		String sql = "";

		int listCount = 0;
		
		try {
			sql = "SELECT COUNT(*) FROM notice_board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) { listCount = rs.getInt(1); }
		}
		catch (SQLException e) { e.printStackTrace(); }
		finally { JdbcUtil.close(rs); JdbcUtil.close(pstmt); JdbcUtil.close(conn); }
		return listCount;
	}
	
	// 페이징 처리가 된 공지사항 리스트 반환
	public ArrayList<NoticeVo> getNoticeList(OraclePageMaker pageInfo) {
		ArrayList<NoticeVo> noticeList = new ArrayList<>();
		int startRow = pageInfo.getStartRow();		
		int endRow = pageInfo.getEndRow();
		
		conn = JdbcUtil.getConnection();
		String sql = "";
		
		try {
			sql = "SELECT * FROM "
					+ "(SELECT ROWNUM AS r, A.* FROM "
					+ "(SELECT ROWNUM AS rnum, TEMP.* FROM "
					+ "(SELECT * FROM notice_board ORDER BY notice_num) TEMP "
					+ "ORDER BY rnum DESC) "
					+ "A) WHERE r BETWEEN ? AND ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				NoticeVo noticeVo = new NoticeVo();
				noticeVo.setRnum(rs.getInt("rnum"));
				noticeVo.setNotice_num(rs.getInt("notice_num"));
				noticeVo.setNotice_category(rs.getString("notice_category"));
				noticeVo.setNotice_author(rs.getString("notice_author"));
				noticeVo.setNotice_title(rs.getString("notice_title"));
				noticeVo.setNotice_content(rs.getString("notice_content"));
				noticeVo.setNotice_date(rs.getTimestamp("notice_date"));
				noticeList.add(noticeVo);
			}
		}
		catch (SQLException e) { e.printStackTrace(); }
		finally { JdbcUtil.close(rs); JdbcUtil.close(pstmt); JdbcUtil.close(conn); }
		return noticeList;
	}
}
