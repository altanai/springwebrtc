package contacts.webrtc;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.mail.Session;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import phonebook.registrationDao;

import userprofile.beanclass.registration;
import userprofile.daoclass.*;

import presence.beanclass.*;
import phonebook.presenceDao;

import setups.presentation_server;

/**
 * Servlet implementation class phonebookLineServlet
 */

public class phonebookLineServlet extends HttpServlet {
	private final long serialVersionUID = 1L;
	Connection conn2;
	String user2;
	String password2;
	Statement st2 = null;
	ResultSet rs2 = null;

	public phonebookLineServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();

		//--------------------------------presentation server
	presentation_server pss=new presentation_server();
	String rdarr[]=new String[1];
	rdarr=pss.read_presentation_server_file();
	String serverip=rdarr[0];
	//--------------------------pr4esentation server
		
		registrationDao rdao=new registrationDao();
		ArrayList<registration> registeredusers =rdao.fetchregisteredvalues();
		//System.out.println(" fetched registrstion values for phonebook "+ registeredusers.size()+registeredusers.toString());
         presenceDao pd=new presenceDao();

		ArrayList<presence> list= new ArrayList<presence>();
		
		for(int i=0;i<registeredusers.size();i++){
			presence ps=new presence ();
			ps.setDisplayName(registeredusers.get(i).getDisplayName());
			ps.setPublicIdentity(registeredusers.get(i).getPublicIdentity());
			ps.setPrivateIdentity(registeredusers.get(i).getPrivateIdentity());
			ps.setPassword(registeredusers.get(i).getPassword());
			ps.setRealm(registeredusers.get(i).getRealm());
			ps.setPresence(pd.readpresence(registeredusers.get(i).getPrivateIdentity()));
			
			list.add(ps);
		}
		
		request.setAttribute("registrationDetails", list);
		
    	RequestDispatcher view = request.getRequestDispatcher("/pageone/phonebookline.jsp");
		//RequestDispatcher view = request.getRequestDispatcher("/sipml5/subscribe.jsp");
		//RequestDispatcher view = request.getRequestDispatcher("/CreateUserServlet1?action=ViewList");
		view.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	
		}
	}


