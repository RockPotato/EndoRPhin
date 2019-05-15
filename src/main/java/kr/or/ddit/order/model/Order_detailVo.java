package kr.or.ddit.order.model;
/**
 * 
 * @author sanghoyun
 *
 */
public class Order_detailVo {
	
	String orderDetailCode;
	String orderCode;
	String quantity;
	String productCode;
	
	
	String productname;
	String standard;
	String baseprice;
	
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public String getStandard() {
		return standard;
	}
	public void setStandard(String standard) {
		this.standard = standard;
	}
	public String getBaseprice() {
		return baseprice;
	}
	public void setBaseprice(String baseprice) {
		this.baseprice = baseprice;
	}
	public String getOrderDetailCode() {
		return orderDetailCode;
	}
	public void setOrderDetailCode(String orderDetailCode) {
		this.orderDetailCode = orderDetailCode;
	}
	public String getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	@Override
	public String toString() {
		return "Order_detailVo [orderDetailCode=" + orderDetailCode + ", orderCode=" + orderCode + ", quantity="
				+ quantity + ", productCode=" + productCode + ", productname=" + productname + ", standard=" + standard
				+ ", baseprice=" + baseprice + "]";
	}
	public Order_detailVo(String orderDetailCode, String orderCode, String quantity, String productCode) {
		this.orderDetailCode = orderDetailCode;
		this.orderCode = orderCode;
		this.quantity = quantity;
		this.productCode = productCode;
	}
	public Order_detailVo() {
	}

}
