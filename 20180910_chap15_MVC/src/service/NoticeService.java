package service;

import javax.servlet.http.HttpServletRequest;

import dao.NoticeDao;
import vo.NoticeVo;

public class NoticeService {
	public boolean noticeWrite(HttpServletRequest request) {
		NoticeVo noticeVo = new NoticeVo(request);
		System.out.println(noticeVo);
		
		NoticeDao dao = NoticeDao.getInstance();
		boolean success = dao.noticeWrite(noticeVo);
		
		return success;
	}
	
	
}
