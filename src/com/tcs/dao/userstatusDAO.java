package com.tcs.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import setups.database_server;

import com.tcs.bean.Login;
import com.tcs.bean.QuestionBean;
import com.tcs.util.DbConnection;

public class userstatusDAO {

	
	public String readStatus(String sipuri) {

		System.out.println("Inside ======= read status ");
		Connection conn = DbConnection.getConnection();
		String status=null; // sttaus in the datase shoudl be active or inactive 
		Login myDetails= new Login();
		
				
		PreparedStatement ps=null;
		try {				
			String query= "Select status from status where sipuri=?";
			ps = conn.prepareStatement(query);
			ps.setString(1, sipuri);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {				
				status=rs.getString(1);
			}
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		finally
		{
			DbConnection.closeConnection(conn);
			DbConnection.closeStatement(ps);
		}
		return status;
	}
	
	
	public int LoginupdateStatus(String sipuri) {


		String dbip = null, uname = null, pass = null;
		String DRIVER_NAME = "com.mysql.jdbc.Driver";


		Connection conn = DbConnection.getConnection();
		
		String status=null; // sttaus in the datase shoudl be active or inactive 
		Login myDetails= new Login();
		int rs=0;
				
		PreparedStatement ps=null;
		try {				
			System.out.println("Seeting status of user "+ sipuri +"to be active  ");
			String query= "update status set status='Active' where sipuri=?";
			ps = conn.prepareStatement(query);
			ps.setString(1, sipuri);
			rs = ps.executeUpdate();
			
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		finally
		{
			DbConnection.closeConnection(conn);
			DbConnection.closeStatement(ps);
		}
		return rs;
	}


	public void LogoutUpdateStatus(String sipuri) {
		
		String dbip = null, uname = null, pass = null;
		String DRIVER_NAME = "com.mysql.jdbc.Driver";
		Connection conn = DbConnection.getConnection();
		
		String status=null; // sttaus in the datase shoudl be active or inactive 
		Login myDetails= new Login();
		int rs=0;
				
		PreparedStatement ps=null;
		try {		
			
			System.out.println("Seeting status of user "+ sipuri +"to be Inactive  ");
			String query= "update status set status='Inactive' where sipuri=?";
			ps = conn.prepareStatement(query);
			ps.setString(1, sipuri);
			rs = ps.executeUpdate();
			
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		finally
		{
			DbConnection.closeConnection(conn);
			DbConnection.closeStatement(ps);
		}
		
	}

public static void main( String args[]){
	
}
	
}
