package com.webrtc.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Advertisementinterest")
public class Advertisementinterest {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column (name="SequenceNumber")
	private int advertisementSequenceNumber;
	
	private String advertisementinterest;
	
	@Column(name = "advertisementaccessories")
	private String advertisementsub1;
	
	@Column(name="advertisementautomobile")
	private String advertisementsub2;
	
	@Column(name="advertisementfood")
	private String advertisementsub3;

	public int getAdvertisementSequenceNumber() {
		return advertisementSequenceNumber;
	}

	public void setAdvertisementSequenceNumber(int advertisementSequenceNumber) {
		this.advertisementSequenceNumber = advertisementSequenceNumber;
	}

	public String getAdvertisementinterest() {
		return advertisementinterest;
	}

	public void setAdvertisementinterest(String advertisementinterest) {
		this.advertisementinterest = advertisementinterest;
	}

	public String getAdvertisementsub1() {
		return advertisementsub1;
	}

	public void setAdvertisementsub1(String advertisementsub1) {
		this.advertisementsub1 = advertisementsub1;
	}

	public String getAdvertisementsub2() {
		return advertisementsub2;
	}

	public void setAdvertisementsub2(String advertisementsub2) {
		this.advertisementsub2 = advertisementsub2;
	}

	public String getAdvertisementsub3() {
		return advertisementsub3;
	}

	public void setAdvertisementsub3(String advertisementsub3) {
		this.advertisementsub3 = advertisementsub3;
	}

	

}
