package kr.or.ddit.document.model;

import java.util.Date;

/**
 * 
 * @author sanghoyun
 *
 */
public class DocumentVo {
	
	String documentNumber;  //기안문서번호
	String title; 			//제목
	String preservation;	 //보존년한
	Date presentDate; 		//기안일자
	String contents; 		//내용
	String tempSortation; //임시구문     
 	String completeSortation;//완료구분 --
	String presentUser;		//기안자
	String presentDepartment;	//기안부서
	String documentType; //기안문서 종류 
	
	String userId;
	String startDate;
	String endDate;
	
	public String getDocumentNumber() {
		return documentNumber;
	}
	public void setDocumentNumber(String documentNumber) {
		this.documentNumber = documentNumber;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPreservation() {
		return preservation;
	}
	public void setPreservation(String preservation) {
		this.preservation = preservation;
	}
	public Date getPresentDate() {
		return presentDate;
	}
	public void setPresentDate(Date presentDate) {
		this.presentDate = presentDate;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getTempSortation() {
		return tempSortation;
	}
	public void setTempSortation(String tempSortation) {
		this.tempSortation = tempSortation;
	}
	public String getCompleteSortation() {
		return completeSortation;
	}
	public void setCompleteSortation(String completeSortation) {
		this.completeSortation = completeSortation;
	}
	public String getPresentUser() {
		return presentUser;
	}
	public void setPresentUser(String presentUser) {
		this.presentUser = presentUser;
	}
	public String getPresentDepartment() {
		return presentDepartment;
	}
	public void setPresentDepartment(String presentDepartment) {
		this.presentDepartment = presentDepartment;
	}
	public String getDocumentType() {
		return documentType;
	}
	public void setDocumentType(String documentType) {
		this.documentType = documentType;
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
		return "DocumentVo [documentNumber=" + documentNumber + ", title=" + title + ", preservation=" + preservation
				+ ", presentDate=" + presentDate + ", contents=" + contents + ", tempSortation=" + tempSortation
				+ ", completeSortation=" + completeSortation + ", presentUser=" + presentUser + ", presentDepartment="
				+ presentDepartment + ", documentType=" + documentType + ", userId=" + userId + ", startDate="
				+ startDate + ", endDate=" + endDate + "]";
	}
	
	 
	
}
