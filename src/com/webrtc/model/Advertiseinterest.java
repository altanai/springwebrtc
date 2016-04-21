package com.webrtc.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Advertiseinterest")
public class Advertiseinterest {

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column (name="SequenceNumber")
	private int advertiseSequenceNumber;
	
	@Column(name = "advertiseaccessories")
	private String advertiseaccessories;
	
	@Column(name="advertiseautomobile")
	private String advertiseautomobile;
	
	@Column(name="advertisefood")
	private String advertisefood;

	public int getAdvertiseSequenceNumber() {
		return advertiseSequenceNumber;
	}

	public void setAdvertiseSequenceNumber(int advertiseSequenceNumber) {
		this.advertiseSequenceNumber = advertiseSequenceNumber;
	}

	public String getAdvertiseaccessories() {
		return advertiseaccessories;
	}

	public void setAdvertiseaccessories(String advertiseaccessories) {
		this.advertiseaccessories = advertiseaccessories;
	}

	public String getAdvertiseautomobile() {
		return advertiseautomobile;
	}

	public void setAdvertiseautomobile(String advertiseautomobile) {
		this.advertiseautomobile = advertiseautomobile;
	}

	public String getAdvertisefood() {
		return advertisefood;
	}

	public void setAdvertisefood(String advertisefood) {
		this.advertisefood = advertisefood;
	}
	
	
}
