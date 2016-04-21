package com.webrtc.bean;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class AdvertisementinterestBean {
	private int sequenceNumber;
	private String Interest;
	private String sub1;
	private String sub2;
	private String sub3;
	private String filename;
	private CommonsMultipartFile fileData;

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public CommonsMultipartFile getFileData() {
		return fileData;
	}

	public void setFileData(CommonsMultipartFile fileData) {
		this.fileData = fileData;
	}
	public String getInterest() {
		return Interest;
	}
	public void setInterest(String interest) {
		Interest = interest;
	}
	public String getSub1() {
		return sub1;
	}
	public void setSub1(String sub1) {
		this.sub1 = sub1;
	}
	public String getSub2() {
		return sub2;
	}
	public void setSub2(String sub2) {
		this.sub2 = sub2;
	}
	public String getSub3() {
		return sub3;
	}
	public void setSub3(String sub3) {
		this.sub3 = sub3;
	}
	public int getSequenceNumber() {
		return sequenceNumber;
	}
	public void setSequenceNumber(int sequenceNumber) {
		this.sequenceNumber = sequenceNumber;
	}
	
}
