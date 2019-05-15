package kr.or.ddit.Attitude.model;

import java.util.Date;

/**
 * 
 * @author sanghoyun
 *
 */
public class Attitude_recordVo {
	
	String userid; //사원번호
	String startday; //휴가시작일
	String endday;  //휴가종료일
	String attitudememo ;//특이사항 메모
	String status;  //승인여부
	String statusname;
	String attitudecode; //근태코드
	String days; //일수
	String afterStartday; //업뎃 시작날짜
	
	
	
	
	
	//조인 컬럼
	String usernm; //사원명
	String deptname; //부서명
	String attitudename; //근태명
	String basedays; //일수
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getStartday() {
		return startday;
	}
	public void setStartday(String startday) {
		this.startday = startday;
	}
	public String getEndday() {
		return endday;
	}
	public void setEndday(String endday) {
		this.endday = endday;
	}
	public String getAttitudememo() {
		return attitudememo;
	}
	public void setAttitudememo(String attitudememo) {
		this.attitudememo = attitudememo;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getStatusname() {
		return statusname;
	}
	public void setStatusname(String statusname) {
		this.statusname = statusname;
	}
	public String getAttitudecode() {
		return attitudecode;
	}
	public void setAttitudecode(String attitudecode) {
		this.attitudecode = attitudecode;
	}
	public String getUsernm() {
		return usernm;
	}
	public void setUsernm(String usernm) {
		this.usernm = usernm;
	}
	public String getDeptname() {
		return deptname;
	}
	public void setDeptname(String deptname) {
		this.deptname = deptname;
	}
	public String getAttitudename() {
		return attitudename;
	}
	public void setAttitudename(String attitudename) {
		this.attitudename = attitudename;
	}
	public String getBasedays() {
		return basedays;
	}
	public void setBasedays(String basedays) {
		this.basedays = basedays;
	}
	
	public String getDays() {
		return days;
	}
	public void setDays(String days) {
		this.days = days;
	}
	
	
	
	public String getAfterStartday() {
		return afterStartday;
	}
	public void setAfterStartday(String afterStartday) {
		this.afterStartday = afterStartday;
	}
	@Override
	public String toString() {
		return "Attitude_recordVo [userid=" + userid + ", startday=" + startday + ", endday=" + endday
				+ ", attitudememo=" + attitudememo + ", status=" + status + ", statusname=" + statusname
				+ ", attitudecode=" + attitudecode + ", usernm=" + usernm + ", deptname=" + deptname + ", attitudename="
				+ attitudename + ", basedays=" + basedays + "]";
	}
	
	

}
