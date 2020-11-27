<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
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
<script src="./search-checkbox.js"></script>
<title>From zero</title>

<%ResultSet rs = (ResultSet)request.getAttribute("rs");%>
<%String search_result = (String)request.getAttribute("search_result"); %>
</head>
<body style="overflow-x: hidden">

	<header>
      <h1>
         <a href='main.html'>From zero</a>
      </h1>
   </header>
   <nav id="topMenu">
      <ul>
         <li class="topMenuLi"><a class="menuLink" href="ourStory.html">OUR
               STORY</a>
            <ul class="submenu" style="white-space: normal">
               <li><a href="introduce.html" class="submenuLink">사이트 소개</a></li>
               <li><a href="guide.html" class="submenuLink">이용 안내</a></li>
            </ul></li>
         <li>|</li>
         <li class="topMenuLi"><a class="menuLink" href="shop.jsp">SHOP</a>
            <ul class="submenu" style="white-space: normal">
               <li><a href="living.jsp" class="submenuLink">LIVING</a></li>
               <li><a href="bathroom.jsp" class="submenuLink">BATHROOM</a></li>
               <li><a href="kitchen.jsp" class="submenuLink">KITCHEN</a></li>
               <li><a href="kit.jsp" class="submenuLink">KIT</a></li>
               <li><a href="etc.jsp" class="submenuLink">ETC</a></li>
            </ul></li>
         <li>|</li>
         <li class="topMenuLi"><a class="menuLink" href="offline.html">OFFLINE</a>
         </li>
         <li>|</li>
         <li class="topMenuLi"><a class="menuLink" href="ecoDiary.html">ECO
               DIARY</a>
            <ul class="submenu" style="white-space: normal">
               <li><a href="aboutZW.html" class="submenuLink">ABOUT ZW</a></li>
               <li><a href="ecoTip.html" class="submenuLink">ECO TIP</a></li>
            </ul></li>
         <li>|</li>
         <li class="topMenuLi"><a class="menuLink" href="greenBoard.html">GREEN
               BOARD</a>
            <ul class="submenu" style="white-space: normal">
               <li><a href="notice.html" class="submenuLink">NOTICE</a></li>
               <li><a href="faq.html" class="submenuLink">FAQ</a></li>
               <li><a href="qna.html" class="submenuLink">QNA</a></li>
            </ul></li>
      </ul>
   </nav>


   <ul class="loginarea">
      <li><a href="myPage.html"> <img src="images/mypage.png"
            width=25 height=20>
      </a></li>
      <li><a href="cart.html">cart</a></li>
      <li><a href="login.html">login</a></li>
      <li><a href="join.html">join</a></li>
   </ul>
   
   <ul class="service">
      <li><a href="exchange.jsp"> <img src="images/exchange.png"
            width=40 height=50></a></li>
      <li><a href="test.jsp"><img src="images/test.png" width=40
            height=50></a></li>
   </ul>


   <!-- 체크박스 -->

   <form method="post" action="doLiving">
      <table>
			<tr>
				<th>소분류</th>
				<td><label><input type="checkbox" onClick="check()" name="smallCategory"
						value="집게" id="smallCategory1"> 집게</label></td>
				<td><label><input type="checkbox" onClick="check()" name="smallCategory"
						value="주머니/가방" id="smallCategory2"> 주머니/가방</label></td>
				<td><label><input type="checkbox" onClick="check()" name="smallCategory"
						value="책/노트" id="smallCategory3"> 책/노트</label></td>
				<td><label><input type="checkbox" onClick="check()" name="smallCategory"
						value="빨대" id="smallCategory4"> 빨대</label></td>
			</tr>


			<tr>
				<th>브랜드</th>
				<td><label><input type="checkbox" onClick="check()" name="brandName"
						value="더피커" id="brand1"> 더피커</label></td>
				<td><label><input type="checkbox" onClick="check()" name="brandName"
						value="지구샵" id="brand2"> 지구샵</label></td>
				<td><label><input type="checkbox" onClick="check()" name="brandName"
						value="제로웨이스트샵" id="brand3"> 제로웨이스트샵</label></td>
				<td><label><input type="checkbox" onClick="check()" name="brandName"
						value="지구살림e" id="brand4"> 지구살림e</label></td>
				<td />
			</tr>


			<tr>
				<th>가격</th>
				<td><input type="radio" onClick="check()" name="price"
						value="10000" id="one"><label for="one"> ~1만원</label></td>
				<td><input type="radio" onClick="check()" name="price"
						value="30000" id="three"><label for="three"> ~3만원</label></td>
				<td><input type="radio" onClick="check()" name="price"
						value="50000" id="five"><label for ="five"> ~5만원</label></td>
			</tr>
			
			<tr>
				<td/>
				<td/>
				<td colspan="4" style="text-align:right;"><input name="search_result" type="text" style= "width:500px; height:30px;" id="search-statement"/></td>
				<td style="text-align:left"><button type="reset">초기화</button></td>
				<td style="text-align:left"><input type="submit" value="검색" />
			</tr>
		</table>
   </form>
   
   <h3 style="float:left"> <%=search_result %></h3>
   <div class="big-shop-grid">
      <h2 class="big-category-text">LIVING</h2>
      <div class="div-shop-grid">
         <ul class="ul-shop-grid">
            <% 
            String img;
            String img_li = null;
            while (rs.next()) {
				String productname = null;
				String price = null;
				productname = rs.getString("productname");
				price = rs.getString("price");
				img = rs.getString("img");
				img_li = "living/" + img + ".jpg";
				
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
