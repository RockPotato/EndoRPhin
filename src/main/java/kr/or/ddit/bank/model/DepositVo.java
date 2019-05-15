package kr.or.ddit.bank.model;

import java.util.Date;

/**
 * 
 * @author sanghoyun
 *
 */
public class DepositVo {
	
	String depositCode;
	String comAccount;
	String departmentCode;
	Date depositDate;
	String depositPrice;
	String companyCard;
	
	public String getDepositCode() {
		return depositCode;
	}
	public void setDepositCode(String depositCode) {
		this.depositCode = depositCode;
	}
	public String getComAccount() {
		return comAccount;
	}
	public void setComAccount(String comAccount) {
		this.comAccount = comAccount;
	}
	public String getDepartmentCode() {
		return departmentCode;
	}
	public void setDepartmentCode(String departmentCode) {
		this.departmentCode = departmentCode;
	}
	public Date getDepositDate() {
		return depositDate;
	}
	public void setDepositDate(Date depositDate) {
		this.depositDate = depositDate;
	}
	public String getDepositPrice() {
		return depositPrice;
	}
	public void setDepositPrice(String depositPrice) {
		this.depositPrice = depositPrice;
	}
	public String getCompanyCard() {
		return companyCard;
	}
	public void setCompanyCard(String companyCard) {
		this.companyCard = companyCard;
	}
	
	

}
