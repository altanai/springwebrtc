package com.tcs.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tcs.bean.ConferenceDetails;
import com.tcs.bean.Login;
import com.tcs.dao.confpermission;

/**
 * Servlet implementation class ConferenceServlet
 */
@WebServlet("/ConferenceServlet")
public class ConferenceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       String room;
       String pass;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConferenceServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		HttpSession session = request.getSession(false);
		if("addConferenceDetails".equalsIgnoreCase(request.getParameter("action")))
		{
			ConferenceDetails conference=new ConferenceDetails();
			conference.setConferenceName(request.getParameter("conferenceName"));//Please set the values as per requirements
			conference.setHost(((Login)session.getAttribute("data")).getPrivateIdentity());
			//conference.setHost("sip:bob@tcs.com");
			conference.setMembers(request.getParameter("members").split("\\$"));
			for(String str:conference.getMembers())
			{
				System.out.println(str);
			}
			confpermission dao=new confpermission();
			boolean result=dao.addConferenceDetails(conference);
			if(result){
				System.out.println("Details added successfully");
			}
			else
				System.out.println("Details could not be added");
		}
		else if("checkSession".equalsIgnoreCase(request.getParameter("action"))){
			if(session.getAttribute("ID")==null){
				response.setContentType("text/html");
				response.getWriter().println("FALSE");
			}
			else{
				response.setContentType("text/html");
				response.getWriter().println("TRUE");
			}
		}
		
		
		
	}

}
