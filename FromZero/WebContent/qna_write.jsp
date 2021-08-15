<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.Properties"%>
<%@page import="java.io.*"%>
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
	border-bottom: 1px solid #999;
	color: #666;
}
table, tr, td, th{
	border:0px;
	background-color:white
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
   	user_id = (String)session.getAttribute("user_id");
   	String board_id = (String)session.getAttribute("board_id");
   	int board_id_2 = 1;
   	
   	if (user_id == null) {
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter pout = response.getWriter();
        out.println("<script>alert('로그인 하세요.'); location.href='QnA.jsp';</script>");
	}
   	
   	if ( board_id == null )
   		board_id_2 = 1;
   	else if (Integer.parseInt(board_id) > 0)
   		board_id_2 = Integer.parseInt(board_id) +1;
   	
   	session.setAttribute("board_id_2", board_id_2);

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
	
	java.text.SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String stringDate = sdf.format(new java.util.Date());
	%>
	
   <div>
		<h1 id="bigCategory"
			style="text-align: center; margin-top: 20px; text-transform: uppercase;">QnA</h1>
	</div>
	
   <div id="menu" style="float: left;">
		<ul class="leftMenu">
			<li><a href="notice.jsp" class="submenuLink">NOTICE</a></li>
			<li><a href="FAQ.jsp" class="submenuLink">FAQ</a></li>
			<li><a href="QnA.jsp" class="submenuLink">QnA</a></li>
		</ul>
	</div>

	<div id="content" style="float: left; width:1000px">
		<table class="board" border="1" cellspacing="0">
		<form method="post" action="doQnAWrite">
     
        <tr>
            <th>제목</th>
            <td colspan="5"><input name="title" maxlength="100" style="width:700px" required></td>
        </tr>
         
        <tr>
            <th style="height:500px">글 내용</th>
            <td colspan="5"><textarea name="memo" style="width:700px; height:500px" required></textarea></td>
        </tr>
        
        <tr>
            <th>글 비밀번호</th>
            <td colspan="5"><input name="password" maxlength="10" style="width:700px" required></td>
        </tr>
       <tr>
					<td colspan="5" ></td>
					<td>
						<button class="test-result-button" type="submit">글 작성</button>
					</td>
				</tr>
		</table>
		
		</form>
	</div>

</body>
</html>