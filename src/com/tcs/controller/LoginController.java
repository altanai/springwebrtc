package com.tcs.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tcs.bean.CallLogs;
import com.tcs.bean.Login;
import com.tcs.dao.MyLoginDao;
import com.tcs.dao.SipCallLogDao;
import com.tcs.dao.userstatusDAO;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginController() {
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
		String act = request.getParameter("action").toString();
		String id, password;
		HttpSession session = request.getSession(false);
		Login myLoginBean = new Login(); // Making an object of Service Class.
		CallLogs log=new CallLogs();
		MyLoginDao myLoginDao = new MyLoginDao();
		SipCallLogDao sipCallLogDao=new SipCallLogDao();
		RequestDispatcher rd = null;
		
		String button = request.getParameter("submit");
		PrintWriter out = response.getWriter();
	
		try {
			id = request.getParameter("userName"); // getting value of id from											// textfield of U.I.
			password = request.getParameter("password");// getting value of password from textfield of U.I.
			
			myLoginBean.setPrivateIdentity("sip:" + id);
			myLoginBean.setPassword(password);
			Login login = new Login();
			
			System.out.println("Button value in logincontroller"+button);
			
			if (button.equalsIgnoreCase("Login as Admin")) {
				if (id.equalsIgnoreCase("admin")
						&& password.equalsIgnoreCase("admin")) {
					rd = request.getRequestDispatcher("admincontrolusers.jsp");
					rd.forward(request, response);
				}
			}
			else if(button.equalsIgnoreCase("Login as User")){
					boolean flag = myLoginDao.verification(myLoginBean);
					if (flag) {
						
						userstatusDAO statusdao=new userstatusDAO();
						String status=statusdao.readStatus("sip:" + id);						
						
						if(status.equalsIgnoreCase("Inactive") || status==null  ){
							login = myLoginDao.getData(myLoginBean);
							log=sipCallLogDao.viewAllLogs(myLoginBean);
						//	System.out.println("DISPLAY NAME LoginCONTROLLER "+ login.getDisplayName());
							session = request.getSession(); // generating Session
							session.setAttribute("data", login);
							request.setAttribute("logs", log);
							
							statusdao.LoginupdateStatus("sip:" + id);
							
							request.getRequestDispatcher("Dashboard.jsp").forward(
									request, response);
						}
						else if (status.equalsIgnoreCase("Active")){
							request.setAttribute("error",
									"You alreday have an active session running, please sign off that to continue.");
							request.getRequestDispatcher("Login.jsp").forward(request, response);
						}
						

					} else {
						request.setAttribute("error",
								"Login id or password do not match.");
						rd = request.getRequestDispatcher("Login.jsp");
						rd.forward(request, response);
						// out.print("Incorrect user id or password");
					}			
			}
		}
		 catch (Exception e) {
			System.out.println(e);
		}	
	}
}