package com.tcs.bean;

import java.text.DateFormat;
import java.util.Date;

public class ManageMsgBean {
	
	String sipuri;
	String status;
	String timestamp;
	String msgtext;
	
	public String getSipuri() {
		return sipuri;
	}
	public void setSipuri(String sipuri) {
		this.sipuri = sipuri;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(String timestamp) {
		this.timestamp = timestamp;
	}
	public String getMsgtext() {
		return msgtext;
	}
	public void setMsgtext(String msgtext) {
		this.msgtext = msgtext;
	}	
	private String formatDate(String timestamp)
	{
		Long millisecs=Long.parseLong(timestamp);// Parsing the String milliseconds to Long variable
		Date myDate=new Date(millisecs); //Creating a new Date Object using the milliseconds
		DateFormat df=DateFormat.getDateInstance(DateFormat.MEDIUM);
		String formattedDate=df.format(myDate);//FORMATTING THE DATE TO THE APPROPRIATE FORMAT
		return formattedDate;            
	}
	private String formatTime(String timestamp)
	{
		Long millisecs=Long.parseLong(timestamp);// Parsing the String milliseconds to Long variable
		Date myTime=new Date(millisecs); //Creating a new Date Object using the milliseconds
		DateFormat df=DateFormat.getTimeInstance();
		String formattedTime=df.format(myTime);//FORMATTING THE TIME TO THE APPROPRIATE FORMAT
		return formattedTime;            
	}

}
