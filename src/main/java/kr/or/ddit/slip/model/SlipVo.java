package kr.or.ddit.slip.model;

import java.util.Date;
/**
 * 
 * @author sanghoyun
 *
 */
public class SlipVo {
	
	String slipNumber;    //전표 번호
	String total;		  //총금액
	Date slipDate;		  // 전표일
	String departmentName; //부서명
	String jukyo; 			//적요
	String status;		   //승인여부 
	
	String pre_date;
	String post_date;
	
	public String getSlipNumber() {
		return slipNumber;
	}
	public void setSlipNumber(String slipNumber) {
		this.slipNumber = slipNumber;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public Date getSlipDate() {
		return slipDate;
	}
	public void setSlipDate(Date slipDate) {
		this.slipDate = slipDate;
	}
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	public String getJukyo() {
		return jukyo;
	}
	public void setJukyo(String jukyo) {
		this.jukyo = jukyo;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPre_date() {
		return pre_date;
	}
	public void setPre_date(String pre_date) {
		this.pre_date = pre_date;
	}
	
	
	public String getPost_date() {
		return post_date;
	}
	public void setPost_date(String post_date) {
		this.post_date = post_date;
	}
	public SlipVo() {
	}
	public SlipVo(String total, Date slipDate, String jukyo) {
		this.total = total;
		this.slipDate = slipDate;
		this.jukyo = jukyo;
	}
	
	

}
