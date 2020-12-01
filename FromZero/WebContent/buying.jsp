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
<% String user_id=(String)session.getAttribute("user_id");%>
<% String price=(String)session.getAttribute("price");%>
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
		<header>
		<h1>
			<a href='main.html'>From zero</a>
		</h1>
	</header>
	
	<nav id="topMenu">
		<ul>
			<li id="topMenuLi"><a class="menuLink" href="ourStory.html">OUR
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
			<li id="topMenuLi"><a class="menuLink" href="offline.html">OFFLINE</a>
			</li>
			<li>|</li>
			<li id="topMenuLi"><a class="menuLink" href="ecoDiary.html">ECO
					DIARY</a>
				<ul class="submenu" style="white-space: normal">
					<li><a href="aboutZW.html" class="submenuLink">ABOUT ZW</a></li>
					<li><a href="ecoTip.html" class="submenuLink">ECO TIP</a></li>
				</ul></li>
			<li>|</li>
			<li id="topMenuLi"><a class="menuLink" href="greenBoard.html">GREEN
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
	
	<div>
      <h2 id="bigCategory" style="text-align: center; margin-top: 20px;">구매 페이지</h2>
   	</div>
	
	<form method="post" action="doBuying">
	<div>
		<%
		try {
			conn = DriverManager.getConnection(DBUrl, connectionProps);

			String sqlSt = "select * from online_product where big_category='living' order by binary(big_category), binary(brand), price, productid";
			pstmt = conn.prepareStatement(sqlSt);
			rset = pstmt.executeQuery();
			} 
		catch (SQLException e) {
			e.printStackTrace();
			}
		
		String productname = null;
		price = null;
		
		int img_count = 0;
		String img_li = null;

		while (rset.next() && img_count < 1) {
		productname = rset.getString("productname");
		price = rset.getString("price");
		img_count++;
		img_li = "living/" + img_count + ".jpg";
		%>
		
		
		<div class="product-detail">
		<img class="img-display-box" src="<%=img_li%>" alt="" align="left">
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
		<%
		}
		%>
	</div>
	
	<div class="buy-button" align="right">
		<p>총 가격 : <%=price%>원</p>
		<button type="submit"> BUY </button>
	</div>
	
	</form>
</body>
</html>