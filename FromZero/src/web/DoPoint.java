package web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DBUtil;
import model.User;

@WebServlet("/doPoint")
public class DoPoint extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DoPoint() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); 	
		response.setCharacterEncoding("UTF-8");
		
		int soju=Integer.parseInt(request.getParameter("soju"));
		int beer=Integer.parseInt(request.getParameter("beer"));
		int milk=Integer.parseInt(request.getParameter("milk"));
		int water=Integer.parseInt(request.getParameter("water"));
		int point=Integer.parseInt(request.getParameter("point"));
		
		HttpSession session=request.getSession(); 
		String user_id=(String)session.getAttribute("user_id"); 
		ServletContext sc=getServletContext();
		Connection conn=(Connection)sc.getAttribute("DBconnection");
		ResultSet rs=DBUtil.findPoint(conn, user_id);
		
		if(rs!=null) {
			try {
				if(rs.next()) {
					if(user_id.equals(rs.getString(1))) {
						DBUtil.modifyPoint(conn,user_id,soju,beer,milk,water,point);
						response.sendRedirect("./exchange.jsp");

					}
				}else {
					DBUtil.insertPoint(conn,user_id,soju,beer,milk,water,point);
					response.sendRedirect("./exchange.jsp");
				}
			}catch (SQLException e) {
				e.printStackTrace();
			}	
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
