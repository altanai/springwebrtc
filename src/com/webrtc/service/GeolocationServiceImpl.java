package com.webrtc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.webrtc.dao.GeolocationDao;
import com.webrtc.model.Geolocation;

@Service("geolocationService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class GeolocationServiceImpl implements GeolocationService{

	@Autowired
	private GeolocationDao geolocationDao;
	
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void addGeolocation(Geolocation geolocation) {
		System.out.println(" geolocation service ---------"+ geolocation.getGeosipuri()+ " "+ geolocation.getGeoLatitude()+""+geolocation.getGeoLongitude()+""+geolocation.getGeodate()+""+geolocation.getGeotime());
		geolocationDao.addGeolocation(geolocation);
	}
	
	public List<Geolocation> listGeolocations() {
		return geolocationDao.listGeolocations();
	}

	public Geolocation getGeolocation(String sipuri) {
		Geolocation g =geolocationDao.getGeolocation(sipuri);
		
		/*System.out.println(" geolocation service read---------"+ g.getGeosipuri()+ " "+ g.getGeoLatitude()+""+g.getGeoLongitude()+""+g.getGeodate()+""+g.getGeotime());*/

		return g;
	}
	
	public void deleteGeolocation(Geolocation geolocation) {
		geolocationDao.deleteGeolocation(geolocation);
	}


}