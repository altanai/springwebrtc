package testing;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.tcs.util.DbConnection;

public class DAO {

	public boolean demoFunction(byte[] pic,String privateIdentity)
	{
		int resultOfInsert=0;
		Connection conn=DbConnection.getConnection();
		PreparedStatement ps=null;
		try
		{
			String query="update userdetails set picfile=? where privateIdentity=?";
			ps=conn.prepareStatement(query);
			ps.setBytes(1, pic);
			ps.setString(2, privateIdentity);
			resultOfInsert=ps.executeUpdate();
			System.out.println(resultOfInsert);
			System.out.println("----------------------------------------------"+privateIdentity);
		}
		catch(SQLException e){e.printStackTrace();}
		return resultOfInsert>0?true:false;
	}

	public byte[] getImage() {
		Connection conn=null;
		PreparedStatement ps=null;
		byte []dataVal=null;
		try
		{
			conn=DbConnection.getConnection();
			String query="SELECT * FROM PICTURES";
			ps=conn.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				dataVal=rs.getBytes(1);
			}
			
			System.out.println("returning");
		}
		catch(SQLException e){e.printStackTrace();}
		return dataVal;
	}

}
