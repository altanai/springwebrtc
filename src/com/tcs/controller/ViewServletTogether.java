package com.tcs.controller;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;

import com.tcs.bean.Login;
import com.tcs.bean.geolocation;
import com.tcs.dao.writegeolocation;

public class ViewServletTogether extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ViewServletTogether() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		JSONObject jsonResponse = new JSONObject();
		try {
			HttpSession s=request.getSession();
			String sipUri=((Login)s.getAttribute("data")).getPrivateIdentity();
			System.out.println("fetching response");
			jsonResponse.put("Result", "OK");
			ArrayList<geolocation> glocationdata = new writegeolocation().viewgeolocationDetails(sipUri);
			ArrayList<JSONObject> name = new ArrayList<JSONObject>();
			ArrayList<JSONObject> latittudes = new ArrayList<JSONObject>();
			ArrayList<JSONObject> longitudes = new ArrayList<JSONObject>();
			for (geolocation current : glocationdata) {
				JSONObject object = new JSONObject();
				object.put("NAME", current.getSipuri().toUpperCase());
				name.add(object);
				
				object = new JSONObject();
				object.put("LATITUDE", current.getLatitude());
				latittudes.add(object);

				object = new JSONObject();
				object.put("LONGITUDE", current.getLongitude());
				longitudes.add(object);
			}
			jsonResponse.accumulate("NAMES", name);
			jsonResponse.accumulate("LATITUDES", latittudes);
			jsonResponse.accumulate("LONGITUDES", longitudes);
		} catch (JSONException e) {
			e.printStackTrace();
			jsonResponse = new JSONObject();
			try {
				jsonResponse.put("Error", "Error Fetching Data");
			} catch (JSONException e1) {
				e1.printStackTrace();
			}
		}
		System.out.println("writing response");
		response.setContentType("text/json");
		response.getWriter().println(jsonResponse.toString());

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession s=request.getSession();
		String sipUri=((Login)s.getAttribute("data")).getPrivateIdentity();
		System.out.println("sipuri in together"+sipUri);
		if ("traceFriendsTogether".equalsIgnoreCase(request
				.getParameter("action"))) {
			JSONObject jsonResponse = new JSONObject();
			try {
				System.out.println("fetching response");
				jsonResponse.put("Result", "OK");
				ArrayList<geolocation> glocationdata = new writegeolocation().viewgeolocationDetails(sipUri);
				ArrayList<JSONObject> name = new ArrayList<JSONObject>();
				ArrayList<JSONObject> latittudes = new ArrayList<JSONObject>();
				ArrayList<JSONObject> longitudes = new ArrayList<JSONObject>();
				for (geolocation current : glocationdata) {
					JSONObject object = new JSONObject();
					object.put("NAME", current.getSipuri().toUpperCase());
					name.add(object);
					
					object = new JSONObject();
					object.put("LATITUDE", current.getLatitude());
					latittudes.add(object);

					object = new JSONObject();
					object.put("LONGITUDE", current.getLongitude());
					longitudes.add(object);
				}
				jsonResponse.accumulate("NAMES", name);
				jsonResponse.accumulate("LATITUDES", latittudes);
				jsonResponse.accumulate("LONGITUDES", longitudes);
			} catch (JSONException e) {
				e.printStackTrace();
				jsonResponse = new JSONObject();
				try {
					jsonResponse.put("Error", "Error Fetching Data");
				} catch (JSONException e1) {
					e1.printStackTrace();
				}
			}
			System.out.println("writing response");
			response.setContentType("text/json");
			response.getWriter().println(jsonResponse.toString());
		}
	}

}
