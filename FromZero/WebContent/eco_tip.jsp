<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.Properties"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="javax.servlet.http.HttpSession"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./fromzero.css" type="text/css">
<style>
ul {
	list-style: none;
}

.leftMenu {
	margin-top: 50px;
	margin-left: 50px;
	float: left;
	display: block;
}

.leftMenu li a {
	padding: 10px;
	text-align: center;
}

.bigCategory {
	margin-left: 100px;
	text-align: center;
}

.content {
	float: left;
	background-color: #dddddd;
	/*width: 1200px;*/
}
</style>
<meta charset="UTF-8">
<title>From zero</title>
</head>


<body style="overflow-x: hidden">
	<%@ include file="./fz_header.jsp"%>

	<div class="title">
		<h2 style="text-align: center">에코 뉴스</h2>
	</div>
	
	<div style="text-align: center;">
	<br><br>
	<div id="content" style="display: inline-block; width: 1200px; padding:10px">
		<ul class="ul-shop-grid" style="margin:0 auto">
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
			try {
				conn = DriverManager.getConnection(DBUrl, connectionProps);

				String sqlSt = "select * from eco_tip";
				pstmt = conn.prepareStatement(sqlSt);
				rset = pstmt.executeQuery();
			} catch (SQLException e) {
				e.printStackTrace();
			}

			String eco_name = null;
			String title = null;
			String img_path = null;

			while (rset.next()) {
				name = rset.getString("name");
				title = rset.getString("title");
				img_path = "card_news/" + name + " (1).jpg";
			%>
			<form method="post" action="doCardNews" style="margin: 0 auto">
				<button style="border: 0; outline: 0; background-color: white"
					name="name" value=<%=name%>>
					<li id="li-living-item-box">
						<div class="div-display-living-box" style="margin-left: 0">
							<img class="img-display-box" src="<%=img_path%>" alt="">
							<div class="display-text">
								<strong><%=title%></strong>
							</div>
						</div> </a>
					</li>

					<%
						}
					%>
				</button>
		</ul>
		</form>

	</div>
	</div>




</body>
</html>