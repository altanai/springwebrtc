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

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*
		 * System.out.println("hitting"); //String
		 * user=request.getParameter("user"); String user="sip:bob@tcs.com";
		 * writegeolocation wg=new writegeolocation(); ArrayList<geolocation>
		 * glocationdata= wg.viewgeolocationDetails(user);
		 * 
		 * request.setAttribute("glocationdata",glocationdata);
		 * 
		 * RequestDispatcher view =
		 * request.getRequestDispatcher("geolocationtogether.jsp");
		 * view.forward(request, response);
		 */
		/*
		 * JSONObject jsonResponse=new JSONObject(); try {
		 * System.out.println("fetching response"); String
		 * user="sip:bob@tcs.com";//request.getParameter("userId");
		 * jsonResponse.put("Result", "OK"); ArrayList<geolocation>
		 * glocationdata= new writegeolocation().viewgeolocationDetails(user);
		 * ArrayList<JSONObject> name=new ArrayList<JSONObject>();
		 * ArrayList<JSONObject> latittudes=new ArrayList<JSONObject>();
		 * ArrayList<JSONObject> longitudes=new ArrayList<JSONObject>();
		 * for(geolocation current:glocationdata) { JSONObject object=new
		 * JSONObject(); object.put("NAME",current.getFriendName());
		 * name.add(object);
		 * 
		 * object=new JSONObject(); object.put("LATITUDE",
		 * current.getLatitude()); latittudes.add(object);
		 * 
		 * object=new JSONObject(); object.put("LONGTITUDE",
		 * current.getLongitude()); longitudes.add(object); }
		 * jsonResponse.accumulate("NAMES",name);
		 * jsonResponse.accumulate("LATIUIDES", latittudes);
		 * jsonResponse.accumulate("LONGTITUDES", longitudes); } catch
		 * (JSONException e) { e.printStackTrace(); jsonResponse=new
		 * JSONObject(); try { jsonResponse.put("Error", "Error Fetching Data");
		 * } catch (JSONException e1) { e1.printStackTrace(); } }
		 * System.out.println("writing response");
		 * response.setContentType("text/json");
		 * response.getWriter().println(jsonResponse.toString());
		 */
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		if ("traceFriendsTogether".equalsIgnoreCase(request
				.getParameter("action"))) {
			JSONObject jsonResponse = new JSONObject();
			try {
				/*HttpSession session=request.getSession();
				 Login bean=new Login();
				 bean=(Login)session.getAttribute("data");
				String user =bean.getPrivateIdentity();
				System.out.println("user as in viewServletTogether"+);*/
				jsonResponse.put("Result", "OK");
				ArrayList<geolocation> glocationdata = new writegeolocation().viewgeolocationDetails("sip:ankur@tcs.com");
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
			//System.out.println("writing response");
			response.setContentType("text/json");
			response.getWriter().println(jsonResponse.toString());
		}
	}

}
