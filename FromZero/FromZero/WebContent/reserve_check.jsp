<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./fromzero.css" type="text/css">
<title>From zero</title>

<%
	String reserve_check = (String) request.getAttribute("reserve_check");
%>
</head>
<body style="overflow-x: hidden">

	<%@ include file="./fz_header.jsp" %>
	
	
	<div class="big-shop-grid">
		<h2 style="margin-top:100px; margin-bottom:50px"><%=reserve_check%></h2>
		<% 
		String reserve_text="";
		String reserve_result="";
		if(reserve_check.equals("주문 내역은 마이페이지에서 확인 가능합니다.")){
			reserve_text="주문 내역 보러가기";
			reserve_result="location.href='myPage.jsp'";
			
		}
		else{
			reserve_text="뒤로가기";
			reserve_result="javascript:history.back()";
		}
			%>
			<button style="padding:15px" type="button" onclick=<%=reserve_result%>><%=reserve_text %></button>
		</div>