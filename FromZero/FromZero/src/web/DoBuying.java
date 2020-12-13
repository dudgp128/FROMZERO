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
 * Servlet implementation class DoBuying
 */
@WebServlet("/doBuying")
public class DoBuying extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DoBuying() {
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

		int count = Integer.parseInt(request.getParameter("product_count"));
		int all_price = Integer.parseInt(request.getParameter("product_price"));

		int order_id = 0;

		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("user_id");
		if(user_id==null) {
			System.out.println("세션null이다..!");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter pout = response.getWriter();
			pout.println("<script>alert('로그인이 필요합니다.'); location.href='login.html';</script>");
			pout.flush();
	}
	else {
		int product_id = Integer.parseInt((String) session.getAttribute("product_id"));

		ServletContext sc = getServletContext();
		Connection conn = (Connection) sc.getAttribute("DBconnection");
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
		try {
			DBUtil.insertItems(conn, order_id, product_id, user_id, count);
			DBUtil.insertBuying(conn, order_id, user_id, all_price);
			request.setAttribute("all_price", all_price);
			request.setAttribute("count", count);
			//response.sendRedirect("./buying_result.jsp");
			RequestDispatcher view = request.getRequestDispatcher("buying_result.jsp");
			view.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
