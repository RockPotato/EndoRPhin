package kr.or.ddit.employee.model;

import java.util.Date;

/**
 * 
 * @author sanghoyun
 *
 */

public class AnnualsalaryVo {
	
	String annual_salaryCode;
	String userId;
	String annual_salaryPrice;
	Date year;
	
	
	public String getAnnual_salaryCode() {
		return annual_salaryCode;
	}
	public void setAnnual_salaryCode(String annual_salaryCode) {
		this.annual_salaryCode = annual_salaryCode;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getAnnual_salaryPrice() {
		return annual_salaryPrice;
	}
	public void setAnnual_salaryPrice(String annual_salaryPrice) {
		this.annual_salaryPrice = annual_salaryPrice;
	}
	public Date getYear() {
		return year;
	}
	public void setYear(Date year) {
		this.year = year;
	}
	
	

}
