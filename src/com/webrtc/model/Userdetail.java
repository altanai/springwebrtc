package com.webrtc.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Userdetail")
public class Userdetail {
	
	@Id
	@Column(name = "userdetailprivateIdentity")
	private String userdetailprivateIdentity;
	
	@Column(name="userdetaildisplayName")
	private String userdetaildisplayName;
	
	@Column(name="userdetailpublicIdentity")
	private String userdetailpublicIdentity;
	
	@Column(name="userdetailpassword")
	private String userdetailpassword;
	
	@Column(name="userdetailrealm")
	private String userdetailrealm;
	
	@Column(name="userdetailsecretQuestion")
	private String userdetailsecretQuestion;
	
	@Column(name="userdetailsecretAnswer")
	private String userdetailsecretAnswer;
	
	public String getUserdetailprivateIdentity() {
		return userdetailprivateIdentity;
	}
	public void setUserdetailprivateIdentity(String userdetailprivateIdentity) {
		this.userdetailprivateIdentity = userdetailprivateIdentity;
	}
	public String getUserdetaildisplayName() {
		return userdetaildisplayName;
	}
	public void setUserdetaildisplayName(String userdetaildisplayName) {
		this.userdetaildisplayName = userdetaildisplayName;
	}
	public String getUserdetailpublicIdentity() {
		return userdetailpublicIdentity;
	}
	public void setUserdetailpublicIdentity(String userdetailpublicIdentity) {
		this.userdetailpublicIdentity = userdetailpublicIdentity;
	}
	public String getUserdetailpassword() {
		return userdetailpassword;
	}
	public void setUserdetailpassword(String userdetailpassword) {
		this.userdetailpassword = userdetailpassword;
	}
	public String getUserdetailrealm() {
		return userdetailrealm;
	}
	public void setUserdetailrealm(String userdetailrealm) {
		this.userdetailrealm = userdetailrealm;
	}
	public String getUserdetailsecretQuestion() {
		return userdetailsecretQuestion;
	}
	public void setUserdetailsecretQuestion(String userdetailsecretQuestion) {
		this.userdetailsecretQuestion = userdetailsecretQuestion;
	}
	public String getUserdetailsecretAnswer() {
		return userdetailsecretAnswer;
	}
	public void setUserdetailsecretAnswer(String userdetailsecretAnswer) {
		this.userdetailsecretAnswer = userdetailsecretAnswer;
	}
	
	
	
	
}
