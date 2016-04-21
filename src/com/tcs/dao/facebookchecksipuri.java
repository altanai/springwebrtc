package com.tcs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.tcs.util.DbConnection;

public class facebookchecksipuri {

	public String checkexists(String username) {

		String sipuri = null;
		PreparedStatement pst2 = null;
		ResultSet rs2 = null;
		String sql = null;
		Connection con = null;
		try {
			try {
				con = DbConnection.getConnection();			
				sql = "SELECT sipuri FROM m_otheraccounts where sipuri LIKE ? OR facebookid LIKE ? OR googleid LIKE ? LIMIT 1 ";
				pst2 = con.prepareStatement(sql);
				pst2.setString(1, "%" + username + "%");
				pst2.setString(2, "%" + username + "%");
				pst2.setString(3, "%" + username + "%");
				rs2 = pst2.executeQuery();

				while (rs2.next()) {
					sipuri = rs2.getString(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (Exception e) {
			System.out.println("Couldn't load database driver: "
					+ e.getMessage());
		} finally {
			if (con != null){
				DbConnection.closeConnection(con);
				DbConnection.closeStatement(pst2);
			}
		}
		return sipuri;
	}

	/*public static void main(String args[]) {
		facebookchecksipuri fblogindao = new facebookchecksipuri();
		String sipuri = fblogindao.checkexists("altanai");
		System.out.println(" sipuri " + sipuri);

	}*/
}