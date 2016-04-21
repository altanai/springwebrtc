package com.webrtc.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Presence")
public class Presence {
	
	private static final long serialVersionUID = -723583058586873479L;
	
	@Id
	@Column(name = "presencesipuri")
	private String presencesipuri;
	
	@Column(name="presencestatus")
	private String presencestatus;
	
	@Column(name="presenceloggedin")
	private String presenceloggedin;

	public String getPresenceloggedin() {
		return presenceloggedin;
	}

	public void setPresenceloggedin(String presenceloggedin) {
		this.presenceloggedin = presenceloggedin;
	}

	public String getPresencesipuri() {
		return presencesipuri;
	}

	public void setPresencesipuri(String presencesipuri) {
		this.presencesipuri = presencesipuri;
	}

	public String getPresencestatus() {
		return presencestatus;
	}

	public void setPresencestatus(String presencestatus) {
		this.presencestatus = presencestatus;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
}
