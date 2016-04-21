package com.tcs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

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
					.prepareStatement("INSERT INTO CALLLOGS VALUES (?,?,?,?,?)");
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


	public ArrayList<CallLogs> viewAllLogs(Login user)
    {
    ArrayList<CallLogs> list = new ArrayList<CallLogs>();
    Connection conn = null;
	PreparedStatement ps = null;
    try {
    	conn = DbConnection.getConnection();
    	ps = conn.prepareStatement("SELECT * FROM CALLLOGS WHERE CALLER=? OR CALLEE=?");
    	ps.setString(1, user.getPrivateIdentity());
    	ps.setString(2, user.getPrivateIdentity());
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
        	CallLogs log =new CallLogs();
        	log.setCaller(rs.getString("CALLER"));
        	log.setCallee(rs.getString("CALLEE"));
        	log.setDayOfCall(rs.getString("DAY"));
        	log.setStartTime(rs.getString("STARTTIME"));
        	log.setEndTime(rs.getString("ENDTIME"));
            list.add(log);
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
    return list;
    }
	
	public int getNoOfRecords(Login user){
		Connection conn = null;
		PreparedStatement ps = null;
		int count=0;
	    try {
	    	conn = DbConnection.getConnection();
	    	ps = conn.prepareStatement("SELECT count(*) FROM CALLLOGS WHERE (CALLER OR CALLEE)=?");
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
	/*public static void main(String args[]){
		Login userDetails=new Login();
		userDetails.setPrivateIdentity("sip:ankita@sip.info");
		SipCallLogDao dao=new SipCallLogDao();
		int count=dao.getNoOfRecords(userDetails);
		System.out.println("count of logs"+count);
	}*/
}


	/*Previous code
	 * public ArrayList<CallLogs> viewAllLogs(int jtStartIndex, int jtPageSize,
			String jtSorting) throws ClassNotFoundException, SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ArrayList<CallLogs> listOfLogs = new ArrayList<CallLogs>();
		try {
			conn = DbConnection.getConnection();
			String query = "SELECT A.CALLER,A.CALLEE,A.DAY,A.STARTTIME,A.ENDTIME FROM(SELECT @ROWNUM:=@ROWNUM+1 ROW, C.* FROM CALLLOGS C, (SELECT @ROWNUM:=0) R ORDER BY "
					+ jtSorting
					+ " )A WHERE A.ROW>"
					+ jtStartIndex
					+ " and A.ROW<=" + (jtPageSize + jtStartIndex);
			String query2 = "SELECT A.CALLER,A.CALLEE,A.DAY,A.STARTTIME,A.ENDTIME FROM(SELECT @ROWNUM:=@ROWNUM+1 ROW, C.* FROM CALLLOGS C, (SELECT @ROWNUM:=0) R ORDER BY "
					+ jtSorting
					+ " )A WHERE A.ROW>"
					+ jtStartIndex
					+ " and A.ROW<=" + (jtPageSize + jtStartIndex);
			System.out.println(query);
			System.out.println(query2);
			ps = conn.prepareStatement(query);
			ResultSet resultSet = ps.executeQuery();
			CallLogs log = null;
			while (resultSet.next()) {
				log = new CallLogs();
				log.setCaller(resultSet.getString(1));
				log.setCallee(resultSet.getString(2));
				log.setStartTime(resultSet.getString(4));
				log.setEndTime(resultSet.getString(5));
				log.setDayOfCall(resultSet.getString(3));
				listOfLogs.add(log);
			}

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
		return listOfLogs;
	}

	public ArrayList<CallLogs> viewAllLogs(int jtStartIndex, int jtPageSize,
			String jtSorting, String queryFilter, String filterType)
			throws ClassNotFoundException, SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ArrayList<CallLogs> listOfLogs = new ArrayList<CallLogs>();
		try {
			conn =DbConnection.getConnection();
			String query = "";
			if (filterType.equals("DAY")) {
				query = "SELECT A.CALLER,A.CALLEE,A.DAY,A.STARTTIME,A.ENDTIME FROM(SELECT @ROWNUM:=@ROWNUM+1 ROW, C.* FROM CALLLOGS C, (SELECT @ROWNUM:=0) R  WHERE "
						+ filterType
						+ " ='"
						+ queryFilter
						+ "' ORDER BY "
						+ jtSorting
						+ ") A WHERE A.ROW>"
						+ jtStartIndex
						+ " and A.ROW<=" + (jtPageSize + jtStartIndex);
			} else
				query = "SELECT A.CALLER,A.CALLEE,A.DAY,A.STARTTIME,A.ENDTIME FROM(SELECT @ROWNUM:=@ROWNUM+1 ROW, C.* FROM CALLLOGS C, (SELECT @ROWNUM:=0) R  WHERE "
						+ filterType
						+ " LIKE '%"
						+ queryFilter
						+ "%' ORDER BY "
						+ jtSorting
						+ ") A WHERE A.ROW>"
						+ jtStartIndex
						+ " and A.ROW<="
						+ (jtPageSize + jtStartIndex);
			System.out.println(query);
			ps = conn.prepareStatement(query);
			ResultSet resultSet = ps.executeQuery();			
			CallLogs log = null;
			while (resultSet.next()) {
				log = new CallLogs();
				log.setCaller(resultSet.getString(1));
				log.setCallee(resultSet.getString(2));
				log.setStartTime(resultSet.getString(4));
				log.setEndTime(resultSet.getString(5));
				log.setDayOfCall(resultSet.getString(3));
				listOfLogs.add(log);
			}
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
		return listOfLogs;
	}

	public int getLogCount() throws ClassNotFoundException, SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		int count=0;
		try{
		conn = DbConnection.getConnection();
		ps = conn.prepareStatement("SELECT Count(*) AS COUNT FROM CALLLOGS");
		ResultSet resultSet = ps.executeQuery();
		resultSet.next();
		count = resultSet.getInt("COUNT");
		}
		catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		finally {
			DbConnection.closeConnection(conn);
			DbConnection.closeStatement(ps);
		}
		return count;
	}

	public int getLogCount(String queryFilter, String filterType)
			throws ClassNotFoundException, SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		int count=0;
		try{
		conn = DbConnection.getConnection();
		ps = conn
				.prepareStatement("SELECT Count(*) AS COUNT FROM CALLLOGS WHERE "
						+ filterType + " LIKE '%" + queryFilter + "%'");
		ResultSet resultSet = ps.executeQuery();
		resultSet.next();
		count = resultSet.getInt("COUNT");
		}
		catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		finally {
			DbConnection.closeConnection(conn);
			DbConnection.closeStatement(ps);
		}
		return count;
	}

	public AnalyticsBean populateGraphDataByYear(String sipURI,
			String yearFilter) {
		AnalyticsBean analyticsBean = new AnalyticsBean();
		int[] incomingCalls = new int[12];
		int[] outgoingCalls = new int[12];
		String[] month = { "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul",
				"Aug", "Sep", "Oct", "Nov", "Dec" };
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		if (yearFilter != null && !yearFilter.equals("")) {
			year = Integer.parseInt(yearFilter);
		}
		int i = 0;
		Connection conn2 = null;
		Statement stmt = null;
		String query = null;
		try {
			conn2 = DbConnection.getConnection();
			stmt = conn2.createStatement();
			for (i = 0; i < 12; i++) {
				if (i == 3 || i == 5 || i == 8 || i == 10) {
					query = "select count(caller) from CALLLOGS where callee='"
							+ sipURI + "' and day like '%" + month[i] + ", "
							+ year + "'";
				} else if (i == 0 || i == 2 || i == 4 || i == 6 || i == 7
						|| i == 9 || i == 11) {
					query = "select count(caller) from CALLLOGS where callee='"
							+ sipURI + "' and day like '%" + month[i] + ", "
							+ year + "'";
				} else if (i == 1) {
					query = "select count(caller) from CALLLOGS where callee='"
							+ sipURI + "' and day like '%" + month[i] + ", "
							+ year + "'";
				}
				ResultSet rs = stmt.executeQuery(query);
				while (rs.next()) {
					incomingCalls[i] = rs.getInt(1);
				}
			}
			for (i = 0; i < 12; i++) {
				System.out.println("in for loop2");
				if (i == 3 || i == 5 || i == 8 || i == 10) {
					query = "select count(callee) from CALLLOGS where caller='"
							+ sipURI + "' and day like '%" + month[i] + ", "
							+ year + "'";
				} else if (i == 0 || i == 2 || i == 4 || i == 6 || i == 7
						|| i == 9 || i == 11) {
					query = "select count(callee) from CALLLOGS where caller='"
							+ sipURI + "' and day like '%" + month[i] + ", "
							+ year + "'";
				} else if (i == 1) {
					query = "select count(callee) from CALLLOGS where caller='"
							+ sipURI + "' and day like '%" + month[i] + ", "
							+ year + "'";
				}
				ResultSet rs = stmt.executeQuery(query);
				while (rs.next()) {
					outgoingCalls[i] = rs.getInt(1);
				}
			}
			for (int j : outgoingCalls) {
				System.out.print(j);
			}
			System.out.println("\n Incoming :");
			for (int j : incomingCalls) {
				System.out.print(j);
			}
			analyticsBean.setIncomingCall(incomingCalls);
			analyticsBean.setOutgoingCall(outgoingCalls);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		finally {
			DbConnection.closeConnection(conn2);
			try {
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return analyticsBean;
	}

	public AnalyticsBean populateGraphByMonth(String sipURI, String monthFilter) {
		String month = monthFilter.substring(0, 3);
		AnalyticsBean analyticsBean = new AnalyticsBean();
		ArrayList<String> monthlyIncomingCalls = new ArrayList<String>();
		ArrayList<String> monthlyOutgoingCalls = new ArrayList<String>();
		ArrayList<String> labels = new ArrayList<String>();
		int i = 0;
		Connection conn2 = null;
		Statement stmt = null;
		String query = null;
		try {
			conn2 = DbConnection.getConnection();
			stmt = conn2.createStatement();
			if (month.equalsIgnoreCase("Jan") || month.equalsIgnoreCase("Mar")
					|| month.equalsIgnoreCase("May")
					|| month.equalsIgnoreCase("Jul")
					|| month.equalsIgnoreCase("Aug")
					|| month.equalsIgnoreCase("Oct")
					|| month.equalsIgnoreCase("Dec")) {
				for (i = 0; i < 31; i++) {
					query = "select count(caller) from CALLLOGS where callee='"
							+ sipURI + "' and day ='" + i + " " + monthFilter
							+ "'";
					ResultSet rs = stmt.executeQuery(query);
					while (rs.next()) {
						monthlyIncomingCalls.add(rs.getString(1));
					}
					labels.add(i + " " + month);
				}
				for (i = 0; i < 31; i++) {
					query = "select count(caller) from CALLLOGS where caller='"
							+ sipURI + "' and day ='" + i + " " + monthFilter
							+ "'";
					ResultSet rs = stmt.executeQuery(query);
					while (rs.next()) {
						monthlyOutgoingCalls.add(rs.getString(1));
					}
				}
			} else if (month.equalsIgnoreCase("Apr")
					|| month.equalsIgnoreCase("Jun")
					|| month.equalsIgnoreCase("Sep")
					|| month.equalsIgnoreCase("Nov")) {
				for (i = 0; i < 30; i++) {

					query = "select count(caller) from CALLLOGS where callee='"
							+ sipURI + "' and day ='" + i + " " + monthFilter
							+ "'";
					ResultSet rs = stmt.executeQuery(query);
					while (rs.next()) {
						monthlyIncomingCalls.add(rs.getString(1));
					}
				}
				for (i = 0; i < 30; i++) {
					query = "select count(caller) from CALLLOGS where caller='"
							+ sipURI + "' and day ='" + i + " " + monthFilter
							+ "'";
					ResultSet rs = stmt.executeQuery(query);
					while (rs.next()) {
						monthlyOutgoingCalls.add(rs.getString(1));
					}
					labels.add(i + " " + month);
				}
			} else if (month.equalsIgnoreCase("Feb")) {
				for (i = 0; i < 28; i++) {
					query = "select count(caller) from CALLLOGS where callee='"
							+ sipURI + "' and day ='" + i + " " + monthFilter
							+ "'";
					ResultSet rs = stmt.executeQuery(query);
					while (rs.next()) {
						monthlyIncomingCalls.add(rs.getString(1));
					}
				}
				for (i = 0; i < 28; i++) {
					query = "select count(caller) from CALLLOGS where caller='"
							+ sipURI + "' and day ='" + i + " " + monthFilter
							+ "'";
					ResultSet rs = stmt.executeQuery(query);
					while (rs.next()) {
						monthlyOutgoingCalls.add(rs.getString(1));
					}
					labels.add(i + " " + month);
				}
			}
			analyticsBean.setMonthlyIncomingCalls(monthlyIncomingCalls);
			analyticsBean.setMonthlyOutgoingCalls(monthlyOutgoingCalls);
			analyticsBean.setLabels(labels);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		finally {
			DbConnection.closeConnection(conn2);
			try {
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return analyticsBean;
	}*/


