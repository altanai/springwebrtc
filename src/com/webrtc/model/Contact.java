package com.webrtc.model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Contact")
public class Contact {
	
	private static final long serialVersionUID = -723583058586873479L;
	
	@Id
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

	
	
	
}
