package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BrandAscending;
import model.DBUtil;
import model.NameAscending;
import model.PriceAscending;
import model.PriceDescending;
import model.Product;

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
		String sort = request.getParameter("sorted");

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
		ResultSet rs = DBUtil.findProduct(conn, sqlSt);
		PrintWriter out = response.getWriter();
		if (rs != null) {
			try {
				ArrayList<Product> data = new ArrayList<Product>();
				String productid = null;
				String productname = null;
				String brand = null;
				int pprice = 0;
				String img_li = null;
				String big_category = null;
				String small_category = null;
				String img = null;
				while (rs.next()) {
					productid = rs.getString("productid");
					productname = rs.getString("productname");
					brand = rs.getString("brand");
					pprice = rs.getInt("price");
					big_category = rs.getString("big_category");
					small_category = rs.getString("small_category");
					img_li = rs.getString("img");

					img = "kitchen/" + img_li + ".jpg";
					data.add(new Product(productid, productname, brand, pprice, big_category, small_category, img));
				}

				if (sort != null) {
					if (sort.equals("브랜드순")) {
						BrandAscending brandAscending = new BrandAscending();
						Collections.sort(data, brandAscending);
					} else if (sort.equals("이름순")) {
						NameAscending nameAscending = new NameAscending();
						Collections.sort(data, nameAscending);
					} else if (sort.equals("가격 낮은순")) {
						PriceAscending priceAscending = new PriceAscending();
						Collections.sort(data, priceAscending);
					} else if (sort.equals("가격 높은순")) {
						PriceDescending priceDescending = new PriceDescending();
						Collections.sort(data, priceDescending);
					}
				}

				//request.setAttribute("rs", rs);
				request.setAttribute("data", data);
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
