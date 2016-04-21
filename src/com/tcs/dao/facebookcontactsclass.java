package com.tcs.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.tcs.bean.facebookbean;
import com.tcs.util.DbConnection;


import setups.database_server;



public class facebookcontactsclass {
	
ArrayList<facebookbean> fblist=new ArrayList<facebookbean>();	
	
	public int findfacebookfriends(String facebookusername) 
	{
		int resultOfsearch=0;
		Connection conn=null;			
		conn = DbConnection.getConnection();			
		PreparedStatement ps=null;
		ResultSet rs=null;
		try
		{
			
			
			ps=conn.prepareStatement("select sipuri from facebooklogin where facebookusername=?" );
			ps.setString(1,facebookusername);
			rs=ps.executeQuery();
			
			
			if(rs.next())
			{
				//System.out.println(" Facebookcontactsclass- fb user has a account on webrtc  ");
/*				ps=conn.prepareStatement("UPDATE geolocation SET latitude =? , longitude=? , date=? ,time =? where sipuri=?");		
				ps.setString(1, g.getLatitude());*/
				resultOfsearch=ps.executeUpdate();
				

			}
			
			else
			{
				//System.out.println(" Facebookcontactsclass- fb user DOES NOT have a account on webrtc  ");
				resultOfsearch=0;
			}
			
			
			
		}
		
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			DbConnection.closeConnection(conn);
			DbConnection.closeStatement(ps);
		}

		return resultOfsearch;
	}

	
}
