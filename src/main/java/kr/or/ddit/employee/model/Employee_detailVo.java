package kr.or.ddit.employee.model;
/**
 * 
 * @author sanghoyun
 *
 */
public class Employee_detailVo {
	
	String userId;
	String finalSchool;
	String email;
	String phoneNumber;
	String address;
	String marryStatus;
	String imagecode;
	String addressDetail;
	
	
	//이미지VO
	
	String imagename;
	String imagerealpath;
	String imagerealname;
	
	
	
	public String getAddressDetail() {
		return addressDetail;
	}
	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}
	public String getImagename() {
		return imagename;
	}
	public void setImagename(String imagename) {
		this.imagename = imagename;
	}
	public String getImagerealpath() {
		return imagerealpath;
	}
	public void setImagerealpath(String imagerealpath) {
		this.imagerealpath = imagerealpath;
	}
	public String getImagerealname() {
		return imagerealname;
	}
	public void setImagerealname(String imagerealname) {
		this.imagerealname = imagerealname;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getFinalSchool() {
		return finalSchool;
	}
	public void setFinalSchool(String finalSchool) {
		this.finalSchool = finalSchool;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getMarryStatus() {
		return marryStatus;
	}
	public void setMarryStatus(String marryStatus) {
		this.marryStatus = marryStatus;
	}
	public String getImagecode() {
		return imagecode;
	}
	public void setImagecode(String imagecode) {
		this.imagecode = imagecode;
	}
	@Override
	public String toString() {
		return "Employee_detailVo [userId=" + userId + ", finalSchool=" + finalSchool + ", email=" + email
				+ ", phoneNumber=" + phoneNumber + ", address=" + address + ", marryStatus=" + marryStatus
				+ ", imagecode=" + imagecode + ", imagename=" + imagename + ", imagerealpath=" + imagerealpath
				+ ", imagerealname=" + imagerealname + "]";
	}
	
	
	
	
	

}
