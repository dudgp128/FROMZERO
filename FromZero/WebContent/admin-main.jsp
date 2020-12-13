<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.Properties"%>
<!DOCTYPE html>
<html>
<head>
<%
   String user_id = (String) session.getAttribute("user_id");
    String user_name = (String) session.getAttribute("user_name");
%>
<link rel="stylesheet" href="./fromzero.css" type="text/css">
<meta charset="UTF-8">
<title>From zero</title>
<style>
table {
    border-top: 1px solid #444444;
    margin:auto; 
    text-align:center;
  }
  
th, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
  }
 </style>
</head>
<body style="overflow-x: hidden">
   <%
   PreparedStatement pstmt = null;
   ResultSet rset = null;
   Connection conn = null;
   Properties connectionProps = new Properties();

   String DBUrl = "jdbc:mysql://localhost:3306/fz_webapp";
   String DBuser = "fz_webapp";
   String DBpasswd = "fz_webapp";
   String DBTimeZone = "UTC";

   connectionProps.put("user", DBuser);
   connectionProps.put("password", DBpasswd);
   connectionProps.put("serverTimezone", DBTimeZone);
   String name = null;
   %>

   <header>
      <h1><a href="main.jsp">From zero</a></h1>
      <div style="font-size: 13pt">Admin Page for Offline Shop</div>
   </header>
   <nav id="topMenu">
      <ul>
         <li class="topMenuLi"><a href="admin-main.jsp" class="menuLink"
            href="">들어온 주문내역 확인</a></li>
         <li>|</li>
         <li class="topMenuLi"><a href="update_stock.jsp"
            class="menuLink" href="">재고 변경</a></li>
         <li>|</li>
         <li class="topMenuLi"><a href="admin_point.jsp" class="menuLink"
            href="">고객 포인트 차감</a></li>

      </ul>
   </nav>

   <ul class="loginarea">
      <li><a><%=user_name%> 관리자님, 안녕하세요!</a>
      <li><a href="./doLogout">logout</a></li>
   </ul>
<div class="title">
            <h2 style="text-align:center">들어온 주문내역 확인</h2>
   </div>
 
   <div class="question_box">
   <table>
   <tr>
      <th>주문상품</th>
      <th>주문자 아이디</th>
      <th>가격</th>
      <th>개수</th>
      <th>주문날짜</th>
   </tr>
   <%
   
   System.out.println(user_name);
   
   // storeid 알아내기
   try {
      conn = DriverManager.getConnection(DBUrl, connectionProps);
      
      String sqlSt = "select storeid from offline_store where storename='" + user_name +"'";
      pstmt = conn.prepareStatement(sqlSt);
      rset = pstmt.executeQuery();
   } catch (SQLException e) {
      e.printStackTrace();
   }

   String storeid = null;
   while (rset.next()) {
      storeid = rset.getString("storeid");
   }
   
   System.out.println(storeid);
   
   // 모든 정보 불러오기
   try {
      conn = DriverManager.getConnection(DBUrl, connectionProps);

      String sqlSt = "select offlineproduct_name, item.custid, offlineproduct_price,count,orderdate from offline_product,offline_order_items item,offline_order where offline_order.orderid=item.orderid and  offline_product.offlineproduct_id=item.productid and item.storeid=" + storeid;
      
      pstmt = conn.prepareStatement(sqlSt);
      rset = pstmt.executeQuery();
   } catch (SQLException e) {
      e.printStackTrace();
   }

  String offlineproduct_name = null;
   String custid = null;
   int offlineproduct_price = 0;
   int count = 0;
   String orderdate = null;

   while (rset.next()) {
	   offlineproduct_name = rset.getString("offlineproduct_name");
      custid = rset.getString("item.custid");
      offlineproduct_price = rset.getInt("offlineproduct_price");
      count = rset.getInt("count");
      orderdate = rset.getString("orderdate");
   
   %>
   
   <tr>
      <td><%=offlineproduct_name%></td>
      <td><%=custid%></td>
      <td><%=offlineproduct_price%></td>
      <td><%=count%></td>
      <td><%=orderdate%></td>
   </tr>
   
   <%
   } 
   %>
</table>
   </div>
   </body>
</html>