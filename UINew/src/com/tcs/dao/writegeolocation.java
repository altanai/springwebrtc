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
			ps=conn.prepareStatement("select distinct a.latitude,a.longitude,a.date,a.time,b.privateIdentityfrd from webrtc.geolocation a join webrtc.friendsdetails b on a.sipuri=b.privateIdentity where b.privateIdentity='"+user+"'");
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
				//System.out.println("Geolocation -  alre4day existing or not "+rs);
				ps=conn.prepareStatement("UPDATE geolocation SET latitude =? , longitude=? , date=? ,time =? where sipuri=?");		
				ps.setString(1,g.getLatitude());
				ps.setString(2,g.getLongitude());
				ps.setString(3,g.getDate());
				ps.setString(4,g.getTime());
				ps.setString(5,g.getSipuri());
				resultOfInsert=ps.executeUpdate();
			}			
			else
			{
				//System.out.println(" Geolocation -  Not existing  "+rs);
				ps=conn.prepareStatement("INSERT INTO geolocation VALUES (?,?,?,?,?)");
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
}

