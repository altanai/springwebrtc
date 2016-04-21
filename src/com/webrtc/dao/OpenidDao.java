package com.webrtc.dao;

import java.util.List;

import com.webrtc.model.Openid;

public interface OpenidDao {
	
	public void addOpenid(Openid openid);

	public List<Openid> listOpenidss();
	
	public Openid getOpenid(String sipuri);
	
	public void deleteOpenid(Openid openid);
}
