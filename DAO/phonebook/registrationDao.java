package phonebook;

import java.io.PrintWriter;
import userprofile.beanclass.registration;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;

import setups.database_server;
import setups.presentation_server;


import setups.*;

public class registrationDao {

public ArrayList<registration> fetchregisteredvalues() {

	String user2;
	String password2;
	Statement st2 = null;
	PreparedStatement pst2 = null;
	ResultSet rs2 = null;
	String sql=null;
	Connection con = null;
	String dbip=null,uname=null,pass=null;
	
	ArrayList<registration> list = new ArrayList<registration>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		//----------------------------- reading frm db config file 
		database_server ds=new database_server();
		String rdarr[]=new String[3];
		rdarr=ds.read_database_server_file();
		
		dbip=rdarr[0];
		uname=rdarr[1];
		pass=rdarr[2];
		//System.out.println(" frm db file "+ dbip+uname+pass);
		//----------------------------- end db config file 
		try{
		con = DriverManager
					.getConnection(
							"jdbc:mysql://"+dbip+"/webrtcdb",uname,pass);
			st2 = con.createStatement();
			rs2 = st2.executeQuery("SELECT * from registrationtable");


			while (rs2.next()) {

				registration li = new registration();
				li.setDisplayName(rs2.getString(1));
				li.setPublicIdentity(rs2.getNString(2));
				li.setPrivateIdentity(rs2.getNString(3));
				li.setPassword(rs2.getNString(4));
				li.setWSUri(rs2.getNString(5));
				li.setRealm(rs2.getString(6));

				list.add(li);
			}
			
		}catch(SQLException e){
			System.out.println("Sql exception in registration Dao");
		}
		finally {
			// Always close the database connection.
				try {
					if (con != null)
						con.close();
				} catch (SQLException ignored) {
				}
		}
	 
	return list;
	
}	

public static void main(String args[]) {
	 
	
}
	
}
