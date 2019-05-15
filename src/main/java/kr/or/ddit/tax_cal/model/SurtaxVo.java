package kr.or.ddit.tax_cal.model;
/**
 * 
 * @author sanghoyun
 *
 */
public class SurtaxVo {
	
	String surtaxNumber;
	String buyingTax;
	String salesTax;
	String calculateTax;
	
	public String getSurtaxNumber() {
		return surtaxNumber;
	}
	public void setSurtaxNumber(String surtaxNumber) {
		this.surtaxNumber = surtaxNumber;
	}
	public String getBuyingTax() {
		return buyingTax;
	}
	public void setBuyingTax(String buyingTax) {
		this.buyingTax = buyingTax;
	}
	public String getSalesTax() {
		return salesTax;
	}
	public void setSalesTax(String salesTax) {
		this.salesTax = salesTax;
	}
	public String getCalculateTax() {
		return calculateTax;
	}
	public void setCalculateTax(String calculateTax) {
		this.calculateTax = calculateTax;
	}
	
	

}
