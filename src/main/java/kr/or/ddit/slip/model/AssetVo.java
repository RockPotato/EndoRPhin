package kr.or.ddit.slip.model;

import java.util.Date;

/**
 * 
 * @author sanghoyun
 *
 */
public class AssetVo {
	String assetCode; // 자산코드 
	String assetName; // 자산명 
	Date acquisitionDate; // 취득일 
	String accountName; // 계정명 
	String clientName; // 거래처명 
	String sanggakWay; // 상각방법 
	String acquisitionPrice; // 취득금액 
	String slipNumber; // 전표번호
	String residualvalue; // 잔존가치 
	String jukyo; 		// 적요 
	String companyCode;		// 회사코드
	String sanggakCode; 	// 감가상각계정코드 
	String depreciation; 	// 감가상각비
	String purchaseCode;	 // 업무용, 업무무관코드
	String accumulated;		 // 감가상각 누계액
	String serviceLife;		 //내용연수 
	String depreciationRate; // 상각률
	String jangbu; //매입매출 장부반영
	Date disposalDate;//매각 날짜 
	String disposalPrice;//매각 금액
	
	public String getAssetCode() {
		return assetCode;
	}
	public void setAssetCode(String assetCode) {
		this.assetCode = assetCode;
	}
	public String getAssetName() {
		return assetName;
	}
	public void setAssetName(String assetName) {
		this.assetName = assetName;
	}
	public Date getAcquisitionDate() {
		return acquisitionDate;
	}
	public void setAcquisitionDate(Date acquisitionDate) {
		this.acquisitionDate = acquisitionDate;
	}
	public String getAccountName() {
		return accountName;
	}
	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}
	public String getClientName() {
		return clientName;
	}
	public void setClientName(String clientName) {
		this.clientName = clientName;
	}
	public String getSanggakWay() {
		return sanggakWay;
	}
	public void setSanggakWay(String sanggakWay) {
		this.sanggakWay = sanggakWay;
	}
	public String getAcquisitionPrice() {
		return acquisitionPrice;
	}
	public void setAcquisitionPrice(String acquisitionPrice) {
		this.acquisitionPrice = acquisitionPrice;
	}
	public String getSlipNumber() {
		return slipNumber;
	}
	public void setSlipNumber(String slipNumber) {
		this.slipNumber = slipNumber;
	}
	public String getResidualvalue() {
		return residualvalue;
	}
	public void setResidualvalue(String residualvalue) {
		this.residualvalue = residualvalue;
	}
	public String getJukyo() {
		return jukyo;
	}
	public void setJukyo(String jukyo) {
		this.jukyo = jukyo;
	}
	public String getCompanyCode() {
		return companyCode;
	}
	public void setCompanyCode(String companyCode) {
		this.companyCode = companyCode;
	}
	public String getSanggakCode() {
		return sanggakCode;
	}
	public void setSanggakCode(String sanggakCode) {
		this.sanggakCode = sanggakCode;
	}
	public String getDepreciation() {
		return depreciation;
	}
	public void setDepreciation(String depreciation) {
		this.depreciation = depreciation;
	}
	public String getPurchaseCode() {
		return purchaseCode;
	}
	public void setPurchaseCode(String purchaseCode) {
		this.purchaseCode = purchaseCode;
	}
	public String getAccumulated() {
		return accumulated;
	}
	public void setAccumulated(String accumulated) {
		this.accumulated = accumulated;
	}
	public String getServiceLife() {
		return serviceLife;
	}
	public void setServiceLife(String serviceLife) {
		this.serviceLife = serviceLife;
	}
	public String getDepreciationRate() {
		return depreciationRate;
	}
	public void setDepreciationRate(String depreciationRate) {
		this.depreciationRate = depreciationRate;
	}
	public String getJangbu() {
		return jangbu;
	}
	public void setJangbu(String jangbu) {
		this.jangbu = jangbu;
	}
	public Date getDisposalDate() {
		return disposalDate;
	}
	public void setDisposalDate(Date disposalDate) {
		this.disposalDate = disposalDate;
	}
	public String getDisposalPrice() {
		return disposalPrice;
	}
	public void setDisposalPrice(String disposalPrice) {
		this.disposalPrice = disposalPrice;
	}

}
