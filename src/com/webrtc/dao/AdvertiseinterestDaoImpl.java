package com.webrtc.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.webrtc.bean.AdvertiseinterestBean;
import com.webrtc.model.Advertiseinterest;
import com.webrtc.model.Advertisementinterest;


@Repository("advertiseinterestDao")
public class AdvertiseinterestDaoImpl implements AdvertiseinterestDao{

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void addAdvertiseinterest(Advertiseinterest advertiseinterest){
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().saveOrUpdate(advertiseinterest);
	}

	@SuppressWarnings("unchecked")
	public List<Advertisementinterest> listAdvertisementinterestss() {
		// TODO Auto-generated method stub

		return (List<Advertisementinterest>) sessionFactory.getCurrentSession()
				.createCriteria(Advertisementinterest.class).list();

	}
	@SuppressWarnings("unchecked")
	public List<Advertiseinterest> listAdvertiseinterestss() {
		// TODO Auto-generated method stub

		return (List<Advertiseinterest>) sessionFactory.getCurrentSession()
				.createCriteria(Advertiseinterest.class).list();

	}


	@Override
	public Advertiseinterest  getAdvertiseinterest(String sipuri) {
		// TODO Auto-generated method stub
		return (Advertiseinterest) sessionFactory.getCurrentSession().get(Advertiseinterest.class,
				sipuri);
	}

	@Override
	public void deleteAdvertiseinterest(Advertiseinterest advertiseinterest) {
		// TODO Auto-generated method stub
		sessionFactory
				.getCurrentSession()
				.createQuery(
						"DELETE FROM Contact WHERE contactsipuri = '"
								+ advertiseinterest.getAdvertiseaccessories()
								+ "' and contactfriend='"
								+ advertiseinterest.getAdvertiseautomobile()+ "'")
				.executeUpdate();

	}

	@SuppressWarnings("unchecked")
	public void  editAdvertiseinterest(AdvertiseinterestBean advertiseinterestBean) {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery("select advertise"+advertiseinterestBean.getAccessories()+" from Advertiseinterest");
	List l=query.list();
	System.out.println("rupali===="+l.size());
	}
	@Override
	public void addAdvertisementinterest(Advertisementinterest advertisementinterest) {
		// TODO Auto-generated method stub
		
		String str=advertisementinterest.getAdvertisementsub1()+","+advertisementinterest.getAdvertisementsub2()+","+advertisementinterest.getAdvertisementsub3();
		Query query = sessionFactory.getCurrentSession().createQuery("from Advertiseinterest");
		List l=query.list();
		
		if(l.size()>0){
			
			sessionFactory
			.getCurrentSession()
			.createQuery(
					"UPDATE Advertiseinterest set  "
							+ advertisementinterest.getAdvertisementinterest()+"='"+str
							+ "' where SequenceNumber=1")
			.executeUpdate();
			
		}
		else{
			
			sessionFactory
			.getCurrentSession()
			.createSQLQuery(
					"INSERT into Advertiseinterest ("
							+ advertisementinterest.getAdvertisementinterest()+") values('"+str
							+ "' )")
			.executeUpdate();
		
		}
		
	}

}
