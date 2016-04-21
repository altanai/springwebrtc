package com.webrtc.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.webrtc.model.Messagelog;

@Repository("messageLogDao")
public class MessageLogDaoImpl implements MessageLogDao {

	@Autowired
	private SessionFactory sessionFactory;


	public void addMessage(Messagelog messagelog) {
		sessionFactory.getCurrentSession().saveOrUpdate(messagelog);
		
	}
	public Messagelog getMessage(int messageid) {
		return (Messagelog) sessionFactory.getCurrentSession().get(Messagelog.class, messageid);
	}

	public List<Messagelog> listMessages() {
		return (List<Messagelog>) sessionFactory.getCurrentSession().createCriteria(Messagelog.class).list();
	}
}
