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

@WebServlet("/doDeleteWriting")
public class DoDeleteWriting extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DoDeleteWriting() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		String board_id = (String) session.getAttribute("board_id");
		String cust_id = (String) session.getAttribute("cust_id");
		String page = (String) session.getAttribute("page");
		ServletContext sc = getServletContext();
		Connection conn = (Connection) sc.getAttribute("DBconnection");
		RequestDispatcher view = null;

		try {
			if (cust_id.equals("admin")) {
				if (page.equals("faq")) {
					DBUtil.deleteECOTALK(conn, board_id);
					view = request.getRequestDispatcher("ECOTALK.jsp");
					view.forward(request, response);
				} else if (page.equals("notice")) {
					DBUtil.deleteNotice(conn, board_id);
					view = request.getRequestDispatcher("notice.jsp");
					view.forward(request, response);
				}
			} else {
				DBUtil.deleteQNA(conn, board_id);
				view = request.getRequestDispatcher("QnA.jsp");
				view.forward(request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
