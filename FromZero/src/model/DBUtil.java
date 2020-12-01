package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBUtil {

	public static ResultSet findUser(Connection con, String mid) {
		String sqlSt = "SELECT passwd, name, address, phone, email FROM customer WHERE custid=";
		Statement st;
		try {
			st = con.createStatement();
			if (st.execute(sqlSt + "'" + mid + "'")) {
				return st.getResultSet();
			}
			con.close();
			st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static ResultSet findPoint(Connection con, String mid) {
		String sqlSt = "SELECT * FROM bottle WHERE custid=";
		Statement st;
		try {
			st = con.createStatement();
			if (st.execute(sqlSt + "'" + mid + "'")) {
				return st.getResultSet();
			}
			con.close();
			st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}


	public static void modifyUser(Connection conn, String nmid, String npasswd, String nname, String naddress,
			String nphone, String nemail) throws SQLException {

		Statement stmt = null;
		try {
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			ResultSet uprs = stmt.executeQuery("SELECT * FROM customer WHERE " + "custid=" + "'" + nmid + "'");

			while (uprs.next()) {
				uprs.updateString("passwd", npasswd);
				uprs.updateString("name", nname);
				uprs.updateString("address", naddress);
				uprs.updateString("phone", nphone);
				uprs.updateString("email", nemail);
				uprs.updateRow();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (stmt != null) {
				conn.close();
				stmt.close();
			}
		}
	}

	public static void modifyPoint(Connection conn, String user_id, int soju, int beer, int milk, int water, int point)
			throws SQLException {
		Statement stmt = null;
		try {
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			ResultSet uprs = stmt.executeQuery("SELECT * FROM bottle WHERE " + "custid=" + "'" + user_id + "'");

			int a_soju = 0;
			int a_beer = 0;
			int a_milk = 0;
			int a_water = 0;
			int a_point = 0;

			while (uprs.next()) {
				a_soju = uprs.getInt(2);
				a_beer = uprs.getInt(3);
				a_milk = uprs.getInt(4);
				a_water = uprs.getInt(5);
				a_point = uprs.getInt(6);

				uprs.updateInt("soju", a_soju + soju);
				uprs.updateInt("beer", a_beer + beer);
				uprs.updateInt("milk", a_milk + milk);
				uprs.updateInt("water", a_water + water);
				uprs.updateInt("point", a_point + point);
				uprs.updateRow();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (stmt != null) {
				conn.close();
				stmt.close();
			}
		}
	}

	public static void insertWithParam(Connection conn, String nmid, String npasswd, String nname, String naddress,
			String nphone, String nemail) throws SQLException {
		PreparedStatement pstmt = null;

		try {
			conn.setAutoCommit(false);
			
			pstmt = conn.prepareStatement("INSERT INTO customer VALUES(?,?,?,?,?)");
			pstmt.setString(1, nmid);
			pstmt.setString(2, npasswd);
			pstmt.setString(3, nname);
			pstmt.setString(4, naddress);
			pstmt.setString(5, nphone);
			pstmt.setString(6, nemail);


			pstmt.executeUpdate();

			conn.commit();
			conn.setAutoCommit(true);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				conn.close();
				pstmt.close();
			}
		}
	}

	public static void insertPoint(Connection conn, String user_id, int soju, int beer, int milk, int water, int point)
			throws SQLException {
		PreparedStatement pstmt = null;
		try {
			conn.setAutoCommit(false);

			pstmt = conn.prepareStatement("INSERT INTO bottle VALUES(?,?,?,?,?,?)");
			pstmt.setString(1, user_id);
			pstmt.setInt(2, soju);
			pstmt.setInt(3, beer);
			pstmt.setInt(4, milk);
			pstmt.setInt(5, water);
			pstmt.setInt(6, point);

			pstmt.executeUpdate();

			conn.commit();
			conn.setAutoCommit(true);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				conn.close();
				pstmt.close();
			}
		}
	}

	public static ResultSet findProduct(Connection con, String sqlSt) {
		Statement st;
		try {
			st = con.createStatement();
			if (st.execute(sqlSt)) {
				return st.getResultSet();
			}
			con.close();
			st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;

	}
	
	public static ResultSet findText(Connection con, String sqlSt) {
		Statement st;
		try {
			st = con.createStatement();
			if (st.execute(sqlSt)) {
				return st.getResultSet();
			}
			con.close();
			st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	public static void updateLevel(Connection conn, String user_id, String level) throws SQLException {
		   Statement stmt = null;
		   try {
		      stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		      ResultSet uprs = stmt.executeQuery("SELECT * FROM customer WHERE " + "custid=" + "'" + user_id + "'");

		      if(uprs != null) {
		         if (uprs.next()) {
		         uprs.updateString("level", level);
		         System.out.print("데베 레벨 확인 : ");
		         System.out.println(level);
		         uprs.updateRow();
		         }
		      }

		   } catch (SQLException e) {
		      e.printStackTrace();
		   } finally {
		      if (stmt != null) {
		         //conn.close();
		         //stmt.close();
		         /*
		          * 이 함수 한 번 호출 됐을 때 close()됨
		          * close()된 후, 바로 다시 test하면 위에 닫힌 statement 객체가 다시 호출되는데
		          * 이때 객체가 close된지 얼마 안 되서 사용 불가.
		          * => 여기서는 close() 쓰지 말기
		          */
		         
		      }
		   }
		}
}
