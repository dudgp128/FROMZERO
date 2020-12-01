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
<meta charset="UTF-8">
<title>Admin Page</title>
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
		<h1>From zero</h1>
		<div style="font-size:13pt">Admin Page for Offline Shop</div>
	</header>
	<nav id="topMenu">
		<ul>	
			<li class="topMenuLi"><a class="menuLink" href="">들어온 주문내역 확인</a>
			</li>
			<li>|</li>
			<li class="topMenuLi"><a class="menuLink" href="">재고 변경</a>
			</li>
			<li>|</li>
			<li class="topMenuLi"><a class="menuLink" href="">고객 포인트 지급</a>
			</li>
			
		</ul>
	</nav>
	<ul class="loginarea">
		<li><a>logout</a></li>
	</ul>
	
	<div class="title">
		<h2 style="text-align:center">들어온 주문내역 확인</h2>
	</div>
 
	<div class="question_box">
	<table>
	<tr>
		<td>주문자</td>
		<td>전화번호</td>
		<td>주문내역</td>
		<td>주문금액</td>
	</tr>
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
			
		//String name = null;
		//String phonenum = null;
		String productname = null;
		String price = null;
		int img_count = 0;
		String img_li = null;

		while (rset.next() && img_count < 5) {
			//name = rset.getString("name");
			//phonenum = rset.getString("phonenum");
			productname = rset.getString("productname");
			price = rset.getString("price");
			img_count++;
	%>
	
	<tr>
		<td>주문자</td>
		<td>전화번호</td>
		<td><%=productname%></td>
		<td><%=price%></td>
	</tr>
	<%
		}
	%>
	</table>


	</div>
	
</body>
</html>