package com.webrtc.model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Contact")
public class Contact {
	
	private static final long serialVersionUID = -723583058586873479L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column (name="SequenceNumber")
	private int contactSequenceNumber;
	
	@Column(name = "contactsipuri")
	private String contactsipuri;
	
	@Column(name="contactfriend")
	private String contactfriend;

	public String getContactsipuri() {
		return contactsipuri;
	}

	public void setContactsipuri(String contactsipuri) {
		this.contactsipuri = contactsipuri;
	}

	public String getContactfriend() {
		return contactfriend;
	}

	public void setContactfriend(String contactfriend) {
		this.contactfriend = contactfriend;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public int getContactSequenceNumber() {
		return contactSequenceNumber;
	}

	public void setContactSequenceNumber(int contactSequenceNumber) {
		this.contactSequenceNumber = contactSequenceNumber;
	}
	
	
}