package com.webrtc.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.webrtc.model.Geolocation;


@Repository("geolocationDao")
public class GeolocationDaoImpl implements GeolocationDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	public void addGeolocation(Geolocation geolocation) {
		System.out.println(" geolocation dao ---------"+ geolocation.getGeodate()+ " "+ geolocation.getGeoLatitude()+""+geolocation.getGeoLongitude()+""+geolocation.getGeodate()+""+geolocation.getGeotime());
		sessionFactory.getCurrentSession().saveOrUpdate(geolocation);
	}

	@SuppressWarnings("unchecked")
	public List<Geolocation> listGeolocations() {
		return (List<Geolocation>) sessionFactory.getCurrentSession().createCriteria(Geolocation.class).list();
	}

	public Geolocation getGeolocation(String geosipuri) {
		return (Geolocation) sessionFactory.getCurrentSession().get(Geolocation.class, geosipuri);
	}

	public void deleteGeolocation(Geolocation geolocation) {
		sessionFactory.getCurrentSession().createQuery("DELETE FROM Geolocation WHERE geosipuri = "+geolocation.getGeodate()).executeUpdate();
	}




}