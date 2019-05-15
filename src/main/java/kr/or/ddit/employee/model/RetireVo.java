package kr.or.ddit.employee.model;

import java.util.Date;

/**
 * 
 * @author sanghoyun
 *
 */
public class RetireVo {
	
	String userId;
	String retireReason;
	String retireSortation;
	Date retireDate;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getRetireReason() {
		return retireReason;
	}
	public void setRetireReason(String retireReason) {
		this.retireReason = retireReason;
	}
	public String getRetireSortation() {
		return retireSortation;
	}
	public void setRetireSortation(String retireSortation) {
		this.retireSortation = retireSortation;
	}
	public Date getRetireDate() {
		return retireDate;
	}
	public void setRetireDate(Date retireDate) {
		this.retireDate = retireDate;
	}
	
	

}
