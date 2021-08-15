<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>From Zero</title>
<link rel="stylesheet" href="./fromzero.css" type="text/css">

<style>
input {
	line-height: 25px;
}

table.joinTable {
	margin: 0 auto;
	width: 35%;
	text-align: center;
}
</style>

</head>
<body>
	<%@ include file="./fz_header.jsp"%>

	<div class="big-grid">
		<br /> <br /> <br />
		<h2>JOIN</h2>
		<br /> <br />
		
	<div style="text-align: center">
		<form method="post" action="doJoin" style="margin-left:30px;">
		
		<div class="question_box">
		
		<table class="joinTable" border="0" >
			<tr>
			    <td>아이디</td>
			    <td><input id="join_input" type="text" name="nmid" required /></td>
			</tr>
			<tr>
			    <td>비밀번호</td>
			    <td><input id="join_input" type="password" name="npasswd" required /></td>
			</tr>
			<tr>
			    <td>이름</td>
			    <td><input id="join_input" type="text" name="nname" required /></td>
			</tr>
			<tr>
			    <td>주소</td>
			    <td><input id="join_input" type="text" name="naddress" /></td>
			</tr>
			<tr>
			    <td>전화번호</td>
			    <td><input id="join_input" type="text" name="nphone" /></td>
			</tr>
			<tr>
			    <td>이메일</td>
			    <td><input id="join_input" type="text" name="nemail" /></td>
			</tr>
	    </table>
	    
	    <br /> 
					<input
					type="submit" style="margin-top: 20px" value="JOIN"
					class="test-result-button" />
					
	    </div>
		</form>
	</div>

	<form method="post" action="doSearch">
		<ul class="loginarea">
			<!-- <li><a href="login.html"> <img src="images/mypage.png"
               width=25 height=20>
         </a></li>
         <li><a href="login.html">cart</a></li> -->
			<li><a href="login.jsp">login</a></li>
			<li><a href="join.jsp">join</a></li>
			<li><input type="text" name="search_text"></li>
			<li style='top: 100px; padding: 0 0px;'>
				<button type="submit">
					<img src="images/magnifying-glass.png" width=20 height=20>
				</button>
			</li>
		</ul>
	</form>
</div>
</body>
</html>