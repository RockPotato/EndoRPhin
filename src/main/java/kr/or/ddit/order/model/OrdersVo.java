package kr.or.ddit.order.model;

import java.util.Date;

/**
 * 
 * @author sanghoyun
 *
 */
public class OrdersVo {
	
	String orderCode;
	String deptCode;
	String userId;
	String orderPrice;
	String orderList;
	String dueDate;
	String paymentDueDate;
	String specialnote;
	String clientCode;
	String status;
	String sortation;
	
	String receivepay;
	String preDate;
	String postDate;
	String clientname;
	
	public String getReceivepay() {
		return receivepay;
	}
	public void setReceivepay(String receivepay) {
		this.receivepay = receivepay;
	}
	public String getClientname() {
		return clientname;
	}
	public void setClientname(String clientname) {
		this.clientname = clientname;
	}
	public String getPreDate() {
		return preDate;
	}
	public void setPreDate(String preDate) {
		this.preDate = preDate;
	}
	public String getPostDate() {
		return postDate;
	}
	public void setPostDate(String postDate) {
		this.postDate = postDate;
	}
	public String getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}
	public String getDeptCode() {
		return deptCode;
	}
	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(String orderPrice) {
		this.orderPrice = orderPrice;
	}
	public String getOrderList() {
		return orderList;
	}
	public void setOrderList(String orderList) {
		this.orderList = orderList;
	}
	public String getDueDate() {
		return dueDate;
	}
	public void setDueDate(String dueDate) {
		this.dueDate = dueDate;
	}
	public String getPaymentDueDate() {
		return paymentDueDate;
	}
	public void setPaymentDueDate(String paymentDueDate) {
		this.paymentDueDate = paymentDueDate;
	}
	public String getSpecialnote() {
		return specialnote;
	}
	public void setSpecialnote(String specialnote) {
		this.specialnote = specialnote;
	}
	public String getClientCode() {
		return clientCode;
	}
	public void setClientCode(String clientCode) {
		this.clientCode = clientCode;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getSortation() {
		return sortation;
	}
	public void setSortation(String sortation) {
		this.sortation = sortation;
	}
	@Override
	public String toString() {
		return "OrdersVo [orderCode=" + orderCode + ", deptCode=" + deptCode + ", userId=" + userId + ", orderPrice="
				+ orderPrice + ", orderList=" + orderList + ", dueDate=" + dueDate + ", paymentDueDate="
				+ paymentDueDate + ", specialnote=" + specialnote + ", clientCode=" + clientCode + ", status=" + status
				+ ", sortation=" + sortation + ", preDate=" + preDate + ", postDate=" + postDate + ", clientname="
				+ clientname + "]";
	}
	
	
	

}
