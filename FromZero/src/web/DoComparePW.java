package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DBUtil;
import model.User;

@WebServlet("/doComparePW")
public class DoComparePW extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DoComparePW() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String board_id = request.getParameter("board_id");
		String comparePW = request.getParameter("comparePW");
		
		ServletContext sc=getServletContext();
	    Connection conn=(Connection)sc.getAttribute("DBconnection");
	    
		ResultSet rs = DBUtil.comparePW(conn, board_id);
		
		PrintWriter out = response.getWriter();
		if (rs != null) {
			try{
				if(rs.next()) {
						String password = rs.getString("password");
						
						if(password.equals(comparePW)){
							request.setAttribute("board_id", board_id);
							RequestDispatcher view = request.getRequestDispatcher("qna_board.jsp");
						    view.forward(request, response);
						}
						else{
							response.setContentType("text/html; charset=UTF-8");
					        PrintWriter pout = response.getWriter();
					        out.println("<script>alert('비밀번호가 일치하지 않습니다.'); location.href='QnA.jsp';</script>");
						}
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} 
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
