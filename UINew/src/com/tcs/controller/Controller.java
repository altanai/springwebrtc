package com.tcs.controller;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;

import com.tcs.bean.Login;
import com.tcs.dao.MyLoginDao;


public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("In do-get");
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Login> al=new ArrayList<Login>();
		
		RequestDispatcher rd = null;	//Creating an object of Request Dispatcher. 
		HttpSession session=request.getSession();
	/*		
		response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
		response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
		response.setDateHeader("Expires", 1); //Causes the proxy cache to see the page as "stale"
		response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
		System.out.println("In controller");*/
		Login myLoginBean= new Login();
		 MyLoginDao myLoginDao=new MyLoginDao();
		 String act=request.getParameter("action").toString();
	    System.out.println("Action"+act);
	    
	     	if("registration".equalsIgnoreCase(act))
	     	{
			myLoginBean.setPublicIdentity(request.getParameter("publicIdentity"));
			System.out.println("publicIdentity"+request.getParameter("publicIdentity"));
		    myLoginBean.setPrivateIdentity(request.getParameter("privateIdentity"));
		    myLoginBean.setPassword(request.getParameter("password"));
		    myLoginBean.setDisplayName(request.getParameter("displayName"));
		    myLoginBean.setAnswer(request.getParameter("secretAnswer"));
		    myLoginBean.setSecretQuestion(request.getParameter("secretQuestion"));
		    myLoginBean.setRealm(request.getParameter("realm"));
		  if(myLoginDao.register(myLoginBean))
		  {
			  rd = request.getRequestDispatcher("Login.jsp");
			  rd.forward(request, response);	  
		  }
		}
	     else if("login".equalsIgnoreCase(act))
		{	
	    	 Login login=new Login();
			System.out.println("in login block");
			myLoginBean.setPrivateIdentity(request.getParameter("userName"));
			System.out.println(request.getParameter("userName"));
			myLoginBean.setPassword(request.getParameter("password"));
			  if(myLoginDao.verification(myLoginBean))
			  {
			   login=myLoginDao.getData(myLoginBean);
			   System.out.println("DISPLAY NAME CONTROLLER "+login.getDisplayName());
			   session=request.getSession();	//generating Session
			   session.setAttribute("data", login);
			   request.getRequestDispatcher("Dashboard.jsp").forward(request,response);
			  }
			  else{
				  request.getRequestDispatcher("Login.jsp").forward(request,response);
			  }
		}
	     	
	     else if("updateProfile".equalsIgnoreCase(act))
	     {
	    	 	//System.out.println("in updateProfile Method");
	    	  	Login login=new Login();
	    	 	//System.out.println("updateProfile");
	    	 	myLoginBean=new Login();
	    	 	myLoginBean.setPublicIdentity(request.getParameter("publicIdentity"));
				//System.out.println("publicIdentity"+request.getParameter("publicIdentity"));
			    myLoginBean.setDisplayName(request.getParameter("displayName"));
			    myLoginBean.setRealm(request.getParameter("realm"));
			    myLoginBean.setPrivateIdentity(request.getParameter("privateIdentity"));
			    if(myLoginDao.updateProfile(myLoginBean))
				  {
				    login=myLoginDao.getDetails(myLoginBean);
				    //System.out.println(login.getDisplayName());
				    JSONObject jsonResponse1=new JSONObject();
					  try{
						  jsonResponse1.put("Result","OK");
						  JSONObject updatePro= new JSONObject();
						  Login bean=new Login();
						  bean=(Login)session.getAttribute("data");
						  bean.setDisplayName(login.getDisplayName());
						  bean.setPublicIdentity(login.getPublicIdentity());
						  //System.out.println("**************************");
						  bean.setRealm(login.getRealm());
						  //System.out.println(bean.getRealm());
						  session.setAttribute("data", bean);
						  updatePro.put("DisplayNameUpdated", login.getDisplayName());
						  updatePro.put("PublicIdentityUpdated",login.getPublicIdentity());
						  updatePro.put("RealmUpdated", login.getRealm());
						  jsonResponse1.put("recordUpdated", updatePro);
						  response.setHeader("content-application", "text/json");
						  response.getWriter().println(jsonResponse1.toString());
						  
					  }
					  catch(JSONException e){
						  e.printStackTrace();
					  }
				    
				    
				  }
	     }
	   
		else 	if("viewFriend".equalsIgnoreCase(act))
		{
		      Login login=new Login();
			  myLoginBean.setPrivateIdentity(request.getParameter("friend"));
			  login =myLoginDao.getDetails(myLoginBean);
			  //System.out.println(login.getDisplayName());
			  JSONObject jsonResponse=new JSONObject();
			  try{
				  jsonResponse.put("Result","OK");
				  JSONObject friend= new JSONObject();
				  friend.put("DisplayName", login.getDisplayName());
				  friend.put("PrivateIdentity", login.getPrivateIdentity());
				  friend.put("PublicIdentity",login.getPublicIdentity());
				  friend.put("Realm", login.getRealm());
				  jsonResponse.put("record", friend);
				  response.setHeader("content-application", "text/json");
				  response.getWriter().println(jsonResponse.toString());
			  }
			  catch(JSONException e){
				  e.printStackTrace();
			  }
		}
		 else if("addFriend".equalsIgnoreCase(act))
			{	
				//System.out.println("inaddFriend**********************************************");
				//System.out.println(act);
				Login login=new Login();
				ArrayList<String> friend=new ArrayList<String>();
				ArrayList<String> temp1=new ArrayList<String>();
				ArrayList<String> temp2=new ArrayList<String>();
				ArrayList<String> tempPresence=new ArrayList<String>();
				friend.add(request.getParameter("friendPrivateIdentity"));
				//System.out.println(friend.add(request.getParameter("notFriend")));
				myLoginBean.setPrivateIdentityFrd(friend);
				
				myLoginBean.setPrivateIdentity(request.getParameter("privateIdentity"));
				myLoginBean.setPassword(request.getParameter("password"));
				//System.out.println(request.getParameter("password"));
				 if(myLoginDao.addFriend(myLoginBean))
				 {
					 login=myLoginDao.getData(myLoginBean);
               // System.out.println("hi.......................................................................");					 
					 for(String frd:login.getPrivateIdentityFrd())
					 {
						 temp1.add(frd);
					 }
					 for(String Notfrd:login.getPrivateIdentityNotFrd())
					 {
						 temp2.add(Notfrd);
					 }
					 for(String presence: login.getPresenceStatus())
					 {
						 System.out.println(presence);
						 tempPresence.add(presence);
					 }
					 JSONObject jsonResponseFrd=new JSONObject();
					 ArrayList<JSONObject> frd=new ArrayList<JSONObject>();
					 ArrayList<JSONObject> notFrd=new ArrayList<JSONObject>();
					 
					 try{
						  jsonResponseFrd.put("Result","OK");
						  for(int i=0;i<temp1.size();i++)
						  {
							  JSONObject obj=new JSONObject();
							  obj.put("NAME", temp1.get(i));
							  obj.put("STATUS", tempPresence.get(i));
							  frd.add(obj);
						  }
						  for(String frnd:temp2)
						  {
							  JSONObject obj=new JSONObject();
							  obj.put("Name", frnd);
							  notFrd.add(obj);
						  }
						  jsonResponseFrd.accumulate("Friends", frd);
						  jsonResponseFrd.accumulate("NotFriends", notFrd);
						  response.setContentType("text/json");
						  response.getWriter().println(jsonResponseFrd.toString());
						  System.out.println("**************************************************************");
					  }
					  catch(JSONException e){
						  e.printStackTrace();
					  }
					 
					 
				 }
			}

	
	     	
		else if("getProfilePic".equalsIgnoreCase(request.getParameter("action")))
			{
				//System.out.println("Getting Profile Pic");
				Login person=new MyLoginDao().getUserProfilePic(request.getParameter("id"));
				if(person==null)
				{
					System.out.println("No Record Found");
					return;
				}
				response.setContentType("image/jpeg");
				response.setContentLength(person.getProfilepic().length);
				response.getOutputStream().write(person.getProfilepic());
			}
	     	
		else if (act.equalsIgnoreCase("logout")) 
		{
			//System.out.println("Logout");
			session.setAttribute("data", null);
			session.invalidate();
			//System.out.println("Logged out successfully");
			response.sendRedirect("Login.jsp");
		
		}
		else if(act.equalsIgnoreCase("getFreshData"))
		{
			Login login=new Login();
			
			ArrayList<String> temp1=new ArrayList<String>();
			ArrayList<String> temp2=new ArrayList<String>();
			ArrayList<String> tempPresence=new ArrayList<String>();
			
			myLoginBean.setPrivateIdentity(request.getParameter("privateIdentity"));
			myLoginBean.setPassword(request.getParameter("password"));

			login=myLoginDao.getData(myLoginBean);
			for(String frd:login.getPrivateIdentityFrd())
			{
				temp1.add(frd);
			}
			for(String Notfrd:login.getPrivateIdentityNotFrd())
			{
				temp2.add(Notfrd);
			}
			for(String presence: login.getPresenceStatus())
			{
				System.out.println(presence);
				tempPresence.add(presence);
			}
			JSONObject jsonResponseFrd=new JSONObject();
			ArrayList<JSONObject> frd=new ArrayList<JSONObject>();
			ArrayList<JSONObject> notFrd=new ArrayList<JSONObject>();

			try{
				jsonResponseFrd.put("Result","OK");
				for(int i=0;i<temp1.size();i++)
				{
					JSONObject obj=new JSONObject();
					obj.put("NAME", temp1.get(i));
					obj.put("STATUS", tempPresence.get(i));
					frd.add(obj);
				}
				for(String frnd:temp2)
				{
					JSONObject obj=new JSONObject();
					obj.put("Name", frnd);
					notFrd.add(obj);
				}
				jsonResponseFrd.accumulate("Friends", frd);
				jsonResponseFrd.accumulate("NotFriends", notFrd);
				response.setContentType("text/json");
				response.getWriter().println(jsonResponseFrd.toString());
				System.out.println("**************************************************************");
			}
			catch(JSONException e){
				e.printStackTrace();
			}
		}
	}
}
	




	


