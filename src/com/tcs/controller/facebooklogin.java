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

/**
 * Servlet implementation class facebooklogin
 */

public class facebooklogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public facebooklogin() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	
		String userName = request.getParameter("userName");
		System.out.println(userName);
		MyLoginDao myLoginDao = new MyLoginDao();
		Login login= new Login(); // Making an object of Service Class.
		HttpSession session = request.getSession(false);
		if (userName != null) {

			String username = userName;
			username = username.toLowerCase();
			String[] array = username.split(" ");
			String user_firstname = array[0];
			String user_lastname = array[1];

			facebooklogindao fbcheck = new facebooklogindao();
			String sipuri = fbcheck.checkexists(user_firstname);
			System.out.println("sipuri"+sipuri);
			// call all the login methods related to login
			
			if (sipuri != "") {				
				 login=myLoginDao.getDataFacebook(sipuri);
	    		 session=request.getSession();	//generating Session
	    		 session.setAttribute("data", login);
	    		 request.getRequestDispatcher("Dashboard.jsp").forward(request,response);
	    	 }
	    	 else{
	    		 request.getRequestDispatcher("Login.jsp").forward(request,response);
	    	 }
				System.out.println(" user trying to login through Oauth Fb is : "+ fbcheck);
				request.getRequestDispatcher("Dashboard.jsp").forward(request,response);
			} else {
				System.out.println("------------------->login failed");
				response.sendRedirect("Login.jsp");
			}
		}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
