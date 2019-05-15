package kr.or.ddit.payment.model;
/**
 * 
 * @author sanghoyun
 *
 */
public class Payment_detailVo {
	
	String deductCode;
	String payCode;
	String deductPay;
	String deprostatus;
	String deptcode;
	String deptname;
	
	public String getDeptcode() {
		return deptcode;
	}
	public void setDeptcode(String deptcode) {
		this.deptcode = deptcode;
	}
	public String getDeptname() {
		return deptname;
	}
	public void setDeptname(String deptname) {
		this.deptname = deptname;
	}
	public String getDeprostatus() {
		return deprostatus;
	}
	public void setDeprostatus(String deprostatus) {
		this.deprostatus = deprostatus;
	}
	public Payment_detailVo() {
	}
	public String getDeductCode() {
		return deductCode;
	}
	public void setDeductCode(String deductCode) {
		this.deductCode = deductCode;
	}
	public String getPayCode() {
		return payCode;
	}
	public void setPayCode(String payCode) {
		this.payCode = payCode;
	}
	public String getDeductPay() {
		return deductPay;
	}
	public void setDeductPay(String deductPay) {
		this.deductPay = deductPay;
	}
	public Payment_detailVo(String deductCode, String payCode, String deductPay) {
		this.deductCode = deductCode;
		this.payCode = payCode;
		this.deductPay = deductPay;
	}
	public Payment_detailVo(String deductCode, String payCode) {
		this.deductCode = deductCode;
		this.payCode = payCode;
	}
	public Payment_detailVo(String deductCode, String payCode, String deductPay, String deprostatus) {
		this.deductCode = deductCode;
		this.payCode = payCode;
		this.deductPay = deductPay;
		this.deprostatus = deprostatus;
	}
	
	

}
