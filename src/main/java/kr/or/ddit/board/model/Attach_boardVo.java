package kr.or.ddit.board.model;
/**
 * 
 * @author sanghoyun
 *
 */
public class Attach_boardVo {	//게시글 첨부 파일
	
	String attachCode;			//첨부파일 코드
	String attachName;			//첨부파일 이름
	String attachRealpath;		//실제경로 
	String attachRealname;		//실제 첨부파일
	String boardNo;				//게시글 번호
	
	
	public String getAttachCode() {
		return attachCode;
	}
	public void setAttachCode(String attachCode) {
		this.attachCode = attachCode;
	}
	public String getAttachName() {
		return attachName;
	}
	public void setAttachName(String attachName) {
		this.attachName = attachName;
	}
	public String getAttachRealpath() {
		return attachRealpath;
	}
	public void setAttachRealpath(String attachRealpath) {
		this.attachRealpath = attachRealpath;
	}
	public String getAttachRealname() {
		return attachRealname;
	}
	public void setAttachRealname(String attachRealname) {
		this.attachRealname = attachRealname;
	}
	public String getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(String boardNo) {
		this.boardNo = boardNo;
	}
	@Override
	public String toString() {
		return "Attach_boardVo [attachCode=" + attachCode + ", attachName=" + attachName + ", attachRealpath="
				+ attachRealpath + ", attachRealname=" + attachRealname + ", boardNo=" + boardNo + "]";
	}
	
	

}
