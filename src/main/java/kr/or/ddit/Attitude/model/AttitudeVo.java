package kr.or.ddit.Attitude.model;

import java.util.Date;

/**
 * 
 * @author sanghoyun
 *
 */
public class AttitudeVo {
	
	String attitudeCode;
	String attitudeName;
	String paidStatus;
	String relate;
	String baseDays;
	
	
	public String getAttitudeCode() {
		return attitudeCode;
	}
	public void setAttitudeCode(String attitudeCode) {
		this.attitudeCode = attitudeCode;
	}
	public String getAttitudeName() {
		return attitudeName;
	}
	public void setAttitudeName(String attitudeName) {
		this.attitudeName = attitudeName;
	}
	public String getPaidStatus() {
		return paidStatus;
	}
	public void setPaidStatus(String paidStatus) {
		this.paidStatus = paidStatus;
	}
	public String getRelate() {
		return relate;
	}
	public void setRelate(String relate) {
		this.relate = relate;
	}
	
	public String getBaseDays() {
		return baseDays;
	}
	public void setBaseDays(String baseDays) {
		this.baseDays = baseDays;
	}
	@Override
	public String toString() {
		return "AttitudeVo [attitudeCode=" + attitudeCode + ", attitudeName=" + attitudeName + ", paidStatus="
				+ paidStatus + ", relate=" + relate + ", baseDays=" + baseDays + "]";
	}
	
	
	
	

}
