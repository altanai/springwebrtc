package com.webrtc.dao;

import java.util.List;

import com.webrtc.model.Userdetail;

public interface UserdetailDao {

	public void addUserdetail(Userdetail userdetail);

	public List<Userdetail> listUserdetailss();
	
	public Userdetail getUserdetail(String sipuri);
	
	public void deleteUserdetail(Userdetail userdetail);
	
	public List<Userdetail> loginUserdetail(String sipuri, String password);

	/**
	 * @param userdetail
	 * @return
	 */
	public List<Userdetail> listUserdetailNotFriend(Userdetail userdetail);


}
