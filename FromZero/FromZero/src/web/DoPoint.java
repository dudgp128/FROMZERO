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

/**
 * Servlet implementation class DoPoint
 */
@WebServlet("/doPoint")
public class DoPoint extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoPoint() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); 	//한글깨짐 방지
		response.setCharacterEncoding("UTF-8");
		
		int soju=Integer.parseInt(request.getParameter("soju"));
		int beer=Integer.parseInt(request.getParameter("beer"));
		int milk=Integer.parseInt(request.getParameter("milk"));
		int water=Integer.parseInt(request.getParameter("water"));
		int point=Integer.parseInt(request.getParameter("point"));
		
		HttpSession session=request.getSession(); //세션 반환 (세선 ㅇ-반환, 세션x-생성)
		String user_id=(String)session.getAttribute("user_id"); //세션 값 불러오기 

		
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


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
