package com.webrtc.service;

import java.util.List;

import com.webrtc.model.Openid;


public interface OpenidService {
	
	public void addOpenid(Openid openid);

	public List<Openid> listOpenidss();
	
	public Openid getOpenid(String sipuri);
	
	public void deleteOpenid(Openid openid);
}
