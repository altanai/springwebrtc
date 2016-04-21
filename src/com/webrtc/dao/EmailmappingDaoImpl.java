package com.webrtc.dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.webrtc.model.Openid;

@Repository("emailmappingDao")
public class EmailmappingDaoImpl implements EmailmappingDao {

	
	@Autowired
	private SessionFactory sessionFactory;
	
	 @Override
	public Openid getopenidDetails(String sipuri) {
		// TODO Auto-generated method stub
		return (Openid) sessionFactory.getCurrentSession().get(Openid.class, sipuri);
	}
	

	
}
