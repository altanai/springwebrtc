package com.webrtc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.webrtc.bean.AdvertiseinterestBean;
import com.webrtc.dao.AdvertiseinterestDao;
import com.webrtc.model.Advertiseinterest;
import com.webrtc.model.Advertisementinterest;

@Service("advertiseinterestService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class AdvertiseinterestServiceImpl implements AdvertiseinterestService{
	@Autowired
	private AdvertiseinterestDao advertiseinterestDao;
	
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	@Override
	public void addAdvertiseinterest(Advertiseinterest advertiseinterest) {
		// TODO Auto-generated method stub
		advertiseinterestDao.addAdvertiseinterest(advertiseinterest);
	}

	@Override
	public List<Advertisementinterest> listAdvertisementinterestss() {
		// TODO Auto-generated method stub
		return advertiseinterestDao.listAdvertisementinterestss();
	}

	@Override
	public Advertiseinterest getAdvertiseinterest(String sipuri) {
		// TODO Auto-generated method stub
		
		return advertiseinterestDao.getAdvertiseinterest(sipuri);
	}

	@Override
	public void deleteAdvertiseinterest(Advertiseinterest advertiseinterest) {
		// TODO Auto-generated method stub
		advertiseinterestDao.deleteAdvertiseinterest(advertiseinterest);
	}

	@Override
	public void addAdvertisementinterest(
			Advertisementinterest advertisementinterest) {
		// TODO Auto-generated method stub
		advertiseinterestDao.addAdvertisementinterest(advertisementinterest);
		
	}

	@Override
	public List<Advertiseinterest> listAdvertiseinterestss() {
		// TODO Auto-generated method stub
		return advertiseinterestDao.listAdvertiseinterestss();
	}

	
	@Override
	public void  editAdvertiseinterest(AdvertiseinterestBean advertiseinterestBean) {
		// TODO Auto-generated method stub
		advertiseinterestDao.editAdvertiseinterest(advertiseinterestBean);
	}

}