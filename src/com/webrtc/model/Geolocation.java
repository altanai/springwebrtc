package com.webrtc.model;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Time;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Geolocation")

public class Geolocation implements Serializable {

	
	
private static final long serialVersionUID = -723583058586873479L;
	
	@Id
	@Column(name = "geosipuri")
	private String geosipuri;
	
	@Column(name="geolatitude")
	private Long geoLatitude;
	
	@Column(name="geolongitude")
	private Long geoLongitude;
	
	@Column(name="geodate")
	private Date geodate;
	
	@Column(name="geotime")
	private Time geotime;

	public String getGeosipuri() {
		return geosipuri;
	}

	public void setGeosipuri(String geosipuri) {
		this.geosipuri = geosipuri;
	}

	public Long getGeoLatitude() {
		return geoLatitude;
	}

	public void setGeoLatitude(Long geolatitude) {
		this.geoLatitude = geolatitude;
	}

	public Long getGeoLongitude() {
		return geoLongitude;
	}

	public void setGeoLongitude(Long geoLongitude) {
		this.geoLongitude = geoLongitude;
	}

	public Date getGeodate() {
		return geodate;
	}

	public void setGeodate(Date geodate) {
		this.geodate = geodate;
	}

	public Time getGeotime() {
		return geotime;
	}

	public void setGeotime(Time geotime) {
		this.geotime = geotime;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	
	
}