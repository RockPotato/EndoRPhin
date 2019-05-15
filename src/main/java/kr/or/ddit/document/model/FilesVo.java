package kr.or.ddit.document.model;
/**
 * 
 * @author sanghoyun
 *
 */
public class FilesVo {

	String filecode; //첨부파일 코드
	String filename;  //첨부파일 이름
	String realFilecode; //실제경로
	String realFilename; //실제 첨부파일
	String documentNumber; //문서번호
	
	public String getFilecode() {
		return filecode;
	}
	public void setFilecode(String filecode) {
		this.filecode = filecode;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getRealFilecode() {
		return realFilecode;
	}
	public void setRealFilecode(String realFilecode) {
		this.realFilecode = realFilecode;
	}
	public String getRealFilename() {
		return realFilename;
	}
	public void setRealFilename(String realFilename) {
		this.realFilename = realFilename;
	}
	public String getDocumentNumber() {
		return documentNumber;
	}
	public void setDocumentNumber(String documentNumber) {
		this.documentNumber = documentNumber;
	}
	
	
	
}
