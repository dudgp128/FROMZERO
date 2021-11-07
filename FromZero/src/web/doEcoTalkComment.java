package web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DBUtil;

@WebServlet("/doEcoTalkComment")
public class doEcoTalkComment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public doEcoTalkComment() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
	      
		HttpSession session = request.getSession();
		int comment_id = (int)session.getAttribute("comment_id");
		String custid = (String) session.getAttribute("user_id");
		if (custid == null) 
			custid="비회원";
		
		int board_id = Integer.parseInt((String) session.getAttribute("board_id"));
		String comment = request.getParameter("comment");
	
		ServletContext sc = getServletContext();
		Connection conn = (Connection) sc.getAttribute("DBconnection");
		
		try {
			DBUtil.insertComment("ecotalk_comment",conn, comment_id, custid, board_id, comment);
			String board_id_string = Integer.toString(board_id);
			request.setAttribute("board_id", board_id_string);
			RequestDispatcher view = request.getRequestDispatcher("ECOTALK_board.jsp");
		    view.forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
