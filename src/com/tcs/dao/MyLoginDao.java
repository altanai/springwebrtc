package com.tcs.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.tcs.bean.Login;
import com.tcs.bean.QuestionBean;
import com.tcs.util.DbConnection;

public class MyLoginDao {

	public Login readUserDetails(Login bean) {

		Login myDetails= new Login();
		Connection conn=null;			
		conn = DbConnection.getConnection();			
		PreparedStatement ps=null;
		try {				
			String query= "Select * from userdetails where privateIdentity=? and password=?";
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
		Connection con=null;
		con = DbConnection.getConnection();			
		PreparedStatement pstmt=null;
		PreparedStatement pstmt1=null;
		int rows=0;int count=0;
		try
		{	
			pstmt1=con.prepareStatement("select * from userdetails where privateIdentity='"+login.getPrivateIdentity()+"'");
			ResultSet rs=pstmt1.executeQuery();
			while(rs.next()){
				count++;	
				
				System.out.println(count);
			}
			if(count==0){
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
					pstmt=con.prepareStatement("Insert into presence values('"+login.getPrivateIdentity()+"','offline')");
					rows=pstmt.executeUpdate();
					if(rows>0)
						p=true;
				}			
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

	//VERIFY  PASSWORD AND REDIRECT DETAILS INTO DASHBOARD.JSP OF LOGIN USER
	public boolean verification(Login bean) {
		boolean p=false;

		Connection conn=null;
		conn = DbConnection.getConnection();		
		PreparedStatement ps=null;
		try {				
			String query= "Select count(*) from userdetails where password=? and privateIdentity=?";
			ps = conn.prepareStatement(query);
			ps.setString(1, bean.getPassword());
			ps.setString(2, bean.getPrivateIdentity());
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				if(rs.getInt(1)>0){
				p=true;	
				}
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
		conn = DbConnection.getConnection();		
		PreparedStatement ps=null;
		try {				
			String query1="Select publicIdentity,privateIdentity,realm,displayName,password from userdetails where privateIdentity=? and password=?";
			ps = conn.prepareStatement(query1);
			ps.setString(1, bean.getPrivateIdentity());
			ps.setString(2, bean.getPassword());
			ResultSet rs1=ps.executeQuery();
			while (rs1.next())
			{
				loginBean.setDisplayName(rs1.getString("displayName"));
				loginBean.setPublicIdentity(rs1.getString("publicIdentity"));
				loginBean.setPrivateIdentity(rs1.getString("privateIdentity"));
				loginBean.setPassword(rs1.getString("password"));
				loginBean.setRealm(rs1.getString("realm"));

				String query2="select sipuri,status from presence where sipuri IN(select privateIdentityFrd from friendsdetails where privateIdentity=?)";
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
				ps = conn.prepareStatement(notFrd);
				ps.setString(1, bean.getPrivateIdentity());
				ps.setString(2, bean.getPrivateIdentity());
				ResultSet rs3=ps.executeQuery();
				while(rs3.next())
				{
					temp1.add(rs3.getString(1));
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
		Connection con=null;
		con = DbConnection.getConnection();			
		PreparedStatement pstmt=null;
		try   
		{				
			pstmt=con.prepareStatement("select * from userdetails where publicIdentity=?");
			pstmt.setString(1,bean.getPrivateIdentity());
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) 
			{
				bean.setDisplayName(rs.getString("displayName"));
				bean.setPrivateIdentity(rs.getString("privateIdentity"));
				bean.setPublicIdentity(rs.getString("publicIdentity"));
				bean.setRealm(rs.getString("realm"));
				bean.setPassword(rs.getString("password"));
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
		Connection con=null;
		con = DbConnection.getConnection();			
		PreparedStatement pstmt=null;
		try   
		{				
			pstmt=con.prepareStatement("select * from userdetails where privateIdentity=?");
			pstmt.setString(1, myLoginBean.getPrivateIdentity());
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) 
			{
				bean.setDisplayName(rs.getString("displayName"));
				bean.setPublicIdentity(rs.getString("publicIdentity"));
				bean.setPrivateIdentity(rs.getString("privateIdentity"));
				bean.setRealm(rs.getString("realm"));
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
			String query="Select picfile,profilepic from userdetails where privateidentity='"+userId+"'";
			/*String query="SELECT PICFILE,PROFILEPIC FROM USERDETAILS WHERE PRIVATEIDENTITY='"+userId+"'";*/
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
	public void writepresence(String status, String sipUri) {
		System.out.println("In write presence dao status for "+sipUri+"status is "+status);
		Connection con=null;
		con = DbConnection.getConnection();			
		PreparedStatement pstmt=null;
		int rows=0;
		try
		{				
			pstmt=con.prepareStatement("update presence set status=? where sipuri=?");

			pstmt.setString(2, status);
			pstmt.setString(1, sipUri);
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

	public boolean addFriend(String mySipuri, String friendSipUri) {
		boolean flag=false;
		Connection con=null;
		con = DbConnection.getConnection();
		PreparedStatement pstmt=null;
		String query="insert into friendsdetails values('"+mySipuri+"','"+friendSipUri+"')";
		try   
		{				
			pstmt=con.prepareStatement(query);
			if(pstmt.executeUpdate()>0)
			{
				flag=true;
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
		return flag;
	}

	public void logoutUser(String userId) {
		Connection con=null;
		System.out.println(userId);
		con = DbConnection.getConnection();
		PreparedStatement pstmt=null;
		String query="update presence set status='offline' where sipuri='"+userId+"'";
		try   
		{				
			pstmt=con.prepareStatement(query);
			int row=pstmt.executeUpdate();
			if(row>0){
				System.out.println("LOGGED OUT SUCCESSFULLY "+userId);
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
public boolean deleteFrnd(String userId, String friendId) {
		
		boolean p=false;
		System.out.println(userId+""+friendId);
		
		
		Connection con=null;
		con = DbConnection.getConnection();	
		int rows=0;
		PreparedStatement pstmt=null;
		try   
		{				
			pstmt=con.prepareStatement("delete from friendsdetails where privateIdentity=? and privateIdentityFrd=? ");

			pstmt.setString(1,userId);
			pstmt.setString(2, friendId);
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
		System.out.println(p);
		return p;
		
	}

public Login getDataFacebook(String sipuri) {	
	
	ArrayList<String> temp=new ArrayList<String>();
	ArrayList<String> temp1=new ArrayList<String>();
	ArrayList<String> statusOfFriends=new ArrayList<String>();
	Login loginBean= new Login();
	Connection conn=null;
	conn = DbConnection.getConnection();		
	PreparedStatement ps=null;
	try {				
		String query1="Select publicIdentity,privateIdentity,realm,displayName,password from userdetails where privateIdentity=?";
		ps = conn.prepareStatement(query1);
		ps.setString(1, sipuri);
		ResultSet rs1=ps.executeQuery();
		while (rs1.next())
		{
			loginBean.setDisplayName(rs1.getString("displayName"));
			loginBean.setPublicIdentity(rs1.getString("publicIdentity"));
			loginBean.setPrivateIdentity(rs1.getString("privateIdentity"));
			loginBean.setPassword(rs1.getString("password"));
			loginBean.setRealm(rs1.getString("realm"));

			String query2="select sipuri,status from presence where sipuri IN(select privateIdentityFrd from friendsdetails where privateIdentity=?)";
			ps = conn.prepareStatement(query2);
			ps.setString(1, sipuri);
			ResultSet rs2=ps.executeQuery();
			while(rs2.next())
			{
				temp.add(rs2.getString(1));
				statusOfFriends.add(rs2.getString(2));
			}
			loginBean.setPrivateIdentityFrd(temp);
			loginBean.setPresenceStatus(statusOfFriends);

			String notFrd="Select privateIdentity from userdetails where not privateIdentity=? and privateIdentity not in(Select privateIdentityFrd from friendsdetails where privateIdentity=?)";
			ps = conn.prepareStatement(notFrd);
			ps.setString(1, sipuri);
			ps.setString(2,sipuri);
			ResultSet rs3=ps.executeQuery();
			while(rs3.next())
			{
				temp1.add(rs3.getString(1));
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


public boolean resetPassword(String sipUri, String password){
	boolean flag=false;
	Connection conn=null;			
	conn = DbConnection.getConnection();
	PreparedStatement ps=null;
	int pos1=0,pos2=0;
	for(int i=0;i<sipUri.length();i++){
		if(sipUri.charAt(i)==':'){
			pos1=i+1;
			break;
		}			
	}
	for(int i=sipUri.length()-1;i>0;i--){
		if(sipUri.charAt(i)=='@'){
			pos2=i;
			break;
		}			
	}
	String pubIdentity=sipUri.substring(pos1, pos2).trim();	
	System.out.println("Public Identity"+pubIdentity);
	try {	
		Class.forName("com.mysql.jdbc.Driver");
		String query="update userdetails set password='"+password+"' where privateIdentity='"+sipUri+"'";
		ps = conn.prepareStatement(query);
		if(ps.executeUpdate()>0){
			Connection conKam=DriverManager.getConnection("jdbc:mysql://54.215.209.44:3306/kamailio","kamailio", "kamailiorw");
			String queryKam="update kamailio.subscriber set password='"+password+"' where username='"+pubIdentity+"'";
			ps = conKam.prepareStatement(queryKam);
			if(ps.executeUpdate()>0){
				System.out.println("updated successfully in kamailio");
				flag=true;
			}
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
	return flag;
}

public QuestionBean getAnswer(String sipUri){
	
	QuestionBean questionBean= new QuestionBean();
	Connection conn=null;			
	conn = DbConnection.getConnection();			
	PreparedStatement ps=null;
	try {				
		String query="select secretQuestion, secretAnswer from userdetails where privateIdentity='"+sipUri+"'";
		System.out.println("in question dao after querrryyyy");
		ps = conn.prepareStatement(query);
		ResultSet resultSet=ps.executeQuery();
		while(resultSet.next()){
			questionBean.setQuestion(resultSet.getString(1));
			System.out.println("Ques: "+resultSet.getString(1));
			questionBean.setAnswer(resultSet.getString(2));
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
	return questionBean;
	
}
}






