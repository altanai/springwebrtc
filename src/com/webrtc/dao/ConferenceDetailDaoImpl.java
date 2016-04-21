package com.webrtc.dao;

import java.util.Calendar;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.webrtc.bean.ConferenceDetailBean;
import com.webrtc.model.ConferenceDetail;

@Repository
public class ConferenceDetailDaoImpl implements ConferenceDetailDao {

	@Autowired
	 private SessionFactory sessionFactory;

	@Override
	public void addConferenceDetails(ConferenceDetailBean conferenceDetail) {
		
		System.out.println("inside conference dao");

		Calendar cal=Calendar.getInstance();
		ConferenceDetail conference=new ConferenceDetail();
		
		conference.setConfConferenceName(conferenceDetail.getConferenceName());
		conference.setConfHostName(conferenceDetail.getHost());
		conference.setConfConferenceId("CF"+cal.get(Calendar.YEAR)+ cal.get(Calendar.MONTH) +cal.get(Calendar.DATE));
		for(String member:conferenceDetail.getMembers()){
			System.out.println(member);
			conference.setConfMemberName(member);
			sessionFactory.getCurrentSession().saveOrUpdate(conference);
		}
		
	}
	
}
