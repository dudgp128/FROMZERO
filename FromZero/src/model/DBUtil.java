package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;

public class DBUtil {

	public static ResultSet findUser(Connection con, String mid) {
		String sqlSt = "SELECT passwd, name, address, phone, email FROM customer WHERE custid=";
		Statement st;
		try {
			st = con.createStatement();
			if (st.execute(sqlSt + "'" + mid + "'")) {
				return st.getResultSet();
			}
			// con.close();
			// st.close();
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
			// con.close();
			// st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static void modifyUser(Connection conn, String custid, String passwd, String name, String address,
			String phone, String email) throws SQLException {

		Statement stmt = null;
		try {
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			ResultSet uprs = stmt.executeQuery("SELECT * FROM customer WHERE " + "custid=" + "'" + custid + "'");

			while (uprs.next()) {
				uprs.updateString("passwd", passwd);
				uprs.updateString("name", name);
				uprs.updateString("address", address);
				uprs.updateString("phone", phone);
				uprs.updateString("email", email);
				uprs.updateRow();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (stmt != null) {
				// conn.close();
				// stmt.close();
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
				// conn.close();
				// stmt.close();
			}
		}
	}

	public static void insertWithParam(Connection conn, String nmid, String npasswd, String nname, String naddress,
			String nphone, String nemail) throws SQLException {
		PreparedStatement pstmt = null;

		try {
			conn.setAutoCommit(false);

			pstmt = conn.prepareStatement("INSERT INTO customer VALUES(?,?,?,?,?,?,null,0)");
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
				// conn.close();
				// pstmt.close();
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
				// conn.close();
				// pstmt.close();
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
			// con.close();
			// st.close();
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
			// con.close();
			// st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static ResultSet findStore(Connection con, String sqlSt) {
		Statement st;
		try {
			st = con.createStatement();
			if (st.execute(sqlSt)) {
				return st.getResultSet();
			}
			// con.close();
			// st.close();
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

			if (uprs != null) {
				if (uprs.next()) {
					uprs.updateString("level", level);
					// System.out.print("데베 레벨 확인 : ");
					// System.out.println(level);
					uprs.updateRow();
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (stmt != null) {
				// conn.close();
				// stmt.close();
				/*
				 * 이 함수 한 번 호출 됐을 때 close()됨 close()된 후, 바로 다시 test하면 위에 닫힌 statement 객체가 다시
				 * 호출되는데 이때 객체가 close된지 얼마 안 되서 사용 불가. => 여기서는 close() 쓰지 말기
				 */

			}
		}
	}

	public static void insertBuying(Connection conn, int order_id, String user_id, int all_price) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			conn.setAutoCommit(false);

			pstmt = conn.prepareStatement("INSERT INTO online_order VALUES(?,?,?,?)");
			pstmt.setInt(1, order_id);
			pstmt.setString(2, user_id);
			pstmt.setInt(3, all_price);

			java.text.SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // format
			String stringDate = sdf.format(new java.util.Date());
			java.sql.Date date = java.sql.Date.valueOf(stringDate);
			pstmt.setDate(4, date);

			pstmt.executeUpdate();

			conn.commit();
			conn.setAutoCommit(true);
			// System.out.println("insertBuying");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				// conn.close();
				// pstmt.close();
			}
		}
	}

	public static void insertItems(Connection conn, int order_id, int product_id, String user_id, int count)
			throws SQLException {
		PreparedStatement pstmt = null;
		try {
			conn.setAutoCommit(false);

			pstmt = conn.prepareStatement("INSERT INTO order_items VALUES(?,?,?,?)");
			pstmt.setInt(1, order_id);
			pstmt.setInt(2, product_id);
			pstmt.setString(3, user_id);
			pstmt.setInt(4, count);

			pstmt.executeUpdate();

			conn.commit();
			conn.setAutoCommit(true);
			// System.out.println("insertItems");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				// conn.close();
				// pstmt.close();
			}
		}
	}

	public static ResultSet getOnlineOrder(Connection conn) {
		Statement st = null;
		try {
			st = conn.createStatement();
			if (st.execute("SELECT * FROM online_order")) {
				return st.getResultSet();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static void updateStock(Connection conn, String offlineproduct_id, String offlineproduct_num)
			throws SQLException {
		Statement stmt = null;
		try {
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			ResultSet uprs = stmt.executeQuery(
					"select * from offline_product where offlineproduct_id=" + "'" + offlineproduct_id + "'");

			if (uprs != null) {
				if (uprs.next()) {
					uprs.updateString("offlineproduct_num", offlineproduct_num);
					uprs.updateRow();
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (stmt != null) {
				// conn.close();
				// stmt.close();
				/*
				 * 이 함수 한 번 호출 됐을 때 close()됨 close()된 후, 바로 다시 test하면 위에 닫힌 statement 객체가 다시
				 * 호출되는데 이때 객체가 close된지 얼마 안 되서 사용 불가. => 여기서는 close() 쓰지 말기
				 */

			}
		}
	}

	public static void usePoint(Connection conn, String custid, String point) throws SQLException {
		Statement stmt = null;
		try {
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			ResultSet uprs = stmt.executeQuery("SELECT * FROM bottle WHERE " + "custid=" + "'" + custid + "'");

			if (uprs != null) {
				if (uprs.next()) {
					uprs.updateString("point", point);
					System.out.print("포인트 확인 : ");
					System.out.println(point);
					uprs.updateRow();
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (stmt != null) {
				// conn.close();
				// stmt.close();
				/*
				 * 이 함수 한 번 호출 됐을 때 close()됨 close()된 후, 바로 다시 test하면 위에 닫힌 statement 객체가 다시
				 * 호출되는데 이때 객체가 close된지 얼마 안 되서 사용 불가. => 여기서는 close() 쓰지 말기
				 */

			}
		}
	}

	public static void insertFAQ(Connection conn, int board_id, String custid, String board_title, String board_content)
			throws SQLException {
		PreparedStatement pstmt = null;
		try {
			conn.setAutoCommit(false);

			pstmt = conn.prepareStatement("INSERT INTO faq VALUES(?,?,?,?,?)");
			pstmt.setInt(1, board_id);
			pstmt.setString(2, custid);
			pstmt.setString(3, board_title);
			pstmt.setString(4, board_content);

			java.text.SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String stringDate = sdf.format(new java.util.Date());
			java.sql.Date date = java.sql.Date.valueOf(stringDate);
			pstmt.setDate(5, date);

			pstmt.executeUpdate();

			conn.commit();
			conn.setAutoCommit(true);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				// conn.close();
				// pstmt.close();
			}
		}
	}

	public static void insertNotice(Connection conn, int board_id, String custid, String board_title,
			String board_content) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			conn.setAutoCommit(false);

			pstmt = conn.prepareStatement("INSERT INTO notice VALUES(?,?,?,?,?)");
			pstmt.setInt(1, board_id);
			pstmt.setString(2, custid);
			pstmt.setString(3, board_title);
			pstmt.setString(4, board_content);

			java.text.SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String stringDate = sdf.format(new java.util.Date());
			java.sql.Date date = java.sql.Date.valueOf(stringDate);
			pstmt.setDate(5, date);

			pstmt.executeUpdate();

			conn.commit();
			conn.setAutoCommit(true);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				// conn.close();
				// pstmt.close();
			}
		}
	}

	public static void insertQnA(Connection conn, int board_id, String custid, String board_title, String board_content, String password)
			throws SQLException {
			PreparedStatement pstmt = null;
			try {
				conn.setAutoCommit(false);

				pstmt = conn.prepareStatement("INSERT INTO qna VALUES(?,?,?,?,?,?)");
				pstmt.setInt(1, board_id);
				pstmt.setString(2, custid);
				pstmt.setString(3, board_title);
				pstmt.setString(4, board_content);
				
				java.text.SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				String stringDate = sdf.format(new java.util.Date());
				java.sql.Date date = java.sql.Date.valueOf(stringDate);
				pstmt.setDate(5, date);
				pstmt.setString(6, password);
				
				pstmt.executeUpdate();

				conn.commit();
				conn.setAutoCommit(true);
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				if (pstmt != null) {
					//conn.close();
					//pstmt.close();
				}
			}
		}
	
	public static void insertQnAComment(Connection conn, int comment_id, String custid, int board_id, String comment)
			throws SQLException {
			PreparedStatement pstmt = null;
			try {
				conn.setAutoCommit(false);

				pstmt = conn.prepareStatement("INSERT INTO qna_comment VALUES(?,?,?,?,?)");
				pstmt.setInt(1, comment_id);
				pstmt.setString(2, custid);
				pstmt.setInt(3, board_id);
				pstmt.setString(4, comment);
				
				java.text.SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	            String stringDate = sdf.format(new java.util.Date());
	            java.sql.Date comment_date = java.sql.Date.valueOf(stringDate);
	            pstmt.setDate(5, comment_date);
				pstmt.executeUpdate();

				conn.commit();
				conn.setAutoCommit(true);
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				if (pstmt != null) {
					//conn.close();
					//pstmt.close();
				}
			}
		}
	
	public static ResultSet comparePW(Connection con, String board_id) {
		String sqlSt = "SELECT password FROM qna WHERE board_id=";
		Statement st;
		try {
			st = con.createStatement();
			if (st.execute(sqlSt + "'" + board_id + "'")) {
				return st.getResultSet();
			}
			//con.close();
			//st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static void deleteFAQ(Connection conn, int board_id)
		throws SQLException {
		Statement st = null;
		String sqlSt = "DELETE FROM faq WHERE board_id="+ board_id;
		try {
			st = conn.createStatement();
			st.execute(sqlSt);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void deleteNotice(Connection conn, int board_id)
			throws SQLException {
			Statement st = null;
			String sqlSt = "DELETE FROM notice WHERE board_id="+ board_id;
			try {
				st = conn.createStatement();
				st.execute(sqlSt);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	
	public static void insertReserve(Connection conn, int orderid, int productid, String custid, int storeid, int count)
			throws SQLException {
		PreparedStatement pstmt = null;
		try {
			conn.setAutoCommit(false);

			pstmt = conn.prepareStatement("INSERT INTO offline_order_items VALUES(?,?,?,?,?)");
			pstmt.setInt(1, orderid);
			pstmt.setInt(2, productid);
			pstmt.setString(3, custid);
			pstmt.setInt(4, storeid);
			pstmt.setInt(5, count);

			pstmt.executeUpdate();

			conn.commit();
			conn.setAutoCommit(true);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				// conn.close();
				// pstmt.close();
			}
		}
	}

	public static void insertReserveOrder(Connection conn, int orderid, String custid, int storeid, int all_price)
			throws SQLException {
		PreparedStatement pstmt = null;
		try {
			conn.setAutoCommit(false);

			pstmt = conn.prepareStatement("INSERT INTO offline_order VALUES(?,?,?,?,?)");
			pstmt.setInt(1, orderid);
			pstmt.setString(2, custid);
			pstmt.setInt(3, storeid);
			pstmt.setInt(4, all_price);

			java.text.SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // format
			String stringDate = sdf.format(new java.util.Date());
			java.sql.Date date = java.sql.Date.valueOf(stringDate);
			pstmt.setDate(5, date);

			pstmt.executeUpdate();

			conn.commit();
			conn.setAutoCommit(true);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				// conn.close();
				// pstmt.close();
			}
		}
	}

	public static void insertCartItems(Connection conn, String custid, int productid, int count) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			conn.setAutoCommit(false);

			pstmt = conn.prepareStatement("INSERT INTO cart_items VALUES(?,?,?)");
			pstmt.setString(1, custid);
			pstmt.setInt(2, productid);
			pstmt.setInt(3, count);

			pstmt.executeUpdate();

			conn.commit();
			conn.setAutoCommit(true);
			// System.out.println("insertItems");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				// conn.close();
				// pstmt.close();
			}
		}
	}

	public static ResultSet findCartItems(Connection con, String sqlSt) {
		Statement st;
		try {
			st = con.createStatement();
			if (st.execute(sqlSt)) {
				return st.getResultSet();
			}
			// con.close();
			// st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static void delCartItems(Connection conn, String custid, int productid) {
		Statement st = null;
		String sqlSt = "DELETE FROM cart_items WHERE custid='" + custid + "' and productid= " + productid;
		try {
			st = conn.createStatement();
			st.execute(sqlSt);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

public static ResultSet findReserve(Connection con) { 
	Statement st;
	String stmt="select * from offline_order_items order by orderid desc limit 1";
	try {
		st = con.createStatement();
		if (st.execute(stmt)) {
			return st.getResultSet();
		}
		// con.close();
		// st.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return null;
}	
public static ResultSet findReviewid(Connection con) {
	String sqlSt = "select * from review";
	Statement st;
	try {
		st = con.createStatement();
		if (st.execute(sqlSt)) {
			return st.getResultSet();
		}
		//con.close();
		//st.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return null;
}
public static ResultSet findReview(Connection con, String user_id, int productid, int orderid) {
	String sqlSt = "SELECT * FROM review WHERE custid=";
	Statement st;
	try {
		st = con.createStatement();
		if (st.execute(sqlSt + "'" + user_id + "' AND productid="+productid+" AND order_id="+orderid)); {
			return st.getResultSet();
		}
		//con.close();
		//st.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return null;
}
public static void modifyReview(Connection conn, String review_content, String user_id, int productid, int orderid) throws SQLException {

	Statement stmt = null;
	try {
		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		ResultSet uprs = stmt.executeQuery("SELECT * FROM review WHERE " + "custid=" + "'" + user_id + "'AND productid="+productid+" AND order_id="+orderid);

		while (uprs.next()) {
			uprs.updateString("review_content", review_content);
			uprs.updateRow();
		}

	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		if (stmt != null) {
			//conn.close();
			//stmt.close();
		}
	}
}
public static void insertReview(Connection conn,int reviewid, String custid, int productid, String review_content, int review_score, int orderid)
		throws SQLException {
	PreparedStatement pstmt = null;
	try {
		conn.setAutoCommit(false);

		pstmt = conn.prepareStatement("INSERT INTO review VALUES(?,?,?,?,?,?,?)");
		pstmt.setInt(1,reviewid);
		pstmt.setString(2, custid);
		pstmt.setInt(3, productid);
		pstmt.setString(4, review_content);
		pstmt.setInt(5, review_score);
		
		java.text.SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // format
		String stringDate = sdf.format(new java.util.Date());
		java.sql.Date date = java.sql.Date.valueOf(stringDate);
		pstmt.setDate(6, date);
		pstmt.setInt(7, orderid);


		pstmt.executeUpdate();

		conn.commit();
		conn.setAutoCommit(true);

	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		if (pstmt != null) {
			// conn.close();
			// pstmt.close();
		}

	}
}

public static void modifystock(Connection conn, int productid, int count)
		throws SQLException {
	Statement stmt = null;
	try {
		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		ResultSet uprs = stmt.executeQuery("SELECT * FROM offline_product WHERE offlineproduct_id="+productid);

		int db_productcount=0;

		while (uprs.next()) {
			db_productcount = uprs.getInt("offlineproduct_num");
			
			uprs.updateInt("offlineproduct_num", db_productcount-count);
			
			uprs.updateRow();
		}
		System.out.println("되나요?");
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		if (stmt != null) {
			// conn.close();
			// stmt.close();
		}
	}}}
