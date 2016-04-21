package testing;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.tcs.bean.Login;
import com.tcs.util.DbConnection;

public class DbTest {
	public Login readUserDetails() {

		Login myDetails= new Login();
		Connection conn=null;			
		conn = DbConnection.getConnection();			
		PreparedStatement ps=null;
		try {				
			String query= "Select * from userdetails ";
			ps = conn.prepareStatement(query);
		
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
	
	public static void main(String args[]){
		DbTest dbtest=new DbTest();
		dbtest.readUserDetails();
	}
}
