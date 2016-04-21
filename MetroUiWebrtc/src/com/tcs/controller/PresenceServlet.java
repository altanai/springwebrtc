package com.tcs.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tcs.dao.MyLoginDao;



/**
 * Servlet implementation class PresenceServlet
 */
@WebServlet("/PresenceServlet")
public class PresenceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PresenceServlet() {
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
		
		
		
		
		System.out.println(" Writing presence ");
		
		String values[][]=new String[20][2];
		
				int i=0;
			  
				values[i][0]=request.getParameter("friend1");
				values[i][1]=request.getParameter("friend1status");
		
	
		/*values[0][0]=request.getParameter("friend1"); values[0][1]=request.getParameter("friend1status");*/
		//values[1][0]=request.getParameter("friend2"); values[1][1]=request.getParameter("friend2status");
	
		
			System.out.println("New user is "+values[i][0]+" || new status is"+values[i][1]);
			
			
		   MyLoginDao pd=new MyLoginDao();
			pd.writepresence(values[i][0],values[i][1]);			
			
			i++;
		/*int res=new Logic().dosomething(values);

				
		if(res>0)
		{
			response.setContentType("text/xml");
			response.getWriter().println("Action Completed Successfully!");
		}
		else
		{
			response.setContentType("text/xml");
			response.getWriter().println("Action Could not be completed Successfully!");
		}*/
		
		
	}
	

		
		
		
		
		
		
		
		
		
		
		
		// TODO Auto-generated method stub
	}


