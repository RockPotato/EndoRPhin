package kr.or.ddit.board.model;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.util.model.PageVo;

/**
 * 
 * @author sanghoyun
 *
 */
public class Board_detailVo extends PageVo{	//게시글
	
	String boardNo;				//게시글 번호
	String title;				//제목
	String contents;			//내용
	String postDate;			//작성일시
	String boardTypeCode;		//게시판 분류 코드
	String userId;				//작성자
	String views;				//조회수
	String filecnt;				//첨부파일
	
	public String getFilecnt() {
		return filecnt;
	}
	public void setFilecnt(String filecnt) {
		this.filecnt = filecnt;
	}
	String startDate;
	public String getViews() {
		return views;
	}
	public void setViews(String views) {
		this.views = views;
	}
	String endDate;
	
	public String getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(String boardNo) {
		this.boardNo = boardNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getPostDate() {
		return postDate;
	}
	public void setPostDate(String postDate) {
		this.postDate = postDate;
	}
	public String getBoardTypeCode() {
		return boardTypeCode;
	}
	public void setBoardTypeCode(String boardTypeCode) {
		this.boardTypeCode = boardTypeCode;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	
	@Override
	public String toString() {
		return "Board_detailVo [boardNo=" + boardNo + ", title=" + title + ", contents=" + contents + ", postDate="
				+ postDate + ", boardTypeCode=" + boardTypeCode + ", userId=" + userId + ", views=" + views
				+ ", filecnt=" + filecnt + ", startDate=" + startDate + ", endDate=" + endDate + "]";
	}
}
