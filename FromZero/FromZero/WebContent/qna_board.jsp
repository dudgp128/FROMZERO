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
   	<%
   	String board_id = (String)request.getAttribute("board_id");
    
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
		<%
			try {
				conn = DriverManager.getConnection(DBUrl, connectionProps);

				String sqlSt = "select * from qna where board_id='" + board_id 
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
			%>
        <tr>
            <th>글번호</th>
            <td><%= board_id %></td>
            <th>작성자</th>
            <td><%= custid %></td>
			<th>작성일</th>
            <td><%= board_date %></td>
        </tr>
           
        <tr>
            <th>제목</th>
            <td colspan="5"><%= board_title %></td>
        </tr>
         
        <tr>
            <th style="height:500px">글 내용</th>
            <td colspan="5"><%= board_content %></td>
        </tr>
		</table>
		<br />

		<%
			try {
				
				String sqlSt = "select * from qna_comment where board_id='" + board_id 
						+ "' order by comment_id, custid, comment";
				pstmt = conn.prepareStatement(sqlSt);				
				rset = pstmt.executeQuery();
				} 
			catch (SQLException e) {				
				e.printStackTrace();
			}
		
			String comment_id = null;
			String comment_custid = null;
			String comment = null;

			while (rset.next()) {
				comment_id = rset.getString("comment_id");
				comment_custid = rset.getString("custid");
				comment = rset.getString("comment");
		%>
		<div>
			<table class="board" border="1" cellspacing="0">
				<tr>
					<th>댓글번호</th>
					<td><%=comment_id%></td>
					<th>댓글 작성자</th>
					<td><%=comment_custid%></td>
				</tr>
				<tr>
					<th style="height: 100px">댓글</th>
					<td colspan="3"><%= comment %></td>
				</tr>
			</table>
		</div>
		<%
		}
		//comment_id = comment_id+1;
		int comment_id_2 = 1;
		if ( comment_id == null )
			comment_id_2 = 1;
	   	else if (Integer.parseInt(comment_id) > 0)
	   		comment_id_2 = Integer.parseInt(comment_id) +1;
	
		%>
		<br /><br /><br />
		<form method="post" action="doQnAComment">
		<div>
			<table class="board" border="1" cellspacing="0" style=" width:900px">
				<tr>
					<th>댓글번호</th>
					<td colspan="3"><%=comment_id_2%></td>
				</tr>
				<tr>
					<th style="height: 100px">댓글 작성</th>
					<td colspan="3"><textarea name="comment"
							style="width: 600px; height: 100px"></textarea></td>
				</tr>
			</table>
		</div><br />
		
		<div class="save" align="right">
			<button type="submit">댓글 작성</button>
		</div>
		</form>
		<%
			
		session.setAttribute("comment_id", comment_id_2);
		session.setAttribute("board_id", board_id);
		%>
	</div>
</body>
</html>