package kr.or.ddit.payment.model;

import java.util.List;

public class Payment4UpdVo {
	private String userid;
	private String payday;
	private String payCode;
	private String deprostatus;
	private List<String> decdMap;
	private List<String> decdPayList;
	
	public String getDeprostatus() {
		return deprostatus;
	}
	public void setDeprostatus(String deprostatus) {
		this.deprostatus = deprostatus;
	}
	
	
	public String getPayCode() {
		return payCode;
	}
	public void setPayCode(String payCode) {
		this.payCode = payCode;
	}
	
	public List<String> getDecdPayList() {
		return decdPayList;
	}
	public void setDecdPayList(List<String> decdPayList) {
		this.decdPayList = decdPayList;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPayday() {
		return payday;
	}
	public void setPayday(String payday) {
		this.payday = payday;
	}
	public List<String> getDecdMap() {
		return decdMap;
	}
	public void setDecdMap(List<String> decdMap) {
		this.decdMap = decdMap;
	}
	@Override
	public String toString() {
		return "Payment4UpdVo [userid=" + userid + ", payday=" + payday + ", payCode=" + payCode + ", deprostatus="
				+ deprostatus + ", decdMap=" + decdMap + ", decdPayList=" + decdPayList + "]";
	}
	
}
