package com.webrtc.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.webrtc.model.Calllog;

@Repository("callLogDao")
public class CallLogDaoImpl implements CallLogDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	public void addCall(Calllog calllog) {
		sessionFactory.getCurrentSession().saveOrUpdate(calllog);
		
	}


	public Calllog getCall(int callid) {
		return (Calllog) sessionFactory.getCurrentSession().get(Calllog.class, callid);

	}

	public List<Calllog> listCalls() {
		return (List<Calllog>) sessionFactory.getCurrentSession().createCriteria(Calllog.class).list();
	}
}
