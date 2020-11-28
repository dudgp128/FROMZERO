package web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DBUtil;

/**
 * Servlet implementation class DoSearch
 */
@WebServlet("/doSearch")
public class DoSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); 	//한글깨짐 방지
		response.setCharacterEncoding("UTF-8");
		
		String search_text=request.getParameter("search_text");
		
		ServletContext sc=getServletContext();
		Connection conn=(Connection)sc.getAttribute("DBconnection");
		
		ResultSet rs=DBUtil.findText(conn,search_text);
		
		if(rs!=null) {
			try {
				request.setAttribute("rs",rs);
				request.setAttribute("search_text", search_text);
				RequestDispatcher view=request.getRequestDispatcher(path);
				view.forward(request, response);
			}
			catch (Exception e) {
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
