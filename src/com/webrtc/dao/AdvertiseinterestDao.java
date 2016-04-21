package com.webrtc.dao;

import java.util.List;

import com.webrtc.bean.AdvertiseinterestBean;
import com.webrtc.model.Advertiseinterest;
import com.webrtc.model.Advertisementinterest;

public interface AdvertiseinterestDao {

	public void addAdvertiseinterest(Advertiseinterest advertiseinterest);

	public List<Advertisementinterest> listAdvertisementinterestss();
	
	public List<Advertiseinterest> listAdvertiseinterestss();
	
	public Advertiseinterest getAdvertiseinterest(String sipuri);
	
	public void deleteAdvertiseinterest(Advertiseinterest advertiseinterest);
	
	public void  editAdvertiseinterest(AdvertiseinterestBean advertiseinterestBean);
	
	public void addAdvertisementinterest(Advertisementinterest advertisementinterest);
}
