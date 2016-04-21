package com.tcs.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tcs.dao.interestsDAO;

import setups.presentation_server;

/**
 * Servlet implementation class JobSeekersController
 */

public class JobSeekersController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JobSeekersController() {
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

		String dName = request.getParameter("displayName");
		String sipuri = request.getParameter("name");
		String qualification = request.getParameter("qualification");
		String field = request.getParameter("field");

		interestsDAO details = new interestsDAO();
		int i=details.addTojobseeker(sipuri, qualification, field);
		if(i>0)
		 {	
			 System.out.println("The values were added Successfully");
			 response.sendRedirect("Dashboard.jsp");	
		 }
		 else
		 {	
			 System.out.println("The values were not added Successfully");
		 }
	}

}
