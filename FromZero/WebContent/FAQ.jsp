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

.write {
	padding-right:250px;
}

#menu, #content {
	margin: 50px;
}

<!-- 게시판 리스트 -->
ul {
	list-style: none;
}

/*
.sub_news, .sub_news th, .sub_news td {
   border: 0
}
*/

.sub_news a {
   color: #383838;
   text-decoration: none
}

.sub_news {
   width: 100%;
   border-bottom: 1px solid #999;
   color: #666;
   table-layout: fixed
}

.sub_news caption {
   display: none
}

.sub_news th {
   padding: 5px 0 6px;
   border-top: solid 1px #999;
   border-bottom: solid 1px #b2b2b2;
   background-color: #f1f1f4;
   color: #333;
   font-weight: bold;
   line-height: 20px;
   vertical-align: top
}

.sub_news td {
   padding: 8px 0 9px;
   border-bottom: solid 1px #d2d2d2;
   text-align: center;
   line-height: 18px;
}

.sub_news .date, .sub_news .hit {
   padding: 0;
   font-family: Tahoma;
   line-height: normal
}

.sub_news .title {
   text-align: left;
   padding-left: 15px;
}

.sub_news .title .pic, .sub_news .title .new {
   margin: 0 0 2px;
   vertical-align: middle
}

.sub_news .title a.comment {
   padding: 0;
   background: none;
   color: #f00;
   font-weight: bold
}

.sub_news tr.reply .title a {
   padding-left: 16px;
   background: url(첨부파일/ic_reply.png) 0 1px no-repeat
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
table {
	width: 1500px;
	border: 0;
	table-layout: fixed;
	border-collapse: collapse;
	background-color: white;
	margin: 0;
	padding: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
}

th, td {
	border: 0;
	background-color: white;
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
}
</style>
</head>

<body style="overflow-x: hidden">
   <%@ include file="./fz_header.jsp" %>
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
	
   <div>
		<br /> <br />
		<h2 id="bigCategory"
			style="text-align: center; margin-top: 30px;">FAQ</h2>
	</div>
	
	<div class="write" align="right">
		<button onclick="location.href='faq_write.jsp'" class="test-result-button">글쓰기</button>
	</div>
	
   <div id="menu" style="float: left;">
		<ul class="leftMenu">
			<li><a href="notice.jsp" class="submenuLink">NOTICE</a></li>
			<li><a href="FAQ.jsp" class="submenuLink">FAQ</a></li>
			<li><a href="QnA.jsp" class="submenuLink">QnA</a></li>
		</ul>
	</div>

	<div id="content" style="float: left; width:1000px;">
		<!-- 리스트 게시판 시작-->
		<table class="sub_news" border="1" cellspacing="0"
			summary="게시판의 글제목 리스트" style="font-size: 14px;">
			<caption>게시판 리스트</caption>
			<colgroup>
				<col width="80">
				<col>
				<col width="110">
				<col width="100">
			</colgroup>
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">제목</th>
					<th scope="col">글쓴이</th>
					<th scope="col">날짜</th>
				</tr>
			</thead>
			<tbody>
			
			<%
			try {
				conn = DriverManager.getConnection(DBUrl, connectionProps);

				String sqlSt = "select * from faq order by board_id";
				pstmt = conn.prepareStatement(sqlSt);				
				rset = pstmt.executeQuery();
				} 
			catch (SQLException e) {				
				e.printStackTrace();
				}
			
			String board_id = null;
			String custid = null;
			String board_title = null;
			String board_date = null;
			int count = 0;

			while (rset.next()) {
				board_id = rset.getString("board_id");
				custid = rset.getString("custid");
				board_title = rset.getString("board_title");
				board_date = rset.getString("board_date");
			%>
			<form method="post" action="doFAQ">
				<tr>
					<td class="number"><input type="text" value="<%=board_id%>" name="boardID" readonly="readonly" 
      				style="border: none; background: transparent; pointer-events: none; text-align:center; width:100px; height:20px" /></td>
					<td class="title">
					<button type="submit" style="border: none; outline:0; background: transparent;"> <%=board_title%> </button>
					</td>
					<td class="name"><%=custid%></td>
					<td class="date"><%=board_date%></td>
				</tr>
				</form>
			<%
			}
			session.setAttribute("board_id", board_id);
			%>
			</tbody>
		</table>
	</div>
	

</body>
</html>