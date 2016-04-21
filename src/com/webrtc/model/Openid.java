package com.webrtc.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="Openid")
public class Openid implements Serializable{

	private static final long serialVersionUID = -723583058586873479L;
	
	@Id
	@Column(name = "openidsipuri")
	private String openidsipuri;

	@Column(name="openidgoogle")
	private String openidgoogle;
	
	@Column(name="openidfacebook")
	private String openidfacebook;
	
	@Column(name="openidyahoo")
	private String openidyahoo;

	public String getOpenidsipuri() {
		return openidsipuri;
	}

	public void setOpenidsipuri(String openidsipuri) {
		this.openidsipuri = openidsipuri;
	}

	public String getOpenidgoogle() {
		return openidgoogle;
	}

	public void setOpenidgoogle(String openidgoogle) {
		this.openidgoogle = openidgoogle;
	}

	public String getOpenidfacebook() {
		return openidfacebook;
	}

	public void setOpenidfacebook(String openidfacebook) {
		this.openidfacebook = openidfacebook;
	}

	public String getOpenidyahoo() {
		return openidyahoo;
	}

	public void setOpenidyahoo(String openidyahoo) {
		this.openidyahoo = openidyahoo;
	}


}
