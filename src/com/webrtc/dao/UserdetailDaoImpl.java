package com.webrtc.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.webrtc.model.Openid;
import com.webrtc.model.Userdetail;

@Repository("userdetailDao")
public class UserdetailDaoImpl implements UserdetailDao {

	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void addUserdetail(Userdetail userdetail) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().saveOrUpdate(userdetail);
	}

	@Override
	public List<Userdetail> listUserdetailss() {
		// TODO Auto-generated method stub
		return (List<Userdetail>) sessionFactory.getCurrentSession().createCriteria(Userdetail.class).list();
	}

	@Override
	public Userdetail getUserdetail(String sipuri) {
		// TODO Auto-generated method stub
		return (Userdetail) sessionFactory.getCurrentSession().get(Userdetail.class, sipuri);
	}

	@Override
	public void deleteUserdetail(Userdetail userdetail) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().createQuery("DELETE FROM Userdetail WHERE privateIdentity = "+userdetail.getUserdetailprivateIdentity()).executeUpdate();
	}
	
	@Override
	public List<Userdetail> loginUserdetail(String sipuri,String password) {
		// TODO Auto-generated method stub
		/*return (Userdetail) sessionFactory.getCurrentSession().get(Userdetail.class, sipuri);*/
		
		Criteria crit = sessionFactory.getCurrentSession().createCriteria(
				Userdetail.class);
		Criterion name = Restrictions.eq("userdetailprivateIdentity", sipuri);
		Criterion pwd = Restrictions.eq("userdetailpassword", password);

		crit.add(Restrictions.and(name, pwd));
		@SuppressWarnings("unchecked")
		List<Userdetail> l = crit.list();
		System.out.println(l);
		return l;
}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Userdetail> listUserdetailNotFriend(Userdetail userdetail) {
		// TODO Auto-generated method stub

		return sessionFactory
				.getCurrentSession()
				.createQuery(
						"From Userdetail where userdetailprivateIdentity not in (select contactfriend from Contact where contactsipuri='"
								+ userdetail.getUserdetailprivateIdentity()
								+ "') AND userdetailprivateIdentity not in( '"
								+ userdetail.getUserdetailprivateIdentity()
								+ "')").list();

	}
	
	}


