package kr.or.ddit.slip.model;

import java.util.Arrays;
import java.util.Date;

public class WriteSlipVo {
	String[] slipdate;
	String[] status;
	String[] establishCode;
	String[] clientCard;
	String[] price;
	String[] jukyo;
	String[] departmentName;
	public String[] getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String[] departmentName) {
		this.departmentName = departmentName;
	}
	public String[] getStatus() {
		return status;
	}
	public void setStatus(String[] status) {
		this.status = status;
	}
	public String[] getEstablishCode() {
		return establishCode;
	}
	public void setEstablishCode(String[] establishCode) {
		this.establishCode = establishCode;
	}
	public String[] getClientCard() {
		return clientCard;
	}
	public void setClientCard(String[] clientCard) {
		this.clientCard = clientCard;
	}
	public String[] getPrice() {
		return price;
	}
	public void setPrice(String[] price) {
		this.price = price;
	}
	public String[] getJukyo() {
		return jukyo;
	}
	public void setJukyo(String[] jukyo) {
		this.jukyo = jukyo;
	}
	public String[] getSlipdate() {
		return slipdate;
	}
	public void setSlipdate(String[] slipdate) {
		this.slipdate = slipdate;
	}
	@Override
	public String toString() {
		return "WriteSlipVo [slipdate=" + Arrays.toString(slipdate) + ", status=" + Arrays.toString(status)
				+ ", establishCode=" + Arrays.toString(establishCode) + ", clientCard=" + Arrays.toString(clientCard)
				+ ", price=" + Arrays.toString(price) + ", jukyo=" + Arrays.toString(jukyo) + ", departmentName="
				+ Arrays.toString(departmentName) + "]";
	}
}
