package web;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DoDetailProduct
 */
@WebServlet("/doFAQ")
public class DoFAQ extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DoFAQ() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // 한글깨짐 방지
		response.setCharacterEncoding("UTF-8");
		
		String board_id = request.getParameter("boardID");
		System.out.println("확인 : " + board_id);
		
		request.setAttribute("board_id", board_id);
		RequestDispatcher view = request.getRequestDispatcher("faq_board.jsp");
		view.forward(request, response);

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
