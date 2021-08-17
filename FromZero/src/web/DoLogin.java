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
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import model.DBUtil;
import model.User;

@WebServlet("/doLogin")
public class DoLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public DoLogin() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); 
		response.setCharacterEncoding("UTF-8");
		String mid = request.getParameter("mid");
		String passwd = request.getParameter("passwd");
		String name = null;
		String address = null;
		String phone = null;

		ServletContext sc = getServletContext();
		Connection conn = (Connection) sc.getAttribute("DBconnection");

		ResultSet rs = DBUtil.findUser(conn, mid);

		PrintWriter out = response.getWriter();
		if (rs != null) {
			try {
				if (rs.next()) { 
					String checkpw = rs.getString("passwd");
					name = rs.getString("name");
					address = rs.getString("address");
					phone = rs.getString("phone");

					User user = new User(mid, passwd, name, address, phone);

					if (checkpw.equals(passwd)) { // valid user and passwd
						request.setAttribute("user", user);

						HttpSession session = request.getSession(); 
						session.setAttribute("user_id", mid); 
						session.setAttribute("user_name", name);
						RequestDispatcher view = request.getRequestDispatcher("main.jsp");
						view.forward(request, response);
					} else {// wrong passwd
						response.setContentType("text/html; charset=UTF-8");
						PrintWriter pout = response.getWriter();
						pout.println("<script>alert('잘못된 비밀번호입니다.'); location.href='login.jsp';</script>");
						pout.flush();
					}
				} else { // invalid user
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter pout = response.getWriter();
					pout.println("<script>alert('가입되지 않은 아이디입니다.'); location.href='login.jsp';</script>");
					pout.flush();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} 
		}
	} 

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
