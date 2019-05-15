package kr.or.ddit.payment.model;
/**
 * 
 * @author sanghoyun
 *
 */
public class Payment_reportVo {
	
	String paymentReportCode;
	String account;
	String payCode;
	String paymentdate;
	String deadline;
	
	public String getPaymentdate() {
		return paymentdate;
	}
	public void setPaymentdate(String paymentdate) {
		this.paymentdate = paymentdate;
	}
	public String getDeadline() {
		return deadline;
	}
	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}
	public String getPaymentReportCode() {
		return paymentReportCode;
	}
	public void setPaymentReportCode(String paymentReportCode) {
		this.paymentReportCode = paymentReportCode;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPayCode() {
		return payCode;
	}
	public void setPayCode(String payCode) {
		this.payCode = payCode;
	}
	public Payment_reportVo() {
	}
	public Payment_reportVo(String payCode, String paymentdate) {
		this.payCode = payCode;
		this.paymentdate = paymentdate;
	}

}
