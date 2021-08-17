package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.lang.Integer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DBUtil;

@WebServlet("/reserve_Offline")
public class Reserve_Offline extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Reserve_Offline() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("user_id");

		if (user_id == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter pout = response.getWriter();
			pout.println("<script>alert('로그인이 필요합니다.'); location.href='login.jsp';</script>");
			pout.flush();
		} else {
			String storeid = request.getParameter("offline_storeid");
			int i = Integer.parseInt(storeid);

			ServletContext sc = getServletContext();
			Connection con = (Connection) sc.getAttribute("DBconnection");

			String product_sqlSt = "SELECT * FROM offline_product WHERE storeid=" + i;
			ResultSet rs = DBUtil.findProduct(con, product_sqlSt);
			int offline_product_id = 0;

			ResultSet find_reserve = DBUtil.findReserve(con);
			int order_id = 0;

			if (find_reserve != null) {
				int db_orderid = 0;
				try {
					while (find_reserve.next()) {
						db_orderid = find_reserve.getInt(1);
						order_id = db_orderid + 1;
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else {
				order_id = 1;
			}

			int all_price = 0;
			int offline_price = 0;
			int noting_reserve = 0;

			if (rs != null) {
				try {
					while (rs.next()) {
						offline_product_id = rs.getInt(1);
						String s_offline_id = Integer.toString(offline_product_id);
						offline_price = rs.getInt("offlineproduct_price");
						if (request.getParameter(s_offline_id) == null)
							continue;
						int count = Integer.parseInt(request.getParameter(s_offline_id));
						if (count != 0) {
							noting_reserve++;
							DBUtil.insertReserve(con, order_id, offline_product_id, user_id, i, count);
							DBUtil.modifystock(con, offline_product_id, count);
							all_price = all_price + (offline_price * count);
						}
					}
					if (noting_reserve != 0) {
						DBUtil.insertReserveOrder(con, order_id, user_id, i, all_price);
						request.setAttribute("reserve_check", "주문 내역은 마이페이지에서 확인 가능합니다.");
						RequestDispatcher view = request.getRequestDispatcher("reserve_check.jsp");
						view.forward(request, response);
					} else {
						request.setAttribute("reserve_check", "아무것도 예약하지 않으셨습니다.");
						RequestDispatcher view = request.getRequestDispatcher("reserve_check.jsp");
						view.forward(request, response);
					}

				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
