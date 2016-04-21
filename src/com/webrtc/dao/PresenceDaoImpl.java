package com.webrtc.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.webrtc.model.Contact;
import com.webrtc.model.Presence;

@Repository("presenceDao")
public class PresenceDaoImpl implements PresenceDao{

	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void addPresence(Presence presence) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().saveOrUpdate(presence);
	}

	@SuppressWarnings("unchecked")
	public List<Presence> listPresencess() {
		// TODO Auto-generated method stub
		
		return (List<Presence>) sessionFactory.getCurrentSession().createCriteria(Presence.class).list();

	}

	@Override
	public Presence getPresence(String sipuri) {
		// TODO Auto-generated method stub
		return (Presence) sessionFactory.getCurrentSession().get(Presence.class, sipuri);
	}

	@Override
	public void deletePresence(Presence presence) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().createQuery("DELETE FROM Presence WHERE presencesipuri = "+presence.getPresencesipuri()).executeUpdate();

	}


}
