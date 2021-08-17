package web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.lang.Integer;

import model.DBUtil;

@WebServlet("/reviewDB")
public class ReviewDB extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ReviewDB() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("user_id");
		String review_content = request.getParameter("review_content");
		int productid = Integer.parseInt(request.getParameter("productid"));
		int review_score = Integer.parseInt(request.getParameter("rating"));
		int orderid = Integer.parseInt(request.getParameter("orderid"));

		ServletContext sc = getServletContext();
		Connection conn = (Connection) sc.getAttribute("DBconnection");

		ResultSet find_reviewid = DBUtil.findReviewid(conn);
		int reviewid = 0;

		if (find_reviewid != null) {
			int last_reviewid = 0;
			try {
				while (find_reviewid.next()) {
					last_reviewid = find_reviewid.getInt(1);
					reviewid = last_reviewid + 1;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else {
			reviewid = 1;
		}

		ResultSet rs = DBUtil.findReview(conn, user_id, productid, orderid);

		if (rs != null) {
			try {
				if (rs.next()) {
					String custid = rs.getString("custid");
					int db_productid = rs.getInt("productid");
					int db_orderid = rs.getInt("order_id");

					if (user_id.equals(custid) && productid == db_productid && orderid == db_orderid) {
						DBUtil.modifyReview(conn, review_content, user_id, productid, orderid);
						RequestDispatcher view = request.getRequestDispatcher("myPage.jsp");
						view.forward(request, response);
					}
				} else {
					DBUtil.insertReview(conn, reviewid, user_id, productid, review_content, review_score, orderid);
					RequestDispatcher view = request.getRequestDispatcher("myPage.jsp");
					view.forward(request, response);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
