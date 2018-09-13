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
		
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("noticeList", noticeList);
		
	}
}
