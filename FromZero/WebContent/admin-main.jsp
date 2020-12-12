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
			<li class="topMenuLi"><a href="give_point.jsp" class="menuLink"
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
		<td>주문번호</td>
		<td>주문자</td>
		<td>주문금액</td>
		<td>주문날짜</td>
	</tr>
	<%
		try {
		conn = DriverManager.getConnection(DBUrl, connectionProps);

		String sqlSt = "select * from offline_order order by orderid, custid, allprice, orderdate";
		//where big_category='living' order by binary(big_category), binary(brand), price, productid";
		pstmt = conn.prepareStatement(sqlSt);
		rset = pstmt.executeQuery();
	} catch (SQLException e) {
		e.printStackTrace();
	}

	String orderid = null;
	String custid = null;
	String allprice = null;
	String orderdate = null;
	int count = 0;

	while (rset.next()) {
		orderid = rset.getString("orderid");
		custid = rset.getString("custid");
		allprice = rset.getString("allprice");
		orderdate = rset.getString("orderdate");
		count++;
	%>
	
	<tr>
		<td><%=orderid%></td>
		<td><%=custid%></td>
		<td><%=allprice%></td>
		<td><%=orderdate%></td>
	</tr>
	<%
		}
	%>
	</table>


	</div>
	

		</body>
</html>