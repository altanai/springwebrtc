package com.webrtc.service;

import java.util.List;

import com.webrtc.model.Messagelog;

public interface MessageLogService {
	
	public void addMessage(Messagelog messagelog);

	public List<Messagelog> listMessages();
	
	public Messagelog getMessage(int messageid);

}
