package service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import dao.NoticeDao;
import util.OraclePageMaker;
import vo.NoticeVo;

public class NoticeService {
	public boolean noticeWrite(HttpServletRequest request) {
		NoticeVo noticeVo = new NoticeVo(request);
		System.out.println(noticeVo);
		
		NoticeDao dao = NoticeDao.getInstance();
		boolean success = dao.noticeWrite(noticeVo);
		
		return success;
	}

	public void noticeList(HttpServletRequest request) {
		NoticeDao dao = NoticeDao.getInstance();
		
		int page = 1;
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int listCount = dao.getListCount(); System.out.println("listCount : " + listCount);
		
		OraclePageMaker pageInfo = new OraclePageMaker(page, listCount);
		
		ArrayList<NoticeVo> noticeList = dao.getNoticeList(pageInfo);

		request.setAttribute("link", "notice");
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("noticeList", noticeList);
	}

	public void noticeDetail(HttpServletRequest request) {
		NoticeDao dao = NoticeDao.getInstance();
		int notice_num = Integer.parseInt(request.getParameter("notice_num"));
		
		NoticeVo noticeVo = dao.getNoticeVo(notice_num);
		request.setAttribute("notice", noticeVo);
	}

	public boolean noticeUpdate(HttpServletRequest request) {
		NoticeVo noticeVo = new NoticeVo(request);
		NoticeDao dao = NoticeDao.getInstance();
		
		boolean success = dao.noticeUpdate(noticeVo);
		return success;
	}

	public boolean noticeDelete(HttpServletRequest request) {
		NoticeDao dao = NoticeDao.getInstance();
		int notice_num = Integer.parseInt(request.getParameter("notice_num"));
		
		boolean success = dao.noticeDelete(notice_num);
		return success;
	}

	public void search(HttpServletRequest request) {
		NoticeDao dao = NoticeDao.getInstance();
		String searchName = request.getParameter("searchName");
		String searchValue = request.getParameter("searchValue");
		int page = 1;
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int listCount = dao.getSearchListCount(searchName, searchValue);
		System.out.println("listCount : " + listCount);
		
		OraclePageMaker pageInfo = new OraclePageMaker(page, listCount);
		pageInfo.setPerPage(5);
		pageInfo.setPageCount(5);
		
		ArrayList<NoticeVo> noticeList = dao.searchPage(searchName, searchValue, pageInfo);
		
		request.setAttribute("link", "noticeSearch");
		request.setAttribute("searchName", searchName);
		request.setAttribute("searchValue", searchValue);
		
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("noticeList", noticeList);
	}
}
