package com.webrtc.service;

import java.util.List;

import com.webrtc.model.Calllog;

public interface CallLogService {
	
	public void addCall(Calllog calllog);

	public List<Calllog> listCalls();
	
	public Calllog getCall(int callid);
		

}
