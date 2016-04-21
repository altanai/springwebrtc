package com.webrtc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.webrtc.dao.OpenidDao;
import com.webrtc.model.Openid;

@Service("openidService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)

public class OpenidServiceImpl implements OpenidService {

	@Autowired
	private OpenidDao openidDao;
	
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void addOpenid(Openid openid) {
		
/*		System.out.println(" Openid Service Impl -- "+ openid.getOpenidsipuri()+
				" "+ openid.getOpenidfacebook()+" "+ openid.getOpenidgoogle()+ 
				" "+ openid.getOpenidyahoo());*/
		
		openidDao.addOpenid(openid);
	}

	/* 
	 * method to show list of all ebteries in openid table 
	 */
	public List<Openid> listOpenidss() {
		
		return openidDao.listOpenidss();
	}
	
	/* 
	 * method to show 1 enteries in openid table 
	 */
/*	public List<Openid> listOpenidss(String sipuri) {
		
		return openidDao.listOpenidss1(sipuri);
	}*/
	

	public Openid getOpenid(String	 sipuri) {
		return openidDao.getOpenid(sipuri);
	}
	
	public void deleteOpenid(Openid openid) {
		openidDao.deleteOpenid(openid);
	}



}
