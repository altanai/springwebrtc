package com.tcs.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tcs.bean.Login;
import com.tcs.bean.openLinkBean;
import com.tcs.dao.openLinkDao;

/**
 * Servlet implementation class openLinkServlet
 */
@WebServlet("/openLinkServlet")
public class openLinkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public openLinkServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String msg="";
		RequestDispatcher rd = null;
		HttpSession session=request.getSession();
		Login userDetails = (Login)session.getAttribute("data");	
		String fromPage=request.getParameter("fromPage").toString();
		openLinkBean acc=new openLinkBean();
		openLinkDao tpdao=new openLinkDao();
		
		if(fromPage.equalsIgnoreCase("Dashboard")){
			acc=tpdao.getAccountDetails(userDetails.getPrivateIdentity());
			acc.setSipuri(userDetails.getPrivateIdentity());
		}
		else if(fromPage.equalsIgnoreCase("openlink")){
			acc.setSipuri(request.getParameter("linksipuri").toString());
			System.out.println("sipuri in openlinkservlet"+request.getParameter("linksipuri").toString());
			acc.setGoogleid(request.getParameter("linkgoogle").toString());
			acc.setFacebookid(request.getParameter("linkfacebook").toString());
			System.out.println("facebook id+"+acc.getFacebookid());
			acc.setTwitterid(request.getParameter("linktwitter").toString());
			acc.setYahooid(request.getParameter("linkyahoo").toString());
			int count=tpdao.addthirdpartyaccountDetails(acc);
			if(count>0)	{
				msg="Your details have been saved successfully";
			}
			else{
				msg="Sorry!Your details could not be saved.Please try again.";
			}
		}		
		request.setAttribute("msg", msg);
		request.setAttribute("openLinkBean", acc);
		request.getRequestDispatcher("OpenLink.jsp").include(request,response);
		}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}	
}
