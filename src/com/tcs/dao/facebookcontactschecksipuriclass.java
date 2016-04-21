package com.tcs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.tcs.util.DbConnection;

public class facebookcontactschecksipuriclass {

public String checkexists(String username) {
	Connection conn=null;			
	conn = DbConnection.getConnection();			
	PreparedStatement ps=null;
	String sql=null;
	ResultSet rs2 = null;
	String sipuri = null;
		try {
			sql="SELECT sipuri FROM m_otheraccounts where sipuri LIKE ? OR facebookid LIKE ? OR googleid LIKE ? LIMIT 1 ";
			ps= conn.prepareStatement(sql);
			ps.setString(1, "%"+username + "%");
			ps.setString(2, "%"+username + "%");
			ps.setString(3, "%"+username + "%");
		
			rs2 = ps.executeQuery();

			while (rs2.next()) {
               sipuri=rs2.getString(1);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


	finally 
	   {
		DbConnection.closeConnection(conn);
		DbConnection.closeStatement(ps);
		}
	
	return sipuri;
}

	public static void main(String args[]) {
		
	 facebookcontactschecksipuriclass fblogindao = new facebookcontactschecksipuriclass();
	 String sipuri= fblogindao.checkexists("alice");
	 System.out.println(" sipuri "+ sipuri);
	}
}
