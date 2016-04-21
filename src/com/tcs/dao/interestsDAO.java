package com.tcs.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Statement;
import com.tcs.util.DbConnection;

import setups.database_server;

public class interestsDAO {

	public int addToUserinfo(String sipuri, String address,
			String city, String state, String country, String contactno,
			String profile) {
		Connection con = DbConnection.getConnection();		
		Statement st2 = null;
		PreparedStatement pst=null;
		ResultSet rs2=null;
		
		ArrayList<String> list = new ArrayList<String>();
		int result=0;

		try {
			int count=0;
			pst=con.prepareStatement("select sipURI from user_info where sipURI=?");
			pst.setString(1,sipuri);
			rs2=pst.executeQuery();
			while (rs2.next()) {
				list.add(rs2.getNString(1));
			}			
			for(int j=0;j<list.size();j++)
			{
				if(list.get(j).equalsIgnoreCase(sipuri))
				{
					System.out.println("URI is added from before");
					break;
				}
				else
				{
					count++;
				}
			}
			
			if(count==list.size())	
			{
			PreparedStatement ps = con
					.prepareStatement("insert into user_info  values (?,?,?,?,?,?,?)");
			ps.setString(1, sipuri);
			ps.setString(2, address);
			ps.setString(3, city);
			ps.setString(4, state);
			ps.setString(5, country);
			ps.setString(6, contactno);
			ps.setString(7, profile);
			result=ps.executeUpdate();
			}
			
			else{
				PreparedStatement ps=con.prepareStatement("update user_info set address=?, city=?,state=?,country=?,contactNumber=?,profile=? where sipURI=?");		
				ps.setString(1, address);
				ps.setString(2, city);
				ps.setString(3, state);
				ps.setString(4, country);
				ps.setString(5, contactno);
				ps.setString(6, profile);
				ps.setString(7, sipuri);
				result=ps.executeUpdate();
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Sql exception ");
		} finally {
			try {
				if (con != null)
					con.close();
			} catch (SQLException ignored) {
			}
		}
		return result;
	}

	public int addToStudent(String sipuri, String institute,String course, String subject) {
		Connection con = DbConnection.getConnection();	
		PreparedStatement pst=null;
		ResultSet rs2=null;
		
		ArrayList<String> list = new ArrayList<String>();
		int result=0;
		try {			
			int count=0;
			pst=con.prepareStatement("SELECT sipURI FROM studenttable where sipURI=?");
			pst.setString(1,sipuri);
			rs2=pst.executeQuery();
			while (rs2.next()) {
				list.add(rs2.getNString(1));
			}
			for(int j=0;j<list.size();j++)
			{
				if(list.get(j).equalsIgnoreCase(sipuri))
				{
					System.out.println("URI is added from before");
					break;
				}
				else
				{
					count++;
				}
			}
			if(count==list.size())	
			{

			PreparedStatement ps = con
					.prepareStatement("INSERT  INTO studenttable  values (?,?,?,?)");
			ps.setString(1, sipuri);
			ps.setString(2, institute);
			ps.setString(3, course);
			ps.setString(4, subject);
			result=ps.executeUpdate();
		}
			else{
				PreparedStatement ps=con.prepareStatement("update studenttable set collegeOrInstitute=?, courseOrDegree=?,subjects=? where sipURI=?");			
				ps.setString(1, institute);
				ps.setString(2, course);
				ps.setString(3, subject);
				ps.setString(4, sipuri);
				result=ps.executeUpdate();
				result=ps.executeUpdate();
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Sql exception ");
		} finally {
			try {
				if (con != null)
					con.close();
			} catch (SQLException ignored) {
			}
		}
		return result;
	}

	public int addTojobseeker(String sipuri, String qualification,
			String field) {
		Connection con = null;
		Statement st2 = null;
		PreparedStatement pst=null;
		ResultSet rs2=null;
		
		ArrayList<String> list = new ArrayList<String>();
		int result=0;
		try {
			con = DbConnection.getConnection();					
			int count=0;
			pst=con.prepareStatement("select sipURI from jobseekertable where sipURI=?");
			pst.setString(1,sipuri);
			rs2=pst.executeQuery();
			while (rs2.next()) {
				list.add(rs2.getNString(1));
			}
			for(int j=0;j<list.size();j++)
			{
				if(list.get(j).equalsIgnoreCase(sipuri))
				{
					System.out.println("URI is added from before");
					break;
				}
				else
				{
					count++;
				}
			}
			if(count==list.size())	
			{
			PreparedStatement ps = con
					.prepareStatement("INSERT INTO jobseekertable  values (?,?,?)");
			ps.setString(1, sipuri);
			ps.setString(2, qualification);
			ps.setString(3, field);
			result=ps.executeUpdate();
		}
			else{
				PreparedStatement ps=con.prepareStatement("update jobseekertable set qualification=?, fields=? where sipURI=?");			
				ps.setString(1, qualification);
				ps.setString(2, field);
				ps.setString(3, sipuri);
				result=ps.executeUpdate();
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Sql exception ");
		} finally {
			try {
				if (con != null)
					con.close();
			} catch (SQLException ignored) {
			}
		}
		return result;
	}

	public int  addToprofessionals(String sipuri, String jobtitle,
			String project, String industry) {
		Connection con = null;
		Statement st2 = null;
		ResultSet rs2=null;
		PreparedStatement pst=null;
		
		ArrayList<String> list = new ArrayList<String>();
		int result=0;
		try {
			con = DbConnection.getConnection();		
			int count=0;
			pst=con.prepareStatement("SELECT sipURI FROM professionalstable where sipURI=?");
			pst.setString(1,sipuri);
			rs2=pst.executeQuery();
			while (rs2.next()) {
				list.add(rs2.getNString(1));
			}
			for(int j=0;j<list.size();j++)
			{
				if(list.get(j).equalsIgnoreCase(sipuri))
				{
					System.out.println("URI is added from before");
					break;
				}
				else
				{
					count++;
				}
			}
			if(count==list.size())	
			{

			PreparedStatement ps = con
					.prepareStatement("INSERT  INTO professionalstable  values (?,?,?,?)");
			ps.setString(1, sipuri);
			ps.setString(2, jobtitle);
			ps.setString(3, project);
			ps.setString(4, industry);
			result=ps.executeUpdate();
			}
			else{
				PreparedStatement ps=con.prepareStatement("update professionalstable set jobTitle=?, project=?,industry=? where sipURI=?");			
				
				ps.setString(1, jobtitle);
				ps.setString(2, project);
				ps.setString(3, industry);
				ps.setString(4, sipuri);
				result=ps.executeUpdate();
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Sql exception ");
		} finally {

			try {
				if (con != null)
					con.close();
			} catch (SQLException ignored) {
			}
		}
		return result;
	}
}
