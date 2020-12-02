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
<link rel="stylesheet" href="./fromzero.css" type="text/css">
<% String user_id=(String)session.getAttribute("user_id");
	session.getAttribute("productid");
	String productid =  (String) session.getAttribute("productid");
	String productname = (String) session.getAttribute("productname");
	String price =  (String) session.getAttribute("price");
	String img_num =  (String) session.getAttribute("img_num");
%>
<meta charset="UTF-8">
<title>상품 구매</title>

<style>
	.img-display-box {
		padding:7%;
	}
	
	.buy-button {
		padding:7%;
	}
	
</style>
</head>
<body>
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
	<%@ include file="./fz_header.jsp"%>
	
	<div>
      <h2 id="bigCategory" style="text-align: center; margin-top: 20px;">구매 페이지</h2>
      </div>
   
   <form method="post" action="doBuying">
   <div>
      <div class="product-detail">
      <img class="img-display-box" src="<%=img_num%>" alt="" align="left">
      <br><br><br><br><br><br><br>
         <div class="display-text">
            <strong><%=productname%></strong>
            <p><%=price%>원</p>
         </div><br>
      
         <p>수량
         <input id="product-count" type="number" name="product-count" min="1" 
            max="10" step="1" value="1" />
         </p>
      </div>
   </div>
   
   <div class="buy-button" align="right">
      <p>총 가격 : <%=price%>원</p>
      <button type="submit"> BUY </button>
   </div>
   
   </form>
	
</body>
</html>