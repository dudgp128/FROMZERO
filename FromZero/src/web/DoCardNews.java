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

import model.DBUtil;

/**
 * Servlet implementation class DoCardNews
 */
@WebServlet("/doCardNews")
public class DoCardNews extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoCardNews() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // 한글깨짐 방지
		response.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		ServletContext sc = getServletContext();
		Connection conn = (Connection) sc.getAttribute("DBconnection");

		String sqlSt = "select * from eco_tip where name= '" + name + "'";

		ResultSet rs = DBUtil.findProduct(conn, sqlSt);
		PrintWriter out = response.getWriter();
		
		//String eco_name = null;
		int count = 0;
		String title = null;
		if (rs != null) {
			try {
				if (rs.next()) { // existing user
					//eco_name = rs.getString("name");
					count = rs.getInt("count");
					title = rs.getString("title");

					request.setAttribute("name", name);
					request.setAttribute("count", count);
					request.setAttribute("title", title);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} // try end
		}

		//recommend(request, response, sqlSt);
		
		RequestDispatcher view = request.getRequestDispatcher("eco_detail.jsp");
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
