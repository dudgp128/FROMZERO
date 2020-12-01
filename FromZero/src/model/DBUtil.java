package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBUtil {

	public static ResultSet findUser(Connection con, String mid) {
		String sqlSt = "SELECT passwd, name, address, phone FROM customer WHERE custid=";
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
			String nphone) throws SQLException {

		Statement stmt = null;
		try {
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			ResultSet uprs = stmt.executeQuery("SELECT * FROM customer WHERE " + "custid=" + "'" + nmid + "'");

			while (uprs.next()) {
				uprs.updateString("passwd", npasswd);
				uprs.updateString("name", nname);
				uprs.updateString("address", naddress);
				uprs.updateString("phone", nphone);
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

	public static void updateLevel(Connection conn, String user_id, String level) throws SQLException {
		PreparedStatement pstmt = null;

		try {
			conn.setAutoCommit(false);

			pstmt = conn.prepareStatement("SET_SQL_SAFE_UPDATES=0;" + "UPDATE customer SET level =" + level
					+ "where custid='" + user_id + "'");
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
			String nphone) throws SQLException {
		PreparedStatement pstmt = null;

		try {
			conn.setAutoCommit(false);

			pstmt = conn.prepareStatement("INSERT INTO customer VALUES(?,?,?,?,?)");
			pstmt.setString(1, nmid);
			pstmt.setString(2, npasswd);
			pstmt.setString(3, nname);
			pstmt.setString(4, naddress);
			pstmt.setString(5, nphone);

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
			;
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

	public static void insertBuying(Connection conn, int order_id, String user_id, int count)
		throws SQLException {
		PreparedStatement pstmt = null;
		try {
			conn.setAutoCommit(false);

			pstmt = conn.prepareStatement("INSERT INTO online_order VALUES(?,?,?,?)");
			pstmt.setInt(1, order_id);
			pstmt.setString(2, user_id);
			pstmt.setInt(3, count);
			
			java.text.SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); //format
			String stringDate = sdf.format(new java.util.Date());
			java.sql.Date date = java.sql.Date.valueOf(stringDate);
			pstmt.setDate(4, date);
			
			pstmt.executeUpdate();

			conn.commit();
			conn.setAutoCommit(true);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				pstmt.close();
			}
		}
	}
}
