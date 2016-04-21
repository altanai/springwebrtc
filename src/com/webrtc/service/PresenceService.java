package com.webrtc.service;

import java.util.List;

import com.webrtc.model.Presence;

public interface PresenceService {

	public void addPresence(Presence presence);

	public List<Presence> listPresencess();
	
	public Presence getPresence(String sipuri);
	
	public void deletePresence(Presence presence);

	
}
