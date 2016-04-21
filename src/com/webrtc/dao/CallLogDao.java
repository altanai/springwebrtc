package com.webrtc.dao;

import java.util.List;

import com.webrtc.model.Calllog;

public interface CallLogDao {
	
	public void addCall(Calllog calllog);

	public List<Calllog> listCalls();
	
	public Calllog getCall(int callid);
		
	
}
