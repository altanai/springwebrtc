package com.tcs.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tcs.dao.emailmapping;
import com.tcs.dao.gmail;
import java.security.Security;
import java.util.Properties;

import javax.mail.*;
import javax.mail.Message.RecipientType;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;



/**
 * Servlet implementation class message
 */

public class messageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public messageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
		/*System.out.println("inside controller");
		String toAddress=request.getParameter("toAddress");
		System.out.println("to address"+toAddress);
		HttpSession session=request.getSession();
		
		session.setAttribute("toAddress", toAddress);
		response.sendRedirect("SentMessage.jsp");*/
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("in  doppost");
		String action=request.getParameter("submit");	
	    if(action.equals("Send_to_gmail")){
		//System.out.println(" message servlet  ");
		
	//	String sipurisender=request.getParameter("sipurisender");
		String sipurireceiver=request.getParameter("sipurireceiver");
		String message=request.getParameter("message");
        //System.out.println(" receiver and message "+ sipurireceiver+" "+message);
		emailmapping  emap=new emailmapping();
		String gmailidreceiver=emap.sipuritogmailid(sipurireceiver);
		
		
		String gmailidsender="tcscns@gmail.com";
		String gmailidpassword="tcs@123456";
		String gmailsubject = "WebRTC offline message ";
		
		
		gmail gm=new gmail();
		gm.sendemail(gmailidsender,gmailidpassword, gmailidreceiver,gmailsubject , message);
		
		/*response.sendRedirect(request.getContextPath()+"/../WebRTC_presentation/pageone/serviceofflinemessages.jsp");*/
    	response.sendRedirect("SentMessage.jsp");
		}
		if(action.equals("Send_to_facebook")){
			//System.out.println(" Facebook chat Servlet============================================>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  ");
			
			
			String sipurireceiver=request.getParameter("sipurireceiver");
			String message=request.getParameter("message"); 
			//System.out.println("receiver and message"+sipurireceiver+""+message);
			
			emailmapping  emap=new emailmapping();
			String facebookidreceiver=emap.sipuritofacebookid(sipurireceiver);
			
			
			String facebookidsender="tcscns@gmail.com";
			String facebookidpassword="tcs@123456";
			String facebooksubject = "WebRTC offline message ";
			
			
			gmail gm=new gmail();
			gm.sendemail(facebookidsender,facebookidpassword, facebookidreceiver,facebooksubject , message);
			
			response.sendRedirect("SentMessage.jsp");
		}
		
		if(action.equals("Send_to_yahoo")){
			System.out.println(" yahoo chat Servlet  ");
			
			
			String sipurireceiver=request.getParameter("sipurireceiver");
			String message=request.getParameter("message"); 
			//System.out.println("receiver and message"+sipurireceiver+""+message);
			emailmapping  emap=new emailmapping();
			String yahooidreceiver=emap.sipuritoyahooid(sipurireceiver);
			String yahooidsender="tcscns@gmail.com";
			String yahooidpassword="tcs@123456";
			String yahoosubject = "WebRTC offline message ";
			
			
			gmail gm=new gmail();
			gm.sendemail(yahooidsender,yahooidpassword, yahooidreceiver,yahoosubject , message);
			
			response.sendRedirect("SentMessage.jsp");
		}
		if(action.equals("Send_to_twitter")){
			//System.out.println(" twitter chat Servlet  ");
			
			
			String sipurireceiver=request.getParameter("sipurireceiver");
			String message=request.getParameter("message"); 
			System.out.println("receiver and message"+sipurireceiver+""+message);
			
			emailmapping  emap=new emailmapping();
			String twitteridreceiver=emap.sipuritotwitterid(sipurireceiver);
			
			
			String twitteridsender="tcscns@gmail.com";
			String twitteridpassword="tcs@123456";
			String twittersubject = "WebRTC offline message ";
			
			
			gmail gm=new gmail();
			gm.sendemail(twitteridsender,twitteridpassword, twitteridreceiver,twittersubject , message);
			
			response.sendRedirect("SentMessage.jsp");
		}
	}
	
	



}
