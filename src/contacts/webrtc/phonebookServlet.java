package contacts.webrtc;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class phonebookServlet
 */

public class phonebookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection conn2;
	String user2;
	String password2;
	Statement st2 = null;
	ResultSet rs2 = null;

    public phonebookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		out.println("its is in post");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();

		String displayName = request.getParameter("displayName");
		String publicIdentity = request.getParameter("publicIdentity");
		String WSUri = "ws://10.1.5.32:5060";
		String realm = "tcs.com";

		try {

			Class.forName("com.mysql.jdbc.Driver");
			out.println("new driver class found");

			user2 = "root";
			password2 = "tcs@1234";
			conn2 = DriverManager
					.getConnection(
							"jdbc:mysql://127.0.0.1:3306/webrtcdb",
							"root", "tcs@1234");

			out.println("connection " + conn2);
			/*String sql = "insert into registrationtable values (?,?,?,?,?,?)";
			PreparedStatement pst = conn2.prepareStatement(sql);

			pst.setString(1, displayName);
			out.println(displayName);
			pst.setString(2, displayName);
			pst.setString(3, publicIdentity);
			pst.setString(4, displayName);
			pst.setString(5, WSUri);
			out.println(WSUri);
			pst.setString(6, realm);

			pst.close();
*/
			st2 = conn2.createStatement();
			int i = st2.executeUpdate("insert into registrationtable values ('"+displayName+"', '"+displayName+"','"+publicIdentity+"','"+displayName+"','"+WSUri+"','"+realm+"')");
			if (i != 0) {
			out.println("Record has been inserted successfully<br>");
			} else {
			out.println("Inserting record get failure");
			}
			
			
		} catch (ClassNotFoundException e) {
			out.println("Couldn't load database driver: " + e.getMessage());
		} catch (SQLException e) {
			out.println("SQLException caught: " + e.getMessage());
		} finally {
			// Always close the database connection.
			try {
				if (conn2 != null)
					conn2.close();
			} catch (SQLException ignored) {
			}
			out.println("Record has been inserted successfully<br>23");
			
			response.sendRedirect("/WebRTC_v7/phonebookLineServlet");
	}
		
		
		
		
		}
	
	

}