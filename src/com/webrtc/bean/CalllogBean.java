package com.webrtc.bean;

import java.util.Date;


public class CalllogBean {
	private Integer id;
	private String caller;
	private String callee;
	private Date date;

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}

	public String getCaller()
	{
		return caller;
	}

	public void setCaller(String caller)
	{
		this.caller=caller;
	}

	public String getCallee()
	{
		return callee;
	}

	public void setCallee(String callee)
	{
		this.callee=callee;
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
