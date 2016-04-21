package com.tcs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.tcs.bean.Login;
import com.tcs.util.DbConnection;

public class MyLoginDao {
	//INSERT INTO DB
				//GET THE INFO OF THE LOGGED IN USER
		public Login readUserDetails(Login bean) {
			Login myDetails= new Login();
			Connection conn=null;			
			conn = DbConnection.getConnection();			
			PreparedStatement ps=null;
			try {				
				String query= "Select * from UserDetails where privateIdentity=? and password=?";
				ps = conn.prepareStatement(query);
				ps.setString(1, bean.getPrivateIdentity());
				ps.setString(2, bean.getPassword());
				ResultSet rs = ps.executeQuery();
					while (rs.next()) {				
						myDetails.setDisplayName(rs.getString(1));
						myDetails.setPublicIdentity(rs.getString(2));
						myDetails.setPrivateIdentity(rs.getString(3));
						myDetails.setPassword(rs.getString(4));
						myDetails.setRealm(rs.getString(5));
						myDetails.setSecretQuestion(rs.getString(6));
						myDetails.setAnswer(rs.getString(7));			
					}
					//System.out.println("realm"+myDetails.getRealm());
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
			return myDetails;
		}
		
		public boolean register(Login login)
		{
			boolean p=false;
			System.out.println("In register");
			Connection con=null;
			con = DbConnection.getConnection();			
			PreparedStatement pstmt=null;
			int rows=0;
			try
			{				
				pstmt=con.prepareStatement("insert into userdetails(displayName,publicIdentity,privateIdentity,password,realm,secretQuestion,secretAnswer,profilepic,picfile) values(?,?,?,?,?,?,?,?,?)");

				pstmt.setString(1,login.getDisplayName());
				pstmt.setString(2,login.getPublicIdentity());
				pstmt.setString(3, login.getPrivateIdentity());
				pstmt.setString(4, login.getPassword());
				pstmt.setString(5, login.getRealm());
				pstmt.setString(6, login.getSecretQuestion());
				pstmt.setString(7, login.getAnswer());	
				pstmt.setString(8, login.getPicfile());
				pstmt.setBytes(9, login.getProfilepic());
				rows=pstmt.executeUpdate();
				if(rows>0)
				{
					p=true;
				}				
				//System.out.println("rows affected "+rows);
			}
			catch(SQLException sq)
			{
				sq.getMessage();
			}
			finally
			{
				DbConnection.closeConnection(con);
				DbConnection.closeStatement(pstmt);
			}
			return p;
		}	

		//VERIFY  PASSWORD AND REDIRECT DETAILS INTO DASHBOARD.JSP OF LOGIN USER
		public boolean verification(Login bean) {
			boolean p=true;

			Connection conn=null;
			conn = DbConnection.getConnection();		
			PreparedStatement ps=null;
			try {				
				String query= "Select count(*) from userdetails where password=? and privateIdentity=?";
				ps = conn.prepareStatement(query);
				ps.setString(1, bean.getPassword());
				ps.setString(2, bean.getPrivateIdentity());
				//System.out.println("Private Identity "+bean.getPrivateIdentity());
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					p=true;		
				}
			}

			catch (SQLException e) {
				e.printStackTrace();
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			finally
			{
				DbConnection.closeConnection(conn);
				DbConnection.closeStatement(ps);
			}
			return p;
		}

		public Login getData(Login bean) {


			ArrayList<String> temp=new ArrayList<String>();
			ArrayList<String> temp1=new ArrayList<String>();
			ArrayList<String> statusOfFriends=new ArrayList<String>();
			Login loginBean= new Login();
			Connection conn=null;
			//System.out.println("In getData Function");
			conn = DbConnection.getConnection();		
			PreparedStatement ps=null;
			try {				
				String query1="Select publicIdentity,privateIdentity,realm,displayName,password from UserDetails where privateIdentity=? and password=?";
				ps = conn.prepareStatement(query1);
				ps.setString(1, bean.getPrivateIdentity());
				ps.setString(2, bean.getPassword());
				ResultSet rs1=ps.executeQuery();
				while (rs1.next())
				{
					loginBean.setDisplayName(rs1.getString("displayName"));
					//System.out.println("Display Name "+rs1.getString("displayName"));
					loginBean.setPublicIdentity(rs1.getString("publicIdentity"));
					loginBean.setPrivateIdentity(rs1.getString("privateIdentity"));
					loginBean.setPassword(rs1.getString("password"));
					loginBean.setRealm(rs1.getString("realm"));

					String query2="select sipuri,status from presence where sipuri IN(select privateIdentityFrd from friendsdetails where privateIdentity=?)";
					System.out.println(query2);
					ps = conn.prepareStatement(query2);
					ps.setString(1, loginBean.getPrivateIdentity());
					ResultSet rs2=ps.executeQuery();
					while(rs2.next())
					{
						temp.add(rs2.getString(1));
						statusOfFriends.add(rs2.getString(2));
					}

					loginBean.setPrivateIdentityFrd(temp);
					loginBean.setPresenceStatus(statusOfFriends);
					
					String notFrd="Select privateIdentity from userdetails where not privateIdentity=? and privateIdentity not in(Select privateIdentityFrd from friendsdetails where privateIdentity=?)";
					System.out.println("after not friend query");
					ps = conn.prepareStatement(notFrd);
					ps.setString(1, bean.getPrivateIdentity());
					ps.setString(2, bean.getPrivateIdentity());
					ResultSet rs3=ps.executeQuery();
					while(rs3.next())
					{
						temp1.add(rs3.getString(1));
						System.out.println("after temp2");

					}
					loginBean.setPrivateIdentityNotFrd(temp1);
				}
			}

			catch (SQLException e) {
				e.printStackTrace();
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			finally
			{
				DbConnection.closeConnection(conn);
				DbConnection.closeStatement(ps);
			}
			return loginBean;
		}

		public ArrayList<Login> getOwnProfile(Login bean) {
			ArrayList<Login> al=new ArrayList<Login>();
			//System.out.println("In getOwnProfile");
			Connection con=null;
			con = DbConnection.getConnection();			
			PreparedStatement pstmt=null;
			try   
			{				
				pstmt=con.prepareStatement("select *from userdetails where publicIdentity=?");
				pstmt.setString(1,bean.getPrivateIdentity());
				ResultSet rs = pstmt.executeQuery();
				while (rs.next()) 
				{
					bean.setDisplayName(rs.getString("displayName"));
					bean.setPrivateIdentity(rs.getString("privateIdentity"));
					bean.setPublicIdentity(rs.getString("publicIdentity"));
					bean.setRealm(rs.getString("realm"));
					al.add(bean);

				}				
			}
			catch(SQLException sq)
			{
				sq.getMessage();
			}
			finally
			{
				DbConnection.closeConnection(con);
				DbConnection.closeStatement(pstmt);
			}
			return al;		
		}



		public Login getDetails(Login myLoginBean) {
			Login bean=new Login();
			//System.out.println("In getDetails");
			Connection con=null;
			con = DbConnection.getConnection();			
			PreparedStatement pstmt=null;
			try   
			{				
				pstmt=con.prepareStatement("select *from userdetails where privateIdentity=?");
				pstmt.setString(1, myLoginBean.getPrivateIdentity());
				ResultSet rs = pstmt.executeQuery();
				while (rs.next()) 
				{
					bean.setDisplayName(rs.getString("displayName"));
					bean.setPublicIdentity(rs.getString("publicIdentity"));
					bean.setPrivateIdentity(rs.getString("privateIdentity"));
					bean.setRealm(rs.getString("realm"));
					//System.out.println(rs.getString("privateIdentity"));
				}				
			}
			catch(SQLException sq)
			{
				sq.getMessage();
			}
			finally
			{
				DbConnection.closeConnection(con);
				DbConnection.closeStatement(pstmt);
			}
			return bean;		

		}
		

		public boolean updateProfile(Login login) {
			boolean p=false;
			//System.out.println("In updateProfileDao");
			Connection con=null;
			con = DbConnection.getConnection();			
			PreparedStatement pstmt=null;
			int rows=0;
			try
			{				
				pstmt=con.prepareStatement("update userdetails set displayName=?,publicIdentity=?,realm=? where privateIdentity=?");

				pstmt.setString(1,login.getDisplayName());
				pstmt.setString(2,login.getPublicIdentity());
				pstmt.setString(3, login.getRealm());
				pstmt.setString(4, login.getPrivateIdentity());
				rows=pstmt.executeUpdate();
				if(rows>0)
				{
					p=true;
				}				
				System.out.println("rows affected"+rows);
			}
			catch(SQLException sq)
			{
				sq.getMessage();
			}
			finally
			{
				DbConnection.closeConnection(con);
				DbConnection.closeStatement(pstmt);
			}
			return p;




		}
		public Login getUserProfilePic(String userId) {

			Login userBean=new Login();
			Connection con=null;
			try{
				con = DbConnection.getConnection();			
				PreparedStatement pstmt=null;
				String query="SELECT PICFILE,PROFILEPIC FROM USERDETAILS WHERE PRIVATEIDENTITY='"+userId+"'";
				pstmt=con.prepareStatement(query);
				ResultSet rs=pstmt.executeQuery();
				while(rs.next())
				{
					userBean.setProfilepic(rs.getBytes(1));
					userBean.setPicfile(rs.getString(2));
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
					con.close();
				}catch (SQLException e) {e.printStackTrace();}
			}
			return userBean;
		}




		public boolean addFriend(Login login) {
			
		  boolean p=true;
			/*ArrayList<String> temp3=new ArrayList<String>();
		    temp3=login.getPrivateIdentityFrd();*/
			//Login bean=new Login();
			//System.out.println("In getDetails");
			Connection con=null;
			con = DbConnection.getConnection();	
			int rows=0;
			PreparedStatement pstmt=null;
			try   
			{				
				pstmt=con.prepareStatement("insert into friendsdetails(privateIdentity,privateIdentityFrd) values(?,?)");

				pstmt.setString(1,login.getPrivateIdentity());
				for( String frd: login.getPrivateIdentityFrd())
				{
				pstmt.setString(2, frd);
				
				rows=pstmt.executeUpdate();
				if(rows>0)
				{
					p=true;
				}				
				System.out.println("rows affected"+rows);
			}
			}
			catch(SQLException sq)
			{
				sq.getMessage();
			}
			finally
			{
				DbConnection.closeConnection(con);
				DbConnection.closeStatement(pstmt);
			}
			return p;
		
			
	}
		public void writepresence(String string, String string2) {
			
			
			System.out.println("In write presence dao");
			Connection con=null;
			con = DbConnection.getConnection();			
			PreparedStatement pstmt=null;
			int rows=0;
			try
			{				
				pstmt=con.prepareStatement("update webrtcdb.presence set status=? where sipuri=?");

				pstmt.setString(1, string);
				pstmt.setString(2, string2);
				rows=pstmt.executeUpdate();
				if(rows>0)
				{
			
								
				System.out.println("rows affected"+rows);
				}
			}
			catch(SQLException sq)
			{
				sq.getMessage();
			}
			finally
			{
				DbConnection.closeConnection(con);
				DbConnection.closeStatement(pstmt);
			}
		
			
			
		}


}

