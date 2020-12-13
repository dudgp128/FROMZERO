package web;

import java.io.IOException;
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

/**
 * Servlet implementation class DoReview
 */
@WebServlet("/doReview")
public class DoReview extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DoReview() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // 한글깨짐 방지
		response.setCharacterEncoding("UTF-8");

		String productid=request.getParameter("online_productid");
		int intproductid=Integer.parseInt(productid);
		String productname = request.getParameter("productname");
		String count = request.getParameter("count");
		String price = request.getParameter("price");
		int product_img = 0;
		String big_category="";
		int orderid=Integer.parseInt(request.getParameter("orderid"));
		
		ServletContext sc = getServletContext();
		Connection conn = (Connection) sc.getAttribute("DBconnection");

		 HttpSession session=request.getSession();
		 String user_id=(String) session.getAttribute("user_id");
		 
		ResultSet rset=DBUtil.findReview(conn,user_id,intproductid,orderid);
		String db_review_content="";
		if(rset!=null) {
			System.out.println("1");
			
			try {
				if(rset.next()) {
					System.out.println("2");
					String custid=rset.getString("custid");
					int db_productid=rset.getInt("productid");
					int db_orderid=rset.getInt("order_id");
					
					if(user_id.equals(custid) && intproductid==db_productid && orderid==db_orderid) {
						db_review_content=rset.getString("review_content");
					}
				}
			}
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			}
		String sqlSt = "select productname, img ,big_category, productid from online_product where productid ="+productid;
		ResultSet rs = DBUtil.findProduct(conn, sqlSt);

		if(rs!=null) {
			try {
				if(rs.next()) {
					product_img = rs.getInt(2);
					big_category=rs.getString("big_category");
					request.setAttribute("productname", productname);
					request.setAttribute("count", count);
					request.setAttribute("price", price);
					request.setAttribute("product_img", product_img);
					request.setAttribute("big_category", big_category);
					request.setAttribute("productid", productid);
					request.setAttribute("orderid", orderid);
					request.setAttribute("db_review_content", db_review_content);
					
					RequestDispatcher view = request.getRequestDispatcher("review_write.jsp");
					view.forward(request, response);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
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
