package kr.or.ddit.document.model;
/**
 * 
 * @author sanghoyun
 *
 */
public class Document_refVo {
	String referenceNumber; //참조번호
	String documentNumber; //기안문서번호
	String userId; //사원번호
	String sortation; //구분
	
	String usernm;
	
	public String getUsernm() {
		return usernm;
	}
	public void setUsernm(String usernm) {
		this.usernm = usernm;
	}
	public String getReferenceNumber() {
		return referenceNumber;
	}
	public void setReferenceNumber(String referenceNumber) {
		this.referenceNumber = referenceNumber;
	}
	public String getDocumentNumber() {
		return documentNumber;
	}
	public void setDocumentNumber(String documentNumber) {
		this.documentNumber = documentNumber;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getSortation() {
		return sortation;
	}
	public void setSortation(String sortation) {
		this.sortation = sortation;
	}
	
	@Override
	public String toString() {
		return "Document_refVo [referenceNumber=" + referenceNumber + ", documentNumber=" + documentNumber + ", userId="
				+ userId + ", sortation=" + sortation + "]";
	}
	
	

}
