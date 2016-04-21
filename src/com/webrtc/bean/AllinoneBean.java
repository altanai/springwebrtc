package com.webrtc.bean;

import java.sql.Date;
import java.sql.Time;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class AllinoneBean {

	private String privateIdentity;
	private String displayName;
	private String publicIdentity;
	private String password;
	private String realm;
	private String secretQuestion;
	private String secretAnswer;
	
	private String sipuri;
	private String google;
	private String facebook;
	private String yahoo;
	
	private Long latitude;
	private Long longitude;
	private Date date;
	private Time time;
	
	private String friend;
	
	
	private String fileName;
	private CommonsMultipartFile fileData;

	public CommonsMultipartFile getFileData() {
		return fileData;
	}
	public void setFileData(CommonsMultipartFile fileData) {
		this.fileData = fileData;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	public String getPrivateIdentity() {
		return privateIdentity;
	}
	public void setPrivateIdentity(String privateIdentity) {
		this.privateIdentity = privateIdentity;
	}
	public String getDisplayName() {
		return displayName;
	}
	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}
	public String getPublicIdentity() {
		return publicIdentity;
	}
	public void setPublicIdentity(String publicIdentity) {
		this.publicIdentity = publicIdentity;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRealm() {
		return realm;
	}
	public void setRealm(String realm) {
		this.realm = realm;
	}
	public String getSecretQuestion() {
		return secretQuestion;
	}
	public void setSecretQuestion(String secretQuestion) {
		this.secretQuestion = secretQuestion;
	}
	public String getSecretAnswer() {
		return secretAnswer;
	}
	public void setSecretAnswer(String secretAnswer) {
		this.secretAnswer = secretAnswer;
	}
	public String getSipuri() {
		return sipuri;
	}
	public void setSipuri(String sipuri) {
		this.sipuri = sipuri;
	}
	public String getGoogle() {
		return google;
	}
	public void setGoogle(String google) {
		this.google = google;
	}
	public String getFacebook() {
		return facebook;
	}
	public void setFacebook(String facebook) {
		this.facebook = facebook;
	}
	public String getYahoo() {
		return yahoo;
	}
	public void setYahoo(String yahoo) {
		this.yahoo = yahoo;
	}
	public String getFriend() {
		return friend;
	}
	public void setFriend(String friend) {
		this.friend = friend;
	}
	public Long getLatitude() {
		return latitude;
	}
	public void setLatitude(Long latitude) {
		this.latitude = latitude;
	}
	public Long getLongitude() {
		return longitude;
	}
	public void setLongitude(Long longitude) {
		this.longitude = longitude;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Time getTime() {
		return time;
	}
	public void setTime(Time time) {
		this.time = time;
	}
	
	
	
	
}
