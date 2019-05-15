package kr.or.ddit.board.model;
/**
 * 
 * @author sanghoyun
 *
 */
public class Board_TypeVo {	//게시판 분류
	
	String boardTypeCode;	//게시판 분류 코드
	String boardTypeName;	//게시판 이름
	String useStatus;		//사용 구분
	
	
	public String getBoardTypeCode() {
		return boardTypeCode;
	}
	public void setBoardTypeCode(String boardTypeCode) {
		this.boardTypeCode = boardTypeCode;
	}
	public String getBoardTypeName() {
		return boardTypeName;
	}
	public void setBoardTypeName(String boardTypeName) {
		this.boardTypeName = boardTypeName;
	}
	public String getUseStatus() {
		return useStatus;
	}
	public void setUseStatus(String useStatus) {
		this.useStatus = useStatus;
	}
	@Override
	public String toString() {
		return "Board_TypeVo [boardTypeCode=" + boardTypeCode + ", boardTypeName=" + boardTypeName + ", useStatus="
				+ useStatus + "]";
	}
	
	
	
	
	

	
}
