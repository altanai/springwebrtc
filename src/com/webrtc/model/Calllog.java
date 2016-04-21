package com.webrtc.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="CallLog")
public class Calllog implements Serializable{

	private static final long serialVersionUID = -723583058586873479L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)		
	@Column(name="Calllogid")
	private Integer Calllogid;
	
	@Column(name = "Calllogcaller")
	private String Calllogcaller;
	
	@Column(name="Calllogcallee")
	private String Calllogcallee;
	
	@Column(name="Calllogdate")
	private Date Calllogdate;

	public Integer getCalllogid() {
		return Calllogid;
	}

	public void setCalllogid(Integer calllogid) {
		Calllogid = calllogid;
	}

	public String getCalllogcaller() {
		return Calllogcaller;
	}

	public void setCalllogcaller(String calllogcaller) {
		Calllogcaller = calllogcaller;
	}

	public String getCalllogcallee() {
		return Calllogcallee;
	}

	public void setCalllogcallee(String calllogcallee) {
		Calllogcallee = calllogcallee;
	}

	public Date getCalllogdate() {
		return Calllogdate;
	}

	public void setCalllogdate(Date calllogdate) {
		Calllogdate = calllogdate;
	}


}
