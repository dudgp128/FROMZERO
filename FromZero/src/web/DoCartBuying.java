package web;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DBUtil;

/**
 * Servlet implementation class DoCartBuying
 */
@WebServlet("/doCartBuying")
public class DoCartBuying extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoCartBuying() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		//String btn = request.getParameter("action");
		int productid = Integer.parseInt(request.getParameter("productID"));
		//System.out.println(productid);
		String[] cart = null;
		String ocart = null;
		//= request.getParameterValues("cart");
		
		//System.out.println(cart[0]);
		
		
		/*
		if (btn.equals("BUY")) {
			
		} 
		else if (btn.equals("DELETE")) {
			
		}
		*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
