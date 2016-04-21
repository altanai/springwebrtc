package com.tcs.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.apache.commons.codec.digest.DigestUtils;

public class LogDao {
	String us,pw;
	Connection con = null;
	int x;
	public String getUs() {
		return us;
	}

	public void setUs(String us) {
		this.us = us;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}
	
	public int Kam()
	{
		try {	
			String userName="kamailio";
			String passWord="kamailiorw";
			String domain  ="tcs.com";
			String hash1=us+":"+"tcs.com"+":"+pw;
			String hash2=us+"@tcs.com:"+"tcs.com"+":"+pw;
			String md1=DigestUtils.md5Hex(hash1);
			//String hashValue=DigestUtils.mdhHex(user)
			String md2=DigestUtils.md5Hex(hash2);
			PreparedStatement ps = null;
		
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager
					.getConnection(
							"jdbc:mysql://54.215.209.44:3306/kamailio",
							userName, passWord);
			ps = con.prepareStatement("insert into subscriber(username,domain,password,ha1,ha1b) values (?,?,?,?,?)");
			ps.setString(1,us);
			ps.setString(2,domain);
			ps.setString(3, pw);
			ps.setString(4,md1);
			ps.setString(5, md2);
			 x=ps.executeUpdate();
			
	}
		catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return x;

}
	
	
	public int Kam_remove(String us)
	{
		try {	
			String userName="kamailio";
			String passWord="kamailiorw";
			PreparedStatement ps = null;
		
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://54.215.209.44:3306/kamailio",
							userName, passWord);
			ps = con.prepareStatement("delete FROM kamailio.subscriber where username=?");
			ps.setString(1,us);
			
			x=ps.executeUpdate();
			
	}
		catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return x;

}
}