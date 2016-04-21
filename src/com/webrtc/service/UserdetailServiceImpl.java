package com.webrtc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.webrtc.dao.UserdetailDao;
import com.webrtc.model.Userdetail;

@Service("userdetailService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class UserdetailServiceImpl implements UserdetailService {

	@Autowired
	private UserdetailDao userdetailDao;
	
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void addUserdetail(Userdetail userdetail) {
		// TODO Auto-generated method stub
		 userdetailDao.addUserdetail(userdetail);

	}


	@Override
	public Userdetail getUserdetail(String sipuri) {
		// TODO Auto-generated method stub
		return userdetailDao.getUserdetail(sipuri);
	}

	@Override
	public void deleteUserdetail(Userdetail userdetail) {
		// TODO Auto-generated method stub
		userdetailDao.deleteUserdetail(userdetail);
	}

	@Override
	public List<Userdetail> listUserdetailss() {
		// TODO Auto-generated method stub
		return userdetailDao.listUserdetailss();
	}

	public List<Userdetail> loginUserdetail(String sipuri, String password) {
	
		// TODO Auto-generated method stub
		/*Userdetail userdetailobj= new Userdetail();
		userdetailobj = userdetailDao.getUserdetail(sipuri);
		
		if( userdetailobj==null){
			return null;
		}
		
		else if(!userdetailobj.getUserdetailpassword().equalsIgnoreCase(password)){
			return null;
		}
		
		return (List<Userdetail>) userdetailobj;*/
		List<Userdetail> userdetailobj=userdetailDao.loginUserdetail(sipuri, password);
		
		if(userdetailobj==null||userdetailobj.size()==0){
			return null;
		}
		else if((!userdetailobj.get(0).getUserdetailprivateIdentity().equalsIgnoreCase(sipuri))
				||(!userdetailobj.get(0).getUserdetailpassword().equalsIgnoreCase(password))){
			return null;
		}
		return (List<Userdetail>) userdetailobj;
		
		/*return userdetailDao.loginUserdetail(sipuri,password);*/
	}
}
