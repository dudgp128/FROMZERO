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
import model.User;

@WebServlet("/doDetailProduct")
public class DoDetailProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DoDetailProduct() {
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // 한글깨짐 방지
		response.setCharacterEncoding("UTF-8");
		String productid = request.getParameter("productid");
		ServletContext sc = getServletContext();
		Connection conn = (Connection) sc.getAttribute("DBconnection");

		String sqlSt = "select * from online_product where productid=";
		sqlSt += productid;

		ResultSet rs = DBUtil.findProduct(conn, sqlSt);
		PrintWriter out = response.getWriter();
		
		String productname = null;
		String price = null;
		String img = null;
		String big_category = null;
		String small_category = null;
		String brand = null;
		
		if (rs != null) {
			try {
				if (rs.next()) { 
					productname = rs.getString("productname");
					price = rs.getString("price");
					img = rs.getString("img");
					big_category = rs.getString("big_category");
					small_category = rs.getString("small_category");
					brand = rs.getString("brand");
					request.setAttribute("productid", productid);
					request.setAttribute("productname", productname);
					request.setAttribute("price", price);
					request.setAttribute("img", img);
					request.setAttribute("big_category", big_category);
					request.setAttribute("brand", brand);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} 
		}
		
		String recommend = "select * from online_product where (big_category='" + big_category + "') and (small_category='"
				+ small_category + "') order by binary(big_category), binary(brand), price, productid";
		ResultSet res = DBUtil.findProduct(conn, recommend);
		request.setAttribute("rs", res);
		
		RequestDispatcher view = request.getRequestDispatcher("product_detail.jsp");
		view.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // 한글깨짐 방지
		response.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
