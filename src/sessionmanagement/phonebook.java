package sessionmanagement;

import java.io.IOException;
import setups.*;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class phonebook
 */

public class phonebook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public phonebook() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//--------------------------------presentation server
	presentation_server ps=new presentation_server();
	String rdarr[]=new String[1];
	rdarr=ps.read_presentation_server_file();
	String serverip=rdarr[0];
	//--------------------------pr4esentation server
      response.sendRedirect("http://"+serverip+":8080/WebRTC_presentation/phonebookLineServlet");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
