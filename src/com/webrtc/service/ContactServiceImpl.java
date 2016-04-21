package com.webrtc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.webrtc.dao.ContactDao;
import com.webrtc.model.Contact;

@Service("contactService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)

public class ContactServiceImpl implements ContactService {

	@Autowired
	private ContactDao contactDao;
	
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	@Override
	public void addContact(Contact contact) {
		// TODO Auto-generated method stub
		contactDao.addContact(contact);
	}

	@Override
	public List<Contact> listContactss(String sipuri) {
		// TODO Auto-generated method stub
		return contactDao.listContactss(sipuri);
	}

	@Override
	public Contact getContact(String sipuri) {
		// TODO Auto-generated method stub
		
		return contactDao.getContact(sipuri);
	}

	@Override
	public void deleteContact(Contact contact) {
		// TODO Auto-generated method stub
		contactDao.deleteContact(contact);
	}

}
