package com.tcs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;

import com.tcs.util.DbConnection;
import com.tcs.bean.ConferenceDetails;

public class confpermission {

	public boolean checkconfpermission(){		
		return false;		
	}

	public boolean addConferenceDetails(ConferenceDetails conDetails){
		int result[]=new int[conDetails.getMembers().length];
		Connection conn=null;
		PreparedStatement ps=null;
		boolean flag=true;
		try{
			conn=DbConnection.getConnection();	
			conn.setAutoCommit(false);
			String countRows = "select sequence as count from conferencing order by count asc";
			ps = conn.prepareStatement(countRows);
			int rowCount = 0;
			ResultSet resultSet = ps.executeQuery();
			while (resultSet.next()) {
				rowCount = resultSet.getInt("count");
				System.out.println(rowCount);
			}
			Calendar cal=Calendar.getInstance();
			String uniqueId = "CF"+cal.get(Calendar.YEAR)+ cal.get(Calendar.MONTH) +cal.get(Calendar.DATE) + ++rowCount;

			boolean flag1=false;
			String Query;
			while(!flag1){
				Query = "select conferenceid from conferencing where conferenceid='"+uniqueId+"'";
				ps = conn.prepareStatement(Query);
				ResultSet resultSet1 = ps.executeQuery();
				if(resultSet1.next()){
					rowCount=rowCount+2;
					flag1=false;
				}
				else{
					flag1=true;
				}
				uniqueId = "CF"+cal.get(Calendar.YEAR)+ cal.get(Calendar.MONTH) +cal.get(Calendar.DATE) + rowCount;	
			}
			String [] arr=conDetails.getMembers();
			for(int i=0;i<conDetails.getMembers().length;i++){
				ps=conn.prepareStatement("insert into conferencing values(?,?,?,?,?)");
				ps.setString(1, conDetails.getConferenceName());
				System.out.println("confpermission"+conDetails.getHost());
				ps.setString(2, conDetails.getHost());
				ps.setString(3, arr[i]);
				ps.setString(4,uniqueId);
				ps.setInt(5, rowCount);
				result[i]=ps.executeUpdate();
				rowCount++;
			}
			for(int j=0;j<result.length;j++)
			{
				if(result[j]==0){
					conn.rollback();
					conn.setAutoCommit(true);
					flag= false;
					break;
				}
			}
			if(flag)
			{
				conn.commit();
				conn.setAutoCommit(true);
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
		return flag;
	}
}
