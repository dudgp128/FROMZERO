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

/**
 * Servlet implementation class DoDetailProduct
 */
@WebServlet("/doDetailProduct")
public class DoDetailProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DoDetailProduct() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	/*
	public void recommend(HttpServletRequest request, HttpServletResponse response, String sqlSt) {
		ServletContext sc = getServletContext();
		Connection conn = (Connection) sc.getAttribute("DBconnection");
		
		ResultSet res = DBUtil.findProduct(conn, sqlSt);
		request.setAttribute("rs", res);
	}
	*/
	
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
		if (rs != null) {
			try {
				if (rs.next()) { // existing user
					productname = rs.getString("productname");
					price = rs.getString("price");
					img = rs.getString("img");
					big_category = rs.getString("big_category");
					small_category = rs.getString("small_category");
					request.setAttribute("productid", productid);
					request.setAttribute("productname", productname);
					request.setAttribute("price", price);
					request.setAttribute("img", img);
					request.setAttribute("big_category", big_category);
					//request.setAttribute("small_category", small_category);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} // try end
		}
		
		String recommend = "select * from online_product where (big_category='" + big_category + "') and (small_category='"
				+ small_category;
				//+ "') order by binary(big_category), binary(brand), price, productid";
		ResultSet res = DBUtil.findProduct(conn, recommend);
		request.setAttribute("rs", res);
		
		
		//recommend(request, response, sqlSt);
		
		RequestDispatcher view = request.getRequestDispatcher("product_detail.jsp");
		view.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8"); // 한글깨짐 방지
		response.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
