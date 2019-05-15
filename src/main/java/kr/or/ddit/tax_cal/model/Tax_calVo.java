package kr.or.ddit.tax_cal.model;

import java.text.DecimalFormat;
import java.util.Date;

/**
 * 
 * @author sanghoyun
 *
 */
public class Tax_calVo {
	
	String salesCode;		// 번호
	Date slipDate;   	  	// 날짜
	String supplyValue;		// 공급가액
	String salesStatus;		// 매입매출구분
	String deptCode;		// 사용부서
	String surtax;			// 부가세
	String orderCode;		//발주번호
	String clientName;		// 거래처
	
	String sumValue;		// 공급대가
	String auto;			// 전자여부
	String entryType;		// 분개유형
	
	String nSupplyValue;	// 포멧팅 안된 공급가액
	String nSurtax;			// 포멧팅 안된  부가세
	String nSumValue;		// 포멧팅 안된 공급대가
	
	
	public String getnSupplyValue() {
		return nSupplyValue;
	}
	public void setnSupplyValue(String nSupplyValue) {
		this.nSupplyValue = nSupplyValue;
	}
	public String getnSurtax() {
		return nSurtax;
	}
	public void setnSurtax(String nSurtax) {
		this.nSurtax = nSurtax;
	}
	public String getnSumValue() {
		return nSumValue;
	}
	public void setnSumValue(String nSumValue) {
		this.nSumValue = nSumValue;
	}
	DecimalFormat df = new DecimalFormat("#,###");
	
	
	public String getClientName() {
		return clientName;
	}
	public void setClientName(String clientName) {
		this.clientName = clientName;
	}
	public String getEntryType() {
		return entryType;
	}
	public void setEntryType(String entryType) {
		this.entryType = entryType;
	}
	public String getAuto() {
		return auto;
	}
	public void setAuto(String auto) {
		this.auto = auto;
	}
	public String getSumValue() {
		int intSumValue = Integer.parseInt(sumValue);
		return df.format(intSumValue);
	}
	public void setSumValue(String sumValue) {
		this.sumValue = sumValue;
	}
	public String getSalesCode() {
		return salesCode;
	}
	public void setSalesCode(String salesCode) {
		this.salesCode = salesCode;
	}
	public Date getSlipDate() {
		return slipDate;
	}
	
	public void setSlipDate(Date slipDate) {
		this.slipDate = slipDate;
	}
	public String getSupplyValue() {
		int intSupplyValue = Integer.parseInt(supplyValue);
		return df.format(intSupplyValue);
	}
	public void setSupplyValue(String supplyValue) {
		this.supplyValue = supplyValue;
	}
	public String getSalesStatus() {
		return salesStatus;
	}
	public void setSalesStatus(String salesStatus) {
		this.salesStatus = salesStatus;
	}
	public String getDeptCode() {
		return deptCode;
	}
	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}
	public String getSurtax() {
		int intSurtax = Integer.parseInt(surtax);
		return df.format(intSurtax);
	}
	public void setSurtax(String surtax) {
		this.surtax = surtax;
	}
	public String getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}
	public Tax_calVo() {
	}
	public Tax_calVo(String salesCode, Date slipDate, String supplyValue, String salesStatus, String deptCode,
			String surtax, String orderCode, String clientName, String sumValue, String auto, String entryType) {
		this.salesCode = salesCode;
		this.slipDate = slipDate;
		this.nSupplyValue = supplyValue;
		this.salesStatus = salesStatus;
		this.deptCode = deptCode;
		this.nSurtax = surtax;
		this.orderCode = orderCode;
		this.clientName = clientName;
		this.nSumValue = sumValue;
		this.auto = auto;
		this.entryType = entryType;
	}
	
	

}
