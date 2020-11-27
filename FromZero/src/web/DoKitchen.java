package web;

import java.io.IOException;
import java.io.PrintWriter;
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

/**
 * Servlet implementation class DoKitchen
 */
@WebServlet("/doKitchen")
public class DoKitchen extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoKitchen() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // 한글깨짐 방지
		response.setCharacterEncoding("UTF-8");
		String search_result = request.getParameter("search_result");
		String[] categoryCheck = request.getParameterValues("smallCategory");
		String[] brandCheck = request.getParameterValues("brandName");
		String price = request.getParameter("price");

		ServletContext sc = getServletContext();
		Connection conn = (Connection) sc.getAttribute("DBconnection");
		
		String sqlSt = "select * from online_product where (big_category='kitchen') ";
		if (request.getParameter("smallCategory") != null) {
			for (int i = 0; i < categoryCheck.length; i++) {
				if (i == 0)
					sqlSt += "and (";
				sqlSt += ("small_category = '" + categoryCheck[i] + "'");
				if (i == categoryCheck.length - 1)
					sqlSt += ") ";
				else
					sqlSt += " or ";
			}
		}
		if (request.getParameter("brandName") != null) {
			for (int i = 0; i < brandCheck.length; i++) {
				if (i == 0)
					sqlSt += "and (";
				sqlSt += ("brand = '" + brandCheck[i] + "'");
				if (i == brandCheck.length - 1)
					sqlSt += ") ";
				else
					sqlSt += " or ";
			}
		}
		if(price != null)
			sqlSt += "and (price <= " + price + ") ";
		
		sqlSt += "order by binary(big_category), binary(brand), price, productid";
		ResultSet rs = DBUtil.findCheckbox(conn, sqlSt);
		PrintWriter out = response.getWriter();
		if (rs != null) {
			try {
				request.setAttribute("rs", rs);
				request.setAttribute("search_result", search_result);
				RequestDispatcher view = request.getRequestDispatcher("checkbox_search_kitchen.jsp");
				view.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		System.out.println(sqlSt);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8"); // 한글깨짐 방지
		response.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
