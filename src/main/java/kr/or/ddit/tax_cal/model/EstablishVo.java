package kr.or.ddit.tax_cal.model;
/**
 * 
 * @author sanghoyun
 *
 */
public class EstablishVo {
	
	String establishCode;
	String establishNameKor;
	String establishNameEng;
	String status;
	String slipstatus;
	String clientStatus;
	String useStatus;
	
	public String getEstablishCode() {
		return establishCode;
	}
	public void setEstablishCode(String establishCode) {
		this.establishCode = establishCode;
	}
	public String getEstablishNameKor() {
		return establishNameKor;
	}
	public void setEstablishNameKor(String establishNameKor) {
		this.establishNameKor = establishNameKor;
	}
	public String getEstablishNameEng() {
		return establishNameEng;
	}
	public void setEstablishNameEng(String establishNameEng) {
		this.establishNameEng = establishNameEng;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getSlipstatus() {
		return slipstatus;
	}
	public void setSlipstatus(String slipstatus) {
		this.slipstatus = slipstatus;
	}
	public String getClientStatus() {
		return clientStatus;
	}
	public void setClientStatus(String clientStatus) {
		this.clientStatus = clientStatus;
	}
	public String getUseStatus() {
		return useStatus;
	}
	public void setUseStatus(String userStatus) {
		this.useStatus = userStatus;
	}
	
	

}
