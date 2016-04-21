package com.tcs.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tcs.dao.interestsDAO;

/**
 * Servlet implementation class ProfessionalsController
 */

public class ProfessionalsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfessionalsController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String dName = request.getParameter("displayName");
		String sipuri = request.getParameter("name");
		String jobtitle = request.getParameter("jobtitle");
		String project = request.getParameter("project");
		String industry = request.getParameter("industry");
		
		System.out.println("inside post+++"+sipuri);

		interestsDAO details = new interestsDAO();
		int i=details.addToprofessionals(sipuri, jobtitle, project, industry);
		if(i>0)
		 {		
			 System.out.println("The values were added successfully");
			 response.sendRedirect("Dashboard.jsp");	
		 }
		 else
		 {
			 System.out.println("The values could not be added successfully");			
		 }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
