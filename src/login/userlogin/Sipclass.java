package login.userlogin;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.PreparedStatement;

import java.util.ArrayList;

public class Sipclass {
 
	public ArrayList<String> fetchsip() throws ClassNotFoundException, SQLException{
		
		ArrayList<String> sipurilist= null;
		sipurilist.add(readsip());
		System.out.println(" done ");
		return null;
		
	}
	
	public String readsip() throws SQLException, ClassNotFoundException {

		String sipval=null;

		Class.forName("com.mysql.jdbc.Driver");
		Connection connection = null;
		connection = DriverManager
			.getConnection("jdbc:mysql://ec2-23-21-211-172.compute-1.amazonaws.com/webrtcdb","webrtcdb1", "webrtcdb1");

	 
		if (connection != null) {
			
			String sql= "SELECT name , sipuri from siptable";
			java.sql.PreparedStatement pst = connection.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();

			while (rs.next())
			{
				sipval = rs.getString(1)+rs.getString(2);
			}
			
		} else {
			System.out.println("Failed to make connection!");
		}
		return sipval;
	  }
	
	
 
}
