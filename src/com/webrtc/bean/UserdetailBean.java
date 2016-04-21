/**
 * Java Files 
 */
package com.webrtc.bean;

import javax.persistence.Column;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

/**
 * @author altanai
 *
 */
public class UserdetailBean {
	
	private String privateIdentity;
	private String displayName;
	private String publicIdentity;
	private String password;
	private String realm;
	private String secretQuestion;
	private String secretAnswer;
	private String fileName;

	private CommonsMultipartFile fileData;

	public CommonsMultipartFile getFileData() {
		return fileData;
	}
	public void setFileData(CommonsMultipartFile fileData) {
		this.fileData = fileData;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	/**
	 * @return the privateIdentity
	 */
	public String getPrivateIdentity() {
		return privateIdentity;
	}
	/**
	 * @param privateIdentity the privateIdentity to set
	 */
	public void setPrivateIdentity(String privateIdentity) {
		this.privateIdentity = privateIdentity;
	}
	/**
	 * @return the displayName
	 */
	public String getDisplayName() {
		return displayName;
	}
	/**
	 * @param displayName the displayName to set
	 */
	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}
	/**
	 * @return the publicIdentity
	 */
	public String getPublicIdentity() {
		return publicIdentity;
	}
	/**
	 * @param publicIdentity the publicIdentity to set
	 */
	public void setPublicIdentity(String publicIdentity) {
		this.publicIdentity = publicIdentity;
	}
	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}
	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}
	/**
	 * @return the realm
	 */
	public String getRealm() {
		return realm;
	}
	/**
	 * @param realm the realm to set
	 */
	public void setRealm(String realm) {
		this.realm = realm;
	}
	/**
	 * @return the secretQuestion
	 */
	public String getSecretQuestion() {
		return secretQuestion;
	}
	/**
	 * @param secretQuestion the secretQuestion to set
	 */
	public void setSecretQuestion(String secretQuestion) {
		this.secretQuestion = secretQuestion;
	}
	/**
	 * @return the secretAnswer
	 */
	public String getSecretAnswer() {
		return secretAnswer;
	}
	/**
	 * @param secretAnswer the secretAnswer to set
	 */
	public void setSecretAnswer(String secretAnswer) {
		this.secretAnswer = secretAnswer;
	}
	

}