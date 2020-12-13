package web;

import java.io.IOException;
import java.io.PrintWriter;
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

import model.DBUtil;

/**
 * Servlet implementation class DoCartBuying
 */
@WebServlet("/doCartBuying")
public class DoCartBuying extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DoCartBuying() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String btn = request.getParameter("action");
		// int productid = Integer.parseInt(request.getParameter("productID"));
		String[] scart = request.getParameterValues("cart");

		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("user_id");

		if (request.getParameter("cart") == null) {
			RequestDispatcher view = request.getRequestDispatcher("null_cart.jsp");
			view.forward(request, response);
		} else {
			int len = scart.length;
			String[] scount = new String[len];
			String[] sprice = new String[len];
			String[] img = new String[len];
			String[] name = new String[len];

			for (int i = 0; i < len; i++) {
				scount[i] = request.getParameter(scart[i]);
				sprice[i] = request.getParameter(scart[i] + "P");
				name[i] = request.getParameter(scart[i] + "N");
				img[i] = request.getParameter(scart[i] + "I");
			}

			// System.out.println(name[0]);
			int[] cart = new int[len];
			int[] count = new int[len];
			int[] price = new int[len];
			for (int i = 0; i < len; i++) {
				cart[i] = Integer.parseInt(scart[i]);
				count[i] = Integer.parseInt(scount[i]);
				price[i] = Integer.parseInt(sprice[i]);
			}

			int all_price = 0;
			for (int i = 0; i < len; i++) {
				all_price += count[i] * price[i];
			}

			// System.out.println(allPrice);
			int order_id = 0;

			ServletContext sc = getServletContext();
			Connection conn = (Connection) sc.getAttribute("DBconnection");

			if (btn.equals("BUY")) {
				ResultSet rs = DBUtil.getOnlineOrder(conn);
				if (rs != null) {
					try {
						while (rs.next()) {
							order_id = rs.getInt("orderid");
						}
						order_id++;
					} catch (Exception e) {
						e.printStackTrace();
					}
				} else {
					order_id = 1;
				}
				// System.out.println("가져온 주문 번호 : " + order_id);

				try {
					for (int i = 0; i < len; i++)
						DBUtil.insertItems(conn, order_id, cart[i], user_id, count[i]);
					DBUtil.insertBuying(conn, order_id, user_id, all_price);

					for (int i = 0; i < len; i++) {
						DBUtil.delCartItems(conn, user_id, cart[i]);
					}

					request.setAttribute("all_price", all_price);
					request.setAttribute("count", count);
					request.setAttribute("name", name);
					request.setAttribute("img", img);
					request.setAttribute("price", price);

					RequestDispatcher view = request.getRequestDispatcher("cart_buying_result.jsp");
					view.forward(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else if (btn.equals("DELETE")) {
				for (int i = 0; i < len; i++) {
					DBUtil.delCartItems(conn, user_id, cart[i]);
				}
				RequestDispatcher view = request.getRequestDispatcher("cart.jsp");
				view.forward(request, response);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
