package com.tcs.dao;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import com.tcs.util.DbConnection;

public class facebooklogindao {

	public String checkexists(String username) {

	    String sipuri = null;
		Statement st2 = null;
		PreparedStatement pst2 = null;
		ResultSet rs2 = null;
		String sql=null;

		Connection conn=null;			
		try {		
			conn = DbConnection.getConnection();				
			try {
				//st2 = conn2.createStatement();
				sql="select sipuri from m_otheraccounts where sipuri like ? OR facebookid like ? OR googleid like ? limit 1 ";
				pst2= conn.prepareStatement(sql);
				pst2.setString(1, "%"+username + "%");
				pst2.setString(2, "%"+username + "%");
				pst2.setString(3, "%"+username + "%");
			
				rs2 = pst2.executeQuery();
				while (rs2.next()) {
	               sipuri=rs2.getString(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} finally {
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException ignored) {
			}
		}
		return sipuri;		
	}	
	/*public static void main(String args[]) {
		 facebooklogindao fblogindao = new facebooklogindao();
		 String sipuri= fblogindao.checkexists("priyanka");
		 System.out.println(" sipuri "+ sipuri);
	}*/
	
}
