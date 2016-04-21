package com.tcs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;

import org.json.JSONObject;

import com.tcs.bean.AnalyticsBean;
import com.tcs.bean.CallLogs;
import com.tcs.bean.Login;
import com.tcs.util.*;

public class SipCallLogDao {

	public int addCallDetails(CallLogs callLog) {
		int resultOfInsert = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = DbConnection.getConnection();
			ps = conn
					.prepareStatement("insert into calllogs values (?,?,?,?,?)");
			ps.setString(1, callLog.getCaller());
			ps.setString(2, callLog.getCallee());
			ps.setString(3, callLog.getDayOfCall());
			ps.setString(4, callLog.getStartTime());
			ps.setString(5, callLog.getEndTime());
			resultOfInsert = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		} finally {
			DbConnection.closeConnection(conn);
			DbConnection.closeStatement(ps);
		}
		return resultOfInsert;
	}


	public CallLogs viewAllLogs(Login user)
    {
	CallLogs log =new CallLogs();
    ArrayList<String> caller1=new ArrayList<String>();
	ArrayList<String> callee1=new ArrayList<String>();
	ArrayList<String> startTime1=new ArrayList<String>();
	ArrayList<String> endTime1=new ArrayList<String>();
	ArrayList<String> dayOfCall1=new ArrayList<String>();
    Connection conn = null;
	PreparedStatement ps = null;
    try {
    	conn = DbConnection.getConnection();
    	ps = conn.prepareStatement("select * from calllogs where caller=? or callee=?");
    	ps.setString(1, /*"sip:alice@tcs.com"*/user.getPrivateIdentity());
    	ps.setString(2, /*"sip:alice@tcs.com"*/user.getPrivateIdentity());
        ResultSet rs = ps.executeQuery();
        rs.afterLast(); //Moves the cursor to the end of the ResultSet object
        while(rs.previous())
        {        	
        	if(rs.getString("caller")!=null && rs.getString("callee")!=null 
        		&& !rs.getString("caller").equalsIgnoreCase("") && !rs.getString("callee").equalsIgnoreCase("")){
            caller1.add(rs.getString("caller"));
            callee1.add(rs.getString("callee"));
            startTime1.add(rs.getString("starttime"));
            endTime1.add(rs.getString("endtime"));
            dayOfCall1.add(rs.getString("day"));
        	}
        }
        rs.close();
        log.setCaller1(caller1);
        log.setCallee1(callee1);
        log.setDayOfCall1(dayOfCall1);
        log.setStartTime1(startTime1);
        log.setEndTime1(endTime1);
    } catch (SQLException e) {
        e.printStackTrace();
    } catch (Exception e) {
        e.printStackTrace();
    } finally
    {
    	DbConnection.closeConnection(conn);
		DbConnection.closeStatement(ps);
    }
    return log;
    }
	
	public int getNoOfRecords(Login user){
		Connection conn = null;
		PreparedStatement ps = null;
		int count=0;
	    try {
	    	conn = DbConnection.getConnection();
	    	ps = conn.prepareStatement("select count(*) from calllogs where (caller or callee)=?");
	    	ps.setString(1, user.getPrivateIdentity());
	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	        	count=rs.getInt(1);
	        	System.out.println("count of logs in method"+count);
	        }
	        rs.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally
	    {
	    	DbConnection.closeConnection(conn);
			DbConnection.closeStatement(ps);
	    }
	    return count;	
	}

			public static void main(String args[]){
			SipCallLogDao dao=new SipCallLogDao();
			Login user=new Login();
			user.setPrivateIdentity("sip:alice@tcs.com");
			CallLogs callLogLatest=dao.viewAllLogs(user);			
		    
		    Iterator i1=callLogLatest.getCaller1().iterator();
			 Iterator i2=callLogLatest.getCallee1().iterator();
			 Iterator i3=callLogLatest.getStartTime1().iterator();
			 Iterator i4=callLogLatest.getEndTime1().iterator();
			 Iterator i5=callLogLatest.getDayOfCall1().iterator();
			 while(i1.hasNext()&& i2.hasNext()&& i3.hasNext()&& i4.hasNext()&& i5.hasNext())
			  {
				  System.out.println(i1.next()+" "+i2.next()+" "+i3.next()+" "+i4.next()+" "+i5.next());
			  }
		}
}