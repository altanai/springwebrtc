package com.webrtc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.webrtc.bean.ConferenceDetailBean;
import com.webrtc.dao.ConferenceDetailDao;



@Service("conferenceDetailService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class ConferenceDetailServiceImpl implements ConferenceDetailService {
	
	@Autowired
	private ConferenceDetailDao conferenceDetailDao;
	
	

	@Override
	public void addConferenceDetail(ConferenceDetailBean conferenceDetail) {
		System.out.println("inside conference service");
		conferenceDetailDao.addConferenceDetails(conferenceDetail);
	}

	


}
