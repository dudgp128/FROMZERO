package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DBUtil;
import model.User;


/**
 * Servlet implementation class DoLogin
 */
@WebServlet("/doLogin")
public class DoLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); 	//한글깨짐 방지
		response.setCharacterEncoding("UTF-8");
		String mid = request.getParameter("mid");
		String passwd = request.getParameter("passwd");
		String name = null;
		String address = null;
		String phone = null;
		//User user = new User(mid, passwd, name, address, phone);
		
		ServletContext sc = getServletContext();
		Connection conn= (Connection) sc.getAttribute("DBconnection");

		ResultSet rs = DBUtil.findUser(conn, mid);

		PrintWriter out = response.getWriter();
		if (rs != null) {
			try{
				if(rs.next()) { // existing user
						String checkpw = rs.getString("passwd");
						name = rs.getString("name");
						address = rs.getString("address");
						phone = rs.getString("phone");
						User user = new User(mid, passwd, name, address, phone);

						if(checkpw.equals(passwd)){// valid user and passwd
							request.setAttribute("user", user);
							RequestDispatcher view = request.getRequestDispatcher("main.jsp");
						    view.forward(request, response);
						}
						else{// wrong passwd
							out.println("Wrong Passwd!!");
						}
				}
				else { // invalid user
					out.println("Invalid User Name!!");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} //try end
		} // if end
		} // doGet() end
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8"); 	//한글깨짐 방지
		response.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
