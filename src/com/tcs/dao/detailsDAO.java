package com.tcs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.tcs.util.DbConnection;

public class detailsDAO {

	public ArrayList<String> findUserInfo(String sipuri) {
		Connection con = DbConnection.getConnection();			
		ArrayList<String> userlist = new ArrayList<String>();
		try {
			PreparedStatement ps = con
					.prepareStatement("select * from user_info where sipURI=?");
			ps.setString(1, sipuri);

			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				rs.previous();
			while (rs.next()) {
				userlist.add(rs.getString(1));
				userlist.add(rs.getString(2));
				userlist.add(rs.getString(3));
				userlist.add(rs.getString(4));
				userlist.add(rs.getString(5));
				userlist.add(rs.getString(6));
				userlist.add(rs.getString(7));
			}
			}
			else{
				userlist.add("none");
				userlist.add("none");
				userlist.add("none");
				userlist.add("none");
				userlist.add("none");
				userlist.add("none");
				userlist.add("none");
			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null)
					con.close();
			} catch (SQLException ignored) {
			}
		}
		return userlist;
	}
	
	public ArrayList<String> findStudents(String sipuri) {
		Connection con = DbConnection.getConnection();			
		ArrayList<String> studentlist = new ArrayList<String>();
		try {
		PreparedStatement ps = con
					.prepareStatement("select * from studenttable where sipURI=?");
			ps.setString(1, sipuri);

			ResultSet rs = ps.executeQuery();
			
			if(rs.next()){
				rs.previous();
				while (rs.next()) {
					studentlist.add(rs.getString(1));
					studentlist.add(rs.getString(2));
					studentlist.add(rs.getString(3));
					studentlist.add(rs.getString(4));
				}
			}
			else{
				studentlist.add("none");
				studentlist.add("none");
				studentlist.add("none");
				studentlist.add("none");
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null)
					con.close();
			} catch (SQLException ignored) {
			}
		}
		return studentlist;
	}
	
	public ArrayList<String> findJobseekers(String sipuri) {
		Connection con =DbConnection.getConnection();			
		ArrayList<String> jobseekerlist = new ArrayList<String>();

		try {
			PreparedStatement ps = con
					.prepareStatement("select * from jobseekertable where sipURI=?");
			ps.setString(1, sipuri);

			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				rs.previous();
			while (rs.next()) {
				jobseekerlist.add(rs.getString(1));
				jobseekerlist.add(rs.getString(2));
				jobseekerlist.add(rs.getString(3));
			}
			}
			else{
				jobseekerlist.add("none");
				jobseekerlist.add("none");
				jobseekerlist.add("none");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null)
					con.close();
			} catch (SQLException ignored) {
			}
		}
		return jobseekerlist;
	}
	
	public ArrayList<String> findProfessionals(String sipuri) {
		Connection con = DbConnection.getConnection();			
		ArrayList<String> professional = new ArrayList<String>();
		try {
			PreparedStatement ps = con
					.prepareStatement("select * from professionalstable where sipURI=?");
			ps.setString(1, sipuri);

			ResultSet rs = ps.executeQuery();
			
			if(rs.next()){
				rs.previous();
			while (rs.next()) {
				professional.add(rs.getString(1));
				professional.add(rs.getString(2));
				professional.add(rs.getString(3));
				professional.add(rs.getString(4));
			}}
			else{
				professional.add("none");
				professional.add("none");
				professional.add("none");
				professional.add("none");
			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null)
					con.close();
			} catch (SQLException ignored) {
			}
		}
		return professional;
	}
}
