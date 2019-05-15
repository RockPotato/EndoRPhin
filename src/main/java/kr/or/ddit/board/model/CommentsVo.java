package kr.or.ddit.board.model;

import java.util.Date;

/**
 * 
 * @author sanghoyun
 *
 */
public class CommentsVo {		//댓글

	String commentNo;			//댓글 번호
	String commentTitle;		//제목 
	String commentContents;		//내용
	String boardNo;				//게시글 번호
	Date commentDate;			//작성 일시
	String commentUser;			//작성자
	
	public String getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(String commentNo) {
		this.commentNo = commentNo;
	}
	public String getCommentTitle() {
		return commentTitle;
	}
	public void setCommentTitle(String commentTitle) {
		this.commentTitle = commentTitle;
	}
	public String getCommentContents() {
		return commentContents;
	}
	public void setCommentContents(String commentContents) {
		this.commentContents = commentContents;
	}
	public String getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(String boardNo) {
		this.boardNo = boardNo;
	}
	public Date getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}
	public String getCommentUser() {
		return commentUser;
	}
	public void setCommentUser(String commentUser) {
		this.commentUser = commentUser;
	}
	@Override
	public String toString() {
		return "CommentsVo [commentNo=" + commentNo + ", commentTitle=" + commentTitle + ", commentContents="
				+ commentContents + ", boardNo=" + boardNo + ", commentDate=" + commentDate + ", commentUser="
				+ commentUser + "]";
	}
	
	
}
