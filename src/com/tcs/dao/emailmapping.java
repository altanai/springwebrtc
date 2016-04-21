package com.tcs.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import setups.database_server;
import com.tcs.util.DbConnection;


public class emailmapping {
	
	public String sipuritogmailid(String sipuri) 
	{
		
		Connection conn=null;			
		conn = DbConnection.getConnection();			
		PreparedStatement ps=null;
		try
		{
			ps=conn.prepareStatement("Select googleid from m_otheraccounts where sipuri=?");
			ps.setString(1,sipuri);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()){
				
				return rs.getString(1);
			}
		}
		
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
				conn.close();
			}catch (SQLException e) {e.printStackTrace();}
		}
		return "notfound";
	}
	
	
	public String sipuritofacebookid(String sipuri) 
	{
		Connection conn=null;			
		conn = DbConnection.getConnection();			
		PreparedStatement ps=null;
		try
		{
			ps=conn.prepareStatement("Select facebookid from m_otheraccounts where sipuri=?");
			ps.setString(1,sipuri);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()){
				
				return rs.getString(1);

			}
		}
		
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
				conn.close();
			}catch (SQLException e) {e.printStackTrace();}
		}
		return "notfound";

	
	}
	
	public String sipuritoyahooid(String sipuri) 
	{
		
		Connection conn=null;			
		conn = DbConnection.getConnection();			
		PreparedStatement ps=null;
		try
		{
			/*Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection(url, uName, pwd);*/
			ps=conn.prepareStatement("Select yahooid from m_otheraccounts where sipuri=?");
			ps.setString(1,sipuri);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()){
				
				return rs.getString(1);

			}

			
		}
		
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
				conn.close();
			}catch (SQLException e) {e.printStackTrace();}
		}
		return "notfound";

	
	}
	
	public String sipuritotwitterid(String sipuri) 
	{
		
		Connection conn=null;			
		conn = DbConnection.getConnection();			
		PreparedStatement ps=null;
		try
		{
			/*Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection(url, uName, pwd);*/
			ps=conn.prepareStatement("Select twitterid from m_otheraccounts where sipuri=?");
			ps.setString(1,sipuri);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()){
				
				return rs.getString(1);

			}

			
		}
		
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
				conn.close();
			}catch (SQLException e) {e.printStackTrace();}
		}
		return "notfound";

	
	}
	
	
}
