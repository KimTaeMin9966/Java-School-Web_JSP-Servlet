package dao;

import java.sql.*;
import java.util.ArrayList;

import util.JdbcUtil;
import vo.boardVO;

public class boardDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	int Query = 0;
	String sql = "";
	
	private static boardDAO boardDao;
	private boardDAO() {}

	public static boardDAO getInstance() {
		if (boardDao == null) { boardDao = new boardDAO(); }
		return boardDao;
	}

	public int write(boardVO bVO) {
		conn = JdbcUtil.getConnection();
		int num;
		
		try {
			sql = "SELECT MAX(board_num) FROM web_boards";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) { num = rs.getInt(1) + 1; }
			else { num = 1; }
			
			sql = "INSERT INTO web_boards VALUES(web_boards_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bVO.getBoard_name());
			pstmt.setString(2, bVO.getBoard_pass());
			pstmt.setString(3, bVO.getBoard_title());
			pstmt.setString(4, bVO.getBoard_content());
			pstmt.setString(5, bVO.getBoard_file());
			pstmt.setInt(6, num);
			pstmt.setInt(7, 0);
			pstmt.setInt(8, 0);
			pstmt.setInt(9, 0);
			Query = pstmt.executeUpdate();
		}
		catch (SQLException e) { e.printStackTrace(); }
		finally { JdbcUtil.close(rs); JdbcUtil.close(pstmt); JdbcUtil.close(conn); }
		return Query;
	}

	public ArrayList<boardVO> getBoardList(int page, int count) {
		ArrayList<boardVO> boardList = new ArrayList<>();
		
		try {
			int startRow = ((page - 1) * 10) + 1;
			int endRow = startRow + count;
			
			conn = JdbcUtil.getConnection();
			String sql = "SELECT * FROM (SELECT ROWNUM AS rnum, temp.* FROM "
					+ "(SELECT * FROM web_boards ORDER BY board_re_ref DESC, board_re_seq ASC) temp)"
					+ " WHERE rnum BETWEEN ? and ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				boardVO boardVo = new boardVO();
				boardVo.setBoard_num(rs.getInt("board_num"));
				boardVo.setBoard_name(rs.getString("board_name"));
				boardVo.setBoard_pass(rs.getString("board_pass"));
				boardVo.setBoard_title(rs.getString("board_title"));
				boardVo.setBoard_content(rs.getString("board_content"));
				boardVo.setBoard_file(rs.getString("board_file"));
				boardVo.setBoard_re_ref(rs.getInt("board_re_ref"));
				boardVo.setBoard_re_lev(rs.getInt("board_re_lev"));
				boardVo.setBoard_re_seq(rs.getInt("board_re_seq"));
				boardVo.setBoard_readcount(rs.getInt("board_readcount"));
				boardVo.setBoard_date(rs.getTimestamp("board_date"));
				boardList.add(boardVo);
			}
		}
		catch (SQLException e) { e.printStackTrace(); }
		finally { JdbcUtil.close(rs); JdbcUtil.close(pstmt); JdbcUtil.close(conn); }
		return boardList;
	}

	public int getListCount() {
		int listCount = 0;
		
		try {
			conn = JdbcUtil.getConnection();
			String sql = "SELECT COUNT(*) FROM web_boards";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) { listCount = rs.getInt(1); }
		}
		catch (SQLException e) { e.printStackTrace(); }
		finally { JdbcUtil.close(rs); JdbcUtil.close(pstmt); JdbcUtil.close(conn); }
		return listCount;
	}

	public boardVO getBoardVo(int board_num) {
		conn = JdbcUtil.getConnection();
		boardVO boardVo = new boardVO();
		
		try {
			String sql = "SELECT * FROM web_boards WHERE board_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				boardVo.setBoard_num(rs.getInt("board_num"));
				boardVo.setBoard_name(rs.getString("board_name"));
				boardVo.setBoard_pass(rs.getString("board_pass"));
				boardVo.setBoard_title(rs.getString("board_title"));
				boardVo.setBoard_content(rs.getString("board_content"));
				boardVo.setBoard_file(rs.getString("board_file"));
				boardVo.setBoard_re_ref(rs.getInt("board_re_ref"));
				boardVo.setBoard_re_lev(rs.getInt("board_re_lev"));
				boardVo.setBoard_re_seq(rs.getInt("board_re_seq"));
				boardVo.setBoard_readcount(rs.getInt("board_readcount"));
				boardVo.setBoard_date(rs.getTimestamp("board_date"));
			}
		}
		catch (SQLException e) { e.printStackTrace(); }
		finally { JdbcUtil.close(rs); JdbcUtil.close(pstmt); JdbcUtil.close(conn); }
		return boardVo;
	}

	public void updateReadCount(int board_num) {
		conn = JdbcUtil.getConnection();
		
		try {
			String sql = "UPDATE web_boards SET board_readcount = board_readcount + 1 WHERE board_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			pstmt.executeUpdate();
		}
		catch (SQLException e) { e.printStackTrace(); }
		finally { JdbcUtil.close(pstmt); JdbcUtil.close(conn); }
	}
}
