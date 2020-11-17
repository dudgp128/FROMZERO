package model;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
public class DBUtil {

public static ResultSet findUser(Connection con, String mid) {
	String sqlSt = "SELECT passwd FROM member WHERE memid=";
	Statement st;
	try {
		st = con.createStatement();
		if (st.execute(sqlSt + "'" + mid + "'")) {
				return st.getResultSet();
		}

	} catch (SQLException e) {
		e.printStackTrace();
	}
return null;

}

public static void modifyUser(Connection conn, String nmid, String npasswd, String nname, String naddress, String nphone) throws SQLException{
	
	Statement stmt=null;
	try {
		stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
								ResultSet.CONCUR_UPDATABLE);
		ResultSet uprs = stmt.executeQuery("SELECT * FROM member WHERE "+"memid="+"'"+nmid+"'");
		
		while(uprs.next()) {
				//String oldpasswd=uprs.getString("passwd");
				uprs.updateString("passwd", npasswd);
				uprs.updateString("name", nname);
				uprs.updateString("address", naddress);
				uprs.updateString("phone", nphone);
				uprs.updateRow();
		}
	}catch (SQLException e) {
		e.printStackTrace();
	}finally {
		if(stmt!=null) {stmt.close();}
	}		
}
public static void insertWithParam(Connection conn, String nmid, String npasswd, String nname, String naddress, String nphone) throws SQLException{
	PreparedStatement pstmt=null;
	
	try {
		conn.setAutoCommit(false);
		
		pstmt=conn.prepareStatement("INSERT INTO member VALUES(?,?,?,?,?)");
		pstmt.setString(1, nmid);
		pstmt.setString(2, npasswd);
		pstmt.setString(3, nname);
		pstmt.setString(4, naddress);
		pstmt.setString(5, nphone);
		
		pstmt.executeUpdate();
		
		conn.commit();
		conn.setAutoCommit(true);
	}catch(SQLException e) {
		e.printStackTrace();
	}finally {
		if(pstmt!=null) {pstmt.close();}
	}
}
}
