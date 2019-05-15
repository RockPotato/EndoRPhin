package kr.or.ddit.util.model;

public class SumChanceVo {
	
	String establishCode;
	String establishName;
	String debit;
	String credit;
	String OperatorValue;
	
	
	public String getOperatorValue() {
		return OperatorValue;
	}
	public void setOperatorValue(String operatorValue) {
		OperatorValue = operatorValue;
	}
	public String getEstablishCode() {
		return establishCode;
	}
	public void setEstablishCode(String establishCode) {
		this.establishCode = establishCode;
	}
	public String getEstablishName() {
		return establishName;
	}
	public void setEstablishName(String establishName) {
		this.establishName = establishName;
	}
	public String getDebit() {
		return debit;
	}
	public void setDebit(String debit) {
		this.debit = debit;
	}
	public String getCredit() {
		return credit;
	}
	public void setCredit(String credit) {
		this.credit = credit;
	}
	
	

}
