package com.webrtc.service;

import java.util.List;

import com.webrtc.model.Notification;

public interface NotificationService {

	public List<Notification> getAllNotifications(String userId);
	
}
