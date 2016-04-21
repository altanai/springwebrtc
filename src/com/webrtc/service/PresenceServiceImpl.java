package com.webrtc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.webrtc.dao.PresenceDao;
import com.webrtc.model.Contact;
import com.webrtc.model.Presence;

@Service("presenceService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)

public class PresenceServiceImpl implements PresenceService {
	@Autowired
	private PresenceDao presenceDao;
	
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	@Override
	public void addPresence(Presence presence) {
		// TODO Auto-generated method stub
		presenceDao.addPresence(presence);
	}

	@Override
	public List<Presence> listPresencess() {
		// TODO Auto-generated method stub
		return presenceDao.listPresencess();
	}

	@Override
	public Presence getPresence(String sipuri) {
		// TODO Auto-generated method stub
		return presenceDao.getPresence(sipuri);
	}

	@Override
	public void deletePresence(Presence presence) {
		// TODO Auto-generated method stub
		presenceDao.deletePresence(presence);
	}

	

}
