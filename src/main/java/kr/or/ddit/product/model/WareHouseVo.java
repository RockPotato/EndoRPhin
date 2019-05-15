package kr.or.ddit.product.model;
/**
 * 
 * @author sanghoyun
 *
 */

public class WareHouseVo {
	String wareHouseCode;
	String wareHouseName;
	String wareHouselocal;
	
	public String getWareHouseCode() {
		return wareHouseCode;
	}
	public void setWareHouseCode(String wareHouseCode) {
		this.wareHouseCode = wareHouseCode;
	}
	public String getWareHouseName() {
		return wareHouseName;
	}
	public void setWareHouseName(String wareHouseName) {
		this.wareHouseName = wareHouseName;
	}
	public String getWareHouselocal() {
		return wareHouselocal;
	}
	public void setWareHouselocal(String wareHouselocal) {
		this.wareHouselocal = wareHouselocal;
	}
	
	@Override
	public String toString() {
		return "WareHouseVo [wareHouseCode=" + wareHouseCode + ", wareHouseName=" + wareHouseName + ", wareHouselocal="
				+ wareHouselocal + "]";
	}
	public WareHouseVo() {
	}
	public WareHouseVo(String wareHouseCode, String wareHouseName) {
		this.wareHouseCode = wareHouseCode;
		this.wareHouseName = wareHouseName;
	}
	
}
