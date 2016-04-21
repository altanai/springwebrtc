package com.webrtc.bean;

import java.sql.Blob;
import java.sql.Date;

import javax.persistence.Column;

public class VoicemailBean {
	  
	  String id;
	  String fromUser;
	  String toUser;
	  Date mailTime;
	  Blob voiceMail;
	  
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFromUser() {
		return fromUser;
	}
	public void setFromUser(String fromUser) {
		this.fromUser = fromUser;
	}
	public String getToUser() {
		return toUser;
	}
	public void setToUser(String toUser) {
		this.toUser = toUser;
	}
	public Date getMailTime() {
		return mailTime;
	}
	public void setMailTime(Date mailTime) {
		this.mailTime = mailTime;
	}
	public Blob getVoiceMail() {
		return voiceMail;
	}
	public void setVoiceMail(Blob voiceMail) {
		this.voiceMail = voiceMail;
	}	  
	  
	  
}
