package web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DBUtil;

@WebServlet("/doOffline")
public class DoOffline extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DoOffline() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		String offline_store = request.getParameter("name_td");

		ServletContext sc = getServletContext();
		Connection con = (Connection) sc.getAttribute("DBconnection");

		String store_sqlSt = "SELECT * FROM offline_store WHERE storename LIKE ";
		store_sqlSt = store_sqlSt + "'%" + offline_store + "%'";

		ResultSet store_rs = DBUtil.findStore(con, store_sqlSt);
		int i = 0;
		if (store_rs != null) {
			try {
				if (store_rs.next()) {
					i = store_rs.getInt(1);
				}}
			catch (Exception e) {
					e.printStackTrace();
				}
			}

			String product_sqlSt = "SELECT * FROM offline_product WHERE storeid=" + i;
			ResultSet rs = DBUtil.findProduct(con, product_sqlSt);

			if (rs != null) {
				try {
					request.setAttribute("rs", rs);
					request.setAttribute("storename", offline_store);
					request.setAttribute("offline_storeid", i);
					RequestDispatcher view = request.getRequestDispatcher("offline_shop.jsp");
					view.forward(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
