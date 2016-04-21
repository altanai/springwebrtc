package com.webrtc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.webrtc.dao.NotificationDao;
import com.webrtc.model.Notification;

@Service
public class NotificationServiceImpl implements NotificationService{

	@Autowired
	private NotificationDao notificationDao;
	
	@Override
	@Transactional
	public List<Notification> getAllNotifications(String userId) {
		return notificationDao.getAllNotifications(userId);
	}

}
