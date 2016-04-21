package com.webrtc.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.webrtc.model.Notification;

@Repository
public class NotificationDaoImpl implements NotificationDao{
	@Autowired 
	SessionFactory sessionFactory;
	@Override
	public List<Notification> getAllNotifications(String userId) {
		
		@SuppressWarnings("unchecked")
	//	List<Notification> notificationList= sessionFactory.getCurrentSession().createQuery("from Notification n where n.RECEIVER=:userId").setParameter("userId", userId).list();
		List<Notification> notificationList= sessionFactory.getCurrentSession().createQuery("from Notification n where n.notificationReceiver='sip:bob@tcs.com'").list();
		return notificationList.size()>0?notificationList:null;
	}

}
