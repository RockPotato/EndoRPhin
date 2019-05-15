package kr.or.ddit.slip.model;
/**
 * 
 * @author sanghoyun
 *
 */
public class Slip_detailVo {
	
	String slipDetailNo; // 전표 상세번호
	String status; //차대변 구분
	String price; // 금액
	String clientCard; //거래처/계좌/카드
	String slipNumber; //전표번호
	String establishCode; //계정과목코드
	
	public String getSlipDetailNo() {
		return slipDetailNo;
	}
	public void setSlipDetailNo(String slipDetailNo) {
		this.slipDetailNo = slipDetailNo;
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
	public String getClientCard() {
		return clientCard;
	}
	public void setClientCard(String clientCard) {
		this.clientCard = clientCard;
	}
	public String getSlipNumber() {
		return slipNumber;
	}
	public void setSlipNumber(String slipNumber) {
		this.slipNumber = slipNumber;
	}
	public String getEstablishCode() {
		return establishCode;
	}
	public void setEstablishCode(String establishCode) {
		this.establishCode = establishCode;
	}
	public Slip_detailVo() {
	}
	public Slip_detailVo(String slipDetailNo, String status, String price, String clientCard, String slipNumber,
			String establishCode) {
		this.slipDetailNo = slipDetailNo;
		this.status = status;
		this.price = price;
		this.clientCard = clientCard;
		this.slipNumber = slipNumber;
		this.establishCode = establishCode;
	}
	
}
