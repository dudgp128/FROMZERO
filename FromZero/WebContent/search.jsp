<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
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
<meta charset="UTF-8">
<link rel="stylesheet" href="./fromzero.css" type="text/css">
<title>From zero</title>

<%
   ResultSet rs = (ResultSet) request.getAttribute("rs");
%>
<%
   String search_text = (String) request.getAttribute("search_text");
%>
</head>
<body style="overflow-x: hidden">

   <%@ include file="./fz_header.jsp" %>

   <div class="big-shop-grid">
      <h2 class="big-category-text"></h2>
      <div class="div-shop-grid">
         <ul class="ul-shop-grid">
            <%
               String img;
            String img_li = null;
            String big_category = null;
            while (rs.next()) {
               String productname = null;
               String price = null;
               productname = rs.getString("productname");
               big_category = rs.getString("big_category");
               price = rs.getString("price");
               img = rs.getString("img");
               img_li = big_category + "/" + img + ".jpg";

               System.out.println(productname);
            %>
            <li id="li-living-item-box"><a href="living-item1.html">
                  <div class="div-display-living-box">
                     <img class="img-display-box" src="<%=img_li%>" alt="">
                     <div class="display-text">
                        <strong><%=productname%></strong>
                        <p><%=price%>원
                        </p>
                     </div>
                  </div>
            </a></li>
            <%
               }
            %>
         </ul>
      </div>
   </div>
</body>
</html>