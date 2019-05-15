package kr.or.ddit.employee.model;

/**
 * 
 * @author sanghoyun
 *
 */
public class EmployeeVo {
	
	String userId;
	String userNm;
	String deptCode;
	String positionCode;
	String rankCode;
	String continuousYear;
	String relate;
	String joinCompany;
	String BirthDate;
	String password;
	
	
	
	//직책/직급 이름
	String positionname;
	String rankname;
	
	//부서이름
	String deptname;
	
	//사원 디테일 
	String finalschool;
	String email;
	String phonenumber;
	String address;
	String addressDetail;
	String marryStatus;
	String imagecode;
	
	//연차 테이블
	
	String occurannual;
	String userdate;
	String residual;
	
	
	
	public String getOccurannual() {
		return occurannual;
	}
	public void setOccurannual(String occurannual) {
		this.occurannual = occurannual;
	}
	public String getUserdate() {
		return userdate;
	}
	public void setUserdate(String userdate) {
		this.userdate = userdate;
	}
	public String getResidual() {
		return residual;
	}
	public void setResidual(String residual) {
		this.residual = residual;
	}
	public String getAddressDetail() {
		return addressDetail;
	}
	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}
	public String getImagecode() {
		return imagecode;
	}
	public void setImagecode(String imagecode) {
		this.imagecode = imagecode;
	}
	public String getMarryStatus() {
		return marryStatus;
	}
	public void setMarryStatus(String marryStatus) {
		this.marryStatus = marryStatus;
	}
	public String getFinalschool() {
		return finalschool;
	}
	public void setFinalschool(String finalschool) {
		this.finalschool = finalschool;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPositionname() {
		return positionname;
	}
	public void setPositionname(String positionname) {
		this.positionname = positionname;
	}
	public String getRankname() {
		return rankname;
	}
	public void setRankname(String rankname) {
		this.rankname = rankname;
	}
	public String getDeptname() {
		return deptname;
	}
	public void setDeptname(String deptname) {
		this.deptname = deptname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserNm() {
		return userNm;
	}
	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}
	public String getDeptCode() {
		return deptCode;
	}
	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}
	public String getPositionCode() {
		return positionCode;
	}
	public void setPositionCode(String positionCode) {
		this.positionCode = positionCode;
	}
	public String getRankCode() {
		return rankCode;
	}
	public void setRankCode(String rankCode) {
		this.rankCode = rankCode;
	}
	public String getContinuousYear() {
		return continuousYear;
	}
	public void setContinuousYear(String continuousYear) {
		this.continuousYear = continuousYear;
	}
	public String getRelate() {
		return relate;
	}
	public void setRelate(String relate) {
		
		
		this.relate = relate;
	}
	public String getJoinCompany() {
		
		//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		

		return joinCompany;
	}
	public void setJoinCompany(String joinCompany) {
		this.joinCompany = joinCompany;
	}
	
	
	public String getBirthDate() {
		//SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		
		return BirthDate;
	}
	public void setBirthDate(String birthDate) {
		BirthDate = birthDate;
	}
	
	
	
	@Override
	public String toString() {
		return "EmployeeVo [userId=" + userId + ", userNm=" + userNm + ", deptCode=" + deptCode + ", positionCode="
				+ positionCode + ", rankCode=" + rankCode + ", continuousYear=" + continuousYear + ", relate=" + relate
				+ ", joinCompany=" + joinCompany + ", BirthDate=" + BirthDate + ", password=" + password
				+ ", positionname=" + positionname + ", rankname=" + rankname + ", deptname=" + deptname
				+ ", finalschool=" + finalschool + ", email=" + email + ", phonenumber=" + phonenumber + ", address="
				+ address + ", addressDetail=" + addressDetail + ", marryStatus=" + marryStatus + ", imagecode="
				+ imagecode + ", occurannual=" + occurannual + ", userdate=" + userdate + ", residual=" + residual
				+ "]";
	}
	
	
	
	
	
	
	
	
	

}
