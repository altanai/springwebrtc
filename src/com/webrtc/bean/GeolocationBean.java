package com.webrtc.bean;

import java.sql.Date;
import java.sql.Time;

public class GeolocationBean {
	private String sipuri;
	private Long latitude;
	private Long longitude;
	private Date date;
	private Time time;
	public String getSipuri() {
		return sipuri;
	}
	public void setSipuri(String sipuri) {
		this.sipuri = sipuri;
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