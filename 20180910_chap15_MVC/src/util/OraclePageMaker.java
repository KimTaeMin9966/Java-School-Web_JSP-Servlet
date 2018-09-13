package util;

public class OraclePageMaker {
	private	int page;				// 현제 페이지
	private int perPage = 5;		// 한번에 보여줄 게시글 수
	private int pageCount = 5;		// 한번에 보여줄 페이지 수
	private int maxPage;			// 전체 페이지 수
	private int startPage;			// 페이지 블럭의 시작 페이지
	private int endPage;			// 페이지 블럭의 끝 페이지
	private int listCount;			// 전체 게시물의 수
	private int startRow;			// DB 시작 ROWNUM
	private int endRow;				// DB 끝 ROWNUM
	
	public OraclePageMaker() {}
	public OraclePageMaker(int page, int listCount) {
		this.page = page;
		this.listCount = listCount;
		criteria();
	}
	
	public void criteria() {
		setStartPage();
		setMaxPage();
		setEndPage();
	}
	
	public int getPage() { return page; }
	public void setPage(int page) { this.page = page; }
	public int getPerPage() { return perPage; }
	public void setPerPage(int perPage) { this.perPage = perPage; criteria(); }
	public int getPageCount() { return pageCount; }
	public void setPageCount(int pageCount) { this.pageCount = pageCount; criteria(); }
	public int getMaxPage() { return maxPage; }
	
	public void setMaxPage() {
		int maxPage = listCount / this.perPage;
		if(listCount % this.perPage != 0) { maxPage++; }
		this.maxPage = maxPage;
	}
	
	public int getStartPage() { return startPage; }
	
	public void setStartPage() {
		this.startPage = (page - 1) / this.pageCount * this.pageCount + 1;
	}
	
	public int getEndPage() { return endPage; }
	
	public void setEndPage() {
		int endPage = (page - 1) / pageCount * pageCount + this.pageCount;
		if(endPage > maxPage) { endPage = maxPage; }
		this.endPage = endPage;
	}
	
	public int getListCount() { return listCount; }
	public void setListCount(int listCount) { this.listCount = listCount; }
	
	public int getStartRow() {
		return (page * perPage) - (perPage - 1);
	}
	
	public void setStartRow(int startRow) { this.startRow = startRow; }
	
	public int getEndRow() {
		return (page * perPage);
	}
	
	public void setEndRow(int endRow) { this.endRow = endRow; }
}