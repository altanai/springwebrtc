package com.tcs.dao;

import java.sql.*;
import java.util.ArrayList;

import com.tcs.bean.Notification;
import com.tcs.util.DbConnection;

public class NotificationDao {


	public ArrayList<Notification> getNotificationData(String userId)
	{
		Connection conn=null;
		PreparedStatement ps=null;
		ArrayList<Notification> newNotifications=new ArrayList<Notification>();
		try
		{
			conn=DbConnection.getConnection();
			String Query="select * from notification where receiver='"+userId+"' and status='NEW'";
			ps=conn.prepareStatement(Query);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				Notification notification=new Notification(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
				newNotifications.add(notification);
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
		return newNotifications;
	}

	public boolean updateNotificationStatus(String userId) {

		Connection conn=null;
		PreparedStatement ps=null;
		boolean flag=false;
		try
		{
			conn=DbConnection.getConnection();
			String Query="update notification set status='OLD' where id='"+userId+"'";
			ps=conn.prepareStatement(Query);
			if(ps.executeUpdate()>0){
				flag=true;
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
		return flag;
	}
}