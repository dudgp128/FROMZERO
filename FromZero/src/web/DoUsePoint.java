package web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DBUtil;

@WebServlet("/doUsePoint")
public class DoUsePoint extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DoUsePoint() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); 
		response.setCharacterEncoding("UTF-8");
		ServletContext sc = getServletContext();
		Connection conn= (Connection) sc.getAttribute("DBconnection");
		String point = request.getParameter("point");
		String custid = request.getParameter("custid");
		
		try {
				DBUtil.usePoint(conn, custid, point);
				RequestDispatcher view = request.getRequestDispatcher("admin_point.jsp");
			    view.forward(request, response);
	        } catch (SQLException e) {
	           e.printStackTrace();
	        }
	        
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
