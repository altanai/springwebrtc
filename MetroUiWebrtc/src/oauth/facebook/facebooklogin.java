package oauth.facebook;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




/**
 * Servlet implementation class facebooklogin
 */

public class facebooklogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public facebooklogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userName=request.getParameter("userName");
	    if(userName!=null){
		
	    	String username=userName;
	    	username=username.toLowerCase();
			String[] array = username.split(" ");
			String user_firstname=array[0];
			String user_lastname=array[0];
			
			facebooklogindao fbcheck =new facebooklogindao();
			System.out.println(" user trying to login through Oauth Fb is : "+ fbcheck);
			// call all the login metods rel;ated to login 
			
			//**************************
			if(fbcheck!=null){
				   request.getRequestDispatcher("Dashboard.jsp").forward(request,response);
		
			}

		 }
		 else{
				System.out.println("------------------->login failed" );
				response.sendRedirect("pageone/login.jsp");
		 }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
