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
import javax.servlet.http.HttpSession;

import model.DBUtil;

/**
 * Servlet implementation class DoLevel
 */
@WebServlet("/DoLevel")
public class DoLevel extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DoLevel() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8"); 	//한글깨짐 방지
		response.setCharacterEncoding("UTF-8");
		
		int q1=Integer.parseInt(request.getParameter("q1"));
		int q2=Integer.parseInt(request.getParameter("q2"));
		int q3=Integer.parseInt(request.getParameter("q3"));
		int q4=Integer.parseInt(request.getParameter("q4"));
		int q5=Integer.parseInt(request.getParameter("q5"));
		int q6=Integer.parseInt(request.getParameter("q6"));
		int q7=Integer.parseInt(request.getParameter("q7"));
		int q8=Integer.parseInt(request.getParameter("q8"));
		
		int result_int = q1+q2+q3+q4+q5+q6+q7+q8;
		String level=null;
		
		if(result_int<=12)
			level="새싹";
		else if(result_int>12 && result_int<=20)
			level="화분";
		else if(result_int>20 && result_int<=27)
			level="나무";
		else if(result_int>27 && result_int<=32)
			level="숲";
		
		
		HttpSession session=request.getSession(); //세션 반환 (세선 ㅇ-반환, 세션x-생성)
		String user_id=(String)session.getAttribute("user_id"); //세션 값 불러오기 

		
		ServletContext sc = getServletContext();
		Connection conn= (Connection) sc.getAttribute("DBconnection");

		ResultSet rs = DBUtil.findUser(conn, user_id);

		if(rs!=null) {
			try {
				if(rs.next()) {
					DBUtil.updateLevel(conn, user_id, level);
			}catch (SQLException e) {
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
		request.setCharacterEncoding("UTF-8"); // 한글깨짐 방지
		response.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
