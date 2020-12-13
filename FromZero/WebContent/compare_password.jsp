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
	width:1500px;
	table-layout: fixed;
	font-size: 14px;
	border-bottom: 1px solid #999;
	color: #666;
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
	<%@ page import="java.text.*" %>
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
	<%
	
	int board_id = Integer.parseInt((String)request.getAttribute("board_id"));
	
	%>
	
	<div class="title">
		<h2 style="text-align: center">비밀번호 확인</h2>
		<h4 style="text-align: center">글 작성 시 입력했던 비밀번호를 입력하세요.</h4>
	<%
		if (user_name == null) {
	%>
	<input type="hidden">
	<%
	}
	else if (user_name.equals("관리자")) {
		session.setAttribute("board_id", board_id);
	
		
	try {
				conn = DriverManager.getConnection(DBUrl, connectionProps);

				String sqlSt = "select password from qna where board_id=" + board_id ;
				pstmt = conn.prepareStatement(sqlSt);				
				rset = pstmt.executeQuery();
				} 
			catch (SQLException e) {				
				e.printStackTrace();
				}
			
			String password = null;

			if (rset.next())
				password = rset.getString("password");
			
	%>
	<h4 style="text-align: center">사용자 비밀번호 : <%=password %></h4>
	<%
	}
	%>
	</div>

	<form method="post" action="doComparePW">
	<div class="question_box" style="text-align: center">
			<input type="hidden", name="board_id" value="<%=board_id%>">
			<br /> <input type="password" name="comparePW" placeholder="PASSWORD" required
				style="margin: 10px; width: 250px;" /><br /> 
			<button id="comparePW_button" type="submit">확인</button> <br /> <br />
	</div>
	</form>
	
</body>
</html>