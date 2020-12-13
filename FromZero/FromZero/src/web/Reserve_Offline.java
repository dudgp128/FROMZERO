package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.lang.Integer;

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
 * Servlet implementation class Reserve_Offline
 */
@WebServlet("/reserve_Offline")
public class Reserve_Offline extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Reserve_Offline() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // 한글깨짐 방지
		response.setCharacterEncoding("UTF-8");
		
		HttpSession session=request.getSession(); //세션 반환 (세선 ㅇ-반환, 세션x-생성)
		String user_id=(String)session.getAttribute("user_id"); //세션 값 불러오기  
		
		if(user_id==null) {
				System.out.println("세션null이다..!");
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter pout = response.getWriter();
				pout.println("<script>alert('로그인이 필요합니다.'); location.href='login.html';</script>");
				pout.flush();
		}
		else {
		

		String storeid=request.getParameter("offline_storeid");
		int i=Integer.parseInt(storeid);
		System.out.println("int변환 : "+ storeid);
		
		
		ServletContext sc=getServletContext();
		Connection con =(Connection) sc.getAttribute("DBconnection");
		
		String product_sqlSt = "SELECT * FROM offline_product WHERE storeid=" + i;
		ResultSet rs=DBUtil.findProduct(con, product_sqlSt);
		int offline_product_id=0;
		
		ResultSet find_reserve=DBUtil.findReserve(con);
		int order_id=0;
		
		if(find_reserve!=null) {
			int db_orderid=0;
			try {
					while(find_reserve.next()) {
					db_orderid=find_reserve.getInt(1);
					order_id=db_orderid+1;
						}
					
					//reservecustid=find_reserve.getString("custid");
					//System.out.println("DB 저장 : "+ reservecustid);
					//System.out.println("세션 id : "+user_id);
					//if(user_id.equals(reservecustid))
					//	System.out.println("reserve=user같다");
					//	order_id=find_reserve.getInt("orderid");
					//}
				 //order_id=order_id+1;
			}catch(Exception e) {
					e.printStackTrace();
				}
			}
		else {order_id=1;}
		
		int all_price=0;
		int offline_price=0;
		int noting_reserve=0;

		if(rs!=null) {
			try {
				while(rs.next()) {
					offline_product_id=rs.getInt(1);
					//System.out.println("offline_product_id : "+offline_product_id);
					String offline_count=Integer.toString(offline_product_id);
					offline_price=rs.getInt("offlineproduct_price");
					//System.out.println(soffline_product_id)
					//System.out.println("offline_product_name : "+offline_product_name);
					int count=Integer.parseInt(request.getParameter(offline_count));
					if(count!=0) {
							noting_reserve++;
							DBUtil.insertReserve(con,order_id,offline_product_id,user_id,i,count);
							DBUtil.modifystock(con, offline_product_id, count);
							all_price=all_price+(offline_price*count);
						} 	
						}
				if(noting_reserve!=0) {
				DBUtil.insertReserveOrder(con, order_id, user_id,i, all_price);
				request.setAttribute("reserve_check", "주문 내역은 마이페이지에서 확인 가능합니다.");
				RequestDispatcher view = request.getRequestDispatcher("reserve_check.jsp");
		    	view.forward(request, response);
				}
				else {
					request.setAttribute("reserve_check", "아무것도 예약하지 않으셨습니다.");
					RequestDispatcher view = request.getRequestDispatcher("reserve_check.jsp");
			    	view.forward(request, response);
				}
					
				} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8"); 	//한글깨짐 방지
		response.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
