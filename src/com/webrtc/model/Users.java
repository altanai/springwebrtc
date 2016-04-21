

/**
 * 
 */
package com.webrtc.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author altanai
 *
 */

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.OneToOne;
import javax.persistence.CascadeType;

@Entity
@Table(name="Users")
public class Users {

	private static final long serialVersionUID = -723583058586873479L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@OneToOne(mappedBy="USER_ID", cascade=CascadeType.ALL)
    @Column(name = "USER_ID", columnDefinition = "INT(10) unsigned", nullable = false)
	private Integer USER_ID;
	
	@Column(name="USERNAME" , nullable = false)
	private String USERNAME;
	
	
	@Column(name="PASSWORD" , nullable = false)
	private String PASSWORD;
	

    @Column(name = "ACTIVE", columnDefinition = "INT(1) unsigned", nullable = false)
	private String ACTIVE;

    
	public Integer getUSER_ID() {
		return USER_ID;
	}


	public void setUSER_ID(Integer uSER_ID) {
		USER_ID = uSER_ID;
	}


	public String getUSERNAME() {
		return USERNAME;
	}


	public void setUSERNAME(String uSERNAME) {
		USERNAME = uSERNAME;
	}


	public String getPASSWORD() {
		return PASSWORD;
	}


	public void setPASSWORD(String pASSWORD) {
		PASSWORD = pASSWORD;
	}


	public String getACTIVE() {
		return ACTIVE;
	}


	public void setACTIVE(String aCTIVE) {
		ACTIVE = aCTIVE;
	}
    
    
    

}
