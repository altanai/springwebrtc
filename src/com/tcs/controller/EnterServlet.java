package com.tcs.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tcs.dao.LogDao;

/**
 * Servlet implementation class EnterServlet
 */
/*@WebServlet("/EnterServlet")*/
public class EnterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public EnterServlet() {
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
		RequestDispatcher rd = null;
		String action=request.getParameter("action");
		int iy=0;
		String msg="";
		if(action.equalsIgnoreCase("adduser")){
			String user=request.getParameter("username");
			String pass=request.getParameter("password");
			LogDao lg=new LogDao();
			lg.setUs(user);
			lg.setPw(pass);
			iy=lg.Kam();			
			if(iy==0)
			{	
				msg="User could not be added sucessfully";
				System.out.println("failure - user could not be added sucessfully ");
			}
			else{
				msg="User added sucessfully ";
				System.out.println("sucess - user added sucessfully ");
			}
		}
		else if (action.equalsIgnoreCase("removeuser"))
		{
			String user=request.getParameter("username1");
			LogDao lg=new LogDao();
			lg.setUs(user);

			iy=lg.Kam_remove(user);
			
			if(iy==0)
			{
				msg="User could not be removed sucessfully ";
				System.out.println("failure - User could not be removed ");
			}
			else{
				msg="User removed sucessfully ";
				System.out.println("sucess - user removed sucesfsuly ");
			}
		}
		request.setAttribute("msg", msg);
		request.getRequestDispatcher("admincontrolusers.jsp").include(request,response);
	}

}
