package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.NoticeService;

@WebServlet("*.do")
public class NoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	NoticeService ns = new NoticeService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String requestUri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestUri.substring(contextPath.length());
		System.out.println(command);
		
		String nextPage = null;
		
		boolean success = false;
		
		String suc = "/board/notice/notice_success.jsp";
		String fail = "/board/notice/notice_fail.jsp";
		
		if(command.equals("/notice.do")) { // OK
			System.out.println("공지사항 리스트 요청");
			ns.noticeList(request);
			
			nextPage = "/board/notice/notice_list.jsp";
		} else if(command.equals("/noticeWriteForm.do")) { // OK
			System.out.println("공지사항 작성창 요청");
			nextPage = "/board/notice/notice_write.jsp";
		} else if(command.equals("/noticeWrite.do")) { // OK
			System.out.println("공지사항 작성 요청");
			
			success = ns.noticeWrite(request);
			
			if(success) { nextPage = suc; }
			else { nextPage = fail; }
		} else if(command.equals("/noticeDetail.do")) { // OK
			System.out.println("공지사항 상세보기 요청");
			ns.noticeDetail(request);
			
			nextPage = "/board/notice/notice_detail.jsp";
			
		} else if(command.equals("/noticeUpdateForm.do")) { // OK
			System.out.println("공지사항 수정창 요청");
			ns.noticeDetail(request);
			
			nextPage = "/board/notice/notice_update.jsp";
			
		} else if(command.equals("/noticeUpdate.do")) { // OK
			System.out.println("공지사항 수정 요청");
			success = ns.noticeUpdate(request);
			
			if(success) { nextPage = suc; }
			else { nextPage = fail; }
		} else if(command.equals("/noticeDelete.do")) { // OK
			System.out.println("공지사항 삭제 요청");
			success = ns.noticeDelete(request);
			
			if(success) { nextPage = suc; }
			else { nextPage = fail; }
		} else if(command.equals("/noticeSearch.do")) {
			// 2018/09/13일 오늘 JSP과정이 마무리되고 내일은 스프링과정으로 넘어간다.
			// 마지막 작성입니다. 이프로젝트에서 클라이맥스입니다.
			System.out.println("공지사항 검색 요청");
			ns.search(request);
			
			nextPage = "/board/notice/notice_list.jsp";
		}
		
		if (nextPage != null) {
			RequestDispatcher rd = request.getRequestDispatcher(nextPage);
			rd.forward(request, response);
		}
	}
	
}
