package com.webrtc.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.webrtc.model.Openid;

@Repository("openidDao")
public class OpenidDaoImpl implements OpenidDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	public void addOpenid(Openid openid) {
		/*System.out.println(" Openid Dao Impl << Add >>-- "+ openid.getOpenidsipuri()+
				" "+ openid.getOpenidfacebook()+" "+ openid.getOpenidgoogle()+ 
				" "+ openid.getOpenidyahoo());*/
		
		sessionFactory.getCurrentSession().saveOrUpdate(openid);
	}

	@SuppressWarnings("unchecked")
	public List<Openid> listOpenidss() {
		
/*		System.out.println(" Openid Dao Impl << List openidss >>-- "+
				sessionFactory.getCurrentSession().createCriteria(Openid.class).list().size());*/
		
		return (List<Openid>) sessionFactory.getCurrentSession().createCriteria(Openid.class).list();
	}

	public Openid getOpenid(String sipuri) {
		return (Openid) sessionFactory.getCurrentSession().get(Openid.class, sipuri);
	}

	public void deleteOpenid(Openid openid) {
		sessionFactory.getCurrentSession().createQuery("DELETE FROM Openid WHERE sipuri = "+openid.getOpenidsipuri()).executeUpdate();
	}


}
