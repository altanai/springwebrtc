package com.tcs.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;

import setups.database_server;

import com.tcs.bean.geolocation;
import com.tcs.util.DbConnection;


public class writegeolocation {
	
	public ArrayList<geolocation> viewgeolocationDetails(String user) 
	{
		ArrayList<geolocation> geodatalist=new ArrayList<geolocation>();
		Connection conn=null;
		PreparedStatement ps=null;
		try
		{
			conn=DbConnection.getConnection();	
			String query="select distinct geolocation.latitude,geolocation.longitude,geolocation.date,geolocation.time,friendsdetails.privateIdentityfrd from geolocation join friendsdetails on geolocation.sipuri=friendsdetails.privateIdentityfrd where friendsdetails.privateIdentity='"+user+"'";
			ps=conn.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()){				
				geolocation geo=new geolocation();
				geo.setLatitude(rs.getString(1));
				geo.setLongitude(rs.getString(2));
				geo.setDate(rs.getString(3));
				geo.setTime(rs.getString(4));
				geo.setSipuri(rs.getString(5));
				//System.out.println("sipUri="+geo.getSipuri());
				geodatalist.add(geo);
			}
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
		return geodatalist;	
	}
	
	public int addgeolocationDetails(geolocation g) 
	{
		int resultOfInsert=0;
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try
		{
			conn=DbConnection.getConnection();				
			ps=conn.prepareStatement("Select sipuri from geolocation where sipuri=?");
			ps.setString(1,g.getSipuri());
			rs=ps.executeQuery();
			
			if(rs.next())
			{
				ps=conn.prepareStatement("update geolocation set latitude =? , longitude=? , date=? ,time =? where sipuri=?");		
				ps.setString(1,g.getLatitude());
				ps.setString(2,g.getLongitude());
				ps.setString(3,g.getDate());
				ps.setString(4,g.getTime());
				ps.setString(5,g.getSipuri());
				resultOfInsert=ps.executeUpdate();
			}			
			else
			{
				ps=conn.prepareStatement("insert into geolocation values (?,?,?,?,?)");
				ps.setString(1,g.getSipuri());
				ps.setString(2, g.getLatitude());
				ps.setString(3,g.getLongitude());
				ps.setString(4,g.getDate());
				ps.setString(5,g.getTime());
				resultOfInsert=ps.executeUpdate();
			}		
			
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
		return resultOfInsert;
	}
	
		public int removeLoc(String sipUri) {
			Connection conn=null;
			PreparedStatement ps=null;
			ResultSet rs=null;
			int result=0;
			try
			{
				conn=DbConnection.getConnection();				
				ps=conn.prepareStatement("Select * from geolocation where sipuri=?");
				ps.setString(1,sipUri);
				rs=ps.executeQuery();		
				if(rs.next())
				{
					conn=DbConnection.getConnection();				
					ps=conn.prepareStatement("delete from geolocation where sipuri=?");
					ps.setString(1,sipUri);
					result=ps.executeUpdate();	
				
				}
				else
					result=100;
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
			return result;
		}
}

