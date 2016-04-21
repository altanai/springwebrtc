package com.webrtc.dao;

import java.util.List;

import com.webrtc.model.Notification;

public interface NotificationDao {
	
	public List<Notification> getAllNotifications(String userId);

}
