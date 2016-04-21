package com.tcs.bean;

import java.util.ArrayList;

public class CallLogs 
{
	private String caller;
	private String callee;
	private String startTime;
	private String endTime;
	private String dayOfCall;
	ArrayList<String> caller1;
	ArrayList<String> callee1;
	ArrayList<String> startTime1;
	ArrayList<String> endTime1;
	ArrayList<String> dayOfCall1;
	
	public String getCaller() {
		return caller;
	}
	public void setCaller(String caller) {
		this.caller = caller;
	}
	public String getCallee() {
		return callee;
	}
	public void setCallee(String callee) {
		this.callee = callee;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getDayOfCall() {
		return dayOfCall;
	}
	public void setDayOfCall(String dayOfCall) {
		this.dayOfCall = dayOfCall;
	}
	public ArrayList<String> getCaller1() {
		return caller1;
	}
	public void setCaller1(ArrayList<String> caller1) {
		this.caller1 = caller1;
	}
	public ArrayList<String> getCallee1() {
		return callee1;
	}
	public void setCallee1(ArrayList<String> callee1) {
		this.callee1 = callee1;
	}
	public ArrayList<String> getStartTime1() {
		return startTime1;
	}
	public void setStartTime1(ArrayList<String> startTime1) {
		this.startTime1 = startTime1;
	}
	public ArrayList<String> getEndTime1() {
		return endTime1;
	}
	public void setEndTime1(ArrayList<String> endTime1) {
		this.endTime1 = endTime1;
	}
	public ArrayList<String> getDayOfCall1() {
		return dayOfCall1;
	}
	public void setDayOfCall1(ArrayList<String> dayOfCall1) {
		this.dayOfCall1 = dayOfCall1;
	}
	
}
