package com.tcs.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;




import com.tcs.bean.openLinkBean;
import com.tcs.util.DbConnection;

public class openLinkDao {

	
	public int addthirdpartyaccountDetails(openLinkBean tpa) 
		{
			int resultOfInsert=0;
			Connection conn=null;			
			conn = DbConnection.getConnection();			
			PreparedStatement ps=null;
			ResultSet rs=null;
			try
			{
				ps=conn.prepareStatement("Select sipuri from m_otheraccounts where sipuri=?");
				ps.setString(1,tpa.getSipuri());
				rs=ps.executeQuery();
				
				
				if(rs.next())
				{
					//System.out.println(" other account links -  alreaday existing or not "+rs);
					ps=conn.prepareStatement("UPDATE m_otheraccounts SET  googleid=? , facebookid=? ,twitterid =?, yahooid=? where sipuri=?");		
					//add variables 
					ps.setString(1, tpa.getGoogleid());
					ps.setString(2, tpa.getFacebookid());
					ps.setString(3, tpa.getTwitterid());
					ps.setString(4, tpa.getYahooid());
					ps.setString(5, tpa.getSipuri());
					
					resultOfInsert=ps.executeUpdate();
				}
				
				else
				{
					//System.out.println("insert into database"+rs);
					ps=conn.prepareStatement("INSERT INTO m_otheraccounts(sipuri,googleid,twitterid,facebookid,yahooid) VALUES (?,?,?,?,?)");
					ps.setString(1,tpa.getSipuri());
					ps.setString(2,tpa.getGoogleid());
					ps.setString(3,tpa.getFacebookid());
					ps.setString(4,tpa.getTwitterid());
					ps.setString(5,tpa.getYahooid());
					resultOfInsert=ps.executeUpdate();
					//System.out.println("end of else");
					
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

			return resultOfInsert;
		}
	}


