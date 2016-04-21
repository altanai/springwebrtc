package com.tcs.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tcs.bean.Login;
import com.tcs.dao.MyLoginDao;
import com.tcs.dao.facebooklogindao;

import com.tcs.dao.facebookchecksipuri;

/*import phonebook.userfriends;
 import contacts.webrtc.loaduserfrnds;

 import setups.presentation_server;
 import userprofile.beanclass.registration;*/

/**
 * Servlet implementation class facebooklogin
 */

public class googlelogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public googlelogin() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Status : Google loginservlet mtd :get");
		String username = request.getParameter("userName");
		username = username.toLowerCase();
		facebookchecksipuri fbcheck = new facebookchecksipuri();

		String check = null;
		check = fbcheck.checkexists(username);
		MyLoginDao myLoginDao = new MyLoginDao();
		Login login = new Login(); // Making an object of Service Class.
		HttpSession session = request.getSession(false);
		System.out.println(" user " + username + " on Google -->  ");
		System.out.println("Oauth Google " + username + " trying to log in");

		facebooklogindao fbdao = new facebooklogindao();
		String sipuri = fbdao.checkexists(username);
		System.out.println("sipuri in google servlet"+sipuri);

		if (sipuri != "" && sipuri != null) {
			login = myLoginDao.getDataFacebook(sipuri);
			session = request.getSession(); // generating Session
			session.setAttribute("data", login);
			request.getRequestDispatcher("Dashboard.jsp").forward(request,
					response);
		} else {
			request.getRequestDispatcher("Login.jsp")
					.forward(request, response);
		}
		System.out.println(" user trying to login through Oauth Fb is : "
				+ fbcheck);
		request.getRequestDispatcher("Dashboard.jsp")
				.forward(request, response);
	}

	/*
	 * ArrayList<registration>result=fbdao.login(sipuri); if (
	 * result.size()!=0){
	 * 
	 * 
	 * 
	 * read friends from File
	 * 
	 * userfriends ff=new userfriends(); ArrayList<registration>
	 * friendlist=ff.fetchallpresenecevalues();
	 * 
	 * System.out.println("friendlist size "+ friendlist.size()); String[]
	 * getfriends=new String[friendlist.size()];
	 * 
	 * for(int i=0;i<friendlist.size();i++)
	 * getfriends[i]=friendlist.get(i).getPrivateIdentity();
	 * 
	 * loaduserfrnds lf= new loaduserfrnds();
	 * lf.FriendsWriteToFile(result.get(0).getDisplayName(),getfriends);
	 * 
	 * redirect control to login session page
	 * 
	 * System.out.println(
	 * "------------------->login sucess , redirecting to login session" );
	 * response.sendRedirect(
	 * "loginsession?name="+result.get(0).getDisplayName()+
	 * "&pvt="+result.get(0).getPrivateIdentity()+
	 * "&pub="+result.get(0).getPublicIdentity()+
	 * "&pass="+result.get(0).getPassword()+ "&realm="+result.get(0).getRealm()+
	 * "&serverip="+serverip); } else{
	 * System.out.println("------------------->login failed" );
	 * response.sendRedirect("pageone/login.jsp"); } }
	 */

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
