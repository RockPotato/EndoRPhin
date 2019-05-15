package kr.or.ddit.schedule.model;

public class ScheduleVo {
	String schedule_no;
	String schedule_title;
	String schedule_start;
	String schedule_end;
	String userid;
	
	
	
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getSchedule_no() {
		return schedule_no;
	}
	public void setSchedule_no(String schedule_no) {
		this.schedule_no = schedule_no;
	}
	public String getSchedule_title() {
		return schedule_title;
	}
	public void setSchedule_title(String schedule_title) {
		this.schedule_title = schedule_title;
	}
	public String getSchedule_start() {
		return schedule_start;
	}
	public void setSchedule_start(String schedule_start) {
		this.schedule_start = schedule_start;
	}
	public String getSchedule_end() {
		return schedule_end;
	}
	public void setSchedule_end(String schedule_end) {
		this.schedule_end = schedule_end;
	}
	@Override
	public String toString() {
		return "ScheduleVo [schedule_no=" + schedule_no + ", schedule_title=" + schedule_title + ", schedule_start="
				+ schedule_start + ", schedule_end=" + schedule_end + ", userid=" + userid + "]";
	}
	
	

	
}
