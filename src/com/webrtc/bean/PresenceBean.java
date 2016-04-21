package com.webrtc.bean;

public class PresenceBean {
	
	private String sipuri;
	private String status;
	private String loggedin;
	
	public String getLoggedin() {
		return loggedin;
	}
	public void setLoggedin(String loggedin) {
		this.loggedin = loggedin;
	}
	public String getSipuri() {
		return sipuri;
	}
	public void setSipuri(String sipuri) {
		this.sipuri = sipuri;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
