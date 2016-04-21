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
import com.tcs.bean.QuestionBean;
import com.tcs.dao.MyLoginDao;
import com.tcs.dao.userstatusDAO;


public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("In do-get");
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Login> al=new ArrayList<Login>();

		RequestDispatcher rd = null;	//Creating an object of Request Dispatcher. 
		HttpSession session=request.getSession(false);

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
				rd = request.getRequestDispatcher("Last.jsp");
				rd.forward(request, response);	  
			}
		}
	     else if("updateProfile".equalsIgnoreCase(act))
	     {
	    	  	Login login=new Login();
	    	 	myLoginBean=new Login();
	    	 	myLoginBean.setPublicIdentity(request.getParameter("publicIdentity"));
			    myLoginBean.setDisplayName(request.getParameter("displayName"));
			    myLoginBean.setRealm(request.getParameter("realm"));
			    myLoginBean.setPrivateIdentity(request.getParameter("privateIdentity"));
			    if(myLoginDao.updateProfile(myLoginBean))
				  {
				    login=myLoginDao.getDetails(myLoginBean);
				  
				    JSONObject jsonResponse1=new JSONObject();
					  try{
						  jsonResponse1.put("Result","OK");
						  JSONObject updatePro= new JSONObject();
						  Login bean=new Login();
						  bean=(Login)session.getAttribute("data");
						  bean.setDisplayName(login.getDisplayName());
						  bean.setPublicIdentity(login.getPublicIdentity());
						  bean.setRealm(login.getRealm());
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
	   
		else if("viewFriend".equalsIgnoreCase(act))
		{
		      Login login=new Login();
			  myLoginBean.setPrivateIdentity(request.getParameter("friend"));
			  login =myLoginDao.getDetails(myLoginBean);
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
				Login login=new Login();
				ArrayList<String> friend=new ArrayList<String>();
				ArrayList<String> temp1=new ArrayList<String>();
				ArrayList<String> temp2=new ArrayList<String>();
				ArrayList<String> tempPresence=new ArrayList<String>();
				friend.add(request.getParameter("friendPrivateIdentity"));
				myLoginBean.setPrivateIdentityFrd(friend);
				
				myLoginBean.setPrivateIdentity(request.getParameter("privateIdentity"));
				myLoginBean.setPassword(request.getParameter("password"));
				 if(myLoginDao.addFriend(myLoginBean))
				 {
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

		else if("getProfilePic".equalsIgnoreCase(request.getParameter("action")))
			{
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
		 else if("delete".equalsIgnoreCase(act))
			{
				Login login=new Login();
				ArrayList<String> temp1=new ArrayList<String>();
				ArrayList<String> temp2=new ArrayList<String>();
				ArrayList<String> tempPresence=new ArrayList<String>();
				String friend1=request.getParameter("friend");
				String userLogedIn= request.getParameter("privateIdentity");
				myLoginBean.setPrivateIdentity(request.getParameter("privateIdentity"));
				myLoginBean.setPassword(request.getParameter("password"));
			     if(myLoginDao.deleteFrnd(userLogedIn,friend1))
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
							 JSONObject jsonResponseFrd1=new JSONObject();
							 ArrayList<JSONObject> frd=new ArrayList<JSONObject>();
							 ArrayList<JSONObject> notFrd=new ArrayList<JSONObject>();
							 
							 try{
								  jsonResponseFrd1.put("Result","OK");
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
								  jsonResponseFrd1.accumulate("Friends", frd);
								  jsonResponseFrd1.accumulate("NotFriends", notFrd);
								  response.setContentType("text/json");
								  response.getWriter().println(jsonResponseFrd1.toString());
								  System.out.println("**************************************************************");
							  }
							  catch(JSONException e){
								  e.printStackTrace();
							  }
							 
							 
						 }
			}
	     	
		else if (act.equalsIgnoreCase("logout")) 
		{	try{
			
			if(session.getAttribute("data")!=null){
				myLoginDao.logoutUser(((Login)session.getAttribute("data")).getPrivateIdentity());
				
				userstatusDAO statusdao=new userstatusDAO();
				statusdao.LogoutUpdateStatus(((Login) session.getAttribute("data")).getPrivateIdentity());
				
				session.setAttribute("data",null);
				session.setAttribute("ID",null);
				response.sendRedirect("Last.jsp");
			}
			else{
				response.sendRedirect("Login.jsp");
			}
		}
		
		catch(Exception e){
			response.sendRedirect("Login.jsp");
		}
		
		}
		else if("addfbfriend".equalsIgnoreCase(act))
		{
			MyLoginDao myDao=new MyLoginDao();
			Login data= (Login)session.getAttribute("data");
			boolean flag=myDao.addFriend(data.getPrivateIdentity(),request.getParameter("friendName").toString());
			
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

		else if(act.equalsIgnoreCase("getquestion")){
			QuestionBean questionBean= new QuestionBean();
			questionBean=myLoginDao.getAnswer("sip:"+request.getParameter("privateIdentity"));
			request.setAttribute("question", questionBean);
			request.setAttribute("sipUri", "sip:"+request.getParameter("privateIdentity"));
			request.getRequestDispatcher("ForgetPassword.jsp").forward(request,response);
		}
		else if(act.equalsIgnoreCase("checkAnswer"))
		{
			if(true){
			System.out.println("checking answe");
			QuestionBean questionBean= new QuestionBean();
			System.out.println(request.getParameter("privateIdentity"));
			questionBean=myLoginDao.getAnswer(request.getParameter("privateIdentity"));
			request.setAttribute("question", questionBean);
			request.setAttribute("message","Details submitted successfully");
			request.getRequestDispatcher("ForgetPassword.jsp").forward(request,response);
			}
			
		}	
	
		else if(act.equalsIgnoreCase("passCheck")){
			boolean flag=myLoginDao.resetPassword(request.getParameter("privateIdentity"),request.getParameter("password"));
			if(flag){
				request.setAttribute("message","Password has been changed successfully. Login to continue.");
				request.getRequestDispatcher("Login.jsp").forward(request,response);
			}
			else{
				request.setAttribute("message","Password could not be changed. Please try again.");
				request.getRequestDispatcher("Login.jsp").forward(request,response);
			}
		}
	}
}
	




	







	







	






	


