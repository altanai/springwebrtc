package com.webrtc.service;

import java.util.List;

import com.webrtc.model.Contact;

public interface ContactService {
	
	public void addContact(Contact contact);

	public List<Contact> listContactss();
	
	public Contact getContact(String sipuri);
	
	public void deleteContact(Contact contact);
}
