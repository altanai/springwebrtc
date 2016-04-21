package com.tcs.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tcs.bean.Login;
import com.tcs.dao.detailsDAO;

public class UserDetailsController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserDetailsController() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);	
		Login myLoginBean =new Login(); 
		myLoginBean=(Login)session.getAttribute("data");
		String sipuri = myLoginBean.getPrivateIdentity();
		String name=myLoginBean.getDisplayName();

		ArrayList<String> list = new ArrayList<String>();
		detailsDAO details = new detailsDAO();	
		
		list.addAll(details.findUserInfo(sipuri));
		list.addAll(details.findStudents(sipuri));
		list.addAll(details.findJobseekers(sipuri));
		list.addAll(details.findProfessionals(sipuri));

		request.setAttribute("details", list);

		RequestDispatcher rd = request
				.getRequestDispatcher("Dashboard.jsp?displayName="+name+"&privateIdentity="+sipuri);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

}
