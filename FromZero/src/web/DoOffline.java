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

/**
 * Servlet implementation class DoOffline
 */
@WebServlet("/doOffline")
public class DoOffline extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoOffline() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String offline_store=request.getParameter("name_td");
		
		ServletContext sc=getServletContext();
		Connection con = (Connection) sc.getAttribute("DBconnection");
		
		String sqlSt="SELECT * FROM offline_product WHERE storename LIKE ";
		sqlSt=sqlSt+"'%"+offline_store+"%'";
		ResultSet rs=DBUtil.findStore(con, sqlSt);
		int storeid=0;
		
		if (rs != null) {
			try {
				request.setAttribute("rs", rs);
				request.setAttribute("storename", offline_store);
				RequestDispatcher view = request.getRequestDispatcher("offline_shop.jsp");
				view.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		System.out.println(sqlSt);

	}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
