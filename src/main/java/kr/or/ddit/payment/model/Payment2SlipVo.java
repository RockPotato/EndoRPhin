package kr.or.ddit.payment.model;

public class Payment2SlipVo {
	String[] establishCode;
	String[] status;
	String[] price;
	String total;
	String[] clientCard;
	String paydayMonth;
	public String getPaydayMonth() {
		return paydayMonth;
	}
	public void setPaydayMonth(String paydayMonth) {
		this.paydayMonth = paydayMonth;
	}
	public String[] getClientCard() {
		return clientCard;
	}
	public void setClientCard(String[] clientCard) {
		this.clientCard = clientCard;
	}
	public String[] getEstablishCode() {
		return establishCode;
	}
	public void setEstablishCode(String[] establishCode) {
		this.establishCode = establishCode;
	}
	public String[] getStatus() {
		return status;
	}
	public void setStatus(String[] status) {
		this.status = status;
	}
	public String[] getPrice() {
		return price;
	}
	public void setPrice(String[] price) {
		this.price = price;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	
}
