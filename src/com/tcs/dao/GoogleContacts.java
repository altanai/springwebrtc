package com.tcs.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.tcs.util.DbConnection;

import setups.database_server;

public class GoogleContacts {

	
	public ArrayList<String> findContactId(String mailId,String privateIdentity) {

		Connection conn = null;
		conn = DbConnection.getConnection();
		PreparedStatement ps = null;
		ArrayList<String> list = new ArrayList<String>();
		try {
			ps = conn.prepareStatement("select sipuri from m_otheraccounts where (googleid=? or facebookid=? or yahooid=? or twitterid=?) and sipuri not in (?)");
			ps.setString(1, mailId);
			ps.setString(2, mailId);
			ps.setString(3, mailId);
			ps.setString(4, mailId);
			ps.setString(5, privateIdentity);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				list.add(rs.getString(1));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
		
	}	
		
		public String addToFriendList(String privateIdentity,String sipuri) {

			Connection conn = null;
			conn = DbConnection.getConnection();
			PreparedStatement ps = null;
			PreparedStatement ps2 = null;
			
			ArrayList<String> list = new ArrayList<String>();
			try {
				int count=0;
				ps2=conn.prepareStatement("SELECT privateIdentityfrd FROM friendsdetails where privateIdentityfrd=? and privateIdentity=?");
				ps2.setString(1, sipuri);
				ps2.setString(2, privateIdentity);
				ResultSet rs2=ps2.executeQuery();
								
				while (rs2.next()) {
					list.add(rs2.getString(1));
				}
				for(int j=0;j<list.size();j++)
				{
					if(list.get(j).equalsIgnoreCase(sipuri))
					{
						System.out.println("friend URI is added from before");
						break;
					}
					else
					{
						count++;
					}
				}
		if(count==list.size())	
		{
		String statement="INSERT  INTO friendsdetails (privateIdentity,privateIdentityfrd) values ('"+privateIdentity+"'"+","+"'"+sipuri+"')";
		PreparedStatement pstn=conn.prepareStatement(statement);
		int result=pstn.executeUpdate();
		if(result!=0)
		{
			System.out.println("added sucessfully");
		}
			}	
		
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			return sipuri;		
		}
}