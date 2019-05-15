package kr.or.ddit.payment.model;

public class Payment4SlipVo {
	String paydayMonth;
	String[] establishSelect;
	String[] deptName;
	String[] payCode;
	String[] divList;
	String[] totalSalary;
	
	public String[] getEstablishSelect() {
		return establishSelect;
	}
	public void setEstablishSelect(String[] establishSelect) {
		this.establishSelect = establishSelect;
	}
	public String[] getTotalSalary() {
		return totalSalary;
	}
	public void setTotalSalary(String[] totalSalary) {
		this.totalSalary = totalSalary;
	}
	public String[] getDivList() {
		return divList;
	}
	public void setDivList(String[] divList) {
		this.divList = divList;
	}
	public String getPaydayMonth() {
		return paydayMonth;
	}
	public void setPaydayMonth(String paydayMonth) {
		this.paydayMonth = paydayMonth;
	}
	public String[] getDeptName() {
		return deptName;
	}
	public void setDeptName(String[] deptName) {
		this.deptName = deptName;
	}
	public String[] getPayCode() {
		return payCode;
	}
	public void setPayCode(String[] payCode) {
		this.payCode = payCode;
	}
}
