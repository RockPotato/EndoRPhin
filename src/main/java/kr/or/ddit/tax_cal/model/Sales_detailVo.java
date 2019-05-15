package kr.or.ddit.tax_cal.model;

/**
 * 
 * @author sanghoyun
 *
 */

public class Sales_detailVo {
	
	String salesDetailCode;  // 매입매출상세번호
	String status;  // 차대변구분
	String price;   //금액
	String establishCode; //계정과목코드
	String salesCode; //매입매출코드
	String jukyo; //적요
	
	
	public String getSalesDetailCode() {
		return salesDetailCode;
	}
	public void setSalesDetailCode(String salesDetailCode) {
		this.salesDetailCode = salesDetailCode;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getEstablishCode() {
		return establishCode;
	}
	public void setEstablishCode(String establishCode) {
		this.establishCode = establishCode;
	}
	public String getSalesCode() {
		return salesCode;
	}
	public void setSalesCode(String salesCode) {
		this.salesCode = salesCode;
	}
	public String getJukyo() {
		return jukyo;
	}
	public void setJukyo(String jukyo) {
		this.jukyo = jukyo;
	}
	public Sales_detailVo(String status, String price, String establishCode, String salesCode, String jukyo) {
		this.status = status;
		this.price = price;
		this.establishCode = establishCode;
		this.salesCode = salesCode;
		this.jukyo = jukyo;
	}
	public Sales_detailVo() {
	}
	
	

}
