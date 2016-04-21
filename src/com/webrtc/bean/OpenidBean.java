package com.webrtc.bean;

import javax.persistence.Column;

public class OpenidBean {


	private String sipuri;
	private String google;
	private String facebook;
	private String yahoo;
	/**
	 * @return the sipuri
	 */
	public String getSipuri() {
		return sipuri;
	}
	/**
	 * @param sipuri the sipuri to set
	 */
	public void setSipuri(String sipuri) {
		this.sipuri = sipuri;
	}
	/**
	 * @return the google
	 */
	public String getGoogle() {
		return google;
	}
	/**
	 * @param google the google to set
	 */
	public void setGoogle(String google) {
		this.google = google;
	}
	/**
	 * @return the facebook
	 */
	public String getFacebook() {
		return facebook;
	}
	/**
	 * @param facebook the facebook to set
	 */
	public void setFacebook(String facebook) {
		this.facebook = facebook;
	}
	/**
	 * @return the yahoo
	 */
	public String getYahoo() {
		return yahoo;
	}
	/**
	 * @param yahoo the yahoo to set
	 */
	public void setYahoo(String yahoo) {
		this.yahoo = yahoo;
	}
}
