package com.tcs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import com.tcs.util.DbConnection;


public class InterestDao {

	String resultgeolocation = null;
	String resultregistration = null,resultregistrationrealm = null;

	String resultuserinfo=null, resultuserinfocity =null , resultuserinfostate =null, resultuserinfocountry =null;
	String resultstudent=null,resultstudentcollegeinstitue =null,resultstudentcoursedegree=null, resultstudentsubject=null ;
	String resultprofessional=null,resultprofessionaljobTitle=null, resultprofessionalproject=null,resultprofessionalindustry=null;
	String resultjobseeker=null, resultjobseekerqualification=null , resultjobseekerfields=null;
	
	Connection conn=DbConnection.getConnection();;
	PreparedStatement ps=null;
	
	/*
     *  Call all method to fetch interests 
     */
	public Map getallinterests(String sipuri){
		HashMap<String, String> map = new HashMap<String, String>();
		
		if(viewprofessionalinterests(sipuri) != null){
			map.put("jobtitle",resultprofessionaljobTitle);
			map.put("project",resultprofessionalproject);
			map.put("industry",resultprofessionalindustry);
		}
		
		if(viewregistrationtinterests(sipuri) != null){
			map.put("realm",resultregistrationrealm);
		}
		return map;
	}
	
	///**********************************************************************************************/	
	/*public void initilaiseconnection() throws ClassNotFoundException, SQLException{
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection(url, uName, pwd);
	}
	
	public void closeconnection() throws ClassNotFoundException, SQLException{
			conn.close();		
	}*/
	///**********************************************************************************************/
	
	/* 
	 * fetch interests items from geolocation tables
	 */
	public String viewgeolocationinsterest(String sipuri) 
	{
		try
		{
			ps=conn.prepareStatement("select * from geolocation  where ='"+sipuri+"'");
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()){
				resultgeolocation = rs.getString(1);
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
		return resultgeolocation;	
	}
	
	

	/* 
	 * fetch inetrests items from geolocation tables
	 */
	public String viewregistrationtinterests(String sipuri) 
	{

		try
		{
			ps=conn.prepareStatement("SELECT Realm FROM userdetails where privateIdentity='"+sipuri+"'");
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()){
				resultregistrationrealm = rs.getString(1);
			}	
		}
		
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return resultregistrationrealm;	
	}

	/*
	 * fetch intrests from profile table 
	 */
	public String viewuserinfointerests(String sipuri) 
	{
		try
		{
			ps=conn.prepareStatement("SELECT  city ,state , country FROM user_info where sipURI='"+sipuri+"'");
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()){
				resultuserinfo="yes";
				resultuserinfocity = rs.getString(1);
				resultuserinfostate = rs.getString(2);
				resultuserinfocountry = rs.getString(3);
			}	
		}		
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		
		return resultuserinfo;	
	}
	
	/*
	 * fetch interests from profile professional table 
	 */
	public String viewprofessionalinterests(String sipuri) 
	{
		try
		{
			ps=conn.prepareStatement("SELECT  jobTitle, project, industry FROM professionalstable where sipURI='"+sipuri+"'");
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()){
				resultprofessional="yes";
				resultprofessionaljobTitle = rs.getString(1);
				resultprofessionalproject = rs.getString(2);
				resultprofessionalindustry = rs.getString(3);
			}	
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return resultprofessional;	
	}
	
	/*
	 * fetch interests from profile student table 
	 */
	public String viewstudentinterests(String sipuri) 
	{
		try
		{
			ps=conn.prepareStatement("SELECT 'college/institute', 'course/degree' , subjects FROM studenttable where sipURI='"+sipuri+"'");
			ResultSet rs=ps.executeQuery();			
			while(rs.next()){
				resultstudent="yes";
				resultstudentcollegeinstitue = rs.getString(1);
				resultstudentcoursedegree = rs.getString(2);
				resultstudentsubject = rs.getString(3);
			}	
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return resultstudent;	
	}
	
	
	/* ************************************************************************************
	 * main method to check 
	 */
	public static void main(String args[]){
		
		String sipuri="sip:bob@tcs.com";
		System.out.println(" sipuri "+ sipuri);
		InterestDao intdao=new InterestDao();
		if(intdao.viewuserinfointerests(sipuri) != null){
			System.out.println("city  "+intdao.resultuserinfocity);
			System.out.println("state "+intdao.resultuserinfostate);
			System.out.println("country "+intdao.resultuserinfocountry);
			
		}
		if(intdao.viewstudentinterests(sipuri) != null){
			System.out.println("collegeinstitue  "+intdao.resultstudentcollegeinstitue);
			System.out.println("coursedegree "+intdao.resultstudentcoursedegree);
			System.out.println("subject "+intdao.resultstudentsubject);
			
		}
		if(intdao.viewprofessionalinterests(sipuri) != null){
			System.out.println("job title  "+intdao.resultprofessionaljobTitle);
			System.out.println("project "+intdao.resultprofessionalproject);
			System.out.println("industry "+intdao.resultprofessionalindustry);
			
		}
		if(intdao.viewregistrationtinterests(sipuri) != null){
			System.out.println("realm "+intdao.resultregistrationrealm);
			
		}
	}
}

