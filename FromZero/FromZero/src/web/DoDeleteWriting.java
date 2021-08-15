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
import javax.servlet.http.HttpSession;

import model.DBUtil;

/**
 * Servlet implementation class doDeleteQnA
 */
@WebServlet("/doDeleteWriting")
public class DoDeleteWriting extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DoDeleteWriting() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String board_id = (String) session.getAttribute("board_id");
		System.out.println("doget()>board_id=" + board_id);
		String cust_id = (String) session.getAttribute("cust_id");

		ServletContext sc = getServletContext();
		Connection conn = (Connection) sc.getAttribute("DBconnection");
		RequestDispatcher view = null;

		if (cust_id == "admin") {
			try {
				DBUtil.deleteFAQ(conn, board_id);
				view = request.getRequestDispatcher("FAQ.jsp");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			System.out.println("doDelete>board_id=" + board_id);
			DBUtil.deleteQNA(conn, board_id);
			view = request.getRequestDispatcher("QnA.jsp");
		}
		view.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
