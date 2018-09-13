package vo;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

public class NoticeVo {
	int notice_num;
	String notice_category;
	String notice_author;
	String notice_title;
	String notice_content;
	Date notice_date;
	
	public NoticeVo() {}
	public NoticeVo(HttpServletRequest request) {
		if(request.getParameter("notice_num") != null) {
			this.notice_num = Integer.parseInt(request.getParameter("notice_num"));
		}
		if(request.getParameter("notice_category") != null) {
			this.notice_category = request.getParameter("notice_category");
		}
		if(request.getParameter("notice_author") != null) {
			this.notice_author = request.getParameter("notice_author");
		}
		if(request.getParameter("notice_title") != null) {
			this.notice_title = request.getParameter("notice_title");
		}
		if(request.getParameter("notice_content") != null) {
			this.notice_content = request.getParameter("notice_content");
		}
	}
	public int getNotice_num() { return notice_num; }
	public void setNotice_num(int notice_num) { this.notice_num = notice_num; }
	public String getNotice_category() { return notice_category; }
	public void setNotice_category(String notice_category) { this.notice_category = notice_category; }
	public String getNotice_author() { return notice_author; }
	public void setNotice_author(String notice_author) { this.notice_author = notice_author; }
	public String getNotice_title() { return notice_title; }
	public void setNotice_title(String notice_title) { this.notice_title = notice_title; }
	public String getNotice_content() { return notice_content; }
	public void setNotice_content(String notice_content) { this.notice_content = notice_content; }
	public Date getNotice_date() { return notice_date; }
	public void setNotice_date(Date notice_date) { this.notice_date = notice_date; }
	
	@Override
	public String toString() {
		return "{ [ notice_num : " + this.notice_num
				+ "]\r\n[ notice_category : " + this.notice_category
				+ "]\r\n[ notice_author : " + this.notice_author
				+ "]\r\n[ notice_title : " + this.notice_title
				+ "]\r\n[ notice_content : " + this.notice_content
				+ "] }";
	}
}
