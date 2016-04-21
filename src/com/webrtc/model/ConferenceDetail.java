package com.webrtc.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;




@Entity
@Table(name="ConferenceDetail")
public class ConferenceDetail {
	
	private static final long serialVersionUID = -723583058586873479L;
	
	@Column (name="ConferenceName")
	private String confConferenceName;
	
	@Column (name="HostName")
	private String confHostName;
	
	@Column (name="MemberName")
	private String confMemberName;
	
	@Column (name="ConferenceId")
	private String confConferenceId;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column (name="SequenceNumber")
	private int confSequenceNumber;

	public String getConfConferenceName() {
		return confConferenceName;
	}

	public void setConfConferenceName(String confConferenceName) {
		this.confConferenceName = confConferenceName;
	}

	public String getConfHostName() {
		return confHostName;
	}

	public void setConfHostName(String confHostName) {
		this.confHostName = confHostName;
	}

	public String getConfMemberName() {
		return confMemberName;
	}

	public void setConfMemberName(String confMemberName) {
		this.confMemberName = confMemberName;
	}

	public String getConfConferenceId() {
		return confConferenceId;
	}

	public void setConfConferenceId(String confConferenceId) {
		this.confConferenceId = confConferenceId;
	}

	public int getConfSequenceNumber() {
		return confSequenceNumber;
	}

	public void setConfSequenceNumber(int confSequenceNumber) {
		this.confSequenceNumber = confSequenceNumber;
	}
	
	

}
