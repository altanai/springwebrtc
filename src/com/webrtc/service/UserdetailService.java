package com.webrtc.service;

import java.util.List;

import com.webrtc.model.Userdetail;

public interface UserdetailService {

	public void addUserdetail(Userdetail userdetail);

	public List<Userdetail> listUserdetailss();
	
	public Userdetail getUserdetail(String sipuri);
	
	public void deleteUserdetail(Userdetail userdetail);
	
	public List<Userdetail> loginUserdetail(String sipuri, String password);
	
	public List<Userdetail> listUserdetailNotFriend(Userdetail userdetail);
}
