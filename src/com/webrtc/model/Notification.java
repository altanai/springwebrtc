package com.webrtc.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Notification")
public class Notification {
	
	@Id
	@Column(name="ID")
	private String notificationId;
	
	@Column(name="SENDER")
	private String notificationSender;
	
	@Column(name="RECEIVER")
	private String notificationReceiver;
	
	@Column(name="TIMEOFNOTIFICATION")
	private String notificationTON;
	
	@Column(name="TYPE")
	private String notificationType;

	public String getNotificationId() {
		return notificationId;
	}

	public void setNotificationId(String notificationId) {
		this.notificationId = notificationId;
	}

	public String getNotificationSender() {
		return notificationSender;
	}

	public void setNotificationSender(String notificationSender) {
		this.notificationSender = notificationSender;
	}

	public String getNotificationReceiver() {
		return notificationReceiver;
	}

	public void setNotificationReceiver(String notificationReceiver) {
		this.notificationReceiver = notificationReceiver;
	}

	public String getNotificationTON() {
		return notificationTON;
	}

	public void setNotificationTON(String notificationTON) {
		this.notificationTON = notificationTON;
	}

	public String getNotificationType() {
		return notificationType;
	}

	public void setNotificationType(String notificationType) {
		this.notificationType = notificationType;
	}
	
}
