package service;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.BoardDao;
import vo.BoardVo;
import vo.PageInfo;

public class BoardService {
	public void regArticle(HttpServletRequest request) throws IOException {
		System.out.println("글작성 요청");
		
		String saveDir = "/boardUpload";
		ServletContext context = request.getServletContext();
		String realPath = context.getRealPath(saveDir);
		System.out.println(realPath);
		
		BoardVo boardVo = new BoardVo();
		MultipartRequest multi = new MultipartRequest(request, realPath, 10*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
		String board_name = multi.getParameter("board_name");
		String board_pass = multi.getParameter("board_pass");
		String board_title = multi.getParameter("board_title");
		String board_content = multi.getParameter("board_content");
		String board_file = multi.getOriginalFileName((String)multi.getFileNames().nextElement());
		
		boardVo.setBoard_name(board_name);
		boardVo.setBoard_pass(board_pass);
		boardVo.setBoard_title(board_title);
		boardVo.setBoard_content(board_content);
		boardVo.setBoard_file(board_file);
		
		BoardDao bd = BoardDao.getInstance();
		bd.insertBoard(boardVo);
	}
	
	// 게시물 목록
	public void boardList(HttpServletRequest request) {
		int page = 1;
		int count = 9;
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		BoardDao bd = BoardDao.getInstance();
		ArrayList<BoardVo> boardList = bd.getBoardList(page, count);
		request.setAttribute("boardList", boardList);
		
		int listCount = bd.getListCount();
		int maxPage = (listCount - 1) / 10 + 1;
		int startPage = (page - 1) / 10 * 10 + 1;
		int endPage = startPage + 9;
		
		if(endPage > maxPage) { endPage = maxPage; }
		
		PageInfo pageInfo = new PageInfo();
		pageInfo.setPage(page);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);
		request.setAttribute("pageInfo", pageInfo);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(new Date());
		request.setAttribute("today", today);
	}
	
	// 게시물 상세보기
	public void boardDetail(HttpServletRequest request) {
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		BoardVo boardVo = new BoardVo();
		
		BoardDao bd = BoardDao.getInstance();
		boardVo = bd.getBoardVo(board_num);
		
		bd.updateReadCount(board_num);
		
		request.setAttribute("boardVo", boardVo);
	}
	
	// 답변 작성창 데이터
	public void boardreply(HttpServletRequest request) {
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		BoardDao bd = BoardDao.getInstance();
		
		BoardVo boardVo = bd.getBoardVo(board_num);
		
		request.setAttribute("boardVo", boardVo);
	}

	// 답변글 작성
	public void boardReplySubmit(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		String board_name = request.getParameter("board_name");
		String board_pass = request.getParameter("board_pass");
		String board_title = request.getParameter("board_title");
		String board_content = request.getParameter("board_content");
		int board_re_ref = Integer.parseInt(request.getParameter("board_re_ref"));
		int board_re_lev = Integer.parseInt(request.getParameter("board_re_lev"));
		int board_re_seq = Integer.parseInt(request.getParameter("board_re_seq"));
		
		BoardVo boardVo = new BoardVo(); 

		boardVo.setBoard_num(board_num);
		boardVo.setBoard_name(board_name);
		boardVo.setBoard_pass(board_pass);
		boardVo.setBoard_title(board_title);
		boardVo.setBoard_content(board_content);
		boardVo.setBoard_re_ref(board_re_ref);
		boardVo.setBoard_re_lev(board_re_lev);
		boardVo.setBoard_re_seq(board_re_seq);
		
		BoardDao bd = BoardDao.getInstance();
		bd.boardReplySubmit(boardVo);
		
		response.sendRedirect(request.getContextPath() + "/boardList.bo");
	}
	
	// 게시물 정보 수정 화면
	public void boardUpdate(HttpServletRequest request) {
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		
		BoardDao bd = BoardDao.getInstance();
		BoardVo boardVo = bd.getBoardVo(board_num);
		
		request.setAttribute("boardVo", boardVo);
	}

	// 게시물 정보 수정
	public void boardUpdateSubmit(HttpServletRequest request, HttpServletResponse response) {
		String saveDir = "/boardUpload";
		ServletContext context = request.getServletContext();
		String realPath = context.getRealPath(saveDir);
		
		try {
			MultipartRequest multi = new MultipartRequest(request, realPath, 10*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
			int board_num = Integer.parseInt(multi.getParameter("board_num"));
			String board_name = multi.getParameter("board_name");
			String board_pass = multi.getParameter("board_pass");
			String board_title = multi.getParameter("board_title");
			String board_content = multi.getParameter("board_content");
			String board_file = multi.getOriginalFileName((String)multi.getFileNames().nextElement());

			BoardVo boardVo = new BoardVo();
			boardVo.setBoard_num(board_num);
			boardVo.setBoard_name(board_name);
			boardVo.setBoard_pass(board_pass);
			boardVo.setBoard_title(board_title);
			boardVo.setBoard_content(board_content);
			boardVo.setBoard_file(board_file);
			
			BoardDao bd = BoardDao.getInstance();
			bd.boardUpdateSubmit(boardVo);
			
			response.sendRedirect(request.getContextPath() + "/boardDetail.bo?board_num=" + board_num);
		} catch (IOException e) { e.printStackTrace(); }
	}

	// 삭제 처리
	public void boardDeleteSubmit(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String board_num = request.getParameter("board_num");
		String board_pass = request.getParameter("board_pass");
		System.out.println("board_num : " + board_num);
		System.out.println("board_pass : " + board_pass);
		
		BoardVo boardVo = new BoardVo();
		boardVo.setBoard_num(Integer.parseInt(board_num));
		boardVo.setBoard_pass(board_pass);
		
		BoardDao bd = BoardDao.getInstance();
		boolean success = bd.boardDeleteSubmit(boardVo);
		
		if(success) {
			response.sendRedirect(request.getContextPath() + "/boardList.bo");
		} else {
			response.sendRedirect(request.getContextPath() + "/boardDeleteForm.bo?board_num="
								+ boardVo.getBoard_num());
		}
	}

	public void boardSample() {
		BoardDao bd = BoardDao.getInstance();
		for (int i = 0; i < 100; i++) {
			BoardVo boardVo = new BoardVo();
			boardVo.setBoard_name("test" + i);
			boardVo.setBoard_pass("12345");
			boardVo.setBoard_title("title" + i);
			boardVo.setBoard_content("content" + i);
			bd.insertBoard(boardVo);
		}
	}

	public void fileDown(HttpServletRequest request, HttpServletResponse response, ServletContext context) {
		try {
			String file_name = request.getParameter("board_file");
			String downLoadPath = context.getRealPath("boardUpload");
			
			String filePath = downLoadPath + "\\" + file_name;
			
			String mimeType = context.getMimeType(filePath);
			
			if(mimeType == null) { mimeType = "application/octet-stream"; }
			response.setContentType(mimeType);
			
			String agent = request.getHeader("User-Agent");
			boolean isbrowser = (agent.indexOf("MSIE") > -1 || agent.indexOf("Trident") > -1);
			
			if(isbrowser) { file_name = URLEncoder.encode(file_name, "UTF-8").replaceAll("\\", "%20"); }
			else { file_name = new String(file_name.getBytes("UTF-8"), "ISO-8859-1"); }
			
			response.setHeader("Content-Disposition", "attachment; filename=" + file_name);
			ServletOutputStream out2 = response.getOutputStream();
			
			int numRead;
			byte[] bytes = new byte[4096];
			FileInputStream fi = new FileInputStream(filePath);
			
			while ((numRead = fi.read(bytes, 0, bytes.length)) != -1) { out2.write(bytes, 0, numRead); }
			out2.flush();
			out2.close();
			fi.close();
		}
		catch (UnsupportedEncodingException e) { e.printStackTrace(); } 
		catch (IOException e) { e.printStackTrace(); }
	}
}
