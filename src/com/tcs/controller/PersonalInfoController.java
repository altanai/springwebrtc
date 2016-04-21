package com.tcs.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tcs.dao.interestsDAO;

import setups.presentation_server;

/**
 * Servlet implementation class PersonalInfoController
 */

public class PersonalInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PersonalInfoController() {
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
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String dName = request.getParameter("displayName");
		String sipuri = request.getParameter("name");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String country = request.getParameter("country");
		String contactno = request.getParameter("contact");
		String profile = request.getParameter("profile");

		interestsDAO details = new interestsDAO();
		int i=details.addToUserinfo(sipuri, address, city, state, country, contactno,profile);
		if (i>0){
			response.sendRedirect("Dashboard.jsp");	
			/*response.sendRedirect("UserDetailsController?sipuri="+sipuri+"&name="+dName);	*/
		}
		else
		 {
			 System.out.println("Could not add personal details successfully");
		 }

	}

}
