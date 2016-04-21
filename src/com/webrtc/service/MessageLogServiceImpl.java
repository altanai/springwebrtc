package com.webrtc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.webrtc.dao.MessageLogDao;
import com.webrtc.model.Messagelog;

@Service("messageLogService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class MessageLogServiceImpl implements MessageLogService {

	@Autowired
	private MessageLogDao messageLogDao;

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)

	public void addMessage(Messagelog messagelog) {
		messageLogDao.addMessage(messagelog);
		
	}


	public Messagelog getMessage(int messageid) {
		return messageLogDao.getMessage(messageid);
	}

	public List<Messagelog> listMessages() {
		return messageLogDao.listMessages();
	}
}