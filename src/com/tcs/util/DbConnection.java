package com.tcs.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
//import setups.database_server;

public class DbConnection {

	public static Connection getConnection() {
		Connection con = null;
		String dbip = null, uname = null, pass = null;
		String DRIVER_NAME = "com.mysql.jdbc.Driver";

		try {
			Class.forName(DRIVER_NAME);
			// ----------------------------- reading frm db config file
			/*database_server ds = new database_server();
			String rdarr[] = new String[3];
			rdarr = ds.read_database_server_file();

			dbip = rdarr[0];
			uname = rdarr[1];
			pass = rdarr[2];*/
			dbip = "localhost";
			uname = "root";
			pass = "";
			/*dbip = "localhost";
			uname = "root";
			pass = "mysql";*/
			// ----------------------------- end db config file
			con = DriverManager.getConnection("jdbc:mysql://" + dbip
					+ ":3306/webrtc", uname, pass);

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return con;

	}

	public static void closeConnection(Connection con) {

		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public static void closeStatement(PreparedStatement ps) {

		if (ps != null) {
			try {
				ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
