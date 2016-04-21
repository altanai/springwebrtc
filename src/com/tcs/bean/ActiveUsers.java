package com.tcs.bean;

import java.util.HashMap;
import java.util.Map;

public class ActiveUsers {
	
	private static Map<String,String> activeUserMap=new HashMap<String, String>();

	public static Map<String, String> getActiveUserMap() {
		return activeUserMap;
	}

	public static void setActiveUserMap(Map<String, String> activeUserMap) {
		ActiveUsers.activeUserMap = activeUserMap;
	}

}
