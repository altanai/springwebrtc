package com.webrtc.dao;

import java.util.List;

import com.webrtc.model.Geolocation;

public interface GeolocationDao {

	
	public void addGeolocation(Geolocation geolocation);

	public List<Geolocation> listGeolocations();
	
	public Geolocation getGeolocation(String sipUri);
	
	public void deleteGeolocation(Geolocation geolocation);
	
}