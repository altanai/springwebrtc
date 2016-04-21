package com.tcs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.tcs.util.DbConnection;
import com.tcs.bean.ConferenceDetails;

public class confpermission {
	
	public boolean checkconfpermission(){		
		return false;		
	}
	
	public boolean addConferenceDetails(ConferenceDetails conDetails){
		int result=0;
		Connection conn=null;
		PreparedStatement ps=null;
		try{
			conn=DbConnection.getConnection();	
			ps=conn.prepareStatement("INSERT INTO CONFERENCING VALUES(?,?,?,?,?,?)");
			ps.setString(1, conDetails.getConferenceName());
			System.out.println("confpermission"+conDetails.getHost());
			ps.setString(2, conDetails.getHost());
			ps.setString(3, conDetails.getUserName());
			ps.setString(4, conDetails.getPassword());
			ps.setString(5, conDetails.getDate());
			ps.setString(6, conDetails.getConferenceType());
			result=ps.executeUpdate();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			DbConnection.closeConnection(conn);
			DbConnection.closeStatement(ps);
		}
		return result>0?true:false;
	}
}
