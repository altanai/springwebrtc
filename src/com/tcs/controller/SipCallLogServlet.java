package com.tcs.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.Locale;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONException;
import org.json.JSONObject;

import com.tcs.bean.CallLogs;
import com.tcs.bean.Login;
import com.tcs.dao.SipCallLogDao;

@WebServlet("/SipCallLogServlet")
public class SipCallLogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SipCallLogServlet() {
        // TODO Auto-generated constructor stub
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* JSONObject jsonResponseLogs=new JSONObject();
		 ArrayList<JSONObject> logs=new ArrayList<JSONObject>();
		 try{
			 SipCallLogDao dao=new SipCallLogDao();		 
			 HttpSession session=request.getSession(false);
			 Login login1=(Login)session.getAttribute("data");
			 CallLogs callLogLatest=dao.viewAllLogs(login1);//get the latest logs
			 Iterator i1=callLogLatest.getCaller1().iterator();
			 Iterator i2=callLogLatest.getCallee1().iterator();
			 Iterator i3=callLogLatest.getStartTime1().iterator();
			 Iterator i4=callLogLatest.getEndTime1().iterator();
			 Iterator i5=callLogLatest.getDayOfCall1().iterator();
			 jsonResponseLogs.put("Result","OK");
			 while(i1.hasNext()&& i2.hasNext()&& i3.hasNext()&& i4.hasNext()&& i5.hasNext())
			  {
				  JSONObject obj=new JSONObject();
				  obj.put("caller", i1.next());				  
				  obj.put("callee", i2.next());
				  obj.put("startTime",i3.next());
				  obj.put("endTime", i4.next());				 
				  obj.put("dayOfCall", i5.next());	
				  logs.add(obj);
			  }
			 jsonResponseLogs.accumulate("logs", logs);
			 response.setContentType("text/json");
			 response.getWriter().println(jsonResponseLogs.toString());
			 System.out.println("****************NEXT***********************");
		  }
		  catch(JSONException e){
			  e.printStackTrace();
		  }*/
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		int result=0;
		CallLogs callLog=new CallLogs();
		String day=formatDate(request.getParameter("startTime"));
		String startTime=formatTime(request.getParameter("startTime"));
		String endTime=formatTime(request.getParameter("endTime"));
		callLog.setCaller(request.getParameter("caller"));
		callLog.setCallee(request.getParameter("callee"));
		callLog.setDayOfCall(day);
		callLog.setStartTime(startTime);
		callLog.setEndTime(endTime);
		if(callLog.getCallee()!=null && callLog.getCallee()!="" && callLog.getCaller()!=null && callLog.getCaller()!="")
			result=new SipCallLogDao().addCallDetails(callLog);
		//Get call logs		 
		JSONObject jsonResponseLogs=new JSONObject();
		ArrayList<JSONObject> logs=new ArrayList<JSONObject>();
		try{
				SipCallLogDao dao=new SipCallLogDao();		 
				HttpSession session=request.getSession(false);
				Login login1=(Login)session.getAttribute("data");
				CallLogs callLogLatest=dao.viewAllLogs(login1);//get the latest logs
					
				Iterator i1=callLogLatest.getCaller1().iterator();
				Iterator i2=callLogLatest.getCallee1().iterator();
				Iterator i3=callLogLatest.getStartTime1().iterator();
				Iterator i4=callLogLatest.getEndTime1().iterator();
				Iterator i5=callLogLatest.getDayOfCall1().iterator();
				jsonResponseLogs.put("Result","OK");
				while(i1.hasNext()&& i2.hasNext()&& i3.hasNext()&& i4.hasNext()&& i5.hasNext())
					  {
						  JSONObject obj=new JSONObject();
						  obj.put("caller", i1.next());				  
						  obj.put("callee", i2.next());
						  obj.put("startTime", i3.next());
						  obj.put("endTime", i4.next());				 
						  obj.put("dayOfCall", i5.next());				  			 
						  logs.add(obj);
					  }
				jsonResponseLogs.accumulate("logs", logs);
				response.setContentType("text/json");
				response.getWriter().println(jsonResponseLogs.toString());
				System.out.println("****************NEXT***********************");
			 }
		  catch(JSONException e){
				e.printStackTrace();
		  }
	}
	
	private String formatDate(String milliseconds)
	{
		Long millisecs=Long.parseLong(milliseconds);// Parsing the String milliseconds to Long variable
		int style = DateFormat.MEDIUM; //Shows date as Jan 26,2013
		Date myDate=new Date(millisecs); //Creating a new Date Object using the milliseconds
		DateFormat df=DateFormat.getDateInstance(style,Locale.ENGLISH);
		String formattedDate=df.format(myDate);//FORMATTING THE DATE TO THE APPROPRIATE FORMAT
		System.out.println("formattedDate"+formattedDate);
		return formattedDate;            
	}
	private String formatTime(String milliseconds)
	{
		Long millisecs=Long.parseLong(milliseconds);// Parsing the String milliseconds to Long variable
		int style = DateFormat.MEDIUM; //Shows date as Jan 26,2013
		Date myTime=new Date(millisecs); //Creating a new Date Object using the milliseconds
		DateFormat df=DateFormat.getTimeInstance(style,Locale.ENGLISH);
		String formattedTime=df.format(myTime);//FORMATTING THE TIME TO THE APPROPRIATE FORMAT
		System.out.println("formattedTime"+formattedTime);
		return formattedTime;            
	}
}
