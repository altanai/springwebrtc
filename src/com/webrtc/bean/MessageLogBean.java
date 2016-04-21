package com.webrtc.bean;

import java.util.Date;


public class MessageLogBean {
	private Integer id;
	private String sender;
	private String receiver;
	private Date date;

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}

	public String getSender()
	{
		return sender;
	}

	public void setSender(String sender)
	{
		this.sender=sender;
	}

	public String getReceiver()
	{
		return receiver;
	}

	public void setReceiver(String receiver)
	{
		this.receiver=receiver;
	}

	public Date getDate()
	{
		return date;
	}

	public void setDate(Date date)
	{
		this.date=date;
	}
}
