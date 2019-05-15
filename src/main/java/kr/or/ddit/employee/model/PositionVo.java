package kr.or.ddit.employee.model;
/**
 * 
 * @author sanghoyun
 *
 */
public class PositionVo {
	
	String positionCode;
	String positionName;
	String rank;
	String useStatus;
	String relate;
	String positionStatus;
	
	public String getPositionCode() {
		return positionCode;
	}
	public void setPositionCode(String positionCode) {
		this.positionCode = positionCode;
	}
	public String getPositionName() {
		return positionName;
	}
	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	public String getUseStatus() {
		return useStatus;
	}
	public void setUseStatus(String useStatus) {
		this.useStatus = useStatus;
	}
	public String getRelate() {
		return relate;
	}
	public void setRelate(String relate) {
		this.relate = relate;
	}
	public String getPositionStatus() {
		return positionStatus;
	}
	public void setPositionStatus(String positionStatus) {
		this.positionStatus = positionStatus;
	}
	@Override
	public String toString() {
		return "PositionVo [positionCode=" + positionCode + ", positionName=" + positionName + ", rank=" + rank
				+ ", useStatus=" + useStatus + ", relate=" + relate + ", positionStatus=" + positionStatus + "]";
	}
	
	
	

}
