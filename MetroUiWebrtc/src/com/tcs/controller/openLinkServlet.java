package com.tcs.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		//System.out.println("in do get");

		String googleid=request.getParameter("googleid");
		String facebookid=request.getParameter("facebookid");
		String twitterid=request.getParameter("twitterid");
		String yahooid=request.getParameter("yahooid");
		//System.out.println("ankita"+yahooid);
		
		/*response.sendRedirect("OpenLink.jsp?googleid="+googleid+"&yahooid="+yahooid+"&facebookid="+facebookid+"&twitterid="+twitterid);*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("in openLinkservlet");

		String sipuri=request.getParameter("linksipuri");
		String googleid=request.getParameter("linkgoogle");
		String facebookid=request.getParameter("linkfacebook");
		String twitterid=request.getParameter("linktwitter");
		String yahooid=request.getParameter("linkyahoo");
        
		openLinkBean acc=new openLinkBean(sipuri,googleid,facebookid,twitterid,yahooid);
		openLinkDao tpdao=new openLinkDao();
		tpdao.addthirdpartyaccountDetails(acc);
		
		//response.sendRedirect(request.getContextPath()+"/FinalUI_10/WebContent/Dashboard.jsp");
		response.sendRedirect("ABC.jsp");		
		
		}
	}


