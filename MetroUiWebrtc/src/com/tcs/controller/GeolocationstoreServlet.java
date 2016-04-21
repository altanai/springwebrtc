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
		// TODO Auto-generated method stub
		//System.out.println("GeolocationstoreServlet (post) ....");
		String act=request.getParameter("action").toString();
		if("shareMyLoc".equalsIgnoreCase(act)){
			//System.out.println("GeolocationstoreServlet (post) shareMyLoc....");
			
			String sipuri=request.getParameter("sipuri");
			String latitude=request.getParameter("latitude");
			String longitude=request.getParameter("longitude");
			String date=request.getParameter("date");
			String time=request.getParameter("time");
			
			//System.out.println("-->"+sipuri+" "+latitude+longitude);
			//System.out.println("--"+ date + time);
			
			geolocation gdata=new geolocation(sipuri,latitude,longitude,date,time);
			
			writegeolocation wg=new writegeolocation();
			int result= wg.addgeolocationDetails(gdata);
			//System.out.println(" Lines inserted  "+ result);
		}
    }
}
