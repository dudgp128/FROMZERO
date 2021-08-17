package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DBUtil;

@WebServlet("/doSearch")
public class DoSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DoSearch() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); 
		response.setCharacterEncoding("UTF-8");

		String search_text = request.getParameter("search_text");
		if (search_text == "") {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('검색어가 없습니다.'); history.go(-1);</script>");
			writer.close();

		} else {
			ServletContext sc = getServletContext();
			Connection conn = (Connection) sc.getAttribute("DBconnection");

			String sqlSt = "SELECT * FROM online_product WHERE productname LIKE ";
			sqlSt = sqlSt + "'%" + search_text + "%'";
			ResultSet rs = DBUtil.findText(conn, sqlSt);
			PrintWriter out = response.getWriter();
			
			if (rs != null) {
				try {
					request.setAttribute("rs", rs);
					request.setAttribute("search_text", search_text);
					RequestDispatcher view = request.getRequestDispatcher("search.jsp");
					view.forward(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
