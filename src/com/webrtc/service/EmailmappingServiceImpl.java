package com.webrtc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.webrtc.dao.EmailmappingDao;
import com.webrtc.model.Openid;

@Service("emailmappingService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class EmailmappingServiceImpl implements EmailmappingService{

	@Autowired
	private EmailmappingDao emailmappingDao;
	
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	
	@Override
	public Openid getopenidDetails(String sipuri) {
		// TODO Auto-generated method stub
		return emailmappingDao.getopenidDetails(sipuri);
	}

}
