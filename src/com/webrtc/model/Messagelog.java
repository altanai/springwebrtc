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
@Table(name="MessageLog")
public class Messagelog implements Serializable{

	private static final long serialVersionUID = -723583058586873479L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
		
	@Column(name="messagelogid")
	private Integer messagelogid;
	
	@Column(name = "messagelogsender")
	private String messagelogsender;
	
	@Column(name="messagelogreceiver")
	private String messagelogreceiver;
	
	@Column(name="messagelogdate")
	private Date messagelogdate;

	public Integer getMessagelogid() {
		return messagelogid;
	}

	public void setMessagelogid(Integer messagelogid) {
		this.messagelogid = messagelogid;
	}

	public String getMessagelogsender() {
		return messagelogsender;
	}

	public void setMessagelogsender(String messagelogsender) {
		this.messagelogsender = messagelogsender;
	}

	public String getMessagelogreceiver() {
		return messagelogreceiver;
	}

	public void setMessagelogreceiver(String messagelogreceiver) {
		this.messagelogreceiver = messagelogreceiver;
	}

	public Date getMessagelogdate() {
		return messagelogdate;
	}

	public void setMessagelogdate(Date messagelogdate) {
		this.messagelogdate = messagelogdate;
	}


}