package com.tcs.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;

import com.tcs.bean.Notification;
import com.tcs.dao.NotificationDao;


/**
 * Servlet implementation class NotificationServlet
 */
@WebServlet("/NotificationServlet")
public class NotificationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NotificationServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if("getFreshNotifications".equalsIgnoreCase(request.getParameter("action")))
		{
			System.out.println("getting latest notifications");
			NotificationDao notifyDao=new NotificationDao();
			String user=request.getParameter("userId");
			System.out.println(user);
			ArrayList<Notification> listOfNotifications=notifyDao.getNotificationData(user);
			JSONObject jsonResponse=new JSONObject();
			try {
				jsonResponse.put("Result", "OK");
				ArrayList<JSONObject> jsonNotifications= new ArrayList<JSONObject>();
				for(Notification notify: listOfNotifications)
				{
					String notificationDetail="";
					JSONObject jsonNotification=new JSONObject();
					jsonNotification.put("ID",notify.getNotificationId());
					jsonNotification.put("TYPE",notify.getTypeOfNotification());
					if(notify.getTypeOfNotification().equalsIgnoreCase("VoiceMail")){
						notificationDetail=" left a new Voice-Mail for you.";
					}
					else if(notify.getTypeOfNotification().equalsIgnoreCase("Conference")){
						notificationDetail=" has invited you to join a Conference.";
					}
					jsonNotification.put("DETAILS",notify.getSender()+notificationDetail);
					
					jsonNotifications.add(jsonNotification);
				}
				jsonResponse.accumulate("Notifications", jsonNotifications);
				response.setContentType("text/json");
				response.getWriter().println(jsonResponse.toString());
			}catch (JSONException e) {
				e.printStackTrace();
			}
		}
		else if("updateNotificationStatus".equalsIgnoreCase(request.getParameter("action")))
		{
			System.out.println("updating status");
			NotificationDao notifyDao=new NotificationDao();
			String userId=request.getParameter("notificationId");
			boolean flag=notifyDao.updateNotificationStatus(userId);
			System.out.println(flag);
			response.setContentType("text/json");
			response.getWriter().println("notification status updated "+flag);
		}
	}
}
