package kr.or.ddit.handler.model;

public class NoteVo {
	String noteno;
	String sendid;
	String receiveid;
	String title;
	String content;
	String senddate;
	String receivedate;
	
	//조인 컬럼
	
	String userid;
	String usernm;
	
	
	
	
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUsernm() {
		return usernm;
	}
	public void setUsernm(String usernm) {
		this.usernm = usernm;
	}
	public String getNoteno() {
		return noteno;
	}
	public void setNoteno(String noteno) {
		this.noteno = noteno;
	}
	public String getSendid() {
		return sendid;
	}
	public void setSendid(String sendid) {
		this.sendid = sendid;
	}
	public String getReceiveid() {
		return receiveid;
	}
	public void setReceiveid(String receiveid) {
		this.receiveid = receiveid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSenddate() {
		return senddate;
	}
	public void setSenddate(String senddate) {
		this.senddate = senddate;
	}
	public String getReceivedate() {
		return receivedate;
	}
	public void setReceivedate(String receivedate) {
		this.receivedate = receivedate;
	}
	@Override
	public String toString() {
		return "NoteVo [noteno=" + noteno + ", sendid=" + sendid + ", receiveid=" + receiveid + ", title=" + title
				+ ", content=" + content + ", senddate=" + senddate + ", receivedate=" + receivedate + ", userid="
				+ userid + ", usernm=" + usernm + "]";
	}
	
	
	
	
}
