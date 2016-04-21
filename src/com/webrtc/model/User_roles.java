

/**
 * 
 */
package com.webrtc.model;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.*;


import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;
/**
 * @author altanai
 *
 */
@Entity
@Table(name="User_roles")
public class User_roles {
 
	private static final long serialVersionUID = -723583058586873479L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name = "USER_ROLE_ID", columnDefinition = "INT(10) unsigned", nullable = false)
    private int USER_ROLE_ID;


    @Column(name = "USER_ID", columnDefinition = "INT(10) unsigned", nullable = false)
	//@GenericGenerator(name="gen", strategy="foreign", parameters=@Parameter(name="property", value="user"))
    private int USER_ID;
    
    @Column(name = "AUTHORITY", nullable = false)
    private String AUTHORITY;
    
/*    @OneToOne
    private Users user;*/

	public int getUSER_ROLE_ID() {
		return USER_ROLE_ID;
	}

	public void setUSER_ROLE_ID(int USER_ROLE_ID) {
		USER_ROLE_ID = USER_ROLE_ID;
	}

	public int getUSER_ID() {
		return USER_ID;
	}

	public void setUSER_ID(int uSER_ID) {
		USER_ID = uSER_ID;
	}

	public String getAUTHORITY() {
		return AUTHORITY;
	}

	public void setAUTHORITY(String aUTHORITY) {
		AUTHORITY = aUTHORITY;
	}
 
    
    
}
