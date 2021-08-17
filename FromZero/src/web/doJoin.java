package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DBUtil;

@WebServlet("/doJoin")
public class doJoin extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    public doJoin() {
        super();
    }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("UTF-8");  
      response.setCharacterEncoding("UTF-8");
      String nmid = request.getParameter("nmid");
      String npasswd = request.getParameter("npasswd");
      String nname=request.getParameter("nname");
      String naddress=request.getParameter("naddress");
      String nphone=request.getParameter("nphone");
      String nemail=request.getParameter("nemail");
      
      ServletContext sc=getServletContext();
      Connection conn=(Connection)sc.getAttribute("DBconnection");
      
      ResultSet rs = DBUtil.findUser(conn, nmid);

      if(rs!=null) {
         try {
            if(rs.next()) {
               if(nmid.equals(rs.getString(1))) {
                  response.sendRedirect("./join.jsp");
                  DBUtil.modifyUser(conn, nmid, npasswd, nname, naddress, nphone,nemail);
               }
            }else {
               response.sendRedirect("./login.jsp");
               DBUtil.insertWithParam(conn, nmid, npasswd, nname, naddress, nphone,nemail);
               
            }
         }catch (SQLException e) {
            e.printStackTrace();
         }   
      }
      }
            
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("UTF-8");   
      response.setCharacterEncoding("UTF-8");
      doGet(request, response);
   }

}