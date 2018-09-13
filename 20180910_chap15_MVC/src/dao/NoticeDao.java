package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.JdbcUtil;
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
}
