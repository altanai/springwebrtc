package com.tcs.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.tcs.bean.Login;
import com.tcs.bean.geolocation;
import com.tcs.dao.writegeolocation;

public class GeolocationstoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public GeolocationstoreServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("GeolocationstoreServlet (get) ....");	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		writegeolocation wg=new writegeolocation();
		String act=request.getParameter("action").toString();
		System.out.println(act);
		JSONObject jsonResponse=new JSONObject();
		String serverReplyGeo="";
		if("shareMyLoc".equalsIgnoreCase(act)){
			serverReplyGeo="";
			String sipuri=request.getParameter("sipuri");
			String latitude=request.getParameter("latitude");
			String longitude=request.getParameter("longitude");
			String date=request.getParameter("date");
			String time=request.getParameter("time");
			
			geolocation gdata=new geolocation(sipuri,latitude,longitude,date,time);
			int result= wg.addgeolocationDetails(gdata);
			if(result>0)
				serverReplyGeo="Your geolocation has been shared successfully";
			else
				serverReplyGeo="Your geolocation could not be shared.Please try again.";
			try{
				  jsonResponse.put("Result","OK");
				  JSONObject objDelete= new JSONObject();
				  objDelete.put("serverReply", serverReplyGeo);
				  jsonResponse.put("recordUpdated", objDelete);
				  response.setHeader("content-application", "text/json");
				  response.getWriter().println(jsonResponse.toString());
				  
			  }
			  catch(JSONException e){
				  e.printStackTrace();
			  }
		}
		else if("unshareMyLoc".equalsIgnoreCase(act)){
			String sipuri=request.getParameter("sipuri");			
			int result=wg.removeLoc(sipuri);
			if(result>0&&result!=100)
				serverReplyGeo="Your geolocation has been unshared successfully";
			else if(result==0&&result!=100)
				serverReplyGeo="Your geolocation could not be shared. Please try again.";
			else if(result==100)
				serverReplyGeo="Your geolocation has never been shared.";
			try{
				  jsonResponse.put("Result","OK");
				  JSONObject objDelete= new JSONObject();
				  objDelete.put("serverReplyGeo", serverReplyGeo);
				  jsonResponse.put("recordUpdated", objDelete);
				  response.setHeader("content-application", "text/json");
				  response.getWriter().println(jsonResponse.toString());
				  
			  }
			  catch(JSONException e){
				  e.printStackTrace();
			  }
		}
    }
}
