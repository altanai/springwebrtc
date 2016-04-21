package com.webrtc.dao;

import java.util.List;

import com.webrtc.model.Presence;

public interface PresenceDao {
	public void addPresence(Presence presence);

	public List<Presence> listPresencess();
	
	public Presence getPresence(String sipuri);
	
	public void deletePresence(Presence presence);

	/**
	 * @param sipuri
	 * @return
	 */
	
}
