package kr.or.ddit.util.model;

public class PageVo {

	private int page;
	private int pageSize;
	private String boardTypeCode;
	
	public PageVo() {
	}
	public int getPage() {
		return page == 0 ? 1 : page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPageSize() {
		return pageSize == 0 ? 10 : pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public String getBoardTypeCode() {
		return boardTypeCode;
	}
	public void setBoardTypeCode(String boardTypeCode) {
		this.boardTypeCode = boardTypeCode;
	}
	
	@Override
	public String toString() {
		return "PageVo [page=" + page + ", pageSize=" + pageSize + ", boardTypeCode=" + boardTypeCode + "]";
	}
	public PageVo(String boardTypeCode) {
		this.boardTypeCode = boardTypeCode;
	}
}