package kr.or.ddit.annual.model;

/**
 * 
 * @author sanghoyun
 *
 */
public class AnnualVo {
	
	String userid;           //사원번호
	String annualdate;       //연차발생일자
	String annualstart;      //연차사용사용가능 시작일자
	String annualend;        //연차종료일자 
	String occurannual;      //발생연차수
	String userdate;         //사용일수
	String year;             //해당년도
	String residual;         //잔여연차
	
	
	//조인 컬럼
	
	String usernm;    //사원명
	String deptname;  //부서명
	String continuousYear;  //근속년수
	
	
	
	
	
	public String getResidual() {
		return residual;
	}
	public void setResidual(String residual) {
		this.residual = residual;
	}
	public String getContinuousYear() {
		return continuousYear;
	}
	public void setContinuousYear(String continuousYear) {
		this.continuousYear = continuousYear;
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
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getAnnualdate() {
		return annualdate;
	}
	public void setAnnualdate(String annualdate) {
		this.annualdate = annualdate;
	}
	public String getAnnualstart() {
		return annualstart;
	}
	public void setAnnualstart(String annualstart) {
		this.annualstart = annualstart;
	}
	public String getAnnualend() {
		return annualend;
	}
	public void setAnnualend(String annualend) {
		this.annualend = annualend;
	}
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
	@Override
	public String toString() {
		return "AnnualVo [userid=" + userid + ", annualdate=" + annualdate + ", annualstart=" + annualstart
				+ ", annualend=" + annualend + ", occurannual=" + occurannual + ", userdate=" + userdate + ", year="
				+ year + ", usernm=" + usernm + ", deptname=" + deptname + "]";
	}
	
	
	

	
	
	
	
	
	
}
