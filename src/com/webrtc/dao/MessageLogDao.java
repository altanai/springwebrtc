package com.webrtc.dao;

import java.util.List;

import com.webrtc.model.Messagelog;

public interface MessageLogDao {
	
	public void addMessage(Messagelog messagelog);

	public List<Messagelog> listMessages();
	
	public Messagelog getMessage(int messageid);

}
