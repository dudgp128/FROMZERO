package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DBUtil;

/**
 * Servlet implementation class doJoin
 */
@WebServlet("/doJoin")
public class doJoin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public doJoin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String nmid = request.getParameter("nmid");
		String npasswd = request.getParameter("npasswd");
		String nname=request.getParameter("nname");
		String naddress=request.getParameter("naddress");
		String nphone=request.getParameter("nphone");
		
		ServletContext sc=getServletContext();
		Connection conn=(Connection)sc.getAttribute("DBconnection");
		
		ResultSet rs = DBUtil.findUser(conn, nmid);

		PrintWriter out = response.getWriter();
		if(rs!=null) {
			try {
				if(rs.next()) {
					if(nmid.equals(rs.getString(1))) {
						response.sendRedirect("./join.html");
						DBUtil.modifyUser(conn, nmid, npasswd, nname, naddress, nphone);
						 //존재한다.
					}
				}else {
					response.sendRedirect("./index.html");
					DBUtil.insertWithParam(conn, nmid, npasswd, nname, naddress, nphone);
					
				}
			}catch (SQLException e) {
				e.printStackTrace();
			}	
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
