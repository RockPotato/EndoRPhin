package kr.or.ddit.product.model;

/**
 * 
 * @author sanghoyun
 *
 */
public class ReceiveVo {
	
	String receiveCode;
	String receiveDate;
	String sortation;
	String material;
	String warehouseCode;
	String orderCode;
	
	String warehousename; // 창고명
	String quantity; //메인 아이템 개수를 뽑기위한 변수
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public String getWarehousename() {
		return warehousename;
	}
	public void setWarehousename(String warehousename) {
		this.warehousename = warehousename;
	}
	public String getReceiveCode() {
		return receiveCode;
	}
	public void setReceiveCode(String receiveCode) {
		this.receiveCode = receiveCode;
	}
	public String getReceiveDate() {
		return receiveDate;
	}
	public void setReceiveDate(String receiveDate) {
		this.receiveDate = receiveDate;
	}
	public String getSortation() {
		return sortation;
	}
	public void setSortation(String sortation) {
		this.sortation = sortation;
	}
	public String getMaterial() {
		return material;
	}
	public void setMaterial(String material) {
		this.material = material;
	}
	public String getWarehouseCode() {
		return warehouseCode;
	}
	public void setWarehouseCode(String warehouseCode) {
		this.warehouseCode = warehouseCode;
	}
	public String getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}
	public ReceiveVo() {
	}
	public ReceiveVo(String receiveDate, String sortation, String warehouseCode) {
		this.receiveDate = receiveDate;
		this.sortation = sortation;
		this.warehouseCode = warehouseCode;
	}
	@Override
	public String toString() {
		return "ReceiveVo [receiveCode=" + receiveCode + ", receiveDate=" + receiveDate + ", sortation=" + sortation
				+ ", material=" + material + ", warehouseCode=" + warehouseCode + ", orderCode=" + orderCode
				+ ", warehousename=" + warehousename + "]";
	}
	public ReceiveVo(String receiveDate, String sortation, String quantity, String warehouseCode) {
		this.receiveDate = receiveDate;
		this.sortation = sortation;
		this.quantity = quantity;
	}
	
	
	

}
