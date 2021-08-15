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
<head>
<link rel="stylesheet" href="./fromzero.css" type="text/css">
<meta charset="UTF-8">
<title>From zero</title>

<style>
table {
	width: 1500px;
	table-layout: fixed;
	font-size: 14px;
	color: #666;
	border: 0;
	background-color: white;
	margin: 0;
	padding: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
	border-top: 1px solid #444444;
	border-bottom: 1px solid #444444;
	border-collapse: collapse;
}

th, td {
	background-color: white;
	border-bottom: 1px solid #444444;
	padding: 10px;
}

#menu, #content {
	margin: 50px;
}

<!-- 왼쪽 네비게이션 -->
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

</style>
</head>

<body style="overflow-x: hidden">
	<%@ include file="./fz_header.jsp" %>
   	<%
   	String board_id = (String)request.getAttribute("board_id");
   	user_name = (String) session.getAttribute("user_name");
   	
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
	
   <div>
		<h1 id="bigCategory"
			style="text-align: center; margin-top: 20px; text-transform: uppercase;">FAQ</h1>
	</div>
	
	<div class="deleteBoard" align="right">
	<form method="post" action="doDeleteWriting">
	</form>
	</div>
	
	
   <div id="menu" style="float: left;">
		<ul class="leftMenu">
			<li><a href="notice.jsp" class="submenuLink">NOTICE</a></li>
			<li><a href="FAQ.jsp" class="submenuLink">FAQ</a></li>
			<li><a href="QnA.jsp" class="submenuLink">QnA</a></li>
		</ul>
	</div>

	<div id="content" style="float: left; width:1000px">
	<form method="post" action="doDeleteWriting">
		<table class="board"
				style="text-align: left; background-color: white">
		<%
			try {
				conn = DriverManager.getConnection(DBUrl, connectionProps);

				String sqlSt = "select * from faq where board_id='" + board_id 
						+ "' order by custid, board_title, board_content, board_date";
				pstmt = conn.prepareStatement(sqlSt);				
				rset = pstmt.executeQuery();
				} 
			catch (SQLException e) {				
				e.printStackTrace();
				}
			
			String custid = null;
			String board_title = null;
			String board_content = null;
			String board_date = null;

			while (rset.next()) {
				custid = rset.getString("custid");
				board_title = rset.getString("board_title");
				board_content = rset.getString("board_content");
				board_date = rset.getString("board_date");
			}
			String b="display:none";
			if(user_name.equals("관리자")){
				b="";
			}
			%>
        <tr>
					<th style="width: 10%">글번호</th>
					<td style="width: 90%"><%=board_id%></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><%=custid%></td>
				</tr>
				<tr>
					<th>작성일</th>
					<td><%=board_date%></td>
				</tr>

				<tr>
					<th>제목</th>
					<td colspan="4"><%=board_title%></td>
				</tr>

				<tr>
					<td colspan="5" style="width: 100%; padding: 200px 10px;"><%=board_content%></td>
				</tr>
			</table>
			<br />

			<div style="text-align: right; margin-right: 100px">
				<button class="test-result-button" style="width:10%; color: red; <%=b%>"
					type="submit">삭제하기</button>
			</div>
		</form>
		<%
		session.setAttribute("board_id", board_id);
		session.setAttribute("cust_id", custid);
		session.setAttribute("page","faq");
		%>
		</div>

</body>
</html>